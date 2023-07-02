function user_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Tank','DDTank','BreathTank','Dawn','NoShellTank','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT','PDT_HP','Tank')
    state.MagicalDefenseMode:options('BDT','MDT_HP','AegisMDT','AegisNoShellMDT','OchainMDT','OchainNoShellMDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm')
	state.IdleMode:options('Normal','Tank','KiteTank','PDT','MDT','Refresh','Reraise')
	state.Weapons:options('BurtgangOchain','BurtgangAegis')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}
	
	gear.fastcast_jse_back = {name="Rudianos's Mantle",augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
	gear.enmity_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10',}}

	-- Additional local binds
	--send_command('bind !pageup ffo me')
	--send_command('bind !pagedown ffo stopall')
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !pause gs c toggle AutoBuffMode')
	send_command('bind !s send @whm sacrosanctity')
	-- send_command('bind !h send @whm hb on')
	-- send_command('bind ^h send @geo hb on')
	-- send_command('bind @h send @brd hb on')
	--send_command('bind !d send @all gs c buff')
	send_command('bind !q send @brd //hordelullaby2 <t>')
	send_command('bind !a sat alltarget')
	--send_command('bind ^d send rafleshia gs c oboss')
	--send_command('bind !f send @others gs c attackbt')
	--send_command('bind ^q send @run gs c toggle Autotankmode')
	
	autows = 'Atonement'
	autowstp = 1500
	
	autofood = 'Miso Ramen +1'
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = { 
	ammo={name="Sapience Orb", priority=0},
    head="Souveran Schaller +1",
    body={name="Sakpata's Plate", priority=136},
    hands={name="Souveran Handschuhs +1", priority=25},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Unmoving Collar +1", priority=200},
    waist={name="Creed Baudrier", priority=0},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Eihwaz Ring", priority=70},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}, priority=60},
	}

--    sets.Enmity = { ammo="Paeapua",
--    head="Souveran Schaller +1",
--    body="Souveran cuirass +1",
--    hands="Souveran Handschuhs +1",
--    legs="Souveran Diechlings +1",
--    feet="Souveran Schuhs +1",
--    neck="Moonlight Necklace",
--    waist="Creed Baudrier",
 --   left_ear="Cryptic Earring",
--    right_ear="Pluto's Pearl",
 --   left_ring="Apeile Ring",
 --   right_ring="Apeile Ring +1",
--    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},}
		
    sets.Enmity.SIRD = {
	ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=280},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=171},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=239},
    legs={ name="Founder's Hose", priority=54},
    feet={ name="Odyssean Greaves", priority=20},
    neck={ name="Moonlight Necklace", priority=0},
    waist={name="Rumination sash", priority=40},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Eihwaz Ring", priority=70},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}, priority=60},
		}
		
    sets.Enmity.DT = {
	ammo={name="Sapience Orb", priority=0},
    head="Souveran Schaller +1",
    body={name="Sakpata's Plate", priority=136},
    hands={name="Souveran Handschuhs +1", priority=25},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Unmoving Collar +1", priority=200},
    waist={name="Creed Baudrier", priority=0},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Eihwaz Ring", priority=70},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}, priority=60},
		}
		
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
		head="Sulevia's Mask +2",
		neck="Phalaina Locket",
		ear1="Nourish. Earring",
		ear2="Nourish. Earring +1",
		body="Rev. Surcoat +3",
		hands="Cab. Gauntlets +1",
		ring1="Stikini Ring",
		ring2="Rufescent Ring",
		back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
		waist="Luminary Sash",
		legs="Carmine Cuisses +1",
		feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Carmine Mask +1",
		body="Rev. Surcoat +3",ring1="Asklepian Ring",ring2="Valseur's Ring",
		waist="Chaac Belt",legs="Sulev. Cuisses +2"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {ammo="Ginsen",
        head="Founder's Corona",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Tartarus Platemail",hands="Leyline Gloves",ring1="Ramuh Ring +1",ring2="Patricius Ring",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"}
		
	sets.precast.JA['Violent Flourish'] = {ammo="Ginsen",
        head="Founder's Corona",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Found. Breastplate",hands="Leyline Gloves",ring1="Defending Ring",ring2="Stikini Ring",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {    
	ammo={name="Sapience Orb", priority=0},
    head={ name="Carmine Mask +1", priority=38},
    body={name="Rev. Surcoat +3", priority=244},
    hands={ name="Leyline Gloves", priority=25},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={ name="Odyssean Greaves", priority=20},
    neck={ name="Unmoving Collar +1", priority=200},
    waist={name="Creed Baudrier", priority=40},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Kishar Ring", priority=0},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}, priority=60},
}

