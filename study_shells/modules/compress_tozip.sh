#!/bin/bash
# in: name, envfile_name, date

# define log
disp_log () {
    log_args=("$@")
    echo `date '+%Y/%m/%d %H:%M:%S'`" compress_tozip.sh line:${BASH_LINENO[0]} "${log_args[*]}
}

# start
datelog='start'

# input
args=("$@")
disp_log "args: " ${args[*]}

# define val
env_name=$2
env_name=${env_name:0:-4}
create_path="../files/outputs/"$env_name"/"$3
csv_file_name=$1".csv"
zip_file_name=$1".zip"

# zip化
zip -j $zip_file_name $create_path"/"$csv_file_name 
mv $zip_file_name $create_path

# csvファイル削除
rm $create_path"/"$csv_file_name 

# end
datelog='end'