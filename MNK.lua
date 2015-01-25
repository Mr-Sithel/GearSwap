-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Footwork = buffactive.Footwork or false
    state.Buff.Impetus = buffactive.Impetus or false
	
	include('Mote-TreasureHunter')

    state.FootworkWS = M(false, 'Footwork on WS')

    info.impetus_hit_count = 0
    windower.raw_register_event('action', on_action_for_impetus)
end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'SomeAcc', 'Acc', 'Fodder')
    state.WeaponskillMode:options('Normal', 'SomeAcc', 'Acc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT', 'Counter')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.IdleMode:options('Town', 'Normal')

    update_combat_form()
    update_melee_groups()

    select_default_macro_book()
	gear.AugManibozhoGloves = {name="Manibozho Gloves", augments={'Attack+15','Accuracy+10','STR+10'}}
	send_command('bind f12 gs c update user')
	send_command('bind f9 ws Victory Smite <t>')
	send_command('bind f10 ws Raging Fists <t>')
	send_command('bind f11 ws Howling Fist <t>')
end

function user_unload()    
	send_command('unbind !F7')
	send_command('unbind ^F9')
	send_command('unbind F9')
	send_command('unbind F10')
	send_command('unbind F11')
	send_command('unbind F12')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	sets.Slept = {head="Frenzy Sallet"}
	sets.ReiveNeck = {neck="Adoulin's Refuge +1"}
	sets.TreasureHunter = {waist="Chaac Belt"}
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs on use
    sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose"}
    sets.precast.JA['Boost'] = {}
    sets.precast.JA['Dodge'] = {}
    sets.precast.JA['Focus'] = {head="Tpl. Crown +1"}
    sets.precast.JA['Counterstance'] = {feet="Mel. Gaiters +2"}
    sets.precast.JA['Footwork'] = {}
    sets.precast.JA['Formless Strikes'] = {body="Mel. Cyclas +2"}
    sets.precast.JA['Mantra'] = {feet="Mel. Gaiters +2"}

    sets.precast.JA['Chi Blast'] = {}

    sets.precast.JA['Chakra'] = {
		ammo="Iron Gobbet",
		head="Blacksh. Hairpin",
		neck="Tjukurrpa Medal",
		ear1="Terra's pearl",
		ear2="Terra's pearl",
		body="Anchorite's cyclas +1",
		hands="Hes. Gloves +1",
		ring1="Terrasoul ring",
		ring2="Terrasoul ring",
		back="Iximulew Cape",
		waist="Caudata Belt",
		legs="Nahtirah Trousers",
		feet="Thur. Boots +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}


    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",head="Haruspex hat",ear2="Loquacious Earring",hands="Thaumas Gloves"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Thew Bomblet",
		head="Uk'uxkaj cap",
		neck="Asperity Necklace",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Mekosu. Harness",
		hands=gear.AugManibozhoGloves,
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back="Atheling Mantle",
		waist="Caudata Belt",
		legs="Manibozho Brais",
		feet="Manibozho Boots"}
    sets.precast.WSAcc = {ammo="Honed Tathlum",back="Letalis Mantle",legs="Wukong's Haka. +1"}
    sets.precast.WSMod = {head="Felistris Mask",legs="Hesychast's Hose"}
    sets.precast.MaxTP = {ear1="Bladeborn Earring",ear2="Steelflash Earring"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
    sets.precast.WS.Mod = set_combine(sets.precast.WS, sets.precast.WSMod)

    -- Specific weaponskill sets.
    
    -- legs={name="Quiahuiz Trousers", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','STR+8'}}}

    sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {		
		head="Whirlpool Mask",
		neck="Thunder Gorget",		
		hands="Hes. Gloves +1",
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		legs="Quiahuiz Trousers"})
    sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {
		head="Felistris Mask",
		neck="Light Gorget",
		hands="Hes. Gloves +1"})
    sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {
        ear1="Brutal Earring",
		ear2="Moonshade Earring",		
		back="Buquwik Cape"})
    sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {
        neck="Rancor Collar",
		ear1="Brutal Earring",
		ear2="Moonshade Earring"})
    sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {
		neck="Rancor Collar",
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		back="Buquwik Cape"})
    sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {
		head="Felistris Mask",
		neck=gear.ElementalGorget,
		hands="Hes. Gloves +1"})
    sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {waist="Chaac Belt"})

    sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
    sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
    sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
    sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc)
    sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc)
    sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
    sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
    sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

    sets.precast.WS["Raging Fists"].Mod = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSMod)
    sets.precast.WS["Howling Fist"].Mod = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSMod)
    sets.precast.WS["Asuran Fists"].Mod = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSMod)
    sets.precast.WS["Ascetic's Fury"].Mod = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSMod)
    sets.precast.WS["Victory Smite"].Mod = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSMod)
    sets.precast.WS["Shijin Spiral"].Mod = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSMod)
    sets.precast.WS["Dragon Kick"].Mod = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSMod)
    sets.precast.WS["Tornado Kick"].Mod = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSMod)


    sets.precast.WS['Cataclysm'] = {}
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Whirlpool Mask",
		ear2="Loquacious Earring",        
        waist="Black Belt"}
        
    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Whirlpool Mask",
		ear2="Loquacious Earring",        
        waist="Black Belt"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		head="Ocelomeh Headpiece +1",
		neck="Wiglen Gorget",
		body="Mel. Cyclas +2",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring"}
    

    -- Idle sets
    sets.idle = {
		ammo="Ginsen",
		head="Ocelomeh Headpiece +1",
		neck="Wiglen Gorget",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Melee Cyclas +2",
		hands="Otronif Gloves",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring",
		back="Scuta Cape",
		waist="Black Belt",
		legs="Manibozho brais",
		feet="Soku. Sune-Ate"}

    sets.idle.Town = {		
		ammo="Ginsen",
		head="Felistris Mask",
		neck="Asperity necklace",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Mekosu. Harness",
		hands="Hes. Gloves +1",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back="Anchoret's Mantle",
		waist="Windbuffet Belt +1",
		legs="Wukong's Haka. +1",
		feet="Soku. Sune-Ate"}
    
    sets.idle.Weak = {ammo="Thew Bomblet",
        head="Felistris Mask",neck="Wiglen Gorget",ear1="Brutal Earring",ear2="Bloodgem Earring",
        body="Hesychast's Cyclas",hands="Hesychast's Gloves +1",ring1="Sheltered Ring",ring2="Meridian Ring",
        back="Iximulew Cape",waist="Black Belt",legs="Qaaxo Tights",feet="Herald's Gaiters"}
    
    -- Defense sets
    sets.defense.PDT = {
		ammo="Iron Gobbet",
		head="Whirlpool Mask",
		neck="Twilight Torque",
		body="Anchorite's cyclas +1",
		hands="Otronif Gloves",
		ring1="Dark Ring",
		ring2="Dark Ring",
		back="Mollusca Mantle",
		waist="Black Belt",
		legs="Nahtirah Trousers",
		feet="Otronif Boots"}

    sets.defense.HP = {ammo="Iron Gobbet",
        head="Uk'uxkaj Cap",neck="Lavalier +1",ear1="Brutal Earring",ear2="Bloodgem Earring",
        body="Hesychast's Cyclas",hands="Hesychast's Gloves +1",ring1="K'ayres Ring",ring2="Meridian Ring",
        back="Shadow Mantle",waist="Black Belt",legs="Hesychast's Hose +1",feet="Hesychast's Gaiters +1"}

    sets.defense.MDT = {
		ammo="Demonry Stone",
		head="Whirlpool Mask",
		neck="Twilight Torque",
		body="Otronif Harness",
		hands="Otronif Gloves",
		ring1="Dark Ring",
		ring2="Shadow Ring",
		back="Mollusca Mantle",
		waist="Black Belt",
		legs="Nahtirah Trousers",
		feet="Otronif Boots"}

    sets.Kiting = {feet="Hermes' Sandals +1"}

    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee sets
    sets.engaged = {		
		ammo="Ginsen",
		head="Felistris Mask",
		neck="Asperity necklace",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Mekosu. Harness",
		hands="Hes. Gloves +1",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back="Atheling Mantle",
		waist="Windbuffet Belt +1",
		legs="Quiahuiz Trousers",
		feet="Soku. Sune-Ate"}
    sets.engaged.SomeAcc = {		
		ammo="Ginsen",
		head="Felistris Mask",
		neck="Asperity necklace",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Mekosu. Harness",
		hands="Hes. Gloves +1",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back="Letalis mantle",
		waist="Windbuffet Belt +1",
		legs="Manibozho Brais",
		feet="Soku. Sune-Ate"}
    sets.engaged.Acc = {
		ammo="Honed Tathlum",
		head="Whirlpool Mask",
		neck="Iqabi necklace",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Mekosu. Harness",
		hands="Hes. Gloves +1",
		ring1="Rajas Ring",
		ring2="Enlivened Ring",
		back="Anchoret's Mantle",
		waist="Hurch'lan Sash",
		legs="Wukong's Haka. +1",
		feet="Manibozho Boots"}
    sets.engaged.Fodder = {
		ammo="Ginsen",
		head="Felistris Mask",
		neck="Asperity necklace",
		ear1="Brutal earring",
		ear2="Tripudio earring",
		body="Mekosu. Harness",
		hands="Otronif Gloves",
		ring1="Rajas Ring",
		ring2="K'ayres ring",
		back="Letalis mantle",
		waist="Windbuffet Belt +1",
		legs="Otronif Brais",
		feet="Soku. Sune-Ate"}

    -- Defensive melee hybrid sets
    sets.engaged.PDT = {
		ammo="Iron Gobbet",
		head="Whirlpool Mask",
		neck="Twilight Torque",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Anchorite's cyclas +1",
		hands="Otronif Gloves",
		ring1="Dark Ring",
		ring2="Dark Ring",
		back="Mollusca Mantle",
		waist="Black Belt",
		legs="Nahtirah Trousers",
		feet="Otronif Boots"}
    sets.engaged.SomeAcc.PDT = {
		ammo="Honed Tathlum",
		head="Otronif Mask +1",
		neck="Twilight Torque",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Emet Harness +1",
		hands="Hes. Gloves +1",
		ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
		ring2="Patricius Ring",
		back="Letalis Mantle",
		waist="Black Belt",
		legs="Manibozho Brais",
		feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT = {
		ammo="Honed Tathlum",
		head="Whirlpool Mask",
		neck="Twilight Torque",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
		body="Anchorite's cyclas +1",
		hands="Hes. Gloves +1",
		ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
		ring2="Patricius Ring",
		back="Letalis Mantle",
		waist="Black Belt",
		legs="Manibozho Brais",
		feet="Otronif Boots"}
    sets.engaged.Counter = {ammo="Thew Bomblet",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="K'ayres Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt",legs="Anchorite's Hose",feet="Otronif Boots +1"}
    sets.engaged.Acc.Counter = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Hesychast's Gloves +1",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Letalis Mantle",waist="Anguinus Belt",legs="Anchorite's Hose",feet="Otronif Boots +1"}


    -- Hundred Fists/Impetus melee set mods
    sets.engaged.HF = set_combine(sets.engaged)
    sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Tantra Cyclas +2"})
    sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
    sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {body="Tantra Cyclas +2"})
    sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
    sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Tantra Cyclas +2"})
    sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter)
    sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {body="Tantra Cyclas +2"})


    -- Footwork combat form
    sets.engaged.Footwork = {ammo="Thew Bomblet",
        head="Felistris Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Hesychast's Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt",legs="Hesychast's Hose +1",feet="Anchorite's Gaiters +1"}
    sets.engaged.Footwork.Acc = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Hesychast's Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Letalis Mantle",waist="Anguinus Belt",legs="Hesychast's Hose +1",feet="Anchorite's Gaiters +1"}
        
    -- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
    sets.impetus_body = {body="Tantra Cyclas +2"}
    sets.footwork_kick_feet = {feet="Anchorite's Gaiters +1"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    -- Don't gearswap for weaponskills when Defense is on.
    if spell.type == 'WeaponSkill' and state.DefenseMode.current ~= 'None' then
        eventArgs.handled = true
    end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and state.DefenseMode.current ~= 'None' then
        if state.Buff.Impetus and (spell.english == "Ascetic's Fury" or spell.english == "Victory Smite") then
            -- Need 6 hits at capped dDex, or 9 hits if dDex is uncapped, for Tantra to tie or win.
            if (state.OffenseMode.current == 'Fodder' and info.impetus_hit_count > 5) or (info.impetus_hit_count > 8) then
                equip(sets.impetus_body)
            end
        elseif state.Buff.Footwork and (spell.english == "Dragon's Kick" or spell.english == "Tornado Kick") then
            equip(sets.footwork_kick_feet)
        end
        
        -- Replace Moonshade Earring if we're at cap TP
        if player.tp == 3000 then
            equip(sets.precast.MaxTP)
        end
		-- Chakra replace Iximulew Cape with Shadow Mantle for Darksday
		if spell.english == 'Chakra' and world.day == 'Darksday' then
			equip({back="Shadow Mantle"})
		end	
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and not spell.interrupted and state.FootworkWS and state.Buff.Footwork then
        send_command('cancel Footwork')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Set Footwork as combat form any time it's active and Hundred Fists is not.
    if buff == 'Footwork' and gain and not buffactive['hundred fists'] then
        state.CombatForm:set('Footwork')
    elseif buff == "Hundred Fists" and not gain and buffactive.footwork then
        state.CombatForm:set('Footwork')
    else
        state.CombatForm:reset()
    end
    
    -- Hundred Fists and Impetus modify the custom melee groups
    if buff == "Hundred Fists" or buff == "Impetus" then
        classes.CustomMeleeGroups:clear()
        
        if (buff == "Hundred Fists" and gain) or buffactive['hundred fists'] then
            classes.CustomMeleeGroups:append('HF')
        end
        
        if (buff == "Impetus" and gain) or buffactive.impetus then
            classes.CustomMeleeGroups:append('Impetus')
        end
    end

    -- Update gear if any of the above changed
    if buff == "Hundred Fists" or buff == "Impetus" or buff == "Footwork" then
        handle_equipping_gear(player.status)
    end
	
	if buff == 'sleep' and player.hp > 200 and player.status == "Engaged" then
        if gain then
			equip(sets.Slept)
			add_to_chat(39,'You are slept... [Equipping Frenzy Sallet]')			
        else
            send_command('gs c update')
			add_to_chat(200,'You are awake... [Removing Frenzy Sallet]')
        end
    end
	if buff == 'Reive Mark' then
        if gain then
			equip(sets.ReiveNeck)
			add_to_chat(39,'Entering a Reive... [Equipping Reive Neck]')
			disable('neck')
        else
            send_command('gs c update')
			add_to_chat(200,'Left a Reive... [Removing Reive Neck]')
			enable('neck')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if player.hpp < 75 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
    
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_combat_form()
    update_melee_groups()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    if buffactive.footwork and not buffactive['hundred fists'] then
        state.CombatForm:set('Footwork')
    else
        state.CombatForm:reset()
    end
end

function update_melee_groups()
    classes.CustomMeleeGroups:clear()
    
    if buffactive['hundred fists'] then
        classes.CustomMeleeGroups:append('HF')
    end
    
    if buffactive.impetus then
        classes.CustomMeleeGroups:append('Impetus')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 12)
    else
        set_macro_page(1, 12)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Custom event hooks.
