-----------------------------------
-- Drop Rarity Rates
-----------------------------------
xi = xi or {}

---@enum xi.drop_rate
xi.drop_rate =
{
    NEVER       = 0, --   0.00%
    ULTRA_RARE  = 1, --   1.00%
    SUPER_RARE  = 2, --   2.50%
    VERY_RARE   = 3, --   5.00%
    RARE        = 4, --   10.00%
    UNCOMMON    = 5, --  25.00%
    COMMON      = 6, --  50.00%
    VERY_COMMON = 7, --  75.00%
    GUARANTEED  = 8, -- 100.00%
}
