#!/bin/bash

input_directory="immaterial_index/figures_trends_R/figures_unseen/results_unseen/per_capita/"

# Directory to store the resized PDF files
output_directory="immaterial_index/figures_trends_R/figures_unseen/results_unseen/per_capita_latex/"

mkdir -p "$output_directory"

# Loop through all PNG files in the input directory
for file in "$input_directory"*.png; do
    # Extract the filename without extension
    filename=$(basename "$file" .png)

    # Resize the image to 1200px wide or high, maintaining aspect ratio
    sips -Z 1200 "$file" --out "$output_directory$filename-temp.png"

    # Convert the resized image to PDF
    sips -s format pdf "$output_directory$filename-temp.png" --out "$output_directory$filename.pdf"

    # Remove the temporary resized PNG file
    rm "$output_directory$filename-temp.png"
done

echo "Image processing complete."
