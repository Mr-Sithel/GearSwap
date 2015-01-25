--[[
*** I don't take full credit for this file. I've used various other files and some of my own ***
----------------------
GearSwap Version 0.900
----------------------
File Created 10-9-14
If you found this file, it was probably through bluegartr. If any bugs or errors are 
found please send me a PM there and I'll try to fix it.
*For some of these features to work, the Shortcuts, Cancel addon and Timers plugin are required.
----------------------
Update 01-24-15
*Added: Tachi: Rana variable for aftermath, ON by default.Can only Tachi: Rana when at 3000 TP (gs c ranaWS) to turn OFF.
----------------------
Update 12-28-14
*Added: Auto equip neck when entering a Reive
*Added: Ranged Midshot set
----------------------
Update 12-7-14
*Fixed: Spelling error in the status buff Aftermath Lv. 3
----------------------
Update 10-10-14
*Added: Oneiros Ring function at "function status_change(new,old)" for MP conditions.	
*Added: Function to WS on certain days and use the new head piece Gavialis Helm.
*Added: Auto locks Twilight set on when you get up from a raise.
----------------------	
Macro lists- case sensitive (If in chat remove the /console & add //, example //gs c acc)

/console gs c encumber	(encumber toggle- Tsuru,Amano,Koga,Masa - Defaults to Tsurumaru)
/console gs c idle		(idle toggle Regen,Normal,Town)
/console gs c acc		(acc toggle for TP,WS,Hybrid) (Accuracy levels are Normal, LightAcc, FullAcc)
/console gs c hybrid	(hybrid toggle for Hybrid TP)
/console gs c update	(updates current gear set, also set to the F10 key on keyboard)
/console gs c active	(will show all active sets and toggles that are active or not)
/console gs c distance	(Set target distance, default is 5 yalms

- All Toggles below are OFF by default, except Tachi: Rana variable which is ON.
/console gs c pdt		(toggle/locks pdt set at all times, during Idle,TP,WS,JA,MA ect.)
/console gs c mdt		(toggle/locks mdt set at all times, during Idle,TP,WS,JA,MA ect.)
/console gs c th		(toggle/locks Chaac Belt at these times, during Idle,TP)
/console gs c rings		(toggle/locks Warp Ring & Capacity Ring at all times, during Idle,TP,WS,JA,MA ect.)
/console gs c twilight	(toggle/locks Twilight set at all times for reraise, during Idle,TP,WS,JA,MA ect.)
/console gs c cpmantle	(toggle/locks Mecisto. Mantle at all times for Capacity Points farming, during Idle,TP,WS,JA,MA ect.)
/console gs c movement	(toggle/locks movement gear)
/console gs c seigan	(toggle seigan/third eye set)
/console gs c autohasso	(toggle to auto hasso)
/console gs c ranaWS	(toggle Tachi: Rana variable for aftermath, ON by default.Can only Tachi: Rana when at 3000 TP)
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
			Auto_Hasso = 'OFF' -- Auto Hasso Toggle Default (Keeps Hasso up fulltime)
			Rana_WS = 'ON'
			Mecisto = 'OFF' -- Mecisto. Mantle (Capacity Points Back) Toggle Default			
			Seigan_T = 'OFF' -- Seigan/Third Eye Set Toggle Default
			Movement = 'OFF' -- Movement Gear Toggle Default
            target_distance = 5 -- Set Default Distance Here			
			
			--Default Macro Set for SAM
			send_command('input /macro book 19;wait .1;input /macro set 10')

			--Binds 
			send_command('bind f12 gs c update')
			send_command('bind f10 ws Tachi: Rana <t>')
			send_command('bind f9 ws Tachi: Fudo <t>')
	
			--Slept
			sets.Slept = {neck="Berserker's Torque"}
			
			--Reive Neck 
			sets.ReiveNeck = {neck="Adoulin's Refuge +1"}
			
			--Meikyo Shisui
			sets.OneHour = {feet="Sakonji sune-ate +1"}
	
			--Twilight Set
			sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
			--Capacity Points Mantle
			sets.Mecisto = {back="Mecisto. Mantle"}			
	
			--Movement Set
			sets.Movement = {feet="Danzo Sune-Ate"}
	
			--Chaac Belt
			sets.TH = {waist="Chaac Belt"}			
	
			--Capacity/Warp Ring
			sets.Rings = {ring1="Capacity Ring",ring2="Warp Ring"}
	
			--encumbrance 
			sets.Encumber = {}
			Encumber_Set_Names = {'Koga','Tsuru','Masa','Amano'}	
			sets.Encumber['Tsuru'] = {main="Tsurumaru",sub="Bloodrain Strap"}
			sets.Encumber['Koga'] = {main="Kogarasumaru",sub="Bloodrain Strap"}
			sets.Encumber['Masa'] = {main="Masamune",sub="Bloodrain Strap"}
			sets.Encumber['Amano'] = {main="Amanomurakumo",sub="Bloodrain Strap"}
     
            -- Idle/Town/Regen Sets --
            sets.Idle = {}
			sets.Idle.Normal = {
				range="Cibitshavore",
				head="Sakonji Kabuto +1",
				neck="Da. Nodowa +1",
				ear1="Tripudio Earring",
				ear2="Brutal Earring",
				body="Sakonji Domaru +1",
				hands="Wakido Kote +1",
				ring1="Karieyh Ring",
				ring2="K'ayres Ring",
				back={ name="Takaha Mantle", augments={'STR+2','"Zanshin"+3','Meditate eff. dur. +5',}},
				waist="Windbuffet Belt +1",
				legs="Wakido Haidate +1",
				feet="Danzo Sune-Ate"}		
		
			sets.Idle.Town = {
				range="Cibitshavore",
				head="Sakonji Kabuto +1",
				neck="Da. Nodowa +1",
				ear1="Steelflash earring",
				ear2="Bladeborn earring",
				body="Sakonji Domaru +1",
				hands="Wakido Kote +1",
				ring1="Ifrit Ring +1",
				ring2="Ifrit Ring +1",
				back={ name="Takaha Mantle", augments={'STR+2','"Zanshin"+3','Meditate eff. dur. +5',}},				
				waist="Windbuffet Belt +1",
				legs="Wakido Haidate +1",
				feet="Sak. Sune-Ate +1"}				
				
			sets.Idle.Regen = set_combine(sets.Idle.Normal,{
				head="Twilight Helm",
				neck="Wiglen Gorget",		
				ring1="Paguroidea Ring",
				ring2="Sheltered Ring",
				back="Scuta Cape"})            
     
            -- TP Base Set --
            sets.TP = {}           
     
            -- Tsurumaru TP Sets --
            sets.TP.Tsurumaru = {
				range="Cibitshavore",
				head="Otomi Helm",
				neck="Ganesha's Mala",
				ear1="Steelflash earring",
				ear2="Bladeborn earring",
				body="Sakonji Domaru +1",
				hands="Wakido Kote +1",
				ring1="Rajas Ring",		
				back={ name="Takaha Mantle", augments={'STR+1','"Zanshin"+4','"Store TP"+3',}},
				waist="Windbuffet Belt +1",
				legs="Wakido Haidate +1",
				feet="Sak. Sune-Ate +1"}
            sets.TP.Tsurumaru.LightAcc = set_combine(sets.TP.Tsurumaru,{				
				waist="Olseni Belt",
				legs="Xaddi Cuisses"})
            sets.TP.Tsurumaru.FullAcc = set_combine(sets.TP.Tsurumaru.LightAcc,{
				head="Gavialis Helm",
				neck="Iqabi Necklace",
				ear2="Zennaroi Earring",		
				body="Mes. Haubergeon",
				hands="Buremte Gloves",
				ring1="Mars's Ring",
				ring2="Enlivened Ring",
				legs="Wukong's Haka. +1",
				feet="Waki. Sune-Ate +1"})
     
            -- Tsurumaru(Ionis) TP Sets --
            sets.TP.Tsurumaru.Ionis = set_combine(sets.TP.Tsurumaru,{				
				head="Yaoyotl Helm",
				neck="Da. Nodowa +1",
				ear1="Tripudio Earring",
				ear2="Brutal Earring",
				ring2="K'ayres Ring"})				
            sets.TP.Tsurumaru.LightAcc.Ionis = set_combine(sets.TP.Tsurumaru.Ionis,{
				ear1="Steelflash earring",
				ear2="Bladeborn earring",				
				ring2="Enlivened Ring",
				legs="Xaddi Cuisses"})				
            sets.TP.Tsurumaru.FullAcc.Ionis = set_combine(sets.TP.Tsurumaru.LightAcc.Ionis,{
				neck="Iqabi Necklace",
				ear2="Zennaroi Earring",
				body="Mes. Haubergeon",
				hands="Buremte Gloves",
				ring1="Mars's Ring",
				waist="Olseni Belt",
				legs="Wukong's Haka. +1",
				feet="Waki. Sune-Ate +1"})
     
            -- Amanomurakumo(AM Down) TP Sets --
            sets.TP.Amanomurakumo = {}
            sets.TP.Amanomurakumo.LightAcc = set_combine(sets.TP.Amanomurakumo,{})
            sets.TP.Amanomurakumo.FullAcc = set_combine(sets.TP.Amanomurakumo.LightAcc,{})
     
            -- Amanomurakumo(AM Up) TP Sets --
            sets.TP.Amanomurakumo.AM = set_combine(sets.TP.Amanomurakumo,{})
            sets.TP.Amanomurakumo.LightAcc.AM = set_combine(sets.TP.Amanomurakumo.AM,{})
            sets.TP.Amanomurakumo.FullAcc.AM = set_combine(sets.TP.Amanomurakumo.LightAcc.AM,{})
     
            -- Amanomurakumo(AM Down: Ionis) TP Sets --
            sets.TP.Amanomurakumo.Ionis = set_combine(sets.TP.Amanomurakumo,{})
            sets.TP.Amanomurakumo.LightAcc.Ionis = set_combine(sets.TP.Amanomurakumo.Ionis,{})
            sets.TP.Amanomurakumo.FullAcc.Ionis = set_combine(sets.TP.Amanomurakumo.LightAcc.Ionis,{})
     
            -- Amanomurakumo(AM Up: Ionis) TP Sets --
            sets.TP.Amanomurakumo.AM.Ionis = set_combine(sets.TP.Amanomurakumo.AM,{})
            sets.TP.Amanomurakumo.LightAcc.AM.Ionis = set_combine(sets.TP.Amanomurakumo.AM.Ionis,{})
            sets.TP.Amanomurakumo.FullAcc.AM.Ionis = set_combine(sets.TP.Amanomurakumo.LightAcc.AM.Ionis,{})
     
            -- Masamune TP Sets --
            sets.TP.Masamune = {}
            sets.TP.Masamune.LightAcc = set_combine(sets.TP.Masamune,{})
            sets.TP.Masamune.FullAcc = set_combine(sets.TP.Masamune.LightAcc,{})
     
            -- Masamune(Ionis) TP Sets --
            sets.TP.Masamune.Ionis = set_combine(sets.TP.Masamune,{})
            sets.TP.Masamune.LightAcc.Ionis = set_combine(sets.TP.Masamune.Ionis,{})
            sets.TP.Masamune.FullAcc.Ionis = set_combine(sets.TP.Masamune.LightAcc.Ionis,{}) 

			-- Kogarasumaru(AM3 Down) TP Sets --
            sets.TP.Kogarasumaru = {
				range="Cibitshavore",
				head="Sakonji Kabuto +1",
				neck="Ganesha's Mala",
				ear1="Tripudio Earring",
				ear2="Brutal Earring",
				body="Sakonji Domaru +1",
				hands="Wakido Kote +1",
				ring1="Rajas Ring",
				ring2="K'ayres Ring",
				back={ name="Takaha Mantle", augments={'STR+1','"Zanshin"+4','"Store TP"+3',}},
				waist="Windbuffet Belt +1",
				legs="Wakido Haidate +1",
				feet="Sak. Sune-Ate +1"}
            sets.TP.Kogarasumaru.LightAcc = set_combine(sets.TP.Kogarasumaru,{
				head="yaoyotl helm",
				neck="Da. Nodowa +1",
				waist="Olseni Belt",
				feet="Waki. sune-ate +1"})
            sets.TP.Kogarasumaru.FullAcc = set_combine(sets.TP.Kogarasumaru.LightAcc,{				
				neck="Iqabi necklace",
				ear1="Steelflash earring",
				ear2="Zennaroi Earring",
				body="Mes. Haubergeon",
				hands="Sakonji Kote +1",
				ring1="Mars's Ring",
				ring2="Enlivened Ring",
				legs="Wukong's Haka. +1"})
                           
            -- Kogarasumaru(AM3 Up) TP Sets --
            sets.TP.Kogarasumaru.AM3 = set_combine(sets.TP.Kogarasumaru,{
				range="Cibitshavore",
				head="Sakonji Kabuto +1",
				neck="Da. Nodowa +1",
				ear1="Tripudio Earring",
				ear2="Brutal Earring",
				body="Sakonji Domaru +1",
				hands="Wakido Kote +1",
				ring1="Rajas Ring",
				ring2="K'ayres Ring",
				back={ name="Takaha Mantle", augments={'STR+1','"Zanshin"+4','"Store TP"+3',}},
				waist="Goading Belt",
				legs="Wakido Haidate +1",
				feet="Sak. Sune-Ate +1"})
            sets.TP.Kogarasumaru.LightAcc.AM3 = set_combine(sets.TP.Kogarasumaru.AM3,{
				head="yaoyotl helm",				
				waist="Olseni Belt",
				feet="Waki. sune-ate +1"})
            sets.TP.Kogarasumaru.FullAcc.AM3 = set_combine(sets.TP.Kogarasumaru.LightAcc.AM3,{				
				neck="Iqabi necklace",
				ear1="Steelflash earring",
				ear2="Zennaroi Earring",
				body="Mes. Haubergeon",
				hands="Sakonji Kote +1",
				ring1="Mars's Ring",
				ring2="Enlivened Ring",
				legs="Wukong's Haka. +1"})        
     
            -- Third Eye/Seigan TP Set --
            sets.TP['Seigan'] = {
				head="Unkai Kabuto +2",
				legs="Sakonji Haidate +1"}
     
            -- PDT/MDT Sets --
            sets.PDT = {
				head="Otronif mask +1",
				neck="Twilight Torque",
				ear1="Black Earring",
				ear2="Colossus's Earring",
				body="Emet Harness +1",
				hands="Sakonji Kote +1",
				ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
				ring2="Patricius Ring",
				back="Mollusca Mantle",
				waist="Flume Belt",
				legs="Xaddi cuisses",
				feet="Otronif Boots +1"}
	
			sets.MDT = set_combine(sets.PDT,{
				head="Ptica Headgear",
				ear1="Merman's Earring",
				ear2="Merman's Earring",
				ring2={ name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -4%',}},
				body="Kyujutsugi",
				legs="Wukong's Haka. +1"})
     
            -- Hybrid Sets --
            sets.TP.Hybrid = set_combine(sets.PDT,{
				ear1="Steelflash Earring",
				ear2="Bladeborn Earring"})
            sets.TP.Hybrid.LightAcc = set_combine(sets.TP.Hybrid,{
				head="Yaoyotl Helm",
				waist="Dynamic Belt"})
            sets.TP.Hybrid.FullAcc = set_combine(sets.TP.Hybrid.LightAcc,{
				neck="Iqabi Necklace",
				ear2="Zennaroi Earring",
				body="Emet Harness +1",
				hands="Buremte Gloves",				
				waist="Olseni Belt",				
				feet="Waki. Sune-Ate +1"})
     
            -- WS Base Set --
            sets.WS = {
				range="Cibitshavore",
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
				legs="Wakido Haidate +1",
				feet="Sak. Sune-Ate +1"}
     
            -- WS Fudo Sets --
            sets.WS["Tachi: Fudo"] = {
				range="Cibitshavore",
				head="Otomi Helm",
				neck="Light Gorget",
				ear1="Moonshade earring",
				ear2="Brutal Earring",
				body="Phorcys Korazin",
				hands="Miki. Gauntlets",
				ring1="Ifrit Ring +1",
				ring2="Ifrit Ring +1",
				back="Buquwik Cape",
				waist="Metalsinger Belt",
				legs="Scuff. Cosciales",
				feet="Sak. Sune-Ate +1"}				
            sets.WS["Tachi: Fudo"].LightAcc = set_combine(sets.WS["Tachi: Fudo"],{
				head="Gavialis Helm",
				ear2="Zennaroi Earring",
				body="Mes. Haubergeon",
				ring1="Karieyh Ring",
				back={ name="Takaha Mantle", augments={'STR+1','"Zanshin"+4','"Store TP"+3',}},
				waist="Light Belt",
				legs="Wukong's Haka. +1",
				feet="Waki. Sune-Ate +1"})				
            sets.WS["Tachi: Fudo"].FullAcc = set_combine(sets.WS["Tachi: Fudo"].LightAcc,{})
			
			-- WS Shoha Sets --
            sets.WS["Tachi: Shoha"] = {
				range="Cibitshavore",
				head="Otomi Helm",
				neck="Ganesha's Mala",
				ear1="Moonshade earring",
				ear2="Brutal Earring",
				body="Phorcys Korazin",
				hands="Miki. Gauntlets",
				ring1="Ifrit Ring +1",
				ring2="Ifrit Ring +1",
				back="Buquwik Cape",
				waist="Metalsinger Belt",
				legs="Scuff. Cosciales",
				feet="Sak. Sune-Ate +1"}
            sets.WS["Tachi: Shoha"].LightAcc = set_combine(sets.WS["Tachi: Shoha"],{
				head="Gavialis Helm",
				neck="Thunder Gorget",
				back="Takaha Mantle",
				waist="Thunder Belt",
				legs="Xaddi cuisses",
				feet="Waki. Sune-Ate +1"})
            sets.WS["Tachi: Shoha"].FullAcc = set_combine(sets.WS["Tachi: Shoha"].LightAcc,{})
			
			-- WS Kaiten Sets --
            sets.WS["Tachi: Kaiten"] = {}
            sets.WS["Tachi: Kaiten"].LightAcc = set_combine(sets.WS["Tachi: Kaiten"],{})
            sets.WS["Tachi: Kaiten"].FullAcc = set_combine(sets.WS["Tachi: Kaiten"].LightAcc,{})
			
			-- WS Rana Sets --
            sets.WS["Tachi: Rana"] = {
				range="Cibitshavore",
				head="Otomi Helm",
				neck="Light Gorget",
				ear1="Moonshade earring",
				ear2="Brutal Earring",
				body="Mes. Haubergeon",
				hands="Miki. Gauntlets",
				ring1="Ifrit Ring +1",
				ring2="Ifrit Ring +1",
				back="Buquwik Cape",
				waist="Metalsinger Belt",
				legs="Scuff. Cosciales",
				feet="Sak. Sune-Ate +1"}
            sets.WS["Tachi: Rana"].LightAcc = set_combine(sets.WS["Tachi: Rana"],{
				head="Gavialis Helm",
				ear2="Zennaroi Earring",
				body="Mes. Haubergeon",
				back={ name="Takaha Mantle", augments={'STR+1','"Zanshin"+4','"Store TP"+3',}},				
				legs="Wukong's Haka. +1",
				feet="Waki. Sune-Ate +1"})
            sets.WS["Tachi: Rana"].FullAcc = set_combine(sets.WS["Tachi: Rana"].LightAcc,{
				waist="Olseni Belt",})
			
			-- WS Namas Sets --
            sets.WS["Namas Arrow"] = {}				
            sets.WS["Namas Arrow"].LightAcc = set_combine(sets.WS["Namas Arrow"],{})				
            sets.WS["Namas Arrow"].FullAcc = set_combine(sets.WS["Namas Arrow"].LightAcc,{})
			
			-- WS Apex Sets --
            sets.WS["Apex Arrow"] = {
				head="Sakonji Kabuto +1",
				neck="Light Gorget",				
				body="Kyujutsugi",
				hands="Buremte Gloves",
				ring1="Bellona's Ring",
				ring2="Paqichikaji Ring",
				back="Buquwik Cape",
				waist="Light Belt",
				legs="Aeto. Trousers +1",
				feet="Wakido sune-ate +1"}
            sets.WS["Apex Arrow"].LightAcc = set_combine(sets.WS["Apex Arrow"],{})
            sets.WS["Apex Arrow"].FullAcc = set_combine(sets.WS["Apex Arrow"].LightAcc,{})
			
			-- JA Sets --
			sets.JA = {}
			sets.JA['Meditate'] = {head="Wakido Kabuto +1",hands="Sakonji Kote +1",back={ name="Takaha Mantle", augments={'STR+2','"Zanshin"+3','Meditate eff. dur. +5',}}}
			sets.JA['Warding Circle'] = {head="Wakido Kabuto +1"}
			sets.JA['Blade Bash'] = {hands="Sakonji Kote +1"}            
     
            -- Waltz Set --
            sets.Waltz = {}
			
			-- Magic Sets Below
			sets.Precast = {}
			sets.Precast.FastCast = {		
				head="Otomi Helm",
				neck="Twilight Torque",		
				ear2="Loquacious Earring",
				body="Emet Harness +1",
				hands="Wakido Kote +1",        
				ring1={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
				ring2="Patricius Ring"}
					
            sets.Midcast = {}
            -- Magic Haste Set --
            sets.Midcast.Haste = set_combine(sets.PDT,{})
			
			-- Midshot Set (Range Accuracy) --
			sets.Midshot = {
				head="Sakonji Kabuto +1",
				neck="Iqabi necklace",				
				body="Kyujutsugi",
				hands="Buremte Gloves",
				ring1="Bellona's Ring",
				ring2="Paqichikaji Ring",
				back="Terebellum Mantle",
				waist="Cetl belt",
				legs="Aeto. Trousers +1",
				feet="Wakido sune-ate +1"}
    end
     
	function pretarget(spell,action)
			if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
				cancel_spell()
				send_command('input /item "Echo Drops" <me>')    
			elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
				cancel_spell()
				send_command('ThirdEye')
			elseif spell.english == "Meditate" and player.tp > 2990 then -- Cancel Meditate If TP Is Above 2990 --
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')			
			elseif spell.type == "WeaponSkill" and player.tp > 1000 and buffactive['amnesia'] or buffactive['stun'] or buffactive['sleep'] then
				-- Won't try to Weaponskill and cause blinking when those status effects are on.
				cancel_spell()
				add_to_chat(39,spell.name .. ' Canceled: ['..player.name..' Stunned ,Slept or Amnesia]')
			return
			elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (player.status == 'Engaged' and (((spell.english == "Namas Arrow" or spell.english == "Apex Arrow") and spell.target.distance > 16+target_distance) or (spell.type == "WeaponSkill" and spell.english ~= "Namas Arrow" and spell.english ~= "Apex Arrow" and spell.target.distance > target_distance))) then -- Cancel Ranged Attack or WS If You Are Out Of Range --
                    cancel_spell()
                    add_to_chat(123, spell.name..' Canceled: [Out of Range]')
                    return
            end
	end    
     
    function precast(spell,action)
			if spell.name == "Ranged" then				
				if player.equipment.ammo ~= 'empty' then			
					if player.inventory[player.equipment.ammo].count < 10 then --Less than 10 ammo triggers a warning
					add_to_chat(8,"Ammo '"..player.inventory[player.equipment.ammo].shortname.."' running low ("..player.inventory[player.equipment.ammo].count.." Remain)")				
					end
				end	
			end
            if spell.type == "WeaponSkill" then                    
					equipSet = sets.WS
					if equipSet[spell.english] then
						equipSet = equipSet[spell.english]
					end
					if equipSet[ACC_Array[ACC_Index]] then
						equipSet = equipSet[ACC_Array[ACC_Index]]
					end
					if spell.name == "Tachi: Fudo" then			
						if (player.tp > 2999 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then
							equipSet = set_combine(equipSet,{ear1="Flame Pearl"})				
						elseif world.day == 'Lightsday' or world.day == 'Iceday' or world.day == 'Watersday' then
							equipSet = set_combine(equipSet,{head="Gavialis Helm"})															
						end
					end
					if spell.name == "Tachi: Shoha" then			
						if (player.tp > 2999 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then
							equipSet = set_combine(equipSet,{ear1="Flame Pearl"})				
						elseif world.day == 'Darksday' or world.day == 'Thundersday' or world.day == 'Windsday' then
							equipSet = set_combine(equipSet,{head="Gavialis Helm"})															
						end			
					end
					if spell.english == "Tachi: Rana" and player.tp < 2999 and Rana_WS == 'ON' then -- Cancel Tachi: Rana If TP lower then 2999 (for aftermath 3) --
						cancel_spell()
						add_to_chat(123, spell.name .. ' Canceled for Aftermath 3: ['..player.tp..' TP]')
						return					
					elseif spell.english == "Tachi: Rana" and buffactive["Aftermath: Lv.3"] and player.tp > 2999 and Rana_WS == 'ON' then -- Cancels Tachi: Rana while Aftermath Lv. 3 already up
						cancel_spell()
						add_to_chat(123, spell.name .. ' Canceled: Aftermath Lv. 3 already up!')
						return
					end
						equip(equipSet)
			end
            if spell.type == "JobAbility" then
                    if sets.JA[spell.english] then
                            equip(sets.JA[spell.english])
                    end
            elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
                    if string.find(spell.english,'Utsusemi') then
                            if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                                    cancel_spell()
                                    add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
                                    return
                            else
                                    equip(sets.Precast.FastCast)
                            end
                    else
                            equip(sets.Precast.FastCast)
                    end					
            elseif spell.type == "Waltz" then
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
				disable('feet')
			else
				enable('feet')
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
			if buffactive["Meikyo Shisui"] then 
				equip(sets.OneHour)
				disable('feet')
				else
				enable('feet')
			end
    end
	
    function midcast(spell,action)
			if spell.action_type == 'Ranged Attack' then
				equip(sets.Midshot)
			end
            if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
                    if string.find(spell.english,'Utsusemi') then
                            if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
                                    send_command('@wait 1.7;cancel Copy Image*')
                            end
                            equip(sets.Midcast.Haste)
                    elseif spell.english == 'Monomi: Ichi' then
                            if buffactive['Sneak'] then
                                    send_command('@wait 1.7;cancel sneak')
                            end
                            equip(sets.Midcast.Haste)
                    else
                            equip(sets.Midcast.Haste)
                    end
            end
    end
     
    function aftercast(spell,action)	
		if spell.english == "Warding Circle" and not spell.interrupted then -- Warding Circle Countdown 
			send_command('wait 260;input /echo '..spell.name..' Effect: [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..' Effect: [OFF]')
		end	
			status_change(player.status)
	end
     
    function status_change(new,old)	
            if player.equipment.range ~= 'empty' then
				disable('range','ammo')
            else
				enable('range','ammo')
            end
            if Armor == 'PDT' then
                    equip(sets.PDT)
            elseif Armor == 'MDT' then
                    equip(sets.MDT)
            elseif new == 'Engaged' then
                    equipSet = sets.TP
					if player.mp > 100 then
						equip{ring2="Oneiros Ring"}
					else
						equip{ring2="Enlivened Ring"}
					end
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
                    if buffactive["Seigan"] and Seigan_T == 'ON' then
                            equipSet = set_combine(equipSet,sets.TP["Seigan"])
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
				disable('feet')
				else
				enable('feet')
			end
			if TH == 'ON' then
				equip(sets.TH)					
			end	
			if Rings == 'ON' then 
				equip(sets.Rings)					
			end	
			if buffactive["Meikyo Shisui"] then 
				equip(sets.OneHour)
				disable('feet')
				else
				enable('feet')
			end
			if buffactive["weakness"] then 
				equip(sets.Twilight)
				disable('head','body')				
				else
				enable('head','body')
			end
			if buffactive["Reive Mark"] then 
				equip(sets.ReiveNeck)
				disable('neck')				
				else
				enable('neck')
			end			
    end
	
    function buff_change(buff,gain)            
            if buff == "Hasso" and Auto_Hasso == 'ON' then 
				if not gain then
					send_command('Hasso')
			end
			elseif buff == "Seigan" and gain then
					status_change(player.status)
			else
					status_change(player.status)
			end	  
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
			if buff == "Yaegasumi" then
				if gain then
					send_command('timers create "Yaegasumi" 45 down')
				else
					send_command('timers delete "Yaegasumi"')
					add_to_chat(200,'Yaegasumi: [OFF]')
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
			if buff == "Reive Mark" then
				if gain then					
					add_to_chat(39,"Entered a Reive: [Equipping Reive Neck]")
				else					
					add_to_chat(200,"Left a Reive: [Removing Reive Neck]")
				end	
			end
			if buff == "Aftermath: Lv.3" then 
				if gain then
					send_command('timers create "Aftermath: Lv.3" 180 down abilities/am3.png')
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
            elseif command == 'seigan' then -- Seigan/ThirdEye Toggle --
					if Seigan_T == 'ON' then
							Seigan_T = 'OFF'
							add_to_chat(57,'Seigan Set: [Unlocked]')
					else
							Seigan_T = 'ON'
							add_to_chat(158,'Seigan Set: [Locked]')
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
			elseif command == 'autohasso' then -- Auto Hasso --
					if Auto_Hasso == 'ON' then
						Auto_Hasso = 'OFF'							
						add_to_chat(57,'Auto Hasso: [OFF]')
					else
						Auto_Hasso = 'ON'							
						add_to_chat(158,'Auto Hasso: [ON]')
					send_command('Hasso')
					end
			elseif command == 'ranaWS' then -- Rana WS --
					if Rana_WS == 'ON' then
						Rana_WS = 'OFF'							
						add_to_chat(57,'Tachi: Rana: [@ any TP]')
					else
						Rana_WS = 'ON'							
						add_to_chat(158,'Tachi: Rana: [@ 3000 TP]')					
					end		
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
					add_to_chat(207,'Auto [Hasso]: '..Auto_Hasso..'')
					add_to_chat(207,'Tachi: Rana [WS]: '..Rana_WS..'')
					add_to_chat(207,'Movement Set: '..Movement..'')
					add_to_chat(207,'Twilight Set: '..Twilight..'')
					add_to_chat(207,'Seigan-Third Eye Set: '..Seigan_T..'')
					add_to_chat(207,'PDT/MDT Set: '..Armor..'')								
            end
    end
	function file_unload()
			send_command('unbind f9')
			send_command('unbind f10')
			send_command('unbind f11')
			send_command('unbind f12')
	end