--- STEAMODDED HEADER
--- MOD_NAME: Aether Jokers
--- MOD_ID: AetherJokers
--- MOD_AUTHOR: [BustyCatbot]
--- MOD_DESCRIPTION: Adds a few misc jokers with unique mechanics.
--- LOADER_VERSION_GEQ: 1.0.0
--- BADGE_COLOR: a040ff
--- PREFIX: aether

local config = SMODS.current_mod.config
SMODS.optional_features.cardareas.deck = true

aether_jokers = {
    [1] = {
        'drugtest',
        'palette',
        'hailmary',
        'eleventhhour',
    },
    [2] = {
        'backseat',
        'divisible',
        'stopcard',
        'tennis',
        'sleevedjoker',
        'overkill',
        'counterfeitjoker',
    },
    [3] = {
        'handy',
        'holding',
        'flushify',
        'levelup',
    },
    [4] = {
        'fleshjoker',
        'turnstile',
    },
}

if not config.joker then config.joker = {} end

for i = 1, #aether_jokers do

    for k,v in pairs(aether_jokers[i]) do

        if not config.joker[v] then config.joker[v] = {} end

    end

end

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

SMODS.Atlas {
	key = 'aetherconsumeables',
	path = 'AetherConsumeables.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'aetherboosters',
	path = 'AetherBoosters.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'aethervouchers',
	path = 'AetherVouchers.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'aethersuitslc',
	path = 'AetherSuitsLC.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'aethersuitshc',
	path = 'AetherSuitsHC.png',
	px = 71,
	py = 95
}

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicmain',
    path = 'musicmain.ogg',
    sync = true,
    select_music_track = function()
        if config.music then
            return true and 1 or false
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicmaininvert',
    path = 'musicmaininvert.ogg',
    sync = true,
    select_music_track = function()
        if config.music and G.GAME.inverted then
            return true and 10 or false
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicboss',
    path = 'musicboss.ogg',
    sync = true,
    select_music_track = function()
        if G.GAME.blind then
            if config.music and G.GAME.blind.boss and not G.GAME.inverted then
                return true and 10 or false
            end
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicbossinvert',
    path = 'musicbossinvert.ogg',
    sync = true,
    select_music_track = function()
        if G.GAME.blind then
            if config.music and G.GAME.blind.boss and G.GAME.inverted then
                return true and 10 or false
            end
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicshop',
    path = 'musicshop.ogg',
    sync = true,
    select_music_track = function()
        if config.music and G.shop and not G.shop.REMOVED then
            return true and 8 or false
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicbooster',
    path = 'musicbooster.ogg',
    sync = true,
    select_music_track = function()
        if config.music and G.booster_pack and not G.booster_pack.REMOVED then
            return true and 9 or false
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicboosterplanet',
    path = 'musicboosterplanet.ogg',
    sync = true,
    select_music_track = function()
        if SMODS.OPENED_BOOSTER then
            if config.music and G.booster_pack and not G.booster_pack.REMOVED and SMODS.OPENED_BOOSTER.ability.name:find('Celestial') then
                return true and 10 or false
            end
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicboostertarot',
    path = 'musicboostertarot.ogg',
    sync = true,
    select_music_track = function()
        if SMODS.OPENED_BOOSTER then
            if config.music and G.booster_pack and not G.booster_pack.REMOVED and SMODS.OPENED_BOOSTER.ability.name:find('Arcana') then
                return true and 10 or false
            end
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicboosterspectral',
    path = 'musicboosterspectral.ogg',
    sync = true,
    select_music_track = function()
        if SMODS.OPENED_BOOSTER then
            if config.music and G.booster_pack and not G.booster_pack.REMOVED and SMODS.OPENED_BOOSTER.ability.name:find('Spectral') then
                return true and 10 or false
            end
        end
    end
})

SMODS.Sound({
    vol = 1,
    pitch = 1,
    key = 'musicboosterjoker',
    path = 'musicboosterjoker.ogg',
    sync = true,
    select_music_track = function()
        if SMODS.OPENED_BOOSTER then
            if config.music and G.booster_pack and not G.booster_pack.REMOVED and SMODS.OPENED_BOOSTER.ability.name:find('Buffoon') then
                return true and 10 or false
            end
        end
    end
})

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
    key = 'joker4',
    path = 'joker4.ogg',
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
        if G.GAME.blind and not G.GAME.blind.config.blind.boss and not config.music then
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
        if G.GAME.blind and G.GAME.blind.config.blind.boss and not config.music then
            return G.GAME.inverted and 10 or false
        end
    end
})

