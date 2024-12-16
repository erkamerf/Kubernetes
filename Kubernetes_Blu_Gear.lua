function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Fodder','Normal','Acc','FullAcc') --!f9
	state.HybridMode:options('Normal','DT') --^f9
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder') --!f10
    state.CastingMode:options('Normal','Resistant','Fodder','Proc') --@f10
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo') --f12
	state.PhysicalDefenseMode:options('PDT') --~f10
	state.MagicalDefenseMode:options('MDT') --^f11
	state.ResistDefenseMode:options('MEVA') --^f12
	state.Weapons:options('Tizalmace','Sequence','None','RangedWeap') --f9

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'} --!f11

	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.herculean_nuke_legs = {name="Herculean Trousers", augments={'"Mag.Atk.Bns."+12','Rng.Atk.+27','Accuracy+12 Attack+12','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}

	gear.obi_cure_waist = "Luminary Sash"
	gear.obi_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_cure_back = "Tempered Cape +1"

	-- Additional local binds
	--send_command('bind ^` input /ja "Chain Affinity" <me>')
	--send_command('bind @` input /ja "Efflux" <me>')
	--send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	--send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	--send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	--send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind ^f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	--send_command('bind !r gs c weapons None;gs c update')
	--send_command('bind @q gs c weapons MaccWeapons;gs c update')
	--send_command('bind ^q gs c weapons Almace;gs c update')
	--send_command('bind !q gs c weapons HybridWeapons;gs c update')
  
  --[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {legs="Assim. Shalwar +3",feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +3"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +2"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flume Belt +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +2"}


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Unmoving Collar",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet="Rawhide Boots"}
	
	sets.Self_Waltz = {body="Passion Jacket",ear1="Oneiros Earring",ring1="Asklepian Ring",waist="Chuq'aba Belt", feet="Rawhide Boots"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Carmine Mask +1",neck="244 +1",ear1="Regal Earring",ear2="Telos Earring",
					body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Malignance Chapeau",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Nyame Sollerets"}

	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Luhlaza Jubbah +2",hands="Hashi. Bazu. +1",ring1="Prolix Ring",ring2="Lebeche Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Gyve Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"}) 


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Aurgelmir Orb +1",
				  head="Herculean Helm",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
          body="Assim. Jubbah +3",hands="Herculean Gloves",ring1="Epona's Ring",ring2="Karieyh Ring +1",
				  back=gear.wsd_jse_back,waist="Fotia Belt",legs="Luhlaza Shalwar +3",feet="Herculean Boots"}

	sets.precast.WS.Acc = {ammo="Falcon Eye",
				  head="Herculean Helm",neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Odr Earring",
				  body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Karieyh Ring +1",ring2="Chirich Ring +1",
          back=gear.wsd_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Herculean Boots"}

	sets.precast.WS.FullAcc = {ammo="Falcon Eye",
				  head="Malignance Chapeau",neck="Ej Necklace",ear1="Mache Earring +1",ear2="Odr Earring",
				  body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
          back=gear.wsd_jse_back,waist="Artful Belt +1",legs="Malignance Tights",feet="Herculean Boots"}

	sets.precast.WS.DT = {ammo="Aurgelmir Orb +1",
				  head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
          body="Malignance Tabard",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Karieyh Ring +1",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Nyame Sollerets"}

	sets.precast.WS.Fodder = {ammo="Aurgelmir Orb +1",
				  head="Herculean Helm",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
          body="Adhemar Jacket +1",hands="Herculean Gloves",ring1="Epona's Ring",ring2="Karieyh Ring +1",
				  back=gear.wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_nuke_legs,feet="Herculean Boots"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Falcon Eye",head="Adhemar Bonnet +1",neck="Mirage Stole +1",ear1="Moonshade Earring",ear2="Odr Earring",body="Abnoba Kaftan",hands="Adhemar Wrist. +1",ring2="Begrudging Ring",back=gear.crit_jse_back,feet="Thereoid Greaves"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",ear2="Odr Earring",ring2="Begrudging Ring",body="Sayadio's Kaftan",back=gear.crit_jse_back,legs="Carmine Cuisses +1"})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Rufescent Ring",back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Rufescent Ring",back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,legs="Carmine Cuisses +1",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Assim. Jubbah +3",hands="Jhakri Cuffs +2"})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
			         head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Archon Ring",
			         back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	sets.precast.WS['Flash Nova'] = {ammo="Pemphredo Tathlum",
			         head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
			         back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Steelflash Earring",ear2="Cessance Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Hashishan Mintan +1",hands="Hashi. Bazu. +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Gyve Trousers",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {ammo="Mavi Tathlum",
		head="Lilitu Headpiece",neck="Mirage Stole +1",ear1="Suppanomimi",ear2="Telos Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Apate Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Resistant = {ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Telos Earring",
	    body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ifrit Ring +1",ring2="Stikini Ring +1",
	    back=gear.da_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Fodder = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +2",neck="Mirage Stole +1",ear1="Suppanomimi",ear2="Telos Earring",
		body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Shiva Ring +1",
		back="Cornflower Cape",waist="Grunfeld Rope",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Telos Earring",
	    body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Stikini Ring +1",
	    back=gear.da_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet="Nyame Sollerets"}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
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
	ammo="Mavi Tathlum",
    head={ name="Herculean Helm", augments={'INT+8','"Mag.Atk.Bns."+26','Accuracy+19 Attack+19','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    legs="Amalric Slops +1",
    feet="Amalric Nails +1",
    neck="Deviant Necklace",
    waist="Orpheus's Sash",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Acumen Ring",
    back=gear.nuke_jse_back,
	}
					 
	sets.midcast['Blue Magic'].Magical.Proc = set_combine(sets.precast.FC, {})
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{neck="Mirage Stole +1",ring2="Stikini Ring +1",waist="Yamabuki-no-Obi"})

	sets.midcast['Blue Magic'].Magical.Fodder = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {hands="Regal Cuffs",ring1="Kishar Ring"})

	sets.midcast['Dark Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {head="Pixie Hairpin +1", ring2="Archon Ring"})

	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {})
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{head="Carmine Mask +1",legs="Carmine Cuisses +1",})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Elemental Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {waist="Orpheus's Sash"})

	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring",waist="Orpheus's Sash"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Stikini Ring +1",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Medium's Sabots"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +2",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Assim. Jubbah +3",hands="Luh. Bazubands +2",ring1="Shiva Ring +1",ring2="Lebeche Ring",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Luminary Sash",legs="Malignance Tights",feet="Nyame Sollerets"}

	sets.midcast['Blue Magic'].Stun.Resistant = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Nyame Sollerets"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {ammo="Mavi Tathlum",
		head="Carmine Mask +1",neck="Phalaina Locket",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
		back="Moonlight Cape",waist=gear.ElementalObi,legs="Gyve Trousers",feet="Medium's Sabots"}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {ammo="Mavi Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Medium's Sabots"}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +2",neck="Mirage Stole +1",ear1="Gifted Earring",ear2="Loquac. Earring",
		body="Assim. Jubbah +3",hands="Rawhide Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Witful Belt",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Buff = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +2",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquac. Earring",
		body="Assim. Jubbah +3",hands="Hashi. Bazu. +1",ring1="Kishar Ring",ring2="Dark Ring",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {ammo="Falcon Eye",
			      head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
			      body="Jhakri Robe +2",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
			      back="Bleating Mantle",waist="Flume Belt +1",legs="Lengo Pants",feet=gear.herculean_refresh_feet}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
    			head="Nyame Helm",
    			body="Malignance Tabard",
    			hands="Nyame Gauntlets",
    			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    			feet="Nyame Sollerets",
    			neck="Twilight Torque",
    			waist="Flume Belt +1",
    			left_ear="Mache Earring +1",
    			right_ear="Cessance Earring",
    			left_ring="Defending Ring",
    			right_ring="Karieyh Ring +1",
    			back="Archon Cape",}

	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = {ammo="Staunch Tathlum +1",
					head="Nyame Helm",
					body="Malignance Tabard",
					hands="Nyame Gauntlets",
					legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
					feet="Nyame Sollerets",
					neck="Twilight Torque",
					waist="Flume Belt +1",
					left_ear="Mache Earring +1",
					right_ear="Cessance Earring",
					left_ring="Defending Ring",
					right_ring="Warden's Ring",
					back="Archon Cape",}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
				head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
				back="Archon Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
				head="Nyame Helm",neck="Mirage Stole +1",ear1="Cessance Earring",ear2="Telos Earring",
		        body="Nyame Mail",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
				back="Archon Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Nyame Sollerets"}

    sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Flume Belt +1",legs="Telchine Braconi",feet="Nyame Sollerets"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {legs="Dashing Subligar",}
    sets.MP = {waist="Flume Belt +1",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.Sequence = {main="Sequence",sub="Almace"}
	sets.weapons.RangedWeap = {main="Naegling",sub="Luhlaza Sword",range="Silver Gun +1",ammo="Bronze Bullet"}

	-- Engaged sets

	sets.engaged = {ammo="Aurgelmir Orb +1",
    				head="Malignance Chapeau",
    				body="Malignance Tabard",
    				hands={ name="Luh. Bazubands +2", augments={'Enhances "Azure Lore" effect',}},
    				legs="Malignance Tights",
    				feet={ name="Herculean Boots", augments={'Attack+13','"Mag.Atk.Bns."+25','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    				neck="Defiant Collar",
    				waist="Sarissapho. Belt",
    				left_ear="Cessance Earring",
    				right_ear="Telos Earring",
    				left_ring="Chirich Ring +1",
    				right_ring="Chirich Ring +1",
    				back=gear.stp_jse_back }

	sets.engaged.AM = {ammo="Aurgelmir Orb +1",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt ",legs="Samnuha Tights",feet="Carmine Greaves +1"}


	sets.engaged.Acc = {ammo="Falcon Eye",
				head="Dampening Tam",neck="Mirage Stole +1",ear1="Cessance Earring",ear2="Odr Earring",
				body="Malignance Tabard",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
				back=gear.da_jse_back,waist="Windbuffet Belt ",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}

	sets.engaged.Acc.AM = {ammo="Falcon Eye",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt ",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}

	sets.engaged.FullAcc = {ammo="Falcon Eye",
				head="Carmine Mask +1",neck="Mirage Stole +1",ear1="Mache Earring +1",ear2="Odr Earring",
				body="Malignance Tabard",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
				back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}

	sets.engaged.FullAcc.AM = {ammo="Falcon Eye",
			    head="Carmine Mask +1",neck="Mirage Stole +1",ear1="Mache Earring +1",ear2="Odr Earring",
			    body="Malignance Tabard",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
			    back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}

	sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Cessance Earring",ear2="Brutal Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.da_jse_back,waist="Windbuffet Belt ",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Fodder.AM = {ammo="Aurgelmir Orb +1",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Dedition Earring",ear2="Telos Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt ",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.DT = {ammo="Aurgelmir Orb +1",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.da_jse_back,waist="Windbuffet Belt ",legs="Malignance Tights",feet="Nyame Sollerets"}

	sets.engaged.DT.AM = {ammo="Aurgelmir Orb +1",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Nyame Sollerets"}

	sets.engaged.Acc.DT = {ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Odr Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Nyame Sollerets"}
				
	sets.engaged.Acc.DT.AM = {ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Nyame Sollerets"}

	sets.engaged.FullAcc.DT = {ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Odr Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Nyame Sollerets"}

	sets.engaged.Fodder.DT = {ammo="Aurgelmir Orb +1",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Nyame Sollerets"}

	sets.engaged.Fodder.DT.AM = {ammo="Aurgelmir Orb +1",
			    head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Mache Earring +1",ear2="Odr Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Apate Ring",
			    back="Bleating Mantle",waist="Sailfi Belt +1",legs="Malignance Tights",feet="Herculean Boots"}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring",legs="Assim. Shalwar +3"}
	sets.Phalanx_Received = {hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

	set_macro_page(1, 8)

end
