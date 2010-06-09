#!/bin/sh
for file in ./xml/*
do
	echo "Processing $file"
	./bgp_path_list_xml.php < "$file" > data/`basename "$file"`
done
