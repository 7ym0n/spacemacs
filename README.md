# spacemacs
Sync my spacemacs development environment configuration information


## 常用的命令行
`C-a C-e` 行首行尾

`C-@` 标记

`M-<` buffer首
`M->` buffer尾

`C-u Num C-v` 向前滚动`N`行屏幕
`C-u Num M-v` 反向滚动`N`行屏幕
`C-u Num C-f` 向前移动`N`个字符
`C-u Num C-b` 向后移动`N`个字符

`SPC` [`Vim`]主键 `M-m` [`Emacs`]主键

`SPC S` prefix拼写检测
`SPC e` prefix语法检测
`SPC t S`进入拼写检测
`SCP f` prefix文件操作
`SPC x` prefix文本操作,替换文本书写方式
`SPC x d w` 删除所有行的末尾的空格

`SPC v` 进入标记扩展模式
`SPC s e` 编辑多行文本 `i`，`a`进入编辑模式，需要先选择需要编辑的文本使用,`ESC`退出模式 

`SPC f j` 进入`dired`模式 `C-x C-q`进入编辑模式， `C-c C-c`执行改变
`SPC a` prefix应用
``SPC a /` 搜索引擎
```shell
## https://github.com/emacs-lsp/dap-mode#python
pip install "ptvsd>=4.2"
## python env
pip install --upgrade "jedi>=0.13.0" "json-rpc>=1.8.1" "service_factory>=0.1.5"
pip install pyls-isort
pip install flake8
pip install autoflake
pip install importmagic epc

## C-C++
## https://github.com/MaskRay/ccls

## https://github.com/ggreer/the_silver_searcher
## helm-ag

## apt-get install aspell silversearcher-ag


## Javascript
npm install -g js-beautify
npm install -g import-js
npm install -g eslint
```
