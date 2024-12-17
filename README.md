# AudioProcessing

Matlab scripts to convert amount of samples from a wav file to raw data file, then create C file and format the txt data into a double array.

# Samples_to_txt.m
- Extracting wav file samples to a txt file
   Input arguments: extract_samples_to_txt(input_file_name, samples_to_extract, output_file_to_write)
   The output file is automatically created, ex: ("test.wav", 500, "test.txt")
