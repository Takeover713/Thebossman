-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder','Crit')
    state.HybridMode:options('Normal','Evasion','PDT')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Heishi','Naegling','LowBuff','MagicWeapons','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff','None')
	
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','SuppaBrutal','DWEarrings','DWMax'}
	
	gear.wsd_jse_back = {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.da_jse_back = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	
	autows = 'Blade: Shun'
	autowstp = 1250
	
	autofood = 'Sublime sushi +1'
	
	--send_command('bind !pageup ffo me')
	--send_command('bind !pagedown ffo stopall')
	send_command('bind ^` input /ja "Innin" <me>')
    send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind !@^` gs c cycle Stance')
	--send_command('bind !d send @all gs c buff')
	--send_command('bind !q send @brd //hordelullaby2 <t>')
	--send_command('bind !a sat alltarget')
	--send_command('bind ^d send rafleshia gs c oboss')
	--send_command('bind !s send @whm sacrosanctity')
	--send_command('bind !h send @whm hb on')
	--send_command('bind ^h send @geo hb on')
	--send_command('bind @h send @brd hb on')
	--send_command('bind !f send @others gs c attackbt')
	--send_command('bind ^q send @run gs c toggle Autotankmode')
	send_command('bind !z send @cor //leadensalute <t>')
	--send_command('bind !v send @geo //fullcircle')
	send_command('bind !x send @smn //thunderspark <t>')
	send_command('bind ![ send @geo //fira3 <t>')
	send_command('bind !] send @geo //Thundara3 <t>')
	send_command('bind @x send @smn //voltstrike <t>')
	send_command('bind ^x send @smn //apogee')
	--send_command('bind !t send @run gs c toggle Autotankmode')
	send_command('bind !/ send @run //vivaciouspulse')
	send_command('bind !b gs c buffup')
	send_command('bind !pause gs c toggle AutoBuffMode')

	--.4
	--.1
	utsusemi_cancel_delay = 0
	utsusemi_ni_cancel_delay = 0
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = { ammo="Sapience Orb",
    head="Ynglinga Sallet",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Mummu Kecks +2",
    feet={ name="Mochi. Kyahan +1", augments={'Reduces elem. ninjutsu III cast time',}},
    neck="Moonlight Necklace",
    waist="Goading Belt",
    left_ear="Cryptic Earring",
    right_ear="Pluto's Pearl",
    left_ring="Supershear Ring",
    right_ring="Provocare Ring",
    back="Reiki Cloak",
}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"} --legs="Mochizuki Hakama"
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail +1"} --legs="Mochizuki Chainmail"
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}

    sets.precast.Flourish1 = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Mekosu. Harness",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Hattori Hakama +1",feet=gear.herculean_acc_feet}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",
		head="Herculean Helm",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Kishar Ring",
		legs="Gyve Trousers",feet="Mochi. Kyahan +1"}
		
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",
	body="Mochi. Chainmail +1",
	feet="Hattori Kyahan +1"})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {ammo="Staunch Tathlum +1",
	ring1="Prolix Ring"})

    -- Snapshot for ranged
    sets.precast.RA = {legs="Nahtirah Trousers"}
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seeth. Bomblet +1",
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body={ name="Herculean Vest", augments={'Accuracy+7','Weapon skill damage +5%','STR+5','Attack+15',}},
    hands={ name="Herculean Gloves", augments={'Weapon skill damage +4%','STR+9','Accuracy+9','Attack+10',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+24 Attack+24','Weapon skill damage +5%','Attack+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+12','Weapon skill damage +5%','AGI+7','Attack+10',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Lugra Earring +1",
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {head="Dampening Tam","Ken. Samue",legs="Hiza. Hizayoroi +2",ear2="Telos Earring"})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {head="Ynglinga Sallet",neck="Combatant's Torque",ear2="Telos Earring",body="Ken. Samue",hands="Mummu Wrists +2",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ammo="Yamarang",head="Ynglinga Sallet",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",body="Mummu Jacket +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet})
	
	
	sets.precast.WS['Savage Blade'] = {ammo="Seeth. Bomblet +1",
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body={ name="Herculean Vest", augments={'Accuracy+7','Weapon skill damage +5%','STR+5','Attack+15',}},
    hands={ name="Herculean Gloves", augments={'Weapon skill damage +4%','STR+9','Accuracy+9','Attack+10',}},
    legs={ name="Mochi. Hakama +1", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +5%','STR+4','Mag. Acc.+5','"Mag.Atk.Bns."+7',}},
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
	
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {ammo="Yetshila +1",
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body="Ken. Samue +1",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet="Mummu Gamash. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},})
	
    sets.precast.WS['Blade: Jin'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Mummu Bonnet +2",ammo="Yetshila +1",head="Mummu Bonnet +2",body="Abnoba Kaftan",hands="Ryuo Tekko",waist="Grunfeld Rope",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Jin'].Acc = set_combine(sets.precast.WS.Acc, {head="Mummu Bonnet +2",body="Sayadio's Kaftan",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Jin'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Jin'].Fodder = set_combine(sets.precast.WS['Blade: Jin'], {head="Adhemar Bonnet +1"})
	
	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {    ammo="Yetshila +1",
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body="Ken. Samue +1",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet="Mummu Gamash. +2",
    neck="Fotia Gorget",
    waist="Svelt. Gouriz +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Mummu Ring",
    back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}},})
    sets.precast.WS['Blade: Hi'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila +1",head="Mummu Bonnet +2",ear1="Moonshade Earring",ear2="Trux Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring1="Begrudging Ring",back=gear.wsd_jse_back,legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS.Acc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",ear2="Telos Earring",body="Sayadio's Kaftan",hands="Ryuo Tekko",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Hi'].FullAcc = set_combine(sets.precast.WS.FullAcc, {hands="Ryuo Tekko",legs="Hiza. Hizayoroi +2"})
    sets.precast.WS['Blade: Hi'].Fodder = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {    ammo="Jukukik Feather",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands="Ken. Tekko +1",
    legs="Jokushu Haidate",
    feet="Ken. Sune-Ate +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Lugra Earring",
    right_ear="Lugra Earring +1",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},})
    sets.precast.WS['Blade: Shun'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ear1="Lugra Earring",ear2="Lugra Earring +1",legs="Jokushu Haidate",feet=gear.herculean_acc_feet})
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Shun'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Shun'].Fodder = set_combine(sets.precast.WS['Blade: Shun'], {})

    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {    ammo="Seeth. Bomblet +1",
    head={ name="Herculean Helm", augments={'Accuracy+3','Weapon skill damage +4%','STR+7',}},
    body={ name="Herculean Vest", augments={'Accuracy+7','Weapon skill damage +5%','STR+5','Attack+15',}},
    hands={ name="Herculean Gloves", augments={'Weapon skill damage +4%','STR+9','Accuracy+9','Attack+10',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+24 Attack+24','Weapon skill damage +5%','Attack+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+12','Weapon skill damage +5%','AGI+7','Attack+10',}},
    neck="Fotia Gorget",
    waist="Grunfeld Ropez",
    left_ear="Moonshade Earring",
    right_ear="Lugra Earring +1",
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
})
    sets.precast.WS['Blade: Ten'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS.Acc, {back=gear.wsd_jse_back})
    sets.precast.WS['Blade: Ten'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Ten'].Fodder = set_combine(sets.precast.WS['Blade: Ten'], {})
	
    sets.precast.WS['Aeolian Edge'] = {   ammo="Seeth. Bomblet +1",
    head="Mochi. Hatsuburi +1",
    neck="Baetyl Pendant",
    ear1="Hecate's Earring",
    ear2="Friomisi Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    ring1="Shiva Ring +1",
    ring2="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    waist="Eschan Stone",
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +5%','STR+4','Mag. Acc.+5','"Mag.Atk.Bns."+7',}},}
		
	sets.precast.WS['Blade: Teki'] = {    head="Mochi. Hatsuburi +1",
    neck="Fotia Gorget",
    ear1="Moonshade Earring",
    ear2="Friomisi Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    ring1="Regal Ring",
    ring2="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    waist="Fotia Belt",
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +5%','STR+4','Mag. Acc.+5','"Mag.Atk.Bns."+7',}},}
	
	sets.precast.WS['Blade: Teki'].SomeAcc = {}
	sets.precast.WS['Blade: Teki'].Acc = {}
	sets.precast.WS['Blade: Teki'].FullAcc = {}
	sets.precast.WS['Blade: Teki'].Fodder = {}
	
	sets.precast.WS['Blade: Chi'] = {    head="Mochi. Hatsuburi +1",
    neck="Fotia Gorget",
    ear1="Moonshade Earring",
    ear2="Friomisi Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    ring1="Regal Ring",
    ring2="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    waist="Fotia Belt",
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +5%','STR+4','Mag. Acc.+5','"Mag.Atk.Bns."+7',}},}
	sets.precast.WS['Blade: Chi'].SomeAcc = {}
	sets.precast.WS['Blade: Chi'].Acc = {}
	sets.precast.WS['Blade: Chi'].FullAcc = {}
	sets.precast.WS['Blade: Chi'].Fodder = {}

	sets.precast.WS['Blade: To'] = {head="Mochi. Hatsuburi +1",
    neck="Fotia Gorget",
    ear1="Moonshade Earring",
    ear2="Friomisi Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    ring1="Regal Ring",
    ring2="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    waist="Fotia Belt",
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +5%','STR+4','Mag. Acc.+5','"Mag.Atk.Bns."+7',}},}
	sets.precast.WS['Blade: To'].SomeAcc = {}
	sets.precast.WS['Blade: To'].Acc = {}
	sets.precast.WS['Blade: To'].FullAcc = {}
	sets.precast.WS['Blade: To'].Fodder = {}

	sets.precast.WS['Blade: Yu'] = {    ammo="Seeth. Bomblet +1",
    head="Mochi. Hatsuburi +1",
    neck="Baetyl Pendant",
    ear1="Hecate's Earring",
    ear2="Friomisi Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    ring1="Shiva Ring +1",
    ring2="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    waist="Eschan Stone",
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +5%','STR+4','Mag. Acc.+5','"Mag.Atk.Bns."+7',}},}
	sets.precast.WS['Blade: Yu'].SomeAcc = {}
	sets.precast.WS['Blade: Yu'].Acc = {}
	sets.precast.WS['Blade: Yu'].FullAcc = {}
	sets.precast.WS['Blade: Yu'].Fodder = {}
	
	sets.precast.WS['Blade: Ei'] = {    ammo="Seeth. Bomblet +1",
    head="Mochi. Hatsuburi +1",
    neck="Baetyl Pendant",
    ear1="Hecate's Earring",
    ear2="Friomisi Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    ring1="Shiva Ring +1",
    ring2="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    waist="Eschan Stone",
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +5%','INT+8',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +5%','STR+4','Mag. Acc.+5','"Mag.Atk.Bns."+7',}},}	
	sets.precast.WS['Blade: Ei'].SomeAcc = {}
	sets.precast.WS['Blade: Ei'].Acc = {}
	sets.precast.WS['Blade: Ei'].FullAcc = {}
	sets.precast.WS['Blade: Ei'].Fodder = {}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring",ear2="Lugra Earring +1",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring",}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Dread Jupon",hands="Mochizuki Tekko +1",ring1="Defending Ring",ring2="Kishar Ring",
        legs="Rawhide Trousers",feet=gear.herculean_acc_feet}

    sets.midcast.ElementalNinjutsu = {ammo="Seething Bomblet +1",
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Dbl.Atk."+1','MND+7','"Mag.Atk.Bns."+15',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+11','"Mag.Atk.Bns."+10','"Fast Cast"+3',}},
    hands="Hattori Tekko +1",
    legs="Gyve trousers",
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','STR+5','Accuracy+11','Attack+15',}},
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Shiva Ring +1",
    back="Toro Cape",
}
		
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	
	sets.MagicBurst = {ring1="Mujin Band",ring2="Locus Ring"}
	
	sets.element.Earth = {neck="Quanpur Necklace"}

    sets.midcast.NinjutsuDebuff = {    ammo="Yamarang",
    head="Hachi. Hatsu. +1",
    neck="Sanctity Necklace",
    ear1="Gwati Earring",
    ear2="Digni. Earring",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back="Andartia's Mantle",
    waist="Eschan Stone",
    legs="Mummu Kecks +2",
    feet="Hachiya Kyahan +1"}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    sets.midcast.RA = {
        head="Dampening Tam",neck="Combatant's Torque",ear1="Clearview Earring",
        body="Mekosu. Harness",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Chaac Belt",legs="Nahtirah Trousers",feet="Mummu Gamash. +2"}
		
    sets.midcast.RA.Acc = {
        head="Dampening Tam",neck="Combatant's Torque",ear1="Clearview Earring",
        body="Mekosu. Harness",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Chaac Belt",legs="Nahtirah Trousers",feet="Mummu Gamash. +2"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {    ammo="Staunch Tathlum +1",
    head="Ynglinga Sallet",
    body="Ken. Samue +1",
    hands="Kurys Gloves",
    legs="Mummu Kecks +2",
    feet="Amm Greaves",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}

    sets.idle.PDT = {    ammo="Staunch Tathlum +1",
    head="Ynglinga Sallet",
    body="Ken. Samue +1",
    hands="Kurys Gloves",
    legs="Mummu Kecks +2",
    feet="Amm Greaves",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
		
    sets.idle.Weak = {    ammo="Seki Shuriken",
    head="Ynglinga Sallet",
    body="Ken. Samue +1",
    hands="Kurys Gloves",
    legs="Mummu Kecks +2",
    feet="Amm Greaves",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}
    
    -- Defense sets
    sets.defense.Evasion = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Apate Ring",
        back="Andartia's Mantle",waist="Shetal Stone",legs="Nahtirah Trousers",feet=gear.herculean_dt_feet}

    sets.defense.PDT = {    ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands="Ken. Tekko +1",
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Moonbeam Nodowa",
    waist="Reiki Yotai",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back="Moonbeam Cape",
}

    sets.defense.MDT = {    ammo="Staunch Tathlum +1",
    head="Ynglinga Sallet",
    body="Ken. Samue +1",
    hands="Kurys Gloves",
    legs="Mummu Kecks +2",
    feet={ name="Amm Greaves", augments={'HP+25','VIT+6','Accuracy+10',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}
		
	sets.defense.MEVA = {        ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands="Ken. Tekko +1",
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {feet="Hachiya Kyahan +1"}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Date Shuriken",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','STR+5','Accuracy+11','Attack+15',}},
    neck="Moonbeam Nodowa",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
}
    sets.engaged.SomeAcc = {}
    sets.engaged.Acc = {}
    sets.engaged.FullAcc = {}
    sets.engaged.Fodder = {}
    sets.engaged.Crit = {ammo="Togakushi Shuriken",
        head="Mummu Bonnet +2",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
    sets.engaged.Evasion = {}
	sets.engaged.SomeAcc.Evasion = {}
    sets.engaged.Acc.Evasion = {}
    sets.engaged.FullAcc.Evasion = {}
    sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
		
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Hattori Ningi +1"} --body="Hattori Ningi +1"
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Yonin = {legs="Hattori Hakama +1"} --
    sets.buff.Innin = {} --head="Hattori Zukin +1"
	sets.buff.Futae = {}
	
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Shetal Stone"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {legs="Ryuo Hakama"}
	
	-- Weapons sets
	sets.weapons.Heishi = {main="Heishi Shorinken",sub="Kunimitsu"}
	sets.weapons.Naegling = {main="Naegling",sub="Kunimitsu"}
	sets.weapons.LowBuff = {main="Heishi Shorinken",sub="Blurred Knife +1"}
	sets.weapons.ProcDagger = {main="Qutrub Knife",sub=empty}
	sets.weapons.ProcSword = {main="Blizzard Brand",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Lost Sickle",sub=empty}
	sets.weapons.ProcPolearm = {main="Iapetus",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Ark Tachi",sub=empty}
	sets.weapons.ProcKatana = {main="Kunai",sub="Kunai"}
	sets.weapons.ProcClub = {main="Lady Bell",sub=empty}
	sets.weapons.ProcStaff = {main="Chantoyant Staff",sub=empty}
	sets.weapons.MagicWeapons = {main="Ochu",sub="Ochu"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 13)
    else
        set_macro_page(1, 13)
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

-- function user_self_command(commandArgs, eventArgs)
	-- if commandArgs[1] == 'rad' then
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
	-- elseif commandArgs[1] == 'amne' then
       -- send_command('input /item "Moneta\'s Tonic"  <me>')
       -- add_to_chat(158,'Monetas Tonic')
	-- elseif commandArgs[1] == 'pois' then
       -- send_command('input /item "Poison Buffer" <me>')
       -- add_to_chat(158,'Poison Buffer')
	-- elseif commandArgs[1] == 'petri' then
       -- send_command('input /item "Mirror\'s Tonic" <me>')
       -- add_to_chat(158,'Mirrors Tonic')
	-- elseif commandArgs[1] == 'pote' then
       -- send_command('input /item "Champion\'s Drink" <me>')
       -- add_to_chat(158,'Champions Drink')
	-- end
-- end