local base_loc_colour = loc_colour
function loc_colour(_c, _default)
    local ret = base_loc_colour(_c, _default)

    G.C.AETHER = HEX('8000FF')
    G.ARGS.LOC_COLOURS['aether'] = G.C.AETHER

    G.C.FLUSH = HEX('50D0C0')
    G.ARGS.LOC_COLOURS['flush'] = G.C.FLUSH

    G.C.FLESH = HEX('8A102A')
    G.ARGS.LOC_COLOURS['flesh'] = G.C.FLESH

    G.C.CONSUMED = HEX('FF70B0')
    G.ARGS.LOC_COLOURS['consumed'] = G.C.CONSUMED

    G.C.SLEEVED = HEX('FF8050')
    G.ARGS.LOC_COLOURS['sleeved'] = G.C.SLEEVED

    G.C.COUNTERFEIT = HEX('BAC06A')
    G.ARGS.LOC_COLOURS['counterfeit'] = G.C.COUNTERFEIT

    G.C.SECONDARY_SET.Buff = HEX('C080FF')
    G.ARGS.LOC_COLOURS['buff'] = G.C.SECONDARY_SET.Buff

    G.C.HELD = HEX('D07070')
    G.ARGS.LOC_COLOURS['held'] = G.C.HELD

    G.ARGS.LOC_COLOURS['aetherspades'] = G.C.AETHERSPADES

    G.ARGS.LOC_COLOURS['aetherhearts'] = G.C.AETHERHEARTS

    G.ARGS.LOC_COLOURS['aetherclubs'] = G.C.AETHERCLUBS

    G.ARGS.LOC_COLOURS['aetherdiamonds'] = G.C.AETHERDIAMONDS

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
                    chips = self.ability.t_chips
                }
            end

            if self.ability.t_mult > 0 then
                return {
                    mult = self.ability.t_mult
                }
            end

            if self.ability.Xmult > 0 then
                return {
                    xmult = self.ability.x_mult
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

        if self.ability.effect == 'Enhance' then

            if SMODS.has_enhancement(v, 'm_aether_counterfeit') then
                card_eval_status_text(v, 'extra', nil, nil, nil, {message = 'Laundered!', sound = 'highlight1', colour = G.C.COUNTERFEIT})
                ease_dollars(v.ability.extra.uses_left)
            end

        end

    end

    return ret
end

local base_can_discard = G.FUNCS.can_discard
G.FUNCS.can_discard = function(e)
    local ret = base_can_discard(e)

        if next(SMODS.find_card('j_aether_turnstile')) then
            if (G.GAME.inverted or (SMODS.find_card('j_aether_turnstile') and SMODS.find_card('j_aether_turnstile')[1].ability.extra.triggers == 0 and G.GAME.current_round.discards_left <= 0)) and #G.hand.highlighted > 0 then
                e.config.colour = G.C.BLUE
                e.config.button = 'inverted_discard_cards_from_highlighted'
            end
        end

    return ret
end

G.FUNCS.inverted_discard_cards_from_highlighted = function(e, hook)

    if G.GAME.current_round.discards_left <= 0 then

        SMODS.find_card('j_aether_turnstile')[1].ability.extra.triggers = 1
        G.GAME.inverted = true
        play_sound('aether_invertedchips1')

    end

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
                ease_dollars(G.GAME.modifiers.discard_cost)
            end
            if G.GAME.current_round.discards_left < G.GAME.round_resets.discards then
                ease_discard(1)
                play_sound('aether_invertedchips1')
            end
            if G.GAME.current_round.discards_used > 0 then
                G.GAME.current_round.discards_used = G.GAME.current_round.discards_used - 1
            end
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

local base_cardarea_draw = CardArea.draw
function CardArea:draw()
    local ret = base_cardarea_draw(self)

        if self == G.aether_buffs then

            local desiredw = G.CARD_W * 2 * 2/3
            local desiredx = G.TILE_W - G.CARD_W * 2 * 2/3
            local desiredy = 1.3*G.consumeables.T.h
            local xmod = 2/3
            local hovermod = 1
            local fraction = 0.1

            local hovered = false

            if SMODS.OPENED_BOOSTER then
                if G.booster_pack and not G.booster_pack.REMOVED and (SMODS.OPENED_BOOSTER.ability.name:find('Buff Pack') or SMODS.OPENED_BOOSTER.ability.name:find('Standard')) then
                    hovered = true
                end
            end

            if (self.states.hover.is or G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.HAND_PLAYED or G.STATE == G.STATES.DRAW_TO_HAND or (#self.cards < 5 and G.STATE ~= G.STATES.BLIND_SELECT and not G.shop_jokers)) then
                hovered = true
            end

            for k,v in pairs(self.cards) do
                if v.states.hover.is or v.states.drag.is or v.highlighted then
                    hovered = true
                    hovermod = 1.1
                end
            end

            if hovered then
                desiredw = G.CARD_W * math.max(math.min(#self.cards * xmod * hovermod, 7.5), 2.5)
                desiredx = G.TILE_W - G.CARD_W * math.max(math.min((#self.cards * xmod) * hovermod, 7.5), 2.5)
                fraction = 0.2
            end

            if #self.cards <= 0 then
                desiredw = G.CARD_W * 0.1
                desiredx = G.TILE_W
            end

            self.T.w = self.T.w + (desiredw - self.T.w) * fraction
            self.T.x = self.T.x + (desiredx - self.T.x) * fraction
            self.T.y = self.T.y + (desiredy - self.T.y) * fraction / 2

        end

    return ret
end


local base_main_menu = Game.main_menu
Game.main_menu = function(change_context)
    local ret = base_main_menu(change_context)

    G.buffsprite = Sprite(0,0,G.CARD_W,G.CARD_H,G.ASSET_ATLAS['aether_aetherconsumeables'], { x = 4, y = 0 })

    return ret
end

local base_click = Card.click
function Card:click()
    local ret = base_click(self)

        if G.aetherjokerdisplay then

            for i = 1, #aether_jokers do

                for k,v in pairs(aether_jokers[i]) do

                    if self.config.center_key == 'j_aether_'..v and self.area == G.aetherjokerdisplay[i] then

                        if config.joker[v].disabled then
                            config.joker[v].disabled = false
                            self:sparkle({time = 1, colors = {G.C.GREEN}}, true, false, 'tarot1')
                        else
                            config.joker[v].disabled = true
                            self:sparkle({time = 1, colors = {G.C.RED}}, true, false, 'tarot1')
                        end
                        self.highlighted = false
                        return

                    end

                end

            end

        end

    return ret
end

local base_update = Card.update
function Card:update(dt)
    local ret = base_update(self, dt)

        if G.aetherjokerdisplay then
            for i = 1, #aether_jokers do
                for k,v in pairs(aether_jokers[i]) do
                    if self.config.center_key == 'j_aether_'..v and self.area == G.aetherjokerdisplay[i] then
                        self.greyed = config.joker[v].disabled
                    end
                end
            end
        end

    return ret
end

function Card:sparkle(settings, juice, silent, sound)

    if self.children.particles then
        self.children.particles:remove()
        self.children.particles = nil
    end

    local sparkle_time = 0.6*(settings.time or 1)
    if settings.colors == 'set' then
        settings.colors = G.C.SECONDARY_SET[self.ability.set]
    end
    if juice then self:juice_up() end

    self.children.particles = Particles(0, 0, 0,0, {
        timer_type = 'TOTAL',
        timer = 0.025*sparkle_time,
        scale = (settings.scale or 0.1),
        speed = (settings.speed or 4),
        lifespan = 0.7*sparkle_time,
        attach = self,
        colours = settings.colors,
        fill = true
    })

    if not silent then 
        G.E_MANAGER:add_event(Event({
            blockable = false,
            func = function()
                play_sound(sound, 1, 0.75)
                return true
            end
        }))
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  0.5*sparkle_time,
        func = function()
            if self.children.particles then
                self.children.particles.max = 0
            end
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  1.05*sparkle_time,
        func = function()
            if self.children.particles then
                self.children.particles:remove()
                self.children.particles = nil
            end 
            return true
        end
    }))

end

G.C.AETHERSPADES = HEX('5E579C')
G.C.AETHERHEARTS = HEX('EC2D33')
G.C.AETHERCLUBS = HEX('217C75')
G.C.AETHERDIAMONDS = HEX('D66B1B')

SMODS.DeckSkin {
    key = 'aetherspades',
    suit = 'Spades',
    loc_text = 'Aether Spades',
    palettes = {
        {
            key = 'lc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            atlas = 'aether_aethersuitslc',
            pos_style = 'deck',
            colour = G.C.AETHERSPADES,
        },
        {
            key = 'hc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            atlas = 'aether_aethersuitshc',
            pos_style = 'deck',
            colour = G.C.AETHERSPADES,
        }
    }
}

SMODS.DeckSkin {
    key = 'aetherhearts',
    suit = 'Hearts',
    loc_text = 'Aether Hearts',
    palettes = {
        {
            key = 'lc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            atlas = 'aether_aethersuitslc',
            pos_style = 'deck',
            colour = G.C.AETHERHEARTS,
        },
        {
            key = 'hc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            atlas = 'aether_aethersuitshc',
            pos_style = 'deck',
            colour = G.C.AETHERHEARTS,
        }
    }
}

SMODS.DeckSkin {
    key = 'aetherclubs',
    suit = 'Clubs',
    loc_text = 'Aether Clubs',
    palettes = {
        {
            key = 'lc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            atlas = 'aether_aethersuitslc',
            pos_style = 'deck',
            colour = G.C.AETHERCLUBS,
        },
        {
            key = 'hc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            atlas = 'aether_aethersuitshc',
            pos_style = 'deck',
            colour = G.C.AETHERCLUBS,
        }
    }
}

SMODS.DeckSkin {
    key = 'aetherdiamonds',
    suit = 'Diamonds',
    loc_text = 'Aether Diamonds',
    palettes = {
        {
            key = 'lc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            atlas = 'aether_aethersuitslc',
            pos_style = 'deck',
            colour = G.C.AETHERDIAMONDS,
        },
        {
            key = 'hc',
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            display_ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            atlas = 'aether_aethersuitshc',
            pos_style = 'deck',
            colour = G.C.AETHERDIAMONDS,
        }
    }
}

SMODS.DrawStep {
    key = 'buffrarity',
    order = 2,
    func = function(self)
        if not G.buffsprite then return nil end
        if self.config.center_key == 'c_aether_buffcard' then

            G.buffsprite.role.draw_major = self

            if self.ability.extra.cardtype ~= '' then

                local rarity = {
                    [1] = { x = 4, y = 0 },
                    [2] = { x = 0, y = 1 },
                    [3] = { x = 1, y = 1 },
                    [4] = { x = 2, y = 1 },
                }
                
                G.buffsprite:set_sprite_pos(rarity[self.ability.extra.rarity])

            end

            G.buffsprite:draw_shader('dissolve', nil, nil, nil, self.children.center)
            G.buffsprite:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)

        end
    end,
    conditions = { vortex = false, facing = 'front' }
}

SMODS.DrawStep {
    key = 'buffstat',
    order = 1,
    func = function(self)
        if not G.buffsprite then return nil end
        if self.config.center_key == 'c_aether_buffcard' then

            G.buffsprite.role.draw_major = self

            if self.ability.extra.cardtype ~= '' then

                local stat = {
                    ['chips'] = { x = 0, y = 0 },
                    ['mult'] = { x = 1, y = 0 },
                    ['xmult'] = { x = 2, y = 0 },
                    ['dollars'] = { x = 3, y = 0 },
                }
                
                G.buffsprite:set_sprite_pos(stat[self.ability.extra.stat])

            end

            G.buffsprite:draw_shader('dissolve', nil, nil, nil, self.children.center)

        end
    end,
    conditions = { vortex = false, facing = 'front' }
}

SMODS.DrawStep {
    key = 'buffcardtype',
    order = 3,
    func = function(self)
        if not G.buffsprite then return nil end
        if self.config.center_key == 'c_aether_buffcard' then

            G.buffsprite.role.draw_major = self

            if self.ability.extra.cardtype ~= '' then

                local cardtype = {
                    ['suit'] = {
                        ['Spades'] = { x = 2, y = 2 },
                        ['Hearts'] = { x = 3, y = 2 },
                        ['Clubs'] = { x = 4, y = 2 },
                        ['Diamonds'] = { x = 0, y = 3 },
                    },
                    ['rank'] = {
                        ['2'] = { x = 1, y = 3 },
                        ['3'] = { x = 2, y = 3 },
                        ['4'] = { x = 3, y = 3 },
                        ['5'] = { x = 4, y = 3 },
                        ['6'] = { x = 0, y = 4 },
                        ['7'] = { x = 1, y = 4 },
                        ['8'] = { x = 2, y = 4 },
                        ['9'] = { x = 3, y = 4 },
                        ['10'] = { x = 4, y = 4 },
                        ['Jack'] = { x = 0, y = 5 },
                        ['Queen'] = { x = 1, y = 5 },
                        ['King'] = { x = 2, y = 5 },
                        ['Ace'] = { x = 3, y = 5 },
                    },
                }
                
                G.buffsprite:set_sprite_pos(cardtype[self.ability.extra.cardtype][self.ability.extra.card])

            end

            G.buffsprite:draw_shader('dissolve', nil, nil, nil, self.children.center)

        end
    end,
    conditions = { vortex = false, facing = 'front' }
}

SMODS.DrawStep {
    key = 'buffcontext',
    order = 4,
    func = function(self)
        if not G.buffsprite then return nil end
        if self.config.center_key == 'c_aether_buffcard' then

            G.buffsprite.role.draw_major = self

            if self.ability.extra.cardtype ~= '' then

                local context = {
                    ['score'] = { x = 3, y = 1 },
                    ['discard'] = { x = 4, y = 1 },
                    ['held'] = { x = 0, y = 2 },
                    ['deck'] = { x = 1, y = 2 },
                }
                
                G.buffsprite:set_sprite_pos(context[self.ability.extra.context])

            end

            G.buffsprite:draw_shader('dissolve', nil, nil, nil, self.children.center)

        end
    end,
    conditions = { vortex = false, facing = 'front' }
}

SMODS.Joker {
	key = 'drugtest',
	loc_txt = {
		name = 'Drug Test',
		text = {
			'{C:money}+$#1#{} for every {C:attention}#2#{} scored',
            '{C:attention}Non-Enhanced{} cards',
            '{C:inactive}(Currently {C:attention}#3#{C:inactive}/#2# cards)'
		}
	},
	config = { extra = { cards = 3, scored_cards = 0, money_mod = 1 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.money_mod, card.ability.extra.cards, card.ability.extra.scored_cards } }
	end,
    no_collection = config.joker.drugtest.disabled,
	rarity = 1,
    atlas = 'aetherjokers',
	pos = { x = 3, y = 0 },
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

    end,
    in_pool = function(self, args)
        return not config.joker.drugtest.disabled
    end
}

SMODS.Joker {
	key = 'palette',
	loc_txt = {
		name = 'Palette Joker',
		text = {
			'Gains {X:mult,C:white}X#1#{} Mult for every',
            'scored {C:attention}suit{} sequence',
            '{C:inactive}(Next: {V:1}#2#{C:attention} #3#{C:inactive}/4)',
            '{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)',
		}
	},
	config = { extra = { mult_mod = 0.1, mult = 1, suits = { [1] = 'Spades', [2] = 'Hearts', [3] = 'Clubs', [4] = 'Diamonds' }, scored_suits = 0 } },
    unlocked = true,
    discovered = true,
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
    no_collection = config.joker.palette.disabled,
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
                        colour = G.C.SUITS[context.other_card.base.suit],
                    }

                end

            end

        end

        if context.joker_main then
            
            return {
                xmult = card.ability.extra.mult,
            }

        end

    end,
    in_pool = function(self, args)
        return not config.joker.palette.disabled
    end

}

SMODS.Joker {
	key = 'hailmary',
	loc_txt = {
		name = 'Hail Mary',
		text = {
			'Draws one of the most abundant',
            'card {C:attention}ranks{} {C:held}in hand{} {C:green}from deck{}',
            'on last {C:red}discard',
            'Has a {C:green}#1# in #2#{} chance to trigger',
            'on last {C:blue}hand'
		}
	},
	config = { extra = { hand_odds = 2 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.hand_odds} }
	end,
    no_collection = config.joker.hailmary.disabled,
	rarity = 1,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if (context.pre_discard and G.GAME.current_round.discards_left == 1 and not context.hook) or (context.final_scoring_step and G.GAME.current_round.hands_left == 1 and pseudorandom('hailmaryhand') < G.GAME.probabilities.normal / card.ability.extra.hand_odds) then

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

                        local moved_card = v
                        G.deck:remove_card(moved_card)

                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.hand:emplace(moved_card)
                                return true
                            end,
                        }))

                        return {
                            message = 'Hail Mary!',
                            colour = G.C.GREEN,
                            message_card = moved_card,
                            sound = 'cardFan2',
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
    in_pool = function(self, args)
        return not config.joker.hailmary.disabled
    end

}

SMODS.Joker {
	key = 'eleventhhour',
	loc_txt = {
		name = 'Eleventh Hour',
		text = {
			'Draws one of the most',
            'abundant card {C:attention}suits{} {C:held}in hand {C:green}from deck{}',
            'on last {C:red}discard',
            'Has a {C:green}#1# in #2#{} chance to trigger',
            'on last {C:blue}hand'
		}
	},
	config = { extra = { card_suit = 'None', hand_odds = 2 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.hand_odds} }
	end,
    no_collection = config.joker.eleventhhour.disabled,
	rarity = 1,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if (context.pre_discard and G.GAME.current_round.discards_left == 1) or (context.final_scoring_step and G.GAME.current_round.hands_left == 1 and pseudorandom('eleventhhand') < G.GAME.probabilities.normal / card.ability.extra.hand_odds) then

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

                    local moved_card = v
                    G.deck:remove_card(moved_card)

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:emplace(moved_card)
                            return true
                        end,
                    }))

                    return {
                        message = 'Eleventh Hour!',
                        colour = G.C.SUITS[moved_card.config.card.suit],
                        message_card = moved_card,
                        sound = 'cardFan2',
                    }

                end

            end

            return {
                message = 'None Found!',
                colour = G.C.RED
            }

        end

    end,
    in_pool = function(self, args)
        return not config.joker.eleventhhour.disabled
    end

}

