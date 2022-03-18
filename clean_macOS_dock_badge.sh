#!/bin/bash
pid=$(ps aux | grep -i usernoted | grep -v 'grep' | awk '{print $2}')
db="$(lsof -p $pid | grep 'com.apple.notificationcenter/db2/db$' | awk '{print $9}')"
sql="UPDATE app SET badge = 0 WHERE identifier = 'com.apple.mobilesms'"
sqlite3 "$db" "$sql"

killall usernoted
killall Dock
