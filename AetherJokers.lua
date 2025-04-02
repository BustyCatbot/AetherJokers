--- STEAMODDED HEADER
--- MOD_NAME: Aether Jokers
--- MOD_ID: AetherJokers
--- MOD_AUTHOR: [BustyCatbot]
--- MOD_DESCRIPTION: Adds a few misc jokers with unique mechanics.
--- LOADER_VERSION_GEQ: 1.0.0
--- BADGE_COLOR: a040ff
--- PREFIX: aether

SMODS.Atlas {
	key = 'aetherjokers',
	path = 'AetherJokers.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'aetherenhancers',
	path = 'AetherEnhancers.png',
	px = 71,
	py = 95
}

local base_loc_colour = loc_colour
function loc_colour(_c, _default)
    local ret = base_loc_colour(_c, _default)

    G.C.AETHER = HEX('8000FF')
    G.ARGS.LOC_COLOURS['aether'] = G.C.AETHER

    G.C.CONSUMED = HEX('FF70B0')
    G.ARGS.LOC_COLOURS['consumed'] = G.C.CONSUMED

    G.C.FLUSH = HEX('50D0C0')
    G.ARGS.LOC_COLOURS['flush'] = G.C.FLUSH

    G.C.SLEEVED = HEX('FF8050')
    G.ARGS.LOC_COLOURS['sleeved'] = G.C.SLEEVED

    G.C.FLESH = HEX('8A102A')
    G.ARGS.LOC_COLOURS['flesh'] = G.C.FLESH

    return ret
end

--[[local base_debuff_hand = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
    local ret = Blind.debuff_hand(self, cards, hand, handname, check)

    return ret
end]]

local base_modify_hand = Blind.modify_hand
function Blind:modify_hand(cards, poker_hands, text, mult, hand_chips)
    local mult, hand_chips, modded = base_modify_hand(self, cards, poker_hands, text, mult, hand_chips)

    if G.GAME.new_poker_hand then

        G.GAME.hands[G.GAME.old_poker_hand].played = G.GAME.hands[G.GAME.old_poker_hand].played - 1
        G.GAME.hands[G.GAME.old_poker_hand].played_this_round = G.GAME.hands[G.GAME.old_poker_hand].played_this_round - 1

        G.GAME.hands[G.GAME.new_poker_hand].played = G.GAME.hands[G.GAME.new_poker_hand].played + 1
        G.GAME.hands[G.GAME.new_poker_hand].played_this_round = G.GAME.hands[G.GAME.new_poker_hand].played_this_round + 1

        G.GAME.last_hand_played = G.GAME.new_poker_hand
        set_hand_usage(G.GAME.new_poker_hand)
        G.GAME.hands[G.GAME.new_poker_hand].visible = true

        if self.name == 'The Eye' then

            if self.hands[G.GAME.old_poker_hand] then
                self.hands[G.GAME.old_poker_hand] = false
            end
            self.hands[G.GAME.new_poker_hand] = true

        elseif self.name == 'The Mouth' then

            self.only_hand = G.GAME.new_poker_hand

        end

        mult = G.GAME.hands[G.GAME.new_poker_hand].mult
        hand_chips = G.GAME.hands[G.GAME.new_poker_hand].chips
        modded = false

        G.GAME.new_poker_hand = false

    end

    return mult, hand_chips, modded
end

local base_calculate = Card.calculate_joker
function Card:calculate_joker(context)
    local ret = base_calculate(self, context)

    if context.other_card then

        if SMODS.has_enhancement(context.other_card, 'm_aether_counterfeit') and context.other_card.ability.extra.uses_left <= 0 and context.other_card ~= self and not context.check_enhancement then

            return nil

        end

    end

    if context.joker_main then

        if self.force_trigger then

            self.force_trigger = false

            if self.ability.t_chips > 0 then

                return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.t_chips}},
                    chip_mod = self.ability.t_chips
                }

            end

            if self.ability.t_mult > 0 then

                return {
                    message = localize{type='variable',key='a_mult',vars={self.ability.t_mult}},
                    mult_mod = self.ability.t_mult
                }

            end

            if self.ability.Xmult > 0 then

                return {
                    message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                    colour = G.C.RED,
                    Xmult_mod = self.ability.x_mult
                }

            end

            if self.ability.name == 'Seance' and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then

                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = function()
                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral,
                    card = self
                }

            end

        end

    end

    return ret
end

local base_use_consumeable = Card.use_consumeable
function Card:use_consumeable(area, copier)
    local ret = base_use_consumeable(self, area, copier)

    for k,v in pairs(G.hand.highlighted) do

        if SMODS.has_enhancement(v, 'm_aether_sleeved') then

            card_eval_status_text(v, 'extra', nil, nil, nil, {message = 'Sleeved!', sound = 'highlight1', colour = G.C.SLEEVED})
            G.E_MANAGER:add_event(Event({
                func = function()
                    v:start_dissolve({G.C.BLACK, G.C.SLEEVED, G.C.SLEEVED}, false, 5)
                    delay(1)
                    v:remove()
                    return true
                end
            }))

        end

    end

    return ret
end

local base_can_discard = G.FUNCS.can_discard
G.FUNCS.can_discard = function(e)
    local ret = base_can_discard(e)

        if G.GAME.inverted then
            e.config.colour = G.C.BLUE
            e.config.button = 'inverted_discard_cards_from_highlighted'
            ease_background_colour{new_colour = G.C.BLUE}
        end

    return ret
end

