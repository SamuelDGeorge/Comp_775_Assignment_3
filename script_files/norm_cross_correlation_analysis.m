function [correct_rotation, difference_from_local_max, derivative_sharpness, matched_image] = norm_cross_correlation_analysis(target_image, per_unit_ammount)
%Seek match using cross_correlation

%Set up angles we are going to check
unit_ammount = per_unit_ammount;
start_point = -2/4;
end_point = 2/4;
current_point = start_point;

%Set up metrics to collect values
angle_values = [];
metric_values = [];

%For all desired angles, check normxcorr and collect those values
while(current_point <= end_point)
    angle_value = current_point;
    metric_value = max(max(normxcorr2(rotate_reference_image(angle_value), target_image)));
    angle_values = [angle_values, angle_value];
    metric_values = [metric_values, metric_value];
    current_point = current_point + unit_ammount;
end

%Find the angle of max match
[match_max, match_index] = max(metric_values);
correct_rotation = angle_values(match_index);

%Find the value at the local minimum
num = -.75/4;
small = abs(angle_values - num);
[variable,i] = min(small);

%Calculate difference from that minimum
value_at_75 = metric_values(i);
difference_from_local_max = (match_max - value_at_75)/match_max;

%Fit a polynomial and do second derivative sharpness
poly_x = angle_values(match_index - 1: match_index + 1);
poly_y = metric_values(match_index - 1: match_index + 1);
p = polyfit(poly_x,poly_y,2);

%Return sharpness and matched image
derivative_sharpness = -2 * p(1);
matched_image = rotate_reference_image(correct_rotation);
end
