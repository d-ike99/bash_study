# 初めに
本リポジトリには、bashスクリプトのいくつかの動作をまとめています。<br>

# ディレクトリ構造
~~~
bash_study
├── README.md
├── files
│   ├── env
│   │   ├── 01.env
│   │   └── 02.env
└── study_shells
    ├── modules
    │   ├── compress_tozip.sh
    │   ├── create_csv.sh
    │   ├── decompress_tocsv.sh
    │   └── read_csv.sh
    ├── read_env_01.sh
    └── read_env_02.sh
~~~

# 機能概要
## envファイル読み込み
### ファイル名
    ./read_env.sh

### 説明
    引数で指定した"envファイル"を読み込みます。
    envファイルは1行ずつ読み込み、読み込んだ内容を引数としてmodules配下のシェルを呼び出します。



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
- （拡張機能）Bash IDE
- （拡張機能）ShellCheck


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