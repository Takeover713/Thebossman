function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.WeaponskillMode:options('Match','Normal')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight'}
	state.Weapons:options('Naegling','Chango','Polearm','Loxotic','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcClub','ProcStaff')

	gear.da_jse_back = {name="Cichol's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	gear.crit_jse_back = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10'}}

	-- Additional local binds
	-- send_command('bind ^` input /ja "Hasso" <me>')
	-- send_command('bind !` input /ja "Seigan" <me>')
    -- send_command('bind !f11 gs c cycle ExtraMeleeMode')
	-- send_command('bind @` gs c cycle SkillchainMode')
	-- send_command('bind !r gs c weapons Greatsword;gs c update')
	
	autows_list = {['Chango']='Upheaval',['Polearm']='Impulse Drive',['Loxotic']='Judgment',['Naegling']='Savage Blade'}
	
	-- Weapons sets
	sets.weapons.Chango = {main="Chango",sub="Utu Grip"}
	sets.weapons.Naegling = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Loxotic = {main="Loxotic Mace +1",sub="Blurred Shield +1"}
	sets.weapons.Polearm = {main="Shining One",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}
	sets.weapons.ProcDagger = {main="Onion Dagger",sub=empty}
	sets.weapons.ProcSword = {main="Firetongue",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}
	sets.weapons.ProcClub = {main="Jingly Rod",sub=empty}
	sets.weapons.ProcStaff = {main="Ram Staff",sub=empty}
	
	select_default_macro_book(1, 11)
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Idle sets
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Murky Ring",
		back="Solemnity Cape",
}
		
	sets.idle.Weak = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})	
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
	
	-- Defense sets
	sets.defense.PDT = {
		ammo="Staunch Tathlum +1",
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Murky Ring",
		back="Solemnity Cape",
}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.defense.MDT = {
		ammo="Staunch Tathlum +1",
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Murky Ring",
		back="Solemnity Cape",
}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.defense.MEVA = {
		ammo="Staunch Tathlum +1",
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Murky Ring",
		back="Solemnity Cape",
}

     -- Engaged sets
	-- sets.engaged = {
		-- ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		-- head={ name="Sakpata's Helm", augments={'Path: A',}},
		-- body={ name="Sakpata's Plate", augments={'Path: A',}},
		-- hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		-- legs="Pumm. Cuisses +4",
		-- feet="Pumm. Calligae +4",
		-- legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		-- feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		-- neck={ name="War. Beads +2", augments={'Path: A',}},
		-- waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		-- left_ear={ name="Schere Earring", augments={'Path: A',}},
		-- right_ear="Boii Earring +1",
		-- left_ring="Niqmaddu Ring",
		-- right_ring="Chirich Ring +1",
		-- back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
-- }

	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Hjarrandi Helm",
		body="Boii Lorica +3",
		hands="Sakpata's Gauntlets",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="Vim Torque +1",
		waist="Sailfi Belt +1",
		left_ear="Schere Earring",
		right_ear="Boii Earring +1",
		left_ring="Niqmaddu Ring",
		right_ring="Moonlight Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

	--sets.engaged.Mighty = {}

	sets.engaged.Fencer = {
		ammo="Coiste Bodhar",
		head="Boii Mask +3",
		body="Hjarrandi Breast.",
		hands="Sakpata's Gauntlets",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Schere Earring",
		right_ear="Boii Earring +1",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring +1",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	
	--sets.engaged.Fencer.Mighty = {}
	
	-- Precast Sets
	
	sets.Enmity = {ammo="Sapience Orb",head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Moonlight Necklace",waist="Goading Belt",left_ear="Cryptic Earring",right_ear="Odnowa Earring +1",
		left_ring="Apeile Ring",right_ring="Apeile Ring +1",back={ name="Cichol's Mantle", augments={'Enmity+10',}},}
	
	sets.Knockback = {}
	sets.passive.Twilight = {head="Crepuscular Helm",body="Crepuscular Mail"}
	
	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {back="Cichol's Mantle",feet="Agoge Calligae +1"}
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity,{head="Agoge Mask +1"})
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {body="Agoge Lorica +1"}
	sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers +1"}
	sets.precast.JA["Warrior's Charge"] = {legs="Agoge Cuisses +1"}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk",feet="Agoge Calligae +1"}
	sets.precast.JA['Retaliation'] = {feet="Boii Calligae +3"}
	sets.precast.JA['Restraint'] = {hands="Boii Mufflers +3"}
	sets.precast.JA['Blood Rage'] = set_combine(sets.Enmity,{body="Boii Lorica +3"})
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	sets.precast.Step = {}	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {
		ammo="Impatiens",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
		body="Odyss. Chestplate",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Flume Belt",
		legs=gear.odyssean_fc_legs,
		feet="Odyssean Greaves",
}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {
		ammo="Staunch Tathlum",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
		body="Odyss. Chestplate",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Tempus Fugit",
		legs=gear.odyssean_fc_legs,
		feet="Odyssean Greaves",
}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})    
	sets.midcast.Cure = {}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Knobkierrie",
		head="Agoge Mask +4",
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Boii Cuisses +3",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Ephramad's Ring",
		right_ring="Regal Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Agoge Mask +4",
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Boii Cuisses +3",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Ephramad's Ring",
		right_ring="Sroda Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
})


    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Agoge Mask +4",
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Boii Cuisses +3",
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
})

     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})	
    sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Armor Break'] = set_combine(sets.precast.WS, {
		ammo="Pemphredo Tathlum",
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Boii Cuisses +3",
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck="Moonlight Necklace",
		waist="Eschan Stone",
		left_ear="Crep. Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
})
    sets.precast.WS['Armor Break'].SomeAcc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Armor Break'].Acc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Armor Break'].FullAcc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Armor Break'].Fodder = set_combine(sets.precast.WS['Armor Break'], {})

	sets.precast.WS['Full Break'] = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Full Break'].SomeAcc = set_combine(sets.precast.WS['Armor Break'].SomeAcc, {})
    sets.precast.WS['Full Break'].Acc = set_combine(sets.precast.WS['Armor Break'].Acc, {})
    sets.precast.WS['Full Break'].FullAcc = set_combine(sets.precast.WS['Armor Break'].FullAcc, {})
    sets.precast.WS['Full Break'].Fodder = set_combine(sets.precast.WS['Armor Break'].Fodder, {})
	
	sets.precast.WS['Weapon Break'] = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Weapon Break'].SomeAcc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Weapon Break'].Acc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Weapon Break'].FullAcc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Weapon Break'].Fodder = set_combine(sets.precast.WS['Armor Break'], {})
	
	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Leg Sweep'].SomeAcc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Leg Sweep'].Acc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Leg Sweep'].FullAcc = set_combine(sets.precast.WS['Armor Break'], {})
    sets.precast.WS['Leg Sweep'].Fodder = set_combine(sets.precast.WS['Armor Break'], {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}           
	
    sets.resting = {}
	sets.Kiting = {feet="Hermes' Sandals +1"}
	sets.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Loricate Torque +1"}
     

	
end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 10)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 10)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 10)
    else
        set_macro_page(1, 10)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 1')
end

send_command('exec init.txt')