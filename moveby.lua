local key = KEYS[1]
local item = ARGV[1]
local by = tonumber(ARGV[2], 10)

if not by or by==0 then return end

local items = redis.call('lrange', key, 0, -1)
local pos

for k,v in pairs(items) do
  if v==item then
    pos = k + by
    pos = math.max(pos, 1)
    pos = math.min(pos, #items)
    table.remove(items, k)
    table.insert(items, pos, v)
    break
  end
end

if not pos then return end

redis.call('del', key)
for k,v in pairs(items) do
  redis.call('rpush', key, v)
end

return pos - 1