#!/usr/bin/env bash
./download.sh
./extract.sh
mv train-images-idx3-ubyte images
mv train-labels-idx1-ubyte labels
./convert.rb
mv output.csv train.csv

mv t10k-images-idx3-ubyte images
mv t10k-labels-idx1-ubyte labels
./convert.rb
mv output.csv test_with_truth.csv
cat test_with_truth.csv | cut -d"," -f11- > test.csv
