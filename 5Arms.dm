//This is a test world created by Henry Lu on July 5th, 2011.
//Last modified on July 24th, 2011

	// the '/' means is the same as (newline) and (tab) together
	// the ';' just includes the (newline)

var
	wblade = 0;wcross = 0;wstaff = 0;wspear = 0;wforce = 0;equip;prog = 0

world/turf = /turf

turf
	floor
		grass/icon = 'grass.dmi'
		town
			icon = 'town.dmi'
			before
				icon_state = "before"
			after
				icon_state = "after"
		hall
			icon = 'town.dmi';icon_state = "hall"
		sand
			icon = 'sand.dmi';icon_state = "calm"
		moth
			icon = 'moth.dmi';icon_state = "sand"
		flower
			icon = 'sand.dmi';icon_state = "flower"
		earth
			icon = 'earth.dmi';icon_state = "earth"
			ruin
		cave
			icon = 'earth.dmi';icon_state = "ground"
		dark
			icon = 'earth.dmi';icon_state = "dark"
		snow
			icon = 'snow.dmi';icon_state = "peak"
		warp
			icon = 'snow.dmi';icon_state = "peak"
			A1;A2;B1;B2;C1;C2;D1;D2;E1;E2;F1;F2;G1;G2;H1;H2;I1;I2;J1;J2;K1;K2;L1;L2;M1;M2;N1;N2;O1;O2;P1;P2;Q1;Q2;R1;R2;S1;S2;T1;T2;U1;U2

	wall
		density = 1
		opacity = 1
		cave
			icon = 'earth.dmi';icon_state = "cave"
		crack
			icon = 'earth.dmi';icon_state = "crack"
		dark
			icon = 'earth.dmi';icon_state = "dark"
		fort
			icon = 'town.dmi';icon_state = "fort";opacity = 0
		hall
			icon = 'town.dmi';icon_state = "hall";opacity = 0
		moth
			icon = 'moth.dmi';icon_state = "sand"
		ruin
			icon = 'earth.dmi';icon_state = "ruin"
		sand
			icon = 'sand.dmi';icon_state = "calm";opacity = 0
		shade
			icon = 'tree.dmi';icon_state = "dark"
		snow
			icon = 'snow.dmi';icon_state = "down"
		stall
			icon = 'town.dmi';icon_state = "stall";opacity = 0
		tree
			icon = 'tree.dmi';icon_state = "normal"
		water
			icon = 'sand.dmi';icon_state = "water";opacity = 0

obj
	flag/icon = 'flag.dmi'
	crack
		icon = 'crack.dmi'
		density = 1
		verb
			smash()
				set src in view(1)
				if (wforce == 1)
					src.density = 0
					src.icon = 'snow.dmi'
					src.icon_state = "peak"
					usr << "The force hammer broke the crack!"
				else
					usr << "It seems to remain strong."
