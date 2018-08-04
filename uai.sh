#!/bin/bash
echo "****Usage:"
echo "-n name, -------- The name when pushing image to uhub"
echo "-c codepath, ---- The path of your code"
echo "-b image, ------- Which basic image"
echo "-a cmd, --------- Add an additional software environment"
echo "-h uhub name, --- Set your uhub name"
echo "Please modify common variables in config.txt"
echo "========================================================"
USER=`whoami`
gethere=`pwd`
Wheretmp="/tmp/${USER}_docker/${USER}_tmp.Dockerfile"
name=${USER}
filepath=$(cd "$(dirname "$0")"; pwd)
# echo "$filepath"
code=/home/${USER}/code
source $filepath/config.txt
echo "source $filepath/config.txt"
# echo $basic_image
folder="/tmp/${USER}_docker"
mkdir $folder
echo "mkdir $folder"
while getopts c:n: OPTION;do
    case $OPTION in 
    n)name=${name}_${OPTARG}
    ;; 
    c)code=${OPTARG}
    path_0=${code:0:1}
    if [ $path_0 == "/" ]; then
      echo "code: $code"
    else
      code="${gethere}/${code}"
      echo "code: $code"
    fi
    ;;
    b)basic_image=${OPTARG}
    ;; 
    a)add_software=${OPTARG}
    ;;
    h)uhub_name=${OPTARG} 
    ;;
    ?)echo "get a non option $OPTARG and OPTION is $OPTION"
    ;; 
    esac
done
echo "name: $name"
# echo "code: $code"
# echo ${floder}
rm -rf ${folder}/${USER}_code
cp -R ${code} ${folder}/${USER}_code
echo "rm -rf ${folder}/${USER}_code"
echo "cp -R ${code} ${folder}/${USER}_code"
# ls ${folder}


#cat /data/gpu-tf1.8-py2.7.Dockerfile > ${Wheretmp}
echo "From ${basic_image}" > ${Wheretmp}
echo "ADD ./${USER}_code/ /data/" >> ${Wheretmp}
echo -e "$add_software" >> ${Wheretmp}
echo "Dockerfile:"
echo "======================================"
cat ${Wheretmp}
echo "======================================"
docker build -t uhub.service.ucloud.cn/${uhub_name}/${name}:uaitrain -f ${Wheretmp} ${folder}
docker push uhub.service.ucloud.cn/${uhub_name}/${name} 
echo "\n\n*********************************************"
echo "run code:"
echo "docker build -t uhub.service.ucloud.cn/${uhub_name}/${name}:uaitrain -f ${Wheretmp} ${folder}"
echo "docker push uhub.service.ucloud.cn/${uhub_name}/${name}"
rm -rf ${folder}
echo "rm -rf ${folder}"