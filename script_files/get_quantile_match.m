 function value = get_quantile_match(ref,target,num_quantiles)
%Get gradient magnitudes for the image
ref_mag = get_gradient_magnitude(ref);
target_mag = get_gradient_magnitude(target);

ref_histogram = [];
target_histogram = [];

%Build Array of values
for i = 64:128
    for j = 64:128
        ref_val = ref_mag(i,j);
        target_val = target_mag(i,j);
        ref_histogram = [ref_histogram,ref_val];
        target_histogram = [target_histogram, target_val];
    end
end

%Sort values
ref_histogram = sort(ref_histogram);
target_histogram = sort(target_histogram);

%Divide Histogram into 20 quantiles to get quantile values
size_of_jump = ceil(size(ref_histogram)/num_quantiles);
ref_quantile = [];
target_quantile = [];

%Get the value for each quantile
current_spot = 1;
for i = 1:num_quantiles
    ref_chunk = sum(ref_histogram(current_spot:current_spot+size_of_jump - 1));
    target_chunk = sum(target_histogram(current_spot:current_spot+size_of_jump - 1));
    ref_quantile = [ref_quantile,ref_chunk];
    target_quantile = [target_quantile, target_chunk];
    current_spot = current_spot + size_of_jump;
end

%Calculate and return euclidean distance between the two quantiles
value = norm(ref_quantile - target_quantile);

end