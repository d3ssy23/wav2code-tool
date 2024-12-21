function samples_to_raw(finput,snum,fout)

% Extracting wav file samples to a txt file
% Input arguments: samples_to_raw(input_file_name, num_samples_to_extract, output_file_name)
% The output file is automatically created, example: "test.wav", 500, "test.txt"
% *** Warning *** 
% The output saves only even amount of values, odd sample inputs
% will be rounded to the closest lower even value.

[y, ~] = audioread(finput);
y_samples = y(1:snum, :);


num_values_per_row = floor(snum/2);

num_samples = length(y_samples);
num_rows = floor(num_samples/num_values_per_row);

y_reshaped = reshape(y_samples(1:(num_rows * num_values_per_row)),num_rows,num_values_per_row);

%writematrix(snum, fout, 'Delimiter', 'tab');
writematrix(y_reshaped, fout, 'Delimiter', 'tab');


disp(['Extracted',num2str(num_samples), 'samples and saved to  ', fout]);
