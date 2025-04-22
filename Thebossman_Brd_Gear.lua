function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','DualDaggers','SavageDW','CarnDW','Carn','Savage','Club','Proc')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Terpander/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    --send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	--send_command('bind @` gs c cycle MagicBurstMode')
	--send_command('bind @f10 gs c cycle RecoverMode')
	--send_command('bind @f8 gs c toggle AutoNukeMode')
	--send_command('bind !q gs c weapons NukeWeapons;gs c update')
	--send_command('bind ^q gs c weapons Swords;gs c update')
	--send_command('bind !d send @all gs c buff')
	--send_command('bind !q send @brd //hordelullaby2 <bt>')
	--send_command('bind !a sat alltarget')
	--send_command('bind ^d send rafleshia gs c oboss')
	--send_command('bind !s send @whm sacrosanctity')
	--send_command('bind !f send @geo fullcircle ')
	
	send_command('exec init.txt')
	
	autows = 'Savage Blade'
	autowstp = 1250


	select_default_macro_book(8, 6)
	
end

--Priority upgrades for song buffs: Fili head, body, hands, for midcast songs

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.SavageDW = {main="Naegling",sub="Centovente"}
	sets.weapons.DualDaggers = {main="Aeneas",sub="Tauret"}
	sets.weapons.CarnDW = {main="Carnwenhan",sub="Tauret"}
	sets.weapons.Proc = {main="Blizzard Brand",sub="Qutrub Knife"}
	--sets.weapons.DualSword = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.Carn = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.Savage = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.Club = {main="Daybreak",sub="Genmei Shield"}
	
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {    
	--main="Oranyan",
	--sub="Achaq Grip",
	range={ name="Linos", augments={'Mag. Evasion+12','"Fast Cast"+6','INT+6 MND+6',}},
    head="Fili Calot +1",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Kaykaus Tights +1",
    feet="Fili Cothurnes +1",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
	head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.BardSong = {    
	main="Carnwenhan",
    sub="Genmei Shield",
	range={ name="Linos", augments={'Mag. Evasion+12','"Fast Cast"+6','INT+6 MND+6',}},
    head="Fili Calot +1",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Kaykaus Tights +1",
    feet="Fili Cothurnes +1",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps. +1"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
    range={ name="Linos", augments={'Accuracy+10 Attack+10','Weapon skill damage +3%','STR+6 DEX+6',}},
    head="Nyame Helm",
	body="Bihu Jstcorps. +3",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck="Bard's Charm +2",
	waist="Sailfi Belt +1",
	left_ear="Ishvara Earring",
	right_ear="Moonshade Earring",
	left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	sets.precast.WS['Savage Blade'] = {
	range={ name="Linos", augments={'Accuracy+10 Attack+10','Weapon skill damage +3%','STR+6 DEX+6',}},
    head="Nyame Helm",
	body="Bihu Jstcorps. +3",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck="Bard's Charm +2",
	waist="Sailfi Belt +1",
	left_ear="Ishvara Earring",
	right_ear="Moonshade Earring",
	left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

	sets.precast.WS['Mordant Rime'] = {
	range={ name="Linos", augments={'Accuracy+10 Attack+10','Weapon skill damage +3%','STR+6 DEX+6',}},
    head="Nyame Helm",
    body="Bihu Jstcorps. +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Bard's Charm +2",
    waist="Kentarch Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Ilabrat ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%',}},
}

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {    
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
	sets.midcast.Lullaby = {    
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +1",
    hands="Brioso Cuffs +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Musical Earring",
    right_ear="Aoidos' Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
	sets.midcast['Horde Lullaby'] = {
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +1",
    hands="Brioso Cuffs +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Musical Earring",
    right_ear="Aoidos' Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
	sets.midcast['Horde Lullaby'].Resistant = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby'].AoE = {
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +1",
    hands="Brioso Cuffs +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Musical Earring",
    right_ear="Aoidos' Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
	sets.midcast['Horde Lullaby II'] = {
	main="Carnwenhan",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +1",
    hands="Brioso Cuffs +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Musical Earring",
    right_ear="Aoidos' Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Gjallarhorn"}
	
	sets.midcast['Horde Lullaby II'].AoE = {
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +1",
    hands="Brioso Cuffs +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Musical Earring",
    right_ear="Aoidos' Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
	sets.midcast.Madrigal = {    
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
	sets.midcast.Paeon = {range="Daurdabla",
		head={ name="Nyame Helm", augments={'Path: B',}},body="Volte Doublet",hands="Shrieker's Cuffs",legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Nyame Sollerets",neck="Bathy choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del luna +1",left_ring="Defending Ring",
		right_ring="Moonlight Ring",back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},}
	sets.midcast['Fowl Aubade'] = {range="Daurdabla",
		head={ name="Nyame Helm", augments={'Path: B',}},body="Volte Doublet",hands="Shrieker's Cuffs",legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Nyame Sollerets",neck="Bathy choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del luna +1",left_ring="Defending Ring",
		right_ring="Moonlight Ring",back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},}
	sets.midcast['Herb Pastoral'] = {range="Daurdabla",
		head={ name="Nyame Helm", augments={'Path: B',}},body="Volte Doublet",hands="Shrieker's Cuffs",legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Nyame Sollerets",neck="Bathy choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del luna +1",left_ring="Defending Ring",
		right_ring="Moonlight Ring",back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},}
	sets.midcast['Shining Fantasia'] = {range="Daurdabla",
		head={ name="Nyame Helm", augments={'Path: B',}},body="Volte Doublet",hands="Shrieker's Cuffs",legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Nyame Sollerets",neck="Bathy choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del luna +1",left_ring="Defending Ring",
		right_ring="Moonlight Ring",back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},}
	sets.midcast['Scop\'s Operetta'] = {range="Daurdabla",
		head={ name="Nyame Helm", augments={'Path: B',}},body="Volte Doublet",hands="Shrieker's Cuffs",legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Nyame Sollerets",neck="Bathy choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del luna +1",left_ring="Defending Ring",
		right_ring="Moonlight Ring",back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},}
	sets.midcast['Warding Round'] = {range="Daurdabla",
		head={ name="Nyame Helm", augments={'Path: B',}},body="Volte Doublet",hands="Shrieker's Cuffs",legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Nyame Sollerets",neck="Bathy choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del luna +1",left_ring="Defending Ring",
		right_ring="Moonlight Ring",back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},}
	

	sets.midcast.March = {    
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	
	sets.midcast.Minuet = {    
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
	
	sets.midcast.Minne = {
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Mou. Seraweels +1",
    feet="Brioso Slippers +2",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Etiolation Earring",
    right_ear="Arete del Luna +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}

	sets.midcast.Carol = {
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
	
	sets.midcast["Sentinel's Scherzo"] = {    
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Fili Cothurnes +1",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
} --feet="Fili Cothurnes +1" Brioso Slippers still provides more Duration

	sets.midcast['Magic Finale'] = {    
	main="Carnwenhan",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +1",
    hands="Brioso Cuffs +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Musical Earring",
    right_ear="Aoidos' Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
	sets.midcast.Mazurka = {    
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}

sets.midcast.Etude = {
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Mousai Turban +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}

sets.midcast.Prelude = {
	main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Minstrel's Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
	
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {    
	main="Carnwenhan",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Porous Rope",
    left_ear="Musical Earring",
    right_ear="Aoidos' Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {    
	main="Carnwenhan",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Fili Rhingrave +1",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Dignitary's Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {    
	main="Carnwenhan",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Fili Rhingrave +1",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Dignitary's Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	
	sets.midcast.Cure = {    
    main="Grioavolr",
    sub="Giuoco Grip",
    ammo="Pemphredo Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Reti Pendant",
    waist="Luminary Sash",
    left_ear="Calamitous Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Solemnity Cape",
}
	
	-- sets.midcast.Cure = {    
    -- main="Daybreak",
    -- sub="Ammurapi Shield",
    -- range="Marsyas",
    -- head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    -- body="Inyanga Jubbah +2",
    -- hands="Inyan. Dastanas +2",
    -- legs="Chironic Hose",
    -- feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    -- neck="Colossus's Torque",
    -- waist="Luminary Sash",
    -- left_ear="Calamitous Earring",
    -- right_ear="Magnetic Earring",
    -- left_ring="Defending Ring",
    -- right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    -- back="Solemnity Cape",
-- }
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {    
	main="Daybreak",
    sub="Ammurapi Shield",
    range="Marsyas",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    waist="Olympus Sash",
    right_ear="Magnetic Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {		
		main="Pukulatmuj +1",
		--ammo="Oreiad's Tathlum",
		head="Inyanga Tiara +2",
		body="Chironic Doublet",
		hands="Telchine Gloves",
		legs="Shedir Seraweels",
		feet="Inyan. Crackows +1",
		neck="Colossus's Torque",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
		right_ear="Magnetic Earring",
		left_ring="Omega Ring",
		right_ring="Aqua Ring",
		back="Aslan Cape"})
		
	sets.midcast['Elemental Magic'] = {}
		
	sets.midcast['Elemental Magic'].Resistant = {}
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {		
		hands="Inyan. Dastanas +2",
		legs="Marduk's Shalwar",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Malison Medallion",
		waist="Bishop's Sash",
		left_ear="Beatific Earring",
		left_ring="Ephedra Ring",
		right_ring="Ephedra Ring",
		back="Tempered Cape +1"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	--sets.resting = {}
	
	sets.idle = {    
    main="Carnwenhan",
    sub="Genmei Shield",
	range={ name="Linos", augments={'Mag. Evasion+12','"Fast Cast"+6','INT+6 MND+6',}},
    head="Null Masque",
    body="Volte Doublet",
    hands="Shrieker's Cuffs",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck="Bathy choker +1",
    waist="Null Belt",
    left_ear="Eabani Earring",
    right_ear="Arete del luna +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}

	sets.idle.PDT = {    
    main="Carnwenhan",
    sub="Genmei Shield",
    range={ name="Linos", augments={'Mag. Evasion+12','"Fast Cast"+6','INT+6 MND+6',}},
    head="Null Masque",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Shrieker's Cuffs",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}

	-- Defense sets

	sets.defense.PDT = {
    main="Carnwenhan",
    sub="Genmei Shield",
    range={ name="Linos", augments={'Mag. Evasion+12','"Fast Cast"+6','INT+6 MND+6',}},
    head="Null Masque",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Shrieker's Cuffs",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}

	sets.defense.MDT = {
    main="Carnwenhan",
    sub="Genmei Shield",
    range={ name="Linos", augments={'Mag. Evasion+12','"Fast Cast"+6','INT+6 MND+6',}},
    head="Null Masque",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Shrieker's Cuffs",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Etiolation Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}

	sets.Kiting = {feet="Fili Cothurnes +1"}

	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	sets.IceNuke = {main="Ngqoqwanb"}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
		range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Telchine Pigaches", augments={'Accuracy+16','"Store TP"+4','DEX+8',}},
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		}
	
	-- sets.engaged = {
    -- main={ name="Carnwenhan", augments={'Path: A',}},
    -- sub="Genmei Shield",
    -- range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    -- head="Aya. Zucchetto +2",
    -- body="Ayanmo Corazza +2",
    -- hands="Bunzi's Gloves",
    -- legs="Nyame Flanchard",
    -- feet="Nyame Sollerets",
    -- neck={ name="Lissome Necklace", augments={'Path: A',}},
    -- waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    -- left_ear="Telos Earring",
    -- right_ear="Cessance Earring",
    -- left_ring="Chirich Ring +1",
    -- right_ring="Petrov Ring",
    -- back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
-- }

	sets.engaged.Acc = {
		range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
		head="Aya. Zucchetto +2",
		neck="Bard's Charm +2",
		ear1="Digni. Earring",
		ear2="Telos Earring",
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		ring1="Ramuh Ring +1",
		ring2="Ilabrat Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Olseni Belt",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Telchine Pigaches", augments={'Accuracy+16','"Store TP"+4','DEX+8',}},
}
	
	sets.engaged.DW = {
		range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Telchine Pigaches", augments={'Accuracy+16','"Store TP"+4','DEX+8',}},
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

	sets.engaged.DW.Acc = {}
end

 --Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 4)
end

function sub_job_change(new,old)
send_command('wait 5;input /lockstyleset 1')
end

send_command('wait 5;input /lockstyleset 1')