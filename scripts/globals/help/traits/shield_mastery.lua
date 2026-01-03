xi.help.register{
    type = "Trait",
    name = "Shield Mastery",

    description = {
        "Passive trait: Shield Mastery.",
    },

    jobs = {
        PLD = {
            { level = 20, rank = 1, value = 10 },
            { level = 40, rank = 2, value = 20 },
            { level = 55, rank = 3, value = 30 },
            { level = 75, rank = 4, value = 40 },
        },

        RDM = {
            { level = 65, rank = 1, value = 10 },
            { level = 75, rank = 2, value = 20 },
        },

        WAR = {
            { level = 60, rank = 1, value = 10 },
            { level = 65, rank = 2, value = 20 },
            { level = 70, rank = 3, value = 30 },
        },

    },

    notes = {
        "Values shown are total bonuses at each rank.",
        "Tuned for level 75-cap environment.",
    },

    aliases = {
        "shield mastery",
    },
}
