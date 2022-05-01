#!/bin/bash

# read env file
func_read_env () {
    # Read csvfile And Read line by 'one line' like "sample1,1,2"
    while read one_line; do
        echo "one_line: "$one_line

        # separated by comma','
        split_one_line=(${one_line//,/ })

        # get file name
        echo ${split_one_line[0]}

        # create csv

        # compress csv file(to zip)
        

        # read csv
        ## in: csvfilename, out: mojiretsu
        echo `./read_csv.sh ${split_one_line[*]}`
        echo ""
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

    func_read_env $file
fi

# end logs