//	fake
//		icon = 'force.dmi'
//		verb
//			wield()
//				set src in view(1)
//				for (var/turf/floor/dark/D in world)
//					for (var/mob/M in D)
//						if (M)
//							usr << "You have not defeated every foe."
//						else
//							usr << "The trial has begun."
//							usr << "Defeat all foes to advance."
//							del(src)

	gold
		icon = 'gold.dmi'
		var
			amount
		verb
			get()						//obj/gold/verb/get()
				set src in view(0)		//src must be close
				if (usr.bolt + amount >= 999)
					usr << "You bolt capacity is full."
					usr.bolt = 999
				else
					usr << "You picked up [amount] bolts."
					usr.bolt += amount
				del(src)
	potion
		icon = 'strong.dmi'
		verb
			get()
				set src in oview(0)
				usr << "You drunk the strength elixir!"
				usr.pp += 3
				del(src)

	person
		icon ='person.dmi'
		density = 1

		generic
			icon_state = "neuter"

		girl
			icon_state = "female"
			verb
				talk()
					set src in view(1)
					if (wblade == 0)
						usr << "Girl: Your from the Western Forest, correct?"
						usr << "Girl: Well I've heard there is this lengendary balde that rests in that forest."
					else
						if (prog == 0)
							usr << "Girl: Wow! Is that the Radiant Blade!?"
							usr << "Girl: This blade is able to double your strength in battle."
							usr << "Girl: ..."
							usr << "Girl: Our king is greedy. He makes us slaves. He wasn't always like this."
							usr << "Girl: But ever since that smell filled the air and he holds the gluttony crossbow..."
							usr << "Girl: Come closer. I want to tell you something."
							usr << "Girl: Tell the guards your name is Marcus. They'll let you in."
						else if (prog == 1)
							usr << "Girl: ...You killed him didn't you."
							usr << "Girl: Why?"
							usr << "Girl: He was my father."
							usr << "Katniss Kaesere: Just becuase he's evil, doesn't mean he should die."
							usr << "Katniss: ..."
						else if (prog == 2)
							usr << "Katniss: ..."
							usr << "Katniss: ..."
							usr << "Katniss: I'm getting over it."
							usr << "Katniss: ..."
							usr << "Katniss: Did it get cold all of a sudden?"
						else if (prog == 3)
							usr << "Katniss: I guess you did the right thing."
							usr << "Katniss: You've travelled many places correct?"
							usr << "Katniss: You've got to tell me about you adventures sometime."
						else if (prog == 4)
							usr << "Katniss: I can't spend my life like this."
							usr << "Katniss: I want to do something...different."
							usr << "Katniss: I was born a princess."
							usr << "Katniss: But I want to be someone else."
						else if (prog == 5)
							usr << "Katniss: A student of the blacksmith?"
							usr << "Katniss: ..."
							usr << "Katniss: That isn't a bad thing to try."
							usr << "Katniss: I'll see how it goes"
							src.loc = locate(14,16,4)
							prog = 6
						else if (prog == 6)
							usr << "Katniss: It's actually pretty fun."
							usr << "Katniss: It's kind of dirty though."
							usr << "Katniss: I think you should become the next king."
							usr << "Katniss: That's just what the town needs."

		sand
			icon_state = "sand"
			verb
				talk()
					set src in view(1)
					if (prog < 2)
						usr << "Man: These sandstorms are really tough to navagate."
						usr << "Man: I've put these flags up so you know where the storms the thinnest."
						usr << "Man: After that though, your on your own."
						usr << "Man: It's like a maze, but you can't see the walls."
					else if (prog == 2)
						usr << "Man: Argh...The storms are too strong, they blew my flags away."
						usr << "Man: Looks like noone's going through here in a long time."
						usr << "Man: Never told you may name. It's Sean Sparks."
						usr << "Sean Sparks: If you ever find Henry, tell him that I'm sorry."
					else if (prog == 4)
						usr << "Sean: You mean it [usr]?"
						usr << "Sean: Henry isn't mad at me anymore?"
						usr << "Sean: Oh thank you for talking to him."
						usr << "Sean: I'll go meet up with him then."
						prog = 5
						src.loc = locate(1,16,9)
		wise
			icon_state = "wise"
			verb
				talk()
					set src in view(1)
					if (prog < 3)
						usr << "Old man: Thanks for saving me."
						usr << "Old man: I was bewitched by a thief who ran into the woods."
						usr << "Old man: So close I was before an amushed struck me down."
						usr << "Old man: He took off with my family treasure."
						usr << "Old man: Please get it back for me."
						usr << "Old man: I would aid you, But I'm afraid this time I cannot."
						usr << "Old man: I can however, tend to your wounds if you wish."
						usr << "Old man: Just speak to me and I will help."
						prog = 3
						usr.pp += 6
						if (usr.hpmax < 200)
							usr.hpmax = 200
					if (prog == 3)
						usr << "Old man: The robber took off into the eastern caves."
						usr << "Old man: Be careful, the pathways are dark and treacherous."
						usr << "You are restored to [usr.hp] health."
						if (usr.hp < usr.hpmax)
							usr.hp = usr.hpmax
					if (prog == 4)
						usr << "Old man: Thank you for returning my treasure."
						usr << "Old man: However, I think it's best if you keep it."
						wspear = 1
						usr << "You can now use the almighty critical spear."
						usr << "Type 'spear' to equip the critical spear."
						usr << "Old man: Don't think you've wasted so much time to help an old man."
						usr << "Old man: This staff is able to pierce even the mightest defences."
						usr << "Old man: I'm sure it will come in handy."
						usr << "Old man: If you want to go north, tell them I, Henry Sett, sent you."
						usr << "Henry Sett: Hmm what's that? Sean says he's sorry?"
						usr << "Henry: For what? He still thinks it was his fault?"
						usr << "Henry: Tell Sean to come over here and that I forgive him."
					if (prog >= 5)
						usr << "Henry: Thank you for taking your time to get Sean back."
						usr << "Henry: I have a legend that'll be useful on your quest."
						usr << "Henry: Deep inside the caves there lies a cracked wall."
						usr << "Henry: Break it and face the challenges that await you."
						usr << "Henry: Defeat the master and aquire the ancient hammer."
						for (var/turf/wall/crack/C in world)
							C.density = 0
							C.opacity = 0
							C.icon_state = "ground"
					if (wforce == 1)
						usr << "Henry: The legendary force hammer."
						usr << "Henry: This hammer has a chance of crushing foes."
						usr << "Henry: This does not work on the unbreakable."
						usr << "Henry: They are distinguished by its cross like patttern."
		dead
			icon_state = "dead"
			verb
				talk()
					set src in view(1)
					usr.hpmax = 250
					usr.hp = 250
					usr.pp += 6
					usr << "Marcus: The enemy you are about to face is extremely powerful."
					usr << "Marcus: Beyond this point you are alone."
					usr << "Marcus: Alone to face evil in the most horrid way."
					usr << "Marcus: I give you my spirit to take the challenge."
					usr << "Marcus: Once you set foot to fight the final boss, you cannot return through normal means"
					del(src)

	guard
		icon = 'guard.dmi'
		icon_state = "guard"
		density = 1
		towntohall
			verb
				talk()
					set src in view(1)
					if (prog == 0)
						if (usr.name == "Marcus")
							usr << "Guard: Hey it's Marcus! You can come in."
							src.loc = locate(4,16,3)
						else
							usr << "Guard: Sorry. You're not allowed in."

		kinghall
			verb
				talk()
					set src in view(1)
					if (prog == 0)
						if (usr.name == "Marcus")
							usr << "Guard: Hey it's Marcus! Come on in!"
							src.loc = locate(4,16,4)
						else
							usr << "Guard: Sorry. You're not allowed in."
					else
						usr << "Guard: I wonder if our next king is going to be better."
						usr << "Guard: He was blinded by greed. I sense a new beginning."

		hallvist
			verb
				talk()
					set src in view(1)
					if (prog == 0)
						if (usr.name != "Marcus")
							usr << "Guard: A visitor? Just be sure to remain on the right."
							src.loc = locate(9,10,5)
						else
							usr << "Guard: Sorry Marcus, but I can't let you pass."
					else
						usr << "Guard: I think I want to be a king."
						usr << "Guard: Many people like me."

		halltrue
			verb
				talk()
					set src in view(1)
					if (prog == 0)
						if (usr.name == "Marcus")
							if (equip != null)
								usr << "Guard: Marcus? Ok, go through."
							else
								usr << "Guard: Sorry, I can not allow you to pass with that weapon."
							src.loc = locate(10,8,5)
						else
							usr << "Guard: Sorry visitor. Your not allowed past this point."
					else
						usr << "Guard: Hammers are capable of crushing some foes."
						usr << "Guard: There are insect with cross marks which are unbreakable."

		hallarm
			verb
				talk()
					set src in view(1)
					if (prog == 0)
						if (equip == null)
							usr << "Guard: You wish to speak with the king? Alright then."
							src.loc = locate(16,2,5)
						else
							usr << "Guard: I can't allow you to pass with that weapon."
					else
						usr << "Guard: I wonder if our next king is going to be better."
						usr << "Guard: He was blinded by greed. I sense a new beginning."
		northgate
			verb
				talk()
					set src in view(1)
					if (prog >= 4)
						usr << "Guard: You may pass through."
						usr << "Guard: This is the path to the final boss."
						usr << "Guard: There is nothing to heal poison."
						usr << "Guard: The instant you get an overdose, it's game over."
						src.loc = locate(8,16,4)
					else
						usr << "Guard: I'm sorry, but this area is off limits."
						usr << "Guard: It's the ****hing final boss!!!"
		southgate
			verb
				talk()
					set src in view(1)
					if (prog == 1)
						usr << "Guard: This is the way to the desert."
						usr << "Guard: Be careful out there."
						usr << "Guard: If your tired, you can come back here to rest."
						usr << "Guard: There is an inn, a shop and an armoury."
						src.loc = locate(10,2,4)
						usr.hpmax = 120
		westgate
			verb
				talk()
					set src in view(1)
					if (prog == 2)
						usr << "Guard: This is the way to the Caves."
						usr << "Guard: In there you will face new challenges."
						usr << "Guard: There are ranged insects which can fire back from a distance."
						usr << "Guard: Armoured insects which resist damage."
						usr << "Guard: Make sure to run back here at the first sight of trouble."
						src.loc = locate(16,7,4)
					else
						usr << "Guard: I'm sorry, but this area is off limits."
	shop
		icon = 'town.dmi'
		icon_state = "after"
		potion
			verb
				buy_potion()
					set src in view(0)
					if (usr.bolt < 40)
						usr << "Sorry, you don't have enough money."
					else
						usr.bolt -= 40
						usr.potion++
						usr << "Here you go."
				talk()
					usr << "Shopkeeper: This is a potion shop."
					usr << "Shopkeeper: 40 bolts for 1."

		inn
			verb
				heal()
					set src in view(0)		//src must be close
					if (usr.bolt - (usr.hpmax - usr.hp) * 3 <= 0)
						usr << "Sorry, you don't have enough money."
					else
						usr.bolt -= (usr.hpmax - usr.hp) * 3
						usr.hp = usr.hpmax
						usr << "You are restored to [usr.hp] health."
				talk()
					set src in view(0)
					usr << "Innkeeper: This is the inn."
					usr << "Innkeeper: You can rest here anytime."
					usr << "Innkeeper: It only costs a bit."
		armoury
			verb
				talk()
					set src in view(0)
					if (prog == 1)
						usr << "Blacksmith: Buy our armour to reduce damage by 5. Only 50 bolts!"
					else if (prog == 2)
						usr << "Blacksmith: I've found a new technique to increase the armour thricefold! Only 60 bolts!"
					else if (prog == 3)
						usr << "Blacksmith: The villigers are never satisfied."
						usr << "Blacksmith: They want it harder, stronger, lighter."
						usr << "Blacksmith: Oh well, I changed the formula for the plating."
						usr << "Blacksmith: It shalln't be much, but every little thing counts right? Only 70 bolts!"
					else if (prog == 4)
						usr << "Blacksmith: You seem to use the armour extensively."
						usr << "Blacksmith: This new armour will be able to last even more attacks."
						usr << "Blacksmith: It's only slightly heavier, but folks are already complaining about it. Only 80 bolts!"
					else if (prog == 5)
						usr << "Blacksmith: It's a pain to work alone..."
						usr << "Blacksmith: Maybe if I had a student to teach."
						usr << "Blacksmith: I've run out of ways to perfect my armour."
					else if (prog == 6)
						usr << "Blacksmith: Hey! I've got a student now!"
						usr << "Blacksmith: I just know it was you who"
						usr << "Blacksmith: Thanks a lot. It really means a lot."
						if (wforce == 1)
							usr << "Blacksmith: Is that the force hammer?"
							usr << "Blacksmith: I will be able to forge the perfect armour with this!"
							usr << "Blacksmith: Just let me borrwow it to me for a sec. That'll run you 100 bolts."

				buy_armour()
					set src in view(0)
					if (prog == 1)
						if (usr.bolt >= 50)
							if (usr.armour == 5)
								usr << "Blacksmith: You've already bought it."
								usr << "Blacksmith: No use to buy more then one."
							else
								usr.bolt -= 50
								usr.armour = 5
								usr << "Blacksmith: Here you go."
								usr << "Blacksmith: This is the Prime Armour."
						else
							usr << "Blacksmith: The armour costs 50 bolts."
					else if (prog == 2)
						if (usr.bolt >= 60)
							if (usr.armour == 15)
								usr << "Blacksmith: You've already bought it."
								usr << "Blacksmith: No use to buy more then one."
							else
								usr.bolt -= 60
								usr.armour = 15
								usr << "Blacksmith: Here you go."
								usr << "Blacksmith: This is the Grand Armour."
						else
							usr << "Blacksmith: The armour costs 60 bolts."
					else if (prog == 3)
						if (usr.bolt >= 70)
							if (usr.armour == 17)
								usr << "Blacksmith: You've already bought it."
								usr << "Blacksmith: No use to buy more then one."
							else
								usr.bolt -= 70
								usr.armour = 17
								usr << "Blacksmith: Here you go."
								usr << "Blacksmith: This is the Magical Armour."
						else
							usr << "Blacksmith: The armour costs 70 bolts."
					else if (prog == 4)
						if (usr.bolt >= 80)
							if (usr.armour == 20)
								usr << "Blacksmith: You've already bought it."
								usr << "Blacksmith: No use to buy more then one."
							else
								usr.bolt -= 80
								usr.armour = 20
								usr << "Blacksmith: Here you go."
								usr << "Blacksmith: This is the Ironclad Armour."
						else
							usr << "Blacksmith: The armour costs 80 bolts."
					else if (prog == 6)
						if (usr.bolt >= 100)
							if (usr.armour == 30)
								usr << "Blacksmith: This is it."
								usr << "Blacksmith: This is the Perfect Armour."
							else
								usr.bolt -= 100
								usr.armour = 30
								usr << "Blacksmith: This is it."
								usr << "Blacksmith: This is the Perfect Armour."

						else
							usr << "Blacksmith: The armour costs 100 bolts."


	healer
		icon = 'start.dmi'
		verb/heal()
			set src in view(0)		//src must be close
			usr.hp = usr.hpmax
			usr << "You are restored to [usr.hp] health."

	warp
		icon = 'warp.dmi'
		warpA1
			verb/enter()
				set src in oview(0);usr.Move(locate(/turf/floor/warp/A2))
		warpA2
			verb/enter()
				set src in oview(0);usr.Move(locate(/turf/floor/warp/A1))
		warpB1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/B2)
		warpB2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/B1)
		warpC1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/C2)
		warpC2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/C1)
		warpD1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/D2)
		warpD2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/D1)
		warpE1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/E2)
		warpE2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/E1)
		warpF1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/F2)
		warpF2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/F1)
		warpG1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/G2)
		warpG2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/G1)
		warpH1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/H2)
		warpH2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/H1)
		warpI1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/I2)
		warpI2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/I1)
		warpJ1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/J2)
		warpJ2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/J1)
		warpK1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/K2)
		warpK2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/K1)
		warpL1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/L2)
		warpL2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/L1)
		warpM1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/M2)
		warpM2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/M1)
		warpN1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/N2)
		warpN2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/N1)
		warpO1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/O2)
		warpO2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/O1)
		warpP1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/P2)
		warpP2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/P1)
		warpQ1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/Q2)
		warpQ2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/Q1)
		warpR1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/R2)
		warpR2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/R1)
		warpS1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/S2)
		warpS2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/S1)
		warpT1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/T2)
		warpT2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/T1)
		warpU1
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/U2)
		warpU2
			verb/enter()
				set src in view(0);usr.loc = locate(/turf/floor/warp/U1)
		warpBoss
			verb/enter()
				set src in view(0);usr.loc = locate(9,9,13)
