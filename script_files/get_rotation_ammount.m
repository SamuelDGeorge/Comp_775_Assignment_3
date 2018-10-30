function [rads] = get_rotation_ammount(unit_size, times)
%For getting radians of unit rotation
rotation_units = unit_size;
radians_per = rotation_units;
rads = radians_per * times;
end