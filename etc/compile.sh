#!/bin/bash

set -e

INPUT_DIR="tex"
OUTPUT_DIR="pdf"
FILENAME=""

while getopts "i:" OPT
do 
    case $OPT in
        i) FILENAME=$OPTARG;;
        \?) echo "[ERROR] Undefined options.";;
    esac
done

if [ ! -f "${INPUT_DIR}/${FILENAME}" ]; then
    echo "Invalid filename."
fi

cd "./${OUTPUT_DIR}"
lualatex "../${INPUT_DIR}/${FILENAME}" 
cd ..