//Level gates
		warpFinal
			verb/enter()
				set src in view(0)
				usr << "You have beaten the evil fruit and completed this game."
				if (wforce == 1)
					usr.loc = locate(9,9,8)
					for (var/turf/wall/water/W in world)
						W.density = 0
					for (var/turf/wall/stall/S in world)
						S.density = 0
				else
					usr << "But have you collected all 5 Arms???"
					usr.loc = locate(11,13,8)
		warpEscape
			verb/enter()
				set src in view(0)
				if (!wforce)
					usr << "Better not go there."
					usr << "It looks dangerous."
				else
					usr << "No time for second guessing."
					usr << "You've barely escaped."
					usr.loc = locate(14,9,2)

		east1to2	//forest to town
			icon_state = "right";verb/enter()
				set src in view(0);usr.loc = locate(2,11,2)

		west2to1
			icon_state = "left";verb/enter()
				set src in view(0);usr.loc = locate(16,11,1)

		east2to3	//to town west
			icon_state = "right";verb/enter()
				set src in view(0)
				if (prog >= 1)
					usr.loc = locate(2,9,4)
				else
					usr.loc = locate(2,9,3)
		west3to2
			icon_state = "left";verb/enter()
				set src in view(0);usr.loc = locate(6,9,2)

		north34to5	//to king's hall
			icon_state = "up";verb/enter()
				set src in view(0);usr.loc = locate(3,16,5)

		north5to34
			icon_state = "up";verb/enter()
				set src in view(0)
				if (prog >= 1)
					usr.loc = locate(3,15,4)
				else
					usr.loc = locate(3,15,3)

		south4to2
			icon_state = "down";verb/enter()
				set src in view(0);usr.loc = locate(9,6,2)
		north2to4	//to town south
			icon_state = "up";verb/enter()
				set src in view(0);usr.loc = locate(9,2,4)
		south2to6	//to sand
			icon_state = "down";verb/enter()
				set src in view(0);usr.loc = locate(1,16,6)
		north6to2
			icon_state = "up";verb/enter()
				set src in view(0);usr.loc = locate(2,2,2)
		south6to7	//to moth
			icon_state = "down";verb/enter()
				set src in view(0);usr.loc = locate(17,16,7)
		north7to6
			icon_state = "up";verb/enter()
				set src in view(0)
				if (prog < 2)
					usr.loc = locate(17,2,6)
				else
					usr.loc = locate(9,1,2)
					for (var/turf/floor/sand/S in world)
						S.density = 1
		east4to2
			icon_state = "right";verb/enter()
				set src in view(0);usr.loc = locate(12,9,2)
		west2to4	//to town east
			icon_state = "left";verb/enter()
				set src in view(0);usr.loc = locate(16,9,4)
		east2to9	//to cave
			icon_state = "right";verb/enter()
				set src in view(0);usr.loc = locate(2,11,9)
		west9to2
			icon_state = "left";verb/enter()
				set src in view(0);usr.loc = locate(16,9,2)
		east9to10	//in cave
			icon_state = "right";verb/enter()
				set src in view(0);usr.loc = locate(1,9,10)
		west10to9
			icon_state = "left";verb/enter()
				set src in view(0);usr.loc = locate(17,7,9)
		west9toman
			icon_state = "left";verb/enter()
				set src in view(0);usr.loc = locate(17,16,9)
		eastmanto9
			icon_state = "right";verb/enter()
				set src in view(0)
				if (!wforce)
					usr.loc = locate(2,16,10)
				else
					usr << "Better not risk another cave-in."
		east10to11	//to force
			icon_state = "right";verb/enter()
				set src in view(0);usr.loc = locate(2,2,11)
		west11to10
			icon_state = "left";verb/enter()
				set src in view(0);usr.loc = locate(16,2,10)
		north4to2
			icon_state = "up";verb/enter()
				set src in view(0);usr.loc = locate(9,12,2)
		south2to4
			icon_state = "down";verb/enter()
				set src in view(0);usr.loc = locate(9,16,4)
		north2to12
			icon_state = "up";verb/enter()
				set src in view(0);usr.loc = locate(4,15,12)
		south12to2
			icon_state = "down";verb/enter()
				set src in view(0);usr.loc = locate(11,17,2)

	weapon
		blade
			icon = 'blade.dmi'
			verb
				wield()
					set src in view(0)
					wblade = 1
					usr << "You can now use the legendary radiant blade."
					usr << "Type 'blade' to equip the radiant blade."
					for(var/turf/wall/tree/T in world)
						T.opacity = 0
					del(src)
		cross
			icon = 'cross.dmi'
			verb
				wield()
					set src in view(0)
					wcross = 1
					prog = 1
					usr << "You can now use the forbidden gluttony crossbow."
					usr << "Type 'cross' to equip the gluttony crossbow."
					del(src)
		staff
			icon = 'staff.dmi'
			verb
				wield()
					set src in view(0)
					wstaff = 1
					prog = 2
					for (var/obj/flag/F in world)
						del(F)
					for (var/turf/floor/moth/M in world)
						M.icon = 'sand.dmi'
						M.icon_state = "calm"
						M.opacity = 0
						M.density = 0
					for (var/turf/wall/moth/W in world)
						W.icon = 'sand.dmi'
						W.icon_state = "calm"
						W.density = 0
					usr << "You can now use the great youth staff."
					usr << "Type 'staff' to equip the youth staff."
					del(src)
		spear
			icon = 'spear.dmi'
			verb
				wield()
					set src in view(0)
					if (prog !=3)
						usr << "Better not touch it."
						usr << "You don't know where it's been."
					else
						prog = 4
						usr << "You have found the old man's treasure."
						del(src)
		force
			icon = 'force.dmi'
			verb
				wield()
					set src in view(0)
					for (var/turf/wall/crack/C in world)
						C.density = 1
						C.icon_state = "ruin"
					for (var/turf/floor/earth/ruin/R in world)
						R.density = 1
						R.icon_state = "ruin"
					for (var/turf/wall/cave/C in world)
						C.icon_state = "ruin"

					wforce = 1
					usr << "You can now use the powerful force hammer."
					usr << "Type 'force' to equip the force hammer."
					usr << "Oh no! You sealed in!"
					del(src)