SMODS.Joker {
	key = 'backseat',
	loc_txt = {
		name = 'Backseat Joker',
		text = {
			'Adds {C:attention}double{} {C:chips}base chips{} and {C:attention}half',
            '{C:chips}bonus chips{} of all cards held in hand',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
		}
	},
	config = { extra = { held_chips = 0 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.held_chips } }
	end,
    no_collection = config.joker.backseat.disabled,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 1, y = 0 },
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
                        chips = (context.other_card.base.nominal * 2) + (context.other_card.ability.bonus / 2) + math.ceil(context.other_card.ability.perma_bonus / 2),
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
    in_pool = function(self, args)
        return not config.joker.backseat.disabled
    end

}

SMODS.Joker {
	key = 'divisible',
	loc_txt = {
		name = 'Divisible Joker',
		text = {
			'{X:mult,C:white}+X#1#{} Mult if current {C:chips}chips{} are',
            'divisible by {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, and/or {C:attention}7 {C:inactive}(Stacks)',
		}
	},
	config = { extra = { mult = 0.25, current_xmult = 1 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.mult} }
	end,
    no_collection = config.joker.divisible.disabled,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 2, y = 0 },
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
    in_pool = function(self, args)
        return not config.joker.divisible.disabled
    end

}

SMODS.Joker {
	key = 'stopcard',
	loc_txt = {
		name = 'Stop Card',
		text = {
			'{C:red}Debuffs{} {C:attention}Joker{} to the left'
		}
	},
	config = { extra = { current_pos = 0, marked_for_sell = 0, debuffed_joker = 0 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
    no_collection = config.joker.stopcard.disabled,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 5,
    eternal_compat = true,
    perishable_compat = true,
	update = function(self, card, context)

        local currentpos = 0
        local present = false

        if G.jokers then

            for k,v in pairs(G.jokers.cards) do

                currentpos = currentpos + 1

                if v == card then

                    card.ability.extra.current_pos = currentpos
                    present = true
                    break

                end
                
            end

            local debuffjoker

            if card.ability.extra.current_pos and card.ability.extra.marked_for_sell == 0 and present then

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

    end,
    in_pool = function(self, args)
        return not config.joker.stopcard.disabled
    end

}

SMODS.Joker {
	key = 'tennis',
	loc_txt = {
		name = 'Tennis Joker',
		text = {
			'Gains {C:mult}+#1#{} Mult if {C:blue}played hand{}',
            'only {C:attention}only{} contains {C:attention}one{} card',
            '{C:red}Resets{} if {C:blue}played hand{} contains',
            '{C:attention}more{} than {C:attention}one{} card',
            '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)',
            '{C:money}+$1{} at end of round for every {C:attention}5th{}',
            'streak above {C:attention}20',
            '{C:inactive}({C:attention}#3#{C:inactive} Streak = {C:money}$#4#{C:inactive})',
            '{C:inactive}(Cannot be retriggered)'
		}
	},
	config = { extra = { mult = 0, mult_mod = 2, streak = 0, money = 0, card_triggers = 0, joker_triggers = 0 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_mod, card.ability.extra.mult, card.ability.extra.streak, card.ability.extra.money } }
	end,
    no_collection = config.joker.tennis.disabled,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 2, y = 0 },
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
                    colour = G.C.MULT,
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
    end,
    in_pool = function(self, args)
        return not config.joker.tennis.disabled
    end

}

SMODS.Joker {
	key = 'sleevedjoker',
	loc_txt = {
		name = 'Sleeved Joker',
		text = {
			'{C:green}4x #1# in #2#{} chance to draw a {C:sleeved}Sleeved',
            '{C:attention}Ace{} to {C:held}hand{} on {C:attention}first draw{}',
		}
	},
	config = { extra = { drawn_aces = {}, card_odds = 3 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aether_sleeved
		return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.card_odds} }
	end,
    no_collection = config.joker.sleevedjoker.disabled,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 4, y = 0 },
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
    in_pool = function(self, args)
        return not config.joker.sleevedjoker.disabled
    end

}