G.FUNCS.inverted_discard_cards_from_highlighted = function(e, hook)
    stop_use()
    G.CONTROLLER.interrupt.focus = true
    G.CONTROLLER:save_cardarea_focus('hand')

    for k, v in ipairs(G.playing_cards) do
        v.ability.forced_selection = nil
    end

    if G.CONTROLLER.focused.target and G.CONTROLLER.focused.target.area == G.hand then G.card_area_focus_reset = {area = G.hand, rank = G.CONTROLLER.focused.target.rank} end
    local highlighted_count = math.min(#G.hand.highlighted, G.discard.config.card_limit - #G.play.cards)
    if highlighted_count > 0 then 
        update_hand_text({immediate = true, nopulse = true, delay = 0}, {mult = 0, chips = 0, level = '', handname = ''})
        table.sort(G.hand.highlighted, function(a,b) return a.T.x < b.T.x end)
        inc_career_stat('c_cards_discarded', highlighted_count)
        for j = 1, #G.jokers.cards do
            G.jokers.cards[j]:calculate_joker({pre_discard = true, full_hand = G.hand.highlighted, hook = hook})
        end
        local cards = {}
        local destroyed_cards = {}
        for i=1, highlighted_count do
            G.hand.highlighted[i]:calculate_seal({discard = true})
            local removed = false
            for j = 1, #G.jokers.cards do
                local eval = nil
                eval = G.jokers.cards[j]:calculate_joker({discard = true, other_card =  G.hand.highlighted[i], full_hand = G.hand.highlighted})
                if eval then
                    if eval.remove then removed = true end
                    card_eval_status_text(G.jokers.cards[j], 'jokers', nil, 1, nil, eval)
                end
            end
            table.insert(cards, G.hand.highlighted[i])
            if removed then
                destroyed_cards[#destroyed_cards + 1] = G.hand.highlighted[i]
                if G.hand.highlighted[i].ability.name == 'Glass Card' then 
                    G.hand.highlighted[i]:shatter()
                else
                    G.hand.highlighted[i]:start_dissolve()
                end
            else 
                G.hand.highlighted[i].ability.discarded = false
                draw_card(G.hand, G.deck, i*100/highlighted_count, 'down', false, G.hand.highlighted[i])
            end
        end

        if destroyed_cards[1] then 
            for j=1, #G.jokers.cards do
                eval_card(G.jokers.cards[j], {cardarea = G.jokers, remove_playing_cards = true, removed = destroyed_cards})
            end
        end

        G.GAME.round_scores.cards_discarded.amt = G.GAME.round_scores.cards_discarded.amt - #cards
        check_for_unlock({type = 'discard_custom', cards = cards})
        if not hook then
            if G.GAME.modifiers.discard_cost then
                ease_dollars(-G.GAME.modifiers.discard_cost)
            end
            if G.GAME.current_round.discards_left < G.GAME.round_resets.discards then
                ease_discard(1)
                play_sound('aether_invertedchips1')
            end
            G.GAME.current_round.discards_used = G.GAME.current_round.discards_used - 1
            G.STATE = G.STATES.DRAW_TO_HAND
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        end
    end
end

SMODS.Sound({
    key = 'joker1',
    path = 'joker1.ogg',
})

SMODS.Sound({
    key = 'joker2',
    path = 'joker2.ogg',
})

SMODS.Sound({
    key = 'joker3',
    path = 'joker3.ogg',
})

SMODS.Sound({
    key = 'jokerspecial',
    path = 'jokerspecial.ogg',
})

SMODS.Sound({
    key = 'tennisstart',
    path = 'tennisstart.ogg',
})

SMODS.Sound({
    key = 'tennisswing',
    path = 'tennisswing.ogg',
})

SMODS.Sound({
    key = 'tennishit1',
    path = 'tennishit1.ogg',
})

SMODS.Sound({
    key = 'tennishit2',
    path = 'tennishit2.ogg',
})

SMODS.Sound({
    key = 'tennishit3',
    path = 'tennishit3.ogg',
})

SMODS.Sound({
    key = 'tennishit4',
    path = 'tennishit4.ogg',
})

SMODS.Sound({
    key = 'tennismiss',
    path = 'tennismiss.ogg',
})

SMODS.Sound({
    key = 'tennisaw',
    path = 'tennisaw.ogg',
})

SMODS.Sound({
    key = 'tenniswoah',
    path = 'tenniswoah.ogg',
})

SMODS.Sound({
    key = 'tennisbonus',
    path = 'tennisbonus.ogg',
})

SMODS.Sound({
    key = 'tennisnice',
    path = 'tennisnice.ogg',
})

SMODS.Sound({
    key = 'consumestart',
    path = 'consumestart.ogg',
})

SMODS.Sound({
    key = 'consumeend',
    path = 'consumeend.ogg',
})

SMODS.Sound({
    key = 'consumerelease',
    path = 'consumerelease.ogg',
})

SMODS.Sound({
    key = 'consumecard',
    path = 'consumecard.ogg',
})

SMODS.Sound({
    key = 'flushify',
    path = 'flushify.ogg',
})

SMODS.Sound({
    key = 'flushify1',
    path = 'flushify1.ogg',
})

SMODS.Sound({
    key = 'flushify2',
    path = 'flushify2.ogg',
})

SMODS.Sound({
    key = 'flushify3',
    path = 'flushify3.ogg',
})

SMODS.Sound({
    key = 'flushify4',
    path = 'flushify4.ogg',
})

SMODS.Sound({
    key = 'flushify5',
    path = 'flushify5.ogg',
})

SMODS.Sound({
    key = 'fleshspawn',
    path = 'fleshspawn.ogg',
})

SMODS.Sound({
    key = 'fleshmult',
    path = 'fleshmult.ogg',
})

SMODS.Sound({
    key = 'fleshxmult',
    path = 'fleshxmult.ogg',
})

SMODS.Sound({
    key = 'fleshinfect1',
    path = 'fleshinfect1.ogg',
})

SMODS.Sound({
    key = 'fleshinfect2',
    path = 'fleshinfect2.ogg',
})

SMODS.Sound({
    key = 'fleshinfect3',
    path = 'fleshinfect3.ogg',
})

SMODS.Sound({
    key = 'fleshinfect4',
    path = 'fleshinfect4.ogg',
})

SMODS.Sound({
    key = 'fleshinfectjoker1',
    path = 'fleshinfectjoker1.ogg',
})

SMODS.Sound({
    key = 'fleshinfectjoker2',
    path = 'fleshinfectjoker2.ogg',
})

SMODS.Sound({
    key = 'fleshdecay1',
    path = 'fleshdecay1.ogg',
})

SMODS.Sound({
    key = 'fleshdecay2',
    path = 'fleshdecay2.ogg',
})

SMODS.Sound({
    key = 'fleshdecay3',
    path = 'fleshdecay3.ogg',
})

SMODS.Sound({
    key = 'fleshdecay4',
    path = 'fleshdecay4.ogg',
})

SMODS.Sound({
    key = 'fleshdecay5',
    path = 'fleshdecay5.ogg',
})

SMODS.Sound({
    key = 'fleshdecay6',
    path = 'fleshdecay6.ogg',
})

SMODS.Sound({
    key = 'fleshperish1',
    path = 'fleshperish1.ogg',
})

SMODS.Sound({
    key = 'fleshperish2',
    path = 'fleshperish2.ogg',
})

SMODS.Sound({
    key = 'invertedcard1',
    path = 'invertedcard1.ogg',
})

SMODS.Sound({
    key = 'invertedchips1',
    path = 'invertedchips1.ogg',
})

SMODS.Sound({
    vol = 0.6,
    pitch = 0.7,
    key = 'invertedmusic1',
    path = 'invertedmusic1.ogg',
    sync = true,
    select_music_track = function()
        if G.GAME.blind and not G.GAME.blind.config.blind.boss then
            return G.GAME.inverted and 10 or false
        end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 0.7,
    key = 'invertedmusic5',
    path = 'invertedmusic5.ogg',
    sync = true,
    select_music_track = function()
        if G.GAME.blind and G.GAME.blind.config.blind.boss then
            return G.GAME.inverted and 10 or false
        end
    end
})

SMODS.Joker {
	key = 'drugtest',
	loc_txt = {
		name = 'Drug Test',
		text = {
			'Gives {C:money}$#1#{} for every {C:attention}#2#{}',
            'scored {C:attention}Non-Enhanced{} cards',
            '{C:inactive}(Currently {C:attention}#3#{C:inactive}/#2# cards)'
		}
	},
	config = {unlocked = true, discovered = true, extra = { cards = 3, scored_cards = 0, money_mod = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.money_mod, card.ability.extra.cards, card.ability.extra.scored_cards } }
	end,
	rarity = 1,
    atlas = 'aetherjokers',
	pos = { x = 1, y = 1 },
	cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play then

            if context.other_card.config.center == G.P_CENTERS.c_base then

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.3,0.5)
                        return true
                    end,
                    blocking = true
                }))

                if context.blueprint then

                    if card.ability.extra.scored_cards == card.ability.extra.cards then

                        return {
                            dollars = card.ability.extra.money_mod,
                            card = card,
                            colour = G.C.MONEY
                        }

                    end

                else

                    if card.ability.extra.scored_cards < card.ability.extra.cards - 1 then

                        card.ability.extra.scored_cards = card.ability.extra.scored_cards + 1

                    else

                        card.ability.extra.scored_cards = 0

                        return {
                            dollars = card.ability.extra.money_mod,
                            card = card,
                            colour = G.C.MONEY
                        }

                    end

                end

            end

        end

    end
}

