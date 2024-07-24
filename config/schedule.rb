# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#require File.expand_path(File.dirname(__FILE__) + "/environment")
# config/schedule.rb

# カスタム変数の設定
set :script_path, "/Users/wakitakouhei/勉強/Portfolio/HomeStockManager/scripts"
set :log_path, "/Users/wakitakouhei/勉強/Portfolio/HomeStockManager/log/cron.log"

# 出力ログの設定
set :output, "#{log_path}"

every 1.day, at: "12:oo am" do
  command "#{script_path}/update_stocks.sh"
end
