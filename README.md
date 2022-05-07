# 初めに
本リポジトリには、bashスクリプトのいくつかの動作をまとめています。<br>


# ディレクトリ構造
~~~
bash_study
├── README.md
├── files
│   ├── csv
│   │   ├── sample1.csv
│   │   └── sample2.csv
│   └── env
│       ├── sample.env
│       └── set_env.env
└── study_shells
    ├── modules
    │   ├── compress_tozip.sh
    │   ├── create_csv.sh
    │   ├── decompress_tocsv.sh
    │   └── read_csv.sh
    └── read_env.sh
~~~

# 機能一覧
| ファイル名 | 機能概要 | IN | OUT |
| ---- | ---- | ---- | ---- |
| ./read_csv.sh | 引数のenvファイルを読み込み、中身を一行ずつ表示する  | envファイル名 | - |
| ./modules/create_csv.sh |  |  |  |
| ./modules/compress_tozip.sh |  |  |  |
| ./modules/decompress_tocsv.sh |  |  |  |
| ./modules/read_csv.sh |  |  |  |


# 開発環境（筆者）
- visual studio code
- （拡張機能）


# 動作方法
``` linux
git clone 
cd bash_study/study_shells
chmod 755 *.sh
./read_file.sh
```


# links
## file_check
https://www.server-memo.net/shellscript/file_check.html

## read_csv_file
https://qiita.com/SoarTec-lab/items/4475ba6de612fba3f163

## separated by specify word(like comma)
https://genzouw.com/entry/2019/12/17/120057/1831/

## arithmetic
https://qiita.com/akinomyoga/items/9761031c551d43307374

#