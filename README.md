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
## python env
pip install "ptvsd>=4.2"
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
npm -i -g typescript javascript-typescript-langserver import-js tslint js-beautify prettier
```
## Org-mode
解决中英文等宽对齐的问题，在`Linux`下使用`Source Code Pro`对齐没有遇到问题。
但是在windows上遇到等宽显示问题，很奇葩，试了多种字体都存在问题，最后找到[解决方案](https://www.callmewing.com/2015/12/08/Spacemacs%E4%B8%AD%E6%96%87%E5%AD%97%E4%BD%93%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/)。
使用文泉驿等宽微米黑和`Ubuntu mono`就没有对齐的问题了，特别在书写表格时，有严重的格式对齐的强迫症的用户，这个算完美解决了。
经过测试，在特别特别长的文字中，会出现错位情况，但是在重新打开时就自动对齐了。当然这种情况肯定建议`M-RET M-RET`自动换行了。
- [文泉驿等宽微米黑](wqy-microhei-0.2.0-beta.tar.gz)
- [Ubuntu Mono](Ubuntu-Mono.zip)
