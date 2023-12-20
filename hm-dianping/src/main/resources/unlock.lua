---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by JIA.
--- DateTime: 2023/12/20 11:38
---

-- 通过lua脚本来保证redis分布式锁的原子性

-- 这里的KEY[1]就是锁的key,这里的ARG[1]就是当前线程标识
-- 获取锁中的标识,判断是否与当前线程标识一致
if(redis.call('GET',KEY[1]) == ARG[1]) then
    -- 一致,则删除锁
    return redis.call('DEL',KEY[1])
end
-- 不一致,直接返回0
return 0