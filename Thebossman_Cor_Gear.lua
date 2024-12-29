-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('LeadenMelee','LeadenMelee2','AeolianWeapons','LeadenRanged','LastStand','SavageWeapons','SavageWeapon') -- ('Default','AeolianWeapons','DualWeapons','SavageWeapons','DualRangedWeapons','LeadenWeapons','LastStand','None')
	state.CompensatorMode:options('Always','300','Never','1000')

    gear.RAbullet = "Chrono Bullet" -- Chrono Bullet
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here. Orichalc. Bullet
    gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15

	-- gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	-- gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	-- gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	-- gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	-- gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	-- gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
	autows = 'Savage Blade'
	autowstp = 1250
	
	autofood = 'Sublime sushi +1'

    -- Additional local binds
	--send_command('bind !pageup ffo me')
	--send_command('bind !pagedown ffo stopall')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	--send_command('bind !r gs c weapons SingleWeapon;gs c update')
	--send_command('bind @q gs c weapons MaccWeapons;gs c update')
	--send_command('bind ^q gs c weapons DualRangedWeapons;gs c update')
	--send_command('bind !q gs c weapons SavageWeapons;gs c update')
	--send_command('bind @pause roller roll')
	--send_command('bind !d send @all gs c buff')
	--send_command('bind @d send @brd gs c buff3')
	--send_command('bind ^d send @brd gs c oboss')
	--send_command('bind !q send @brd //hordelullaby2 <bt>')
	--send_command('bind ^d send rafleshia gs c oboss')
	--send_command('bind !a sat alltarget')
	--send_command('bind !a send @others sat alltarget')
	--send_command('bind !s send @whm sacrosanctity')
	--send_command('bind !h send @whm hb on')
	--send_command('bind ^h send @geo hb on')
	--send_command('bind @h send @brd hb on')
	--send_command('bind !f send @others gs c attackbt')
	--send_command('bind !t send @run gs c toggle Autotankmode')
	--send_command('bind !z send @cor //leadensalute <t>')
	--send_command('bind !v send @geo //fullcircle')
	send_command('bind !x send @smn //thunderspark <t>')
	send_command('bind ![ send @geo //fira3 <t>')
	send_command('bind !] send @geo //Thundara3 <t>')
	send_command('bind @x send @smn //voltstrike <t>')
	send_command('bind ^x send @smn //apogee')
	--send_command('bind !t send @run gs c toggle Autotankmode')
	send_command('bind !/ send @run //vivaciouspulse')
	--send_command('bind !b gs c buffup')
	send_command('bind !pause gs c toggle AutoBuffMode')
	--send_command('bind !a send @others /assist Thebossman')
	--send_command('bind !s send @whm sacrosanctity')
	--send_command('bind !f send @others gs c attackbt')
	--send_command('bind ^q send @cor gs c toggle Autowsmode')
	--send_command('bind @q send @sam gs c toggle Autowsmode')
	--send_command('bind !b gs c buffup Full')
	--send_command('bind !m send @geo //geomalaise <t>')
	--send_command('bind !c send @geo //c1 thebo')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +3"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}
    
	sets.precast.CorsairRoll = {
	main={ name="Rostam", augments={'Path: C',}},
	head="Lanun Tricorne +3",
	neck="Regal Necklace",
	hands="Chasseur's Gants +3",
	ring2="Luzaf's Ring",
    back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Snapshot"+10',}},
	feet="Malignance Boots",}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +3"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +3"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +3"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Dbl.Atk."+1','MND+7','"Mag.Atk.Bns."+15',}},
    body="Lanun Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit. hit damage +3%','"Mag.Atk.Bns."+4',}},
    feet="Chass. Bottes +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
		
	sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Dbl.Atk."+1','MND+7','"Mag.Atk.Bns."+15',}},
    body="Lanun Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit. hit damage +3%','"Mag.Atk.Bns."+4',}},
    feet="Chass. Bottes +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
	
    sets.precast.CorsairShot.Proc = {ammo=gear.QDbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Dbl.Atk."+1','MND+7','"Mag.Atk.Bns."+15',}},
    body="Lanun Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit. hit damage +3%','"Mag.Atk.Bns."+4',}},
    feet="Chass. Bottes +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Dbl.Atk."+1','MND+7','"Mag.Atk.Bns."+15',}},
    body="Lanun Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit. hit damage +3%','"Mag.Atk.Bns."+4',}},
    feet="Chass. Bottes +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
	-- waist="Skrymir Cord +1",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +3"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",
		neck="Baetyl Pendant",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
        body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",
        back="Moonbeam Cape",
		waist="Flume Belt +1",
		legs="Rawhide Trousers",
		feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chass. Tricorne +1",
		neck="Commodore Charm +2",
        body="Laksa. Frac +3",
		hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}},
		Left_ring="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Snapshot"+10',}},
		waist="Yemaya Belt",
		legs="Adhemar kecks +1",
		feet="Meg. Jam. +2"}
		
	-- sets.precast.RA = {
    -- ammo=gear.RAbullet,
    -- head="Chass. Tricorne +2",
    -- body="Laksa. Frac +3",
    -- hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}},
    -- legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    -- feet="Meg. Jam. +2",
    -- neck={ name="Comm. Charm +2", augments={'Path: A',}},
    -- waist="Yemaya Belt",
    -- left_ear="Telos Earring",
    -- right_ear="Crep. Earring",
    -- left_ring="Jalzahn's Ring",
    -- right_ring="Crepuscular Ring",}	
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Chrono Bullet",
    head="Lanun Tricorne +3",
    body="Laksa. Frac +3",
    hands="Chasseur's Gants +3",
    legs="Meg. Chausses +1",
    feet="Lanun Bottes +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat ring",
    right_ring="Regal ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}
		
    sets.precast.WS.Acc = {}		
		
    sets.precast.WS.Proc = {}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Carmine Mask +1",ring2="Rufescent Ring",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"})
	
	sets.precast.WS['Aeolian Edge'] = {ammo=gear.QDbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Dbl.Atk."+1','MND+7','"Mag.Atk.Bns."+15',}},
    body="Lanun Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

	sets.precast.WS['Circle Blade'] = {ammo=gear.WSbullet,
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body="Laksa. Frac +3",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+24 Attack+24','Weapon skill damage +5%','Attack+3',}},
    feet="Lanun Bottes +3",
    neck="Fotia Gorget",
    waist="Prosilio Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
	
	
	--Sroda ring instead of regal ring, crepuscular knife, nyame helm r15, nyame legs r15, 
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body="Laksa. Frac +3",
	hands="Chasseur's Gants +3",
    legs={ name="Herculean Trousers", augments={'Accuracy+24 Attack+24','Weapon skill damage +5%','Attack+3',}},
    feet="Lanun Bottes +3",
    neck="Commodore Charm +2",
    waist="Sailfi belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

	--for acc use head blistering sallet +1 r15, dominance earring +1 r15
    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body="Laksa. Frac +3",
    hands="Chasseur's Gants +3",
    legs={ name="Herculean Trousers", augments={'Accuracy+24 Attack+24','Weapon skill damage +5%','Attack+3',}},
    feet="Lanun Bottes +3",
    neck="Commodore Charm +2",
    waist="Sailfi belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
    head="Lanun Tricorne +3",
    body="Laksa. Frac +3",
    hands="Chasseur's Gants +3",
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+7 Rng.Atk.+7','Weapon skill damage +5%','Rng.Atk.+12',}},
    feet="Lanun Bottes +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}


    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
    head="Lanun Tricorne +3",
    body="Laksa. Frac +3",
    hands="Chasseur's Gants +3",
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+7 Rng.Atk.+7','Weapon skill damage +5%','Rng.Atk.+12',}},
    feet="Lanun Bottes +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    -- Hachirin-no-Obi
	sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
    head="Pixie Hairpin +1",
    body="Lanun Frac +3",
    hands="Chasseur's Gants +3",
	--hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +4%',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet="Lanun Bottes +3",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
} 

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
    head="Pixie Hairpin +1",
    body="Lanun Frac +3",
	hands="Chasseur's Gants +3",
    --hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +4%',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet="Lanun Bottes +3",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
} 

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+15','Weapon skill damage +5%','INT+6','"Mag.Atk.Bns."+6',}},
    body="Lanun Frac +3",
	hands="Chasseur's Gants +3",
    --hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +4%',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet="Lanun Bottes +3",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+15','Weapon skill damage +5%','INT+6','"Mag.Atk.Bns."+6',}},
    body="Lanun Frac +3",
	hands="Chasseur's Gants +3",
    --hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +4%',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet="Lanun Bottes +3",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.MAbullet,
	head={ name="Herculean Helm", augments={'Mag. Acc.+15','Weapon skill damage +5%','INT+6','"Mag.Atk.Bns."+6',}},
    body="Lanun Frac +3",
	hands="Chasseur's Gants +3",
    --hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +4%',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet="Lanun Bottes +3",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
        
    -- Specific spells

	--sets.midcast.Cure = {head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
		--body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        --back="Solemnity Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	--sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    --legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
	legs="Malignance Tights",
    --feet={ name="Adhe. Gamashes +1", augments={'HP+65','"Store TP"+7','"Snapshot"+10',}},
	feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
    head="Meghanada Visor +2",
    body="Mummu Jacket +2",
    hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    feet={ name="Adhe. Gamashes +1", augments={'HP+65','"Store TP"+7','"Snapshot"+10',}},
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
}
		
	sets.buff['Triple Shot'] = {
	body="Chasseur's Frac +3",
	hands="Lanun Gants +3",
	head="Oshosi Mask +1",
	legs="Osh. Trousers +1",
	feet="Osh. Leggings +1",
	back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
	head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Carmine Cuisses +1",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Mekosu. Harness",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Rawhide Trousers",feet=gear.herculean_dt_feet}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
	head="Meghanada Visor +2",
    body="Mekosu. Harness",
    hands="Meg. Gloves +2",
    legs="Carmine Cuisses +1",
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}

    sets.defense.MDT = {ammo=gear.RAbullet,
	head="Meghanada Visor +2",
    body="Mekosu. Harness",
    hands="Meg. Gloves +2",
    legs="Carmine Cuisses +1",
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
	head="Meghanada Visor +2",
    body="Mekosu. Harness",
    hands="Meg. Gloves +2",
    legs="Carmine Cuisses +1",
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}

    sets.Kiting = {legs="Carmine Cuisses +1",feet="Hermes' Sandals +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}

	-- Weapons sets
	--sets.weapons.Default = {main="Fettering Blade",sub="Nusku Shield",range="Fomalhaut"} -- Fettering Blade Nusku Shield
	--sets.weapons.DualWeapons = {main="Fettering Blade",sub="Blurred Knife +1",range="Death Penalty"} -- Folmalhaut, Blurred Knife +1 , main Fettering Blade
	--sets.weapons.RollMeleeWeapons = {main="Hep. Sapara +1",sub="Blurred Knife +1",range="Compensator"}
	--sets.weapons.RollRangedWeapons = {main="Fettering Blade",sub="Kustawi +1",range="Compensator"}
	sets.weapons.SavageWeapons = {main="Naegling",sub="Gleti's Knife",range="Ataktos"}
	sets.weapons.SavageWeapon = {main="Naegling",sub="Nusku Shield",range="Ataktos"}
	sets.weapons.AeolianWeapons = {main="Blurred Knife +1",sub="Hep. Rapier +1",range="Ataktos"}
	--sets.weapons.DualRangedWeapons = {main="Fettering Blade",sub="Kustawi +1"}
	sets.weapons.LeadenMelee = {main="Naegling",sub='Tauret',range="Death Penalty"}
	sets.weapons.LeadenMelee2 = {main={ name="Rostam", augments={'Path: B',}},sub='Tauret',range="Death Penalty"}
	--sets.weapons.Earp = {main="Naegling",sub="Gleti's Knife",range="Earp"}
	sets.weapons.LeadenRanged = {main={ name="Rostam", augments={'Path: A',}},sub='Tauret',range="Death Penalty"}
	sets.weapons.LastStand = {main={ name="Rostam", augments={'Path: A',}},sub="Nusku Shield",range="Fomalhaut"}
	--sets.weapons.RostamRanged = {main="Rostam",sub={name="Rostam", bag="Wardrobe 3"},range="Death Penalty"}
	
	--main={name="Rostam", bag="Wardrobe 2"},
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','STR+5','Accuracy+11','Attack+15',}},
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
    
    sets.engaged.Acc = {
	head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Vocane Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}

    sets.engaged.DW = {
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','STR+5','Accuracy+11','Attack+15',}},
    neck="Lissome Necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
    
    sets.engaged.DW.Acc = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Vocane Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}

	sets.engaged.DT = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Vocane Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}

	sets.engaged.DW.DT = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Vocane Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}

