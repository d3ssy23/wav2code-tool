# AudioProcessing

% Step 1: Read the audio file
[y, Fs] = audioread('handel.wav');  % 'handel.wav' is the input file

% Step 2: Take only the first 500 samples (or however many you need)
y_500_samples = y(1:500, :);  % Extract the first 500 samples from the signal

% Step 3: Reshape the samples into rows of 8 values
num_values_per_row = 8;
num_samples = length(y_500_samples);
num_rows = floor(num_samples / num_values_per_row);

% Reshape into 8 values per row
y_reshaped = reshape(y_500_samples(1:num_rows * num_values_per_row), num_values_per_row, num_rows)';

% Step 4: Write the reshaped data to a text file
dlmwrite('handel_500_samples.txt', y_reshaped, 'delimiter', '\t', 'precision', 8);
