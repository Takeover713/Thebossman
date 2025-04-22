function user_setup()
	-- Options: Override default values
	
	--hi tim
    state.OffenseMode:options('Normal','FullAcc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','Subtle')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Foenaria','Caladbolg','Anguta','Apocalypse','Loxotic','Naegling')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}
	
	
	autows_list = {['Caladbolg']='Torcleaver',['Anguta']='Insurgency',['Apocalypse']='Catastrophe',['Loxotic']='Judgment',['Naegling']='Savage Blade',['Foenaria']='Origin'}
	
	send_command('exec init.txt')
	
	-- autows = 'Torcleaver'
	autowstp = 1250
	
	autofood = 'Grape Daifuku +1'
	
	buff_spell_lists = {
	Auto = {	
		{Name='Dread Spikes',Buff='Dread Spikes',SpellID=277,When='never'},
		{Name='Endark II',Buff='Endark',SpellID=856,When='Combat'},
	},
	
	Default = {
		{Name='Dread Spikes',Buff='Dread Spikes',SpellID=277,Reapply=false},
		{Name='Endark II',Buff='Endark',SpellID=856,Reapply=false},
	},
}

	-- Additional local binds
	--send_command('bind ^` input /ja "Hasso" <me>')
	--send_command('bind !` input /ja "Seigan" <me>')
    --send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @` gs c cycle SkillchainMode')
	--send_command('bind !c send @geo c1 thebo')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

	-- Weapons sets
	sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
	sets.weapons.Anguta = {main="Anguta",sub="Utu Grip"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Loxotic = {main="Loxotic Mace +1",sub="Blurred Shield +1"}
	sets.weapons.Naegling = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Foenaria = {main="Foenaria",sub="Utu Grip"}
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {hands="Fallen's Finger Gauntlets +3"}
	sets.precast.JA['Arcane Circle'] = {feet="Ig. Sollerets +1"}
	sets.precast.JA['Souleater'] = {head="Ig. Burgeonet +3"}
	sets.precast.JA['Weapon Bash'] = {hands="Ig. Gauntlets +3"}
	sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +3"}
	sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +3"}
	sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +3"}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="Sacro Breastplate",
		hands="Leyline Gloves", 
		legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
		feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+11',}},
		neck="Voltsurge Torque",
		waist="Plat. Mog. Belt",
		ear1="Malignance Earring",
		ear2="Loquac. Earring",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
		back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
                   
	-- Specific spells
	
	sets.midcast['Elemental Magic'] = {
		ammo="Pemphredo Tathlum",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
		hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Heath. Sollerets +3",
		neck="Sibyl Scarf",
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Friomisi Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Shiva Ring +1",
		back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- need a nuke ambu cape
	}
 
	sets.midcast['Dark Magic'] = {
         ammo="Pemphredo Tathlum", 
         head="Ig. burgeonet +3", 
         neck="Erra Pendant", 
         ear1="Dark Earring",
         ear2="Mani Earring",
         body={ name="Carm. Sc. Mail +1", augments={'MP+80','INT+12','MND+12',}}, 
         hands="Fallen's Finger Gauntlets +3", 
         waist="Casso Sash", -- 5
         ring1="Evanescence Ring", -- 10
         ring2="Stikini Ring +1",
		 back="Niht Mantle",
         legs="Heath. Flanchard +3",  -- 20 legs="Heath. Flanchard +3",
         feet="Ratri Sollerets +1"}
           
	sets.midcast['Enfeebling Magic'] = {
		ammo="Pemphredo Tathlum",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="Ignominy Cuirass +3",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Heath. Sollerets +3",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist="Casso Sash",
		left_ear="Malignance Earring",
		right_ear="Digni. Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		}
		   
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {
         ammo="Egoist's Tathlum",
         head="Ratri Sallet +1",
         body="Heathen's Cuirass +3",
         hands="Ratri Gadlings +1",
		 ring1="Moonlight Ring",
         ring2="Moonlight Ring",
         back="Moonbeam Cape",
         legs="Ratri Cuisses", 
         feet="Ratri Sollerets +1",
		 neck="Sanctity Necklace",
		 ear1="Odnowa Earring",
		 ear2="Odnowa Earring +1",
		 waist="Plat. Mog. Belt",})
		 
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
         back="Chuparrosa Mantle",
		 head="Ig. burgeonet +3",
         ring1="Kishar Ring",
		 feet="Ratri Sollerets +1",
		 ear1="Gwati Earring",
		 ear2="Dignitary's Earring",})
           
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
		ammo="Pemphredo Tathlum",
		head={ name="Fall. Burgeonet +3", augments={'Enhances "Dark Seal" effect',}},
		body="Fall. Cuirass +3",
		hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Rat. Sollerets +1",
		neck="Erra Pendant",
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Digni. Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		})
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
         ear1="Hirudinea Earring",
         ear2="Dignitary's Earring",
         body={ name="Carm. Sc. Mail +1", augments={'MP+80','INT+12','MND+12',}},
		 head="Fallen's Burgeonet +3",
		 ring1="Evanescence Ring",
         ring2="Excelsis Ring",
		 hands="Fall. Fin. Gaunt. +3",
		 ammo="Pemphredo Tathlum",
		 back={ name="Niht Mantle", augments={'Attack+15','Dark magic skill +10','"Drain" and "Aspir" potency +24',}},
		 legs="Heath. Flanchard +3",
		 waist="Austerity Belt +1",
		 feet="Ratri Sollerets +1"})
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {
	ammo="Pemphredo Tathlum",
	head=empty,
	neck="Erra Pendant", 
	body="Twilight Cloak",
	hands="Nyame Gauntlets",
	ring1="Archon Ring",
    ring2="Stikini Ring +1",
	legs="Nyame Flachard",
	ear1="Crep. Earring",
	ear2="Dignitary's Earring",
	waist="Oneiros Rope",
	feet="Heath. Sollerets +3",
	back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	})
	
	
	
	sets.DrainWeapon = {main="Misanthropy",sub="Alber Strap"}
	
	--sets.AbsorbWeapon = {main="Liberator",sub="Khonsu",range="Ullr",ammo=empty}
	sets.DreadWeapon = {main="Crepuscular Scythe",sub="Utu Grip",} 
	
	--sets.midcast.Cure = {}
	
	--sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = ({
	ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
})

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		})
	
    sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
		
	sets.precast.WS['Origin'] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		})
	
    sets.precast.WS['Origin'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Origin'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Origin'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Origin'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	
	
	

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
	
    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})
		
	
	sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Insurgency'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Insurgency'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Insurgency'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	
	sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Cross Reaper'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Cross Reaper'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Cross Reaper'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Quietus'] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Quietus'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Quietus'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Quietus'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	
	sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spiral Hell'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Spiral Hell'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Spiral Hell'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Spiral Hell'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {
	ammo="Crepuscular Pebble",
    head="Heath. Bur. +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Crepuscular Pebble",
    head="Heath. Bur. +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
})
    sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
    ammo="Crepuscular Pebble",
    head="Heath. Bur. +3",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Abyssal Beads +2",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Thrud Earring", -- schere earring
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
	ammo="Crepuscular Pebble",
    head="Heath. Bur. +3",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Abyssal Beads +2",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Thrud Earring", -- schere earring
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})     
	
    sets.precast.WS['Shockwave'] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Crep. Earring",
    right_ear="Thrud Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
})
    sets.precast.WS['Shockwave'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Shockwave'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Shockwave'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Crep. Earring",
    right_ear="Thrud Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Shockwave'].Fodder = set_combine(sets.precast.WS.Fodder, {})	
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	-- sets.MaxTP = {}
	-- sets.AccMaxTP = {}
	-- sets.AccDayMaxTPWSEars = {}
	-- sets.DayMaxTPWSEars = {}
	-- sets.AccDayWSEars = {}
	-- sets.DayWSEars = {}
     
            -- Idle sets legs="Carmine Cuisses +1",
           
    sets.idle = {
    ammo="Staunch Tathlum +1",
    head="Null masque",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Carmine Cuisses +1",
    feet="Sakpata's Leggings",
    neck="Loricate Torque +1",
    waist="Flume belt +1",
    ear1="Odnowa Earring",
    ear2="Odnowa Earring +1",
    ring1="Vocane Ring",
    ring2="Defending Ring",
    back="Moonbeam Cape",
}
		
    sets.idle.PDT = {
    ammo="Staunch Tathlum +1",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    ear1="Odnowa Earring",
    ear2="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
}

	sets.idle.Weak = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
           
    -- Defense sets
	sets.defense.PDT = {
    ammo="Seething Bomblet +1",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt +1",
    ear1="Cessance Earring",
    ear2="Telos Earring",
    ring1="Moonlight Ring",
    ring2="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.defense.MDT = {
    ammo="Seething Bomblet +1",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt +1",
    ear1="Cessance Earring",
    ear2="Telos Earring",
    ring1="Moonlight Ring",
    ring2="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.defense.MEVA = {
    ammo="Seething Bomblet +1",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt +1",
    ear1="Cessance Earring",
    ear2="Telos Earring",
    ring1="Moonlight Ring",
    ring2="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	--sets.passive.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
     
	-- Engaged sets
	sets.engaged = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
    sets.engaged.SomeAcc = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	sets.engaged.Acc = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
    sets.engaged.FullAcc = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
    sets.engaged.Fodder = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

	sets.engaged.DTLite = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.Subtle = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Dagon Breast.",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Bathy Choker +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
]]--

	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.latent_refresh = {waist="Fucho-no-Obi"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.buff['Dark Seal'] = {head="Fallen's Burgeonet +3"}
	
	
	
 end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(8, 2)
    elseif player.sub_job == 'SAM' then
        set_macro_page(8, 2)
    elseif player.sub_job == 'DNC' then
        set_macro_page(8, 2)
    elseif player.sub_job == 'THF' then
        set_macro_page(8, 2)
    else
        set_macro_page(8, 2)
    end
end


function sub_job_change(new,old)
send_command('wait 10;input /lockstyleset 1')
end

send_command('wait 10;input /lockstyleset 1')