SMODS.Joker {
	key = 'overkill',
	loc_txt = {
		name = 'Overkill Joker',
		text = {
			'{C:money}+$#1#{} at end of round for every {C:attention}#2#x{}',
            'total score over score requirement',
            'in a {C:attention}single{} {C:blue}hand{}',
            '{C:inactive}(Max of {C:money}$#3#{C:inactive})'
		}
	},
	config = { extra = { money = 0, money_mod = 1, multiple = 0.5, max = 20 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.money_mod, card.ability.extra.multiple, card.ability.extra.max} }
	end,
    no_collection = config.joker.overkill.disabled,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 3, y = 0 },
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
    end,
        in_pool = function(self, args)
        return not config.joker.overkill.disabled
    end

}

SMODS.Joker {
	key = 'counterfeitjoker',
	loc_txt = {
		name = 'Counterfeit Joker',
		text = {
			'Adds {C:counterfeit}Counterfeit{} copies of all',
            '{C:attention}highlighted{} cards to your',
            '{C:green}deck{} when {C:money}sold{}'
		}
	},
	config = { extra = {} },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aether_counterfeit
		return { vars = {} }
	end,
    no_collection = config.joker.counterfeitjoker.disabled,
	rarity = 2,
	atlas = 'aetherjokers',
	pos = { x = 1, y = 1 },
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
                }))

                delay(0.2)

            end

        end

    end,
    in_pool = function(self, args)
        return not config.joker.counterfeitjoker.disabled
    end

}

SMODS.Joker {
	key = 'handy',
	loc_txt = {
		name = 'Handy Joker',
		text = {
			'{C:attention}+1{} {C:held}hand size{} per',
            '{C:blue}hand{} on {C:attention}first draw{}',
            '{C:red}-1{} {C:held}hand size{} on',
            'each {C:blue}hand played{}',
            '{C:inactive}(Currently {C:attention}#1#{C:inactive})'
		}
	},
	config = { extra = { added_hand_size = 0 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.added_hand_size } }
	end,
    no_collection = config.joker.handy.disabled,
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

                if not card.debuff and card.ability.extra.added_hand_size > 0 then
                    G.hand:change_size(-G.GAME.current_round.hands_left)
                end

                card.ability.extra.added_hand_size = 0

            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    save_run() -- god.
                    return true
                end,
                blocking = false
            }))

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
    in_pool = function(self, args)
        return not config.joker.handy.disabled
    end

}

SMODS.Joker {
	key = 'holding',
	loc_txt = {
		name = 'Joker of Holding',
		text = {
			'{C:consumed}Consumes{} all {C:attention}played cards{} if {C:blue}first{}',
            '{C:blue}played hand{} contains {C:attention}5{} cards',
            'Draws all {C:consumed}Consumed{} cards to {C:held}hand{} when {C:money}sold{}',
            '{C:consumed}Consumed{} cards permanently gain',
            '{C:chips}base chips{} of all {C:attention}played cards{} for',
            'each {C:blue}played hand{}',
            '{C:red}-$1{} sell value for every {C:attention}3{} cards stored',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)',
            '{C:inactive}(Holding {C:consumed}#2#{C:inactive} Cards)'
		}
	},
	config = { extra = { consumed_cards = {}, joker_triggers = 0, bonus_chips = 0, bonus_chips_visible = 0 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.bonus_chips_visible, #card.ability.extra.consumed_cards } }
	end,
    no_collection = config.joker.holding.disabled,
	rarity = 3,
	atlas = 'aetherjokers',
	pos = { x = 4, y = 1 },
	cost = 6,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

		if context.destroy_card and context.cardarea ~= G.hand and context.cardarea ~= G.deck and G.GAME.current_round.hands_played == 0 and not context.blueprint and #G.play.cards == 5 then

            if card.ability.extra.joker_triggers == 0 then

                card.ability.extra.joker_triggers = 1

                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('aether_consumestart')
                        return true
                    end,
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
                        }))

                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 2,
                            func = function()
                                v:remove()
                                return true
                            end,
                            blocking = false,
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

    end,
    in_pool = function(self, args)
        return not config.joker.holding.disabled
    end

}

SMODS.Joker {
	key = 'flushify',
	loc_txt = {
		name = 'Flushify Joker',
		text = {
            'Turns any played {C:attention}Straight{}, {C:attention}Full House{},',
            'or {C:attention}Five of a Kind{} into its {C:flush}Flush Variant{}',
            'and converts all {C:attention}scored cards{}',
            'into {C:attention}Wild Cards'
		}
	},
	config = { extra = { scored_cards = 0, triggers = 0 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
		return { vars = {  } }
	end,
    no_collection = config.joker.flushify.disabled,
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
                    attention_text({
                        scale = 1.4, text = 'Flushify!', hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
                    })
                    ease_colour(G.C.UI_CHIPS, G.C.FLUSH, 0.5)
                    ease_colour(G.C.UI_MULT, G.C.FLUSH, 0.5)
                    play_sound('tarot1', 1.5)
                    play_sound('aether_flushify')
                    return true
                end,
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
                    SMODS.debuff_card(v, 'prevent_debuff', 'flushify')
                end

            end

            for k,v in pairs(G.jokers.cards) do

                if v.ability.type == 'Flush' or (G.GAME.new_poker_hand == 'Straight Flush' and v.ability.type == 'Straight Flush') then

                    v.force_trigger = true

                end

            end

            card.ability.extra.triggers = 1

            delay(0.6)

        end

        if context.final_scoring_step and card.ability.extra.triggers >= 1 then

            card.ability.extra.triggers = 0

            flushified_card = 1

            if G.GAME.selected_back.effect.center.key ~= 'b_plasma' then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_colour(G.C.UI_CHIPS, G.C.CHIPS, 0.5)
                        ease_colour(G.C.UI_MULT, G.C.MULT, 0.5)
                    end,
                    blockable = false,
                    blocking = false
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                        G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                    end,
                    blockable = false,
                    blocking = false
                }))
            end

            for k,v in pairs(G.play.cards) do

                if not SMODS.has_enhancement(v, 'm_wild') and not SMODS.has_enhancement(v, 'm_stone') and not SMODS.has_enhancement(v, 'm_aether_sleeved') and not v.debuff then

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up(0.3,0.5)
                            v:flip()
                            return true
                        end,
                    }))
                    delay(0.2)
                    v:set_ability(G.P_CENTERS.m_wild, nil, true)
                    SMODS.debuff_card(v, 'reset', 'flushify')
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up(0.3,0.5)
                            v:flip()
                            v:start_materialize({G.C.FLUSH}, true, 1)
                            play_sound('aether_flushify'..flushified_card)
                            flushified_card = flushified_card + 1
                            return true
                        end,
                    }))
                    delay(0.1)

                end

            end

        end

    end,
    in_pool = function(self, args)
        return not config.joker.flushify.disabled
    end
}

