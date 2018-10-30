function [rotated_ref] = rotate_reference_image(rotation_ammount)
rotated_ref = build_blurred_fan_image(2,4,rotation_ammount);
end