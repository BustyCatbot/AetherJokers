return {
    descriptions={
        Joker={
            j_aether_fleshjoker={
                name="Flesh Joker",
                text={
                    "{X:flesh,C:white}SPREADS{} to all played cards",
                    "{C:green}#1# in #2#{} chance to {X:flesh,C:white}SPREAD{} to",
                    "{C:attention}Joker{} with all {C:flesh}Flesh Cards",
                    "{X:mult,C:white}+X0.1{} per {C:flesh}Flesh Card {C:inactive}({C:flesh}#3#{C:inactive}/#4#{C:inactive})",
                    "{X:mult,C:white}+X0.5{} per {C:flesh}Flesh Joker {C:inactive}({C:flesh}#5#{C:inactive}/#6#{C:inactive})",
                    "{C:inactive}(Currently {X:mult,C:white}X#7#{C:inactive})"
                },
            },
            j_aether_fleshjoker_shop={
                name="Flesh Joker",
                text={
                    "{X:flesh,C:white}SPREAD"
                },
            },
            j_aether_turnstile={
                name="Turnstile",
                text={
                    "{X:blue,C:white}Inverts{} on {C:attention}last{} discard once per round",
                    "Draw from {C:blue}deck{}",
                    "{C:inactive}({C:red}>>>{C:inactive})"
                }
            },
            j_aether_turnstile_inverted={
                name="Turnstile",
                text={
                    "{X:red,C:white}Reverts{} when discard pile is {C:attention}empty{}",
                    "Draw from {C:red}discard{} pile",
                    "{C:inactive}({C:blue}<<<{C:inactive})"
                }
            },
        }
    }
}