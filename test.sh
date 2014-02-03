redis-cli DEL days
redis-cli RPUSH days monday tuesday wednesday thursday friday saturday sunday
redis-cli LRANGE days 0 -1
redis-cli --eval moveby.lua days , $1 $2
redis-cli LRANGE days 0 -1