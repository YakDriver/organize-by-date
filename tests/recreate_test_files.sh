#!/bin/bash

files_dir=files

rm -rf "${files_dir}"
mkdir "${files_dir}"

echo "870b5df5-4da3-5011-804a-b533a46a3de4" > "${files_dir}/file1.txt"
echo "6cf5a54d-beac-5b90-a6df-97249a56bcb6" > "${files_dir}/file2.txt"
echo "23c2e1b6-69b6-58c0-a3cd-eb1429a5f95d" > "${files_dir}/file3.txt"
echo "a82b1408-bb42-50e6-a16b-6e30b9bde0f8" > "${files_dir}/file 4.txt"
echo "877b27f7-03d9-5c23-b2d8-85a73211ae74" > "${files_dir}/file5.txt"
echo "3aa009c5-607c-5b2c-9ef9-643338560dfb" > "${files_dir}/file6.txt"
echo "68c7f17b-d15b-5d6b-90c4-b96a5a77bddb" > "${files_dir}/file7.txt"
echo "9bcd19c7-2bf8-5481-a22e-67ac3a50ce1e" > "${files_dir}/file8.txt"
echo "eb813de9-4c46-589d-9590-69a456e1167d" > "${files_dir}/file9.txt"
echo "76cc8401-6035-53ca-a83e-82156e11d4ad" > "${files_dir}/file10.txt"

touch -t 8001031305 "files/file1.txt"
touch -t 0201031305 "files/file2.txt"
touch -t 0201031305 "files/file3.txt"
touch -t 0402141305 "files/file 4.txt"
touch -t 0503161305 "files/file5.txt"
touch -t 0604181305 "files/file6.txt"
touch -t 0705201305 "files/file7.txt"
touch -t 0806221305 "files/file8.txt"
touch -t 1207201305 "files/file9.txt"
touch -t 1408311305 "files/file10.txt"
