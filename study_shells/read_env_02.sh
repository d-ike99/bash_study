#!/bin/bash
# in: env_file_name, date_folder_path

disp_log () {
    args=("$@")
    echo `date '+%Y/%m/%d %H:%M:%S'`" read_env.sh line:${BASH_LINENO[0]} "${args[*]}
}

# start log
disp_log 'start'

# read env file
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
        ./modules/decompress_tocsv.sh $filename $2

        # read csv
        ## in: csvfilename, out: mojiretsu
        ./modules/read_csv.sh $2 ${split_one_line[*]}
        echo ""

    done < $1

}

# start logs

# define val
env_file="../files/env/"$1
date_folder="../files/outputs/date/"$2
args=("$@")
argn=$#

# check arg file
if [ $argn -ne 2 ]; then
    disp_log "ERROR args most be 2.. your args -> "$argn
    exit 1
fi

if [ ! -e $env_file ]; then
    disp_log "ERROR this file not exist... -> "$env_file
    exit 1
fi
disp_log "env file exist! -> "$env_file

if [ ! -d $date_folder ]; then
    disp_log "ERROR this folder not exist... -> "$date_folder
    exit 1
fi
disp_log "folder exist! -> "$date_folder


# call func
func_read_env $env_file $2


# end logs
disp_log 'end'
