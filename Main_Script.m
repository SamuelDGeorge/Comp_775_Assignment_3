%import Data
cd C:\Users\sdgeo\Dropbox\Own\Graduate-School\First_Semester\COMP_775\Workspace\Assignment_3;
target_image_name = "Target_Image";

%build reference image
ref_image = build_blurred_fan_image(2,4,0);

%Num quantiles used for all analysis
num_quantiles = 40;

%Build target image A = 1, B = 0
target_rotation = (.25/4);
target_image_1 = build_target_image(2,4,target_rotation,1,0);
write_string = char(target_image_name + "_1_0.png");
imwrite(mat2gray(target_image_1), write_string);

%Get measures for different matches
[angle, diff, der, image1] = norm_cross_correlation_analysis(target_image_1, 0.01/4);
[angle2, diff2, der2, image2] = mutual_information_correlation_analysis(target_image_1, 0.01/4);
[angle3, diff3, der3, image3] = quantile_function_correlation_analysis(target_image_1, 0.01/4, num_quantiles);

%Write out resulting ref image
imwrite(mat2gray(image1), 'Ref_Cross_Norm_1_0.png');
imwrite(mat2gray(image2), 'Ref_Mutual_Info_1_0.png');
imwrite(mat2gray(image3), 'Ref_Quantile_Function_1_0.png');

%record Results
result_matrix_1 = [angle, diff, der, angle2, diff2, der2, angle3, diff3, der3];

%Build target image A = 1000, B = 0
target_rotation = (.25/4);
target_image_2 = build_target_image(2,4,target_rotation,1000,0);
write_string = char(target_image_name + "_1000_0.png");
imwrite(mat2gray(target_image_2), write_string);

%Get measures for different matches
[angle, diff, der, image1] = norm_cross_correlation_analysis(target_image_2, 0.01/4);
[angle2, diff2, der2, image2] = mutual_information_correlation_analysis(target_image_2, 0.01/4);
[angle3, diff3, der3, image3] = quantile_function_correlation_analysis(target_image_2, 0.01/4, num_quantiles);

%Write out resulting ref image
imwrite(mat2gray(image1), 'Ref_Cross_Norm_1000_0.png');
imwrite(mat2gray(image2), 'Ref_Mutual_Info_1000_0.png');
imwrite(mat2gray(image3), 'Ref_Quantile_Function_1000_0.png');


%Record Results
result_matrix_2 = [result_matrix_1; angle, diff, der, angle2, diff2, der2, angle3, diff3, der3];

%Build target image A = 1000, B = 1000
target_rotation = (.25/4);
target_image_3 = build_target_image(2,4,target_rotation,1000,1000);
write_string = char(target_image_name + "_1000_1000.png");
imwrite(mat2gray(target_image_3), write_string);

%Get measures for different matches
[angle, diff, der, image1] = norm_cross_correlation_analysis(target_image_3, 0.01/4);
[angle2, diff2, der2, image2] = mutual_information_correlation_analysis(target_image_3, 0.01/4);
[angle3, diff3, der3, image3] = quantile_function_correlation_analysis(target_image_3, 0.01/4, num_quantiles);

%Write out resulting ref image
imwrite(mat2gray(image1), 'Ref_Cross_Norm_1000_1000.png');
imwrite(mat2gray(image2), 'Ref_Mutual_Info_1000_1000.png');
imwrite(mat2gray(image3), 'Ref_Quantile_Function_1000_1000.png');

%Record Results
result_matrix_3 = [result_matrix_2; angle, diff, der, angle2, diff2, der2, angle3, diff3, der3];

%Build target image A = -500, B = 1000
target_rotation = (.25/4);
target_image_4 = build_target_image(2,4,target_rotation,-500,1000);
write_string = char(target_image_name + "_-500_1000.png");
imwrite(mat2gray(target_image_4), write_string);

%Get measures for different matches
[angle, diff, der, image1] = norm_cross_correlation_analysis(target_image_4, 0.01/4);
[angle2, diff2, der2, image2] = mutual_information_correlation_analysis(target_image_4, 0.01/4);
[angle3, diff3, der3, image3] = quantile_function_correlation_analysis(target_image_4, 0.01/4, num_quantiles);

%Write out resulting ref image
imwrite(mat2gray(image1), 'Ref_Cross_Norm_-500_1000.png');
imwrite(mat2gray(image2), 'Ref_Mutual_Info_-500_1000.png');
imwrite(mat2gray(image3), 'Ref_Quantile_Function_-500_1000.png');

%Record Results
result_matrix_4 = [result_matrix_3; angle, diff, der, angle2, diff2, der2, angle3, diff3, der3];
csvwrite('analysis_results.csv',result_matrix_4);


