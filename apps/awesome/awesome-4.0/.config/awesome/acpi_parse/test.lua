--getmetatable('').__index = function(str,i) return string.sub(str,i,i) end
--getmetatable('').__call = function(str,i,j)  
--  if type(i)~='table' then return string.sub(str,i,j) 
--    else local t={} 
--    for k,v in ipairs(i) do t[k]=string.sub(str,v,v) end
--    return table.concat(t)
--    end
--  end

function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    -- s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

local result = os.capture("cat battery.log")
-- print(result)

function split(str, pat)
    local t = {}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(t,cap)
        end
        last_end = e+1
        s, e, cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
        cap = str:sub(last_end)
        table.insert(t, cap)
    end
    return t
end

function split_newline(str)
    return split(str, '[\n]+')
end

lines = split_newline(result)
for k, v in pairs(lines) do
    print(k,':', v)
    print(string.match(v, 'Battery .'))
end
