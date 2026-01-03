-- Red Mage Abilities

xi.help.register{
    type = "Ability",
    name = "Chainspell",
    jobs = { "RDM" },
    aliases = { "cs" },

    details = {
        "Spells cast instantly.",
        "Duration: 60 seconds | Recast: 7200 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Convert",
    jobs = { "RDM" },
    aliases = { "cnv" },

    details = {
        "Swaps current HP and MP.",
        "Recast: 600 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Composure",
    jobs = { "RDM" },

    details = {
        "Enhances self-targeted enhancing magic.",
        "Duration: While active | Recast: 300 seconds",
    },

    notes = {
        "Triples duration of self-targeted enhancing magic.",
        "Increases magic recast time.",
    },
}

xi.help.register{
    type = "Ability",
    name = "Saboteur",
    jobs = { "RDM" },

    details = {
        "Enfeebling magic is more potent.",
        "Duration: 60 seconds | Recast: 300 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Spontaneity",
    jobs = { "RDM" },

    details = {
        "Next spell casts instantly.",
        "Consumes effect after one spell.",
        "Recast: 300 seconds",
    },
}

xi.help.register{
    type = "Ability",
    name = "Stymie",
    jobs = { "RDM" },

    details = {
        "Next enfeebling spell cannot be resisted.",
        "Consumes effect after one spell.",
        "Recast: 600 seconds",
    },
}