SMODS.Joker {
	key = 'levelup',
	loc_txt = {
		name = 'Level Up!',
		text = {
			'{C:attention}+4{} {C:buff}Buff Card{} slots',
		}
	},
	config = { extra = { added_hand_size = 0 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.added_hand_size } }
	end,
    no_collection = config.joker.levelup.disabled,
	rarity = 3,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.aether_buffs:change_size(4)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.aether_buffs:change_size(-4)
    end,
    in_pool = function(self, args)
        return not config.joker.levelup.disabled
    end

}

SMODS.Joker {
	key = 'turnstile',
	config = { extra = {triggers = 0, discarded_cards = {}} },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
        if G.GAME.inverted then
            return { key = 'j_aether_turnstile_inverted' }
        end
        return { vars = {card.ability.extra.triggers} }
	end,
    no_collection = config.joker.turnstile.disabled,
	rarity = 4,
	atlas = 'aetherjokers',
	pos = { x = 0, y = 0 },
	cost = 8,
    eternal_compat = true,
    perishable_compat = true,
	calculate = function(self, card, context)

        if (#G.discard.cards == 0 or #G.play.cards > 0 or context.end_of_round) and G.GAME.inverted and not context.blueprint then
            G.GAME.inverted = false
            ease_background_colour{new_colour = G.C.RED}
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_background_colour_blind()
                    return true
                end,
            }))
        end

        if context.end_of_round then
            card.ability.extra.triggers = 0
        end

        if context.pre_discard and not context.blueprint then

            card.ability.extra.discarded_cards = G.hand.highlighted

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
                    }))
                    delay(0.2)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:sort()
                            return true
                        end,
                    }))
                end
            end

        end

    end,
    update = function(self, card, context)

        if G.GAME.inverted then
            ease_background_colour{new_colour = G.C.BLUE}
        end

    end,
    in_pool = function(self, args)
        return not config.joker.turnstile.disabled
    end
}

SMODS.Joker {
	key = 'fleshjoker',
	config = { extra = { infect_odds = 10, infected_cards = 0, total_cards = 52, infected_jokers = 0, total_jokers = 1, card_mult = 0.1, joker_mult = 0.5 } },
    unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
        if card.area == G.jokers then
            return { vars = { G.GAME.probabilities.normal, card.ability.extra.infect_odds, card.ability.extra.infected_cards, card.ability.extra.total_cards, card.ability.extra.infected_jokers, card.ability.extra.total_jokers, 1 + (card.ability.extra.infected_cards * card.ability.extra.card_mult) + (card.ability.extra.infected_jokers * card.ability.extra.joker_mult) } }
        else
            return { key = 'j_aether_fleshjoker_hidden' }
        end
	end,
    no_collection = true,
	rarity = 'aether_flesh',
	atlas = 'aetherjokers',
	pos = { x = 0, y = 1 },
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
                    }))
                    delay(0.1)

                end

            end

            if card.ability.extra.infected_cards == #G.playing_cards then

                for k,v in pairs(G.jokers.cards) do

                    if pseudorandom('fleshjokerinfect') < G.GAME.probabilities.normal / card.ability.extra.infect_odds and v.ability.name ~= card.ability.name and not v.getting_sliced then

                        v.getting_sliced = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = 'INFECT', sound = 'aether_fleshinfect'..math.random(1, 4), colour = G.C.FLESH})

                        G.E_MANAGER:add_event(Event({
                            func = function()
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
                                return true
                            end,
                        }))

                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 2,
                            func = function()
                                v:remove()
                                return true
                            end,
                            blocking = false,
                        }))

                    end

                end

            end

        end

    end,
    update = function(self, card, context)

        if G.playing_cards and G.jokers then

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
        if not from_debuff then play_sound('aether_fleshspawn') end
    end,
    in_pool = function(self, args)
        return not config.joker.fleshjoker.disabled
    end
}

SMODS.Enhancement {
    key = 'sleeved',
	loc_txt = {
		name = 'Sleeved Card',
		text = {
			'{C:red}Destroyed{} when {C:blue}played{},',
            '{C:red}discarded{}, {C:tarot}enhanced{},',
            'or at {C:attention}end of round{}',
            '{C:inactive}(Only created by {C:attention}Jokers{C:inactive})',
		}
	},
    atlas = 'aetherenhancers',
	pos = { x = 1, y = 0 },
    config = { block_enhance = true, extra = {triggers = 0} },
    no_collection = config.joker.sleevedjoker.disabled,
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
                }))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 2,
                    func = function()
                        card:remove()
                        return true
                    end,
                    blocking = false,
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
			'{C:red}Destroyed{} in {C:attention}#1#{} {C:blue}scores{}',
            '{C:money}+$1{} per {C:blue}scores{} left',
            'when manually {C:tarot}enhanced{}',
            '{C:inactive}(Only created by {C:attention}Jokers{C:inactive})',
		}
	},
    atlas = 'aetherenhancers',
	pos = { x = 3, y = 0 },
    config = { extra = { uses_left = 4, triggers = 0, } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses_left - 1 } }
	end,
    no_collection = config.joker.counterfeitjoker.disabled,
    weight = 0,
    in_pool = function(self)
        return false
    end,
    overrides_base_rank = true,
    calculate = function(self, card, context)

        if context.main_scoring and context.cardarea == G.play then

            if card.ability.extra.uses_left == 2 then
                card.base.nominal = 0
                card.base.perma_bonus = 0
            end

            card.ability.extra.uses_left = card.ability.extra.uses_left - 1

            if card.ability.extra.uses_left > 1 then
                return {
                    message = (card.ability.extra.uses_left - 1)..'!',
                    sound = 'cardSlide2',
                    colour = G.C.COUNTERFEIT
                }
            elseif card.ability.extra.uses_left == 1 then
                return {
                    message = 'Spent!',
                    sound = 'cardSlide2',
                    colour = G.C.COUNTERFEIT
                }
            end

        end

        if context.destroy_card and card.ability.extra.uses_left <= 1 and context.cardarea ~= G.hand and card.ability.extra.triggers <= 1 then

            card.ability.extra.triggers = card.ability.extra.triggers + 1

            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve({G.C.BLACK, G.C.COUNTERFEIT, G.C.COUNTERFEIT}, true, 5)
                    return true
                end,
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                    delay = 2,
                func = function()
                    card:remove()
                    return true
                end,
                blocking = false,
            }))

            return {
                message = 'Degraded!',
                colour = G.C.COUNTERFEIT,
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
            '{C:mult}+#1#{} Mult',
			'{C:green}#2# in #3#{} chance to {X:flesh,C:white}SPREAD{} to each',
            'card held in hand at end of round',
            '{C:green}#2# in #4#{} chance to {X:flesh,C:white}DECAY{} when',
            '{C:blue}played{}, {C:red}discarded{}, or at {C:attention}end of round{},',
            '{X:flesh,C:white}PERISHES{} if {C:attention}2',
		}
	},
    atlas = 'aetherenhancers',
	pos = { x = 2, y = 0 },
    config = { extra = { mult = 'rank', infect_odds = 3, perish_odds = 5, triggers = 0 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, G.GAME.probabilities.normal, card.ability.extra.infect_odds, card.ability.extra.perish_odds } }
	end,
    no_collection = true,
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

        if context.end_of_round and ((context.cardarea == G.hand and #G.hand.cards > 0) or context.cardarea == G.deck) then

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
                    }))

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 2,
                        func = function()
                            card:remove()
                            return true
                        end,
                        blocking = false,
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
            '{X:mult,C:white}+X#1#{} Mult per {C:flesh}Flesh Card{} scored',
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
    no_collection = true,
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
                        }))

                    end

                end

            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve({G.C.FLESH}, false, 5)
                    return true
                end,
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 2,
                func = function()
                    card:remove()
                    return true
                end,
                blocking = false,
            }))

            return {
                message = 'PERISH',
                colour = G.C.FLESH,
                sound = 'aether_fleshperish'..math.random(1, 2),
                remove = true
            }

        end

    end,
    update = function(self, card, context)

        card.ability.extra.xmult = 0

        if #G.hand.highlighted > 0 then

            for k,v in pairs(G.hand.highlighted) do
                if SMODS.has_enhancement(v, 'm_aether_flesh') then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                end
            end

        end

    end,

}

