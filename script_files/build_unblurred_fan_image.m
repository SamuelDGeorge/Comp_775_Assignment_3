function [fan] = build_unblurred_fan_image(k,rotation)
start = zeros(128,128);

for i = 1:128
    for j = 1:128
        x = i;
        y = j;
        start(y,x) = get_gausian_fan_value_for_point(x,y,k,rotation);
    end
end
fan = start;
end