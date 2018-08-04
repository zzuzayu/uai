# How to use uai-train by this script
### 1. get docker
`./getdocker.sh` 
### 2. set path
`source ./path.sh`
### 3. set your common variables in _`config.txt`_
### 4. add uaer to docker group
`sudo gpasswd -a {username} docker`
### 5. login your docker for uhub
`docker login uhub.service.ucloud.cn`
### 6. build image
`uai.sh -c codepath -n setname`
### 7.upload dir
    - set _`config.fig`_ by your own key
    - `ufileup.sh datapath setname`

