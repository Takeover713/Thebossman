function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','MinAcc','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc','Fodder')
    state.CastingMode:options('Normal','Resistant','Fodder','Proc')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Naegling','MagicWeapons')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.mab_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	gear.obi_cure_waist = "Luminary Sash"
	gear.obi_nuke_waist = "Yamabuki-no-Obi"

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
    send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')
	--send_command('bind !h send @whm hb on')
	
	autows = 'Savage Blade'
	autowstp = 1250
	
	autofood = 'Sublime sushi +1'

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +2"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +1"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {legs="Dashing Subligar"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Dampening Tam",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
					body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	-- Fast cast sets for spells

	sets.precast.FC = {
	ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Vrikodara Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Carmine Cuisses +1",
    feet="Carmine Greaves +1",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring", --Enchntr. Earring +1
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back="Perimede Cape",
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
	ammo="Aurgelmir orb +1",
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body={ name="Herculean Vest", augments={'Accuracy+7','Weapon skill damage +5%','STR+5','Attack+15',}},
    hands={ name="Herculean Gloves", augments={'Weapon skill damage +4%','STR+9','Accuracy+9','Attack+10',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+24 Attack+24','Weapon skill damage +5%','Attack+3',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +5%','STR+4','Mag. Acc.+5','"Mag.Atk.Bns."+7',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
				  }

	sets.precast.WS.SomeAcc = {}

	sets.precast.WS.Acc = {}

	sets.precast.WS.HighAcc = {}

	sets.precast.WS.FullAcc = {}

	sets.precast.WS.Fodder = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Requiescat'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Requiescat'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].HighAcc = set_combine(sets.precast.WS.HighAcc, {ring1="Rufescent Ring",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Chant du Cygne'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Chant du Cygne'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Savage Blade'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet +1",ear1="Cessance Earring", ear2="Brutal Earring",ring2="Begrudging Ring",back=gear.crit_jse_back,feet="Thereoid Greaves"})
	sets.precast.WS['Vorpal Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Adhemar Bonnet +1",ring2="Begrudging Ring",back=gear.crit_jse_back})
	sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS.Acc, {back=gear.crit_jse_back})
	sets.precast.WS['Vorpal Blade'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
	sets.precast.WS['Vorpal Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Vorpal Blade'].Fodder = set_combine(sets.precast.WS['Vorpal Blade'], {})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Rufescent Ring",back=gear.wsd_jse_back,waist="Grunfeld Rope",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ear1="Moonshade Earring",ear2="Ishvara Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Rufescent Ring",back=gear.wsd_jse_back,waist="Grunfeld Rope",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Moonshade Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,legs="Carmine Cuisses +1",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].HighAcc = set_combine(sets.precast.WS.HighAcc, {ear2="Moonshade Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,legs="Carmine Cuisses +1",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Assim. Jubbah +3",hands="Jhakri Cuffs +2"})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
			         head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Archon Ring",
			         back=gear.mab_jse_back,waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"} -- test

	sets.precast.WS['Flash Nova'] = {ammo="Pemphredo Tathlum",
			         head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
			         back=gear.mab_jse_back,waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Helios Jacket",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {
	ammo="ginsen",
    head="Dampening Tam",
    body="Herculean Vest",
    hands="adhemar wristbands +1",
    legs="samnuha tights",
    feet="herculean boots",
    neck="Tjukurrpa Medal",
    waist="prosilio belt +1",
    left_ear="Flame Pearl",
    right_ear="Flame Pearl",
    left_ring="ifrit ring +1",
    right_ring="Ifrit Ring +1",
    back="buquwik cape"
	}

	sets.midcast['Blue Magic'].Physical.Resistant = {}

	sets.midcast['Blue Magic'].Physical.Fodder = {}

	sets.midcast['Blue Magic'].PhysicalAcc = {}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {
	ammo="ginsen",
    head="Dampening Tam",
    body="Herculean Vest",
    hands="adhemar wristbands +1",
    legs="samnuha tights",
    feet="herculean boots",
    neck="Tjukurrpa Medal",
    waist="prosilio belt +1",
    left_ear="Flame Pearl",
    right_ear="Flame Pearl",
    left_ring="ifrit ring +1",
    right_ring="Ifrit Ring +1",
    back="buquwik cape"
	})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})


	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {
	ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Cornflower Cape", augments={'MP+23','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}
					 
	sets.midcast['Blue Magic'].Magical.Proc = {}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].Magical.Fodder = {}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {neck="Sanctity Necklace",ring1="Stikini Ring",ring2="Stikini Ring"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {}

	sets.midcast['Enfeebling Magic'] = {}

	sets.midcast['Dark Magic'] = {}

	sets.midcast['Enhancing Magic'] = {ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Colossus's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {}

	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Earth = {neck="Quanpur Necklace"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {
	ammo="Pemphredo Tathlum",
	neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
	body="Vrikodara Jupon",ring1="Janniston Ring",ring2="Haoma's Ring",}

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {}

	sets.midcast['Blue Magic'].Stun.Resistant = {}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {
	ammo="Staunch Tathlum",
    head="Blistering Sallet +1",
    body="Pinga Tunic",
    hands="Telchine Gloves",
    legs="Pinga Pants +1",
    feet="Medium's Sabots",
    neck="Dualism Collar +1",
    waist="Oneiros Belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Eihwaz Ring",
    right_ring="Meridian Ring",
    back="Moonlight Cape",
	}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {
	ammo="Staunch Tathlum",
    head="Assim. Keffiyeh +1",
    body="Pinga Tunic",
    hands="Telchine Gloves",
    legs="Pinga Pants +1",
    feet="Medium's Sabots",
    neck="Nuna Gorget +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Beatific Earring",
    left_ring="Levia. Ring +1",
    right_ring="Levia. Ring +1",
    back="Tempered Cape",
					}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {
	ammo="Mavi Tathlum",
    head={ name="Luh. Keffiyeh +1", augments={'Enhances "Convergence" effect',}},
    body="Assim. Jubbah +1",
    hands="Assim. Bazu. +1",
    legs="Assim. Shalwar +1",
    feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
    neck="mirage stole +2",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="stikini ring +1",
    right_ring="stikini ring +1",
    back="Cornflower Cape",
	}

	sets.midcast['Blue Magic'].Buff = {}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {
	ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Nyame Gauntlets",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
				  }

	-- Idle sets
	sets.idle = {
	ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Nyame Gauntlets",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
				  }

	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = {
	ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Nyame Gauntlets",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
				}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {
	ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Nyame Gauntlets",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
				}

	sets.defense.MDT = {
	ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Nyame Gauntlets",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
	}

    sets.defense.MEVA = {
	ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
		}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Assault = {ring1="Balrahn's Ring"}
	
	-- Weapons sets
	sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.Naegling = {main="Naegling",sub="Colada"}
	sets.weapons.MeleeClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.Almace = {main="Almace",sub="Sequence"}
	sets.weapons.Sequence = {main="Sequence",sub="Almace"}
	sets.weapons.MagicWeapons = {main="Bunzi's Rod",sub="Nibiru Cudgel"}
	sets.weapons.MaccWeapons = {main="Iris",sub="Iris"}
	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets

	sets.engaged = {
	ammo="Ginsen",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','STR+5','Accuracy+11','Attack+15',}},
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
				}

	sets.engaged.AM = {
	ammo="Ginsen",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','STR+5','Accuracy+11','Attack+15',}},
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}

	sets.engaged.MinAcc = {}

	sets.engaged.MinAcc.AM = {}

	sets.engaged.SomeAcc = {}

	sets.engaged.SomeAcc.AM = {}

	sets.engaged.Acc = {}

	sets.engaged.Acc.AM = {}

	sets.engaged.HighAcc = {}

	sets.engaged.HighAcc.AM = {}

	sets.engaged.FullAcc = {}

	sets.engaged.FullAcc.AM = {}

	sets.engaged.Fodder = {}

	sets.engaged.Fodder.AM = {}

	sets.engaged.DTLite = {
	ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}

	sets.engaged.DTLite.AM = {
	ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
				}

	sets.engaged.PDT = {
	ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
				}

	sets.engaged.MinAcc.DTLite = {}

	sets.engaged.MinAcc.PDT = {}

	sets.engaged.SomeAcc.DTLite = {}

	sets.engaged.SomeAcc.PDT = {}

	sets.engaged.Acc.DTLite = {}

	sets.engaged.Acc.PDT = {}

	sets.engaged.HighAcc.DTLite = {}

	sets.engaged.HighAcc.PDT = {}

	sets.engaged.FullAcc.DTLite = {}

	sets.engaged.FullAcc.PDT = {}

	sets.engaged.Fodder.DTLite = {}

	sets.engaged.Fodder.DTLite.AM = {}

	sets.engaged.Fodder.PDT = {}

	sets.engaged.MDT = {ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}

	sets.engaged.MinAcc.MDT = {}

	sets.engaged.SomeAcc.MDT = {}

	sets.engaged.Acc.MDT = {}

	sets.engaged.HighAcc.MDT = {}

	sets.engaged.FullAcc.MDT = {}

	sets.engaged.Fodder.MDT = {}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Healing_Club = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Healing_DWClub = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Healing_Club = {}
	sets.Healing_DWClub = {}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(2, 6)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 6)
	elseif player.sub_job == 'WAR' then
		set_macro_page(2, 6)
	elseif player.sub_job == 'RUN' then
		set_macro_page(2, 6)
	elseif player.sub_job == 'THF' then
		set_macro_page(2, 6)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 6)
	else
		set_macro_page(2, 6)
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
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
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