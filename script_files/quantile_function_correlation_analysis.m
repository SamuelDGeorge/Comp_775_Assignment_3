function [correct_rotation, difference_from_local_max, derivative_sharpness, matched_image] = quantile_function_correlation_analysis(target_image, per_unit_ammount, num_quantiles)
%Seek match using cross_correlation
unit_ammount = per_unit_ammount;
start_point = -2/4;
end_point = 2/4;
current_point = start_point;

%initialize array for metrics
angle_values = [];
metric_values = [];

%scale the target image
target_image = mat2gray(target_image);

%Get quantile match at each angle
while(current_point <= end_point)
    angle_value = current_point;
    
    %Must scale the reference as well
    metric_value = get_quantile_match(mat2gray(rotate_reference_image(angle_value)), target_image, num_quantiles);
    angle_values = [angle_values, angle_value];
    metric_values = [metric_values, metric_value];
    current_point = current_point + unit_ammount;
end

%Find the min and max values of set
[min_val, min_index] = min(metric_values);
[max_val, max_index] = max(metric_values);

%Scale and subtract one to get theta vs measure where positive is match
metric_values = 1 - ((metric_values - min_val)/max_val);

%find the correct angle
[match_max, match_index] = max(metric_values);
correct_rotation = angle_values(match_index);

%Find local max value
num = -.75/4;
small = abs(angle_values - num);
[variable,i] = min(small);

%return local max vs match max difference
value_at_75 = metric_values(i);
difference_from_local_max = (match_max - value_at_75)/match_max;

%Fit a polynomial around global max
poly_x = angle_values(match_index - 1: match_index + 1);
poly_y = metric_values(match_index - 1: match_index + 1);
p = polyfit(poly_x,poly_y,2);

%Return derivative sharpness and correct image
derivative_sharpness = -2 * p(1);
matched_image = rotate_reference_image(correct_rotation);

end
