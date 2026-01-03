-----------------------------------
-- Help System Init
-- Sole entry point for help data
-----------------------------------

xi = xi or {}
xi.help = xi.help or {}

-----------------------------------
-- Core registry
-----------------------------------
require("scripts/globals/help/registry")

-----------------------------------
-- Module list (AUTHORITATIVE)
-- Only edit this section when adding files
-----------------------------------

local HELP_MODULES =
{
    -- =========================
    -- Abilities
    -- =========================
    "scripts/helpdata/abilities/war",
    "scripts/helpdata/abilities/mnk",
    "scripts/helpdata/abilities/whm",
    "scripts/helpdata/abilities/blm",
    "scripts/helpdata/abilities/rdm",
    "scripts/helpdata/abilities/thf",

    -- =========================
    -- Traits
    -- =========================
    "scripts/helpdata/traits/accuracy_bonus",
    "scripts/helpdata/traits/aggressive_aim",
    "scripts/helpdata/traits/alertness",
    "scripts/helpdata/traits/ambush",
    "scripts/helpdata/traits/amorph_killer",
    "scripts/helpdata/traits/aquan_killer",
    "scripts/helpdata/traits/arcana_killer",
    "scripts/helpdata/traits/assassin",
    "scripts/helpdata/traits/assimilation",
    "scripts/helpdata/traits/attack_bonus",
    "scripts/helpdata/traits/aura_steal",
    "scripts/helpdata/traits/auto_refresh",
    "scripts/helpdata/traits/auto_regen",
    "scripts/helpdata/traits/beast_affinity",
    "scripts/helpdata/traits/beast_healer",
    "scripts/helpdata/traits/beast_killer",
    "scripts/helpdata/traits/bird_killer",
    "scripts/helpdata/traits/blood_boon",
    "scripts/helpdata/traits/cardinal_chant",
    "scripts/helpdata/traits/clear_mind",
    "scripts/helpdata/traits/closed_position",
    "scripts/helpdata/traits/conserve_mp",
    "scripts/helpdata/traits/conserve_tp",
    "scripts/helpdata/traits/counter",
    "scripts/helpdata/traits/crit_atk_bonus",
    "scripts/helpdata/traits/crit_def_bonus",
    "scripts/helpdata/traits/curative_recantation",
    "scripts/helpdata/traits/daken",
    "scripts/helpdata/traits/damage_limit",
    "scripts/helpdata/traits/dead_aim",
    "scripts/helpdata/traits/defense_bonus",
    "scripts/helpdata/traits/demon_killer",
    "scripts/helpdata/traits/desperate_blows",
    "scripts/helpdata/traits/divine_benison",
    "scripts/helpdata/traits/divine_veil",
    "scripts/helpdata/traits/double_attack",
    "scripts/helpdata/traits/dragon_killer",
    "scripts/helpdata/traits/dual_wield",
    "scripts/helpdata/traits/elemental_celerity",
    "scripts/helpdata/traits/empathy",
    "scripts/helpdata/traits/enchainment",
    "scripts/helpdata/traits/evasion_bonus",
    "scripts/helpdata/traits/fast_cast",
    "scripts/helpdata/traits/fencer",
    "scripts/helpdata/traits/fine_tuning",
    "scripts/helpdata/traits/gilfinder",
    "scripts/helpdata/traits/guardian",
    "scripts/helpdata/traits/ikishoten",
    "scripts/helpdata/traits/inquartata",
    "scripts/helpdata/traits/invigorate",
    "scripts/helpdata/traits/iron_will",
    "scripts/helpdata/traits/kick_attacks",
    "scripts/helpdata/traits/lizard_killer",
    "scripts/helpdata/traits/loaded_deck",
    "scripts/helpdata/traits/mag_burst_bonus",
    "scripts/helpdata/traits/magic_atk_bonus",
    "scripts/helpdata/traits/magic_def_bonus",
    "scripts/helpdata/traits/martial_arts",
    "scripts/helpdata/traits/max_hp_boost",
    "scripts/helpdata/traits/max_hp_boost_ii",
    "scripts/helpdata/traits/max_mp_boost",
    "scripts/helpdata/traits/muted_soul",
    "scripts/helpdata/traits/ninja_tool_expert",
    "scripts/helpdata/traits/occult_acumen",
    "scripts/helpdata/traits/optimization",
    "scripts/helpdata/traits/overwhelm",
    "scripts/helpdata/traits/penance",
    "scripts/helpdata/traits/plantoid_killer",
    "scripts/helpdata/traits/primeval_zeal",
    "scripts/helpdata/traits/rapid_shot",
    "scripts/helpdata/traits/recycle",
    "scripts/helpdata/traits/resist_amnesia",
    "scripts/helpdata/traits/resist_bind",
    "scripts/helpdata/traits/resist_blind",
    "scripts/helpdata/traits/resist_gravity",
    "scripts/helpdata/traits/resist_paralyze",
    "scripts/helpdata/traits/resist_petrify",
    "scripts/helpdata/traits/resist_poison",
    "scripts/helpdata/traits/resist_silence",
    "scripts/helpdata/traits/resist_sleep",
    "scripts/helpdata/traits/resist_slow",
    "scripts/helpdata/traits/resist_virus",
    "scripts/helpdata/traits/savagery",
    "scripts/helpdata/traits/shield_barrier",
    "scripts/helpdata/traits/shield_def_bonus",
    "scripts/helpdata/traits/shield_mastery",
    "scripts/helpdata/traits/skillchain_bonus",
    "scripts/helpdata/traits/smite",
    "scripts/helpdata/traits/snapshot",
    "scripts/helpdata/traits/stalwart_soul",
    "scripts/helpdata/traits/stealth",
    "scripts/helpdata/traits/store_tp",
    "scripts/helpdata/traits/stormsurge",
    "scripts/helpdata/traits/stout_servant",
    "scripts/helpdata/traits/strafe",
    "scripts/helpdata/traits/subtle_blow",
    "scripts/helpdata/traits/tactical_guard",
    "scripts/helpdata/traits/tactical_parry",
    "scripts/helpdata/traits/tandem_blow",
    "scripts/helpdata/traits/tandem_strike",
    "scripts/helpdata/traits/tenacity",
    "scripts/helpdata/traits/tranquil_heart",
    "scripts/helpdata/traits/treasure_hunter",
    "scripts/helpdata/traits/treasure_hunter_ii",
    "scripts/helpdata/traits/treasure_hunter_iii",
    "scripts/helpdata/traits/triple_attack",
    "scripts/helpdata/traits/undead_killer",
    "scripts/helpdata/traits/vermin_killer",
    "scripts/helpdata/traits/winning_streak",
    "scripts/helpdata/traits/ws_damage_boost",
    "scripts/helpdata/traits/zanshin",

    -- =========================
    -- Magic
    -- =========================
    "scripts/helpdata/magic/black_magic",
    "scripts/helpdata/magic/white_magic",
    "scripts/helpdata/magic/bard_song",
    "scripts/helpdata/magic/geomancy",
    "scripts/helpdata/magic/ninjutsu",
    "scripts/helpdata/magic/summoning_magic",
}

-----------------------------------
-- Initial load
-----------------------------------

for _, mod in ipairs(HELP_MODULES) do
    require(mod)
end

-----------------------------------
-- Hot reload support
-----------------------------------

function xi.help.reload()
    -- Reset registry
    xi.help.registry = {}

    -- Clear module cache
    for _, mod in ipairs(HELP_MODULES) do
        package.loaded[mod] = nil
    end

    -- Reload data
    for _, mod in ipairs(HELP_MODULES) do
        require(mod)
    end

    print("[HELP] Help data reloaded (" .. tostring(#HELP_MODULES) .. " modules)")
end
