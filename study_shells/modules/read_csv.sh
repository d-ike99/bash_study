#!/bin/bash
# in: csv file name, row info

# define log
disp_log () {
    log_args=("$@")
    echo `date '+%Y/%m/%d %H:%M:%S'`" read_csv.sh line:${BASH_LINENO[0]} "${log_args[*]}
}

# メモ：一行ずつしかレコードを読み込めないため、readcsvの関数の中で文字列作成処理を行う
# read csvfile
func_read_csv () {
    # val
    dob=""

    # get arg
    argn=$#
    args=("$@")

    # echo "read_csv argn: "$argn
    # echo "read_csv argn[]: "${args[*]}

    # create arg
    query="("
    for i in $(seq $((argn-1)))
    do
        # 1列目はファイル名のためスルーする
        if [ $i = 0 ] || [ $i = 1 ]; then
            continue
        fi

        query=$query${args[$i]}", "
        # echo "now query: "$query
        
    done
    query=${query%??}")"
    query=$query" in ("

    # Read csvfile And Read line by 'one line'
    while read one_line; do
        #echo "one_line: "$one_line

        # separated by comma','
        split_one_line=(${one_line//,/ })

        query=$query"("

        # get row info
        for i in $(seq $((argn-1)))
        do
            # 1列目はファイル名のためスルーする
            if [ $i = 0 ] || [ $i = 1 ]; then
                continue
            fi
            query=$query${split_one_line[${args[$i]}-1]}", "
        done
        query=${query%??}"), "

    done < $file ## file name

    query=${query%??}")"

    #disp_log "query: "$query
}

# start log
disp_log 'start'

# get arg info
args=("$@")
argn=$#
query=""

# disp arg
disp_log "args: "${args[*]}

# check arg file
file="../files/outputs/date/$1/"$2".csv"
disp_log "file :"$file
if [ ! -e $file ]; then
    disp_log "ERROR this file not exist... -> "$file
    exit 1
fi
disp_log "file exist!"



# call func_read_csv
if [ $argn -gt 2 ]; then
    disp_log "call func_read_csv. because argn == 2 --> "$argn
    func_read_csv ${args[*]}

    # memo in: $file
    disp_log "name: "${args[1]}
    disp_log "query: "$query
fi


# memo in: $file
disp_log "name: "${args[1]}

# end
disp_log 'end'
