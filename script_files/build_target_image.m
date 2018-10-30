function [image] = build_target_image(sigma,k,rotation,A,B)
new_fan = build_blurred_fan_image(sigma,k,rotation);
for i = 1:128
    for j = 1:128
        value = new_fan(i,j);
        new_value = value * A + B;
        new_fan(i,j) = new_value;
    end
end
image = new_fan;
end