SMODS.Joker {
	key = 'palettejoker',
	loc_txt = {
		name = 'Palette Joker',
		text = {
			'Gains {X:mult,C:white}X#1#{} Mult for every',
            'scored {C:attention}suit{} sequence',
            '{C:inactive}(Next: {V:1}#2#{C:attention} #3#{C:inactive}/4)',
            '{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)',
		}
	},
	config = {unlocked = true, discovered = true, extra = { mult_mod = 0.1, mult = 1, suits = { [1] = 'Spades', [2] = 'Hearts', [3] = 'Clubs', [4] = 'Diamonds' }, scored_suits = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {
            card.ability.extra.mult_mod,

            localize(card.ability.extra.suits[1], 'suits_singular'),
            card.ability.extra.scored_suits,

            card.ability.extra.mult,

            colours = {
                G.C.SUITS[card.ability.extra.suits[1]],
            },
        } }
	end,
	rarity = 1,
	atlas = 'aetherjokers',
	pos = { x = 2, y = 1 },
	cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and not context.blueprint then

            if context.other_card:is_suit(card.ability.extra.suits[1]) then

                table.insert(card.ability.extra.suits, #card.ability.extra.suits + 1, card.ability.extra.suits[1])
                table.remove(card.ability.extra.suits, 1)

                if card.ability.extra.scored_suits < 3 then

                    card.ability.extra.scored_suits = card.ability.extra.scored_suits + 1

                    return {
                        message = card.ability.extra.scored_suits..'/4',
                        card = card,
                        colour = G.C.SUITS[context.other_card.base.suit]
                    }

                else

                    card.ability.extra.scored_suits = 0

                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod

                    return {
                        message = 'Upgrade!',
                        card = card,
                        colour = G.C.SUITS[context.other_card.base.suit]
                    }

                end

            end

        end

        if context.joker_main then
            
            return {
                xmult = card.ability.extra.mult
            }

        end

    end,

}

SMODS.Joker {
	key = 'hailmary',
	loc_txt = {
		name = 'Hail Mary',
		text = {
			'Draws one of the most',
            'abundant card {C:attention}ranks{} in hand from',
            'deck on last {C:red}discard',
            'Has a {C:green}#1# in #2#{} chance',
            'to trigger on last {C:blue}hand'
		}
	},
	config = {unlocked = true, discovered = true, extra = { hand_odds = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.hand_odds} }
	end,
	rarity = 1,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 5,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if (context.pre_discard and G.GAME.current_round.discards_left == 1 and not context.hook) or (context.final_scoring_step and G.GAME.current_round.hands_left == 1 and pseudorandom('hailmaryhand') < G.GAME.probabilities.normal / card.ability.extra.hand_odds) and not context.blueprint then

            if #G.hand.cards >= 1 then

                draw_rank = 'Ace'

                ranks = {
                    ['2'] = 0,
                    ['3'] = 0,
                    ['4'] = 0,
                    ['5'] = 0,
                    ['6'] = 0,
                    ['7'] = 0,
                    ['8'] = 0,
                    ['9'] = 0,
                    ['10'] = 0,
                    ['Jack'] = 0,
                    ['Queen'] = 0,
                    ['King'] = 0,
                    ['Ace'] = 0,
                }

                for k,v in pairs(G.hand.cards) do

                    if not SMODS.has_enhancement(v, 'm_stone') and not SMODS.has_enhancement(v, 'm_aether_fleshstone') and not v.highlighted then
                        ranks[v.config.card.value] = ranks[v.config.card.value] + 1
                    end

                end

                highest_number = 0

                for k,v in pairs(ranks) do

                    if v > highest_number then
                        draw_rank = k
                        highest_number = v
                    elseif v == highest_number then
                        if pseudorandom('hailmary') > 0.5 then
                            draw_rank = k
                        end
                    end

                end

                for k,v in pairs(G.deck.cards) do

                    if v.config.card.value == draw_rank then

                        G.E_MANAGER:add_event(Event({
                            func = function()
                                moved_card = v
                                G.deck:remove_card(moved_card)
                                G.hand:emplace(moved_card)
                                return true
                            end,
                            blocking = false
                        }))

                        return {
                            message = 'Hail Mary!',
                            card = hailcard,
                            sound = 'cardFan2'
                        }

                    end

                end

            end

            return {
                message = 'None Found!',
                colour = G.C.RED
            }

        end

    end,

}

SMODS.Joker {
	key = 'eleventhhour',
	loc_txt = {
		name = 'Eleventh Hour',
		text = {
			'Draws one of the most',
            'abundant card {C:attention}suits{} in hand from',
            'deck on last {C:red}discard',
            'Has a {C:green}#1# in #2#{} chance',
            'to trigger on last {C:blue}hand'
		}
	},
	config = {unlocked = true, discovered = true, extra = { card_suit = 'None', hand_odds = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.hand_odds} }
	end,
	rarity = 1,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 5,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if (context.pre_discard and G.GAME.current_round.discards_left == 1) or (context.final_scoring_step and G.GAME.current_round.hands_left == 1 and pseudorandom('eleventhhand') < G.GAME.probabilities.normal / card.ability.extra.hand_odds) and not context.blueprint then

            if #G.hand.cards >= 1 then

                draw_suit = 'Spades'

                suits = {
                    ['Spades'] = 0,
                    ['Hearts'] = 0,
                    ['Clubs'] = 0,
                    ['Diamonds'] = 0
                }

                for k,v in pairs(G.hand.cards) do

                    if not SMODS.has_enhancement(v, 'm_stone') and not SMODS.has_enhancement(v, 'm_aether_fleshstone') and not v.highlighted then
                        suits[v.config.card.suit] = suits[v.config.card.suit] + 1
                    end

                end

                highest_number = 0

                for k,v in pairs(suits) do

                    if v > highest_number then
                        draw_suit = k
                        highest_number = v
                    elseif v == highest_number then
                        if pseudorandom('eleventhhour') > 0.5 then
                            draw_suit = k
                        end
                    end

                end

            end

            for k,v in pairs(G.deck.cards) do

                if v.config.card.suit == draw_suit then

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            moved_card = v
                            G.deck:remove_card(moved_card)
                            G.hand:emplace(moved_card)
                            return true
                        end,
                        blocking = false
                    }))

                    return {
                        message = 'Eleventh Hour!',
                        card = eleventhcard,
                        sound = 'cardFan2'
                    }

                end

            end

            return {
                message = 'None Found!',
                colour = G.C.RED
            }

        end

    end,

}

SMODS.Joker {
	key = 'backseatjoker',
	loc_txt = {
		name = 'Backseat Joker',
		text = {
			'Adds {C:attention}double{} base chips and {C:attention}half',
            'bonus chips of all cards held in hand',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
		}
	},
	config = {unlocked = true, discovered = true, extra = { held_chips = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.held_chips } }
	end,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 4, y = 0 },
	cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if context.individual and context.cardarea == G.hand and not context.end_of_round then

            if context.other_card.debuff then

                return {
                    message = localize('k_debuffed'),
                    card = context.other_card,
                    colour = G.C.RED
                }

            else

                if SMODS.has_enhancement(context.other_card, 'm_stone') then

                    return {
                        chips = (context.other_card.ability.bonus * 2) + math.ceil(context.other_card.ability.perma_bonus / 2),
                        card = context.other_card
                    }

                elseif not SMODS.has_enhancement(context.other_card, 'm_aether_fleshstone') then

                    return {
                        chips = (context.other_card.base.nominal * 2) + math.ceil(context.other_card.ability.perma_bonus / 2),
                        card = context.other_card
                    }

                end
                
            end

        end

    end,

    update = function(self, card, context)

        if G.hand then

            if #G.hand.cards > 0 and #G.play.cards <= 0 then

                card.ability.extra.held_chips = 0

                for k,v in pairs(G.hand.cards) do

                    if not v.debuff and not v.highlighted then

                        if SMODS.has_enhancement(v, 'm_stone') then

                            card.ability.extra.held_chips = card.ability.extra.held_chips + (v.ability.bonus * 2) + math.ceil(v.ability.perma_bonus / 2)

                        elseif not SMODS.has_enhancement(v, 'm_aether_fleshstone') then

                            card.ability.extra.held_chips = card.ability.extra.held_chips + (v.base.nominal * 2) + math.ceil(v.ability.perma_bonus / 2)

                        end

                    end

                end

            elseif #G.hand.cards <= 0 then

                card.ability.extra.held_chips = 0

            end

        end

    end,

}

