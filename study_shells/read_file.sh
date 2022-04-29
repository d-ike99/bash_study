#!/bin/bash

# read csvfile
func_read_csv () {
    # Read csvfile And Read line by 'one line'
    while read one_line; do
        echo "one_line: "$one_line

        # separated by comma','
        split_one_line=(${one_line//,/ })

        # get file name
        echo ${split_one_line[0]}

        # check csv


        # call python

        # zip

        # call aws

    done < $1

}

# start logs

# check arg file
file="../files/env/"$1
echo "file :"$file
if [ -e $file ]; then
    echo "file exist!"

    func_read_csv $file
fi

# end logs

