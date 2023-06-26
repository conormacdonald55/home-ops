#!/bin/bash

# script to clean up your tmp folder by removing files that start with the prefix "tmp.*"

# Specify the directory path
tmp_dir="/tmp"

# Set the batch size for file removal
batch_size=100

# Navigate to the tmp directory
cd "$tmp_dir" || exit

# Remove files starting with 'tmp.' in batches
files=(tmp.*)
total_files="${#files[@]}"
count=0

for file in "${files[@]}"; do
    rm -r "$file"
    count=$((count + 1))

    if (( count % batch_size == 0 )) || (( count == total_files )); then
        echo "Removed $count out of $total_files files."
    fi
done

echo "Cleanup completed."