mob
	Login()
		usr << "Welcome [usr]!"  //1.solved
		usr << "(The bar on the bottom is used to type in.)"
		usr << "(Use the commands above.)"
		loc = locate(6,6,1)
		icon = 'person.dmi'
		icon_state = gender
		usr.hp = 90
		usr.hpmax = 90
		usr.power = 4
		usr.armour = 1
		usr.pp = 0
		..()

	Stat()
		statpanel("Status")	//Your Inventory panel
		stat("Key:[key]")
		stat("Alias:[name]")
		stat("Health: [src.hp]/[src.hpmax]")
		stat("Poison (100=game over): [poison]%")
		stat("Power: [src.power+src.pp]")
		stat("Armour: [src.armour]")
		stat("Story Progression: [prog/7]%")
		stat("You have:")
		stat("Gold x [src.bolt]")
		stat("Potions x [src.potion]")
		stat("___Arms___")
		if (!equip)
			if (wblade || wcross || wstaff || wspear || wforce)
				stat("You are unarmed! Better equip a weapon!")
			else
				stat("You are unarmed ;_;")
		else
			stat("currently equipped: [equip]")
		if (wblade == 1)
			stat("Radiant Blade. Type 'blade' to equip")
		if (wcross== 1)
			stat("Gluttony Crossbow. Type 'cross' to equip")
		if (wstaff == 1)
			stat("Youth Staff. Type 'staff' to equip")
		if (wspear == 1)
			stat("Critical Piercing Spear. Type 'spear' to equip")
		if (wforce == 1)
			stat("Cracking Force Hammer. Type 'force' to equip")

	Del()
		var/obj/gold/G = new(loc)	//create new object G
		G.amount = rand(1,50)
		..()

	var
		armour
		bolt = 0
		hp
		hpmax
		potion = 1
		poison
		power
		pp

	bug
		icon = 'bug.dmi'
		icon_state = "normal"
		hp = 30
		hpmax = 30
		power = 4
		armour = 0

	moth
		icon = 'moth.dmi'
		icon_state = "normal"
		hp = 45
		hpmax = 45
		power = 6
		armour = 0

	armoured_bug
		icon = 'bug.dmi'
		icon_state = "armoured"
		hp = 45
		hpmax = 45
		power = 15
		armour = 40

	armoured_moth
		icon = 'moth.dmi'
		icon_state = "armoured"
		hp = 60
		hpmax = 60
		power = 18
		armour = 40

	unbreakable
		bug
			icon = 'bug.dmi'
			icon_state = "unbreakable"
			hp = 75
			hpmax = 75
			power = 20
			armour = 6

		moth
			icon = 'moth.dmi'
			icon_state = "unbreakable"
			hp = 100
			hpmax = 100
			power = 27
			armour = 9

	ranged
		bug
			icon = 'bug.dmi'
			icon_state = "ranged"
			hp = 40
			hpmax = 40
			power = 15
			armour = 4

		moth
			icon = 'moth.dmi'
			icon_state = "ranged"
			hp = 60
			hpmax = 60
			power = 18
			armour = 6

	poisoned
		bug
			icon = 'bug.dmi'
			icon_state = "poisoned"
			hp = 50
			hpmax = 50
			power = 10
			armour = 10

		moth
			icon = 'moth.dmi'
			icon_state = "poisoned"
			hp = 75
			hpmax = 75
			power = 15
			armour = 15
		fruit
			icon = 'boss.dmi'
			icon_state = "evil"
			hp = 100
			hpmax = 100
			power = 35
			armour = 21

	verb
		attack()				//attack a mob within 1 tile
			set src in oview(1)
			var/damage

			if (usr.hp <= 0)
				usr << "[usr] is too hurt to battle! Go heal!"
			if (istype(src,/mob/poisoned))
				usr.poison += rand(1,2)
				usr << "[usr] is poisoned a tiny bit."
				PoisonCheck()