SMODS.Joker {
	key = 'divisiblejoker',
	loc_txt = {
		name = 'Divisible Joker',
		text = {
			'{X:mult,C:white}+X#1#{} Mult if current',
            'chips are divisible by {C:attention}2{}, {C:attention}3{},',
            '{C:attention}5{}, and/or {C:attention}7 {C:inactive}(Stacks)',
		}
	},
	config = {unlocked = true, discovered = true, extra = { mult = 0.25, current_xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.mult} }
	end,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 1 },
	cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if context.joker_main then

            card.ability.extra.current_xmult = 1

            numbers = {
                2,
                3,
                5,
                7
            }

            for k,v in pairs(numbers) do

                if hand_chips % v == 0 then
                    card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.mult
                    if context.blueprint then
                        card_eval_status_text(context.blueprint_card, 'extra', nil, nil, nil, {message = v..'! X'..card.ability.extra.current_xmult, sound = 'tarot2', colour = G.C.MULT})
                    else
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = v..'!', sound = 'tarot2', colour = G.C.MULT})
                    end
                    delay(0.2)
                end

            end

            if card.ability.extra.current_xmult > 1 then
                return {
                    xmult = card.ability.extra.current_xmult
                }
            end

        end

    end,

}

SMODS.Joker {
	key = 'stopcard',
	loc_txt = {
		name = 'Stop Card',
		text = {
			'{C:red}Debuffs{} {C:attention}Joker{} to the left',
            '{C:red}Debuffs{} first hand drawn',
            'if leftmost joker'
		}
	},
	config = {unlocked = true, discovered = true, extra = { current_pos = 0, debuffed_joker = 0, marked_for_sell = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 5,
    eternal_compat = true,
    perishable_compat = true,
	update = function(self, card, context)

        local currentpos = 0

        if G.jokers then

            for k,v in pairs(G.jokers.cards) do

                currentpos = currentpos + 1

                if v == card then

                    card.ability.extra.current_pos = currentpos
                    break

                end
                
            end

            local debuffjoker

            if card.ability.extra.current_pos and card.ability.extra.marked_for_sell == 0 then

                debuffjoker = G.jokers.cards[card.ability.extra.current_pos - 1]

                    if card.ability.extra.debuffed_joker ~= 0 then

                        if card.ability.extra.debuffed_joker ~= debuffjoker then
                            SMODS.debuff_card(card.ability.extra.debuffed_joker, 'reset', 'stopjoker')
                            SMODS.recalc_debuff(card.ability.extra.debuffed_joker)
                        end

                    end

                    if debuffjoker then

                        SMODS.debuff_card(debuffjoker, true, 'stopjoker')
                        SMODS.recalc_debuff(debuffjoker)
                        card.ability.extra.debuffed_joker = debuffjoker

                    end

            end

        end

	end,

    remove_from_deck = function(self, card, from_debuff)

        card.ability.extra.marked_for_sell = true

        if card.ability.extra.debuffed_joker ~= 0 then

            SMODS.debuff_card(card.ability.extra.debuffed_joker, 'reset', 'stopjoker')
            SMODS.recalc_debuff(card.ability.extra.debuffed_joker)

        end

    end

}

SMODS.Joker {
	key = 'tennisjoker',
	loc_txt = {
		name = 'Tennis Joker',
		text = {
			'Gains {C:mult}+#1#{} Mult if played',
            'hand only contains one card',
            'Resets if played hand contains',
            'more than one card',
            '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)',
            'Gives {C:money}$1{} at end of round for',
            'every {C:attention}5th{} Streak above {C:attention}20',
            '{C:inactive}({C:attention}#3#{C:inactive} Streak = {C:money}$#4#{C:inactive})',
            '{C:inactive}(Cannot be retriggered)'
		}
	},
	config = {unlocked = true, discovered = true, extra = { mult = 0, mult_mod = 2, streak = 0, money = 0, card_triggers = 0, joker_triggers = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.mult, card.ability.extra.streak, card.ability.extra.money } }
	end,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 1 },
	cost = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

		if context.joker_main and card.ability.extra.joker_triggers == 0 then

            if not context.blueprint then

                card.ability.extra.joker_triggers = card.ability.extra.joker_triggers + 1

            end

            if card.ability.extra.mult > 0 and card.ability.extra.card_triggers > 0 then

                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                    sound = 'aether_tennishit'..math.random(1, 4)
                }

            end

		end

        if context.individual and context.cardarea == G.play and card.ability.extra.card_triggers == 0 and not context.blueprint then

            card.ability.extra.card_triggers = card.ability.extra.card_triggers + 1

            play_sound('aether_tennisswing')

            if #G.play.cards <= 1 then

                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                card.ability.extra.streak = math.floor(card.ability.extra.streak + 1)

                return {
                    message = card.ability.extra.streak..' Streak!',
                    card = G.play.cards[1],
                    sound = 'aether_tennishit'..math.random(1, 4)
                }

            elseif #G.play.cards > 1 and card.ability.extra.streak > 0 then

                if card.ability.extra.streak >= 10 then
                    play_sound('aether_tennisaw')
                end

                streak = card.ability.extra.streak

                card.ability.extra.mult = 0
                card.ability.extra.streak = 0

                return {
                    message = 'Miss! ('..streak..' Streak)',
                    sound = 'aether_tennismiss'
                }

            end

        end

        if context.final_scoring_step and not context.blueprint then

            if card.ability.extra.streak == 20 then

                return {
                    message = 'Bonus Active!',
                    sound = 'aether_tenniswoah'
                }

            elseif card.ability.extra.streak == 69 then

                return {
                    message = 'Nice!',
                    sound = 'aether_tennisnice'
                }

            elseif card.ability.extra.streak > 20 and card.ability.extra.streak % 5 == 0 then

                return {
                    message = 'Upgrade!',
                    sound = 'aether_tennisbonus'
                }

            end

        end

        if context.after and not context.blueprint then

            card.ability.extra.card_triggers = 0
            card.ability.extra.joker_triggers = 0

            if card.ability.extra.streak >= 20 then

                card.ability.extra.money = math.floor((card.ability.extra.streak - 15) / 5)

            end

        end

	end,

    add_to_deck = function(self, card, from_debuff)

        if not from_debuff then

            play_sound('aether_tennisstart')

        end

    end,

    calc_dollar_bonus = function(self, card)

        if card.ability.extra.money > 0 then

            return card.ability.extra.money

        end

    end

}

SMODS.Joker {
	key = 'sleevedjoker',
	loc_txt = {
		name = 'Sleeved Joker',
		text = {
			'{C:green}4x #1# in #2#{} chance to',
            'draw a {C:sleeved}Sleeved {C:attention}Ace{} to',
            'hand on first draw'
		}
	},
	config = {unlocked = true, discovered = true, extra = { drawn_aces = {}, card_odds = 3 } },
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aether_sleeved
		return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.card_odds} }
	end,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 1, y = 0 },
	cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if context.first_hand_drawn and #G.hand.cards > 0 then

            available_aces = {'S', 'H', 'C', 'D'}

            for k,v in pairs(available_aces) do

                if pseudorandom('sleevedjoker') < G.GAME.probabilities.normal / card.ability.extra.card_odds then
                    tempace = create_playing_card({ front = G.P_CARDS[v..'_A'], center = G.P_CENTERS.m_aether_sleeved }, G.hand, false, false, {G.C.BLACK, G.C.SLEEVED})
                    card_eval_status_text(tempace, 'extra', nil, nil, nil, {message = 'Unsleeved!', sound = 'cardFan2', colour = G.C.SLEEVED})
                    table.insert(card.ability.extra.drawn_aces, tempace)
                    tempace.vampired = true
                    card:juice_up(0.3,0.5)
                    G.hand:sort()
                end

                delay(0.2)

            end

            if #card.ability.extra.drawn_aces <= 0 then

                card.ability.extra.drawn_aces = {}

                return {
                    message = 'No Dice!',
                    colour = G.C.RED,
                    sound = 'other1'
                }

            end

            card.ability.extra.drawn_aces = {}

        end

    end,

}