G.C.AETHER = HEX('8000FF')
G.C.SECONDARY_SET.Buff = HEX('C080FF')

SMODS.ConsumableType {
    key = 'Buff',
    primary_colour = G.C.SECONDARY_SET.Buff,
    secondary_colour = G.C.SECONDARY_SET.Buff,
    loc_txt = {
        name = 'Buff Card',
        collection = 'Buff Cards'
    },
    cards = {
        ["c_aether_buffcard"] = true,
    }
}

SMODS.Consumable {
    key = 'buffcard',
    set = 'Buff',
    atlas = 'aetherconsumeables',
    pos = { x = 3, y = 5 },
    loc_txt = {
        name = 'Buff Card',
        text = {
            '#1#{V:1}#2#{}#3#{V:2,B:3}#4#{}#5##6#{V:1}#7#{V:4}#8#{}#9#',
        }
    },
    loc_vars = function(self, info_queue, card)
		return { 
            vars = { 
                card.ability.extra.text1,
                card.ability.extra.cardtext1,
                card.ability.extra.text2,
                card.ability.extra.statnumber,
                card.ability.extra.stattext,
                card.ability.extra.text3,
                card.ability.extra.cardtext2,
                card.ability.extra.contexttext,
                card.ability.extra.countertext,

                colours = {
                    G.C.SUITS[card.ability.extra.card] or G.C.FILTER,
                    G.C.STATS[card.ability.extra.stat] or G.C.FILTER,
                    G.C.STATSBACKGROUND[card.ability.extra.stat] or G.C.FILTER,
                    G.C.CONTEXT[card.ability.extra.context] or G.C.FILTER,
                },
            } }
	end,
    no_collection = not config.buffcards,
    config = { extra = {
        rarity = 0,
        raritytext = '',

        cardtype = '',
        card = '',
        cardtext = '',
        cardtext1 = '',
        cardtext2 = '',
        
        stat = '',
        statnumber = '',
        stattext = '',

        context = '',
        contexttext = '',

        countertext = '',
        
        amount = 0,
        stored = 0,
        tally = 0,
        triggered = 0,
        required = 1,
        
        text1 = '',
        text2 = '',
        text3 = '',

        triggerdelay = 0.5,
    } },
    unlocked = true,
    discovered = true,
    calculate = function(self, card, context)

        if ((card.ability.extra.context == 'score' and context.individual and context.cardarea == G.play) or (card.ability.extra.context == 'discard' and context.discard) or (card.ability.extra.context == 'held' and context.individual and context.cardarea == G.hand) or (card.ability.extra.context == 'deck' and context.individual and context.cardarea == G.deck) or (card.ability.extra.stored > 0 and context.joker_main)) and not context.end_of_round then

            if (card.ability.extra.stored > 0 and context.joker_main) or (card.ability.extra.cardtype == 'rank' and card.ability.extra.card == context.other_card.config.card.value and context.other_card:get_id() > 0) or (card.ability.extra.cardtype == 'suit' and context.other_card:is_suit(card.ability.extra.card)) then

                if not (card.ability.extra.stored > 0 and context.joker_main) then
                    card.ability.extra.triggered = card.ability.extra.triggered + 1
                end

                if card.ability.extra.triggered >= card.ability.extra.required or (card.ability.extra.stored > 0 and context.joker_main) then

                    if card.debuff then

                        return {
                            message = localize('k_debuffed'),
                            colour = G.C.RED,
                            message_card = card,
                            delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                        }

                    else

                        local stored = card.ability.extra.stored

                        if card.ability.extra.stored < 1 then
                            stored = 1
                        end

                        if not (card.ability.extra.stored > 0 and context.joker_main) then
                            card.ability.extra.triggered = 0
                        end

                        if card.ability.extra.stat == 'chips' then

                            if context.discard then
                                card.ability.extra.stored = card.ability.extra.stored + 1
                                return {
                                    message = 'Stored +'..card.ability.extra.amount,
                                    colour = G.C.CHIPS,
                                    message_card = card,
                                    delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                                }
                            else
                                card.ability.extra.stored = 0
                                return {
                                    chip_mod = card.ability.extra.amount * stored,
                                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.amount * stored } },
                                    colour = G.C.CHIPS,
                                    message_card = card,
                                    delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                                }
                            end

                        elseif card.ability.extra.stat == 'mult' then

                            if context.discard then
                                card.ability.extra.stored = card.ability.extra.stored + 1
                                return {
                                    message = 'Stored +'..card.ability.extra.amount,
                                    colour = G.C.MULT,
                                    message_card = card,
                                    delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                                }
                            else
                                card.ability.extra.stored = 0
                                return {
                                    mult_mod = card.ability.extra.amount * stored,
                                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.amount * stored } },
                                    colour = G.C.MULT,
                                    message_card = card,
                                    delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                                }
                            end

                        elseif card.ability.extra.stat == 'xmult' then

                            if context.discard then
                                card.ability.extra.stored = card.ability.extra.stored + 1
                                return {
                                    message = 'Stored X'..(1 + card.ability.extra.amount),
                                    colour = G.C.MULT,
                                    message_card = card,
                                    delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                                }
                            else
                                card.ability.extra.stored = 0
                                return {
                                    Xmult_mod = 1 + card.ability.extra.amount ^ stored,
                                    message = localize { type = 'variable', key = 'a_xmult', vars = { 1 + card.ability.extra.amount ^ stored } },
                                    colour = G.C.MULT,
                                    message_card = card,
                                    delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                                }
                            end

                        elseif card.ability.extra.stat == 'dollars' then

                            return {
                                dollars = card.ability.extra.amount,
                                message = '$'..card.ability.extra.amount,
                                colour = G.C.MONEY,
                                message_card = card,
                                remove_default_message = true,
                                delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                            }

                        end

                    end

                end

                if card.ability.extra.triggered < card.ability.extra.required then

                    return {
                        message = card.ability.extra.triggered..'/'..card.ability.extra.required,
                        colour = G.C.SECONDARY_SET.Buff,
                        message_card = card,
                        delay = card.ability.extra.triggerdelay - G.real_dt * G.SPEEDFACTOR,
                    }
                end

            end

        end

    end,
    update = function(self, card, dt)

        local options = {
            cardtype = { 'rank', 'suit' },
            ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
            suits = { 'Spades', 'Hearts', 'Clubs', 'Diamonds' },
            stats = { 'chips', 'mult', 'xmult', 'dollars' },
            contexts = { 'score', 'discard', 'held', 'deck' },
        }

        G.C.STATS = {
            chips = G.C.CHIPS,
            mult = G.C.MULT,
            xmult = G.C.WHITE,
            dollars = G.C.MONEY,
        }

        G.C.STATSBACKGROUND = {
            chips = G.C.WHITE,
            mult = G.C.WHITE,
            xmult = G.C.MULT,
            dollars = G.C.WHITE,
        }

        G.C.CONTEXT = {
            score = G.C.BLUE,
            discard = G.C.RED,
            held = G.C.HELD,
            deck = G.C.GREEN,
        }

        if card.ability.extra.cardtype == '' then

            local cardtype = pseudorandom('buffcardtype') * #options.cardtype
            if cardtype % 1 > 0.5 then
                cardtype = math.ceil(cardtype)
            else
                cardtype = math.floor(cardtype)
                if cardtype < 1 then cardtype = 1 end
            end

            card.ability.extra.cardtype = options.cardtype[cardtype]

            local randomrarity = pseudorandom('buffrandom')

            if randomrarity > 0.95 then
                card.ability.extra.rarity = 4
            elseif randomrarity > 0.85 then
                card.ability.extra.rarity = 3
            elseif randomrarity > 0.75 then
                card.ability.extra.rarity = 2
            else
                card.ability.extra.rarity = 1
            end

            local amountmodifier = 2/3 + (1/3 * card.ability.extra.rarity)

            if card.ability.extra.cardtype == 'rank' then

                local rank = pseudorandom('buffcard') * #options.ranks
                if rank % 1 > 0.5 then
                    rank = math.ceil(rank)
                else
                    rank = math.floor(rank)
                    if rank < 1 then rank = 1 end
                end

                card.ability.extra.card = options.ranks[rank]
                card.ability.extra.cardtext = card.ability.extra.card
                card.ability.extra.cardtextplural = card.ability.extra.card..'s'

            else

                amountmodifier = amountmodifier / 3

                local suit = pseudorandom('buffcard') * #options.suits
                if suit % 1 > 0.5 then
                    suit = math.ceil(suit)
                else
                    suit = math.floor(suit)
                    if suit < 1 then suit = 1 end
                end

                card.ability.extra.card = options.suits[suit]
                card.ability.extra.cardtext = localize(card.ability.extra.card, 'suits_singular')
                card.ability.extra.cardtextplural = card.ability.extra.card

            end

            local context = pseudorandom('buffcontext') * #options.contexts
            if context % 1 > 0.5 then
                context = math.ceil(context)
            else
                context = math.floor(context)
                if context < 1 then context = 1 end
            end

            card.ability.extra.context = options.contexts[context]

            local stat = pseudorandom('buffstat') * #options.stats
            if stat % 1 > 0.5 then
                stat = math.ceil(stat)
            else
                stat = math.floor(stat)
                if stat < 1 then stat = 1 end
            end

            card.ability.extra.stat = options.stats[stat]

            if card.ability.extra.context == 'score' then
            elseif card.ability.extra.context == 'discard' then
                amountmodifier = amountmodifier / 2
            elseif card.ability.extra.context == 'held' then
                amountmodifier = amountmodifier / 3
                card.ability.extra.triggerdelay = 0.66
            elseif card.ability.extra.context == 'deck' then
                amountmodifier = amountmodifier / 6
                card.ability.extra.triggerdelay = 0.33
            end

            local statvalues = {
                chips = 40,
                mult = 8,
                xmult = 0.5,
                dollars = 4,
            }

            if card.ability.extra.stat == 'xmult' then
                card.ability.extra.amount = math.ceil((statvalues[card.ability.extra.stat] * amountmodifier) * 20) / 20
                card.ability.extra.required = math.ceil((1 + statvalues[card.ability.extra.stat] * amountmodifier) / math.max(card.ability.extra.rarity * 2/3, 1))
            elseif (statvalues[card.ability.extra.stat] * amountmodifier) < 1 then
                card.ability.extra.amount = 1
                card.ability.extra.required = math.ceil((1 / statvalues[card.ability.extra.stat] * amountmodifier) / math.max(card.ability.extra.rarity * 2/3, 1))
            else
                card.ability.extra.amount = math.ceil(statvalues[card.ability.extra.stat] * amountmodifier)
                card.ability.extra.required = 1
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    card:sparkle({ time = 1, colors = {G.C.RARITY[card.ability.extra.rarity]} }, true, false, 'aether_joker'..card.ability.extra.rarity)
                    return true
                end,
            }))

        end

        local textreplace = {
            raritytext = {
                [1] = 'Common',
                [2] = 'Uncommon',
                [3] = 'Rare',
                [4] = 'Legendary',
            },
            statnumber = {
                chips = '+'..card.ability.extra.amount,
                mult = '+'..card.ability.extra.amount,
                xmult = 'X'..(1 + card.ability.extra.amount),
                dollars = '$'..card.ability.extra.amount,
            },
            stattext = {
                chips = ' Chips',
                mult = ' Mult',
                xmult = ' Mult',
                dollars = '',
            },
            contexts = {
                score = ' scored',
                discard = ' discarded',
                held = ' held in hand',
                deck = ' in deck',
            },
            countertext = {
                score = '',
                discard = ' ('..card.ability.extra.stored..')',
                held = ' ('..card.ability.extra.tally..')',
                deck = ' ('..card.ability.extra.tally..')',
            },
        }

        card.ability.extra.raritytext = textreplace.raritytext[card.ability.extra.rarity]
        card.ability.extra.statnumber = textreplace.statnumber[card.ability.extra.stat]
        card.ability.extra.stattext = textreplace.stattext[card.ability.extra.stat]
        card.ability.extra.contexttext = textreplace.contexts[card.ability.extra.context]
        card.ability.extra.countertext = textreplace.countertext[card.ability.extra.context]

        if card.ability.extra.stat == 'xmult' or card.ability.extra.amount < 1 then
            card.ability.extra.text1 = ''
            card.ability.extra.cardtext1 = ''
            card.ability.extra.text2 = ''
            card.ability.extra.text3 = ' for every '..card.ability.extra.triggered..'/'..card.ability.extra.required..' '
            card.ability.extra.cardtext2 = card.ability.extra.cardtextplural
        else
            if card.ability.extra.context == 'score' or card.ability.extra.context == 'discard' then

                card.ability.extra.text1 = 'All '
                card.ability.extra.cardtext1 = card.ability.extra.cardtextplural
                card.ability.extra.text2 = ' give '
                card.ability.extra.text3 = ' when'
                card.ability.extra.cardtext2 = ''

            else

                card.ability.extra.text1 = ''
                card.ability.extra.cardtext1 = ''
                card.ability.extra.text2 = ''
                card.ability.extra.text3 = ' for each '
                card.ability.extra.cardtext2 = card.ability.extra.cardtext

            end
        end

        card.ability.extra.tally = 0
        local checkarea

        if card.ability.extra.context == 'held' then
            checkarea = G.hand
        elseif card.ability.extra.context == 'deck' then
            checkarea = G.deck
        end

        if checkarea then
            for k,v in pairs(checkarea.cards) do
                if card.ability.extra.cardtype == 'rank' then
                    if v.config.card.value == card.ability.extra.card and not v.debuff and not v.highlighted then
                        card.ability.extra.tally = card.ability.extra.tally + 1
                    end
                else
                    if v:is_suit(card.ability.extra.card) and not v.debuff and not v.highlighted then
                        card.ability.extra.tally = card.ability.extra.tally + 1
                    end
                end
            end
        end

    end,
    use = function(self, card, area, copier)
        if area == G.aether_buffs then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve({G.C.SECONDARY_SET.Buff}, false, 1)
                    return true
                end,
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 2,
                func = function()
                    card:remove()
                    return true
                end,
                blocking = false,
            }))
        elseif area == G.consumeables and #G.aether_buffs < G.aether_buffs.config.card_limit then
            area:remove_card(card)
            G.aether_buffs:emplace(card)
        end
    end,
    in_pool = function(self, args)
        return config.buffcards, { allow_duplicates = true }
    end,
    can_use = function(self, card)
        if (card.area ~= G.aether_buffs and #G.aether_buffs.cards < G.aether_buffs.config.card_limit) or card.area == G.aether_buffs then
            return true
        end
    end,
    keep_on_use = function(self, card)
        return true
    end,
    draw = function(self, card, layer)

        local desiredscale = 1
        local fraction = 0.1

        if card.area == G.aether_buffs then

            card.states.drag.can = true
            desiredscale = 2/3

            if card.highlighted then
                desiredscale = 1
                fraction = 0.5
            elseif card.states.hover.is or card.states.drag.is then
                desiredscale = 0.75
                fraction = 0.2
            else
                desiredscale = 2/3
            end

        else

            desiredscale = 1

        end

        card.T.scale = card.T.scale + (desiredscale - card.T.scale) * fraction

    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(card.ability.extra.raritytext, G.C.RARITY[card.ability.extra.rarity], nil, 1.2)        
    end,
}

