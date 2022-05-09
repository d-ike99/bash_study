#!/bin/bash
# in: filename, date

# define log
disp_log () {
    log_args=("$@")
    echo `date '+%Y/%m/%d %H:%M:%S'`" create_csv.sh line:${BASH_LINENO[0]} "${log_args[*]}
}

# start
datelog='start'

# input
args=("$@")
disp_log "args: " ${args[*]}

# define val
create_path="../files/outputs/date/"$2
file_name=$1".csv"

# ディレクトリ
mkdir -p $create_path

# ファイル作成
touch $create_path"/"$file_name
echo -e "1000,hoge1hoge1,ike100,2022-04-29\n1001,hoge2hoge2,ike101,2022-04-30" >> $create_path"/"$file_name


# check arg file
if [ -e $create_path ]; then
    disp_log "file exist! - "$create_path"/"$file_name
else
    disp_log "this file not exist..."
    exit
fi

# end
datelog='end'