SMODS.Joker {
	key = 'overkilljoker',
	loc_txt = {
		name = 'Overkill Joker',
		text = {
			'Gives {C:money}$#1#{} at end of round',
            'for every {C:attention}#2#x{} total score over',
            'score requirement in a single hand',
            '{C:inactive}(Max of {C:money}$#3#{C:inactive})'
		}
	},
	config = {unlocked = true, discovered = true, extra = { money = 0, money_mod = 1, multiple = 0.5, max = 20 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.money_mod, card.ability.extra.multiple, card.ability.extra.max} }
	end,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 1, y = 1 },
	cost = 4,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if context.final_scoring_step then

            if hand_chips * mult > G.GAME.blind.chips then

                card.ability.extra.money = math.floor(((hand_chips * mult) - G.GAME.blind.chips) / (G.GAME.blind.chips * card.ability.extra.multiple))
                if card.ability.extra.money > card.ability.extra.max then
                    card.ability.extra.money = card.ability.extra.max
                end

            else

                card.ability.extra.money = 0

            end

        end

    end,

    calc_dollar_bonus = function(self, card)

        if card.ability.extra.money > 0 then

            return card.ability.extra.money

        end

    end

}

SMODS.Joker {
	key = 'counterfeitjoker',
	loc_txt = {
		name = 'Counterfeit Joker',
		text = {
			'Adds {C:attention}Counterfeit{} copies of all highlighted',
            'cards to your deck when sold'
		}
	},
	config = {unlocked = true, discovered = true, extra = {} },
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aether_counterfeit
		return { vars = {} }
	end,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 3, y = 0 },
	cost = 4,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if context.selling_self and #G.hand.highlighted > 0 then

            for k,v in pairs(G.hand.highlighted) do

                G.E_MANAGER:add_event(Event({
                    func = function()
                        copiedcard = copy_card(v)
                        copiedcard:add_to_deck()
                        table.insert(G.playing_cards, copiedcard)
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        G.deck:emplace(copiedcard)
                        copiedcard:set_ability(G.P_CENTERS.m_aether_counterfeit, nil, true)
                        card:juice_up(0.3,0.5)
                        play_sound('card1')
                        return true
                    end,
                    blocking = true
                }))

                delay(0.2)

            end

        end

    end,

}

SMODS.Joker {
	key = 'handyjoker',
	loc_txt = {
		name = 'Handy Joker',
		text = {
			'{C:attention}+1{} hand size per',
            'hand on first draw',
            '{C:attention}-1{} hand size on',
            'each hand played'
		}
	},
	config = {unlocked = true, discovered = true, extra = { added_hand_size = 0 } },
	loc_vars = function(self, info_queue, card)
		return {}
	end,
	rarity = 3,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if not context.blueprint then

            if context.first_hand_drawn then

                card.ability.extra.added_hand_size = G.GAME.current_round.hands_left

                if card.ability.extra.added_hand_size > 0 and not card.debuff then
                    G.hand:change_size(card.ability.extra.added_hand_size)
                end

            end

            if context.before then

                if card.ability.extra.added_hand_size > 0 then
                    card.ability.extra.added_hand_size = card.ability.extra.added_hand_size -1
                    if not card.debuff then
                        G.hand:change_size(-1)
                    end
                end

            end

            if context.end_of_round and context.cardarea == G.jokers then

                card.ability.extra.added_hand_size = 0

                if not card.debuff then
                    G.hand:change_size(-G.GAME.current_round.hands_left)
                end

            end

        end

    end,

    add_to_deck = function(self, card, from_debuff)

        if card.ability.extra.added_hand_size > 0 then
            G.hand:change_size(card.ability.extra.added_hand_size)
        end

    end,

    remove_from_deck = function(self, card, from_debuff)

        if card.ability.extra.added_hand_size > 0 then
            G.hand:change_size(-card.ability.extra.added_hand_size)
            for i = 1, card.ability.extra.added_hand_size do
                moved_card = G.hand.cards[#G.hand.cards]
                G.hand:remove_card(moved_card)
                G.deck:emplace(moved_card)
            end
        end

    end,

}

SMODS.Joker {
	key = 'holdingjoker',
	loc_txt = {
		name = 'Joker of Holding',
		text = {
			'{C:consumed}Consumes{} all played cards of first',
            'played hand if hand contains {C:attention}5{} cards',
            'Draws all {C:consumed}Consumed{} cards to hand when sold',
            '{C:consumed}Consumed{} cards permanently gain',
            'base chips of all scored cards as',
            'extra chips for each played hand',
            '{C:red}-$1{} sell value for every {C:attention}3{} cards stored',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive})',
            '{C:inactive}(Holding {C:consumed}#2#{C:inactive} Cards)'
		}
	},
	config = {unlocked = true, discovered = true, extra = { consumed_cards = {}, joker_triggers = 0, bonus_chips = 0, bonus_chips_visible = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.bonus_chips_visible, #card.ability.extra.consumed_cards } }
	end,
	rarity = 3,
	atlas = 'aetherjokers',
	pos = { x = 4, y = 1 },
	cost = 6,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

		if context.destroy_card and context.cardarea ~= G.hand and G.GAME.current_round.hands_played == 0 and not context.blueprint and #G.play.cards == 5 then

            if card.ability.extra.joker_triggers == 0 then

                card.ability.extra.joker_triggers = 1

                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('aether_consumestart')
                        return true
                    end,
                    blocking = true
                }))

                delay(0.5)

                for k,v in pairs(G.play.cards) do

                    if not SMODS.has_enhancement(v, 'm_aether_sleeved') then

                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = 'Consumed!', sound = 'aether_consumecard', colour = G.C.CONSUMED})
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                table.insert(card.ability.extra.consumed_cards, #card.ability.extra.consumed_cards + 1, v)
                                card:juice_up(0.3,0.5)
                                v:start_dissolve({G.C.CONSUMED, G.C.WHITE, G.C.WHITE}, true, 5)
                                return true
                            end,
                            blocking = true
                        }))

                    end
                    
                end

                delay(0.5)

                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('aether_consumeend')
                        card.sell_cost = math.ceil(-#card.ability.extra.consumed_cards / 3)
                        return true
                    end,
                    blocking = true
                }))

            end

            return {remove = true}

        end

        if context.final_scoring_step then

            card.ability.extra.joker_triggers = 0

            if #card.ability.extra.consumed_cards > 0 then

                card.ability.extra.bonus_chips = 0

                for k,v in pairs(G.play.cards) do
                    if SMODS.has_enhancement(v, 'm_stone') then
                        card.ability.extra.bonus_chips = card.ability.extra.bonus_chips + v.ability.bonus
                    elseif not SMODS.has_enhancement(v, 'm_aether_fleshstone') then
                        card.ability.extra.bonus_chips = card.ability.extra.bonus_chips + v.base.nominal
                    end
                end
                for k,v in pairs(card.ability.extra.consumed_cards) do
                    v.ability.perma_bonus = v.ability.perma_bonus + card.ability.extra.bonus_chips
                end

                return {
                    message = '+'..card.ability.extra.bonus_chips,
                    colour = G.C.CHIPS
                }

            end

        end

        if context.selling_self and #card.ability.extra.consumed_cards > 0 then

            play_sound('aether_consumerelease')

            for k,v in pairs(card.ability.extra.consumed_cards) do

                G.E_MANAGER:add_event(Event({
                    func = function()
                        consumedcard = copy_card(v)
                        consumedcard:add_to_deck()
                        table.insert(G.playing_cards, consumedcard)
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        if #G.hand.cards > 0 then
                            G.hand:emplace(consumedcard)
                        else
                            G.deck:emplace(consumedcard)
                        end
                        SMODS.recalc_debuff(consumedcard)
                        card:juice_up(0.3,0.5)
                        consumedcard:start_materialize({G.C.WHITE, G.C.CONSUMED}, false, 5)
                        return true
                    end,
                    blocking = true
                }))
                delay(0.2)

            end

            card:start_dissolve({G.C.CONSUMED, G.C.WHITE, G.C.WHITE}, true, 5)

        end

	end,

    update = function(self, card, context)

        card.ability.extra.bonus_chips_visible = 0

        if G.play then

            if #G.play.cards > 0 then

                for k,v in pairs(G.play.cards) do

                    if SMODS.has_enhancement(v, 'm_stone') then
                        card.ability.extra.bonus_chips_visible = card.ability.extra.bonus_chips_visible + v.ability.bonus
                    elseif not SMODS.has_enhancement(v, 'm_aether_fleshstone') then
                        card.ability.extra.bonus_chips_visible = card.ability.extra.bonus_chips_visible + v.base.nominal
                    end

                end

            else

                for k,v in pairs(G.hand.highlighted) do

                    if SMODS.has_enhancement(v, 'm_stone') then
                        card.ability.extra.bonus_chips_visible = card.ability.extra.bonus_chips_visible + v.ability.bonus
                    elseif not SMODS.has_enhancement(v, 'm_aether_fleshstone') then
                        card.ability.extra.bonus_chips_visible = card.ability.extra.bonus_chips_visible + v.base.nominal
                    end

                end

            end

        end

    end

}

