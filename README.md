# Handy audio Processing scripts for Matlab and C usage

Matlab scripts to convert an amount of samples from a .wav file to raw data file (e.g ,.txt,.dat), then create C file and format the txt data into a double array.

# Samples_to_raw
- Extracting sample values from wav file to raw data file:
- Input arguments: samples_to_raw(input_file_name, num_samples_to_extract, output_file_name)
- The output file is automatically created, and saved in current folder.
- Example input: samples_to_txt("test.wav", 500, "test.txt")
- The wav file should be located in the same folder as the script.
  ## --- NOTE ---
  Only even values are valid to be written in the output file, if a odd number is passed as argument the output array will contain the number-1. 
  
  
# Raw_to_C
- Extracting the raw values and format them into double array variable in C syntax, creating a new output file ready to be used as an extern variable for audio analysis and experiments.
- Input arguments: raw_to_c(input_file_name, output_file_name)
- The output file is automatically created,
-  Example input: raw_to_c("test.txt","test.c")
-   Example structure of the output file: double test[500] = { //values };

  #  Why it’s useful

Embedded systems / microcontrollers: Often you can’t read a .wav file directly on a microcontroller. You need the samples in a C array to play or analyze audio.

DSP experiments: Quick way to test audio processing algorithms without relying on external files.

Data portability: Converts audio into a format that can be compiled directly in C projects.

Automation: If you do this manually, it’s tedious to convert hundreds of samples into proper C arrays — your scripts automate it.
