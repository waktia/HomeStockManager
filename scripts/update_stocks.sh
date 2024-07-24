#!/bin/bash
export PATH="/usr/local/bin:$PATH"
export RAILS_ENV=development
cd /Users/wakitakouhei/勉強/Portfolio/HomeStockManager || exit
# 特定のバージョンのbundlerを使用
/Users/wakitakouhei/.rbenv/shims/bundle _2.5.16_ exec bin/rails runner "Item.update_all_stocks" >> /Users/wakitakouhei/勉強/Portfolio/HomeStockManager/log/cron.log 2>&1