SMODS.Booster {
    key = 'buffpackminor',
    loc_txt = {
        name = 'Minor Buff Pack',
        group_name = 'Buff Cards',
        text = {
            'Add {C:attention}1{} of up to',
            '{C:attention}3{} {C:buff}Buff Cards{} to',
            'your build'
        }
    },
    atlas = 'aetherboosters',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1 },
    no_collection = not config.buffcards,
    discovered = true,
    pools = {
        ['c_aether_buffcard'] = true,
    },
    group_key = 'buffcards',
    cost = 4,
    weight = 1,
    draw_hand = false,
    kind = 'buffpacks',
    select_card = 'aether_buffs',
    create_card = function(self, card, i)
        return create_card('Buff', G.pack_cards, nil, nil, true, true, nil, 'buff')
    end,
    can_use = function(self, card)
        return #G.aether_buffs < G.aether_buffs.card_limit
    end,
    in_pool = function(self, args)
        return config.buffcards
    end
}

SMODS.Booster {
    key = 'buffpack',
    loc_txt = {
        name = 'Buff Pack',
        group_name = 'Buff Cards',
        text = {
            'Add {C:attention}2{} of up to',
            '{C:attention}4{} {C:buff}Buff Cards{} to',
            'your build'
        }
    },
    atlas = 'aetherboosters',
    pos = { x = 1, y = 0 },
    config = { extra = 4, choose = 2 },
    no_collection = not config.buffcards,
    discovered = true,
    pools = {
        ['c_aether_buffcard'] = true,
    },
    group_key = 'buffcards',
    cost = 6,
    weight = 0.75,
    draw_hand = false,
    kind = 'buffpacks',
    select_card = 'aether_buffs',
    create_card = function(self, card)
        return create_card('Buff', G.pack_cards, nil, nil, true, true, nil, 'buff')
    end,
    can_use = function(self, card)
        return #G.aether_buffs < G.aether_buffs.card_limit
    end,
    in_pool = function(self, args)
        return config.buffcards
    end
}