SMODS.Joker {
	key = 'flushifyjoker',
	loc_txt = {
		name = 'Flushify Joker',
		text = {
            'Turns any played {C:attention}Straight{}, {C:attention}Full House{},',
            'or {C:attention}Five of a Kind{} into its',
            '{C:flush}Flush Variant{} and converts all',
            'scored cards into {C:attention}Wild Cards'
		}
	},
	config = {unlocked = true, discovered = true, extra = { scored_cards = 0, triggers = 0 } },
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
		return { vars = {  } }
	end,
	rarity = 3,
	atlas = 'aetherjokers',
	pos = { x = 3, y = 1 },
	cost = 8,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if context.before and (next(context.poker_hands['Straight']) or next(context.poker_hands['Full House']) or next(context.poker_hands['Five of a Kind'])) and not next(context.poker_hands['Straight Flush']) and not next(context.poker_hands['Flush House']) and not next(context.poker_hands['Flush Five']) and not context.blueprint then

            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(0.3,0.5)
                    ease_colour(G.C.UI_CHIPS, G.C.FLUSH, 0.2)
                    ease_colour(G.C.UI_MULT, G.C.FLUSH, 0.2)
                    play_sound('aether_flushify')
                    return true
                end,
                blocking = true
            }))
            
            if next(context.poker_hands['Straight']) then
                G.GAME.old_poker_hand = 'Straight'
                G.GAME.new_poker_hand = 'Straight Flush'
            elseif next(context.poker_hands['Full House']) then
                G.GAME.old_poker_hand = 'Full House'
                G.GAME.new_poker_hand = 'Flush House'
            elseif next(context.poker_hands['Five of a Kind']) then
                G.GAME.old_poker_hand = 'Five of a Kind'
                G.GAME.new_poker_hand = 'Flush Five'
            end

            context.poker_hands[G.GAME.new_poker_hand] = context.poker_hands[G.GAME.old_poker_hand]
            context.scoring_hand = G.GAME.hands[G.GAME.new_poker_hand][1]

            update_hand_text({delay = 0}, {chips = G.GAME.hands[G.GAME.new_poker_hand].chips, mult = G.GAME.hands[G.GAME.new_poker_hand].mult, handname = '"'..G.GAME.new_poker_hand..'"'})

            for k,v in pairs(G.play.cards) do

                if not SMODS.has_enhancement(v, 'm_wild') and not v.debuff then
                    SMODS.debuff_card(v, 'prevent_debuff', 'flushifyjoker')
                end

            end

            for k,v in pairs(G.jokers.cards) do

                if v.ability.type == 'Flush' or (G.GAME.new_poker_hand == 'Straight Flush' and v.ability.type == 'Straight Flush') then

                    v.force_trigger = true

                end

            end

            card.ability.extra.triggers = 1

            return {
                message = 'Flushify!',
                colour = G.C.FLUSH
            }

        end

        if context.final_scoring_step and card.ability.extra.triggers >= 1 then

            card.ability.extra.triggers = 0

            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_colour(G.C.UI_CHIPS, G.C.CHIPS, 1)
                    ease_colour(G.C.UI_MULT, G.C.MULT, 1)
                    return true
                end,
                blocking = true
            }))

            flushified_card = 1

            for k,v in pairs(G.play.cards) do

                if not SMODS.has_enhancement(v, 'm_wild') and not SMODS.has_enhancement(v, 'm_stone') and not SMODS.has_enhancement(v, 'm_aether_sleeved') and not v.debuff then

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up(0.3,0.5)
                            v:flip()
                            return true
                        end,
                        blocking = true
                    }))
                    delay(0.2)
                    v:set_ability(G.P_CENTERS.m_wild, nil, true)
                    SMODS.debuff_card(v, 'reset', 'flushifyjoker')
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up(0.3,0.5)
                            v:flip()
                            v:start_materialize({G.C.FLUSH}, true, 1)
                            play_sound('aether_flushify'..flushified_card)
                            flushified_card = flushified_card + 1
                            return true
                        end,
                        blocking = true
                    }))
                    delay(0.1)

                end

            end

        end

    end
}

SMODS.Joker {
	key = 'turnstile',
	config = {unlocked = true, discovered = true, extra = {triggers = 0} },
	loc_vars = function(self, info_queue, card)
        if G.GAME.inverted then
            return { key = 'j_aether_turnstile_inverted' }
        end
	end,
	rarity = 4,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 8,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if (#G.discard.cards == 0 or #G.play.cards > 0 or context.end_of_round) and G.GAME.inverted then
            G.GAME.inverted = false
            ease_background_colour{new_colour = G.C.RED}
            play_sound('whoosh1')
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_background_colour_blind()
                    return true
                end,
                blocking = true
            }))
        end

        if context.end_of_round then
            card.ability.extra.triggers = 0
        end

        if context.pre_discard then

            if G.GAME.current_round.discards_left == 1 and not G.GAME.inverted and not hook and card.ability.extra.triggers == 0 then

                card.ability.extra.triggers = 1
                G.GAME.inverted = true

                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
                G.GAME.current_round.discards_used = G.GAME.current_round.discards_used - 1

                play_sound('aether_invertedchips1')
                play_sound('whoosh2')

            end

            if G.GAME.inverted and #G.discard.cards > 0 then
                for i = 1, #G.hand.highlighted do
                    G.E_MANAGER:add_event(Event({
                        func = function()

                            if #G.discard.cards > 0 then
                                drawn_card = G.discard.cards[#G.discard.cards]
                                G.discard:remove_card(drawn_card)
                                G.hand:emplace(drawn_card)
                                play_sound('aether_invertedcard1')
                                drawn_card.ability.discarded = false
                            end

                            return true
                        end,
                        blocking = true
                    }))
                    delay(0.2)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:sort()
                            return true
                        end,
                        blocking = true
                    }))
                end
            end

        end

    end
}

