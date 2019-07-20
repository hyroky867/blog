#!/bin/bash

XDEBUG=1 # 1 or 0

cd `dirname $0`/..
DIR=`pwd`
echo `pwd`
# Composerパッケージの更新が必要か簡易チェックする
if [ "composer.lock" -ot "composer.json" ]; then
  echo "composer.lock が composer.json より古いです。"
  echo "Composerパッケージを更新するために、"
  echo "composer install コマンドを実行してください。"
  echo
  echo "composer install コマンドを実行してもこのエラーが解消しない場合は、"
  echo "touch composer.lock コマンドを実行してください。"
  exit 1
fi

if [ -f "$DIR/vendor/bin/phpunit" ]; then
  PHPUNIT="./vendor/bin/phpunit"
else
  PHPUNIT=`which phpunit`
fi

if [ $XDEBUG -eq 1 ]; then
  COMMAND="$PHPUNIT -d memory_limit=-1 -c ./tests $@ --configuration phpunit.xml"
else
  COMMAND="$PHPUNIT -v -c ./tests $@ --configuration phpunit.xml"
fi

echo $COMMAND

$COMMAND
