function raw_to_c(input_file,output_file)

%  Converting a raw data file into a C file with a formatted double array variable
% Input arguments: raw_to_c(input_file_name, output_file_name)
% The output file is automatically created, ex: "test.txt"/"text.dat", "test.c"
% Example output file structure: double *your-output-file-name* [arr_elements_count] { *array_val1, array_val2, ... array_valN }

data = readmatrix(input_file);
fid = fopen(output_file, 'w');

data(isnan(data)) = 0.00000;
[~,name, ~] = fileparts(input_file);

fprintf(fid, 'double %s[%d] = { ', name, numel(data));

[rows,cols] = size(data);

count = 0;

for i = 1:rows 
    
    for j = 1:cols
        fprintf(fid, "%.8f", data(i, j));
        count = count + 1;
        if i ~= rows || j ~= cols
            fprintf(fid, ', ');
            if count == 8
                fprintf(fid,'\n')
                count = 0;
            end    
        end
        
    end
    fprintf(fid, '\n');
end    
fprintf(fid, ' };');
fclose(fid);
disp(['C file with array', name, "has been written to", output_file]);
end            