//begining of weapon attacks
			if (equip == "blade")								//check if your weilding the blade
				damage = rand(4,40) + ((usr.power + usr.pp) * 2) - src.armour
				if (damage <= 0)									//check if armour nullifyed the hit
					usr << "[usr] could not pierce the armour of [src]."
				else
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
					src.DeathCheck()									//check if mob died

			else if (equip == "staff")								//check if your weilding the staff
				damage = rand(4,40) + usr.power + usr.pp - src.armour
				if (damage <= 0)									//check if armour nullifyed the hit
					usr << "[usr] could not pierce the armour of [src]."
				else
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
					src.DeathCheck()
				if (ispath(src,/mob/poisoned))
					usr << "[usr] could not regain health from [src]."
				else
					var/heal
					heal = rand(4,10)
					if (usr.hpmax <= usr.hp + heal)
						usr.hp = usr.hpmax
						usr << "[usr] is restored to full health."
					else
						usr.hp += heal
						usr << "[usr] regained [heal] health."

			else if (equip == "spear")									//check if your weilding the spear
				damage = rand(3,30) + usr.power + usr.pp //No armour reduction
				usr << "[usr] attacks [src] for [damage] damage!"
				src.hp -= damage
				src.DeathCheck()
			else if (equip == "force")							//check if your weilding the force hammer
				var/crush = rand(1,3)
				if (istype(src,/mob/unbreakable))
					damage = rand(30,50) + usr.power + usr.pp - src.armour
					if (damage <= 0)									//check if armour nullifyed the hit
						usr << "[usr] could not pierce the armour of [src]."
					else
						usr << "[usr] attacks [src] for [damage] damage!"
						src.hp -= damage									//subtract HP from mob
						src.DeathCheck()									//check if mob died
				else
					if (crush == 3 || (istype(src,/mob/poisoned)&&crush>=2))
						usr << "The Force Hammer crushed [src]."
						src.hp = 0
						src.DeathCheck()
					else
						damage = rand(30,50) + usr.power + usr.pp - src.armour
						if (damage <= 0)									//check if armour nullifyed the hit
							usr << "[usr] could not pierce the armour of [src]."
						else
							usr << "[usr] attacks [src] for [damage] damage!"
							src.hp -= damage									//subtract HP from mob
							src.DeathCheck()									//check if mob died
			else
				damage = rand(2,20) + usr.power + usr.pp - src.armour
				if (damage <= 0)
					usr << "[usr] could not pierce [src]\s armour."
				else
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage
					src.DeathCheck()
