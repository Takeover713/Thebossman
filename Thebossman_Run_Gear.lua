function user_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('Aettir','Lionheart')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = {name="Ogma's cape",augments={'INT+20','Eva.+20 /Mag. Eva.+20','Enmity+10',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	--send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !pause gs c toggle AutoBuffMode')
	--send_command('bind !t gs c toggle AutoTankMode')
	--send_command('bind !d send @all gs c buff')
	--send_command('bind !q send @brd //hordelullaby2 <tid>')
	--send_command('bind !a sat alltarget')
	--send_command('bind ^d send rafleshia gs c oboss')
	--send_command('bind !s send @whm sacrosanctity')
	--send_command('bind !h send @whm hb on')
	--send_command('bind !f send @others gs c attackbt')
	--send_command('bind !r gs c weapons Lionheart;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {		ammo="Sapience orb",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Erilaz greaves +1",
		neck="Moonlight Necklace",
		waist="Goading Belt",
		left_ear="Cryptic Earring",
		right_ear="Pluto's Pearl",
		left_ring="Provocare Ring",
		right_ring="Supershear Ring",
		back="Reiki cloak"}
		 
    sets.Enmity.SIRD = {ammo="Staunch Tathlum +1",
		head="Taeon Chapeau",
		neck="Moonlight Necklace",
		ear1="Halasz Earring",
		ear2="Cryptic Earring",
		body="Emet Harness +1",
		hands="Regal Gauntlets",
		ring1="Provocare Ring",
		ring2="Supershear Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Rumination Sash",
		legs="Carmine Cuisses +1",
		feet="Erilaz Greaves +1"
		}

    sets.Enmity.DT = {ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +1",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +1", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Toro Cape",waist="Eschan Stone",legs=gear.herculean_nuke_legs,feet=gear.herculean_nuke_feet}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	sets.element.Earth = {neck="Quanpur Necklace"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers +1"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {		ammo="Impatiens",
		head="Carmine Mask +1",
		body="Vrikodara Jupon",
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Voltsurge Torque",
		waist="Tempus Fugit",
		left_ear="Enchntr. Earring +1",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Ogma's cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},}
			
	sets.precast.FC.DT = {ammo="Staunch Tathlum",
        head="Rune. Bandeau +3",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {    ammo="Knobkierrie",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +1",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +1",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu ring",
    right_ring="Regal Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}
	
	sets.precast.WS.SomeAcc = {ammo="Seeth. Bomblet +1",
            head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.Acc = {ammo="Seeth. Bomblet +1",
            head="Dampening Tam",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.HighAcc = {ammo="Seeth. Bomblet +1",
            head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	sets.precast.WS.FullAcc = {ammo="Seeth. Bomblet +1",
            head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Zennaroi Earring",
            body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo="Impatiens",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Flume Belt",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{		head="Erilaz galea +1",
		body="Runeist Coat +1",
		hands="Runeist Mitons +1",
		legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
		feet="Erilaz greaves +1",
		neck="Colossus's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Augment. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Merciful Cape"})
		
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{head="Futhark Bandeau +1",legs="Carmine Cuisses +1"})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +1"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum",
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {		
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
		body="Erilaz Surcoat +1",
		hands="Runeist Mitons +1",
		legs="Carmine Cuisses +1",
		feet="Erilaz Greaves +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Moonbeam Cape"
		}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {		
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
		body="Erilaz Surcoat +1",
		hands="Runeist Mitons +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Moonbeam Cape",
		}
		
	sets.idle.KiteTank = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
		body="Erilaz Surcoat +1",
		hands="Runeist Mitons +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Moonbeam Cape",
		}

	sets.idle.Weak = {		
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
		body="Erilaz Surcoat +1",
		hands="Runeist Mitons +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Moonbeam Cape",
		}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Alber Strap"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	--sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
		body="Erilaz Surcoat +1",
		hands="Runeist Mitons +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Moonbeam Cape",}
		
	sets.defense.PDT_HP = {ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.defense.MDT = {    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body="Erilaz Surcoat +1",
    hands="Runeist Mitons +1",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}
	
	sets.defense.MDT_HP = {ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.BDT = {    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body="Erilaz Surcoat +1",
    hands="Runeist Mitons +1",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}
	sets.defense.BDT_HP = {ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.MEVA = {    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body="Erilaz Surcoat +1",
    hands="Runeist Mitons +1",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}
	
	sets.defense.MEVA_HP = {ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {    
	ammo="Yamarang",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','STR+5','Accuracy+11','Attack+15',}},
    neck="Anu Torque",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu ring",
    right_ring="Petrov Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}
    sets.engaged.SomeAcc = {}
	
	sets.engaged.Acc = {}
	
	sets.engaged.HighAcc = {}
	
	sets.engaged.FullAcc = {}
	
    sets.engaged.DTLite = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
		body="Erilaz Surcoat +1",
		hands="Runeist Mitons +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Moonbeam Cape"
		}
		
    sets.engaged.SomeAcc.DTLite = {}
	
	sets.engaged.Acc.DTLite = {}
	
	sets.engaged.HighAcc.DTLite = {}
	
	sets.engaged.FullAcc.DTLite = {}
	
	
    sets.engaged.Tank = {ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
		body="Erilaz Surcoat +1",
		hands="Runeist Mitons +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Moonbeam Cape"}
		
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'RDM' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'SCH' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'BLU' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'WAR' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'SAM' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'DRK' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'NIN' then
		set_macro_page(6, 16)
	else
		set_macro_page(6, 16)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[1013] < spell_latency and not have_trust("Lilisette") then
					windower.send_command('input /ma "Lilisette II" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = (framerate * 3)
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_target_change(target)
    if target and S{"Quetzalcoatl","Naga Raja","Azi Dahaka"}:contains(target.name) then
        state.AutoRuneMode:set('true')
    end

    return false
end

function user_self_command(commandArgs, eventArgs)
	if commandArgs[1] == 'buff' then
	   send_command('input /ma "Crusade" <me>; wait 5; input /ma "Temper" <me>; wait 5; input /ma "Phalanx" <me>; wait 5; input /ma "Cocoon" <me>')
       add_to_chat(158,'Buffing')
	elseif commandArgs[1] == 'rad' then
	   send_command('input /echo waiting; wait 4.5; input //temps buy radialens')
       add_to_chat(158,'Radialens')
	elseif commandArgs[1] == 'ewz' then
	   send_command('input /echo waiting; wait 4.5; input //ew z')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew1' then
	   send_command('input /echo waiting; wait 4.5; input //ew 1')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew2' then
	   send_command('input /echo waiting; wait 4.5; input //ew 2')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew3' then
	   send_command('input /echo waiting; wait 4.5; input //ew 3')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew4' then
	   send_command('input /echo waiting; wait 4.5; input //ew 4')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew5' then
	   send_command('input /echo waiting; wait 4.5; input //ew 5')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew6' then
	   send_command('input /echo waiting; wait 4.5; input //ew 6')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew7' then
	   send_command('input /echo waiting; wait 4.5; input //ew 7')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew8' then
	   send_command('input /echo waiting; wait 4.5; input //ew 8')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew9' then
	   send_command('input /echo waiting; wait 4.5; input //ew 9')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew10' then
	   send_command('input /echo waiting; wait 4.5; input //ew 10')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew11' then
	   send_command('input /echo waiting; wait 4.5; input //ew 11')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew12' then
	   send_command('input /echo waiting; wait 4.5; input //ew 12')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew13' then
	   send_command('input /echo waiting; wait 4.5; input //ew 13')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew14' then
	   send_command('input /echo waiting; wait 4.5; input //ew 14')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew15' then
	   send_command('input /echo waiting; wait 4.5; input //ew 15')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'stop' then
        windower.ffxi.run(false)
        windower.ffxi.follow()
		add_to_chat(158,'Chillin')
	elseif commandArgs[1] == 'food' then
       send_command('input /item "Miso Ramen +1" <me>')
       add_to_chat(158,'Eating')
	elseif commandArgs[1] == 'charm' then
       send_command('input /item "Charm Buffer" <me>')
       add_to_chat(158,'Charm buffer')
	elseif commandArgs[1] == 'wing1' then
       send_command('input /item "Lucid Wings I" <me>')
       add_to_chat(158,'Lucid Wings I')
	elseif commandArgs[1] == 'wing2' then
       send_command('input /item "Lucid Wings II" <me>')
       add_to_chat(158,'Lucid Wings II')
	elseif commandArgs[1] == 'wing3' then
       send_command('input /item "Daedalus wing" <me>')
       add_to_chat(158,'Daedalus wing')
	elseif commandArgs[1] == 'super' then
       send_command('input /item "Super Revitalizer" <me>')
       add_to_chat(158,'Super Revitalizer')
	elseif commandArgs[1] == 'pois' then
       send_command('input /item "Poison Buffer" <me>')
       add_to_chat(158,'Poison Buffer')
	elseif commandArgs[1] == 'doom' then
       send_command('input /item "Savior\'s Tonic" <me>')
       add_to_chat(158,'Savior tonic')
	elseif commandArgs[1] == 'amne' then
       send_command('input /item "Moneta\'s Tonic"  <me>')
       add_to_chat(158,'Monetas Tonic')
	elseif commandArgs[1] == 'petri' then
       send_command('input /item "Mirror\'s Tonic" <me>')
       add_to_chat(158,'Mirrors Tonic')
	elseif commandArgs[1] == 'pote' then
       send_command('input /item "Champion\'s Drink" <me>')
       add_to_chat(158,'Champions Drink')
	end
end