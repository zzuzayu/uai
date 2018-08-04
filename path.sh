#!/bin/bash
#获得该文件的位置
#echo "$0" | grep -q "$0"
if [ $? -eq 0 ]; then
    cd "$(dirname "$BASH_SOURCE")"
    CUR_FILE=$(pwd)/$(basename "$BASH_SOURCE") 
    CUR_DIR=$(dirname "$CUR_FILE")
    cd - > /dev/null
else
    if [ ${0:0:1} = "/" ]; then
        CUR_FILE=$0
    else
        CUR_FILE=$(pwd)/$0 
    fi
    CUR_DIR=$(dirname "$CUR_FILE")
fi

#去掉路径中的相对路径，如a/..b/c 
cd "$CUR_DIR" 
CUR_DIR=$PWD 
cd - > /dev/null
#echo $CUR_DIR  
filepath=$CUR_DIR 
#filepath=$(cd "$(dirname "$0")"; pwd)   
#echo "file :$0 1: $1 "  
echo "$filepath"
#source $filepath/config.txt
#echo $basic_image
export PATH="$filepath/:$PATH" 
read -p "Do you want to add PATH to ~/.bashrc, if you do this, you will not need to source ./path.sh every time. Please enter y or n." yn
echo $yn
if [ $yn == "y" ]; then
    echo "export PATH=\"$filepath/:\$PATH\"" >> ~/.bashrc
    echo "echo \"export PATH=\"$filepath/:\$PATH\"\" >> ~/.bashrc "
fi
echo $PATH    
