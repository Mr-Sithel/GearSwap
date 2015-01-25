--[[
*** I don't take full credit for this file. I've used various other files and some of my own ***
----------------------
GearSwap Version 0.898
----------------------
File Created 12-26-14
If you found this file, it was probably through bluegartr. If any bugs or errors are 
found please send me a PM there and I'll try to fix it.
*For some of these features to work, the Shortcuts, Cancel addon and Timers plugin are required.
----------------------
Macro lists- case sensitive (If in chat remove the /console & add //, example //gs c acc)

/console gs c encumber	(encumber toggle- Buramenk'ah,Excalibur,Burtgang,Almace - Defaults to Excalibur)
/console gs c idle		(idle toggle Regen,Normal,Town)
/console gs c acc		(acc toggle for TP,WS,Hybrid) (Accuracy levels are Normal, LightAcc, FullAcc)
/console gs c hybrid	(hybrid toggle for Hybrid TP)
/console gs c update	(updates current gear set, also set to the F10 key on keyboard)
/console gs c active	(will show all active sets and toggles that are active or not)
/console gs c distance	(Set target distance, default is 5 yalms)
/console gs c shield 	(Toggles between Aegis and Ochain - Aegis is default)

- All Toggles below are OFF by default.
/console gs c pdt		(toggle/locks pdt set at all times, during Idle,TP,WS,JA,MA ect.)
/console gs c mdt		(toggle/locks mdt set at all times, during Idle,TP,WS,JA,MA ect.)
/console gs c th		(toggle/locks Chaac Belt at these times, during Idle,TP)
/console gs c rings		(toggle/locks Warp Ring & Capacity Ring at all times, during Idle,TP,WS,JA,MA ect.)
/console gs c twilight	(toggle/locks Twilight set at all times for reraise, during Idle,TP,WS,JA,MA ect.)
/console gs c cpmantle	(toggle/locks Mecisto. Mantle at all times for Capacity Points farming, during Idle,TP,WS,JA,MA ect.)
/console gs c movement	(toggle/locks movement gear)
--]]     
	
    function get_sets()
            ACC_Index = 1
            ACC_Array = {"Normal","LightAcc","FullAcc"} -- Default ACC Set Is Normal. The First TP Set Of Your Main Weapon Is Normal.
            Idle_Index = 1
            Idle_Array = {"Normal","Regen","Town"} -- Default Idle Set Is Normal
			Encumber_Index = 1 -- Encumber Weapons
			Armor = 'None'
            Twilight = 'OFF'
            TH = 'OFF' -- Chaac Belt Toggle
			Rings = 'OFF' -- Capacity/Warp Ring Toggle			
			Mecisto = 'OFF' -- Mecisto. Mantle (Capacity Points Back) Toggle Default			
			Movement = 'OFF' -- Movement Gear Toggle Default
			Shield = 'Aegis' -- Shield Defaults to Aegis
            target_distance = 5 -- Set Default Distance Here			
			
			--Default Macro Set for PLD
			send_command('input /macro book 10;wait .1;input /macro set 1')

			--Binds 
			send_command('bind f12 gs c update')
			send_command('bind f9 ws Chant du Cygne <t>')
			send_command('bind f10 gs c shield')
	
			--Slept
			sets.Slept = {neck="Berserker's Torque"}
			
			--Twilight Set
			sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
			
			--Aegis
			sets.Aegis = {sub="Aegis"}
			
			--Ochain
			sets.Ochain = {sub="Ochain"}
	
			--Capacity Points Mantle
			sets.Mecisto = {back="Mecisto. Mantle"}			
	
			--Movement Set
			sets.Movement = {legs="Blood Cuisses"}
	
			--Chaac Belt
			sets.TH = {waist="Chaac Belt"}			
	
			--Capacity/Warp Ring
			sets.Rings = {ring1="Capacity Ring",ring2="Warp Ring"}
	
			--encumbrance 
			sets.Encumber = {}
			Encumber_Set_Names = {'Excalibur','Buramenk','Almace','Burtgang'}	
			sets.Encumber['Buramenk'] = {main="Buramenk'ah",sub="Aegis"}
			sets.Encumber['Excalibur'] = {main="Excalibur",sub="Aegis"}
			sets.Encumber['Almace'] = {main="Almace",sub="Aegis"}
			sets.Encumber['Burtgang'] = {main="Burtgang",sub="Aegis"}
			
			
     
            -- Idle/Town/Regen Sets --
            sets.Idle = {}
			sets.Idle.Normal = {
				ammo="Iron Gobbet",
				head="Ighwa Cap",
				neck="Twilight Torque",
				ear1="Creed Earring",
				ear2="Bloodgem Earring",
				body="Reverence Surcoat +1",
				hands="Xaddi Gauntlets",
				ring1={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
				ring2={ name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -4%',}},
				back="Shadow Mantle",
				waist="Nierenschutz",
				legs="Reverence Breeches",
				feet="Whirlpool Greaves"}		
		
			sets.Idle.Town = {
				ammo="Iron Gobbet",
				head="Otomi helm",
				neck="Twilight Torque",
				ear1="Creed Earring",
				ear2="Bloodgem Earring",
				body="Reverence Surcoat +1",
				hands="Xaddi Gauntlets",
				ring1={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
				ring2={ name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -4%',}},
				back="Shadow Mantle",
				waist="Nierenschutz",
				legs="Enif cosciales",
				feet="Cizin greaves"}				
				
			sets.Idle.Regen = set_combine(sets.Idle.Normal,{
				head="Twilight Helm",
				neck="Wiglen Gorget",
				body="Ares' Cuirass +1",
				ring1="Paguroidea Ring",
				ring2="Sheltered Ring",
				back="Scuta Cape",
				feet="Kaiser schuhs"})            
     
            -- TP Base Set -- (Any Weapon beside Relic,Emp or Mythic)
            sets.TP = {
				ammo="Jukukik Feather",
				head="Ighwa Cap",
				neck="Agitator's Collar",
				ear1="Suppanomimi",
				ear2="Ethereal Earring",
				body="Rev. Surcoat +1",
				hands={ name="Xaddi Gauntlets", augments={'Accuracy+13','"Store TP"+2','"Dbl.Atk."+1',}},
				ring1="Rajas Ring",
				ring2="K'ayres Ring",
				back="Weard Mantle",
				waist="Anguinus Belt",
				legs="Cizin Breeches",
				feet="Whirlpool Greaves"}
			sets.TP.LightAcc = set_combine(sets.TP,{
				ear1="Steelflash earring",
				ear2="Bladeborn earring"})
			sets.TP.FullAcc = set_combine(sets.TP.LightAcc,{})
			
            -- Burtgang(AM3 Down) TP Sets --
            sets.TP.Burtgang = {}
            sets.TP.Burtgang.LightAcc = set_combine(sets.TP.Burtgang,{})
            sets.TP.Burtgang.FullAcc = set_combine(sets.TP.Burtgang.LightAcc,{})			
                           
            -- Burtgang(AM3 Up) TP Sets --
            sets.TP.Burtgang.AM3 = set_combine(sets.TP.Burtgang,{})
            sets.TP.Burtgang.LightAcc.AM3 = set_combine(sets.TP.Burtgang.AM3,{})
            sets.TP.Burtgang.FullAcc.AM3 = set_combine(sets.TP.Burtgang.LightAcc.AM3,{})    
            
            -- Excalibur TP Sets --
            sets.TP.Excalibur = {}
            sets.TP.Excalibur.LightAcc = set_combine(sets.TP.Excalibur,{})
            sets.TP.Excalibur.FullAcc = set_combine(sets.TP.Excalibur.LightAcc,{})
     
            -- Excalibur(Ionis) TP Sets --
            sets.TP.Excalibur.Ionis = set_combine(sets.TP.Excalibur,{})
            sets.TP.Excalibur.LightAcc.Ionis = set_combine(sets.TP.Excalibur.Ionis,{})
            sets.TP.Excalibur.FullAcc.Ionis = set_combine(sets.TP.Excalibur.LightAcc.Ionis,{})
     
            -- Almace TP Sets --
            sets.TP.Almace = {}
            sets.TP.Almace.LightAcc = set_combine(sets.TP.Almace,{})
            sets.TP.Almace.FullAcc = set_combine(sets.TP.Almace.LightAcc,{})
     
            -- Almace(Ionis) TP Sets --
            sets.TP.Almace.Ionis = set_combine(sets.TP.Almace,{})
            sets.TP.Almace.LightAcc.Ionis = set_combine(sets.TP.Almace.Ionis,{})
            sets.TP.Almace.FullAcc.Ionis = set_combine(sets.TP.Almace.LightAcc.Ionis,{})           
     
            -- PDT/MDT Sets --
            sets.PDT = {
				head="Reverence Coronet +1",
				neck="Twilight Torque",
				ear1="Black Earring",
				ear2="Colossus's Earring",
				body="Emet Harness +1",
				hands="Reverence Gauntlets +1",
				ring1="Dark Ring",
				ring2="Dark Ring",
				back="Mollusca Mantle",
				waist="Flume Belt",
				legs="Reverence Breeches +1",
				feet="Reverence Leggings +1"}
	
			sets.MDT = set_combine(sets.PDT,{
				ammo="Demonry Stone",
				ear1="Creed Earring",
				ear2="Bloodgem Earring",
				body="Reverence Surcoat +1",
				ring2="Shadow Ring",
				back="Engulfer Cape",
				waist="Creed Baudrier",
				legs="Osmium Cuisses"})
     
            -- Hybrid Sets --
            sets.TP.Hybrid = set_combine(sets.PDT,{
				ammo="Iron Gobbet",
				head="Ighwa Cap",
				neck="Agitator's Collar",
				ear1="Suppanomimi",
				ear2="Steelflash Earring",
				body="Reverence Surcoat +1",
				hands="Xaddi Gauntlets",
				ring1={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
				ring2={ name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -4%',}},
				back="Weard Mantle",
				waist="Nierenschutz",
				legs="Reverence Breeches",
				feet="Whirlpool Greaves"})
            sets.TP.Hybrid.LightAcc = set_combine(sets.TP.Hybrid,{
				head="Yaoyotl Helm",
				waist="Dynamic Belt +1"})
            sets.TP.Hybrid.FullAcc = set_combine(sets.TP.Hybrid.LightAcc,{
				neck="Iqabi Necklace",
				ear2="Zennaroi Earring",
				body="Mes. Haubergeon",
				hands="Buremte Gloves",				
				waist="Olseni Belt"})
     
            -- WS Base Set --
            sets.WS = {				
				head="Otomi Helm",
				neck="Iqabi necklace",
				ear1="Steelflash earring",
				ear2="Bladeborn earring",
				body="Mes. Haubergeon",
				hands="Miki. Gauntlets",
				ring1="Rajas Ring",
				ring2="K'ayres Ring",
				back="Buquwik Cape",
				waist="Caudata Belt",
				legs="Miki. Cuisses",
				feet="Cizin Greaves"}
     
            -- WS Chant du Cygne Sets --
            sets.WS["Chant du Cygne"] = {
				ammo="Jukukik Feather",
				head="Yaoyotl Helm",
				neck="Rancor Collar",
				ear1="Moonshade earring",
				ear2="Brutal Earring",
				body="Mes. Haubergeon",
				hands={ name="Xaddi Gauntlets", augments={'Accuracy+13','"Store TP"+2','"Dbl.Atk."+1',}},
				ring1="Rajas Ring",
				ring2="Thundersoul Ring",
				back="Atheling Mantle",
				waist="Snow belt",
				legs="Mikinaak cuisses",
				feet="Whirlpool Greaves"}				
            sets.WS["Chant du Cygne"].LightAcc = set_combine(sets.WS["Chant du Cygne"],{
				head="Gavialis Helm",
				ear2="Zennaroi Earring",
				body="Mes. Haubergeon",
				back={ name="Takaha Mantle", augments={'STR+1','"Zanshin"+4','"Store TP"+3',}},
				waist="Light Belt",
				legs="Wukong's Haka. +1",
				feet="Waki. Sune-Ate +1"})				
            sets.WS["Chant du Cygne"].FullAcc = set_combine(sets.WS["Chant du Cygne"].LightAcc,{})
			
			-- WS Knights of Round Sets --
            sets.WS["Knights of Round"] = {}
            sets.WS["Knights of Round"].LightAcc = set_combine(sets.WS["Knights of Round"],{})
            sets.WS["Knights of Round"].FullAcc = set_combine(sets.WS["Knights of Round"].LightAcc,{})
			
			-- WS Requiescat Sets --
            sets.WS["Requiescat"] = {}
            sets.WS["Requiescat"].LightAcc = set_combine(sets.WS["Requiescat"],{})
            sets.WS["Requiescat"].FullAcc = set_combine(sets.WS["Requiescat"].LightAcc,{})
			
			-- WS Atonement Sets --
            sets.WS["Atonement"] = {}				
            sets.WS["Atonement"].LightAcc = set_combine(sets.WS["Atonement"],{})				
            sets.WS["Atonement"].FullAcc = set_combine(sets.WS["Atonement"].LightAcc,{})
			
			-- WS Vorpal Blade Sets --
            sets.WS["Vorpal Blade"] = {}
            sets.WS["Vorpal Blade"].LightAcc = set_combine(sets.WS["Vorpal Blade"],{})
            sets.WS["Vorpal Blade"].FullAcc = set_combine(sets.WS["Vorpal Blade"].LightAcc,{})
			
			-- WS Aeolian Edge Sets --
            sets.WS["Aeolian Edge"] = {}
            sets.WS["Aeolian Edge"].LightAcc = set_combine(sets.WS["Aeolian Edge"],{})
            sets.WS["Aeolian Edge"].FullAcc = set_combine(sets.WS["Aeolian Edge"].LightAcc,{})
			
			-- JA Sets --
			sets.JA = {}
			sets.JA['Invincible'] = {legs="Cab. Breeches +1"}
			sets.JA['Holy Circle'] = {feet="Rev. Leggings +1"}
			sets.JA['Shield Bash'] = {hands="Cab. Gauntlets +1"}
			sets.JA['Sentinel'] = {feet="Cab. Leggings +1"}
			sets.JA['Rampart'] = {head="Cab. Coronet +1"}
			sets.JA['Fealty'] = {body="Caballarius Surcoat"}
			sets.JA['Divine Emblem'] = {feet="Creed Sabatons +2"}
			sets.JA['Cover'] = {head="Rev. Coronet +1"}
			
			-- Add MND for Chivalry
			sets.JA['Chivalry'] = {
				head="Reverence Coronet +1",
				body="Reverence Surcoat +1",
				hands="Reverence Gauntlets +1",
				ring1="Leviathan Ring",
				ring2="Aquasoul Ring",
				back="Weard Mantle",
				legs="Reverence Breeches +1",
				feet="Whirlpool Greaves"}
				
			-- ENM for Provoke
			sets.JA['Provoke'] = {				
				head="Reverence Coronet +1",
				neck="Invidia Torque",
				body="Reverence Surcoat +1",
				hands="Rev. Gauntlets",
				ring1="Vexer Ring",
				back="Fierabras's Mantle",
				waist="Goading Belt",
				legs="Reverence Breeches +1",
				feet="Caballarius Leggings"}
     
            -- Waltz Set (CHR and VIT)
            sets.Waltz = {
				ammo="Sonia's Plectrum",
				head="Reverence Coronet +1",
				body="Gorney Haubert +1",
				hands="Reverence Gauntlets +1",
				ring2="Asklepian Ring",
				back="Iximulew Cape",
				waist="Caudata Belt",
				legs="Reverence Breeches +1",
				feet="Whirlpool Greaves"}
			
			-- Magic Sets Below
			sets.Precast = {}
			sets.Precast.FastCast = {
				ammo="Incantor Stone",
				head="Cizin Helm",
				ear2="Loquacious Earring",
				ring2="Prolix Ring",
				legs="Enif Cosciales"}
			sets.Precast.FastCast['Enhancing Magic'] = set_combine(sets.Precast.FastCast, {waist="Siegel Sash"})
			--sets.Precast.FastCast['Enlight'] = {hands="Rev. Gauntlets"}  <-- Was a test for specific spells (Example)		
					
            sets.Midcast = {}
            -- Magic Haste Set --
            sets.Midcast.Haste = {
				head="Reverence Coronet +1",				
				body="Reverence Surcoat +1",
				hands="Reverence Gauntlets +1",
				waist="Zoran's Belt",
				legs="Enif Cosciales",
				feet="Reverence Leggings +1"}
				
			-- Midcast Cures
			sets.Midcast['Healing Magic'] = {
				ammo="Iron Gobbet",
				head="Adaman Barbuta",
				neck="Invidia Torque",
				ear1="Hospitaler Earring",
				ear2="Bloodgem Earring",
				body="Reverence Surcoat +1",
				hands="Buremte Gloves",
				ring1="Kunaji Ring",
				ring2="Asklepian Ring",
				back="Fierabras's Mantle",
				waist="Chuq'aba Belt",
				legs="Reverence Breeches +1",
				feet="Caballarius Leggings"}
				
			-- ENM
			sets.Midcast['Flash'] = {				
				head="Reverence Coronet +1",
				neck="Invidia Torque",
				body="Reverence Surcoat +1",
				hands="Rev. Gauntlets",
				ring1="Vexer Ring",
				back="Fierabras's Mantle",
				waist="Goading Belt",
				legs="Reverence Breeches +1",
				feet="Caballarius Leggings"}					
    end
     
	function pretarget(spell,action)
			if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
				cancel_spell()
				send_command('input /item "Echo Drops" <me>') 		 	
			elseif spell.type == "WeaponSkill" and player.tp > 1000 and buffactive['amnesia'] or buffactive['stun'] or buffactive['sleep'] then
				-- Won't try to Weaponskill and cause blinking when those status effects are on.
				cancel_spell()
				add_to_chat(39,spell.name .. ' Canceled: ['..player.name..' Stunned ,Slept or Amnesia]')
			return			
            end
	end    
     
    function precast(spell,action)				
            if spell.type == "WeaponSkill" then                    
					equipSet = sets.WS
					if equipSet[spell.english] then
						equipSet = equipSet[spell.english]
					end
					if equipSet[ACC_Array[ACC_Index]] then
						equipSet = equipSet[ACC_Array[ACC_Index]]
					end
					if spell.name == "Chant du Cygne" then			
						if player.tp > 2999 then
							equipSet = set_combine(equipSet,{ear1="Flame Pearl"})				
						elseif world.day == 'Lightsday' or world.day == 'Iceday' or world.day == 'Watersday' then
							equipSet = set_combine(equipSet,{head="Gavialis Helm"})															
						end
					end
					if spell.name == "Knights of Round" then			
						if player.tp > 2999 then
							equipSet = set_combine(equipSet,{ear1="Flame Pearl"})				
						elseif world.day == 'Firesday' or world.day == 'Lightsday' then
							equipSet = set_combine(equipSet,{head="Gavialis Helm"})															
						end			
					end
						equip(equipSet)
			end
            if spell.type == "JobAbility" then
                    if sets.JA[spell.english] then
                            equip(sets.JA[spell.english])
                    end
			end            
			if spell.action_type == 'Magic' then				
				if spell.skill == 'Enhancing Magic' then
						equip(sets.Precast.FastCast['Enhancing Magic'])
					else
						equip(sets.Precast.FastCast[spell.english])
					end
						equip(sets.Precast.FastCast)
			end	
            if spell.type == "Waltz" then
				equip(sets.Waltz)
            elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
				cast_delay(0.2)
				send_command('cancel Sneak')
            end			
            if Twilight == 'ON' then
				equip(sets.Twilight)
            end
			if Armor == 'PDT' then
				equip(sets.PDT)
            end
			if Armor == 'MDT' then
				equip(sets.MDT)
            end
			if Mecisto == 'ON' then
				equip(sets.Mecisto)					
			end			
			if Movement == 'ON' then
				equip(sets.Movement)
				disable('legs')
			else
				enable('legs')
			end
			if Rings == 'ON' then 
				equip(sets.Rings)				
			end
			if buffactive["weakness"] then 
				equip(sets.Twilight)
				disable('head','body')
				else
				enable('head','body')
			end			
    end	
    
	function midcast(spell,action)
		if spell.action_type == 'Magic' then				
			if spell.skill == 'Healing Magic' then
				equip(sets.Midcast['Healing Magic'])
			else
				equip(sets.Midcast.Haste)
			end				
				equip(sets.Midcast[spell.english])
		end
		if spell.english == 'Protect V' or spell.english == 'Shell IV' then
			equip({ring2="Sheltered Ring"})		
		end
	end
     
    function aftercast(spell,action)		
		status_change(player.status)
	end
     
    function status_change(new,old)           
            if Armor == 'PDT' then
                    equip(sets.PDT)
            elseif Armor == 'MDT' then
                    equip(sets.MDT)
            elseif new == 'Engaged' then
                    equipSet = sets.TP					
                    if Armor == 'Hybrid' and equipSet["Hybrid"] then
                            equipSet = equipSet["Hybrid"]
                    end
                    if equipSet[player.equipment.main] then
                            equipSet = equipSet[player.equipment.main]
                    end
                    if equipSet[ACC_Array[ACC_Index]] then
                            equipSet = equipSet[ACC_Array[ACC_Index]]
                    end
                    if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
                            equipSet = equipSet["AM3"]
                    end
                    if buffactive.Aftermath and equipSet["AM"] then
                            equipSet = equipSet["AM"]
                    end    
                    if buffactive.Ionis and equipSet["Ionis"] then
                            equipSet = equipSet["Ionis"]
                    end                                       
                    equip(equipSet)
            else
                    equip(sets.Idle[Idle_Array[Idle_Index]])
            end            
            if Twilight == 'ON' then
				equip(sets.Twilight)
            end			
			if Mecisto == 'ON' then
				equip(sets.Mecisto)					
			end			
			if Movement == 'ON' then
				equip(sets.Movement)
				disable('legs')
				else
				enable('legs')
			end
			if Shield == 'Ochain' then
				equip(sets.Ochain)				
				else
				equip(sets.Aegis)
			end
			if TH == 'ON' then
				equip(sets.TH)					
			end	
			if Rings == 'ON' then 
				equip(sets.Rings)					
			end				
			if buffactive["weakness"] then 
				equip(sets.Twilight)
				disable('head','body')				
				else
				enable('head','body')
			end	
    end
	
    function buff_change(buff,gain)           	  
			if buff == "encumbrance" then 
				if not gain then
					add_to_chat(200,"No longer Encumbered")		
					equip(sets.Encumber[Encumber_Set_Names[Encumber_Index]])
				end	
			end
			if buff == "sleep" and player.hp > 200 and player.status == "Engaged" then
				if gain then		    
					equip(sets.Slept)
					add_to_chat(39,"Slept: [Equipping Berserker's Torque]")			
				else
					status_change(player.status)
					add_to_chat(200,"Awake: [Removing Berserker's Torque]")
				end		
			end			
			if buff == "weakness" then
				if gain then
					send_command('timers create "Weakness" 300 up abilities/00255.png')
				else
					send_command('timers delete "Weakness"')
					add_to_chat(200,'Unweak!')
				end	
			end
			if buff == "Aftermath: Lv.3" then 
				if gain then
					send_command('timers create "Aftermath: Lv.3" 180 down')
				else
					send_command('timers delete "Aftermath: Lv.3"')
					add_to_chat(200,'Aftermath: lv.3: [OFF]')
				end
			end
    end
     
    --Toggle Self Commands with //gs c [command name] 
	--Example type in chat //gs c acc (case sensitive)
	--Example Make a macro /console gs c acc (case sensitive)
    function self_command(command)
            if command == 'acc' then -- Acc Toggle for TP/WS/Hybrid --
                    ACC_Index = (ACC_Index % #ACC_Array) + 1
                    add_to_chat(207,'Accuracy Level TP/WS/Hybrid: '..ACC_Array[ACC_Index])
                    status_change(player.status)
			elseif command == 'idle' then -- Idle Toggle --
                    Idle_Index = (Idle_Index % #Idle_Array) + 1
                    add_to_chat(207,'Idle Set: '..Idle_Array[Idle_Index])
                    status_change(player.status)            
            elseif command == 'hybrid' then -- Hybrid Toggle --
                    if Armor == 'Hybrid' then
                            Armor = 'None'
                            add_to_chat(57,'Hybrid Set: [Unlocked]')
                    else
                            Armor = 'Hybrid'
                            add_to_chat(158,'Hybrid Set: '..ACC_Array[ACC_Index])
                    end
                    status_change(player.status)
            elseif command == 'pdt' then -- PDT Toggle --
                    if Armor == 'PDT' then
                            Armor = 'None'
                            add_to_chat(57,'PDT Set: [Unlocked]')
                    else
                            Armor = 'PDT'
                            add_to_chat(158,'PDT Set: [Locked]')
                    end
                    status_change(player.status)
            elseif command == 'mdt' then -- MDT Toggle --
                    if Armor == 'MDT' then
                            Armor = 'None'
                            add_to_chat(57,'MDT Set: [Unlocked]')
                    else
                            Armor = 'MDT'
                            add_to_chat(158,'MDT Set: [Locked]')
                    end
                    status_change(player.status)            
            elseif command == 'twilight' then -- Twilight Toggle --
                    if Twilight == 'ON' then
                            Twilight = 'OFF'
                            add_to_chat(57,'Twilight Set: [Unlocked]')
                    else
                            Twilight = 'ON'
                            add_to_chat(158,'Twilight Set: [locked]')
                    end
                    status_change(player.status)
            elseif command == 'distance' then -- Distance Toggle --
                    if player.target.distance then
                            target_distance = math.floor(player.target.distance*10)/10
                            add_to_chat(57,'Distance: '..target_distance)
                    else
                            add_to_chat(158,'No Target Selected')
                    end
			elseif command == 'th' then -- TH Toggle --
					if TH == 'ON' then
						TH = 'OFF'							
						add_to_chat(57,'Chaac Belt: [OFF]')
					else
						TH = 'ON'							
						add_to_chat(158,'Chaac Belt: [ON]')
					end
					status_change(player.status)
			elseif command == 'rings' then -- Capacity/Warp Ring Toggle --
					if Rings == 'ON' then
						Rings = 'OFF'							
						add_to_chat(57,'Capacity/Warp Ring: [OFF]')
					else
						Rings = 'ON'							
						add_to_chat(158,'Capacity/Warp Ring: [ON]')
					end
					status_change(player.status)		
			elseif command == 'cpmantle' then -- Mecisto. Mantle Toggle --
					if Mecisto == 'ON' then
						Mecisto = 'OFF'							
						add_to_chat(57,'Mecisto. Mantle: [Unlocked]')
					else
						Mecisto = 'ON'							
						add_to_chat(158,'Mecisto. Mantle: [Locked]')
					end
					status_change(player.status)			
			elseif command == 'movement' then -- Movement Toggle --
					if Movement == 'ON' then
						Movement = 'OFF'							
						add_to_chat(57,'Movement Set: [OFF]')
					else
						Movement = 'ON'							
						add_to_chat(158,'Movement Set: [ON]')
					end
					status_change(player.status)
			elseif command == 'shield' then -- Shield Toggle --
					if Shield == 'Ochain' then
						Shield = 'Aegis'
						equip(sets.Aegis)
						add_to_chat(57,'Aegis: [ON]')
					else
						Shield = 'Ochain'
						equip(sets.Ochain)
						add_to_chat(158,'Ochain: [ON]')
					end							
			elseif command == 'encumber' then
					Encumber_Index = Encumber_Index +1
					if Encumber_Index > #Encumber_Set_Names then Encumber_Index = 1 end
						add_to_chat(207,'Encumber [Weapon] '..Encumber_Set_Names[Encumber_Index]..'')		
						equip(sets.Encumber[Encumber_Set_Names[Encumber_Index]])            
			elseif command == 'update' then -- Auto Update Gear Toggle --
                    status_change(player.status)
                    add_to_chat(207,'Auto Update Gear')
			elseif command == 'active' then -- Shows what sets and toggles are active --
					add_to_chat(8,'Current Active sets below...')
					add_to_chat(207,'Idle Set Active: '..Idle_Array[Idle_Index]..'')		
					add_to_chat(207,'Accuracy Level TP/WS/Hybrid Active: '..ACC_Array[ACC_Index]..'')					
					add_to_chat(207,'Target distance set to: '..target_distance..'')
					add_to_chat(207,'TH [Chaac Belt]: '..TH..'')
					add_to_chat(207,'CP [Mecisto. Mantle]: '..Mecisto..'')
					add_to_chat(207,'Capacity/Warp Rings: '..Rings..'')					
					add_to_chat(207,'Movement Set: '..Movement..'')					
					add_to_chat(207,'Twilight Set: '..Twilight..'')					
					add_to_chat(207,'PDT/MDT Set: '..Armor..'')	
					add_to_chat(207,'Shield: '..Shield..'')	
            end
    end
	function file_unload()
			send_command('unbind f9')
			send_command('unbind f10')
			send_command('unbind f11')
			send_command('unbind f12')
	end