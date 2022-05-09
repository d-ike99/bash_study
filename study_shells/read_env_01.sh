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
    # Read csvfile And Read line by 'one line' like "sample1,1,2"
    while read one_line; do
        disp_log "one_line: "$one_line

        # separated by comma','
        split_one_line=(${one_line//,/ })

        # get file name
        filename=${split_one_line[0]}
        disp_log $filename

        # create csv　失敗時、ログ出力してcontinue
        ./modules/create_csv.sh $filename $l_date

        # compress csv file(to zip)
        ./modules/compress_tozip.sh $filename $l_date

        echo ""



    done < $1

}

# start logs

# define val
file="../files/env/"$1
disp_log "file :"$file
args=("$@")
argn=$#

# check arg file
if [ $argn -ne 1 ]; then
    disp_log "ERROR args most be 1.. your args -> "$argn
    exit 1
fi

if [ -e $file ]; then
    disp_log "file exist!"

    func_read_env $file
else
    disp_log "this file not exist..."
fi

# end logs
disp_log 'end'
