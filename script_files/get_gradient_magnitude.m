function [gradients] = get_gradient_magnitude(image)
[x,y] = gradient(image);

gradient_magnitude = zeros(128,128);

for i = 1:128
    for j = 1:128
        magnitude = sqrt(x(j,i)^2 + y(j,i)^2);
        gradient_magnitude(j,i) = magnitude;
    end
end

gradients = gradient_magnitude;
end