SMODS.Booster {
    key = 'buffpackmajor',
    loc_txt = {
        name = 'Major Buff Pack',
        group_name = 'Buff Cards',
        text = {
            'Add {C:attention}3{} of up to',
            '{C:attention}5{} {C:buff}Buff Cards{} to',
            'your build'
        }
    },
    atlas = 'aetherboosters',
    pos = { x = 2, y = 0 },
    config = { extra = 5, choose = 3 },
    no_collection = not config.buffcards,
    discovered = true,
    pools = {
        ['c_aether_buffcard'] = true,
    },
    group_key = 'buffcards',
    cost = 8,
    weight = 0.25,
    draw_hand = false,
    kind = 'buffpacks',
    select_card = 'aether_buffs',
    create_card = function(self, card)
        return create_card('Buff', G.pack_cards, nil, nil, true, true, nil, 'buff')
    end,
    can_use = function(self, card)
        return #G.aether_buffs < G.aether_buffs.card_limit
    end,
    in_pool = function(self, args)
        return config.buffcards
    end
}

SMODS.Voucher {
    key = 'buffvoucher1',
    loc_txt = {
        name = 'Extra Drops',
        text = {
            '{C:buff}Buff Cards{} can',
            'be purchased from',
            'the {C:attention}shop{}'
        }
    },
    atlas = 'aethervouchers',
    pos = { x = 0, y = 0 },
    config = {},
    no_collection = not config.buffcards,
    unlocked = true,
    discovered = true,
    cost = 10,
    redeem = function(self, card)
        G.GAME.buff_rate = 2
    end,
    in_pool = function(self, args)
        return config.buffcards
    end
}

SMODS.Voucher {
    key = 'buffvoucher2',
    loc_txt = {
        name = 'Multi-Class',
        text = {
            '{C:attention}+4{} {C:buff}Buff Cards{} slots',
        }
    },
    atlas = 'aethervouchers',
    pos = { x = 1, y = 0 },
    config = {},
    no_collection = not config.buffcards,
    unlocked = true,
    discovered = true,
    cost = 10,
    requires = {'v_aether_buffvoucher1'},
    redeem = function(self, card)
        G.aether_buffs:change_size(4)
    end,
    in_pool = function(self, args)
        return config.buffcards
    end
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
    config = { extra = {
        replace_odds = 4,
        special_odds = 20,
        beatboss = false,
    } },
    unlocked = true,
    discovered = true,
    loc_txt = {
        name = 'Aether Deck',
        text ={
            'Start with a random {C:red}Rare {C:aether}Aether Joker',
            '{C:green}#1# in #2#{} chance to replace a {C:attention}Joker{} in',
            'shops with an {C:aether}Aether Joker',
            'Gives a {C:aether}Minor Buff Pack{} after each',
            '{C:attention}boss blind{}'
        },
    },
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, self.config.extra.replace_odds } }
	end,
    apply = function(self, back)

        self.config.extra.beatboss = false

        selected_joker = math.random(#aether_jokers[3])

        if selected_joker % 1 > 0.5 then
            selected_joker = math.ceil(selected_joker)
        else
            selected_joker = math.floor(selected_joker)
            if selected_joker < 1 then selected_joker = 1 end
        end

        G.E_MANAGER:add_event(Event({
            func = function()

                SMODS.add_card({
                    key = 'j_aether_'..aether_jokers[3][selected_joker]
                })
                play_sound('aether_joker3')
                return true

            end
        }))

    end,

    calculate = function(self, back, context)

        if context.end_of_round and G.GAME.blind and G.GAME.blind.boss then
            self.config.extra.beatboss = true
        end

        if context.starting_shop then

            if self.config.extra.beatboss then

                local key = 'p_aether_buffpackminor'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                self.config.extra.beatboss = false

            end

            for k1,v1 in pairs(G.shop_jokers.cards) do

                if (v1.config.center.rarity == 1 or v1.config.center.rarity == 2 or v1.config.center.rarity == 3) and pseudorandom('aetherdeck') < G.GAME.probabilities.normal / self.config.extra.replace_odds then

                    if pseudorandom('aetherdeckspecial') < G.GAME.probabilities.normal / self.config.extra.special_odds then
                        joker_rarity = 4
                    else
                        joker_rarity = v1.config.center.rarity
                    end

                    selected_joker = pseudorandom('aetherdeckjoker') * #aether_jokers[joker_rarity]

                    if selected_joker % 1 > 0.5 then
                        selected_joker = math.ceil(selected_joker)
                    else
                        selected_joker = math.floor(selected_joker)
                        if selected_joker < 1 then selected_joker = 1 end
                    end

                    if not next(SMODS.find_card('j_aether_'..aether_jokers[joker_rarity][selected_joker], true)) then

                        G.E_MANAGER:add_event(Event({
                            func = function()

                                v1:remove()
                                local new_joker = SMODS.add_card({
                                    key = 'j_aether_'..aether_jokers[joker_rarity][selected_joker],
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

SMODS.current_mod.config_tab = function()

    local deck_tables = {}
    G.aetherjokerdisplay = {}

    for i = 1, #aether_jokers do

        G.aetherjokerdisplay[i] = CardArea(
            0, 0,
            G.CARD_W * 0.5 + G.CARD_W * #aether_jokers[i] * 0.66, G.CARD_H * 0.5,
            { type = 'consumeable', card_limit = 64, highlight_limit = 1, draw_layers = {'card'}, collection = true }
        )

        table.insert(deck_tables, 
        {n=G.UIT.R, config={align = "cm", padding = 0.05, no_fill = true}, nodes={
        {n=G.UIT.O, config={object = G.aetherjokerdisplay[i]}}
        }}
        )

        for k,v in pairs(aether_jokers[i]) do

            local card = SMODS.create_card({
                key = 'j_aether_'..v,
                area = G.aetherjokerdisplay[i],
                no_edition = true,
            })

            card.T.w = G.CARD_W * 0.66
            card.T.h = G.CARD_H * 0.66

            G.aetherjokerdisplay[i]:emplace(card)

        end

    end

    return {
        n = G.UIT.ROOT,
        config = { r = 0.1, minw = 8, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm" },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = 'Custom Music',
                                        ref_table = config,
                                        ref_value = 'music'
                                    })
                                }
                            },
                        }
                    },
                }
            },
            {
                n = G.UIT.R,
                config = { padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm" },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = 'Buff Cards',
                                        ref_table = config,
                                        ref_value = 'buffcards'
                                    })
                                }
                            },
                        }
                    },
                }
            },
            {
                n = G.UIT.R,
                config = { padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm" },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05},
                                nodes = deck_tables,
                            },
                        }
                    },
                }
            },
            { n = G.UIT.R, config = { minh = 0.1 } }
        }
    }

end