--	ammo="Sapience Orb",
  --  head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    --body="Rev. Surcoat +3",
   -- hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
   -- legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
   -- feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+11',}},
   -- neck="Voltsurge Torque",
   -- waist="Creed Baudrier",
   -- left_ear="Loquac. Earring",
   -- right_ear="Odnowa Earring +1",
   -- left_ring="Prolix Ring",
   -- right_ring="Kishar Ring",
   -- back="Moonbeam Cape",

		
    sets.precast.FC.DT = {
	ammo={name="Sapience Orb", priority=0},
    head={ name="Carmine Mask +1", priority=38},
    body={name="Rev. Surcoat +3", priority=244},
    hands={ name="Leyline Gloves", priority=25},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={ name="Odyssean Greaves", priority=20},
    neck={ name="Unmoving Collar +1", priority=200},
    waist={name="Creed Baudrier", priority=40},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Kishar Ring", priority=0},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}, priority=60},
		}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {neck="Diemer Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",body="Jumalik Mail"})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo="Paeapua",
    head="Ynglinga Sallet",
    body="Sulevia's Plate. +2",
    hands="Sulev. Gauntlets +2",
    legs="Sulevi. Cuisses +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Rajas Ring",
    right_ring="Ifrit Ring +1",
    back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
		
    sets.precast.WS.DT = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    sets.precast.WS.Acc = {ammo="Hasty Pinion +1",
        head="Ynglinga Sallet",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
        body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Zennaroi Earring",ear2="Moonshade Earring"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Zennaroi Earring",ear2="Moonshade Earring"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Zennaroi Earring",ear2="Telos Earring"})
	
	sets.precast.WS['Flat Blade'] = {ammo="Ginsen",
        head="Founder's Corona",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Leyline Gloves",ring1="Defending Ring",ring2="Stikini Ring",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"}

	sets.precast.WS['Flat Blade'].Acc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.precast.WS['Sanguine Blade'] = {ammo="Dosis Tathlum",
        head="Jumalik Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Jumalik Mail",hands="Founder's Gauntlets",ring1="Shiva Ring +1",ring2="Archon Ring",
        back="Toro Cape",waist="Fotia Belt",legs="Flamma Dirs +2",feet="Founder's Greaves"}

	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']

    sets.precast.WS['Atonement'] = {	ammo="Iron Gobbet",
    head="Loess barbuta +1",   					--Weapon skill damage 5/5% odyssean helm
    body="Souveran cuirass +1",                                                                   							 --Weapon skill damage +7%
    hands="Souveran handschuhs +1",		--Weapon skill damage 7/7%
    legs="Souveran diechlings +1",   --Weapon skill damage 5/5%    odyssean cuisses                                                          --Weapon skill damage +5%
    feet="Sulevia's Leggings +1",	-- sulevia's Leggings +1																					--Weapon skill damage 6/6%
    neck="Moonlight necklace",
    waist="Fotia Belt",
    left_ear="Cryptic Earring",
    right_ear="Moonshade earring",																					--Weapon skill damage 2%
    left_ring="Eihwaz Ring",
    right_ring="Apeile Ring +1",
    back="Moonbeam cape", -- Rudianos's Mantle with dex acc and attack +20 WS Damage +10%
}

    sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {
		--main="Vampirism",ammo="Paeapua",
   --     head="Chev. Armet +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
     --   body="Rev. Surcoat +3",hands="Leyline Gloves",ring1="Defending Ring",ring2="Kishar Ring",
   --     waist="Tempus Fugit",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"
		}
		
	sets.midcast.FastRecast.DT = {
	--main="Vampirism",ammo="Staunch Tathlum",
    --    head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
     --   body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
     --   back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"
		}

    sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {    
	ammo="Staunch Tathlum +1",
    head="Souveran Schaller +1",
    body="Souveran Cuirass +1",
    hands="Souveran Handschuhs +1",
    legs="Souveran Diechlings +1",
    feet="Souveran Schuhs +1",
    neck="Phalaina Locket",
	waist="Chuq'aba Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Moonlight Ring",
    back="Solemnity Cape"
}
		
    sets.midcast.Cure.SIRD = {
	ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", priority=280},
    body={ name="Souv. Cuirass +1", priority=171},
    hands={ name="Souveran Handschuhs +1", priority=89},
    legs={ name="Founder's Hose", priority=54},
    feet={ name="Odyssean Greaves", priority=20},
    neck={ name="Moonlight Necklace", priority=0},
    waist={name="Rumination sash", priority=40},
    left_ear={name="Nourish. Earring +1", priority=0},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Eihwaz Ring", priority=70},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Phys. dmg. taken-10%',}, priority=60},
		}
		
    sets.midcast.Cure.DT = {
	ammo="Staunch Tathlum +1",
    head="Souveran Schaller +1",
    body="Souveran Cuirass +1",
    hands="Souveran Handschuhs +1",
    legs="Souveran Diechlings +1",
    feet="Souveran Schuhs +1",
    neck="Phalaina Locket",
	waist="Chuq'aba Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Moonlight Ring",
    back="Solemnity Cape"
	}
		
    sets.midcast.Reprisal = {    ammo="Egoist's Tathlum",
    head="Souveran Schaller +1",
    body="Souveran cuirass +1",
    hands="Souveran Handschuhs +1",
    legs="Souveran Diechlings +1",
    feet="Souveran Schuhs +1",
    neck="Dualism Collar +1",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam cape"
}

	sets.Self_Healing = {    
	ammo="Staunch Tathlum +1",
    head="Souveran Schaller +1",
    body="Souveran Cuirass +1",
    hands="Souveran Handschuhs +1",
    legs="Souveran Diechlings +1",
    feet="Souveran Schuhs +1",
    neck="Phalaina Locket",
	waist="Chuq'aba Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Moonlight Ring",
    back="Solemnity Cape"
}
		
	sets.Self_Healing.SIRD = {
	ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", priority=280},
    body={ name="Souv. Cuirass +1", priority=171},
    hands={ name="Souveran Handschuhs +1", priority=89},
    legs={ name="Founder's Hose", priority=54},
    feet={ name="Odyssean Greaves", priority=20},
    neck={ name="Moonlight Necklace", priority=0},
    waist={name="Rumination sash", priority=40},
    left_ear={name="Nourish. Earring +1", priority=0},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Eihwaz Ring", priority=70},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Phys. dmg. taken-10%',}, priority=60},
	}
		
	sets.Self_Healing.DT = {
	ammo="Staunch Tathlum +1",
    head="Souveran Schaller +1",
    body="Souveran Cuirass +1",
    hands="Souveran Handschuhs +1",
    legs="Souveran Diechlings +1",
    feet="Souveran Schuhs +1",
    neck="Phalaina Locket",
	waist="Chuq'aba Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Moonlight Ring",
    back="Solemnity Cape"
		}

	sets.Cure_Received = {hands="Souv. Handsch. +1",feet="Souveran Schuhs +1"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {    
	ammo={name="Staunch Tathlum +1", priority=0},
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=280},
    body={name="Sakpata's Plate", priority=136},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=239},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={ name="Souveran Schuhs +1", priority=187},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=200},
    waist={name="Flume Belt +1", priority=0},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=70},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Weard Mantle", priority=0},
	}
	