//end of weapon attacks
			if (src.hp > 0)
				damage = rand(1,10) + src.power - usr.armour
				if (damage <= 0)
					usr << "[src] could not break [usr]\s armour"
				else
					usr << "[src] attacks back for [damage] damage."
					usr.hp -= damage
					usr.UsrDeath()
		shoot()
			set src in oview(2)
			var/damage

			if (equip != "cross")
				usr << "You don't have the crossbow equipped!"
			else
				if (usr.bolt < 15)
					usr << "you don't have enough bolts to fire!"
				else
					usr.bolt -= 15
					damage = rand(4,40) + pp
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
					src.DeathCheck()

				if (ispath(src,/mob/ranged) && src.hp > 0)
					damage = rand(1,10) + src.power
					usr << "[src] attacks back for [damage] damage"
					usr.hp -= damage
					usr.UsrDeath()

		check()
			usr << "[usr] has [hp]/[hpmax] health."
			usr << "[usr] has [bolt] bolts."	//4.solved
			usr << "[usr] has [usr.power + usr.pp] strength."
			usr << "[usr] has [potion] potions."
			usr << "[usr] armour is [armour]."
			if (usr.poison > 0)
				usr << "You have a poison dosed with [poison]%."
			switch (equip)
				if ("blade")
					usr << "[usr] is holding the radiant blade."
				if ("cross")
					usr << "[usr] is holding the gluttony crossbow."
				if ("staff")
					usr << "[usr] is holding the youth staff."
				if ("spear")
					usr << "[usr] is holding the critical spear."
				if ("force")
					usr << "[usr] is holding the force hammer."

			if (wblade == 1 && equip != "blade")
				usr << "Type 'blade' to equip the radiant blade."
			if (wcross == 1 && equip != "cross")
				usr << "Type 'cross' to equip the gluttony crossbow."
			if (wstaff == 1 && equip != "staff")
				usr << "Type 'staff' to equip the youth staff."
			if (wspear == 1 && equip != "spear")
				usr << "Type 'spear' to equip the critical spear."
			if (wforce == 1 && equip != "force")
				usr << "Type 'force' to equip the force hammer."
		drink()
			if (usr.potion == 0)
				usr << "You have no potions!"
			else
				if (usr.hp >= usr.hpmax - 50)
					usr << "You are already quite well."
				else
					usr.potion--
					usr.hp += 50
					usr << "You recovered 50 health"

	//cheat codes
		passive()
			set hidden = 1
			if (usr.density	== 1)
				usr.density = 0
			else
				usr.density = 1

		glutton()
			set hidden = 1
			usr.bolt = 999

		power()
			set hidden = 1
			usr.pp = 999

		pots()
			set hidden = 1
			usr.potion = 99

		set_name(N as text)
			set desc = "(\"new name\") Change your name."
			name = N

		unarm()
			if (equip != null)
				equip = null
				usr << "[usr] is now wielding nothing."
				usr.power = 4
		blade()
			set hidden = 1
			if (wblade == 1)
				equip = "blade"
				usr << "[usr] is now wielding the radiant blade."
				usr.power = 8
		cross()
			set hidden = 1
			if (wcross == 1)
				equip = "cross"
				usr << "[usr] is now wielding the gluttony crossbow."
				usr.power = 10
		staff()
			set hidden = 1
			if (wstaff == 1)
				equip = "staff"
				usr << "[usr] is now wielding the youth staff."
				usr.power = 12
		spear()
			set hidden = 1
			if (wspear == 1)
				equip = "spear"
				usr << "[usr] is now wielding the critical spear."
				usr.power = 14
		force()
			set hidden = 1
			if (wforce == 1)
				equip = "force"
				usr << "[usr] is now wielding the force hammer."
				usr.power = 20

	proc
		DeathCheck()