-------------------------------------------------------------------------------------------------------------------

-- Keep track of the current hit count while Impetus is up.
function on_action_for_impetus(action)
    if state.Buff.Impetus then
        -- count melee hits by player
        if action.actor_id == player.id then
            if action.category == 1 then
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- Reactions (bitset):
                        -- 1 = evade
                        -- 2 = parry
                        -- 4 = block/guard
                        -- 8 = hit
                        -- 16 = JA/weaponskill?
                        -- If action.reaction has bits 1 or 2 set, it missed or was parried. Reset count.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 1
                        end
                    end
                end
            elseif action.category == 3 then
                -- Missed weaponskill hits will reset the counter.  Can we tell?
                -- Reaction always seems to be 24 (what does this value mean? 8=hit, 16=?)
                -- Can't tell if any hits were missed, so have to assume all hit.
                -- Increment by the minimum number of weaponskill hits: 2.
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- This will only be if the entire weaponskill missed or was parried.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 2
                        end
                    end
                end
            end
        elseif action.actor_id ~= player.id and action.category == 1 then
            -- If mob hits the player, check for counters.
            for _,target in pairs(action.targets) do
                if target.id == player.id then
                    for _,action in pairs(target.actions) do
                        -- Spike effect animation:
                        -- 63 = counter
                        -- ?? = missed counter
                        if action.has_spike_effect then
                            -- spike_effect_message of 592 == missed counter
                            if action.spike_effect_message == 592 then
                                info.impetus_hit_count = 0
                            elseif action.spike_effect_animation == 63 then
                                info.impetus_hit_count = info.impetus_hit_count + 1
                            end
                        end
                    end
                end
            end
        end
        
        --add_to_chat(123,'Current Impetus hit count = ' .. tostring(info.impetus_hit_count))
    else
        info.impetus_hit_count = 0
    end
    
end

