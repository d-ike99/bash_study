#!/bin/bash
# in: env_file_name

disp_log () {
    args=("$@")
    echo `date '+%Y/%m/%d %H:%M:%S'`" read_env.sh line:${BASH_LINENO[0]} "${args[*]}
}

# start log
disp_log 'start'

# get now date
l_date=`date '+%Y%m%d%H%M%S'`


# read env file
func_read_env () {
    # define val
    env_name=$2

    # Read csvfile And Read line by 'one line' like "sample1,1,2"
    while read one_line; do
        disp_log "one_line: "$one_line

        # separated by comma','
        split_one_line=(${one_line//,/ })

        # get file name
        get_name=${split_one_line[0]}
        disp_log $filename

        # create csv　失敗時、ログ出力してcontinue
        ./modules/create_csv.sh $get_name $env_name $l_date

        # compress csv file(to zip)
        ./modules/compress_tozip.sh $get_name $env_name $l_date

        echo ""

    done < $1
}

# start logs

# define val
file="../files/env/"$1
file_name=$1
disp_log "file :"$file
args=("$@")
argn=$#

# check arg num
if [ $argn -ne 1 ]; then
    disp_log "ERROR args most be 1.. your args -> "$argn
    exit 1
fi

# check arg file
if [ ! -e $file ]; then
    disp_log "this file not exist..."    
fi
disp_log "file exist!"

# call func
func_read_env $file $file_name

# end logs
disp_log 'end'