SMODS.Joker {
	key = 'fleshjoker',
	config = {unlocked = true, discovered = true, extra = { infect_odds = 10, infected_cards = 0, total_cards = 52, infected_jokers = 0, total_jokers = 1, card_mult = 0.1, joker_mult = 0.5 } },
	loc_vars = function(self, info_queue, card)
        if card.area == G.jokers then
            return { vars = { G.GAME.probabilities.normal, card.ability.extra.infect_odds, card.ability.extra.infected_cards, card.ability.extra.total_cards, card.ability.extra.infected_jokers, card.ability.extra.total_jokers, 1 + (card.ability.extra.infected_cards * card.ability.extra.card_mult) + (card.ability.extra.infected_jokers * card.ability.extra.joker_mult) } }
        else
            return { key = 'j_aether_fleshjoker_shop' }
        end
	end,
	rarity = 'aether_flesh',
	atlas = 'aetherjokers',
	pos = { x = 2, y = 0 },
	cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
	calculate = function(self, card, context)

        if context.joker_main then

            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('aether_fleshxmult')
                    return true
                end,
                blocking = true
            }))

            return {
                xmult = 1 + (card.ability.extra.infected_cards * card.ability.extra.card_mult) + (card.ability.extra.infected_jokers * card.ability.extra.joker_mult),
            }

        end

        if context.final_scoring_step and not context.blueprint then

            for k,v in pairs(G.play.cards) do

                if not SMODS.has_enhancement(v, 'm_aether_flesh') and not SMODS.has_enhancement(v, 'm_aether_fleshstone') and not SMODS.has_enhancement(v, 'm_aether_sleeved') then

                    if SMODS.has_enhancement(v, 'm_stone') then
                        v:set_ability(G.P_CENTERS.m_aether_fleshstone, nil, true)
                    else
                        v:set_ability(G.P_CENTERS.m_aether_flesh, nil, true)
                    end
                    card_eval_status_text(v, 'extra', nil, nil, nil, {message = 'INFECT', sound = 'aether_fleshinfect'..math.random(1, 4), colour = G.C.FLESH})
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up(0.3,0.5)
                            v:start_materialize({G.C.FLESH}, true, 1)
                            return true
                        end,
                        blocking = true
                    }))
                    delay(0.1)

                end

            end

            if card.ability.extra.infected_cards == #G.playing_cards then

                for k,v in pairs(G.jokers.cards) do

                    if pseudorandom('fleshjokerinfect') < G.GAME.probabilities.normal / card.ability.extra.infect_odds and v.ability.name ~= card.ability.name then

                        v.getting_sliced = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = 'INFECT', sound = 'aether_fleshinfect'..math.random(1, 4), colour = G.C.FLESH})
                        G.E_MANAGER:add_event(Event({func = function()
                            G.GAME.joker_buffer = 0
                            v:juice_up(0.3,0.5)
                            v:start_dissolve({G.C.FLESH}, true, 1)
                            SMODS.add_card({
                                key = 'j_aether_fleshjoker',
                                no_edition = true,
                                edition = v.edition,
                                seal = v.seal
                            })
                            play_sound('aether_fleshinfectjoker'..math.random(1, 2))
                        return true end }))

                    end

                end

            end

        end

    end,

    update = function(self, card, context)

        if G.playing_cards then

            card.ability.extra.infected_cards = 0
            card.ability.extra.total_cards = #G.playing_cards

            for k,v in pairs(G.playing_cards) do

                if SMODS.has_enhancement(v, 'm_aether_flesh') or SMODS.has_enhancement(v, 'm_aether_fleshstone') then

                    card.ability.extra.infected_cards = card.ability.extra.infected_cards + 1

                end

            end

            card.ability.extra.infected_jokers = 0
            card.ability.extra.total_jokers = #G.jokers.cards

            for k,v in pairs(G.jokers.cards) do

                if v.ability.name == card.ability.name then

                    card.ability.extra.infected_jokers = card.ability.extra.infected_jokers + 1

                end

            end

        end

    end,

    add_to_deck = function(self, card, from_debuff)

        if not from_debuff then

            play_sound('aether_fleshspawn')

        end

    end,
}

SMODS.Enhancement {
    key = 'sleeved',
	loc_txt = {
		name = 'Sleeved Card',
		text = {
			'Gets {C:attention}destroyed{} when {C:blue}played{},',
            '{C:red}discarded{}, at {C:attention}end of round{},',
            'or if {C:tarot}modified{}',
            '{C:inactive}(Only created by {C:attention}Jokers{C:inactive})',
		}
	},
    atlas = 'aetherenhancers',
	pos = { x = 1, y = 0 },
    config = { extra = {triggers = 0} },
    weight = 0,
    in_pool = function(self)
        return false
    end,
    overrides_base_rank = true,
    calculate = function(self, card, context)

        if ((context.destroy_card and context.cardarea ~= G.hand) or context.end_of_round or context.pre_discard) and not context.repetition and card.ability.extra.triggers == 0 then

            delete = false

            if context.pre_discard then
                for k,v in pairs(G.hand.highlighted) do
                    if card == v then
                        delete = true
                    end
                end
            end

            if (context.destroy_card and context.cardarea ~= G.hand) or context.end_of_round then
                delete = true
            end

            if delete then

                card.ability.extra.triggers = card.ability.extra.triggers + 1

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve({G.C.BLACK, G.C.SLEEVED, G.C.SLEEVED}, false, 5)
                        return true
                    end,
                    blocking = true
                }))

                return {
                    message = 'Sleeved!',
                    colour = G.C.SLEEVED,
                    sound = 'highlight1',
                    remove = true
                }

            end

        end

    end,
}

SMODS.Enhancement {
    key = 'counterfeit',
	loc_txt = {
		name = 'Counterfeit Card',
		text = {
			'{C:attention}Destroyed{} in {C:attention}#1#{} scores',
		}
	},
    atlas = 'aetherenhancers',
	pos = { x = 3, y = 0 },
    config = { extra = { uses_left = 3, triggers = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses_left } }
	end,
    weight = 0,
    in_pool = function(self)
        return false
    end,
    overrides_base_rank = true,
    calculate = function(self, card, context)

        if context.main_scoring and context.cardarea == G.play then

            card.ability.extra.uses_left = card.ability.extra.uses_left - 1
            if card.ability.extra.uses_left > 0 then
                return {
                    message = card.ability.extra.uses_left..'!',
                    sound = 'cardSlide2',
                    colour = G.C.RED
                }
            elseif card.ability.extra.uses_left == 0 then
                return {
                    message = 'Spent!',
                    sound = 'cardSlide2',
                    colour = G.C.RED
                }
            end

        end

        if context.destroy_card and card.ability.extra.uses_left <= 0 and context.cardarea ~= G.hand and card.ability.extra.triggers == 0 then

            card.ability.extra.triggers = card.ability.extra.triggers + 1

            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve({G.C.BLACK, G.C.RED, G.C.RED}, true, 5)
                    return true
                end,
                blocking = true
            }))

            return {
                message = 'Degraded!',
                colour = G.C.RED,
                sound = 'crumple'..math.random(1,5),
                remove = true
            }

        end

    end,
}

SMODS.Enhancement {
    key = 'flesh',
	loc_txt = {
		name = 'Flesh Card',
		text = {
            '{C:mult}+#1#{} mult',
			'{C:green}#2# in #3#{} chance to {X:flesh,C:white}SPREAD{} to each',
            'card held in hand at end of round',
            '{C:green}#1# in #4#{} chance to {X:flesh,C:white}DECAY{} at',
            'end of round, {X:flesh,C:white}PERISHES{} if {C:attention}2',
		}
	},
    atlas = 'aetherenhancers',
	pos = { x = 2, y = 0 },
    config = { extra = { mult = 'rank', infect_odds = 3, perish_odds = 5, triggers = 0 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, G.GAME.probabilities.normal, card.ability.extra.infect_odds, card.ability.extra.perish_odds } }
	end,
    weight = 0,
    in_pool = function(self)
        return false
    end,
    overrides_base_rank = true,
    calculate = function(self, card, context)

        if context.main_scoring and context.cardarea == G.play then

            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                colour = G.C.MULT,
                sound = 'aether_fleshmult'
            }

        end

        if context.end_of_round and context.cardarea == G.hand and #G.hand.cards > 0 then

            for k,v in pairs(G.hand.cards) do

                if pseudorandom('fleshinfect') < G.GAME.probabilities.normal / card.ability.extra.infect_odds and not SMODS.has_enhancement(v, 'm_aether_flesh') and not SMODS.has_enhancement(v, 'm_aether_fleshstone') and not SMODS.has_enhancement(v, 'm_aether_sleeved') then

                    if SMODS.has_enhancement(v, 'm_stone') then
                        v:set_ability(G.P_CENTERS.m_aether_fleshstone, nil, true)
                    else
                        v:set_ability(G.P_CENTERS.m_aether_flesh, nil, true)
                    end
                    card_eval_status_text(v, 'extra', nil, nil, nil, {message = 'INFECT', sound = 'aether_fleshinfect'..math.random(1, 4), colour = G.C.FLESH})
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up(0.3,0.5)
                            card:juice_up(0.3,0.5)
                            v:start_materialize({G.C.FLESH}, true, 1)
                            return true
                        end,
                        blocking = true
                    }))

                end

            end

        end

        if ((context.destroy_card and context.cardarea ~= G.hand) or (context.individual and context.cardarea == G.hand) or context.end_of_round or context.pre_discard) and pseudorandom('fleshperish') < G.GAME.probabilities.normal / card.ability.extra.perish_odds then

            delete = false

            if context.main_scoring then

                card.ability.extra.triggers = 0

            end

            if context.pre_discard then
                for k,v in pairs(G.hand.highlighted) do
                    if card == v then
                        delete = true
                    end
                end
            end

            if (context.destroy_card and context.cardarea ~= G.hand) or (context.individual and context.cardarea == G.hand) or context.end_of_round then
                delete = true
            end

            if card.ability.extra.triggers == 0 and delete then

                card.ability.extra.triggers = card.ability.extra.triggers + 1

                if card.base.id == 2 then

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:start_dissolve({G.C.FLESH}, false, 5)
                            return true
                        end,
                        blocking = true
                    }))

                    return {
                        message = 'PERISH',
                        colour = G.C.FLESH,
                        sound = 'aether_fleshperish'..math.random(1, 2),
                        remove = true
                    }

                else

                    return {
                        message = 'DECAY',
                        colour = G.C.FLESH,
                        func = function()
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.modify_rank(card, -1)
                                    return true
                                end,
                                blocking = true
                            }))

                        end,
                        sound = 'aether_fleshdecay'..math.random(1, 6),
                    }

                end

            end

        end

    end,

    update = function(self, card, context)

        card.ability.extra.mult = card.base.nominal

    end

}

