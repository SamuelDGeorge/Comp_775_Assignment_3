function [value] = get_gausian_fan_value_for_point(x,y,k, rotation)
%get theta
u = [x,y] - [64.5, 64.5];
v = [1,0];
dotUV = dot(u, v);
normU = norm(u);
normV = norm(v);
theta = acos(dotUV/(normU * normV));

value = (1/(1+abs(theta+rotation)))*cos(2*pi*k*(theta + rotation));
end