//						new/obj/potion/heal(src.loc)
			if (hp <= 0)
				world << "[src] was killed by [usr]."	//src is the owner of proc, attack()
				del(src)
//			else if (hp <= 10)							//5.solution
//				icon_state = "hurt"
		UsrDeath()
			if (usr.hp <= 0)
				usr << "you fled home"
				usr.loc = locate(6,6,1)
				usr.icon = 'person.dmi'
				usr.icon_state = gender
				usr.hp = 0
				for(var/mob/M in world)
					M.hp = M.hpmax
				..()
		PoisonCheck()
			if (poison >= 100)
				usr.loc = locate(9,9,15)
			else if (poison >= 75)
				usr << "You are badly poisoned."
			..()


boss
	parent_type = /mob
	icon = 'boss.dmi'
	king
		icon_state = "king"
		hp = 99
		hpmax = 99
		power = 10
		armour = 7
		verb
			talk()
				set src in view(1)
				usr << "King: Whose there? Marcus?"
				usr << "King: I never sent for you!"
				usr << "King: Leave now or face the wrath of my bow."
				usr << "King: King Kaesere will rule all!!!"
	moth
		icon_state = "moth"
		hp = 120
		hpmax = 120
		power = 16
		armour = 14
		verb
			talk()
				set src in view(5)
				usr << "Queen: Must go to smell..."
				usr << "Queen: Must go north..."
				usr << "Queen: Must go to smell..."
				usr << "Queen: Must go now..."
				usr << "Queen: Must go to smell..."
				attack()				//attack a mob within 1 tile

		attack()
			set src in oview(1)
			var/damage

			if (usr.hp <= 0)
				usr << "[usr] is too hurt to battle! Go heal!"
//begining of weapon attacks
			else if (equip == "blade")								//check if your weilding the blade
				damage = rand(4,40) + ((usr.power + usr.pp) * 2) - src.armour
				if (damage <= 0)									//check if armour nullifyed the hit
					usr << "[usr] could not pierce the armour of Queen Moth."
				else
					usr << "[usr] attacks Queen Moth for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
					src.DeathCheck()									//check if mob died
			else
				damage = rand(2,20) + usr.power + usr.pp - src.armour
				if (damage <= 0)
					usr << "[usr] could not pierce Queen Moth's armour"
				else
					usr << "[usr] attacks Queen Moth for [damage] damage!"
					src.hp -= damage
					src.DeathCheck()
