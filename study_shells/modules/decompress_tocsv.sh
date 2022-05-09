#!/bin/bash
# in: filename, date

# define log
disp_log () {
    log_args=("$@")
    echo `date '+%Y/%m/%d %H:%M:%S'`" decompress_tocsv.sh line:${BASH_LINENO[0]} "${log_args[*]}
}

# start
datelog='start'

# input
args=("$@")
disp_log "args: " ${args[*]}

# define val
create_path="../files/outputs/date/"$2
csv_file_name=$1".csv"
zip_file_name=$1".zip"

# unzip
unzip $create_path"/"$zip_file_name
mv $csv_file_name $create_path

# end
datelog='end'