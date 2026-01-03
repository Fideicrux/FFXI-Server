xi.help.register{
    type = "Trait",
    name = "Occult Acumen",

    description = {
        "Passive trait: Occult Acumen.",
    },

    jobs = {
        BLM = {
            { level = 65, rank = 1, value = 25 },
            { level = 70, rank = 2, value = 50 },
        },

        DRK = {
            { level = 35, rank = 1, value = 25 },
            { level = 45, rank = 2, value = 50 },
            { level = 55, rank = 3, value = 75 },
            { level = 65, rank = 4, value = 100 },
            { level = 75, rank = 5, value = 125 },
        },

        SCH = {
            { level = 60, rank = 1, value = 25 },
            { level = 65, rank = 2, value = 50 },
            { level = 75, rank = 3, value = 75 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "occult acumen",
    },
}
