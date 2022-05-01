#!/bin/bash

# in: csv file name, row info

# check file path
# func_check_filepath () {

# }

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

    # get file name
    file="../files/csv/"$1".csv"

    # create arg
    query="("
    for i in $(seq $((argn-1)))
    do
        # 1列目はファイル名のためスルーする
        if [ $i = 0 ]; then
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
            if [ $i = 0 ]; then
                continue
            fi
            query=$query${split_one_line[${args[$i]}-1]}", "
        done
        query=${query%??}"), "

    done < $file ## file name

    query=${query%??}")"

    echo "query: "$query
}

# get arg info
args=("$@")
argn=$#

# check arg file
file="../files/csv/"$1".csv"
echo "file :"$file
if [ -e $file ]; then
    echo "file exist!"
    # echo ${args[*]}
    # call func_read_csv
    func_read_csv ${args[*]}
fi