--	sets.midcast['Enhancing Magic'] = {    ammo="Staunch Tathlum +1",
 --   head="Carmine Mask +1",
 --   legs="Souveran cuirass +1",
--    neck="Colossus's Torque",
--    waist="Olympus Sash",
 --   left_ear="Andoaa Earring",
 --   right_ear="Augment. Earring",
 --   left_ring="Evanescence Ring",
  --  right_ring="Stikini Ring",
 --   back="Merciful Cape"}

		
    sets.midcast['Enhancing Magic'].SIRD = {
	ammo={name="Staunch Tathlum +1", priority=0},
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=280},
    body={name="Sakpata's Plate", priority=136},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=239},
    legs={name="Founder's Hose", priority=114},
    feet={ name="Odyssean Greaves", priority=187},
    neck={ name="Moonlight Necklace", priority=200},
    waist={name="Rumination sash", priority=0},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=70},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Weard Mantle", priority=0},
		}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
--	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {    ammo="Staunch Tathlum +1",
--    head="Odyssean Helm",
--    body="Shab. Cuirass +1",
--    hands="Souveran Handschuhs +1",
--    legs="Rev. Breeches +1",
--    feet="Souveran Schuhs +1",
--    neck="Colossus's Torque",
--    waist="Olympus Sash",
--    left_ear="Halasz Earring",
--    right_ear="Andoaa Earring",
--    left_ring="Stikini Ring",
--    right_ring="Stikini Ring",
 --   back="Weard Mantle"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {    
	ammo={name="Staunch Tathlum +1", priority=0},
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=280},
    body={name="Sakpata's Plate", priority=136},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=239},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={ name="Souveran Schuhs +1", priority=187},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=200},
    waist={name="Flume Belt +1", priority=0},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=70},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Weard Mantle", priority=0},})
	
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {main="Deacon Sword",hands="Souv. Handsch. +1",back="Weard Mantle",feet="Souveran Schuhs +1"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {    
	ammo={name="Staunch Tathlum +1", priority=0},
    head={name="Sakpata's Helm", priority=91},
    body={name="Sakpata's Plate", priority=136},
    hands={name="Sakpata's Gauntlets", priority=91},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Loricate torque +1", priority=200},
    waist={name="Flume belt +1", priority=20},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=110},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Moonbeam cape", priority=60},
}

    -- Idle sets
	--ammo="Staunch Tathlum +1",head="Souveran Schaller +1",body="Souveran cuirass +1",hands="Souveran Handschuhs +1",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1",neck="Loricate Torque +1",waist="Flume Belt +1",left_ear="Odnowa Earring",right_ear="Odnowa Earring +1",left_ring="Vocane Ring",right_ring="Defending Ring",back="Moonbeam cape",
    sets.idle = {
	ammo={name="Staunch Tathlum +1", priority=0},
    head={name="Sakpata's Helm", priority=91},
    body={name="Sakpata's Plate", priority=136},
    hands={name="Sakpata's Gauntlets", priority=91},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Loricate torque +1", priority=200},
    waist={name="Flume belt +1", priority=20},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=110},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Moonbeam cape", priority=60},
	}
		
    sets.idle.PDT = {    
	ammo={name="Staunch Tathlum +1", priority=0},
    head={name="Sakpata's Helm", priority=91},
    body={name="Sakpata's Plate", priority=136},
    hands={name="Sakpata's Gauntlets", priority=91},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Loricate torque +1", priority=200},
    waist={name="Carrier's Sash", priority=20},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=110},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Moonbeam cape", priority=60},
}
		
    sets.idle.MDT = {    
	ammo={name="Staunch Tathlum +1", priority=0},
    head={name="Sakpata's Helm", priority=91},
    body={name="Sakpata's Plate", priority=136},
    hands={name="Sakpata's Gauntlets", priority=91},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Loricate torque +1", priority=200},
    waist={name="Flume belt +1", priority=20},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=110},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Moonbeam cape", priority=60},
}
		
	sets.idle.Refresh = {main="Mafic Cudgel",sub="Ochain",ammo="Homiliary",
		head="Jumalik Helm",neck="Coatl Gorget +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume belt +1",legs="Souv. Diechlings +1",feet="Cab. Leggings +1"}

	sets.idle.Tank = {
	ammo={name="Staunch Tathlum +1", priority=0},
    head={name="Sakpata's Helm", priority=91},
    body={name="Sakpata's Plate", priority=136},
    hands={name="Sakpata's Gauntlets", priority=91},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Loricate torque +1", priority=200},
    waist={name="Flume belt +1", priority=20},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=110},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Moonbeam cape", priority=60},
	}
		
	sets.idle.KiteTank = {
	ammo={name="Staunch Tathlum +1", priority=0},
    head={name="Sakpata's Helm", priority=91},
    body={name="Sakpata's Plate", priority=136},
    hands={name="Sakpata's Gauntlets", priority=91},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Loricate torque +1", priority=200},
    waist={name="Flume belt +1", priority=20},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=110},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Moonbeam cape", priority=60},
	}
		
    sets.idle.Reraise = {
	ammo={name="Staunch Tathlum +1", priority=0},
    head={name="Sakpata's Helm", priority=91},
    body={name="Sakpata's Plate", priority=136},
    hands={name="Sakpata's Gauntlets", priority=91},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Loricate torque +1", priority=200},
    waist={name="Flume belt +1", priority=20},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=110},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Moonbeam cape", priority=60},
	}
		
    sets.idle.Weak = {    
	ammo={name="Staunch Tathlum +1", priority=0},
    head={name="Sakpata's Helm", priority=91},
    body={name="Sakpata's Plate", priority=136},
    hands={name="Sakpata's Gauntlets", priority=91},
    legs={name="Sakpata's Cuisses", priority=114},
    feet={name="Sakpata's Leggings", priority=68},
    neck={ name="Loricate torque +1", priority=200},
    waist={name="Flume belt +1", priority=20},
    left_ear={name="Etiolation Earring", priority=50},
    right_ear={name="Odnowa Earring +1", priority=110},
    left_ring={name="Moonlight Ring", priority=110},
    right_ring={name="Moonlight Ring", priority=109},
    back={ name="Moonbeam cape", priority=60},
}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt",feet="Rev. Leggings +3"}
	sets.passive.AbsorbMP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt",feet="Rev. Leggings +3"}
    sets.MP_Knockback = {}
    sets.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	--sets.weapons.DeaconAegis = {main="Deacon Sword",sub="Aegis"}
	--sets.weapons.SequenceBlurred = {main="Sequence",sub="Blurred Shield"}
	--sets.weapons.SequenceAegis = {main="Sequence",sub="Aegis"}
	--sets.weapons.DualWeapons = {main="Sequence",sub="Demersal Degen +1"}
    sets.weapons.BurtgangOchain = {main="Burtgang",sub="Ochain"}
	sets.weapons.BurtgangAegis = {main="Burtgang",sub="Aegis"}
	
    sets.defense.PDT = {                        
						ammo="Staunch Tathlum +1",
                        head="Souveran Schaller +1",
                        neck="Loricate Torque +1",
                        left_ear="Odnowa Earring",
                        right_ear="Odnowa Earring +1",
                        body="Souveran cuirass +1",
                        hands="Souveran Handschuhs +1",
                        left_ring="Vocane Ring",
                        right_ring="Defending Ring",
                        back="Moonbeam Cape",
                        waist="Flume Belt +1",
                        legs="Souveran Diechlings +1",
                        feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_HP = {main="Mafic Cudgel",sub="Ochain",ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Arke Cosciales",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_HP = {main="Mafic Cudgel",sub="Aegis",ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.MEVA_HP = {main="Mafic Cudgel",sub="Aegis",ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Arke Cosciales",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_Reraise = {ammo="Staunch Tathlum",
        head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
        body="Twilight Mail",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_Reraise = {main="Mafic Cudgel",sub="Aegis",ammo="Staunch Tathlum",
        head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs=gear.odyssean_fc_legs,feet="Cab. Leggings +1"}

	sets.defense.BDT = {    ammo="Staunch Tathlum +1",
    head="Souveran Schaller +1",
    body="Souveran cuirass +1",
    hands="Souveran Handschuhs +1",
    legs="Scuffler's Cosciales +1",
    feet="Souveran Schuhs +1",
    neck="Loricate Torque +1",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam cape"
}
		
	sets.defense.Tank = {ammo="Staunch Tathlum +1",
                        head="Souveran Schaller +1",
                        neck="Loricate Torque +1",
                        left_ear="Odnowa Earring",
                        right_ear="Odnowa Earring +1",
                        body="Souveran cuirass +1",
                        hands="Souveran Handschuhs +1",
                        left_ring="Vocane Ring",
                        right_ring="Defending Ring",
                        back="Moonbeam Cape",
                        waist="Flume Belt +1",
                        legs="Souveran Diechlings +1",
                        feet="Souveran Schuhs +1"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.fastcast_jse_back,waist="Asklepian Belt",legs=gear.odyssean_fc_legs,feet="Hippo. Socks +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Warden's Ring",ring2="Shadow Ring",
        back=gear.fastcast_jse_back,waist="Asklepian Belt",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Unmoving Collar +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back="Solemnity Cape",waist="Asklepian Belt",legs="Souv. Diechlings +1",feet="Odyssean Greaves"}
		
		-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.OchainMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Creed Baudrier",legs="Chev. Cuisses +1",feet="Chev. Sabatons +1"}
		
    sets.defense.OchainNoShellMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Flax Sash",legs="Sulev. Cuisses +2",feet="Chev. Sabatons +1"}
		
    sets.defense.AegisMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.fastcast_jse_back,waist="Asklepian Belt",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
		
    sets.defense.AegisNoShellMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.fastcast_jse_back,waist="Asklepian Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}		

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+17 Attack+17','"Store TP"+8','DEX+6','Accuracy+11','Attack+4',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+20','"Store TP"+7','STR+3',}},
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Flamma Ring",
    right_ring="Petrov Ring",
    back="Letalis Mantle",
}

    sets.engaged.Acc = {main="Mafic Cudgel",sub="Ochain",ammo="Hasty Pinion +1",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
        body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Tempus Fugit",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}

    sets.engaged.DW = {ammo="Paeapua",
		head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Flamma Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Sulev. Cuisses +2",feet="Founder's Greaves"}

    sets.engaged.DW.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Flamma Ring",ring2="Ramuh Ring +1",
		back="Letalis Mantle",waist="Olseni Belt",legs="Sulev. Cuisses +2",feet="Founder's Greaves"}

	sets.engaged.Tank = {ammo="Staunch Tathlum +1",
                        head="Souveran Schaller +1",
                        neck="Loricate Torque +1",
                        left_ear="Odnowa Earring",
                        right_ear="Odnowa Earring +1",
                        body="Souveran cuirass +1",
                        hands="Souveran Handschuhs +1",
                        left_ring="Vocane Ring",
                        right_ring="Defending Ring",
                        back="Moonbeam Cape",
                        waist="Flume Belt +1",
                        legs="Souveran Diechlings +1",
                        feet="Souveran Schuhs +1"}
		
	sets.engaged.Dawn = {main="Mafic Cudgel",sub="Ochain",ammo="Staunch Tathlum",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Arke Cosciales",feet="Rev. Leggings +3"}
		
	sets.engaged.BreathTank = {ammo="Staunch Tathlum +1",
    head="Souveran Schaller +1",
    body="Souveran cuirass +1",
    hands="Souveran Handschuhs +1",
    legs="Scuffler's Cosciales +1",
    feet="Souveran Schuhs +1",
    neck="Loricate Torque +1",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonbeam cape"
}
		
	sets.engaged.DDTank = {ammo="Ginsen",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Patricius Ring",
		back="Weard Mantle",waist="Windbuffet Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.engaged.Acc.DDTank = {ammo="Hasty Pinion +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Patricius Ring",
		back="Weard Mantle",waist="Tempus Fugit",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.engaged.NoShellTank = {main="Mafic Cudgel",sub="Ochain",ammo="Staunch Tathlum",
        head="Jumalik Helm",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Etiolation Earring",
        body="Rev. Surcoat +3",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt",legs=gear.odyssean_fc_legs,feet="Cab. Leggings +1"}
		
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +1"}
end

function check_buff()
	if state.AutoBuffMode.value and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local spell_recasts = windower.ffxi.get_spell_recasts()
		

		if not buffactive['Phalanx'] and spell_recasts[106] < latency then
			windower.chat.input('/ma "Phalanx" <me>')
			tickdelay = (framerate * 1.8)
			return true
		elseif not buffactive['Enmity Boost'] and spell_recasts[476] < latency then
			windower.chat.input('/ma "Crusade" <me>')
			tickdelay = (framerate * 1.8)
			return true
		else
			return false
		end
	end
		
	return false
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

function job_tick()
	if check_hasso() then return true end
	if check_buff() then return true end
	if state.AutoTankMode.value and player.target.type == "MONSTER" and not moving then
		if check_flash() then return true
		else 
			windower.send_command('gs c SubJobEnmity')
			tickdelay = (framerate * 1.8)
			return true
		end
	end
	return false
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(10, 15)
    elseif player.sub_job == 'RUN' then
        set_macro_page(10, 15)
    elseif player.sub_job == 'RDM' then
        set_macro_page(10, 15)
    elseif player.sub_job == 'BLU' then
        set_macro_page(10, 15)
    elseif player.sub_job == 'DNC' then
        set_macro_page(10, 15)
    else
        set_macro_page(10, 15) --War/Etc
    end
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 17')
end

send_command('wait 2;input /lockstyleset 17')

function user_self_command(commandArgs, eventArgs)
	if commandArgs[1] == 'rad' then
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
	elseif commandArgs[1] == 'attackbt' then
		send_command('input /attack <bt>; wait 4; input /ja "Aggressor" <me>')
		add_to_chat(158,'Attack bt')
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
	elseif commandArgs[1] == 'doom' then
       send_command('input /item "Savior\'s Tonic" <me>')
       add_to_chat(158,'Savior tonic')
	elseif commandArgs[1] == 'pois' then
       send_command('input /item "Poison Buffer" <me>')
       add_to_chat(158,'Poison Buffer')
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