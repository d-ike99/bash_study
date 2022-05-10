#!/bin/bash
# in: env_file_name, date_folder_name

disp_log () {
    args=("$@")
    echo `date '+%Y/%m/%d %H:%M:%S'`" read_env.sh line:${BASH_LINENO[0]} "${args[*]}
}

# read env file
# IN:env_file_path, env_file_name, date_folder_name
func_read_env () {

    # Read csvfile And Read line by 'one line' like "sample1,1,2"
    while read one_line; do
        disp_log "one_line: "$one_line

        # separated by comma','
        split_one_line=(${one_line//,/ })

        # get file name
        filename=${split_one_line[0]}
        disp_log $filename

        # decompress zip file(to csv)
        ./modules/decompress_tocsv.sh $filename $2 $3

        # read csv
        ## in: csvfilename, out: mojiretsu
        ./modules/read_csv.sh $2 $3 ${split_one_line[*]}
        echo ""

    done < $1

}

# start log
disp_log 'start'

# define val
env_file_name=$1
env_file_name=${env_file_name:0:-4}
env_file_path="../files/env/"$1
date_folder_name=$2
date_folder="../files/outputs/"$env_file_name"/"$2
args=("$@")
argn=$#

# check arg file
if [ $argn -ne 2 ]; then
    disp_log "ERROR args most be 2.. your args -> "$argn
    exit 1
fi

if [ ! -e $env_file_path ]; then
    disp_log "ERROR this file not exist... -> "$env_file_path
    exit 1
fi
disp_log "env file exist! -> "$env_file_path

if [ ! -d $date_folder ]; then
    disp_log "ERROR this folder not exist... -> "$date_folder
    exit 1
fi
disp_log "folder exist! -> "$date_folder


# call func
func_read_env $env_file_path $env_file_name $date_folder_name


# end logs
disp_log 'end'
