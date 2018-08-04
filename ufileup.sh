#!/bin/bash
filepath=$(cd "$(dirname "$0")"; pwd)
USER=`whoami`
folder="/tmp/${USER}_ufile/"
here=`pwd`
mkdir $folder
echo "mkdir $folder"
path=$1
path_0=${path:0:1}
if [ $path_0 == "/" ]; then
  echo "$path"
else
  path="${here}/${path}"
  echo "$path"
fi
ln -s ${path} ${folder}/${USER}_data_$2
echo "ln -s ${path} ${folder}/${USER}_data_$2"
cd ${filepath}
source config.txt
if [ $3 ]; then
    bucket=$3
    echo "get bucket: $bucket"
fi
filemgr-linux64 --action mput --bucket $bucket --dir ${folder}/${USER}_data_$2/  --trimpath ${folder} --threads 2 
echo "filemgr-linux64 --action mput --bucket $bucket --dir ${folder}/${USER}_data_$2/  --trimpath ${folder} --threads 2 "
rm "${folder}/${USER}_data_$2"
echo "rm ${folder}/${USER}_data_$2"
rm -rf $folder
echo "rm -rf $folder"
