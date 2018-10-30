function [image] = build_blurred_fan_image(sigma,k,rotation)
ref_image_ub = build_unblurred_fan_image(k,rotation);
ref_image = imgaussfilt(ref_image_ub,sigma);
image = ref_image;
end