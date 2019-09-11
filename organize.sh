#!/bin/bash

version=0.1.0

copy=0              # default is to move
source_dir=.        # default is current dir
target_dir=.        # default is current dir
filter=*            # default is all files
verbose=0
verb=Moving

usage() {
    echo "usage: organize.sh [-h] [--version] [-v] [-c] [-s SOURCE_DIR] [-t TARGET_DIR] [-f FILTER]"
    echo "  -v - verbose mode"
    echo "  -c - copy files (default is move)"
    echo "  -s - provide SOURCE_DIR (default is current directory)"
    echo "  -t - provide TARGET_DIR (default is current directory)"
    echo "  -f - provide FILTER (e.g., *docx) (default is all files)"
}

show_version() {
    echo "v${version}"
}

echo "Organized by Date"
echo "https://github.com/YakDriver/organize-by-date"
echo "---------------------------------------------"
while [ "$1" != "" ]; do
  case $1 in
    -c | --copy )         copy=1
                          ;;  
    -v )                  verbose=1
                          ;;                            
    -s | --source )       shift
                          source_dir=$1
                          ;;  
    -t | --target )       shift
                          target_dir=$1
                          ;;
    -f | --filter )       shift
                          filter=$1
                          ;;                          
    --version )           show_version
                          exit 1
                          ;;
    -h | --help )         usage
                          exit 1
                          ;;
    * )                   ;;
  esac
  shift
done

if [ "${copy}" -eq "0" ]; then
    echo "Moving files"
else    
    echo "Copying files"
    verb="Copying"
fi
echo "Source: ${source_dir}, Target: ${target_dir}, Filter: ${filter}"

cd "${source_dir}"

for file in *; do    
    if [ ! -f "${file}" ]; then
        continue
    fi

    year=$(stat -f "%Sm" -t "%Y" "${file}")
    month=$(stat -f "%Sm" -t "%m" "${file}")
    day=$(stat -f "%Sm" -t "%d" "${file}")
    next_day=$(date +%Y-%m-%d -d "${year}-${month}-${day} + 1 day" 2>/dev/null)

    if [ "${next_day}" = "" ]; then
        next_day=`date -v+1d -jf"%Y-%m-%d" ${year}-${month}-${day} +%Y-%m-%d`
    fi

    if [ ! -d "${target_dir}/${year}" ]; then
        mkdir "${target_dir}/${year}"
    fi

    dest="${target_dir}/${year}/${year}-${month}-${day}"
    if [ ! -d "${dest}" ]; then
        mkdir "${dest}"
    fi

    if [ "${verbose}" -eq "1" ]; then
        echo "${verb} file ${file} to ${dest}"
    fi

    if [ "${copy}" -eq "0" ]; then
        find . -path "${dest}" -prune -o -type f -name "${filter}" -newermt "${year}-${month}-${day}" ! -newermt "${next_day}" -exec mv {} "${dest}" \;
    else    
        find . -path "${dest}" -prune -o -type f -name "${filter}" -newermt "${year}-${month}-${day}" ! -newermt "${next_day}" -exec cp -p {} "${dest}" \;
    fi
    
done