//end of weapon attacks
			if (src.hp > 0)
				damage = rand(1,10) + src.power - usr.armour
				if (damage <= 0)
					usr << "Queen Moth failed to inflict damage to [usr]."
				else
					usr.hp -= damage
					src.hp += damage
					usr << "Queen Moth attacks back for [damage] damage."
					usr << "Queen Moth gained [damage] health."
					usr.UsrDeath()
		shoot()
			set src in oview(2)
			var/damage

			if (equip != "cross")
				usr << "You don't have the crossbow equipped!"
			else
				if (usr.bolt < 42)
					usr << "You don't have enough bolts to fire!"
				else
					usr.bolt -= 42
					damage = rand(4,40)
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
					src.DeathCheck()

	thief
		icon_state = "thief"
		hp = 160
		hpmax = 160
		power = 27
		armour = 21
		verb
			talk()
				set src in view(1)
				usr << "Thief: What are you doing here? Get lost!"
				usr << "Thief: Your here for that guy's thing?"
				usr << "Thief: Why do you need to but into peoples business?"
				usr << "Thief: No matter, I'll kill you."

		attack()
			set src in oview(1)
			var/damage

			if (usr.hp <= 0)
				usr << "[usr] is too hurt to battle! Go heal!"
//begining of weapon attacks
			else if (equip == "blade")								//check if your weilding the blade
				damage = rand(4,40) + ((usr.power + usr.pp) * 2) - src.armour
				if (damage <= 0)									//check if armour nullifyed the hit
					usr << "[usr] could not pierce the armour of [src]."
				else
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
					src.DeathCheck()									//check if mob died

			else if (equip == "staff")								//check if your weilding the staff
				damage = rand(4,40) + usr.power + usr.pp- src.armour
				if (damage <= 0)									//check if armour nullifyed the hit
					usr << "[usr] could not pierce the armour of [src]."
				else
					var/heal
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
					src.DeathCheck()
					heal = rand(40,60)
					if (usr.hpmax <= usr.hp + heal)
						usr.hp = usr.hpmax
						usr << "[usr] is restored to full health."
					else
						usr.hp += heal
						usr << "[usr] regained [heal] health."
//end of weapon attacks
			if (src.hp > 0)
				damage = rand(4,40) + src.power
				usr << "[src] sends a fireball for [damage] damage."
				usr.hp -= damage
				usr.UsrDeath()
		shoot()
			set src in oview(2)
			if (equip != "cross")
				usr << "You don't have the crossbow equipped!"
			else
				if (usr.bolt < 15)
					usr << "You don't have enough bolts to fire!"
				else
					var/damage
					usr.bolt -= 15
					usr << "[src] evaded the shot easily."
					damage = rand(4,40) + src.power
					usr << "[src] sends a fireball for [damage] damage."
					usr.hp -= damage
					usr.UsrDeath()
	fruit
		icon_state = "evil"
		hp = 415
		hpmax = 450
		power = 38
		armour = 49
		attack()
			set src in oview(1)
			var/damage

			if (usr.hp <= 0)
				usr << "[usr] is too hurt to battle! Go heal!"
//begining of weapon attacks
			else if (equip == "blade")								//check if your weilding the blade
				damage = rand(4,40) + ((usr.power + usr.pp)* 2) - src.armour
				if (damage <= 0)									//check if armour nullifyed the hit
					usr << "[usr] could not pierce the armour of [src]."
				else
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage
			else if (equip == "staff")								//check if your weilding the staff
				damage = rand(4,40) + usr.power + usr.pp - src.armour
				if (damage <= 0)									//check if armour nullifyed the hit
					usr << "[usr] could not pierce the armour of [src]."
				else
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
					usr << "[usr] could not regain health from [src]."
			else if (equip == "spear")									//check if your weilding the spear
				damage = rand(3,30) + power	+ pp //No armour reduction
				usr << "[usr] attacks [src] for [damage] damage!"
				src.hp -= damage
			else if (equip == "force")							//check if your weilding the force hammer
				damage = rand(30,50) + usr.power + usr.pp - src.armour
				if (damage <= 0)									//check if armour nullifyed the hit
					usr << "[usr] could not pierce the armour of [src]."
				else
					usr << "[usr] attacks [src] for [damage] damage!"
					src.hp -= damage									//subtract HP from mob
			else
				usr << "[usr] flails thier arms wildly."
				usr << "Fruit: ..."
//end of weapon attacks
			usr.poison += rand(3,7)
			usr << "Fruit poisons [usr] significantly"
			usr.PoisonCheck()
			if (src.hp <= 0)
				new/obj/warp/warpFinal(locate(9,9,13))
				src.DeathCheck()
			else
				for (var/mob/poisoned/fruit/F in world)
					F.Move(locate(rand(1,17),rand(1,17),13))
				src.loc = locate(rand(1,17),rand(1,17),13)
				damage = rand(1,42) + src.power - usr.armour
				usr << "The Evil Fruit sends a nuke for [damage] damage."
				usr.hp -= damage
				usr.UsrDeath()
		shoot()
			set src in oview(2)
			if (equip != "cross")
				usr << "You don't have the crossbow equipped!"
			else
				if (usr.bolt < 15)
					usr << "You don't have enough bolts to fire!"
				else
					var/damage
					usr.bolt -= 15
					damage = rand(5,40)
					usr << "[usr] attacks the fruit."
					usr << "[src] took [damage] damage."
					src.hp -= damage			//subtract HP from mob
					if (src.hp <= 0)
						new/obj/warp/warpFinal(locate(9,9,13))
						src.DeathCheck()
					else
						usr << "Something seems wrong..."
						damage = rand(10,50) + src.power
						usr << "The evil fruit sends a nuke for [damage] damage."
						usr << "Woah! That felt strangely powerful."
						usr.hp -= damage
						usr.UsrDeath()