-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()

end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    options.CastingModes = {'Normal', 'Resistant', 'Proc'}
    options.OffenseModes = {'None', 'Normal'}
    options.DefenseModes = {'Normal'}
    options.WeaponskillModes = {'Normal'}
    options.IdleModes = {'Normal', 'PDT', 'Vanity'}
    options.RestingModes = {'Normal'}
    options.PhysicalDefenseModes = {'PDT'}
    options.MagicalDefenseModes = {'MDT'}

    state.Defense.PhysicalMode = 'PDT'
    state.OffenseMode = 'None'

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
		
	IceNukes = S{'Blizzard', 'Blizzard II', 'Blizzard III', 'Blizzard IV', 'Blizzard V', 
				'Blizzaga', 'Blizzaga II', 'Blizzaga III', 'Blizzaja', 'Freeze', 'Freeze II'}

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
	gear.mab_hagondes = {name="Hagondes Pants", augments={'Phys. dmg. taken -2%','Mag.Atk.Bns.+16'}}

    -- Default macro set/book
    set_macro_page(4, 17)
end


-- Called when this job file is unloaded (eg: job change)
function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {body="Arch. Coat"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
		ammo="Impatiens",
        head="Nahtirah Hat",
		ear2="Loquacious Earring",
		--body="Marduk's Jubbah +1",
		hands="Repartie Gloves",
		ring1="Prolix Ring",
		back="Swith Cape",
		waist="Witful Belt",
		legs="Artsieq Hose",
		feet="Regal pumps +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris", back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {
		head="Nahtirah Hat",
		ear2="Loquacious Earring",
		body="Hedera Cotehardie",
		hands="Bokwus Gloves",
		ring1="Prolix Ring",
		back="Swith Cape",
		waist="Witful Belt",
		legs="Artsieq Hose",
		feet="Hagondes Sabots"}

    sets.midcast.Cure = {
		main="Tamaxchi",
		sub="Genbu's Shield",
		head="Nahtirah Hat",
		ear2="Loquacious Earring",
		body="Heka's Kalasiris",
		hands="Serpentes Cuffs",
		ring1="Prolix Ring",
		ring2="Sirona's Ring",
		back="Oretania's Cape",
		waist="Witful Belt",
		legs="Nares Trews",
		feet="Serpentes Sabots"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        neck="Colossus's Torque",
        body="Manasa Chasuble",
		hands="Ayao's Gages",
        legs="Portent Pants"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast['Enfeebling Magic'] = {
		main="Kaladanda",
		sub="Mephitis Grip",
		ammo="Sturm's Report",
        head="Nahtirah Hat",
		neck="Weike Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Vanir Cotehardie",
		hands="Yaoyotl Gloves",
		ring1="Strendu Ring",
		ring2="Sangoma Ring",
        back="Bane Cape",
		legs="Bokwus Slops",
		feet="Artsieq Boots"}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {
		main="Kaladanda",
		sub="Mephitis Grip",
		ammo="Sturm's Report",
        head="Nahtirah Hat",
		neck="Weike Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Vanir Cotehardie",
		hands="Yaoyotl Gloves",
		ring1="Strendu Ring",
		ring2="Sangoma Ring",
        back="Bane Cape",
		legs="Bokwus Slops",
		feet="Artsieq Boots"}

    sets.midcast.Drain = {
		main="Kaladanda",
		sub="Mephitis Grip",
		ammo="Sturm's Report",
        head="Nahtirah Hat",
		neck="Aesir Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Vanir Cotehardie",
		hands="Yaoyotl Gloves",
		ring1="Strendu Ring",
		ring2="Sangoma Ring",
        back="Bane Cape",
		waist="Fucho-no-Obi",
		legs="Bokwus Slops",
		feet="Goetia Sabots +2"}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
		main="Apamajas II",
		sub="Wizzan Grip",
		ammo="Impatiens",
        head="Nahtirah Hat",
		neck="Eddy Necklace",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Hedera Cotehardie",
		hands="Yaoyotl Gloves",
		ring1="Prolix Ring",
		ring2="Sangoma Ring",
        back="Bane Cape",
		waist="Aswang Sash",
		legs="Artsieq Hose",
		feet="Artsieq Boots"}

    sets.midcast.BardSong = {
		main="Kaladanda",
		sub="Mephitis Grip",
		ammo="Sturm's Report",
        head="Nahtirah Hat",
		neck="Weike Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Hagondes Coat",
		hands="Yaoyotl Gloves",
		ring1="Strendu Ring",
		ring2="Sangoma Ring",
        back="Bane Cape",
		waist="Witful Belt",
		legs="Orvail Pants +1",
		feet="Artsieq Boots"}


    -- Elemental Magic sets	
	
    sets.midcast['Elemental Magic'] = {
		main="Kaladanda",
		sub="Wizzan Grip",
		--sub="Zuuxowu Grip",
		ammo="Witchstone",
		--ammo="Dosis Tathlum",
        head="Bokwus circlet",
		neck="Eddy Necklace",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
        body="Bokwus Robe",
		hands="Yaoyotl Gloves",
		ring1="Strendu Ring",
		ring2="Acumen Ring",
        back=gear.ElementalCape,
		waist=gear.ElementalObi,
		legs=gear.mab_hagondes,
		feet="Umbani Boots"}	
		
	sets.midcast.IceNukes = set_combine(sets.midcast['Elemental Magic'], {
		main="Ngqoqwanb"})

    sets.midcast['Elemental Magic'].Resistant = {
		main="Kaladanda",
		sub="Wizzan Grip",
		ammo="Witchstone",
		--ammo="Dosis Tathlum",
        head="Bokwus circlet",
		neck="Eddy Necklace",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
        body="Arch. Coat",
		hands=gear.macc_hagondes,
		ring1="Diamond Ring",
		ring2="Acumen Ring",
        back="Toro Cape",
		waist=gear.ElementalObi,
		legs=gear.mab_hagondes,
		feet="Bokwus Boots"}
		
	sets.midcast.IceNukes.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Ngqoqwanb"})	
	
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
	


    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = {
		main="Ngqoqwanb",
		sub="Mephitis Grip",
		ammo="Impatiens",
        head="Nahtirah Hat",
		neck="Twilight Torque",
		ear1="Bloodgem Earring",
		ear2="Loquacious Earring",
        body="Manasa Chasuble",
		hands="Serpentes Cuffs",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring",
        back="Swith Cape",
		waist="Witful Belt",
		legs="Nares Trews",
		feet="Artsieq Boots"}


    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Chatoyant Staff",
		ammo="Clarus Stone",
        head="Wivre Hairpin",
		neck="Grandiose Chain",
        body="Heka's Kalasiris",
		hands="Serpentes Cuffs",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring",
        waist="Hierarch Belt",
		legs="Nares Trews",
		feet="Serpentes Sabots"}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {
		main="Bolelabunga",
		sub="Genbu's Shield",
		ammo="Witchstone",
		head="Wivre Hairpin",
		neck="Wiglen Gorget",
		ear1="Moonshade Earring",
		ear2="Loquacious Earring",
		body="Hagondes Coat",
		hands="Serpentes Cuffs",
		ring1="Sheltered Ring",
		ring2="Sangoma Ring",
		back="Toro Cape",
		waist="Hierarch Belt",
		legs="Assid. Pants +1",
		feet="Serpentes Sabots"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {
		main="Terra's Staff",
		sub="Oneiros grip",
		ammo="Witchstone",
		head="Nahtirah Hat",
		neck="Twilight Torque",
		ear1="Bloodgem Earring",
		ear2="Loquacious Earring",
		body="Hagondes Coat",
		hands="Yaoyotl Gloves",
		ring1="Dark Ring",
		ring2="Dark Ring",
		back="Umbra Cape",
		waist="Hierarch Belt",
		legs="Hagondes Pants",
		feet="Hagondes Sabots"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Witchstone",
        head="Hagondes Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Hagondes Sabots"}
    
    -- Town gear.
    sets.idle.Town = {
		main="Kaladanda",
		sub="Wizzan Grip",
		ammo="Witchstone",
		head="Nahtirah Hat",
		neck="Eddy necklace",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
        body="Arch. Coat",
		hands="Yaoyotl Gloves",
		ring1="Strendu Ring",
		ring2="Acumen Ring",
        back="Toro Cape",
		waist="Sekhmet Corset",
		legs="Artsieq Hose",
		feet="Umbani Boots"}
		
	sets.idle.Vanity = {
		main="Kaladanda",
		sub="Wizzan Grip",
		ammo="Witchstone",
		head="Nahtirah Hat",
		neck="Eddy necklace",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
        body="Arch. Coat",
		hands="Yaoyotl Gloves",
		ring1="Strendu Ring",
		ring2="Acumen Ring",
        back="Toro Cape",
		waist="Sekhmet Corset",
		legs="Artsieq Hose",
		feet="Umbani Boots"}
        
    -- Defense sets

    sets.defense.PDT = {
		main="Terra's Staff",
		sub="Oneiros grip",
		ammo="Witchstone",
		head="Nahtirah Hat",
		neck="Twilight Torque",
		ear1="Bloodgem Earring",
		ear2="Loquacious Earring",
		body="Hagondes Coat",
		hands="Yaoyotl Gloves",
		ring1="Dark Ring",
		ring2="Dark Ring",
		back="Umbra Cape",
		waist="Hierarch Belt",
		legs="Hagondes Pants",
		feet="Hagondes Sabots"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}
    

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        waist="Chaac Belt"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"	
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sekhmet Corset"			
        if state.CastingMode == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end	
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        -- Default base equipment layer is fast recast.
        equip(sets.midcast.FastRecast)
	
		
        if spell.skill == 'Elemental Magic' and state.CastingMode == 'Proc' then
            add_to_chat(15,'Proc mode, no damage gear for midcast.')
            eventArgs.handled = true       
		end
    end	
end


function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted and spell.english == 'Mana Wall' then
        enable('feet')
        equip(sets.buff['Mana Wall'])
        disable('feet')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        if IceNukes:contains(spell.english) then
        return 'IceNukes'
		end		
		--[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end	
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'OffenseMode' then
        if newValue == 'Normal' then
            disable('main','sub')
        else
            enable('main','sub')
        end
    elseif stateField == 'Reset' then
        if state.OffenseMode == 'None' then
            enable('main','sub')
        end
    end
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local meleeString = ''
    if state.OffenseMode == 'Normal' then
        meleeString = 'Melee: Weapons locked, '
    end
    
    local defenseString = ''
    if state.Defense.Active then
        local defMode = state.Defense.PhysicalMode
        if state.Defense.Type == 'Magical' then
            defMode = state.Defense.MagicalMode
        end

        defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
    end

    add_to_chat(122,meleeString..'Casting ['..state.CastingMode..'], Idle ['..state.IdleMode..'], '..defenseString..
        'Kiting: '..on_off_names[state.Kiting])

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------


