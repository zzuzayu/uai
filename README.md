# How to use uai-train
### get docker
- `./getdocker.sh` 
### set path
- `source ./path.sh`
### set your common variables in config.txt
### add uaer to docker group
- `sudo gpasswd -a {username} docker`
### login your docker for uhub
- `docker login uhub.service.ucloud.cn`
### build image
- `uai.sh -c codepath -n setname`
### upload dir
- set {config.fig} by your own key
- `ufileup.sh datapath setname`