end

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

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 17)
    elseif player.sub_job == 'DNC' then
		set_macro_page(2, 17)
    elseif player.sub_job == 'RNG' then
        set_macro_page(2, 17)
    else
        set_macro_page(2, 17)
    end   


end

function sub_job_change(new,old)
send_command('wait 10;input /lockstyleset 17')
end

send_command('wait 10;input /lockstyleset 17')

-- function user_self_command(commandArgs, eventArgs)
	-- if commandArgs[1] == 'buff' then
	   -- send_command('input //roller roll')
       -- add_to_chat(158,'Rolling')
	-- elseif commandArgs[1] == 'rad' then
	   -- send_command('input /echo waiting; wait 4.5; input //temps buy radialens')
       -- add_to_chat(158,'Radialens')
	-- elseif commandArgs[1] == 'ewz' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew z')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew1' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 1')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew2' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 2')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew3' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 3')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew4' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 4')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew5' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 5')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew6' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 6')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew7' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 7')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew8' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 8')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew9' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 9')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew10' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 10')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew11' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 11')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew12' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 12')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew13' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 13')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew14' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 14')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew15' then
	   -- send_command('input /echo waiting; wait 4.5; input //ew 15')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'stop' then
        -- windower.ffxi.run(false)
        -- windower.ffxi.follow()
		-- add_to_chat(158,'Chillin')
	-- elseif commandArgs[1] == 'food' then
       -- send_command('input /item "Sublime Sushi +1" <me>')
       -- add_to_chat(158,'Eating')
	-- elseif commandArgs[1] == 'attackbt' then
		-- send_command('input /attack <bt>')
		-- add_to_chat(158,'Attack bt')
	-- elseif commandArgs[1] == 'charm' then
       -- send_command('input /item "Charm Buffer" <me>')
       -- add_to_chat(158,'Charm buffer')
	-- elseif commandArgs[1] == 'wing1' then
       -- send_command('input /item "Lucid Wings I" <me>')
       -- add_to_chat(158,'Lucid Wings I')
	-- elseif commandArgs[1] == 'wing2' then
       -- send_command('input /item "Lucid Wings II" <me>')
       -- add_to_chat(158,'Lucid Wings II')
	-- elseif commandArgs[1] == 'wing3' then
       -- send_command('input /item "Daedalus wing" <me>')
       -- add_to_chat(158,'Daedalus wing')
	-- elseif commandArgs[1] == 'super' then
       -- send_command('input /item "Super Revitalizer" <me>')
       -- add_to_chat(158,'Super Revitalizer')
	-- elseif commandArgs[1] == 'doom' then
       -- send_command('input /item "Savior\'s Tonic" <me>')
       -- add_to_chat(158,'Savior tonic')
	-- elseif commandArgs[1] == 'pois' then
       -- send_command('input /item "Poison Buffer" <me>')
       -- add_to_chat(158,'Poison Buffer')
	-- elseif commandArgs[1] == 'amne' then
       -- send_command('input /item "Moneta\'s Tonic"  <me>')
       -- add_to_chat(158,'Monetas Tonic')
	-- elseif commandArgs[1] == 'petri' then
       -- send_command('input /item "Mirror\'s Tonic" <me>')
       -- add_to_chat(158,'Mirrors Tonic')
	-- elseif commandArgs[1] == 'pote' then
       -- send_command('input /item "Champion\'s Drink" <me>')
       -- add_to_chat(158,'Champions Drink')
	-- end
-- end
