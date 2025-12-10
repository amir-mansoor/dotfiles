#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

# Assign input arguments to variables
input_file="$1"
output_file="$2"

# Run FFmpeg command
ffmpeg -i "$input_file" -vf "crop=1024:640,scale=1280:720" -c:a copy "$output_file"

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Video has been successfully resized and saved as $output_file"
else
    echo "An error occurred during the video resizing process"
fi