SMODS.Enhancement {
    key = 'fleshstone',
	loc_txt = {
		name = 'Flesh Mass',
		text = {
            '{X:mult,C:white}+X#1#{} per {C:flesh}Flesh Card{} scored',
            '{X:flesh,C:white}PERISHES{} and {X:flesh,C:white}FEEDS{} all',
            'played {C:flesh}Flesh Cards{} when scored',
            '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
		}
	},
    atlas = 'aetherenhancers',
	pos = { x = 2, y = 0 },
    config = { extra = { xmult_mod = 0.5, xmult = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult } }
	end,
    weight = 0,
    in_pool = function(self)
        return false
    end,
    overrides_base_rank = true,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    calculate = function(self, card, context)

        if context.main_scoring and context.cardarea == G.play then

            for k,v in pairs(context.scoring_hand) do

                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod

                if v ~= card and SMODS.has_enhancement(v, 'm_aether_flesh') then
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = '+X'..card.ability.extra.xmult_mod, sound = 'aether_fleshinfect'..math.random(1, 4), colour = G.C.MULT})
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up(0.3,0.5)
                            return true
                        end,
                        blocking = true
                    }))
                end
                delay(0.1)

            end

            return {
                xmult = card.ability.extra.xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
                colour = G.C.MULT,
                sound = 'aether_fleshxmult'
            }

        end

        if context.destroy_card and context.cardarea ~= G.hand and not context.repetition then

            for k,v in pairs(G.play.cards) do

                local cardrank = v.base.id

                for i = 1, math.ceil(pseudorandom('fleshfeed') * 3) do

                    if v ~= card and cardrank < 14 and SMODS.has_enhancement(v, 'm_aether_flesh') then

                        cardrank = cardrank + 1
                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = 'FED', sound = 'aether_fleshinfect'..math.random(1, 4), colour = G.C.FLESH})

                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.modify_rank(v, 1)
                                card:juice_up(0.3,0.5)
                                v:juice_up(0.3,0.5)
                                return true
                            end,
                            blocking = true
                        }))

                    end

                end

            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve({G.C.BLACK, G.C.SLEEVED, G.C.SLEEVED}, false, 5)
                    return true
                end,
                blocking = true
            }))

            return {
                message = 'PERISH',
                colour = G.C.FLESH,
                sound = 'aether_fleshperish'..math.random(1, 2),
                remove = true
            }

        end

    end,

}

G.C.FLESH = HEX('8A102A')

SMODS.Rarity{
    key = 'flesh',
    loc_txt = {
        name = 'Rare?'
    },
    pools = {
        ['Joker'] = true,
    },
    badge_colour = G.C.FLESH,
    default_weight = 0.001,
}

SMODS.Back{
    name = 'Aether Deck',
    key = 'aetherdeck',
    atlas = 'aetherenhancers',
    pos = {x = 0, y = 0},
    config = {unlocked = true, discovered = true, extra = {
        aether_jokers = {
            [1] = {
                'drugtest',
                'palettejoker',
                'hailmary',
                'eleventhhour',
            },
            [2] = {
                'backseatjoker',
                'divisiblejoker',
                'stopcard',
                'tennisjoker',
                'sleevedjoker',
                'overkilljoker',
                'counterfeitjoker',
            },
            [3] = {
                'handyjoker',
                'holdingjoker',
                'flushifyjoker',
            },
            [4] = {
                'turnstile',
            },
            ['special'] = {
                'fleshjoker',
            },
        },
        replace_odds = 4,
        special_odds = 20
    }},
    loc_txt = {
        name = 'Aether Deck',
        text ={
            'Start with a random',
            '{C:red}Rare {C:aether}Aether Joker',
            '{C:aether}Aether Jokers{} have a',
            '{C:green}#1# in #2#{} chance of replacing',
            'a {C:attention}Joker{} of the same rarity',
            'in shops'
        },
    },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, self.config.extra.replace_odds } }
	end,
    apply = function(self, back)

        selected_joker = math.random(#self.config.extra.aether_jokers[3])

        if selected_joker % 1 > 0.5 then
            selected_joker = math.ceil(selected_joker)
        else
            selected_joker = math.floor(selected_joker)
            if selected_joker < 1 then selected_joker = 1 end
        end

        G.E_MANAGER:add_event(Event({
            func = function()

                SMODS.add_card({
                    key = 'j_aether_'..self.config.extra.aether_jokers[3][selected_joker]
                })
                play_sound('aether_joker3')
                return true

            end
        }))

    end,

    calculate = function(self, back, context)

        if context.starting_shop then

            for k1,v1 in pairs(G.shop_jokers.cards) do

                if v1.config.center.rarity == 1 or v1.config.center.rarity == 2 or v1.config.center.rarity == 3 and pseudorandom('aetherdeck') < G.GAME.probabilities.normal / self.config.extra.replace_odds then

                    if pseudorandom('aetherdeckspecial') < G.GAME.probabilities.normal / self.config.extra.special_odds then
                        joker_rarity = 'special'
                    else
                        joker_rarity = v1.config.center.rarity
                    end

                    selected_joker = pseudorandom('aetherdeckjoker') * #self.config.extra.aether_jokers[joker_rarity]

                    if selected_joker % 1 > 0.5 then
                        selected_joker = math.ceil(selected_joker)
                    else
                        selected_joker = math.floor(selected_joker)
                        if selected_joker < 1 then selected_joker = 1 end
                    end

                    local has_joker = false

                    for k2,v2 in pairs(G.jokers.cards) do
                    
                        if v1.config.center.key == 'j_aether_'..self.config.extra.aether_jokers[joker_rarity][selected_joker] then
                            has_joker = true
                        end

                    end

                    if not has_joker then

                        G.E_MANAGER:add_event(Event({
                            func = function()

                                v1:remove()
                                local new_joker = SMODS.add_card({
                                    key = 'j_aether_'..self.config.extra.aether_jokers[joker_rarity][selected_joker],
                                    area = G.shop_jokers
                                })
                                create_shop_card_ui(new_joker, 'Joker', G.shop_jokers)
                                new_joker.states.visible = false
                                new_joker:start_materialize({G.C.AETHER}, false, 1)
                                play_sound('aether_joker'..joker_rarity)

                                return true

                            end
                        }))

                        break

                    end

                end

            end

        end
        
    end
}