-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos','Khatvanga')

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	
--	gear.obi_cure_back = "Tempered Cape +1"
	--gear.obi_cure_waist = "Witful Belt"

	--gear.obi_low_nuke_waist = "Refoccilation Stone"
	--gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
	send_command('exec init.txt')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"}
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +1"}

    -- Fast cast sets for spells

    sets.precast.FC = {
	main="Musa",
    sub="Giuoco grip",
    ammo="Incantor Stone",
    head="Peda. M.Board +3",
    body="Pinga Tunic +1",
    hands="Acad. Bracers +2",
    legs="Pinga Pants +1",
    feet="Acad. Loafers +1",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Lugh's Cape", augments={'"Fast Cast"+10',}},
	}
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {}) --waist="Siegel Sash"

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {}) -- ear1="Barkaro. Earring"

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {}) --main="Serenity",sub="Clerisy Strap +1",body="Heka's Kalasiris"

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Amalric Doublet",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Psycloth Lappas",feet="Medium's Sabots"}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Akademos",neck="Mizu. Kubikazari",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring",feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Cure = {
	main="Daybreak",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    hands={ name="Peda. Bracers +1", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Phalaina Locket",
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Calamitous Earring",
    left_ring="Defending Ring",
    right_ring="Prolix Ring",
    back="Fi Follet Cape +1",
	}

    sets.midcast.LightWeatherCure = {
	main="Chatoyant Staff",
    sub="Enki Strap",
    ammo="Esper Stone +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    hands={ name="Peda. Bracers +1", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Phalaina Locket",
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Calamitous Earring",
    left_ring="Defending Ring",
    right_ring="Prolix Ring",
    back="Twilight Cape",
	}
		
    sets.midcast.LightDayCure = {
	main="Daybreak",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    hands={ name="Peda. Bracers +1", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Phalaina Locket",
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Calamitous Earring",
    left_ring="Defending Ring",
    right_ring="Prolix Ring",
    back="Fi Follet Cape +1",
	}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {
	--main="Gada",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
	hands="Peda. Bracers +1",
    --hands="Hieros mittens",
    legs="Acad. Pants +1",
    feet="Gende. Galosh. +1",
    neck="Debilis Medallion",
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Beatific Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back="Oretan. Cape +1",
	}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {
	main="Musa",
    sub="Giuoco grip",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands="Arbatel Bracers +3",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Colossus's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Fi Follet Cape +1",
	}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
	main="Musa",
    sub="Giuoco grip",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands="Arbatel Bracers +3",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Reti Pendant",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Calamitous Earring",
    left_ring="Defending Ring",
    --right_ring="Vocane Ring",
    back={ name="Lugh's Cape", augments={'"Fast Cast"+10',}},
	})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
	main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +1",
    body="Acad. Gown +1",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Acad. Pants +1",
    feet="Acad. Loafers +1",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear1="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ring1="Stikini Ring +1"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {
	main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +1",
    body="Acad. Gown +1",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Acad. Pants +1",
    feet="Acad. Loafers +1",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

    sets.midcast.Kaustra = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Agwu's Robe",
    hands="Amalric Gages +1",
    --legs="Almaric Slops +1",
    feet="Agwu's pigaches",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
    sets.midcast.Kaustra.Resistant = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Agwu's Robe",
    hands="Amalric Gages +1",
    --legs="Almaric Slops +1",
    feet="Agwu's pigaches",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

    sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Zendik Robe",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Arbatel Gown +3",
	hands="Arbatel bracers +3",
	legs="Arbatel pants +3",
	feet="Arbatel loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

    sets.midcast['Elemental Magic'].Resistant = {}
		
    sets.midcast['Elemental Magic'].Fodder = {}
		
    sets.midcast['Elemental Magic'].Proc = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Arbatel Gown +3",
	hands="Arbatel bracers +3",
	legs="Arbatel pants +3",
	feet="Arbatel loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Arbatel Gown +3",
	hands="Arbatel bracers +3",
	legs="Arbatel pants +3",
	feet="Arbatel loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Arbatel Gown +3",
    hands="Arbatel bracers +3",
    legs="Arbatel pants +3",
	feet="Arbatel loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

    sets.HelixBurst = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Arbatel Gown +3",
    hands="Arbatel bracers +3",
    legs="Arbatel pants +3",
	feet="Arbatel loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
	right_ring="Metamorph ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
    sets.ResistantHelixBurst = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Arbatel Gown +3",
    hands="Arbatel bracers +3",
    legs="Arbatel pants +3",
	feet="Arbatel loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
	right_ring="Metamorph ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})

	sets.midcast.Helix = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Arbatel Gown +3",
    hands="Arbatel bracers +3",
    legs="Arbatel pants +3",
	feet="Arbatel loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
	right_ring="Metamorph ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast.Helix.Resistant = {}
		
	sets.midcast.Helix.Proc = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Arbatel Gown +3",
    hands="Arbatel bracers +3",
    legs="Arbatel pants +3",
	feet="Arbatel loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
	right_ring="Metamorph ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {
	main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Agwu's Slops",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
	main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Agwu's Slops",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",}

    sets.idle.PDT = {
	main="Malignance Pole",
    sub="Irenic Strap +1",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
	}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = {main="Malignance Pole",
    sub="Irenic Strap +1",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}
		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

    -- Defense sets

    sets.defense.PDT = {main="Malignance Pole",
    sub="Irenic Strap +1",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}

    sets.defense.MDT = {main="Malignance Pole",
    sub="Irenic Strap +1",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}
		
    sets.defense.MEVA = {main="Malignance Pole",
    sub="Irenic Strap +1",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
		
	sets.engaged.PDT = {main="Malignance Pole",
    sub="Irenic Strap +1",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +3"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {legs="Arbatel Pants +3"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +3"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"
	
	sets.buff.Sublimation = {
	head="Acad. Mortar. +1",
	body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
	waist="Embla Sash",
	}
    
	sets.buff.DTSublimation = {waist="Embla Sash"}

    --sets.buff.FullSublimation = {}
   -- sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Akademos = {main="Akademos",sub="Niobid Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(2, 11)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 11)
	elseif player.sub_job == 'WHM' then
		set_macro_page(2, 11)
	else
		set_macro_page(2, 11)
	end
end

function sub_job_change(new,old)
send_command('wait 10;input /lockstyleset 1')
end

send_command('wait 10;input /lockstyleset 1')