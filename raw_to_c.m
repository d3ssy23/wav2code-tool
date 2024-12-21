function raw_to_c(input_file,output_file)

% Converting txt file with input values into C file formatted in double array
%   -Input 
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
