# Wordcloud

## 導入
### `mecab`のインストール
```sh
$ sudo apt-get install mecab libmecab-dev mecab-ipadic-utf8
```

### `neologd`のインストール
デフォルトの辞書だと固有名詞に弱いので、より強い辞書をインストールする。
```sh
$ git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
$ cd mecab-ipadic-neologd
$ sudo bin/install-mecab-ipadic-neologd -n -y \
--ignore_adverb \
--ignore_interject \
--ignore_noun_ortho \
--ignore_noun_sahen_conn_ortho \
--ignore_adjective_std \
--ignore_adjective_verb \
--ignore_ill_formed_words
```

### Rubyの準備
```sh
$ bundle install
```

Ubuntuの場合は`magic_cloud`のインストールのため下記が必要かも。
```sh
$ sudo apt install libmagickcore-dev
```

 ### フォントの準備
 日本語に対応しているフォントが異様に少ないらしい。
 ```sh
 $ sudo apt-get install -y unifont
 ```


## 実行
```sh
$ bundle exec ruby main.rb
```

## 参考文献
- [mecab-ipadic-NEologd](https://github.com/neologd/mecab-ipadic-neologd/blob/master/README.ja.md)
- [Gem markburns/mecab](https://github.com/markburns/mecab)
- [Gem buruzaemon/natto](https://github.com/buruzaemon/natto)
- [Gem zverok/magic_cloud](https://github.com/zverok/magic_cloud)
