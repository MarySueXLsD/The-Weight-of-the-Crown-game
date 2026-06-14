# Questions & Choices Reference

Complete catalogue of court encounters: prompts, player choices, NPC responses, and stat effects.

**Language:** English (from `encounters_en.das`, `edric_opener.das`, `ashford.das`)

**Russian version:** [QUESTIONS_REFERENCE_RU.md](QUESTIONS_REFERENCE_RU.md)

**Stat order:** People, Church, Army, Treasury, Health, Loyalty, Nobility, Food, Succession

**Pools:**
- **Early Pool** (indices 0–29): Days 1–10 (index 0 = Edric tutorial, replaced at runtime; no People stat)
- **Mid Pool** (indices 30–79): Days 11–29 (no People stat)
- **Late Pool A** (indices 80–159): Days 30–89 (index 80 = Church unlock fixed encounter; no People stat)
- **Late Pool B** (indices 160–179): Days 30–89 extension (no People stat)
- **People Pool** (indices 180–251): Days 90+ (People stat unlock at day 89)

**Total pool encounters:** 252

---

## Special Encounters (outside random pools)

### Encounter #0 — Day 1 Tutorial — Old Advisor Edric

**Character:** Old Advisor Edric
**Note:** Replaces pool encounter #0 on day 1 (POOL_EARLY_FIXED_IDX).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Old Advisor Edric. The blade has placed you on the throne, but blades alone cannot keep it. From this day forward, each dawn will bring a petitioner through your door. Every answer you give will shift the measures of the realm. Let any measure fall to nothing, and your reign ends. How do you mean to bear it?

**Choice 1:** Steadily — I will weigh each crisis before I decide
- **Response:** Wise. Haste crowned many kings and buried them faster. I will bring the first petitioner when you are ready to listen.
- **Effects:** Loyalty +5

**Choice 2:** Boldly — a king who hesitates is a king who falls
- **Response:** Then let none mistake silence for weakness. The court will test you soon enough.
- **Effects:** Army +5

**Choice 3:** Mercifully — I will not rule as the old king did
- **Response:** Mercy wins hearts the sword cannot touch. Guard it — the realm devours soft kings as readily as cruel ones.
- **Effects:** Church +2, Army -2

---

### Lady Ashford Debut (Nobility unlock)

**Character:** Lady Ashford
**Note:** Triggered by nobility stat unlock cutscene, not from question pools.
**Nodes:** 4 (start node: 0)

#### Node 0

**Prompt:** Your Grace, I am Lady Ashford of the eastern marches. My house did not bleed for your coup, nor did we kneel when the old king fell. We have waited seven days to see whether this throne belongs to a ruler — or a brigand who got lucky with a blade.

**Choice 1:** You may speak freely, my lady
- **Effects:** Loyalty +5, Nobility +8, Succession +5
- **Next node:** 1

**Choice 2:** Mind your tone. I hold the sword of Loria
- **Effects:** Loyalty -5, Nobility -10
- **Next node:** 2

**Choice 3:** The throne has no time for noble vanity
- **Response:** Vanity keeps bloodlines alive. Dismiss me, and every house in Loria will hear that the usurper fears a woman with a ledger.
- **Effects:** Loyalty -8, Nobility -15, Succession -5

#### Node 1

**Prompt:** Freely? How refreshing. Most usurpers prefer flattery. So — the question every great house whispers in their halls: will you legitimise your reign through noble blood, or rule as a lone wolf until the realm tears you apart? My house can crown you in the eyes of the elite — or bury you beside the king you replaced.

**Choice 1:** Grant Ashford a seat on the privy council
- **Response:** A seat, not merely a title. My house will speak for you in halls where your name still tastes of treason.
- **Effects:** Treasury -10, Loyalty +10, Nobility +18, Succession +8

**Choice 2:** Propose a marriage alliance
- **Effects:** People +3, Church +5, Treasury -8, Loyalty +8, Nobility +15, Succession +12
- **Next node:** 3

**Choice 3:** The nobility will bow or be broken
- **Response:** You mistake fear for loyalty. My house will remember this audience — and so will every lord who asked whether you could endure.
- **Effects:** Army +5, Loyalty -10, Nobility -20, Succession -8

**Choice 4:** I need time to consider
- **Response:** Time is the luxury of secure kings. Take your days — we shall see how many remain.
- **Effects:** Loyalty +3, Nobility -5, Succession -5

#### Node 2

**Prompt:** A sword rusts without gold to sharpen it. I did not come to trade threats — I came to learn whether you are worth the risk of an alliance. Will you legitimise your reign through noble blood, or rule as a lone wolf until the realm tears you apart?

**Choice 1:** Grant Ashford a seat on the privy council
- **Response:** A seat, not merely a title. My house will speak for you in halls where your name still tastes of treason.
- **Effects:** Treasury -10, Loyalty +10, Nobility +18, Succession +8

**Choice 2:** Propose a marriage alliance
- **Effects:** People +3, Church +5, Treasury -8, Loyalty +8, Nobility +15, Succession +12
- **Next node:** 3

**Choice 3:** The nobility will bow or be broken
- **Response:** You mistake fear for loyalty. My house will remember this audience — and so will every lord who asked whether you could endure.
- **Effects:** Army +5, Loyalty -10, Nobility -20, Succession -8

**Choice 4:** I need time to consider
- **Response:** Time is the luxury of secure kings. Take your days — we shall see how many remain.
- **Effects:** Loyalty +3, Nobility -5, Succession -5

#### Node 3

**Prompt:** One final matter before I withdraw: the old king's nephew still lives. Marry into my house, and we can silence that threat together — or leave it to fester while lesser lords choose their side.

**Choice 1:** We will deal with the nephew together
- **Response:** Then we are partners in more than name. My couriers ride tonight — let the realm see unity where it expected collapse.
- **Effects:** Army +3, Treasury -5, Loyalty +12, Nobility +10, Succession +15

**Choice 2:** That is a matter for the crown alone
- **Response:** Alone is how usurpers end. I wish you better fortune than your predecessor, Your Grace.
- **Effects:** Loyalty -5, Nobility -8, Succession -10

---

## Pool Encounters

## Early Pool

_Days 1–10 (index 0 = Edric tutorial, replaced at runtime; no People stat)_

### Encounter #0 — General Rudolf

**Character:** General Rudolf
**Note:** Pool slot for day-1 Edric tutorial; at runtime shows Edric opener instead of this text.
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The soldiers shed blood to put you on the throne. Now they are waiting for coins. If the treasury remains silent, the swords may also speak.

**Choice 1:** Pay the army in full.
- **Response:** The soldiers will remember the generous king. At least until the next salary.
- **Effects:** Army +20, Treasury -25

**Choice 2:** Pay half and promise the rest later.
- **Response:** Half a coin buys half peace of mind. But today that's enough.
- **Effects:** Army +8, Treasury -10

**Choice 3:** Serving the king is already an honor.
- **Response:** Honor does not ring in your wallet. I hope your walls are stronger than your generosity.
- **Effects:** Army -20, Treasury +5

**Choice 4:** How many soldiers actually took part in the coup?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Less than listed. The commanders attributed the dead, the lame and those who slept drunk that night.

**Choice 1:** Pay only honest people.
- **Response:** Fair. But the deceived commanders will begin to grumble.
- **Effects:** Army +10, Treasury -10

**Choice 2:** Pay everyone so as not to anger the army.
- **Response:** Generous order. Even liars will praise you loudly.
- **Effects:** Army +18, Treasury -20

**Choice 3:** Freeze payments until verification.
- **Response:** Checks feed paper, not soldiers. I warned you.
- **Effects:** Army -12, Treasury +10

---

### Encounter #1 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the people know your crown, but do not know whether it is blessed. Today the church must decide whether to name you king or usurper.

**Choice 1:** Ask the church for a blessing.
- **Response:** Humility is a fitting beginning for one who reached the throne through blood.
- **Effects:** Church +20, Treasury -10

**Choice 2:** Demand recognition of my authority.
- **Response:** Orders reach soldiers. They rise to heaven far less well.
- **Effects:** Church -15, Army +8

**Choice 3:** Offer the church an alliance.
- **Response:** An alliance of throne and altar may save the realm. Or smother it.
- **Effects:** Church +10, Treasury -5, Health +5

---

### Encounter #2 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** After the sermon, more hungry folk came to the monastery than usual. They believe the temple will feed them if the king cannot.

**Choice 1:** Send grain to the monastery.
- **Response:** Today faith will smell of bread.
- **Effects:** Church +8, Health +15, Food -15

**Choice 2:** Let the monastery feed them on its own.
- **Response:** We will try. But an empty pot does not become holy through prayer.
- **Effects:** Church -5, Health -8, Food +5

**Choice 3:** Send guards to disperse the line.
- **Response:** You can scatter the hungry. Hunger itself will stay.
- **Effects:** Church -10, Army +8, Health -10

---

### Encounter #3 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples collect tithe. The treasury collects taxes. Soon the people will see they pay twice.

**Choice 1:** Limit the church tithe.
- **Response:** The treasury is grateful. The altar will hiss.
- **Effects:** Church -20, Treasury +15, Health +5

**Choice 2:** Leave the tithe to the church.
- **Response:** Priests love it when their gold is called faith.
- **Effects:** Church +10, Treasury -10

**Choice 3:** Collect taxes together with the church.
- **Response:** Two hands in one pocket. Convenient, yet dangerous.
- **Effects:** Church +5, Treasury +10, Health -8

---

### Encounter #4 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik wants priests in the barracks. He says soldiers need souls. Soldiers need bread and steel.

**Choice 1:** Allow priests in the barracks.
- **Response:** If they start teaching mercy to soldiers, I will throw them out myself.
- **Effects:** Church +12, Army -5

**Choice 2:** Forbid them entry.
- **Response:** The barracks will remain barracks, not a hall of prayer.
- **Effects:** Church -12, Army +10

**Choice 3:** Let them in only before battles.
- **Response:** Before death, men listen to gods more willingly. Hard to argue with that.
- **Effects:** Church +5, Army +5

---

### Encounter #5 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People refuse to drink boiled water. They buy holy water instead. It comes from the same filthy well.

**Choice 1:** Ban the sale of holy water.
- **Response:** Thank you. Disease does not vanish when filth is blessed.
- **Effects:** Church -15, Health +15

**Choice 2:** Order temples to boil water before consecration.
- **Response:** Good. Let faith at least stop carrying infection.
- **Effects:** Church +5, Treasury -3, Health +12

**Choice 3:** Do not interfere with rites.
- **Response:** Then I will treat the consequences of your caution.
- **Effects:** Church +8, Health -15

---

### Encounter #6 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church has declared a fast. There will be less meat, which is fine. Yet soldiers already ask why the gods need their stew.

**Choice 1:** Fast for all, army included.
- **Response:** Turnips will be holy. Soldiers will be furious.
- **Effects:** Church +10, Army -15, Food +20

**Choice 2:** Fast only for the palace.
- **Response:** Now that is a sight: courtiers suffering almost like common folk.
- **Effects:** Church +5, Health +5, Food +5

**Choice 3:** Exempt the army from fasting.
- **Response:** Soldiers will be fed. Priests will be hungry for outrage.
- **Effects:** Church -8, Army +10, Food -10

---

### Encounter #7 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A crowd gathers by the main temple. They demand that the church declare whether you are a lawful king.

**Choice 1:** Post guards at the temple.
- **Response:** Spears may hold doors. Not questions.
- **Effects:** Church -5, Army +8, Health -5

**Choice 2:** Let the crowd hear the sermon.
- **Response:** Very well. But if words turn to sparks, I warned you.
- **Effects:** Church +8, Health +5

**Choice 3:** Distribute bread before the temple.
- **Response:** A fed man shouts less. Sometimes that is the best guard.
- **Effects:** Church +5, Health +10, Food -12

---

### Encounter #8 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A king who quarrels with the church gains an enemy in every temple. A king who submits to it loses his throne without battle.

**Choice 1:** Grant the church broader rights.
- **Response:** The altar will smile. The throne will stand a little lower.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2:** Bind the church by law.
- **Response:** A bold move. Such footsteps are often heard near a scaffold.
- **Effects:** Church -20, Army +5, Treasury +10

**Choice 3:** Keep the balance.
- **Response:** Balance is seldom elegant, but sometimes it survives longer.
- **Effects:** Church +5, Army +5, Treasury -5

---

### Encounter #9 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Since the church reopened, people buy candles, icons, and amulets. I can organize the trade and pay you a share.

**Choice 1:** Permit trade in holy wares.
- **Response:** Faith sells better than bread, and keeps longer.
- **Effects:** Church -8, Treasury +20

**Choice 2:** Forbid profit from faith.
- **Response:** Noble. Very unprofitable.
- **Effects:** Church +10, Treasury -10, Health +5

**Choice 3:** Allow only temple-controlled goods.
- **Response:** A monopoly of holiness. The church learns commerce quickly.
- **Effects:** Church +8, Treasury +8

---

### Encounter #10 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests brought a man who spat upon temple doors. They demand a public execution.

**Choice 1:** Execute him.
- **Response:** The square will receive its lesson again. I hope it is worth the blood.
- **Effects:** Church +15, Army +5, Health -10

**Choice 2:** Throw him in the dungeon.
- **Response:** A dungeon is quieter than a gallows, but priests prefer loud answers.
- **Effects:** Church -5, Army +5

**Choice 3:** Force a public apology.
- **Response:** A rare day when a tongue replaces a noose.
- **Effects:** Church +5, Health +5

---

### Encounter #11 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples burn incense against pestilence. It smells lovely. It heals nothing. I have better herbs.

**Choice 1:** Buy herbs from Sivil.
- **Response:** Herbs are rougher than prayers, yet they work more often.
- **Effects:** Church -5, Treasury -12, Health +15

**Choice 2:** Support the temple incense.
- **Response:** Then let disease choke on fragrance, if it can.
- **Effects:** Church +10, Treasury -5, Health -8

**Choice 3:** Mix herbs with church incense.
- **Response:** Now that is almost clever. It is almost insulting.
- **Effects:** Church +5, Treasury -10, Health +12

---

### Encounter #12 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** My prince asks whether your church now rules beside you. In the north, such kings are called soft.

**Choice 1:** Say the church is my ally.
- **Response:** The north will hear and decide you share your sword with prayer.
- **Effects:** Church +10, Army -5

**Choice 2:** Say the church bends to the throne.
- **Response:** Good. The north respects those who keep the altar by the throat.
- **Effects:** Church -10, Army +10

**Choice 3:** Refuse to answer the provocation.
- **Response:** Silence can be wise, but neighbors often hear fear in it.
- **Effects:** Army -3, Treasury +5

---

### Encounter #13 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The people of the former king still serve in the palace. If you drive everyone away, the palace will go blind. If you leave everyone, you will sleep among someone else's memory.

**Choice 1:** Drive away all the old servants.
- **Response:** The palace will become cleaner. And much more stupid.
- **Effects:** Army +5, Treasury -10, Food -5

**Choice 2:** Leave those who take a new oath.
- **Response:** An oath is not always loyalty. But this is a start.
- **Effects:** Army +3, Treasury -3

**Choice 3:** Leave everyone.
- **Response:** The palace machine will continue to work. The question is - to whom.
- **Effects:** Army -5, Treasury +5

**Choice 4:** Which one is dangerous?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** The most dangerous of all are those who are too silent. A devoted servant is always a little human. A spy is always furniture.

**Choice 1:** Make a list of suspects.
- **Response:** The list won't save you, but it will tell you who not to trust with wine.
- **Effects:** Army +5, Treasury -5

**Choice 2:** Replace only those closest to the throne.
- **Response:** Soft cleaning. Sometimes a soft knife cuts more accurately.
- **Effects:** Army +5, Treasury -5

**Choice 3:** Don't touch anyone.
- **Response:** Then the palace will smile at you with its old teeth.
- **Effects:** Army -5, Treasury +3

---

### Encounter #14 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Northern scouts crossed the border. This could be a test. May I strike first?

**Choice 1:** Strike first.
- **Response:** So say kings who are never tried twice.
- **Effects:** Army +20, Treasury -15, Food -5

**Choice 2:** Strengthen the border, but do not attack.
- **Response:** Cautious force. Not the worst language for the border.
- **Effects:** Army +10, Treasury -8

**Choice 3:** Send an ambassador.
- **Response:** Words are cheaper than blood. Until the other side decides otherwise.
- **Effects:** Army -5, Treasury -5, Food +3

**Choice 4:** Ignore the scouts.
- **Response:** The border will hear your silence. And the enemy too.
- **Effects:** Army -15, Treasury +5

---

### Encounter #15 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church asks for the right to judge crimes against the faith. Without it, the temple remains toothless.

**Choice 1:** Grant the church judicial power.
- **Response:** Faith without judgment is a plea. Faith with judgment is law.
- **Effects:** Church +20, Army -5, Health -8

**Choice 2:** Keep judgment under the crown.
- **Response:** Then do not be surprised when sinners begin to love royal law.
- **Effects:** Church -15, Army +8

**Choice 3:** Allow church courts for heresy alone.
- **Response:** Not all we asked, but enough to begin.
- **Effects:** Church +8, Army +3, Health -3

---

### Encounter #16 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People fleeing tax collectors took refuge in a temple. They are hungry and terrified. Will you demand their surrender?

**Choice 1:** Demand their surrender.
- **Response:** Temple doors will open, but people will remember holiness did not protect them.
- **Effects:** Church -10, Army +5, Treasury +10

**Choice 2:** Leave them in sanctuary.
- **Response:** Thank you. At times, sanctuary matters more than statute.
- **Effects:** Church +10, Treasury -10, Health +5

**Choice 3:** Forgive debt for those who come out willingly.
- **Response:** Mercy brought out more souls than guards.
- **Effects:** Church +5, Treasury -5, Health +8

---

### Encounter #17 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik wishes to build a new cathedral. The treasury has a hole, yet the cathedral may calm the people.

**Choice 1:** Allocate funds for the cathedral.
- **Response:** Stone for the temple. Emptiness for the treasury.
- **Effects:** Church +20, Treasury -25, Health +5

**Choice 2:** Refuse.
- **Response:** The treasury thanks you. The temple will curse you with excellent acoustics.
- **Effects:** Church -15, Treasury +10

**Choice 3:** Build a small chapel instead of a cathedral.
- **Response:** Inexpensive piety. At times, even that sells.
- **Effects:** Church +8, Treasury -8

---

### Encounter #18 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests want to stitch church crosses on military banners. Soldiers serve the king, not the temple.

**Choice 1:** Add crosses to the banners.
- **Response:** Now soldiers carry not only your crest. A dangerous symbol.
- **Effects:** Church +15, Army -8

**Choice 2:** Forbid church signs on banners.
- **Response:** Good. In battle a soldier must see orders, not sermons.
- **Effects:** Church -12, Army +10

**Choice 3:** Add a small symbol on separate regimental ribbons.
- **Response:** Tolerable. Prayer stays at the edge where it belongs.
- **Effects:** Church +5, Army +3

---

### Encounter #19 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The sick queue for a saint's relics. They stand hours in rain instead of going to the infirmary.

**Choice 1:** Forbid the relic queue.
- **Response:** You will save bodies. Souls will rage.
- **Effects:** Church -15, Health +15

**Choice 2:** Place healers beside the relics.
- **Response:** Good. Let miracle work beside bandages.
- **Effects:** Church +5, Treasury -8, Health +15

**Choice 3:** Do not hinder the faithful.
- **Response:** Then rain and disease continue their service.
- **Effects:** Church +10, Health -12

---

### Encounter #20 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples want the best flour for holy bread. I could feed orphans with that flour.

**Choice 1:** Give the best flour to temples.
- **Response:** Holy bread will be soft. Orphans' porridge thin.
- **Effects:** Church +12, Food -10

**Choice 2:** Give the flour to orphans.
- **Response:** Children will thank you. Priests will complain longer.
- **Effects:** Church -8, Health +12, Food -8

**Choice 3:** Divide the flour.
- **Response:** Half holiness, half mercy. Edible.
- **Effects:** Church +5, Health +5, Food -8

---

### Encounter #21 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A priest refused temple gates to guards. Inside is church land, not royal.

**Choice 1:** Break in by force.
- **Response:** The door falls. And something greater with it.
- **Effects:** Church -20, Army +12, Health -5

**Choice 2:** Withdraw.
- **Response:** The guard will remember. Priests too.
- **Effects:** Church +10, Army -10

**Choice 3:** Demand talks at the gate.
- **Response:** Good. Let them talk for now, not break.
- **Effects:** Church +3, Army +3

---

### Encounter #22 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church's opening brought not peace but a new center of power. Every order is compared to a sermon.

**Choice 1:** Make the church official support of the throne.
- **Response:** You gained a holy shield. And a holy chain.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2:** Keep the church at distance.
- **Response:** Safer for the throne. Riskier for the people's soul.
- **Effects:** Church -10, Army +5, Treasury +5

**Choice 3:** Show unity without yielding power.
- **Response:** A tightrope walk. Do not look down.
- **Effects:** Church +8, Army +3, Treasury -3

---

### Encounter #23 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some priests want to preach about the blood of the coup this Sunday. I can forbid them. But forbidding in the temple comes at a price.

**Choice 1:** Forbid preaching about the coup.
- **Response:** Silence is bought. But it does not always keep long.
- **Effects:** Church +8, Treasury -10, Health +5

**Choice 2:** Let them speak the truth.
- **Response:** Truth in the temple rings louder than in the square.
- **Effects:** Church +5, Army -8, Health -5

**Choice 3:** Let them speak of peace, not blood.
- **Response:** Peace is a convenient truth. The church knows how to speak it.
- **Effects:** Church +10, Treasury -5

---

### Encounter #24 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** I wish to open a shelter at the monastery. Orphans will live, learn, and work. But we need bread and a little gold.

**Choice 1:** Support the shelter.
- **Response:** You gave the children not only a roof, but a tomorrow.
- **Effects:** Church +8, Treasury -12, Health +20, Food -8

**Choice 2:** Give grain only.
- **Response:** They will eat. For now that is already a miracle.
- **Effects:** Church +3, Health +10, Food -10

**Choice 3:** Refuse.
- **Response:** Then the street will be their teacher again.
- **Effects:** Church -5, Treasury +5, Health -10, Food +5

---

### Encounter #25 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church sells letters of absolution. Tax them and the treasury will revive.

**Choice 1:** Tax the letters.
- **Response:** Sin will finally work for the treasury.
- **Effects:** Church -10, Treasury +20

**Choice 2:** Ban the sale of letters.
- **Response:** Moral. But morality does not jingle.
- **Effects:** Church -15, Health +8

**Choice 3:** Do not interfere.
- **Response:** The temple will keep selling heaven without our share.
- **Effects:** Church +10, Treasury -5

---

### Encounter #26 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests say the northerners are godless. If they continue, soldiers will start waiting for war.

**Choice 1:** Allow such sermons.
- **Response:** Soldiers love an enemy they were blessed to hate.
- **Effects:** Church +15, Army +10, Treasury -5

**Choice 2:** Forbid war sermons.
- **Response:** Sensible. There is war enough without holy cries.
- **Effects:** Church -12, Army -5, Treasury +5

**Choice 3:** Allow only prayers for protection.
- **Response:** Defense sounds quieter than attack. Sometimes that helps.
- **Effects:** Church +5, Army +5

---

### Encounter #27 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Monks heal with herbs but keep no records of doses. Today a child nearly died from too strong a brew.

**Choice 1:** Require monastery healers to keep records.
- **Response:** Ink will save those prayers heal blindly.
- **Effects:** Church -5, Treasury -3, Health +15

**Choice 2:** Ban monastery healing.
- **Response:** It will stop mistakes. And some help too.
- **Effects:** Church -15, Health +10

**Choice 3:** Do not touch monastery traditions.
- **Response:** Traditions are fine until medicine is mistaken for poison.
- **Effects:** Church +8, Health -12

---

### Encounter #28 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims are coming to the capital. If unfed they collapse at the gates. If fed, our stores collapse.

**Choice 1:** Feed the pilgrims.
- **Response:** Holy folk eat like anyone else. Sometimes even more.
- **Effects:** Church +15, Health +10, Food -20

**Choice 2:** Admit only those who bring their own food.
- **Response:** The city keeps grain. Pilgrims keep resentment.
- **Effects:** Church -8, Health -3, Food +5

**Choice 3:** Organize cheap porridge.
- **Response:** Thin but honest. Good enough for pilgrims.
- **Effects:** Church +8, Treasury -5, Health +5, Food -10

---

### Encounter #29 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims enter the city. Among them one can hide spies, killers, and deserters.

**Choice 1:** Search all pilgrims.
- **Response:** Safer. But holiness will wait in line for inspection.
- **Effects:** Church -8, Army +10, Health -3

**Choice 2:** Let all pass unchecked.
- **Response:** Open gates are loved by more than the faithful.
- **Effects:** Church +10, Army -10

**Choice 3:** Search only armed men.
- **Response:** A compromise. Not perfect, but livable.
- **Effects:** Church +3, Army +5

---

## Mid Pool

_Days 11–29 (no People stat)_

### Encounter #30 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples demand return of lands seized by the former king. Land gives bread. Bread gives power.

**Choice 1:** Return the lands to the church.
- **Response:** The altar grows richer. The throne — more grateful or weaker.
- **Effects:** Church +20, Treasury -10, Food -15

**Choice 2:** Keep the lands for the crown.
- **Response:** The land stays yours. So do the curses.
- **Effects:** Church -20, Treasury +10, Food +10

**Choice 3:** Return only part.
- **Response:** Half a concession is often better than full war.
- **Effects:** Church +8, Treasury -5, Food -5

---

### Encounter #31 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims buy everything: bread, candles, water, rags, hope. Permit a temporary market by the temple.

**Choice 1:** Allow the market and take a toll.
- **Response:** Faith brings buyers. The crown takes the coins.
- **Effects:** Church -5, Treasury +20, Food -5

**Choice 2:** Allow the market without toll.
- **Response:** Rare generosity. Merchants will pray for you.
- **Effects:** Church +8, Treasury -5, Health +3

**Choice 3:** Ban the market by the temple.
- **Response:** Holiness preserved. Profit passed by.
- **Effects:** Church +5, Treasury -10, Food +5

---

### Encounter #32 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some prisoners suddenly grew very pious. They ask to replace execution with monastery penance.

**Choice 1:** Allow penance instead of execution.
- **Response:** The monastery gets sinners. I get a free day.
- **Effects:** Church +12, Army -8, Health +8

**Choice 2:** Execute as sentenced.
- **Response:** Faith came late. The axe — on time.
- **Effects:** Church -5, Army +10, Health -5

**Choice 3:** Replace execution with labor at monasteries.
- **Response:** Sin will dig the earth. Almost poetic.
- **Effects:** Church +5, Army -3, Treasury +8

---

### Encounter #33 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** My prince congratulates you on your crown. He asks only for a small thing: to reduce the duty on northern furs.

**Choice 1:** Reduce the duty.
- **Response:** The North will appreciate your wisdom. And your need for friends.
- **Effects:** Treasury -10, Food +5

**Choice 2:** Refuse.
- **Response:** Solid answer. I hope your borders are just as strong.
- **Effects:** Army -5, Treasury +10

**Choice 3:** Increase the duty.
- **Response:** Boldly. My prince loves the brave almost as much as he loves testing them.
- **Effects:** Army -10, Treasury +20

**Choice 4:** Why is your prince asking now?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because the new king is either looking for friends or showing his teeth. My prince wants to understand who he sees.

**Choice 1:** Tell him: I'm looking for friends.
- **Response:** Then the north will extend its hand. Cold, but open.
- **Effects:** Army -3, Treasury -8, Food +10

**Choice 2:** Tell him: I'm showing my teeth.
- **Response:** I'll pass. And I'll make sure he doesn't laugh too loudly.
- **Effects:** Army +10, Treasury +5, Food -5

**Choice 3:** Tell him: I trade, but I don’t bow.
- **Response:** Nice phrase. It can be sold for more than fur.
- **Effects:** Treasury +5, Food +5

---

### Encounter #34 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The temple sells holy salve for sores. It holds fat, wax, and lies. My salves at least smell honest.

**Choice 1:** Ban holy salve.
- **Response:** Good sense beat fragrant lies.
- **Effects:** Church -12, Health +12

**Choice 2:** Allow both salves.
- **Response:** Let people choose between faith and stink. Amusing.
- **Effects:** Church +5, Treasury +5, Health -5

**Choice 3:** Inspect salves before sale.
- **Response:** Inspection is the swindler's foe. So almost medicine.
- **Effects:** Church -3, Treasury -5, Health +10

---

### Encounter #35 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Northerners in the capital ask to open their own temple. Your priests call it heresy.

**Choice 1:** Allow a northern temple.
- **Response:** The north will approve. Your priests will not.
- **Effects:** Church -20, Treasury +5, Health +5

**Choice 2:** Forbid it.
- **Response:** Then northerners will see your faith outweighs hospitality.
- **Effects:** Church +15, Army +3, Treasury -5

**Choice 3:** Allow private prayers without a temple.
- **Response:** Half-freedom. The north lives with it, but does not love it.
- **Effects:** Church -5, Treasury +3, Health +3

---

### Encounter #36 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Soldiers who shed blood on the night of the coup must confess. Otherwise sin stays on your army.

**Choice 1:** Require soldiers to confess.
- **Response:** Sin is named. Now it can be leashed.
- **Effects:** Church +15, Army -10, Health +5

**Choice 2:** Make confession voluntary only.
- **Response:** Voluntary cleansing is slower, but cleaner.
- **Effects:** Church +5, Army +3

**Choice 3:** Leave the army alone.
- **Response:** Then swords stay sharp. Souls stay dirty.
- **Effects:** Church -12, Army +10

---

### Encounter #37 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims sell their belongings for bread. Some already fall on the road to the temple.

**Choice 1:** Open a free kitchen.
- **Response:** The road to the temple will be less deadly today.
- **Effects:** Church +10, Health +18, Food -18

**Choice 2:** Sell them cheap bread.
- **Response:** Not mercy, but help. Sometimes that is all there is.
- **Effects:** Treasury +5, Health +8, Food -8

**Choice 3:** Close the city to new pilgrims.
- **Response:** The gates keep bread. And lose hearts.
- **Effects:** Church -15, Health -5, Food +10

---

### Encounter #38 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** If the church declares giving to the crown a holy deed, people will bring coins themselves.

**Choice 1:** Ask the church to declare a collection.
- **Response:** When greed is blessed, it is called service.
- **Effects:** Church +8, Treasury +20, Health -5

**Choice 2:** Collect donations without the church.
- **Response:** People give less when heaven does not frighten them.
- **Effects:** Treasury +8, Health -3

**Choice 3:** Do not collect from the people.
- **Response:** Mercy robbed the treasury again.
- **Effects:** Treasury -10, Health +8

---

### Encounter #39 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests want prayer before every parade. It turns the army into a church procession.

**Choice 1:** Allow prayers before inspection.
- **Response:** Soldiers will stand longer. I hope enemies wait too.
- **Effects:** Church +12, Army -5

**Choice 2:** Forbid it.
- **Response:** Good. Inspection should sound of steps, not psalms.
- **Effects:** Church -10, Army +10

**Choice 3:** Prayer only before a campaign.
- **Response:** Before death people tolerate long speeches.
- **Effects:** Church +5, Army +5

---

### Encounter #40 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church forbids autopsies of those who died of disease. Without them we cannot learn what kills.

**Choice 1:** Allow secret autopsies.
- **Response:** Secret truth still heals better than open lies.
- **Effects:** Church -8, Health +15

**Choice 2:** Forbid autopsies.
- **Response:** Then disease keeps its secrets.
- **Effects:** Church +10, Health -15

**Choice 3:** Autopsy only bodies without kin.
- **Response:** Cruel but useful. Like much in medicine.
- **Effects:** Church -3, Health +8

---

### Encounter #41 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** In three days is the saint's feast. The temple asks a feast for the poor. The poor ask for feasts every day.

**Choice 1:** Allocate food for the feast.
- **Response:** The feast will be hearty. The next day ordinary.
- **Effects:** Church +12, Health +8, Food -15

**Choice 2:** Allocate half.
- **Response:** Half a miracle. Not bad for the kitchen.
- **Effects:** Church +5, Health +3, Food -8

**Choice 3:** Refuse.
- **Response:** Bread stays. Gratitude leaves.
- **Effects:** Church -10, Health -5, Food +5

---

### Encounter #42 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Salt preserves meat and fish. Give me security and I will bring it to the city.

**Choice 1:** Provide military protection.
- **Response:** The salt will come quickly. The soldiers will also finally do something useful for trade.
- **Effects:** Army -5, Treasury -5, Food +15

**Choice 2:** Pay the mercenaries.
- **Response:** Expensive, but convenient. Mercenaries ask fewer questions.
- **Effects:** Treasury -15, Food +15

**Choice 3:** Let the caravan go on its own.
- **Response:** Then pray that thieves do not like salt.
- **Effects:** Treasury +5, Food -10

**Choice 4:** Why do you need royal security?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because the robbers fear the banner more than my people. And the royal guard also makes the goods royally expensive.

**Choice 1:** Give protection, but take away some of the salt.
- **Response:** Fair. Unpleasant, but fair.
- **Effects:** Army -5, Food +18

**Choice 2:** Provide security for a fee.
- **Response:** You are learning to trade. It's scary.
- **Effects:** Army -5, Treasury +5, Food +15

**Choice 3:** Hire your own security.
- **Response:** Certainly. And then I'll name a price you won't like.
- **Effects:** Treasury +5, Food -5

---

### Encounter #43 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik is forming a temple guard. For now sticks and robes. Later, swords.

**Choice 1:** Forbid the temple guard.
- **Response:** Good. One law and one guard in the city.
- **Effects:** Church -15, Army +12

**Choice 2:** Allow the temple guard.
- **Response:** Then the temple grows teeth. Do not be surprised if it bites.
- **Effects:** Church +15, Army -10

**Choice 3:** Merge the temple guard into the royal guard.
- **Response:** Better in the ranks than against them.
- **Effects:** Church +5, Army +5, Treasury -5

---

### Encounter #44 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The people hear you in the square and Malrik in the temple. In the temple they weep. In the square they fear.

**Choice 1:** Speak to the people more often.
- **Response:** The throne must have a voice, or others speak for it.
- **Effects:** Church -3, Treasury -5, Health +10

**Choice 2:** Let the church speak for the crown.
- **Response:** Convenient. But one day you will hear your orders in a stranger's voice.
- **Effects:** Church +15, Army -5

**Choice 3:** Give bread after royal speeches.
- **Response:** Good. Words go down better with bread.
- **Effects:** Church +3, Health +12, Food -10

---

### Encounter #45 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church wants a book of faithful subjects. Those listed receive help first.

**Choice 1:** Allow the book of the faithful.
- **Response:** Ordered mercy beats chaotic mercy.
- **Effects:** Church +15, Health -8

**Choice 2:** Forbid dividing people by faith.
- **Response:** You want equality where people seek chosenness.
- **Effects:** Church -15, Health +10

**Choice 3:** Make the book voluntary.
- **Response:** Voluntary entry is a soft door. Many will pass.
- **Effects:** Church +5, Health +3

---

### Encounter #46 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Those who argued with priests were barred from the monastery kitchen. They are hungry.

**Choice 1:** Feed all regardless of faith.
- **Response:** This is the mercy I hoped to hear.
- **Effects:** Church -8, Health +15, Food -10

**Choice 2:** Feed only the faithful.
- **Response:** Then soup becomes a test, not salvation.
- **Effects:** Church +12, Health -10, Food -5

**Choice 3:** Create a royal kitchen apart from the monastery.
- **Response:** Then the hungry need not choose between bread and conscience.
- **Effects:** Treasury -10, Health +15, Food -10

---

### Encounter #47 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some monasteries owe the treasury for old supplies. Malrik asks to forgive the debts in faith's name.

**Choice 1:** Forgive the debts.
- **Response:** Faith loves forgiveness. The treasury does not.
- **Effects:** Church +15, Treasury -15

**Choice 2:** Demand payment.
- **Response:** Debt is holier than prayer if recorded well.
- **Effects:** Church -12, Treasury +15

**Choice 3:** Take payment in grain.
- **Response:** Let their penance be edible.
- **Effects:** Church -5, Food +12

---

### Encounter #48 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests ask to stop executing deserters. Every soldier can repent, they say.

**Choice 1:** Stop executing deserters.
- **Response:** Mercy in the barracks smells of mutiny.
- **Effects:** Church +10, Army -15, Health +5

**Choice 2:** Continue executions.
- **Response:** Order holds. Souls can catch up later.
- **Effects:** Church -10, Army +12, Health -5

**Choice 3:** Replace execution with hard service.
- **Response:** A living coward with a shovel beats a dead one.
- **Effects:** Church +5, Army +5, Health -3

---

### Encounter #49 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The sick sleep inside the temple hoping for miracles. Warm air and crowding spread disease.

**Choice 1:** Move the sick to infirmaries.
- **Response:** They will rage. But survive more often.
- **Effects:** Church -10, Health +18

**Choice 2:** Open temple infirmaries.
- **Response:** If the temple heals, let it learn to scrub floors.
- **Effects:** Church +8, Treasury -10, Health +15

**Choice 3:** Leave things as they are.
- **Response:** Then we will all need a miracle.
- **Effects:** Church +8, Health -18

---

### Encounter #50 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** During the fast fish costs more than meat. Merchants pray to the fast louder than priests.

**Choice 1:** Cap fish prices.
- **Response:** The fast grows less luxurious for traders.
- **Effects:** Church +5, Treasury -5, Health +8

**Choice 2:** Do not interfere.
- **Response:** Merchants stay fed. People fast holily.
- **Effects:** Treasury +10, Health -8

**Choice 3:** Give salted fish from stores.
- **Response:** Salty mercy. Wash it down if the water is clean.
- **Effects:** Church +5, Health +12, Food -12

---

### Encounter #51 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Signs on the walls: 'A king without blessing is no king.' This is no longer a whisper.

**Choice 1:** Erase signs and arrest the writers.
- **Response:** Walls grow clean. People grow careful.
- **Effects:** Church -8, Army +10, Health -5

**Choice 2:** Answer with a public speech.
- **Response:** Words against graffiti. Sometimes it works.
- **Effects:** Treasury -5, Health +8

**Choice 3:** Ask the church to condemn the signs.
- **Response:** If the temple speaks, walls fall silent faster.
- **Effects:** Church +5, Treasury -5, Health +5

---

### Encounter #52 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** They say the former king cursed the throne before death. The church can dispel the rumor. Or confirm it.

**Choice 1:** Ask the church to dispel the rumor.
- **Response:** Curses fear candles, especially paid ones.
- **Effects:** Church +10, Treasury -8, Health +8

**Choice 2:** Forbid talk of the curse.
- **Response:** A ban is a poor lid on a boiling pot.
- **Effects:** Army +8, Health -8

**Choice 3:** Mock the rumor publicly.
- **Response:** Laughter cures fear. Not always faith.
- **Effects:** Church -5, Health +5

---

### Encounter #53 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples demand thousands of candles. Give me a wax monopoly and half the profit is yours.

**Choice 1:** Grant the monopoly.
- **Response:** Candles will burn. So will coins.
- **Effects:** Church +5, Treasury +20, Health -5

**Choice 2:** Forbid the monopoly.
- **Response:** A free market in candles. How nobly dull.
- **Effects:** Treasury -5, Health +5

**Choice 3:** Set a royal price on wax.
- **Response:** You spoil profit but call it order.
- **Effects:** Church +3, Treasury +8, Health +3

---

### Encounter #54 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** I received a list of suspected heretics. Half the names in another's hand, half in a trembling one.

**Choice 1:** Begin arrests.
- **Response:** The list grows shorter. Fear grows longer.
- **Effects:** Church +15, Army +8, Health -15

**Choice 2:** Verify the list.
- **Response:** A rare night when paper outlives the axe.
- **Effects:** Church -5, Treasury -5, Health +8

**Choice 3:** Burn the list.
- **Response:** Fire works for me today.
- **Effects:** Church -15, Health +12

---

### Encounter #55 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some sick stopped buying remedies. A priest told them to pray and endure.

**Choice 1:** Order temples not to hinder healing.
- **Response:** Thank you. Disease is glad when you treat it instead of telling patients to endure.
- **Effects:** Church -10, Health +15

**Choice 2:** Support the church.
- **Response:** Then let prayers break the fever. I will watch.
- **Effects:** Church +12, Health -15

**Choice 3:** Allow both prayer and medicine.
- **Response:** Let them heal with everything at once. Sometimes desperation helps.
- **Effects:** Church +5, Treasury -5, Health +8

---

### Encounter #56 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your priests want to ride north to preach. My prince will call it meddling.

**Choice 1:** Allow the mission.
- **Response:** The north does not love foreign prayers. Especially from the south.
- **Effects:** Church +15, Army -10

**Choice 2:** Forbid the mission.
- **Response:** My prince will value your caution.
- **Effects:** Church -10, Army +5, Treasury +5

**Choice 3:** Send only healer-monks.
- **Response:** A healer passes where a preacher meets spears.
- **Effects:** Church +5, Treasury -5, Health +5

---

### Encounter #57 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** In the north they say that you are busy with the sick and with bread, not with the sword. I, of course, don't believe this.

**Choice 1:** Show a military parade.
- **Response:** Beautiful rows. The North loves to count spears.
- **Effects:** Army +15, Treasury -10

**Choice 2:** Show full barns.
- **Response:** Bread is also a weapon. Especially in winter.
- **Effects:** Treasury -3, Food -5

**Choice 3:** Give gold and send it home.
- **Response:** A generous gesture. Or dear request to remain silent.
- **Effects:** Treasury -15

**Choice 4:** What else do they say in the north?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** They say that the new king puts out fires inside the palace and therefore does not see the smoke on the border.

**Choice 1:** Strengthen the northern fortresses.
- **Response:** The north will see the stone. Stone is always clearer than words.
- **Effects:** Army +20, Treasury -20

**Choice 2:** Send scouts.
- **Response:** Fine. Eyes are cheaper than war.
- **Effects:** Army +8, Treasury -5

**Choice 3:** Don't give in to provocation.
- **Response:** Peace fit for a king. If there is power behind him.
- **Effects:** Army -5, Treasury +5

---

### Encounter #58 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A new coronation is needed. Not in the palace but in the temple. Then the people will see power was given not only by the sword.

**Choice 1:** Agree to a temple coronation.
- **Response:** Now your crown will shine with gold and godly fear.
- **Effects:** Church +25, Army -5, Treasury -20

**Choice 2:** Refuse.
- **Response:** Then the temple will be silent. But silence in the temple carries far.
- **Effects:** Church -25, Army +10

**Choice 3:** Hold a small rite without a new coronation.
- **Response:** Not full victory for the altar. But a step toward it.
- **Effects:** Church +10, Treasury -8

---

### Encounter #59 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** City poor are angry: pilgrims are fed while locals starve. Mercy became envy.

**Choice 1:** Feed city dwellers first.
- **Response:** Save the house before the guests. That is clear.
- **Effects:** Church -5, Health +12, Food -10

**Choice 2:** Feed all equally.
- **Response:** Hard, costly, right.
- **Effects:** Church +8, Health +15, Food -18

**Choice 3:** Feed only pilgrims at the temple.
- **Response:** Then the city will think faith came for others.
- **Effects:** Church +10, Health -12, Food -8

---

### Encounter #60 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temple shops pay no trade tax. Merchants demand fairness. I demand revenue.

**Choice 1:** Tax the shops.
- **Response:** Fairness finally brought coins.
- **Effects:** Church -12, Treasury +15

**Choice 2:** Leave shops tax-free.
- **Response:** Holiness is cheaper for the temple than the treasury again.
- **Effects:** Church +10, Treasury -10

**Choice 3:** Introduce a small tax.
- **Response:** A small sting. Perhaps the temple will not scream.
- **Effects:** Church -3, Treasury +8

---

### Encounter #61 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Young fanatics want to join the army. They are brave but ignore orders when they hear 'heresy'.

**Choice 1:** Accept them.
- **Response:** Bravery gained. Discipline in question.
- **Effects:** Church +8, Army +15, Health -8

**Choice 2:** Refuse the fanatics.
- **Response:** Better fewer soldiers than a crowd with swords and songs.
- **Effects:** Church -10, Army -5, Health +5

**Choice 3:** Form a separate church unit under army oversight.
- **Response:** I will keep them close. And far from decisions.
- **Effects:** Church +5, Army +10, Treasury -8

---

### Encounter #62 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some priests say women must not treat men. Today three refused my help.

**Choice 1:** Forbid such preaching.
- **Response:** Thank you. Disease does not choose healers by sex.
- **Effects:** Church -12, Health +15

**Choice 2:** Do not interfere.
- **Response:** Let pride bandage their wounds.
- **Effects:** Church +8, Health -12

**Choice 3:** Assign women healers only to women and children.
- **Response:** Conceding to prejudice rarely saves a life.
- **Effects:** Church +5, Health -5

---

### Encounter #63 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The monastery brews beer and sells it untaxed. Soldiers are pleased, the treasurer is not.

**Choice 1:** Tax monastery beer.
- **Response:** Beer grows costly. Prayers grow irritable.
- **Effects:** Church -8, Army -3, Treasury +12

**Choice 2:** Leave it untaxed.
- **Response:** Soldiers will drink to the church's health.
- **Effects:** Church +8, Army +5, Treasury -8

**Choice 3:** Take part of the beer for the army.
- **Response:** Holy beer in the barracks. I have seen that before brawls.
- **Effects:** Church -5, Army +10, Treasury +3

---

### Encounter #64 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A young priest says the king must listen only to the church. The crowd applauds.

**Choice 1:** Arrest the priest.
- **Response:** The crowd sees force. And remembers the arrested face.
- **Effects:** Church -15, Army +10, Health -5

**Choice 2:** Summon him to talk.
- **Response:** Softer. But he may take softness for weakness.
- **Effects:** Church +3, Army +3, Treasury -3

**Choice 3:** Ignore.
- **Response:** Unanswered words often grow.
- **Effects:** Church +5, Army -8

---

### Encounter #65 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik proposes a church council at court. Robed advisers will speak for people and gods.

**Choice 1:** Create the church council.
- **Response:** You let the altar into the throne room. Harder to remove.
- **Effects:** Church +20, Army -5, Treasury -8

**Choice 2:** Refuse.
- **Response:** Priests stay outside. And speak louder.
- **Effects:** Church -15, Army +5

**Choice 3:** Allow one church representative.
- **Response:** One robe is lighter than a council. Until it speaks for all.
- **Effects:** Church +8, Treasury -3

---

### Encounter #66 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church proposes a luxury tax. Money for the poor — through temple hands, of course.

**Choice 1:** Levy through the church.
- **Response:** The rich will hate us both. The poor will eat.
- **Effects:** Church +15, Treasury +5, Health +8

**Choice 2:** Levy through the crown.
- **Response:** You took mercy from church hands. Bold.
- **Effects:** Church -5, Treasury +15, Health +5

**Choice 3:** Refuse.
- **Response:** Luxury untouched. So is hunger.
- **Effects:** Church -8, Treasury +3, Health -5

---

### Encounter #67 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Beggars reach out at the altar during service. Rich parishioners complain they disturb prayer.

**Choice 1:** Leave beggars at the altar.
- **Response:** Prayer beside poverty is honester.
- **Effects:** Church -3, Health +10

**Choice 2:** Move beggars outside.
- **Response:** The temple grows prettier. And colder.
- **Effects:** Church +8, Health -8

**Choice 3:** Create a separate food handout after service.
- **Response:** Good. Mercy should not block prayer, but stay near.
- **Effects:** Church +5, Health +12, Food -10

---

### Encounter #68 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The temple wants silver for a new bell. They say its ring will guard the city. I would prefer walls.

**Choice 1:** Fund the bell.
- **Response:** The bell will ring. The treasury will empty.
- **Effects:** Church +15, Treasury -15, Health +5

**Choice 2:** Refuse.
- **Response:** Silence is cheaper than silver.
- **Effects:** Church -10, Treasury +5

**Choice 3:** Give bronze instead of silver.
- **Response:** A poorer bell, still louder than my displeasure.
- **Effects:** Church +5, Treasury -5

---

### Encounter #69 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** My prince has sent you barrels of salted fish. For free. Almost free. He asks to accept his friendship.

**Choice 1:** Accept the gift.
- **Response:** Wise. Fish doesn't like to wait, and neither does friendship.
- **Effects:** Treasury +3, Food +15

**Choice 2:** Accept and send gold in return.
- **Response:** Generous answer. The North loves equal gestures.
- **Effects:** Treasury -10, Food +15

**Choice 3:** Refuse.
- **Response:** Caution deserves respect. Hunger - no.
- **Effects:** Treasury +3, Food -5

**Choice 4:** What does 'almost free' mean?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** This means that today you accept fish, and tomorrow my prince will remind you that friends do not close bridges and ports.

**Choice 1:** Accept fish and friendship.
- **Response:** Then the north will remember the open doors.
- **Effects:** Army -3, Treasury +3, Food +15

**Choice 2:** Pay for fish as if it were a commodity.
- **Response:** This is how a gift becomes a transaction. Clean but cold.
- **Effects:** Treasury -8, Food +15

**Choice 3:** Refuse.
- **Response:** I will tell the prince that your pride is richer than your city.
- **Effects:** Treasury +3, Food -5

---

### Encounter #70 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik wants the army to fast before a campaign. A hungry soldier prays and fights worse.

**Choice 1:** Order the army to fast.
- **Response:** If the enemy strikes, we will throw prayers.
- **Effects:** Church +15, Army -15, Food +10

**Choice 2:** Exempt the army from fasting.
- **Response:** Thank you. A soldier with meat in his belly beats a holy skeleton.
- **Effects:** Church -10, Army +12, Food -5

**Choice 3:** Fast only for officers.
- **Response:** Officers suffer prettily. Rank and file eat.
- **Effects:** Church +5, Army -3, Food +5

---

### Encounter #71 — General Rudolf

**Character:** General Rudolf
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** If the army itself runs the kitchens, the soldiers will not go hungry.

**Choice 1:** Transfer the kitchens to the military.
- **Response:** The soldiers will feed the soldiers. It's more reliable this way.
- **Effects:** Army +15, Food -10

**Choice 2:** Leave the kitchens to the chefs.
- **Response:** Then let the cooks remember: a hungry soldier is a bad guest.
- **Effects:** Army -5, Food +5

**Choice 3:** Share control.
- **Response:** Compromise. I don't like them, but at least this one is edible.
- **Effects:** Army +5, Treasury -3, Food +5

**Choice 4:** Do you want to control the bread?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** I want to control what, without which a soldier ceases to be a soldier and becomes a hungry man with a spear.

**Choice 1:** Give the army separate warehouses.
- **Response:** That's enough. Until the warehouses are empty.
- **Effects:** Army +10, Food -8

**Choice 2:** Appoint a general caretaker.
- **Response:** If he's honest, it will work. If not, I'll find out.
- **Effects:** Army +5, Treasury -3, Food +5

**Choice 3:** Reduce army rations.
- **Response:** Then prepare not only the barns, but also the gallows.
- **Effects:** Army -20, Food +15

---

### Encounter #72 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims brought a new disease. Priests call it a trial. I call it plague.

**Choice 1:** Close the city to pilgrims.
- **Response:** It saves the city. And angers those bound for the shrine.
- **Effects:** Church -15, Health +20, Food +5

**Choice 2:** Screen pilgrims at the gates.
- **Response:** Slow, but better than letting sickness in with hymns.
- **Effects:** Church -3, Treasury -8, Health +12

**Choice 3:** Do not hinder pilgrimage.
- **Response:** Then the trial becomes mass.
- **Effects:** Church +12, Health -20

---

### Encounter #73 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Fish for the fast is sold by the temple. Half already smells like a sermon after rain.

**Choice 1:** Seize spoiled fish.
- **Response:** People lose supper but keep their guts.
- **Effects:** Church -3, Health +12, Food -5

**Choice 2:** Allow sale after salting.
- **Response:** Salt is not magic. Though merchants believe otherwise.
- **Effects:** Health -8, Food +8

**Choice 3:** Close the market by the temple.
- **Response:** The stench leaves. So does profit.
- **Effects:** Church -8, Treasury -8, Health +15

---

### Encounter #74 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** After the sermon a crowd marches on the palace. They carry candles, not weapons. But candles can burn doors.

**Choice 1:** Meet them with guards.
- **Response:** Candles die fast. Anger does not.
- **Effects:** Church -5, Army +10, Health -5

**Choice 2:** Go out to them yourself.
- **Response:** I will be near. If candles turn to torches, run first.
- **Effects:** Church +3, Army -5, Health +10

**Choice 3:** Give bread and admit representatives.
- **Response:** Bread cools hands better than water.
- **Effects:** Church +5, Health +12, Food -10

---

### Encounter #75 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** If the church names you pious, many will forget the coup. But the church gives no such gifts for free.

**Choice 1:** Buy a pious reputation.
- **Response:** Reputation bought. Now hide the receipt.
- **Effects:** Church +20, Treasury -20, Health +5

**Choice 2:** Earn it by deeds.
- **Response:** Slower. But stronger.
- **Effects:** Church +5, Treasury -10, Health +10

**Choice 3:** I need no church reputation.
- **Response:** Kings say that until the first sermon against them.
- **Effects:** Church -15, Army +5

---

### Encounter #76 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Bakers sell 'holy bread' triple the price. People buy from fear of disease.

**Choice 1:** Ban holy bread.
- **Response:** You forbade fear as merchandise. Bold.
- **Effects:** Church -8, Treasury -5, Health +10

**Choice 2:** Tax holy bread.
- **Response:** If people pay for fear, the crown gets a share.
- **Effects:** Church -3, Treasury +15, Health -5

**Choice 3:** Allow it but set a price.
- **Response:** Controlled superstition. Almost state policy.
- **Effects:** Treasury +5, Health +8

---

### Encounter #77 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church demands burning books found with a scholar. They corrupt souls, they say.

**Choice 1:** Burn the books.
- **Response:** Paper burns fast. Ideas burn differently.
- **Effects:** Church +15, Health -5

**Choice 2:** Hide books in the royal archive.
- **Response:** Secret fire can be deadlier than open flame.
- **Effects:** Church -10, Treasury -3, Health +3

**Choice 3:** Allow reading after review.
- **Response:** A rare book that lived to face judgment.
- **Effects:** Church -5, Treasury -5, Health +5

---

### Encounter #78 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests call my herbs witchcraft. Funny that their monks buy the same herbs at the back door.

**Choice 1:** Protect Sivil.
- **Response:** Thank you. I am almost moved. Almost.
- **Effects:** Church -12, Health +15

**Choice 2:** Ban her herbs.
- **Response:** Let monks cure coughs with psalms.
- **Effects:** Church +12, Health -15

**Choice 3:** Allow herbs through temple inspection.
- **Response:** The temple will sniff my pouches. What honor.
- **Effects:** Church +5, Treasury -3, Health +8

---

### Encounter #79 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Families from the north came to your gates. They flee war but pray to other gods.

**Choice 1:** Accept the refugees.
- **Response:** The north will remember your mercy. Your priests too.
- **Effects:** Church -15, Health +8, Food -15

**Choice 2:** Refuse them.
- **Response:** Cold mercy. Almost northern.
- **Effects:** Church +10, Health -8, Food +5

**Choice 3:** Accept if they live apart.
- **Response:** Half-shelter. Better than the road, worse than home.
- **Effects:** Church -5, Treasury -5, Food -8

---

## Late Pool A

_Days 30–89 (index 80 = Church unlock fixed encounter; no People stat)_

### Encounter #80 — High Priest Malrik

**Character:** High Priest Malrik
**Note:** Fixed late-pool encounter on day 30 (Church unlock). Choices 0 and 2 set nickname 'Saint'; choice 1 sets 'Demander'.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the people know your crown, but do not know whether it is blessed. Today the church must decide whether to name you king or usurper.

**Choice 1:** Ask the church for a blessing.
- **Response:** Humility is a fitting beginning for one who reached the throne through blood.
- **Effects:** Church +20, Treasury -10

**Choice 2:** Demand recognition of my authority.
- **Response:** Orders reach soldiers. They rise to heaven far less well.
- **Effects:** Church -15, Army +8

**Choice 3:** Offer the church an alliance.
- **Response:** An alliance of throne and altar may save the realm. Or smother it.
- **Effects:** Church +10, Treasury -5, Health +5

---

### Encounter #81 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** After the sermon, more hungry folk came to the monastery than usual. They believe the temple will feed them if the king cannot.

**Choice 1:** Send grain to the monastery.
- **Response:** Today faith will smell of bread.
- **Effects:** Church +8, Health +15, Food -15

**Choice 2:** Let the monastery feed them on its own.
- **Response:** We will try. But an empty pot does not become holy through prayer.
- **Effects:** Church -5, Health -8, Food +5

**Choice 3:** Send guards to disperse the line.
- **Response:** You can scatter the hungry. Hunger itself will stay.
- **Effects:** Church -10, Army +8, Health -10

---

### Encounter #82 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples collect tithe. The treasury collects taxes. Soon the people will see they pay twice.

**Choice 1:** Limit the church tithe.
- **Response:** The treasury is grateful. The altar will hiss.
- **Effects:** Church -20, Treasury +15, Health +5

**Choice 2:** Leave the tithe to the church.
- **Response:** Priests love it when their gold is called faith.
- **Effects:** Church +10, Treasury -10

**Choice 3:** Collect taxes together with the church.
- **Response:** Two hands in one pocket. Convenient, yet dangerous.
- **Effects:** Church +5, Treasury +10, Health -8

---

### Encounter #83 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik wants priests in the barracks. He says soldiers need souls. Soldiers need bread and steel.

**Choice 1:** Allow priests in the barracks.
- **Response:** If they start teaching mercy to soldiers, I will throw them out myself.
- **Effects:** Church +12, Army -5

**Choice 2:** Forbid them entry.
- **Response:** The barracks will remain barracks, not a hall of prayer.
- **Effects:** Church -12, Army +10

**Choice 3:** Let them in only before battles.
- **Response:** Before death, men listen to gods more willingly. Hard to argue with that.
- **Effects:** Church +5, Army +5

---

### Encounter #84 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People refuse to drink boiled water. They buy holy water instead. It comes from the same filthy well.

**Choice 1:** Ban the sale of holy water.
- **Response:** Thank you. Disease does not vanish when filth is blessed.
- **Effects:** Church -15, Health +15

**Choice 2:** Order temples to boil water before consecration.
- **Response:** Good. Let faith at least stop carrying infection.
- **Effects:** Church +5, Treasury -3, Health +12

**Choice 3:** Do not interfere with rites.
- **Response:** Then I will treat the consequences of your caution.
- **Effects:** Church +8, Health -15

---

### Encounter #85 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church has declared a fast. There will be less meat, which is fine. Yet soldiers already ask why the gods need their stew.

**Choice 1:** Fast for all, army included.
- **Response:** Turnips will be holy. Soldiers will be furious.
- **Effects:** Church +10, Army -15, Food +20

**Choice 2:** Fast only for the palace.
- **Response:** Now that is a sight: courtiers suffering almost like common folk.
- **Effects:** Church +5, Health +5, Food +5

**Choice 3:** Exempt the army from fasting.
- **Response:** Soldiers will be fed. Priests will be hungry for outrage.
- **Effects:** Church -8, Army +10, Food -10

---

### Encounter #86 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A crowd gathers by the main temple. They demand that the church declare whether you are a lawful king.

**Choice 1:** Post guards at the temple.
- **Response:** Spears may hold doors. Not questions.
- **Effects:** Church -5, Army +8, Health -5

**Choice 2:** Let the crowd hear the sermon.
- **Response:** Very well. But if words turn to sparks, I warned you.
- **Effects:** Church +8, Health +5

**Choice 3:** Distribute bread before the temple.
- **Response:** A fed man shouts less. Sometimes that is the best guard.
- **Effects:** Church +5, Health +10, Food -12

---

### Encounter #87 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A king who quarrels with the church gains an enemy in every temple. A king who submits to it loses his throne without battle.

**Choice 1:** Grant the church broader rights.
- **Response:** The altar will smile. The throne will stand a little lower.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2:** Bind the church by law.
- **Response:** A bold move. Such footsteps are often heard near a scaffold.
- **Effects:** Church -20, Army +5, Treasury +10

**Choice 3:** Keep the balance.
- **Response:** Balance is seldom elegant, but sometimes it survives longer.
- **Effects:** Church +5, Army +5, Treasury -5

---

### Encounter #88 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Since the church reopened, people buy candles, icons, and amulets. I can organize the trade and pay you a share.

**Choice 1:** Permit trade in holy wares.
- **Response:** Faith sells better than bread, and keeps longer.
- **Effects:** Church -8, Treasury +20

**Choice 2:** Forbid profit from faith.
- **Response:** Noble. Very unprofitable.
- **Effects:** Church +10, Treasury -10, Health +5

**Choice 3:** Allow only temple-controlled goods.
- **Response:** A monopoly of holiness. The church learns commerce quickly.
- **Effects:** Church +8, Treasury +8

---

### Encounter #89 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests brought a man who spat upon temple doors. They demand a public execution.

**Choice 1:** Execute him.
- **Response:** The square will receive its lesson again. I hope it is worth the blood.
- **Effects:** Church +15, Army +5, Health -10

**Choice 2:** Throw him in the dungeon.
- **Response:** A dungeon is quieter than a gallows, but priests prefer loud answers.
- **Effects:** Church -5, Army +5

**Choice 3:** Force a public apology.
- **Response:** A rare day when a tongue replaces a noose.
- **Effects:** Church +5, Health +5

---

### Encounter #90 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples burn incense against pestilence. It smells lovely. It heals nothing. I have better herbs.

**Choice 1:** Buy herbs from Sivil.
- **Response:** Herbs are rougher than prayers, yet they work more often.
- **Effects:** Church -5, Treasury -12, Health +15

**Choice 2:** Support the temple incense.
- **Response:** Then let disease choke on fragrance, if it can.
- **Effects:** Church +10, Treasury -5, Health -8

**Choice 3:** Mix herbs with church incense.
- **Response:** Now that is almost clever. It is almost insulting.
- **Effects:** Church +5, Treasury -10, Health +12

---

### Encounter #91 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** My prince asks whether your church now rules beside you. In the north, such kings are called soft.

**Choice 1:** Say the church is my ally.
- **Response:** The north will hear and decide you share your sword with prayer.
- **Effects:** Church +10, Army -5

**Choice 2:** Say the church bends to the throne.
- **Response:** Good. The north respects those who keep the altar by the throat.
- **Effects:** Church -10, Army +10

**Choice 3:** Refuse to answer the provocation.
- **Response:** Silence can be wise, but neighbors often hear fear in it.
- **Effects:** Army -3, Treasury +5

---

### Encounter #92 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church asks for the right to judge crimes against the faith. Without it, the temple remains toothless.

**Choice 1:** Grant the church judicial power.
- **Response:** Faith without judgment is a plea. Faith with judgment is law.
- **Effects:** Church +20, Army -5, Health -8

**Choice 2:** Keep judgment under the crown.
- **Response:** Then do not be surprised when sinners begin to love royal law.
- **Effects:** Church -15, Army +8

**Choice 3:** Allow church courts for heresy alone.
- **Response:** Not all we asked, but enough to begin.
- **Effects:** Church +8, Army +3, Health -3

---

### Encounter #93 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People fleeing tax collectors took refuge in a temple. They are hungry and terrified. Will you demand their surrender?

**Choice 1:** Demand their surrender.
- **Response:** Temple doors will open, but people will remember holiness did not protect them.
- **Effects:** Church -10, Army +5, Treasury +10

**Choice 2:** Leave them in sanctuary.
- **Response:** Thank you. At times, sanctuary matters more than statute.
- **Effects:** Church +10, Treasury -10, Health +5

**Choice 3:** Forgive debt for those who come out willingly.
- **Response:** Mercy brought out more souls than guards.
- **Effects:** Church +5, Treasury -5, Health +8

---

### Encounter #94 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik wishes to build a new cathedral. The treasury has a hole, yet the cathedral may calm the people.

**Choice 1:** Allocate funds for the cathedral.
- **Response:** Stone for the temple. Emptiness for the treasury.
- **Effects:** Church +20, Treasury -25, Health +5

**Choice 2:** Refuse.
- **Response:** The treasury thanks you. The temple will curse you with excellent acoustics.
- **Effects:** Church -15, Treasury +10

**Choice 3:** Build a small chapel instead of a cathedral.
- **Response:** Inexpensive piety. At times, even that sells.
- **Effects:** Church +8, Treasury -8

---

### Encounter #95 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests want to stitch church crosses on military banners. Soldiers serve the king, not the temple.

**Choice 1:** Add crosses to the banners.
- **Response:** Now soldiers carry not only your crest. A dangerous symbol.
- **Effects:** Church +15, Army -8

**Choice 2:** Forbid church signs on banners.
- **Response:** Good. In battle a soldier must see orders, not sermons.
- **Effects:** Church -12, Army +10

**Choice 3:** Add a small symbol on separate regimental ribbons.
- **Response:** Tolerable. Prayer stays at the edge where it belongs.
- **Effects:** Church +5, Army +3

---

### Encounter #96 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The sick queue for a saint's relics. They stand hours in rain instead of going to the infirmary.

**Choice 1:** Forbid the relic queue.
- **Response:** You will save bodies. Souls will rage.
- **Effects:** Church -15, Health +15

**Choice 2:** Place healers beside the relics.
- **Response:** Good. Let miracle work beside bandages.
- **Effects:** Church +5, Treasury -8, Health +15

**Choice 3:** Do not hinder the faithful.
- **Response:** Then rain and disease continue their service.
- **Effects:** Church +10, Health -12

---

### Encounter #97 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples want the best flour for holy bread. I could feed orphans with that flour.

**Choice 1:** Give the best flour to temples.
- **Response:** Holy bread will be soft. Orphans' porridge thin.
- **Effects:** Church +12, Food -10

**Choice 2:** Give the flour to orphans.
- **Response:** Children will thank you. Priests will complain longer.
- **Effects:** Church -8, Health +12, Food -8

**Choice 3:** Divide the flour.
- **Response:** Half holiness, half mercy. Edible.
- **Effects:** Church +5, Health +5, Food -8

---

### Encounter #98 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A priest refused temple gates to guards. Inside is church land, not royal.

**Choice 1:** Break in by force.
- **Response:** The door falls. And something greater with it.
- **Effects:** Church -20, Army +12, Health -5

**Choice 2:** Withdraw.
- **Response:** The guard will remember. Priests too.
- **Effects:** Church +10, Army -10

**Choice 3:** Demand talks at the gate.
- **Response:** Good. Let them talk for now, not break.
- **Effects:** Church +3, Army +3

---

### Encounter #99 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church's opening brought not peace but a new center of power. Every order is compared to a sermon.

**Choice 1:** Make the church official support of the throne.
- **Response:** You gained a holy shield. And a holy chain.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2:** Keep the church at distance.
- **Response:** Safer for the throne. Riskier for the people's soul.
- **Effects:** Church -10, Army +5, Treasury +5

**Choice 3:** Show unity without yielding power.
- **Response:** A tightrope walk. Do not look down.
- **Effects:** Church +8, Army +3, Treasury -3

---

### Encounter #100 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some priests want to preach about the blood of the coup this Sunday. I can forbid them. But forbidding in the temple comes at a price.

**Choice 1:** Forbid preaching about the coup.
- **Response:** Silence is bought. But it does not always keep long.
- **Effects:** Church +8, Treasury -10, Health +5

**Choice 2:** Let them speak the truth.
- **Response:** Truth in the temple rings louder than in the square.
- **Effects:** Church +5, Army -8, Health -5

**Choice 3:** Let them speak of peace, not blood.
- **Response:** Peace is a convenient truth. The church knows how to speak it.
- **Effects:** Church +10, Treasury -5

---

### Encounter #101 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** I wish to open a shelter at the monastery. Orphans will live, learn, and work. But we need bread and a little gold.

**Choice 1:** Support the shelter.
- **Response:** You gave the children not only a roof, but a tomorrow.
- **Effects:** Church +8, Treasury -12, Health +20, Food -8

**Choice 2:** Give grain only.
- **Response:** They will eat. For now that is already a miracle.
- **Effects:** Church +3, Health +10, Food -10

**Choice 3:** Refuse.
- **Response:** Then the street will be their teacher again.
- **Effects:** Church -5, Treasury +5, Health -10, Food +5

---

### Encounter #102 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church sells letters of absolution. Tax them and the treasury will revive.

**Choice 1:** Tax the letters.
- **Response:** Sin will finally work for the treasury.
- **Effects:** Church -10, Treasury +20

**Choice 2:** Ban the sale of letters.
- **Response:** Moral. But morality does not jingle.
- **Effects:** Church -15, Health +8

**Choice 3:** Do not interfere.
- **Response:** The temple will keep selling heaven without our share.
- **Effects:** Church +10, Treasury -5

---

### Encounter #103 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests say the northerners are godless. If they continue, soldiers will start waiting for war.

**Choice 1:** Allow such sermons.
- **Response:** Soldiers love an enemy they were blessed to hate.
- **Effects:** Church +15, Army +10, Treasury -5

**Choice 2:** Forbid war sermons.
- **Response:** Sensible. There is war enough without holy cries.
- **Effects:** Church -12, Army -5, Treasury +5

**Choice 3:** Allow only prayers for protection.
- **Response:** Defense sounds quieter than attack. Sometimes that helps.
- **Effects:** Church +5, Army +5

---

### Encounter #104 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Monks heal with herbs but keep no records of doses. Today a child nearly died from too strong a brew.

**Choice 1:** Require monastery healers to keep records.
- **Response:** Ink will save those prayers heal blindly.
- **Effects:** Church -5, Treasury -3, Health +15

**Choice 2:** Ban monastery healing.
- **Response:** It will stop mistakes. And some help too.
- **Effects:** Church -15, Health +10

**Choice 3:** Do not touch monastery traditions.
- **Response:** Traditions are fine until medicine is mistaken for poison.
- **Effects:** Church +8, Health -12

---

### Encounter #105 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims are coming to the capital. If unfed they collapse at the gates. If fed, our stores collapse.

**Choice 1:** Feed the pilgrims.
- **Response:** Holy folk eat like anyone else. Sometimes even more.
- **Effects:** Church +15, Health +10, Food -20

**Choice 2:** Admit only those who bring their own food.
- **Response:** The city keeps grain. Pilgrims keep resentment.
- **Effects:** Church -8, Health -3, Food +5

**Choice 3:** Organize cheap porridge.
- **Response:** Thin but honest. Good enough for pilgrims.
- **Effects:** Church +8, Treasury -5, Health +5, Food -10

---

### Encounter #106 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims enter the city. Among them one can hide spies, killers, and deserters.

**Choice 1:** Search all pilgrims.
- **Response:** Safer. But holiness will wait in line for inspection.
- **Effects:** Church -8, Army +10, Health -3

**Choice 2:** Let all pass unchecked.
- **Response:** Open gates are loved by more than the faithful.
- **Effects:** Church +10, Army -10

**Choice 3:** Search only armed men.
- **Response:** A compromise. Not perfect, but livable.
- **Effects:** Church +3, Army +5

---

### Encounter #107 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples demand return of lands seized by the former king. Land gives bread. Bread gives power.

**Choice 1:** Return the lands to the church.
- **Response:** The altar grows richer. The throne — more grateful or weaker.
- **Effects:** Church +20, Treasury -10, Food -15

**Choice 2:** Keep the lands for the crown.
- **Response:** The land stays yours. So do the curses.
- **Effects:** Church -20, Treasury +10, Food +10

**Choice 3:** Return only part.
- **Response:** Half a concession is often better than full war.
- **Effects:** Church +8, Treasury -5, Food -5

---

### Encounter #108 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims buy everything: bread, candles, water, rags, hope. Permit a temporary market by the temple.

**Choice 1:** Allow the market and take a toll.
- **Response:** Faith brings buyers. The crown takes the coins.
- **Effects:** Church -5, Treasury +20, Food -5

**Choice 2:** Allow the market without toll.
- **Response:** Rare generosity. Merchants will pray for you.
- **Effects:** Church +8, Treasury -5, Health +3

**Choice 3:** Ban the market by the temple.
- **Response:** Holiness preserved. Profit passed by.
- **Effects:** Church +5, Treasury -10, Food +5

---

### Encounter #109 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some prisoners suddenly grew very pious. They ask to replace execution with monastery penance.

**Choice 1:** Allow penance instead of execution.
- **Response:** The monastery gets sinners. I get a free day.
- **Effects:** Church +12, Army -8, Health +8

**Choice 2:** Execute as sentenced.
- **Response:** Faith came late. The axe — on time.
- **Effects:** Church -5, Army +10, Health -5

**Choice 3:** Replace execution with labor at monasteries.
- **Response:** Sin will dig the earth. Almost poetic.
- **Effects:** Church +5, Army -3, Treasury +8

---

### Encounter #110 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The temple sells holy salve for sores. It holds fat, wax, and lies. My salves at least smell honest.

**Choice 1:** Ban holy salve.
- **Response:** Good sense beat fragrant lies.
- **Effects:** Church -12, Health +12

**Choice 2:** Allow both salves.
- **Response:** Let people choose between faith and stink. Amusing.
- **Effects:** Church +5, Treasury +5, Health -5

**Choice 3:** Inspect salves before sale.
- **Response:** Inspection is the swindler's foe. So almost medicine.
- **Effects:** Church -3, Treasury -5, Health +10

---

### Encounter #111 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Northerners in the capital ask to open their own temple. Your priests call it heresy.

**Choice 1:** Allow a northern temple.
- **Response:** The north will approve. Your priests will not.
- **Effects:** Church -20, Treasury +5, Health +5

**Choice 2:** Forbid it.
- **Response:** Then northerners will see your faith outweighs hospitality.
- **Effects:** Church +15, Army +3, Treasury -5

**Choice 3:** Allow private prayers without a temple.
- **Response:** Half-freedom. The north lives with it, but does not love it.
- **Effects:** Church -5, Treasury +3, Health +3

---

### Encounter #112 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Soldiers who shed blood on the night of the coup must confess. Otherwise sin stays on your army.

**Choice 1:** Require soldiers to confess.
- **Response:** Sin is named. Now it can be leashed.
- **Effects:** Church +15, Army -10, Health +5

**Choice 2:** Make confession voluntary only.
- **Response:** Voluntary cleansing is slower, but cleaner.
- **Effects:** Church +5, Army +3

**Choice 3:** Leave the army alone.
- **Response:** Then swords stay sharp. Souls stay dirty.
- **Effects:** Church -12, Army +10

---

### Encounter #113 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims sell their belongings for bread. Some already fall on the road to the temple.

**Choice 1:** Open a free kitchen.
- **Response:** The road to the temple will be less deadly today.
- **Effects:** Church +10, Health +18, Food -18

**Choice 2:** Sell them cheap bread.
- **Response:** Not mercy, but help. Sometimes that is all there is.
- **Effects:** Treasury +5, Health +8, Food -8

**Choice 3:** Close the city to new pilgrims.
- **Response:** The gates keep bread. And lose hearts.
- **Effects:** Church -15, Health -5, Food +10

---

### Encounter #114 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** If the church declares giving to the crown a holy deed, people will bring coins themselves.

**Choice 1:** Ask the church to declare a collection.
- **Response:** When greed is blessed, it is called service.
- **Effects:** Church +8, Treasury +20, Health -5

**Choice 2:** Collect donations without the church.
- **Response:** People give less when heaven does not frighten them.
- **Effects:** Treasury +8, Health -3

**Choice 3:** Do not collect from the people.
- **Response:** Mercy robbed the treasury again.
- **Effects:** Treasury -10, Health +8

---

### Encounter #115 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests want prayer before every parade. It turns the army into a church procession.

**Choice 1:** Allow prayers before inspection.
- **Response:** Soldiers will stand longer. I hope enemies wait too.
- **Effects:** Church +12, Army -5

**Choice 2:** Forbid it.
- **Response:** Good. Inspection should sound of steps, not psalms.
- **Effects:** Church -10, Army +10

**Choice 3:** Prayer only before a campaign.
- **Response:** Before death people tolerate long speeches.
- **Effects:** Church +5, Army +5

---

### Encounter #116 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church forbids autopsies of those who died of disease. Without them we cannot learn what kills.

**Choice 1:** Allow secret autopsies.
- **Response:** Secret truth still heals better than open lies.
- **Effects:** Church -8, Health +15

**Choice 2:** Forbid autopsies.
- **Response:** Then disease keeps its secrets.
- **Effects:** Church +10, Health -15

**Choice 3:** Autopsy only bodies without kin.
- **Response:** Cruel but useful. Like much in medicine.
- **Effects:** Church -3, Health +8

---

### Encounter #117 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** In three days is the saint's feast. The temple asks a feast for the poor. The poor ask for feasts every day.

**Choice 1:** Allocate food for the feast.
- **Response:** The feast will be hearty. The next day ordinary.
- **Effects:** Church +12, Health +8, Food -15

**Choice 2:** Allocate half.
- **Response:** Half a miracle. Not bad for the kitchen.
- **Effects:** Church +5, Health +3, Food -8

**Choice 3:** Refuse.
- **Response:** Bread stays. Gratitude leaves.
- **Effects:** Church -10, Health -5, Food +5

---

### Encounter #118 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik is forming a temple guard. For now sticks and robes. Later, swords.

**Choice 1:** Forbid the temple guard.
- **Response:** Good. One law and one guard in the city.
- **Effects:** Church -15, Army +12

**Choice 2:** Allow the temple guard.
- **Response:** Then the temple grows teeth. Do not be surprised if it bites.
- **Effects:** Church +15, Army -10

**Choice 3:** Merge the temple guard into the royal guard.
- **Response:** Better in the ranks than against them.
- **Effects:** Church +5, Army +5, Treasury -5

---

### Encounter #119 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The people hear you in the square and Malrik in the temple. In the temple they weep. In the square they fear.

**Choice 1:** Speak to the people more often.
- **Response:** The throne must have a voice, or others speak for it.
- **Effects:** Church -3, Treasury -5, Health +10

**Choice 2:** Let the church speak for the crown.
- **Response:** Convenient. But one day you will hear your orders in a stranger's voice.
- **Effects:** Church +15, Army -5

**Choice 3:** Give bread after royal speeches.
- **Response:** Good. Words go down better with bread.
- **Effects:** Church +3, Health +12, Food -10

---

### Encounter #120 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church wants a book of faithful subjects. Those listed receive help first.

**Choice 1:** Allow the book of the faithful.
- **Response:** Ordered mercy beats chaotic mercy.
- **Effects:** Church +15, Health -8

**Choice 2:** Forbid dividing people by faith.
- **Response:** You want equality where people seek chosenness.
- **Effects:** Church -15, Health +10

**Choice 3:** Make the book voluntary.
- **Response:** Voluntary entry is a soft door. Many will pass.
- **Effects:** Church +5, Health +3

---

### Encounter #121 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Those who argued with priests were barred from the monastery kitchen. They are hungry.

**Choice 1:** Feed all regardless of faith.
- **Response:** This is the mercy I hoped to hear.
- **Effects:** Church -8, Health +15, Food -10

**Choice 2:** Feed only the faithful.
- **Response:** Then soup becomes a test, not salvation.
- **Effects:** Church +12, Health -10, Food -5

**Choice 3:** Create a royal kitchen apart from the monastery.
- **Response:** Then the hungry need not choose between bread and conscience.
- **Effects:** Treasury -10, Health +15, Food -10

---

### Encounter #122 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some monasteries owe the treasury for old supplies. Malrik asks to forgive the debts in faith's name.

**Choice 1:** Forgive the debts.
- **Response:** Faith loves forgiveness. The treasury does not.
- **Effects:** Church +15, Treasury -15

**Choice 2:** Demand payment.
- **Response:** Debt is holier than prayer if recorded well.
- **Effects:** Church -12, Treasury +15

**Choice 3:** Take payment in grain.
- **Response:** Let their penance be edible.
- **Effects:** Church -5, Food +12

---

### Encounter #123 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests ask to stop executing deserters. Every soldier can repent, they say.

**Choice 1:** Stop executing deserters.
- **Response:** Mercy in the barracks smells of mutiny.
- **Effects:** Church +10, Army -15, Health +5

**Choice 2:** Continue executions.
- **Response:** Order holds. Souls can catch up later.
- **Effects:** Church -10, Army +12, Health -5

**Choice 3:** Replace execution with hard service.
- **Response:** A living coward with a shovel beats a dead one.
- **Effects:** Church +5, Army +5, Health -3

---

### Encounter #124 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The sick sleep inside the temple hoping for miracles. Warm air and crowding spread disease.

**Choice 1:** Move the sick to infirmaries.
- **Response:** They will rage. But survive more often.
- **Effects:** Church -10, Health +18

**Choice 2:** Open temple infirmaries.
- **Response:** If the temple heals, let it learn to scrub floors.
- **Effects:** Church +8, Treasury -10, Health +15

**Choice 3:** Leave things as they are.
- **Response:** Then we will all need a miracle.
- **Effects:** Church +8, Health -18

---

### Encounter #125 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** During the fast fish costs more than meat. Merchants pray to the fast louder than priests.

**Choice 1:** Cap fish prices.
- **Response:** The fast grows less luxurious for traders.
- **Effects:** Church +5, Treasury -5, Health +8

**Choice 2:** Do not interfere.
- **Response:** Merchants stay fed. People fast holily.
- **Effects:** Treasury +10, Health -8

**Choice 3:** Give salted fish from stores.
- **Response:** Salty mercy. Wash it down if the water is clean.
- **Effects:** Church +5, Health +12, Food -12

---

### Encounter #126 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Signs on the walls: 'A king without blessing is no king.' This is no longer a whisper.

**Choice 1:** Erase signs and arrest the writers.
- **Response:** Walls grow clean. People grow careful.
- **Effects:** Church -8, Army +10, Health -5

**Choice 2:** Answer with a public speech.
- **Response:** Words against graffiti. Sometimes it works.
- **Effects:** Treasury -5, Health +8

**Choice 3:** Ask the church to condemn the signs.
- **Response:** If the temple speaks, walls fall silent faster.
- **Effects:** Church +5, Treasury -5, Health +5

---

### Encounter #127 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** They say the former king cursed the throne before death. The church can dispel the rumor. Or confirm it.

**Choice 1:** Ask the church to dispel the rumor.
- **Response:** Curses fear candles, especially paid ones.
- **Effects:** Church +10, Treasury -8, Health +8

**Choice 2:** Forbid talk of the curse.
- **Response:** A ban is a poor lid on a boiling pot.
- **Effects:** Army +8, Health -8

**Choice 3:** Mock the rumor publicly.
- **Response:** Laughter cures fear. Not always faith.
- **Effects:** Church -5, Health +5

---

### Encounter #128 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples demand thousands of candles. Give me a wax monopoly and half the profit is yours.

**Choice 1:** Grant the monopoly.
- **Response:** Candles will burn. So will coins.
- **Effects:** Church +5, Treasury +20, Health -5

**Choice 2:** Forbid the monopoly.
- **Response:** A free market in candles. How nobly dull.
- **Effects:** Treasury -5, Health +5

**Choice 3:** Set a royal price on wax.
- **Response:** You spoil profit but call it order.
- **Effects:** Church +3, Treasury +8, Health +3

---

### Encounter #129 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** I received a list of suspected heretics. Half the names in another's hand, half in a trembling one.

**Choice 1:** Begin arrests.
- **Response:** The list grows shorter. Fear grows longer.
- **Effects:** Church +15, Army +8, Health -15

**Choice 2:** Verify the list.
- **Response:** A rare night when paper outlives the axe.
- **Effects:** Church -5, Treasury -5, Health +8

**Choice 3:** Burn the list.
- **Response:** Fire works for me today.
- **Effects:** Church -15, Health +12

---

### Encounter #130 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some sick stopped buying remedies. A priest told them to pray and endure.

**Choice 1:** Order temples not to hinder healing.
- **Response:** Thank you. Disease is glad when you treat it instead of telling patients to endure.
- **Effects:** Church -10, Health +15

**Choice 2:** Support the church.
- **Response:** Then let prayers break the fever. I will watch.
- **Effects:** Church +12, Health -15

**Choice 3:** Allow both prayer and medicine.
- **Response:** Let them heal with everything at once. Sometimes desperation helps.
- **Effects:** Church +5, Treasury -5, Health +8

---

### Encounter #131 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your priests want to ride north to preach. My prince will call it meddling.

**Choice 1:** Allow the mission.
- **Response:** The north does not love foreign prayers. Especially from the south.
- **Effects:** Church +15, Army -10

**Choice 2:** Forbid the mission.
- **Response:** My prince will value your caution.
- **Effects:** Church -10, Army +5, Treasury +5

**Choice 3:** Send only healer-monks.
- **Response:** A healer passes where a preacher meets spears.
- **Effects:** Church +5, Treasury -5, Health +5

---

### Encounter #132 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A new coronation is needed. Not in the palace but in the temple. Then the people will see power was given not only by the sword.

**Choice 1:** Agree to a temple coronation.
- **Response:** Now your crown will shine with gold and godly fear.
- **Effects:** Church +25, Army -5, Treasury -20

**Choice 2:** Refuse.
- **Response:** Then the temple will be silent. But silence in the temple carries far.
- **Effects:** Church -25, Army +10

**Choice 3:** Hold a small rite without a new coronation.
- **Response:** Not full victory for the altar. But a step toward it.
- **Effects:** Church +10, Treasury -8

---

### Encounter #133 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** City poor are angry: pilgrims are fed while locals starve. Mercy became envy.

**Choice 1:** Feed city dwellers first.
- **Response:** Save the house before the guests. That is clear.
- **Effects:** Church -5, Health +12, Food -10

**Choice 2:** Feed all equally.
- **Response:** Hard, costly, right.
- **Effects:** Church +8, Health +15, Food -18

**Choice 3:** Feed only pilgrims at the temple.
- **Response:** Then the city will think faith came for others.
- **Effects:** Church +10, Health -12, Food -8

---

### Encounter #134 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temple shops pay no trade tax. Merchants demand fairness. I demand revenue.

**Choice 1:** Tax the shops.
- **Response:** Fairness finally brought coins.
- **Effects:** Church -12, Treasury +15

**Choice 2:** Leave shops tax-free.
- **Response:** Holiness is cheaper for the temple than the treasury again.
- **Effects:** Church +10, Treasury -10

**Choice 3:** Introduce a small tax.
- **Response:** A small sting. Perhaps the temple will not scream.
- **Effects:** Church -3, Treasury +8

---

### Encounter #135 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Young fanatics want to join the army. They are brave but ignore orders when they hear 'heresy'.

**Choice 1:** Accept them.
- **Response:** Bravery gained. Discipline in question.
- **Effects:** Church +8, Army +15, Health -8

**Choice 2:** Refuse the fanatics.
- **Response:** Better fewer soldiers than a crowd with swords and songs.
- **Effects:** Church -10, Army -5, Health +5

**Choice 3:** Form a separate church unit under army oversight.
- **Response:** I will keep them close. And far from decisions.
- **Effects:** Church +5, Army +10, Treasury -8

---

### Encounter #136 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some priests say women must not treat men. Today three refused my help.

**Choice 1:** Forbid such preaching.
- **Response:** Thank you. Disease does not choose healers by sex.
- **Effects:** Church -12, Health +15

**Choice 2:** Do not interfere.
- **Response:** Let pride bandage their wounds.
- **Effects:** Church +8, Health -12

**Choice 3:** Assign women healers only to women and children.
- **Response:** Conceding to prejudice rarely saves a life.
- **Effects:** Church +5, Health -5

---

### Encounter #137 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The monastery brews beer and sells it untaxed. Soldiers are pleased, the treasurer is not.

**Choice 1:** Tax monastery beer.
- **Response:** Beer grows costly. Prayers grow irritable.
- **Effects:** Church -8, Army -3, Treasury +12

**Choice 2:** Leave it untaxed.
- **Response:** Soldiers will drink to the church's health.
- **Effects:** Church +8, Army +5, Treasury -8

**Choice 3:** Take part of the beer for the army.
- **Response:** Holy beer in the barracks. I have seen that before brawls.
- **Effects:** Church -5, Army +10, Treasury +3

---

### Encounter #138 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A young priest says the king must listen only to the church. The crowd applauds.

**Choice 1:** Arrest the priest.
- **Response:** The crowd sees force. And remembers the arrested face.
- **Effects:** Church -15, Army +10, Health -5

**Choice 2:** Summon him to talk.
- **Response:** Softer. But he may take softness for weakness.
- **Effects:** Church +3, Army +3, Treasury -3

**Choice 3:** Ignore.
- **Response:** Unanswered words often grow.
- **Effects:** Church +5, Army -8

---

### Encounter #139 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik proposes a church council at court. Robed advisers will speak for people and gods.

**Choice 1:** Create the church council.
- **Response:** You let the altar into the throne room. Harder to remove.
- **Effects:** Church +20, Army -5, Treasury -8

**Choice 2:** Refuse.
- **Response:** Priests stay outside. And speak louder.
- **Effects:** Church -15, Army +5

**Choice 3:** Allow one church representative.
- **Response:** One robe is lighter than a council. Until it speaks for all.
- **Effects:** Church +8, Treasury -3

---

### Encounter #140 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church proposes a luxury tax. Money for the poor — through temple hands, of course.

**Choice 1:** Levy through the church.
- **Response:** The rich will hate us both. The poor will eat.
- **Effects:** Church +15, Treasury +5, Health +8

**Choice 2:** Levy through the crown.
- **Response:** You took mercy from church hands. Bold.
- **Effects:** Church -5, Treasury +15, Health +5

**Choice 3:** Refuse.
- **Response:** Luxury untouched. So is hunger.
- **Effects:** Church -8, Treasury +3, Health -5

---

### Encounter #141 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Beggars reach out at the altar during service. Rich parishioners complain they disturb prayer.

**Choice 1:** Leave beggars at the altar.
- **Response:** Prayer beside poverty is honester.
- **Effects:** Church -3, Health +10

**Choice 2:** Move beggars outside.
- **Response:** The temple grows prettier. And colder.
- **Effects:** Church +8, Health -8

**Choice 3:** Create a separate food handout after service.
- **Response:** Good. Mercy should not block prayer, but stay near.
- **Effects:** Church +5, Health +12, Food -10

---

### Encounter #142 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The temple wants silver for a new bell. They say its ring will guard the city. I would prefer walls.

**Choice 1:** Fund the bell.
- **Response:** The bell will ring. The treasury will empty.
- **Effects:** Church +15, Treasury -15, Health +5

**Choice 2:** Refuse.
- **Response:** Silence is cheaper than silver.
- **Effects:** Church -10, Treasury +5

**Choice 3:** Give bronze instead of silver.
- **Response:** A poorer bell, still louder than my displeasure.
- **Effects:** Church +5, Treasury -5

---

### Encounter #143 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik wants the army to fast before a campaign. A hungry soldier prays and fights worse.

**Choice 1:** Order the army to fast.
- **Response:** If the enemy strikes, we will throw prayers.
- **Effects:** Church +15, Army -15, Food +10

**Choice 2:** Exempt the army from fasting.
- **Response:** Thank you. A soldier with meat in his belly beats a holy skeleton.
- **Effects:** Church -10, Army +12, Food -5

**Choice 3:** Fast only for officers.
- **Response:** Officers suffer prettily. Rank and file eat.
- **Effects:** Church +5, Army -3, Food +5

---

### Encounter #144 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Pilgrims brought a new disease. Priests call it a trial. I call it plague.

**Choice 1:** Close the city to pilgrims.
- **Response:** It saves the city. And angers those bound for the shrine.
- **Effects:** Church -15, Health +20, Food +5

**Choice 2:** Screen pilgrims at the gates.
- **Response:** Slow, but better than letting sickness in with hymns.
- **Effects:** Church -3, Treasury -8, Health +12

**Choice 3:** Do not hinder pilgrimage.
- **Response:** Then the trial becomes mass.
- **Effects:** Church +12, Health -20

---

### Encounter #145 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Fish for the fast is sold by the temple. Half already smells like a sermon after rain.

**Choice 1:** Seize spoiled fish.
- **Response:** People lose supper but keep their guts.
- **Effects:** Church -3, Health +12, Food -5

**Choice 2:** Allow sale after salting.
- **Response:** Salt is not magic. Though merchants believe otherwise.
- **Effects:** Health -8, Food +8

**Choice 3:** Close the market by the temple.
- **Response:** The stench leaves. So does profit.
- **Effects:** Church -8, Treasury -8, Health +15

---

### Encounter #146 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** After the sermon a crowd marches on the palace. They carry candles, not weapons. But candles can burn doors.

**Choice 1:** Meet them with guards.
- **Response:** Candles die fast. Anger does not.
- **Effects:** Church -5, Army +10, Health -5

**Choice 2:** Go out to them yourself.
- **Response:** I will be near. If candles turn to torches, run first.
- **Effects:** Church +3, Army -5, Health +10

**Choice 3:** Give bread and admit representatives.
- **Response:** Bread cools hands better than water.
- **Effects:** Church +5, Health +12, Food -10

---

### Encounter #147 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** If the church names you pious, many will forget the coup. But the church gives no such gifts for free.

**Choice 1:** Buy a pious reputation.
- **Response:** Reputation bought. Now hide the receipt.
- **Effects:** Church +20, Treasury -20, Health +5

**Choice 2:** Earn it by deeds.
- **Response:** Slower. But stronger.
- **Effects:** Church +5, Treasury -10, Health +10

**Choice 3:** I need no church reputation.
- **Response:** Kings say that until the first sermon against them.
- **Effects:** Church -15, Army +5

---

### Encounter #148 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Bakers sell 'holy bread' triple the price. People buy from fear of disease.

**Choice 1:** Ban holy bread.
- **Response:** You forbade fear as merchandise. Bold.
- **Effects:** Church -8, Treasury -5, Health +10

**Choice 2:** Tax holy bread.
- **Response:** If people pay for fear, the crown gets a share.
- **Effects:** Church -3, Treasury +15, Health -5

**Choice 3:** Allow it but set a price.
- **Response:** Controlled superstition. Almost state policy.
- **Effects:** Treasury +5, Health +8

---

### Encounter #149 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church demands burning books found with a scholar. They corrupt souls, they say.

**Choice 1:** Burn the books.
- **Response:** Paper burns fast. Ideas burn differently.
- **Effects:** Church +15, Health -5

**Choice 2:** Hide books in the royal archive.
- **Response:** Secret fire can be deadlier than open flame.
- **Effects:** Church -10, Treasury -3, Health +3

**Choice 3:** Allow reading after review.
- **Response:** A rare book that lived to face judgment.
- **Effects:** Church -5, Treasury -5, Health +5

---

### Encounter #150 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests call my herbs witchcraft. Funny that their monks buy the same herbs at the back door.

**Choice 1:** Protect Sivil.
- **Response:** Thank you. I am almost moved. Almost.
- **Effects:** Church -12, Health +15

**Choice 2:** Ban her herbs.
- **Response:** Let monks cure coughs with psalms.
- **Effects:** Church +12, Health -15

**Choice 3:** Allow herbs through temple inspection.
- **Response:** The temple will sniff my pouches. What honor.
- **Effects:** Church +5, Treasury -3, Health +8

---

### Encounter #151 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Families from the north came to your gates. They flee war but pray to other gods.

**Choice 1:** Accept the refugees.
- **Response:** The north will remember your mercy. Your priests too.
- **Effects:** Church -15, Health +8, Food -15

**Choice 2:** Refuse them.
- **Response:** Cold mercy. Almost northern.
- **Effects:** Church +10, Health -8, Food +5

**Choice 3:** Accept if they live apart.
- **Response:** Half-shelter. Better than the road, worse than home.
- **Effects:** Church -5, Treasury -5, Food -8

---

### Encounter #152 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Foreign gods are worshipped in the city. Allow it and heresy moves from cellars to the market.

**Choice 1:** Forbid foreign rites.
- **Response:** Purity of faith needs a firm hand.
- **Effects:** Church +20, Army +5, Health -10

**Choice 2:** Allow private rites.
- **Response:** Quiet heresy is still heresy. But quiet.
- **Effects:** Church -8, Health +8

**Choice 3:** Do not interfere.
- **Response:** Tolerance enters as a guest and stays as host.
- **Effects:** Church -15, Treasury +5, Health +5

---

### Encounter #153 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A village accused a woman of witchcraft. Her house burned without trial. Children sleep on ash.

**Choice 1:** Punish the guilty.
- **Response:** Justice was late, but came.
- **Effects:** Church -10, Army +5, Health +10

**Choice 2:** Help the children and leave the village.
- **Response:** Softly. Sometimes softness saves more than punishment.
- **Effects:** Treasury -8, Health +12, Food -5

**Choice 3:** Do not interfere.
- **Response:** Then ash becomes law.
- **Effects:** Church +5, Health -12

---

### Encounter #154 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Print simple prayer books cheaply and the people stay busy with faith and the treasury with income.

**Choice 1:** Print prayer books.
- **Response:** Fine. Paper that brings faith and coins.
- **Effects:** Church +10, Treasury +12, Health +3

**Choice 2:** Give them free.
- **Response:** Free faith. A costly idea.
- **Effects:** Church +12, Treasury -10, Health +5

**Choice 3:** Spend no paper on prayers.
- **Response:** Paper stays for taxes. A steadier genre.
- **Effects:** Church -8, Treasury +5

---

### Encounter #155 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A priest told soldiers not to touch fugitives in sanctuary. It undermines command.

**Choice 1:** Support the priest.
- **Response:** Then soldiers will look to the altar before every order.
- **Effects:** Church +12, Army -12

**Choice 2:** Support the army.
- **Response:** Good. Orders from above, not from the side.
- **Effects:** Church -12, Army +12

**Choice 3:** Sanctuary for three days only.
- **Response:** Three days is tolerable. On the fourth I take the fugitive myself.
- **Effects:** Church +5, Army +5, Treasury -3

---

### Encounter #156 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests oppose new graves outside the walls. The ground is unconsecrated. The old cemetery is full.

**Choice 1:** Consecrate new ground and bury there.
- **Response:** At last sense and faith do not fight.
- **Effects:** Church +5, Treasury -5, Health +15

**Choice 2:** Bury outside without consecration.
- **Response:** The dead need earth. The living need safety.
- **Effects:** Church -12, Health +12

**Choice 3:** Keep using the old cemetery.
- **Response:** Then the old graveyard returns disease to us.
- **Effects:** Church +8, Health -15

---

### Encounter #157 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Temples open kitchens but cook poorly. If people poison themselves on holy stew, they will blame you.

**Choice 1:** Send palace cooks to train temples.
- **Response:** I will teach them not to kill with soup.
- **Effects:** Church +5, Treasury -8, Health +12

**Choice 2:** Close temple kitchens.
- **Response:** People hunger more but visit healers less.
- **Effects:** Church -12, Health +8, Food +5

**Choice 3:** Leave as is.
- **Response:** Then let god bless their pots. They will need it.
- **Effects:** Church +5, Health -10

---

### Encounter #158 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The temple bell rings at night. People wake, soldiers fret, the sick cannot sleep.

**Choice 1:** Forbid night ringing.
- **Response:** Night grows quiet. Priests louder by day.
- **Effects:** Church -10, Army +3, Health +10

**Choice 2:** Keep the ringing.
- **Response:** The city will pray instead of sleep.
- **Effects:** Church +10, Army -3, Health -8

**Choice 3:** Ring only in danger.
- **Response:** Good. The bell becomes signal, not torture.
- **Effects:** Church +3, Army +5, Health +8

---

### Encounter #159 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** If you stand too often beside Malrik, people stop seeing the king. They see a man in the priest's shadow.

**Choice 1:** Appear with Malrik more often.
- **Response:** Holiness will cover you. And hide you too.
- **Effects:** Church +15, Army -5, Treasury -5

**Choice 2:** Appear apart from the church.
- **Response:** The throne needs its own silhouette.
- **Effects:** Church -8, Army +5, Health +3

**Choice 3:** Appear together only on great feasts.
- **Response:** Rarity makes the alliance stronger. And safer.
- **Effects:** Church +5, Army +3

---

## Late Pool B

_Days 30–89 extension (no People stat)_

### Encounter #160 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** I propose every official swear loyalty not only to the crown but to the true faith.

**Choice 1:** Institute the oath of faith.
- **Response:** Power will kneel twice: before throne and altar.
- **Effects:** Church +20, Army -5, Treasury -5

**Choice 2:** Oath to crown alone.
- **Response:** The throne wants loyalty without soul. Dangerous thrift.
- **Effects:** Church -15, Army +8

**Choice 3:** Voluntary faith oath.
- **Response:** Voluntary piety often becomes mandatory on its own.
- **Effects:** Church +5, Health +3

---

### Encounter #161 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People confess petty thefts of food. Priests want to give names to guards.

**Choice 1:** Forbid passing names.
- **Response:** Confession stays refuge, not trap.
- **Effects:** Church +5, Army -5, Health +12

**Choice 2:** Give thieves' names.
- **Response:** Then people stop confessing. And start staying silent.
- **Effects:** Church -8, Army +8, Food +5

**Choice 3:** Report only dangerous criminals.
- **Response:** That resembles justice. It is rarely simple.
- **Effects:** Church +3, Army +5, Health +3

---

### Encounter #162 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Old temples need repair. If roofs fall, priests blame the crown. If you pay, the treasury falls.

**Choice 1:** Pay for repairs.
- **Response:** Roofs saved. My soul — not.
- **Effects:** Church +15, Treasury -18, Health +5

**Choice 2:** Repair only main temples.
- **Response:** Selective holiness. Cheaper than full.
- **Effects:** Church +8, Treasury -8

**Choice 3:** Let temples repair themselves.
- **Response:** Treasury dry. Temples perhaps not.
- **Effects:** Church -12, Treasury +5

---

### Encounter #163 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik wants relics with the army. If the enemy takes the caravan, it is disgrace.

**Choice 1:** Take relics with the army.
- **Response:** Soldiers march bolder. The train becomes a target.
- **Effects:** Church +15, Army +5, Treasury -8

**Choice 2:** Leave relics in the capital.
- **Response:** Right. War hauls enough already.
- **Effects:** Church -10, Army +5

**Choice 3:** Take copies of relics.
- **Response:** Fakes for courage. Strange, but easier to guard.
- **Effects:** Church +5, Treasury -3

---

### Encounter #164 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Priests say quarantine denies prayer. They demand quarantine houses opened.

**Choice 1:** Keep quarantine.
- **Response:** Thank you. Disease hates closed doors.
- **Effects:** Church -15, Health +20

**Choice 2:** Let priests into quarantine.
- **Response:** They enter to the sick. I hope they leave without plague.
- **Effects:** Church +8, Health -5

**Choice 3:** Open quarantine houses.
- **Response:** Then the city gets freedom of disease.
- **Effects:** Church +15, Health -25

---

### Encounter #165 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** If the church declares a winter fast, we need more fish and turnip. Less meat, but people will hate the cold more.

**Choice 1:** Stock for the fast.
- **Response:** Winter will be holy and smell of turnip.
- **Effects:** Church +8, Treasury -12, Food +10

**Choice 2:** Do not support the winter fast.
- **Response:** People eat better. Priests preach worse.
- **Effects:** Church -10, Health +5, Food -5

**Choice 3:** Fast only for the rich.
- **Response:** A rare miracle: the rich suffer first.
- **Effects:** Church +5, Health +8, Food +8

---

### Encounter #166 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A guard confessed bribes to a priest. The priest will not give his name.

**Choice 1:** Respect confession secrecy.
- **Response:** Guards learn the temple is above law. A dangerous lesson.
- **Effects:** Church +12, Army -8

**Choice 2:** Demand the name.
- **Response:** Good. Bribes hide poorly when confession is no shield.
- **Effects:** Church -12, Army +10

**Choice 3:** Amnesty for those who confess themselves.
- **Response:** A soft trap. Sometimes the best.
- **Effects:** Church +5, Army +5, Treasury +3

---

### Encounter #167 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church feeds the poor, heals the sick, judges sinners, and says who deserves the throne. What remains for the king?

**Choice 1:** Return some duties to the crown.
- **Response:** The throne visible again. The temple offended.
- **Effects:** Church -15, Army +8, Treasury -10

**Choice 2:** Leave the church strong.
- **Response:** Rule is easy — while the church wants what you want.
- **Effects:** Church +20, Army -10, Treasury +5

**Choice 3:** Divide duties in writing.
- **Response:** A fragile pact beats solid hatred.
- **Effects:** Church +5, Army +5, Treasury -5

---

### Encounter #168 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, some priests think you a temporary punishment of the gods. I can silence them.

**Choice 1:** Make them silent.
- **Response:** Silence bought with fear. Fear serves too.
- **Effects:** Church +10, Treasury -10, Health +5

**Choice 2:** Let them speak.
- **Response:** The temple becomes a market of opinions. Dangerous.
- **Effects:** Church -5, Health -10

**Choice 3:** Name them.
- **Response:** You would heal faith with the sword. Sometimes that scars the throne.
- **Effects:** Church -15, Army +5

---

### Encounter #169 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People ask a service for the former king's soul. Forbid it — cruel. Allow it — dangerous.

**Choice 1:** Allow the service.
- **Response:** The dead sometimes calm the living.
- **Effects:** Church +8, Army -5, Health +8

**Choice 2:** Forbid the service.
- **Response:** Memory will not vanish. It goes to the cellar.
- **Effects:** Church -8, Army +8, Health -10

**Choice 3:** Allow without the former king's name.
- **Response:** A compromise for those who fear even dead names.
- **Effects:** Church +3, Health +3

---

### Encounter #170 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** New coin may bear your profile or a church symbol. One strengthens the throne, the other people's trust.

**Choice 1:** The king's profile.
- **Response:** The coin will look at the people with your face.
- **Effects:** Church -8, Army +5, Treasury +5

**Choice 2:** A church symbol.
- **Response:** Holy coin spends as fast, but argued over less.
- **Effects:** Church +12, Army -5, Treasury +5

**Choice 3:** Both sides: crown and altar.
- **Response:** A two-faced coin. Honest for politics.
- **Effects:** Church +5, Army +5, Treasury -5

---

### Encounter #171 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik wants a priest on the war council. I do not discuss flanks with a man who believes in miracles.

**Choice 1:** Allow the priest on council.
- **Response:** Then let him pray not to interfere.
- **Effects:** Church +12, Army -10

**Choice 2:** Forbid it.
- **Response:** Good. The map stays a map, not an icon.
- **Effects:** Church -10, Army +10

**Choice 3:** Allow without a vote.
- **Response:** Let him listen. I still tolerate silence.
- **Effects:** Church +5, Army +3

---

### Encounter #172 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Women go to the temple to give birth for promised blessing. There are no clean linens.

**Choice 1:** Forbid births in the temple.
- **Response:** Children will be born in cleanliness, not candle smoke.
- **Effects:** Church -10, Health +15

**Choice 2:** Equip a temple birthing room.
- **Response:** If they go to the temple, let it wash its hands.
- **Effects:** Church +8, Treasury -10, Health +15

**Choice 3:** Do not interfere.
- **Response:** Blessing beside infection.
- **Effects:** Church +8, Health -12

---

### Encounter #173 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The temple wants the best wine for service. Soldiers want the same without service.

**Choice 1:** Give wine to the temple.
- **Response:** The holy cup full. Soldiers' mugs empty.
- **Effects:** Church +10, Army -5, Treasury -5

**Choice 2:** Give wine to the army.
- **Response:** Soldiers drink to your health. The temple against it.
- **Effects:** Church -8, Army +10

**Choice 3:** Dilute the wine and share.
- **Response:** All get less than wanted. So, fair.
- **Effects:** Church +5, Army +5

---

### Encounter #174 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** During service by the temple a man with a knife was caught. He says he meant to kill not you but Malrik.

**Choice 1:** Hand him to the church.
- **Response:** The temple tries an attack on the temple. Convenient for them.
- **Effects:** Church +12, Army -5

**Choice 2:** Try him in royal court.
- **Response:** Good. A knife in the capital is the crown's business.
- **Effects:** Church -8, Army +10

**Choice 3:** Interrogate in secret.
- **Response:** If he sought Malrik, we should learn who sent him.
- **Effects:** Church -3, Army +5, Treasury -5

---

### Encounter #175 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People now fear the royal sword and church curse. Together they hold order. Together they can break the realm.

**Choice 1:** Use both fears.
- **Response:** Order strong as a cage.
- **Effects:** Church +10, Army +10, Health -15

**Choice 2:** Soften royal punishments.
- **Response:** The throne less fearsome. Risk and hope.
- **Effects:** Church +3, Army -8, Health +10

**Choice 3:** Limit church curses.
- **Response:** You took thunder from the temple. Now await lightning.
- **Effects:** Church -12, Army +5, Health +8

---

### Encounter #176 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** If you keep quarreling with the temple, some priests may refuse you prayers. The people will hear that as verdict.

**Choice 1:** Yield to the temple.
- **Response:** Prayers continue. Peace costs less than schism.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2:** Threaten the temple.
- **Response:** You may frighten a priest. Not the faith behind him.
- **Effects:** Church -20, Army +12

**Choice 3:** Negotiate.
- **Response:** Talk is a thin bridge. We are still on it.
- **Effects:** Church +5, Treasury -5, Health +5

---

### Encounter #177 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** I opened monastery stores without Malrik's leave. People ate. Now I may be punished.

**Choice 1:** Protect Arvel.
- **Response:** Thank you. I feared not punishment but your order to close the doors.
- **Effects:** Church -12, Health +15, Food +5

**Choice 2:** Return him to church judgment.
- **Response:** I accept judgment. But the hungry will wait again.
- **Effects:** Church +12, Health -8

**Choice 3:** Make him return the grain.
- **Response:** Then I take bread from hands that already thanked us.
- **Effects:** Church +5, Health -15, Food +10

---

### Encounter #178 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Malrik hints a large gift will speed the church's official recognition of your rule.

**Choice 1:** Pay.
- **Response:** Congratulations. Blessing is a premium product.
- **Effects:** Church +25, Treasury -25

**Choice 2:** Refuse to pay.
- **Response:** Treasury saved. Heaven can wait.
- **Effects:** Church -15, Treasury +10

**Choice 3:** Offer grain instead of gold.
- **Response:** Holy recognition for sacks of grain. Almost honest.
- **Effects:** Church +12, Health +3, Food -15

---

### Encounter #179 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church no longer merely prays. It feeds, judges, heals, collects gold, and says who deserves the throne. Little remains before the ninetieth day. You must decide what it becomes.

**Choice 1:** The church will be the throne's pillar.
- **Response:** The throne gains a holy pillar. And holy dependence.
- **Effects:** Church +25, Army -10, Treasury -10, Health +5

**Choice 2:** The church will be subject to the crown.
- **Response:** You chose force. Now the temple may choose resistance.
- **Effects:** Church -25, Army +15, Treasury +10

**Choice 3:** Church and crown will share power.
- **Response:** Balance is reached. Who breaks it first remains to be seen.
- **Effects:** Church +10, Army +5, Treasury -5, Health +5

**Choice 4:** Weaken the church through royal aid to the people.
- **Response:** If the people eat from your hand, they kiss another less often.
- **Effects:** Church -10, Treasury -10, Health +20, Food -15

---

## People Pool

_Days 90+ (People stat unlock at day 89)_

### Encounter #180 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The people whisper the word 'usurper'. But if the church performs a rite of purification of the crown, the whisper will become a prayer.

**Choice 1:** Carry out an expensive ritual.
- **Response:** The gods love humility. And the people love to see the king bow his head.
- **Effects:** People +5, Treasury -15

**Choice 2:** Perform a modest ceremony.
- **Response:** Modesty is also a virtue. Although gold shines more convincingly.
- **Effects:** People +2, Treasury -5

**Choice 3:** The crown doesn't need prayers.
- **Response:** The throne without blessing stands high, but sways more.
- **Effects:** People -5, Treasury +5

**Choice 4:** What does the church want in return?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Little. Return the grain warehouses to the temple. We will feed souls and bodies, and you will get silence on the streets.

**Choice 1:** Return the warehouses to the temple.
- **Response:** Wise. Bread given to the temple is returned through prayer.
- **Effects:** People +10, Food -15

**Choice 2:** Give away only part of the grain.
- **Response:** Half mercy is still better than complete pride.
- **Effects:** People +5, Food -7

**Choice 3:** Refuse.
- **Response:** Then let the crown itself answer hunger prayers.
- **Effects:** People -8, Food +5

---

### Encounter #181 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, there are more cobwebs in the treasury than gold. A temporary tax on city gates can be introduced.

**Choice 1:** Implement the tax immediately.
- **Response:** Wonderful. The gate will finally begin to bring in more than a draft.
- **Effects:** People -5, Treasury +20

**Choice 2:** Introduce a tax only for merchants.
- **Response:** Merchants will complain. But they even complain about the sun if it shines freely.
- **Effects:** Treasury +10, Food -5

**Choice 3:** Don't touch the gate.
- **Response:** Free trade is a noble idea. It’s a pity that it doesn’t give out coins right away.
- **Effects:** Treasury -5, Food +10

**Choice 4:** Find another source of income.
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** You can sell some of the royal jewelry. Jewels are beautiful, but dead. At least the treasury is breathing.

**Choice 1:** Sell secretly.
- **Response:** No one will notice. Except for those who counted the stones on the crown.
- **Effects:** Treasury +15

**Choice 2:** Sell publicly, as a sacrifice for the sake of the people.
- **Response:** Good move. Poverty looks better when it is called a virtue.
- **Effects:** People +3, Treasury +12

**Choice 3:** Don't sell.
- **Response:** Greatness will remain intact. Treasury - no.
- **Effects:** No stat change

---

### Encounter #182 — Healer Mira

**Character:** Healer Mira
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** In the lower city there is fever and cough. It could be a cold, or it could be the beginning of a pestilence. We need to act now.

**Choice 1:** Close the block for quarantine.
- **Response:** Cruel, but reasonable. Sometimes a door saves more lives than a sword.
- **Effects:** People +20, Treasury -10, Food -5

**Choice 2:** Send healers and leave the gates open.
- **Response:** We'll do what we can. But disease loves the open road.
- **Effects:** People +8, Treasury -8

**Choice 3:** Don't cause panic.
- **Response:** Panic kills quickly. Illness is more patient.
- **Effects:** People -20, Treasury +5

**Choice 4:** How serious is it?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** So far three have died. If this is what I fear, in a week we will not be counting people, but streets.

**Choice 1:** Quarantine only infected streets.
- **Response:** This will give us time. And time is the best medicine after clean water.
- **Effects:** People +12, Treasury -5

**Choice 2:** Burn down infected houses.
- **Response:** Fire will stop the disease. But people will remember the smoke.
- **Effects:** People +20, Treasury -5, Food -5

**Choice 3:** Hide news.
- **Response:** Secrets don't cure fever. It's just waiting until it's too late.
- **Effects:** People -15, Treasury +5

---

### Encounter #183 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The nobles are waiting for the first royal feast. But if I set the table properly, the city barns will lose weight.

**Choice 1:** Have a luxurious feast.
- **Response:** The feast will be such that the guests will forget hunger. True, the city is not.
- **Effects:** Army +5, Treasury -10, Food -20

**Choice 2:** Have a modest feast.
- **Response:** A modest feast is when the nobles still eat, but complain more quietly.
- **Effects:** Treasury -4, Food -8

**Choice 3:** Call off the feast and give the food to the poor.
- **Response:** The bread below will be more appreciated than the peacock above.
- **Effects:** People +15, Food -10

**Choice 4:** Is it possible to deceive guests?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Yes. Cheap meat, expensive sauce, a lot of candles - and half of the guests will decide that they ate something rare.

**Choice 1:** Make a cheap feast disguised as a luxurious one.
- **Response:** I love it when royal wisdom smells of garlic and deceit.
- **Effects:** Treasury -3, Food -5

**Choice 2:** No, the feast must be real.
- **Response:** It will be real. And hunger after it too.
- **Effects:** Treasury -10, Food -20

**Choice 3:** Cancel the feast altogether.
- **Response:** Then I'll save the meat. In our time, this is almost high treason.
- **Effects:** People +5, Food +5

---

### Encounter #184 — Captain Varn

**Character:** Captain Varn
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** After the coup, the palace is full of strangers. I ask that the night watch be doubled. It's expensive, but you'll sleep longer.

**Choice 1:** Double the guards.
- **Response:** Fine. The night will become more expensive, but safer.
- **Effects:** Army +10, Treasury -10

**Choice 2:** Supply only proven soldiers.
- **Response:** Fewer people, more trust. I can work with this.
- **Effects:** Army +5, Treasury -5

**Choice 3:** Don't waste money on fears.
- **Response:** Then let's hope that fears don't waste their knives either.
- **Effects:** People -2, Army -5, Treasury +5

**Choice 4:** Who do you suspect?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Servants of the former king. Not everyone. But one with a key is enough for the door to become a grave.

**Choice 1:** Replace servants with soldiers.
- **Response:** The palace will become rougher, but the doors will obey.
- **Effects:** Army +10, Treasury -10, Food -5

**Choice 2:** Check on the servants secretly.
- **Response:** A quiet check catches more truth than a loud order.
- **Effects:** Army +3, Treasury -5

**Choice 3:** Leave them.
- **Response:** Then I will look into their hands. Especially when they bring you wine.
- **Effects:** Army -5, Treasury +3

---

### Encounter #185 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Everyone will remember the first decree of the new king. It should be simple. Grace, tax or sword?

**Choice 1:** Reduce the price of bread.
- **Response:** Bread is the quietest way to tell the people that the king still needs it.
- **Effects:** People +15, Treasury -5, Food -10

**Choice 2:** Increase tax collection.
- **Response:** The treasury will come to life. People may be the opposite.
- **Effects:** People -10, Treasury +20

**Choice 3:** Announce recruitment into the army.
- **Response:** There will be more swords. There are fewer hands in the fields.
- **Effects:** Army +15, Treasury -5, Food -5

**Choice 4:** Don't issue a decree yet.
- **Response:** Sometimes silence is wise. But in the early days of the throne, it is often mistaken for weakness.
- **Effects:** No stat change

---

### Encounter #186 — General Rudolf

**Character:** General Rudolf
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Six deserters were captured. They say that they fled not from fear, but from hunger. The army is watching what you do.

**Choice 1:** Execute them publicly.
- **Response:** Cruel. But tomorrow no one will run first.
- **Effects:** People -5, Army +15

**Choice 2:** Return them to duty after punishment.
- **Response:** They will limp, but serve. It's better than hanging.
- **Effects:** People -2, Army +5

**Choice 3:** Have mercy and feed.
- **Response:** Mercy is good at the hearth. In the barracks she smells of weakness.
- **Effects:** People +5, Army -10, Food -5

**Choice 4:** Why are soldiers starving?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because quartermasters steal. War always feeds rats - in barns and in uniforms.

**Choice 1:** Hang the quartermasters.
- **Response:** After this, grain will begin to be counted more honestly.
- **Effects:** Army +10, Food +5

**Choice 2:** Force them to return what they stole.
- **Response:** Fine. Let their greed at least feed the soldiers.
- **Effects:** Treasury +5, Food +10

**Choice 3:** Hide the scandal.
- **Response:** Hidden rot still smells. Just later.
- **Effects:** Army -5, Treasury +5

---

### Encounter #187 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People are sick not only with their bodies, but also with fear. Allow churches to hold night services. Crowds will come to pray.

**Choice 1:** Allow services.
- **Response:** People will leave with a prayer on their lips. Sometimes that's enough to get you through the night.
- **Effects:** People +5, Food -3

**Choice 2:** Ban large gatherings.
- **Response:** You save bodies. I hope the souls will wait.
- **Effects:** People +10, Treasury -3

**Choice 3:** Services are only in open areas.
- **Response:** The sky is also the vault of the temple. The gods will hear.
- **Effects:** People +8, Treasury -5

**Choice 4:** Let the church pay for security itself.
- **Response:** The church will pay. And it will remember that the king is counting candles.
- **Effects:** People +2, Treasury +5

---

### Encounter #188 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** You can issue a new coin with your face on it. If you add less silver, the treasury will benefit. People won't notice right away.

**Choice 1:** Mint an honest coin.
- **Response:** Expensive, but beautiful. Honesty always costs more than copper.
- **Effects:** People +5, Treasury -10

**Choice 2:** Dilute silver with copper.
- **Response:** The coin will become lighter. As does the conscience of those who spend it.
- **Effects:** People -8, Treasury +20

**Choice 3:** Set aside minting.
- **Response:** The old coins will continue to circulate. Along with the old memory.
- **Effects:** No stat change

**Choice 4:** Who will know about the fake?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Masters of the Mint. But silence is worth less than silver.

**Choice 1:** Pay the masters and dilute the coin.
- **Response:** Good deal. Bad coin. Great policy.
- **Effects:** People -8, Treasury +15

**Choice 2:** Don't take risks.
- **Response:** Caution rarely fills chests, but sometimes saves heads.
- **Effects:** Treasury -5

**Choice 3:** Arrest the masters.
- **Response:** Silence will become reliable. And very scared.
- **Effects:** People -5, Army +5, Treasury +10

---

### Encounter #189 — Healer Mira

**Character:** Healer Mira
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** You haven't slept for three nights. If you collapse, the palace will begin to share power without you. You need rest.

**Choice 1:** Cancel appointments for the day.
- **Response:** A living king is better than a busy dead one.
- **Effects:** People +3, Army -3

**Choice 2:** Continue working.
- **Response:** Then at least fall next to the chair to make it easier to lift you up.
- **Effects:** People -5, Treasury +5

**Choice 3:** Take a strengthening potion.
- **Response:** It will help. But don't confuse cheerfulness with healing.
- **Effects:** People +5, Treasury -5

**Choice 4:** What's in the potion?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Herbs, honey and a little something to get your heart pumping. After it comes weakness.

**Choice 1:** Drink anyway.
- **Response:** You bought a day of strength at the price of tomorrow's trembling.
- **Effects:** People -8, Treasury +5

**Choice 2:** Give up and go to bed.
- **Response:** Finally an order that doesn't harm the body.
- **Effects:** People +5, Treasury -3

**Choice 3:** Give the potion to officials and messengers.
- **Response:** They will run faster. And then they will fall together.
- **Effects:** People -5, Treasury +8

---

### Encounter #190 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Some of the grain in the western barn was covered with gray mold. If we throw it away, there will be less food. If we cook it stronger, maybe no one will die.

**Choice 1:** Throw away spoiled grain.
- **Response:** Sorry for the grain. But the dead eat even less.
- **Effects:** People +10, Food -15

**Choice 2:** Use it for soldiers' porridge.
- **Response:** The soldiers will notice. Especially those who run to the bucket.
- **Effects:** People -10, Army -5, Food +5

**Choice 3:** Mix with good things and give to the poor.
- **Response:** The poor are accustomed to the worst. But this does not mean that their stomachs are iron.
- **Effects:** People -15, Food +8

**Choice 4:** Can some be saved?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** A third can be dried. The rest is only suitable for rats, and even evil ones.

**Choice 1:** Save a third, throw the rest away.
- **Response:** Reasonable. Not generous, not stupid. Rare recipe.
- **Effects:** People +7, Food -8

**Choice 2:** Save everything and take risks.
- **Response:** Then I'll have it prepared next to the infirmary.
- **Effects:** People -10, Food +5

**Choice 3:** Throw everything away.
- **Response:** A clean barn is better than a full grave.
- **Effects:** People +10, Food -15

---

### Encounter #191 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** A crowd gathered at the palace gates. They are not armed, but they demand bread and an answer: who rules them now?

**Choice 1:** Go out to them in person.
- **Response:** A bold move. I'll put people close, but not too noticeable.
- **Effects:** People +10, Army -5

**Choice 2:** Distribute bread through the guards.
- **Response:** Bread speaks more simply than a king. Sometimes even more convincing.
- **Effects:** People +8, Food -10

**Choice 3:** Disperse the crowd.
- **Response:** It will be done. But bruises can also remember.
- **Effects:** People -15, Army +10

**Choice 4:** Say that the king is busy.
- **Response:** Then they will decide that you are not busy with them.
- **Effects:** People -8, Treasury +2

---

### Encounter #192 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The church can open its barns to the poor. But the decree should say that this was done out of our mercy.

**Choice 1:** Agree and praise the church.
- **Response:** Mercy loves witnesses. Today the whole city will become them.
- **Effects:** People +10, Food +10

**Choice 2:** Help must come in the name of the king.
- **Response:** The crown wants glory even for someone else's bread. Well, this is also hunger.
- **Effects:** People +5, Treasury -5, Food +5

**Choice 3:** Refuse church help.
- **Response:** Pride is rarely satisfying.
- **Effects:** People -10, Treasury +3, Food -5

**Choice 4:** Share the glory.
- **Response:** Let the people give thanks to both the throne and the altar. It's safer for everyone.
- **Effects:** People +7, Food +7

---

### Encounter #193 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** In the houses of executed supporters of the past king, silver, paintings, and horses remained. By law, everything can be taken away.

**Choice 1:** Take everything to the treasury.
- **Response:** The dead don't need luxury. Very lively treasury.
- **Effects:** People -5, Treasury +25

**Choice 2:** Take only weapons and coins.
- **Response:** Moderately. I'm almost upset at your decency.
- **Effects:** Army +5, Treasury +15

**Choice 3:** Leave some property to families.
- **Response:** Mercy is dear. But sometimes revenge is cheaper.
- **Effects:** People +8, Treasury +5

**Choice 4:** Do not touch the houses of the dead.
- **Response:** Nice gesture. The treasury will not appreciate it, but widows may.
- **Effects:** People +10, Treasury -5

---

### Encounter #194 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** In the city they drink from a canal where waste is dumped. If the water is not purified, the disease will return stronger.

**Choice 1:** Allocate money to clean wells.
- **Response:** Clean water will save more people than a dozen sermons and a hundred executions.
- **Effects:** People +25, Treasury -15

**Choice 2:** Make residents clean for free.
- **Response:** They will be angry. But at least be angry with the living.
- **Effects:** People +10, Army +3, Treasury -3

**Choice 3:** Don't spend any money yet.
- **Response:** Then the disease has already received your first gift.
- **Effects:** People -20, Treasury +8

**Choice 4:** Let the army help.
- **Response:** Soldiers with shovels are more useful than soldiers with clubs. They'll hate it though.
- **Effects:** People +15, Army -5, Treasury -5

---

### Encounter #195 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The army eats better than city children. I can dilute the soldiers' stew and send the grain to shelters.

**Choice 1:** Thin the stew.
- **Response:** The children will eat. The soldiers curse. A typical day in the kitchen.
- **Effects:** People +10, Army -10, Food +8

**Choice 2:** Don't touch the soldiers' rations.
- **Response:** The soldiers will be well fed. Shelters will smell like empty bowls.
- **Effects:** People -5, Army +8

**Choice 3:** Only dilute the officer's kitchen.
- **Response:** The officers will notice first. They always notice when they suffer, almost like humans.
- **Effects:** People +5, Army -3, Food +5

**Choice 4:** Will the soldiers notice?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Privates - not right away. Officers - after the first spoon. Their tongue is more spoiled than their conscience.

**Choice 1:** Take some of the officers' supplies.
- **Response:** Finally a dish that I enjoy cooking.
- **Effects:** People +5, Army -5, Food +8

**Choice 2:** Take from everyone equally.
- **Response:** Fair. This means that everyone will be unhappy.
- **Effects:** People +8, Army -10, Food +10

**Choice 3:** Leave everything as is.
- **Response:** A well-fed sword is better than a hungry one. But children don't eat swords.
- **Effects:** People -5, Army +5

---

### Encounter #196 — Captain Varn

**Character:** Captain Varn
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** After the coup, residents were left with a lot of weapons. If you collect them, it will become calmer. If not, every basement can become a fortress.

**Choice 1:** Collect all weapons.
- **Response:** The city will become quieter. Not necessarily calmer.
- **Effects:** People -10, Army +15

**Choice 2:** Allow weapons only to guilds and guards.
- **Response:** Compromise. Firm enough not to fall apart right away.
- **Effects:** Army +8, Treasury +3

**Choice 3:** Don't touch people.
- **Response:** They will appreciate the trust. Or they will use it.
- **Effects:** People +8, Army -10

**Choice 4:** Buy back weapons.
- **Response:** Coins instead of searches. Expensive, but with less shouting.
- **Effects:** People +5, Army +10, Treasury -15

---

### Encounter #197 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Some old ministers are ready to serve you. They are experienced, but their hands smell of the past throne.

**Choice 1:** Bring them back to the council.
- **Response:** The experience will return. Along with old habits.
- **Effects:** Army -5, Treasury +10

**Choice 2:** Leave only the most useful ones.
- **Response:** Fine. Old knives can be used if you hold them by the handle.
- **Effects:** Treasury +5

**Choice 3:** Expel everyone.
- **Response:** Clean table. Empty table. The difference will be noticeable tomorrow.
- **Effects:** Army +5, Treasury -10

**Choice 4:** Let them take a public oath.
- **Response:** Vows don't change hearts. But tongues are tied.
- **Effects:** People +3, Army +3, Treasury -3

---

### Encounter #198 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** We need new people. The villages are full of tough guys. The fields will wait if the throne falls.

**Choice 1:** Take recruits by force.
- **Response:** The army will grow quickly. Fields will miss the hands.
- **Effects:** People -10, Army +25, Food -20

**Choice 2:** Take volunteers for a fee.
- **Response:** Slower, but cleaner. The volunteer looks back less.
- **Effects:** Army +10, Treasury -10

**Choice 3:** Do not touch the villages until the harvest.
- **Response:** Bread defeated the sword. I hope the enemy likes to wait too.
- **Effects:** Army -10, Food +15

**Choice 4:** Take criminals instead of peasants.
- **Response:** Bad people sometimes make good shields.
- **Effects:** People -5, Army +8, Treasury -3

---

### Encounter #199 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** People will forgive a lot if the king bows his head to the gods. Not in front of people. Before the gods.

**Choice 1:** Repent for the blood of the coup.
- **Response:** Humility strengthens the soul. Although the soldiers love it less.
- **Effects:** People +10, Army -10

**Choice 2:** Say that blood was needed.
- **Response:** The sword will like your words. The altar will remain silent.
- **Effects:** People -8, Army +10

**Choice 3:** Let the temple make a speech on my behalf.
- **Response:** The Church knows how to speak where it is dangerous for the king.
- **Effects:** People +5, Treasury -5

**Choice 4:** Refuse to repent.
- **Response:** A proud neck looks good under a crown. And under the ax too.
- **Effects:** People -10, Army +5

---

### Encounter #200 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Doctors demand payment for work in the lower city. If we don't pay, they will leave to treat the rich.

**Choice 1:** Pay doctors in full.
- **Response:** Costly mercy. But living taxpayers are more useful than dead ones.
- **Effects:** People +20, Treasury -15

**Choice 2:** Pay half.
- **Response:** Half the pay is half the effort. Sometimes this is enough.
- **Effects:** People +8, Treasury -7

**Choice 3:** Order treatment for free.
- **Response:** Great for the treasury. Dangerous for patients.
- **Effects:** People -5, Army +5, Treasury +5

**Choice 4:** Allow patients to be charged.
- **Response:** The treasury will sigh. Poor people might stop.
- **Effects:** People -15, Treasury +3

---

### Encounter #201 — Healer Mira

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Bodies are still being found on the streets after the night of the coup. If they are not buried quickly, the city will become sick.

**Choice 1:** Organize a general funeral.
- **Response:** The dead don't care anymore. Alive - no.
- **Effects:** People +20, Treasury -10

**Choice 2:** Burn the bodies outside the city.
- **Response:** Fast and safe. But they will remember the smell.
- **Effects:** People +15, Army +3, Treasury -5

**Choice 3:** Let the families pick up the bodies themselves.
- **Response:** Families will suffer. The city is an infection.
- **Effects:** People -10, Treasury +5

**Choice 4:** Hide bodies in old pits.
- **Response:** The pits keep no secrets. They breed diseases.
- **Effects:** People -25, Treasury +10

---

### Encounter #202 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** If you distribute a little bread at the gate every day in the name of the king, people will begin to speak more softly. But bread doesn't appear out of thin air.

**Choice 1:** Distribute bread daily.
- **Response:** People will wait for you not with stones, but with bowls. This is better.
- **Effects:** People +20, Food -20

**Choice 2:** Distribute only to children and the sick.
- **Response:** Less bread, more meaning. Good order.
- **Effects:** People +15, Food -10

**Choice 3:** Distribute once, for show.
- **Response:** Enough for appearance. For hunger - no.
- **Effects:** People +5, Food -5

**Choice 4:** Don't feed the old king's supporters.
- **Response:** Hunger does not ask for whom the person shouted yesterday.
- **Effects:** People -15, Food +5

---

### Encounter #203 — Captain Varn

**Character:** Captain Varn
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** We caught a messenger with a letter to the north. The letter is encrypted. He says he is bringing family news.

**Choice 1:** Torture the messenger.
- **Response:** He will speak. The only question is whether it will be true.
- **Effects:** People -5, Army +8

**Choice 2:** Pay the clerks to do the decoding.
- **Response:** Ink is sometimes more honest than blood.
- **Effects:** Treasury -5

**Choice 3:** Let go, but follow up.
- **Response:** Fine. Sometimes it is better to follow the thread than to break it.
- **Effects:** Army +3, Treasury -3

**Choice 4:** What do you think of the letter?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Family news is not encrypted with military code. If this letter is about an aunt, the aunt commands the fortress.

**Choice 1:** Decipher the letter.
- **Response:** Reasonable. A dead messenger will not lead us to the sender.
- **Effects:** Army +5, Treasury -5

**Choice 2:** Execute the messenger and burn the letter.
- **Response:** The trail will disappear. Perhaps along with the answer.
- **Effects:** People -8, Army +10

**Choice 3:** Change the letter.
- **Response:** Dangerous game. But the enemy can open the door himself.
- **Effects:** Army +8, Treasury -5

---

### Encounter #204 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The city says you only rule because the general holds a sword at your back. We need to show who is the king here.

**Choice 1:** Review the army.
- **Response:** The swords shine convincingly. But they cast long shadows.
- **Effects:** Army +10, Treasury -5

**Choice 2:** Put a corrupt official on trial.
- **Response:** Fine. Justice is louder than a parade if you choose the right square.
- **Effects:** People +8, Treasury +5

**Choice 3:** Enter the market without armor.
- **Response:** Courage or recklessness. Sometimes people can't tell the difference.
- **Effects:** People +12, Army -5

**Choice 4:** Don't respond to rumors.
- **Response:** Rumors love empty space. You left the hall for them.
- **Effects:** Army -5, Treasury +3

---

### Encounter #205 — General Rudolf

**Character:** General Rudolf
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** The banners of the former king still hang in the barracks. The soldiers say it's a memory. I say it's doubt.

**Choice 1:** Burn the old banners.
- **Response:** The flame quickly teaches which color is now the main one.
- **Effects:** People -5, Army +15

**Choice 2:** Put them in the archive.
- **Response:** Soft. But at least they won't look at the soldiers anymore.
- **Effects:** People +5, Treasury -3

**Choice 3:** Leave them, but add my coat of arms.
- **Response:** Compromise. Soldiers like clarity more.
- **Effects:** Army +5, Treasury -5

**Choice 4:** Prohibit discussion of the former king.
- **Response:** Prohibition does not kill memory. But it makes memory speak in a whisper.
- **Effects:** People -8, Army +8

---

### Encounter #206 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the kingdom cannot be saved by everyone at once. In the first month you need to choose what is more important: bread, sword, treasury or people's lives.

**Choice 1:** First feed the city.
- **Response:** Bread is a silent ally. As long as it exists, people are still listening.
- **Effects:** People +10, Treasury -15, Food +20

**Choice 2:** First strengthen the army.
- **Response:** The sword will protect the throne. But it won't feed the city.
- **Effects:** Army +25, Treasury -15, Food -5

**Choice 3:** First fill the treasury.
- **Response:** Gold will give time. The question is who will survive this time.
- **Effects:** People -10, Treasury +25, Food -5

**Choice 4:** Stop the disease first.
- **Response:** Living subjects can still forgive. The dead only pursue the name.
- **Effects:** People +25, Treasury -15

**Choice 5:** Can you hold everything at once?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** You can try. But balance is not a gentle path. This is a rope over an abyss.

**Choice 1:** Distribute forces equally.
- **Response:** Careful choice. Not great, not disgraceful. Sometimes these are the ones who survive the winter.
- **Effects:** People +7, Army +7, Treasury +7, Food +7

**Choice 2:** No, first the army.
- **Response:** Then let the soldiers remember that they are protecting the kingdom, not just your door.
- **Effects:** Army +20, Treasury -10, Food -5

**Choice 3:** No, health first.
- **Response:** You chose life. Now we need to make sure that the living have something to live on.
- **Effects:** People +20, Treasury -12

---

### Encounter #207 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** My caravans can bring grain in just three days. But I want the exclusive right to sell bread in the capital.

**Choice 1:** Grant her a monopoly.
- **Response:** Wise. The people will receive bread, and I will receive gratitude in coins.
- **Effects:** People -8, Treasury +10, Food +25

**Choice 2:** Buy grain without a monopoly.
- **Response:** You buy food, but not friendship. It's more expensive in the future.
- **Effects:** Treasury -15, Food +15

**Choice 3:** The crown will not depend on merchants.
- **Response:** Proud crown. Let's see how proud hunger can be.
- **Effects:** Treasury +5, Food -15

**Choice 4:** Why do you already have so much grain?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because I buy when others are praying. Villages were sold cheaply, Your Majesty. I was simply faster than your officials.

**Choice 1:** Buy back the grain at your price.
- **Response:** It's nice to deal with a crown that understands the market.
- **Effects:** Treasury -20, Food +20

**Choice 2:** Sell it cheaper.
- **Response:** Ah, royal trade: first the order, then the price.
- **Effects:** Army +3, Treasury -8, Food +18

**Choice 3:** Confiscate half.
- **Response:** You will receive grain. And merchants who will begin to hide everything else.
- **Effects:** People -8, Treasury -5, Food +25

---

### Encounter #208 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The prisons are full of supporters of the former king. If everyone is executed, the square will not have time to be cleaned.

**Choice 1:** Execute the main ones.
- **Response:** Measured horror. It's easier to bear than slaughter.
- **Effects:** People -5, Army +10

**Choice 2:** Execute everyone.
- **Response:** Then send more executioners. Or less conscience.
- **Effects:** People -20, Army +20

**Choice 3:** Send them to work.
- **Response:** Living traitors are more useful than dead ones if you keep them under chain.
- **Effects:** People -5, Army -5, Treasury +10

**Choice 4:** How many of them are real conspirators?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Less than half. But fear does not ask for proof. It works without them.

**Choice 1:** Execute only those proven.
- **Response:** A rare case: justice and order did not fight to the death.
- **Effects:** People +3, Army +5

**Choice 2:** Fear is more useful than truth.
- **Response:** Fear will serve you. Until it finds a new owner.
- **Effects:** People -15, Army +15

**Choice 3:** The guilty are to be executed, the rest are to be sent to work.
- **Response:** Fair division. Everyone will get their own ax and pickaxe.
- **Effects:** People -5, Army +5, Treasury +8

---

### Encounter #209 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Children are sleeping at the monastery gates. They ask not for gold, but for stew. May I open the royal reserves?

**Choice 1:** Distribute the stew to the children.
- **Response:** Today they will fall asleep not from weakness, but from warmth. Thank you.
- **Effects:** People +15, Food -10

**Choice 2:** Give to all the poor.
- **Response:** This is a favor that the city will remember with its stomach.
- **Effects:** People +25, Food -25

**Choice 3:** Let the monastery feed them itself.
- **Response:** We'll try. But an empty bowl does not become full from prayer.
- **Effects:** People -8, Food +5

**Choice 4:** Why did they come to the monastery and not to the palace?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because the palace gates are guarded by spears, and the monastery gates are guarded only by old hinges. Hungry people go where they are not beaten.

**Choice 1:** Open the royal kitchen near the palace.
- **Response:** Then people will see not the walls of the palace, but the hand of the king.
- **Effects:** People +20, Treasury -5, Food -20

**Choice 2:** Donate the grain to the monastery.
- **Response:** We will feed them without question. This is sometimes the best justice.
- **Effects:** People +18, Food -15

**Choice 3:** Place a guard at the monastery.
- **Response:** The guards will disperse the crowd. But not hunger.
- **Effects:** People -8, Army +5

---

### Encounter #210 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** I can prepare medicine for the lower city. It is bitter and smells like a swamp, but many will survive.

**Choice 1:** Buy medicine for all patients.
- **Response:** Generous order. The swamp will be enough, and the sick - even more so.
- **Effects:** People +25, Treasury -20

**Choice 2:** Buy for children only.
- **Response:** The children will survive. Their parents might be grateful enough not to curse you out loud.
- **Effects:** People +12, Treasury -8

**Choice 3:** Let the patients pay themselves.
- **Response:** As you wish. The disease rarely asks if a person has coins.
- **Effects:** People -15, Treasury +5

**Choice 4:** Why is it so expensive?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because the swamp lily blooms three nights a year. And also because I’m not going to die poor saving your poor.

**Choice 1:** Pay your price.
- **Response:** Wise. Sometimes life is cheaper to buy than to mourn later.
- **Effects:** People +25, Treasury -20

**Choice 2:** Reduce the price or I'll take the recipe by force.
- **Response:** Ah, royal medicine. First the threat, then the treatment.
- **Effects:** People +20, Army +3, Treasury -8

**Choice 3:** Sell the recipe to the crown.
- **Response:** The recipe is yours. If your people confuse a lily with a nettle, don't invite me to the funeral.
- **Effects:** People +18, Treasury -12

---

### Encounter #211 — General Rudolf

**Character:** General Rudolf
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The army holds the throne, but the throne feeds the army poorly. Enter the military levy.

**Choice 1:** Introduce a fee for everyone.
- **Response:** The soldiers will be well fed. The rest are careful.
- **Effects:** People -15, Army +15, Treasury +25

**Choice 2:** Introduce a tax only from the rich.
- **Response:** Less gold, less anger. Acceptable.
- **Effects:** Army +8, Treasury +15

**Choice 3:** Refuse the army.
- **Response:** The army knows how to wait. But it is bad at forgiving.
- **Effects:** Army -15, Treasury +5

**Choice 4:** How long will the army last without gathering?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Three weeks - with discipline. Five - with thefts. Seven - with rebellion. I'd rather not check the eighth.

**Choice 1:** Introduce a temporary fee for a month.
- **Response:** Temporary orders often outlast kings. But now it is needed.
- **Effects:** People -8, Army +10, Treasury +15

**Choice 2:** Give the army grain instead of gold.
- **Response:** Soldiers can be calmed down with bread. But not for long.
- **Effects:** Army +10, Food -15

**Choice 3:** Let the army endure.
- **Response:** Patience is a bad ration.
- **Effects:** Army -20, Treasury +5

---

### Encounter #212 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** If you bring the holy relics to the capital, people will forget their fear. But the road and security will be expensive.

**Choice 1:** Organize a procession.
- **Response:** The city will see that the heavens are still looking in its direction.
- **Effects:** People +15, Treasury -15

**Choice 2:** Bring the relics without a holiday.
- **Response:** The quiet shrine is less comforting, but also comforting.
- **Effects:** People +5, Treasury -5

**Choice 3:** Don't waste money on relics.
- **Response:** Not all bones are dead to the people, Your Majesty.
- **Effects:** People -5, Treasury +8

**Choice 4:** Do people really believe in these powers?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** People don't believe in relics. They believe that someone above them has not yet turned their back.

**Choice 1:** May the relics arrive with honor.
- **Response:** Hope will enter the city before the relic.
- **Effects:** People +15, Treasury -15

**Choice 2:** The church will pay half.
- **Response:** The altar will split the price. And it will remember that the throne knows how to bargain.
- **Effects:** People +10, Treasury -7

**Choice 3:** Replace the procession with the distribution of bread.
- **Response:** Bread is also a prayer if given on time.
- **Effects:** People +12, Food -10

---

### Encounter #213 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** There are merchants ready to buy official positions. They will steal, of course. But first they will pay us.

**Choice 1:** Sell positions.
- **Response:** The treasury will come to life. Let your conscience breathe later.
- **Effects:** People -15, Treasury +30

**Choice 2:** Sell only small positions.
- **Response:** Petty theft is almost a tradition.
- **Effects:** People -5, Treasury +12

**Choice 3:** Prohibit the sale of positions.
- **Response:** Commendable. Unprofitable, but commendable.
- **Effects:** People +5, Treasury -5

**Choice 4:** How much will they steal?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** As much as they are allowed to. That is, a lot if we look the other way. And moderately, if we take a share.

**Choice 1:** Sell and take a share.
- **Response:** Dirty income is still income.
- **Effects:** People -20, Treasury +35

**Choice 2:** Sell, but appoint inspectors.
- **Response:** Thieves steal more slowly under supervision. Usually.
- **Effects:** People -5, Treasury +15

**Choice 3:** Demand payment in grain.
- **Response:** Fine. Let at least their ambition be edible.
- **Effects:** People -8, Treasury +5, Food +15

---

### Encounter #214 — Healer Mira

**Character:** Healer Mira
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** After the public punishment there was a stampede in the square. There are more wounded than criminals. This is not justice, this is carnage.

**Choice 1:** Ban public executions.
- **Response:** Today the square will become less bloody. This is already a victory.
- **Effects:** People +15, Army -8

**Choice 2:** Leave only closed executions.
- **Response:** Death behind a wall is still death. But at least without the crush.
- **Effects:** People +8, Army -3

**Choice 3:** The area must see the strength.
- **Response:** Then the area will also see broken ribs.
- **Effects:** People -15, Army +10

**Choice 4:** Is it the crowd's fault?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** The crowd's only fault is that it is afraid. And fear pushes, falls, breaks ribs and crushes children.

**Choice 1:** Place healers in the square.
- **Response:** If you are showing death, let there be at least someone nearby for life.
- **Effects:** People +8, Army +3, Treasury -5

**Choice 2:** Move executions outside the city.
- **Response:** The executioner will move on. People will breathe closer.
- **Effects:** People +10, Army -5

**Choice 3:** Leave everything as is.
- **Response:** Then call me not to the sick, but to your consequences.
- **Effects:** People -12, Army +8

---

### Encounter #215 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Rats eat better than some soldiers. If you don't clean out the barn, in a week they will be fatter than the treasurer.

**Choice 1:** Hire rat catchers.
- **Response:** Finally a war where I root for the killers.
- **Effects:** People +5, Treasury -8, Food +15

**Choice 2:** Let the cats into the barn.
- **Response:** The cats will be happy. Rats are surprised.
- **Effects:** Food +8

**Choice 3:** Use poison.
- **Response:** The food will be saved. If people then do not escape from food.
- **Effects:** People -8, Food +15

**Choice 4:** How bad is it?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** One rat stole a piece of cheese yesterday and looked at me as if I owed her taxes.

**Choice 1:** Hire the best rat catchers.
- **Response:** Fine. Let at least someone in this palace honestly catch thieves.
- **Effects:** People +8, Treasury -12, Food +20

**Choice 2:** Give poison, but close the barn.
- **Response:** There is a risk. But the rats will not leave on their own out of politeness.
- **Effects:** People -3, Treasury -3, Food +15

**Choice 3:** Let the soldiers clean out the barn.
- **Response:** The soldiers will swear. Rats too.
- **Effects:** Army -5, Food +12

---

### Encounter #216 — Captain Varn

**Character:** Captain Varn
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The soldiers say that you listen to merchants more often than to generals. This is a dangerous whisper.

**Choice 1:** Arrange an army review.
- **Response:** The parade will drown out the whispers. For a while.
- **Effects:** Army +15, Treasury -8

**Choice 2:** Distribute bread and beer to the soldiers.
- **Response:** A well-fed soldier argues more softly.
- **Effects:** Army +10, Treasury -5, Food -10

**Choice 3:** Arrest the instigators.
- **Response:** Some whispers end in the basement.
- **Effects:** People -5, Army +5

**Choice 4:** Who started this whispering?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Not just one person. Several fires, several mugs, one phrase: ‘merchants eat, soldiers wait’.

**Choice 1:** Feed the barracks today.
- **Response:** Bread will shut their mouths better than an order.
- **Effects:** Army +12, Food -12

**Choice 2:** Find the talkers and punish them.
- **Response:** They will shut up. The rest will think more quietly.
- **Effects:** People -5, Army +8

**Choice 3:** Address the soldiers in person.
- **Response:** Risky. But soldiers like to see who they serve.
- **Effects:** Army +10, Treasury -3

---

### Encounter #217 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Creditors demand payment of the former king's debts. Formally, these are not your debts. But the throne is the same.

**Choice 1:** Pay off some of your debts.
- **Response:** You buy trust at a high price. But trust is rarely sold cheap.
- **Effects:** People +5, Treasury -20

**Choice 2:** Refuse to pay.
- **Response:** The treasury will smile. Merchants - no.
- **Effects:** Treasury +10, Food -5

**Choice 3:** Pay in grain.
- **Response:** The debt will go away. Stocks too.
- **Effects:** Treasury -5, Food -15

**Choice 4:** Are these papers real?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Some are real. Some are written in ink too fresh for an old debt. Dead people, as a rule, do not borrow money yesterday.

**Choice 1:** Pay only proven debts.
- **Response:** The fair way. Not the fastest, but strong.
- **Effects:** People +5, Treasury -10

**Choice 2:** Declare counterfeits treason.
- **Response:** Lenders will become more careful. And angrier.
- **Effects:** Army +5, Treasury +8

**Choice 3:** Don't pay anyone.
- **Response:** Sometimes refusal sounds like strength. Sometimes it's like bankruptcy.
- **Effects:** Treasury +10, Food -8

---

### Encounter #218 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The boy's father raised his sword against you. The boy himself is too small for the sword, but old enough to remember.

**Choice 1:** Send the boy to a monastery.
- **Response:** Monastery walls are better than prison walls. For children - definitely.
- **Effects:** People +5, Treasury -5

**Choice 2:** Send him to the army as a servant.
- **Response:** He will grow up next to the swords. It's either medicine or poison.
- **Effects:** People -3, Army +3

**Choice 3:** Execute as a warning.
- **Response:** The area will understand. Whether he will forgive is another question.
- **Effects:** People -20, Army +10

**Choice 4:** Is he dangerous?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Today - no. Tomorrow - who knows. Children have a good memory, especially if the king left him an orphan.

**Choice 1:** Let him live under supervision.
- **Response:** Soft collar. Sometimes it holds better than iron.
- **Effects:** People +5, Treasury -5

**Choice 2:** Give him to the monastery.
- **Response:** Prayer can dull vengeance. Sometimes.
- **Effects:** People +8, Treasury -5

**Choice 3:** Don't abandon future enemies.
- **Response:** Then you will have fewer enemies. And more ghosts.
- **Effects:** People -20, Army +10

---

### Encounter #219 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The bells ring every hour. People count the dead and lose their will. Maybe we should ban ringing?

**Choice 1:** Ban the death knell.
- **Response:** The city will become quieter. I hope it's not more insensitive.
- **Effects:** People +5, Army +3

**Choice 2:** Allow ringing only in the morning.
- **Response:** One ringing for memory. The rest of the day is for the living.
- **Effects:** People +8

**Choice 3:** Let them call.
- **Response:** The dead deserve to be remembered. The living deserve a break.
- **Effects:** People -3

**Choice 4:** Will silence comfort the living?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** No. But the constant ringing turns the city into a grave, where the living already consider themselves next.

**Choice 1:** Call only at dawn.
- **Response:** Let the day begin with memory and not end with fear.
- **Effects:** People +8

**Choice 2:** Replace the ringing with common prayer.
- **Response:** Prayer brings people together more gently than a bell.
- **Effects:** People +5, Treasury -3

**Choice 3:** After each ringing, distribute bread.
- **Response:** Bread after tribulation is mercy that you can hold in your hands.
- **Effects:** People +12, Food -8

---

### Encounter #220 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** We have doctors who know cold diseases. They can help your city. For a reasonable price.

**Choice 1:** Hire doctors.
- **Response:** Northern hands are cold but helpful.
- **Effects:** People +20, Treasury -15

**Choice 2:** Exchange services for reduced duties.
- **Response:** Mutual benefit. The most honest form of friendship.
- **Effects:** People +15, Treasury -5, Food +3

**Choice 3:** Refuse strangers.
- **Response:** Your city is sick, but your pride is healthy.
- **Effects:** People -8, Treasury +5

**Choice 4:** Why do you offer help so readily?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because a sick neighbor is a bad trader and a good source of infection. The North knows how to calculate benefits.

**Choice 1:** Hire all healers.
- **Response:** They will arrive before sunset. It’s better not to give the disease a head start.
- **Effects:** People +20, Treasury -15

**Choice 2:** Hire two people to check.
- **Response:** Carefully. The North respects the cautious almost as much as the strong.
- **Effects:** People +10, Treasury -6

**Choice 3:** Receive doctors, but not let them into the palace.
- **Response:** Your trust is faltering, but still going strong.
- **Effects:** People +12, Treasury -8

---

### Encounter #221 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** I have powder for restful sleep. It can be given to patients. Or soldiers who argue too loudly.

**Choice 1:** Give to the sick.
- **Response:** Sleep is a cheap healer. My powder just charges for entry.
- **Effects:** People +10, Treasury -8

**Choice 2:** Give to restless soldiers.
- **Response:** A quiet barracks is a rare miracle. Don't ask how natural.
- **Effects:** People +3, Army -5

**Choice 3:** Buy stock for the palace.
- **Response:** Palaces sleep worse than slums. There are more pillows and more fears.
- **Effects:** Treasury -10

**Choice 4:** How safe is it?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** In a small dose, a person sleeps. In the big one, he also sleeps, just longer than his relatives would like.

**Choice 1:** Buy a small batch for the sick.
- **Response:** Carefully. Almost boring. But the patients will like it.
- **Effects:** People +8, Treasury -5

**Choice 2:** Buy a lot. Entrust the dosage to me.
- **Response:** Finally a king who respects dangerous talent.
- **Effects:** People +12, Treasury -12

**Choice 3:** Ban this powder.
- **Response:** Prohibitions also put you to sleep. Mainly the mind.
- **Effects:** People +3, Treasury +3

---

### Encounter #222 — General Rudolf

**Character:** General Rudolf
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** In the markets they fight for bread. Give me soldiers, and in an hour there will be order there.

**Choice 1:** Send armed soldiers.
- **Response:** Order will come quickly. With shouts, but quickly.
- **Effects:** People -10, Army +5, Food +5

**Choice 2:** Send soldiers without weapons.
- **Response:** Soldiers without weapons is almost a request. But let's try.
- **Effects:** People +5, Army -3

**Choice 3:** Entrust markets to elders.
- **Response:** Elders are good for arguing about price. Not for a fight.
- **Effects:** People +5, Food -5

**Choice 4:** Do you call it order or fear?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** At the market, a hungry person does not distinguish between these words. He sees a spear and remembers that it has legs.

**Choice 1:** Let the soldiers restore order.
- **Response:** There will be order. Even with bruises.
- **Effects:** People -10, Army +8, Food +5

**Choice 2:** The soldiers guard the bread, but do not touch the people.
- **Response:** A fine line. I'll make sure it's not stepped over too often.
- **Effects:** People +5, Army +3

**Choice 3:** Set up food distributors.
- **Response:** Bread instead of a club. Soft. Sometimes it works.
- **Effects:** People +10, Food -10

---

### Encounter #223 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** One healer says that diseases are born in dirty water, not in sins. People listen to him too closely.

**Choice 1:** Protect the doctor.
- **Response:** You are choosing water over preaching. The temple will notice this.
- **Effects:** People +15, Treasury -3

**Choice 2:** Make the doctor apologize.
- **Response:** Humility is beneficial even to those who wash their hands more often than their souls.
- **Effects:** People -3, Treasury +3

**Choice 3:** Give the doctor to the church court.
- **Response:** The altar will sort itself out. Quick or edifying.
- **Effects:** People -15, Army +5

**Choice 4:** Does clean water contradict faith?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** No. But when people believe only in water, they cease to be afraid of sin. And without fear the temple is empty.

**Choice 1:** The doctor speaks about water, the temple speaks about the soul.
- **Response:** The division is wise. If both sides remember their place.
- **Effects:** People +10, Treasury -3

**Choice 2:** The doctor must speak more carefully.
- **Response:** Careful words rarely burn bridges.
- **Effects:** People +3

**Choice 3:** Clean the wells and conduct a service.
- **Response:** Water for the body, prayer for fear. Good order.
- **Effects:** People +18, Treasury -10

---

### Encounter #224 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** There is a lot of silver in the temples. If you borrow part of it, the treasury will come to life.

**Choice 1:** Take the temple silver.
- **Response:** The treasury will come to life. The temples will start screaming, but not right away.
- **Effects:** People -10, Treasury +25

**Choice 2:** Ask for a donation.
- **Response:** Asking brings less, but less often leads to stones.
- **Effects:** Treasury +10

**Choice 3:** Don't touch the temples.
- **Response:** Sanctity preserved. Emptiness too.
- **Effects:** People +5, Treasury -5

**Choice 4:** Will this cause a riot?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Not right away. First there will be sermons. Then the crying old women. Then stones hit the tax collectors. But we will already have the silver.

**Choice 1:** Take it quickly and secretly.
- **Response:** Secret is cheaper than war. As long as it remains a mystery.
- **Effects:** People -8, Treasury +20

**Choice 2:** Take only from rich monasteries.
- **Response:** Moderate sacrilege. Almost financial reform.
- **Effects:** People -5, Treasury +15

**Choice 3:** Don't touch the temples.
- **Response:** Sometimes a king buys peace by not taking anything.
- **Effects:** People +5, Treasury -5

---

### Encounter #225 — Healer Mira

**Character:** Healer Mira
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Women give birth in dirt and cold. Give me an old warehouse, I will turn it into a home for women in labor.

**Choice 1:** Provide a warehouse and funding.
- **Response:** You save those who have not yet even had time to be afraid of your rule.
- **Effects:** People +25, Treasury -15, Food -5

**Choice 2:** Give a warehouse without money.
- **Response:** Walls are better than streets. But walls without healers do not save everyone.
- **Effects:** People +10, Food -3

**Choice 3:** A warehouse is needed for grain.
- **Response:** Bread is important. But dead babies don't eat it.
- **Effects:** People -10, Food +10

**Choice 4:** How many lives will this save?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** I'm not a goddess to count in advance. But a dirty floor takes away babies more often than swords take away soldiers.

**Choice 1:** Provide a warehouse and funding.
- **Response:** Then today the crown did something truly lively.
- **Effects:** People +25, Treasury -15, Food -5

**Choice 2:** Provide a small room at the infirmary.
- **Response:** Few. But it’s better than nothing, and sometimes salvation begins with this.
- **Effects:** People +12, Treasury -5

**Choice 3:** Now the grain is more important.
- **Response:** Then I will return when the price of this choice begins to cry.
- **Effects:** People -10, Food +10

---

### Encounter #226 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The meat came from the south. Cheap. Too cheap. It smells like a victory over common sense.

**Choice 1:** Buy and feed the poor.
- **Response:** The poor will eat. Then, perhaps, they will regret it.
- **Effects:** People -15, Treasury -5, Food +15

**Choice 2:** Buy only for dogs and army.
- **Response:** Dogs will forgive. Soldiers are not a fact.
- **Effects:** People -5, Army -3, Food +8

**Choice 3:** Avoid meat.
- **Response:** Fine. Sometimes the best food is the one you don't eat.
- **Effects:** People +5, Treasury +3

**Choice 4:** Do you think it's ruined?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** If the meat smells like it has already met death, I prefer not to introduce it to the stomachs.

**Choice 1:** Burn the meat.
- **Response:** Smoke is better than a funeral song.
- **Effects:** People +10, Treasury -5

**Choice 2:** Pickle and take your chances.
- **Response:** Salt hides a lot. But not everything forgives.
- **Effects:** People -8, Food +8

**Choice 3:** Return to sellers.
- **Response:** Let them dine on their own profit.
- **Effects:** Treasury +3

---

### Encounter #227 — Captain Varn

**Character:** Captain Varn
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Some of the king's grain disappears and appears on the black market at night. Someone inside the palace is feeding the thieves.

**Choice 1:** Organize a raid.
- **Response:** We'll catch someone for sure. The question is - a thief or a convenient victim.
- **Effects:** People -5, Army +5, Food +10

**Choice 2:** Set up secret surveillance.
- **Response:** Silent hunt. I like it.
- **Effects:** Treasury -5, Food +8

**Choice 3:** Increase penalties for grain theft.
- **Response:** Fear will reduce theft. Or it will make thieves more careful.
- **Effects:** People -8, Army +5, Food +5

**Choice 4:** Do you know who helps the thieves?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** I know where the smell comes from. From warehouse keys and people who got rich too quickly after the coup.

**Choice 1:** Arrest the warehouse supervisors.
- **Response:** Hard. But keys love strict hands.
- **Effects:** People -3, Army +5, Food +10

**Choice 2:** Replace bags and trace the path.
- **Response:** Fine. Let the thieves lead us home themselves.
- **Effects:** Treasury -5, Food +12

**Choice 3:** Close the case so as not to disgrace the palace.
- **Response:** The shame will remain. Just full.
- **Effects:** Treasury +5, Food -10

---

### Encounter #228 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** There is a statue of the former king in the main square. Some put flowers on it, others spit on it. What to do?

**Choice 1:** Demolish the statue.
- **Response:** You will remove the stone. It will take longer to clear the memory.
- **Effects:** People -8, Army +8

**Choice 2:** Leave the statue.
- **Response:** A gentle gesture. Proponents of strength will call it weakness.
- **Effects:** People +5, Army -5

**Choice 3:** Melt it down into coins.
- **Response:** History will become small coin. Symbolic, but dangerous.
- **Effects:** People -5, Treasury +15

**Choice 4:** What would a wise king do?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** A wise king does not argue with a stone. He takes it to a place where memory ceases to be a banner.

**Choice 1:** Move the statue to the old garden.
- **Response:** The memory will remain, but will no longer command the area.
- **Effects:** People +5, Treasury -5

**Choice 2:** Place a new coat of arms next to it.
- **Response:** You don't erase the past. You put your stamp on it.
- **Effects:** Army +3, Treasury -5

**Choice 3:** Demolish at night.
- **Response:** The night will hide the workers. But in the morning everyone will see emptiness.
- **Effects:** People -5, Army +5

---

### Encounter #229 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** If you cap the price of bread, bakers will hide the flour. If you don't limit it, the poor will start eating bark.

**Choice 1:** Limit the price.
- **Response:** The poor will be grateful. The bakers will start counting the caches.
- **Effects:** People +15, Food -10

**Choice 2:** Do not interfere with the market.
- **Response:** The market will survive. Not all people - but the market certainly is.
- **Effects:** People -15, Treasury +10

**Choice 3:** Compensate bakers for the difference.
- **Response:** This is the language of trade. Finally.
- **Effects:** People +15, Treasury -15

**Choice 4:** How to keep the price and not lose flour?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** It’s very simple: you pay the bakers, the bakers smile at the people, the people thank you, and the treasurer cries into his pillow.

**Choice 1:** Compensate bakers.
- **Response:** Expensive, beautiful, almost reasonable.
- **Effects:** People +15, Treasury -15

**Choice 2:** Give bakers grain instead of gold.
- **Response:** Bread for bread. A simple transaction, rare for the palace.
- **Effects:** People +12, Food -10

**Choice 3:** Let the market decide for itself.
- **Response:** The market will decide. Then the crowd too.
- **Effects:** People -15, Treasury +10

---

### Encounter #230 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** One condemned man asks not to hang him in the square, but to kill him quickly and quietly. He says he has children.

**Choice 1:** Allow silent execution.
- **Response:** Less spectacle. More human.
- **Effects:** People +3, Army -3

**Choice 2:** Public execution is necessary for order.
- **Response:** The area will receive a lesson. Children are memories.
- **Effects:** People -8, Army +8

**Choice 3:** Replace execution with hard labor.
- **Response:** A living criminal can still be useful.
- **Effects:** Army -5, Treasury +8

**Choice 4:** Is he really guilty?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Guilty enough to die as ordered. But not enough for me to remember his name.

**Choice 1:** Reconsider the case.
- **Response:** Rarely does an ax wait for paper. But today it will wait.
- **Effects:** People +8, Treasury -5

**Choice 2:** Execute quietly.
- **Response:** A silent death is still death. But no crowd.
- **Effects:** People +3, Army -3

**Choice 3:** Execute publicly.
- **Response:** Understood. The square will learn fear again.
- **Effects:** People -8, Army +8

---

### Encounter #231 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** A hungry man does not hear prayer. Give us grain and we will feed people before services.

**Choice 1:** Give grain to the monastery.
- **Response:** Thank you. Today the sermon will begin with a spoonful of soup.
- **Effects:** People +20, Food -15

**Choice 2:** Give some grain.
- **Response:** A little warmth is better than complete cold.
- **Effects:** People +8, Food -7

**Choice 3:** Let them pray first, then eat.
- **Response:** An empty stomach does not hold prayer well.
- **Effects:** People -10, Food +5

**Choice 4:** Do you want to feed or convert?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** I want them to live until tomorrow. If they pray tomorrow, good. If they just breathe, it’s already a miracle.

**Choice 1:** Give grain without conditions.
- **Response:** This is mercy. No hook. A rare thing at court.
- **Effects:** People +20, Food -15

**Choice 2:** Give grain only to children and the sick.
- **Response:** I'll accept. Although hungry adults are people too.
- **Effects:** People +12, Food -8

**Choice 3:** Don't waste supplies.
- **Response:** Then I will pray that the supplies will forgive you.
- **Effects:** People -10, Food +5

---

### Encounter #232 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** I have a strong poison. For rats, of course. Although rats are different.

**Choice 1:** Buy for barns.
- **Response:** The rats will die. I hope the chefs know how to read the warnings.
- **Effects:** People -3, Treasury -5, Food +10

**Choice 2:** Buy secretly for the palace.
- **Response:** Palace rats walk on two legs. You understand.
- **Effects:** Treasury -10

**Choice 3:** Ban the sale of poison.
- **Response:** Forbid it. Rats, however, do not read decrees.
- **Effects:** People +5, Food -5

**Choice 4:** Are you offering me poison?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** I offer a remedy. Poison is when the remedy ends up in the wrong cup.

**Choice 1:** Buy for barns only.
- **Response:** How boring. How prudent.
- **Effects:** People -3, Treasury -5, Food +10

**Choice 2:** Buy and keep in the palace.
- **Response:** Let your enemies hope that you do not know how to choose cups.
- **Effects:** Army +3, Treasury -10

**Choice 3:** Give the poison to the guards.
- **Response:** Oh, now the poison will be under the supervision of men with swords. What could go wrong?
- **Effects:** Army +5, Treasury -5

---

### Encounter #233 — General Rudolf

**Character:** General Rudolf
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The infirmaries are filled with civilians. Wounded soldiers have nowhere to go. Who is more important for the throne?

**Choice 1:** Make room for soldiers.
- **Response:** The soldiers will remember. Civilians too.
- **Effects:** People -15, Army +15

**Choice 2:** Leave the civilians.
- **Response:** Mercy for the city. Bitterness in the barracks.
- **Effects:** People +15, Army -10

**Choice 3:** Expand the infirmary.
- **Response:** Expensive. But at least no one can say that you chose the dead.
- **Effects:** People +10, Army +5, Treasury -15

**Choice 4:** Do you want me to choose between the sword and the people?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** No. I want you to understand: a sword that bleeds on the floor will not protect the people tomorrow.

**Choice 1:** Expand the infirmary.
- **Response:** Good order. Even I won't argue.
- **Effects:** People +10, Army +5, Treasury -15

**Choice 2:** Half the places are for soldiers.
- **Response:** Half justice is better than a complete quarrel.
- **Effects:** People -5, Army +8

**Choice 3:** Soldiers first.
- **Response:** The army will repay with loyalty. The rest - as best they can.
- **Effects:** People -15, Army +15

---

### Encounter #234 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Even a traitor has a soul. Let the priest speak to everyone before they die.

**Choice 1:** Allow.
- **Response:** Mercy before death is still mercy.
- **Effects:** People +5, Treasury -3

**Choice 2:** Only important prisoners.
- **Response:** Souls, it turns out, are also divided by rank.
- **Effects:** People +2

**Choice 3:** No. A quick execution is cheaper.
- **Response:** A cheap death often comes at a high cost to the living.
- **Effects:** People -5, Army +3, Treasury +5

**Choice 4:** Why console traitors?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** We do not console traitors. We console those who look and think, ‘If I am accused, will I die like an animal?’

**Choice 1:** Allow everyone to pray.
- **Response:** Today fear will become a little less animalistic.
- **Effects:** People +6, Treasury -3

**Choice 2:** Only to those who admit guilt.
- **Response:** Confession in exchange for mercy. Strict, but understandable.
- **Effects:** People +3, Army +2

**Choice 3:** Refuse.
- **Response:** Then the ax will speak last. And loudest of all.
- **Effects:** People -5, Treasury +5

---

### Encounter #235 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** I found the old hiding place of the former king. There is gold there, but it is marked with the seals of the old dynasty.

**Choice 1:** Melt down the gold.
- **Response:** The old king will become the new coin. Ironic and useful.
- **Effects:** Treasury +25

**Choice 2:** Use it secretly.
- **Response:** Secret money is the best money. Until it is found.
- **Effects:** Treasury +15

**Choice 3:** Show it to the people and call it a trophy.
- **Response:** Boldly. But some people still love old seals.
- **Effects:** People -5, Army +5, Treasury +20

**Choice 4:** Why did the former king hide it?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Kings hide gold for two reasons: to survive trouble or to escape from it. The deceased did not manage to do either of these things.

**Choice 1:** Melt everything down.
- **Response:** Wonderful. Gold has no memory after the smelter.
- **Effects:** Treasury +25

**Choice 2:** Leave some as a reserve.
- **Response:** Wise. A secret chest is sometimes better than advice.
- **Effects:** Treasury +15

**Choice 3:** Give some away to the people.
- **Response:** Generosity from someone else's stash. People won't ask questions.
- **Effects:** People +10, Treasury +8

---

### Encounter #236 — Healer Mira

**Character:** Healer Mira
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** People eat whatever is given to them. Yesterday's free stew was too rich for hungry stomachs. Now half the street is sick.

**Choice 1:** Organize proper kitchens.
- **Response:** Feeding is not enough. You still need to not kill with kindness.
- **Effects:** People +20, Treasury -10, Food -5

**Choice 2:** Stop food distribution.
- **Response:** You will stop stomach pain. And you will bring back hunger.
- **Effects:** People -10, Food +10

**Choice 3:** Entrust recipes to chefs.
- **Response:** Let them cook for the sick, not for a feast.
- **Effects:** People +12, Food -5

**Choice 4:** Can food harm the hungry?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** After a long hunger, the stomach looks like a wounded one. If you throw a feast at him, he doesn’t thank you - he gives up.

**Choice 1:** Create healing kitchens.
- **Response:** This will save more than it seems. Quietly, without fanfare.
- **Effects:** People +22, Treasury -10, Food -8

**Choice 2:** Distribute only liquid stew.
- **Response:** Fine. Simple food is the best medicine for an empty belly.
- **Effects:** People +12, Food -5

**Choice 3:** Don't change anything.
- **Response:** Then call me not to the kitchen, but to the dead.
- **Effects:** People -12

---

### Encounter #237 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** If you replace meat with turnips, the city will last longer. But the soldiers are already calling it ‘the slop of the world’.

**Choice 1:** Transfer everyone to turnip.
- **Response:** Everyone will be equally unhappy. There is almost justice in this.
- **Effects:** People +5, Army -10, Food +20

**Choice 2:** Only feed the poor turnips.
- **Response:** The poor will again receive the cheapest share of mercy.
- **Effects:** People -5, Food +10

**Choice 3:** The palace also eats turnips.
- **Response:** This is what I want to see: courtiers versus root crops.
- **Effects:** People +8, Food +8

**Choice 4:** Is it possible to make turnips tasty?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** You can if you add oil, salt and hope. Oil is scarce, salt is expensive, let the throne provide hope.

**Choice 1:** Add salt from stock.
- **Response:** Salt will save the taste. A little honor too.
- **Effects:** People +5, Treasury -5, Food +10

**Choice 2:** Make turnips a common food.
- **Response:** Then no one will say that hunger has a class.
- **Effects:** People +5, Army -10, Food +20

**Choice 3:** Leave the meat to the army.
- **Response:** The soldiers will be happy. The turnip — no, it was humiliated again.
- **Effects:** Army +8, Food -15

---

### Encounter #238 — Captain Varn

**Character:** Captain Varn
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** One guard let a merchant's cart through at night without inspection. He says he only took two coins.

**Choice 1:** Execute the guard.
- **Response:** The guards will understand the value of two coins.
- **Effects:** People -8, Army +8

**Choice 2:** Brand and leave to serve.
- **Response:** Pain teaches faster than command.
- **Effects:** Army +5

**Choice 3:** Fire and fine.
- **Response:** Soft. But it's not pointless.
- **Effects:** Army -3, Treasury +5

**Choice 4:** What was in the cart?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** He swears he doesn't know. And I don’t like the oaths of people who sell their eyes for two coins.

**Choice 1:** Find the cart and confiscate the cargo.
- **Response:** Let's catch the trail while the wheels are still fresh.
- **Effects:** Army +3, Treasury -3, Food +10

**Choice 2:** Interrogate the guard harshly.
- **Response:** He will remember. Or he'll come up with an idea. We'll have to decide.
- **Effects:** People -5, Army +8

**Choice 3:** Introduce double inspection.
- **Response:** More expensive. But the gate will finally become a gate.
- **Effects:** Army +5, Treasury -5

---

### Encounter #239 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** People are not afraid of punishment, but of punishment without trial. Even a usurper needs a law.

**Choice 1:** Create a temporary court.
- **Response:** Law is a slow shield. But still a shield.
- **Effects:** People +15, Treasury -10

**Choice 2:** Try only important defendants.
- **Response:** Not justice, but its shadow. Sometimes shade is better than darkness.
- **Effects:** People +5, Treasury -5

**Choice 3:** The royal command is superior to the court.
- **Response:** This is what strong kings say. And those who don’t remain kings for long.
- **Effects:** People -15, Army +10

**Choice 4:** Will the law help maintain the throne?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** The sword will hold the door today. The law will convince people tomorrow not to look for another door.

**Choice 1:** Create a temporary court.
- **Response:** Wise. Fear subdues, law binds.
- **Effects:** People +15, Treasury -10

**Choice 2:** Appoint speedy military courts.
- **Response:** Fast. Dangerous. But at least not completely without form.
- **Effects:** People -8, Army +10

**Choice 3:** Don't waste time on the law.
- **Response:** Then it will not be the law that will rule, but the nearest hand with the sword.
- **Effects:** People -12, Army +8

---

### Encounter #240 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** My warehouses are full. But the road to them is dangerous. Give me soldiers and you will get bread.

**Choice 1:** Give soldiers.
- **Response:** Wonderful. Your swords will bring my bread to your hungry.
- **Effects:** Army -8, Food +20

**Choice 2:** Pay private security.
- **Response:** Expensive, but without an extra military boot on the trade road.
- **Effects:** Treasury -12, Food +15

**Choice 3:** Take warehouses by force.
- **Response:** You will receive grain. And merchants who will learn to hide better.
- **Effects:** People -10, Army +5, Food +25

**Choice 4:** Are you threatening the crown with famine?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** I? Never. Hunger threatens itself. I'm just standing next to the barn key.

**Choice 1:** Give soldiers and tax some of the grain.
- **Response:** Tough, but smart. This is unpleasant for me, so you are learning.
- **Effects:** Army -8, Treasury +3, Food +22

**Choice 2:** Buy grain honestly.
- **Response:** Honesty feels good. Especially when it's paid in full.
- **Effects:** Treasury -15, Food +15

**Choice 3:** Refuse the deal.
- **Response:** Then let your barns prove that they are fuller than my pride.
- **Effects:** Treasury +5, Food -10

---

### Encounter #241 — Executioner Morwen

**Character:** Executioner Morwen
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** After each execution the crowd becomes quieter. Do you want to make executions weekly?

**Choice 1:** Yes, fear is needed.
- **Response:** Then I will prepare the area. And people who will then wash it.
- **Effects:** People -20, Army +15

**Choice 2:** Only for proven traitors.
- **Response:** Moderate horror. It's easier to swallow.
- **Effects:** People -5, Army +5

**Choice 3:** No. Fear quickly rots.
- **Response:** A rare order that reduces my work.
- **Effects:** People +10, Army -5

**Choice 4:** Is the crowd really getting quieter?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Quiet - yes. Or rather, no. Silence is not always true. Sometimes it's just clenched teeth.

**Choice 1:** Executions are only carried out in major cases.
- **Response:** The ax will be rare. That's why it's probably scarier.
- **Effects:** People -5, Army +5

**Choice 2:** Replace some executions with hard labor.
- **Response:** A pick instead of a loop. It also has an educational sound.
- **Effects:** Army -5, Treasury +10

**Choice 3:** Continue public executions.
- **Response:** The square will be silent. But don't sleep.
- **Effects:** People -20, Army +15

---

### Encounter #242 — Monk Arvel

**Character:** Monk Arvel
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The soldiers were brought to the monastery with fervor. If we accept them, the poor will get sick. If not, the defenders of the throne will die.

**Choice 1:** Receive soldiers.
- **Response:** We will accept them. And we will pray that the disease does not go further.
- **Effects:** People -8, Army +10

**Choice 2:** Leave places for the poor.
- **Response:** The poor will survive. The soldiers may not forgive.
- **Effects:** People +10, Army -8

**Choice 3:** Divide the monastery with partitions.
- **Response:** A wooden wall is better than a stone heart.
- **Effects:** People +3, Army +3, Treasury -5

**Choice 4:** What does your conscience say?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** She says that a soldier and a beggar have the same fever. But we have one bed.

**Choice 1:** Accept the heaviest, regardless of rank.
- **Response:** This seems like justice. It's rarely convenient.
- **Effects:** People +8, Army +3

**Choice 2:** Soldiers are more important.
- **Response:** I will obey. But illness does not respect uniforms.
- **Effects:** People -8, Army +10

**Choice 3:** The poor are more important.
- **Response:** Then I will pray for both the poor and your army.
- **Effects:** People +10, Army -8

---

### Encounter #243 — Apothecary Sivil

**Character:** Apothecary Sivil
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** There have been strange poisonings in the city. I can make an antidote. But rare herbs are expensive.

**Choice 1:** Buy herbs.
- **Response:** Life has defeated the wallet again. What a rarity.
- **Effects:** People +20, Treasury -15

**Choice 2:** Buy small stock.
- **Response:** A small reserve saves a small part of the trouble.
- **Effects:** People +8, Treasury -6

**Choice 3:** Accuse Sivil of creating poison.
- **Response:** Comfortable. When you don’t know who is to blame, grab someone who knows herbs.
- **Effects:** People -5, Army +5

**Choice 4:** How do you know it's poison?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because people don't turn blue from bad thoughts. Although, I admit, your subjects are trying.

**Choice 1:** Buy full stock.
- **Response:** Fine. Death will earn less today.
- **Effects:** People +20, Treasury -15

**Choice 2:** Buy a small supply and look for a source.
- **Response:** Reasonable. Treating water without finding a well is stupid.
- **Effects:** People +12, Treasury -8

**Choice 3:** Make them sell cheaper.
- **Response:** Royal discount always smells like iron.
- **Effects:** People +12, Army +3, Treasury -5

---

### Encounter #244 — High Priest Malrik

**Character:** High Priest Malrik
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Announce a day of fasting. People will eat less and think about their souls.

**Choice 1:** Announce a general fast.
- **Response:** The city will come to terms. Although the hungry humble themselves worse than the well-fed.
- **Effects:** People -5, Food +15

**Choice 2:** This fast is for the palace only.
- **Response:** Good example from above. People love it when the palace tolerates it too.
- **Effects:** People +5, Food +5

**Choice 3:** Post for the army too.
- **Response:** Strong humility. The soldiers will call it differently.
- **Effects:** Army -15, Food +20

**Choice 4:** The hungry are already fasting.
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** That is why the palace should begin the fast. When a well-fed person refuses meat, a hungry person at least sees that his suffering has been noticed.

**Choice 1:** This fast is for the palace only.
- **Response:** Humility above sometimes cures anger below.
- **Effects:** People +8, Food +5

**Choice 2:** A general fast with the distribution of stew to the poor.
- **Response:** Wise. An empty stomach doesn't have to be a death sentence.
- **Effects:** People +10, Food +5

**Choice 3:** Refuse the fast.
- **Response:** Then at least let the palace not feast too loudly.
- **Effects:** People +3, Food -5

---

### Encounter #245 — Treasurer Borvin

**Character:** Treasurer Borvin
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Citizens are willing to pay for patrols in their areas. Essentially, security will become a service.

**Choice 1:** Introduce paid patrols.
- **Response:** Security will finally start to pay off.
- **Effects:** People -10, Army +8, Treasury +20

**Choice 2:** Patrols are free.
- **Response:** Noble. Unprofitable. Very royal.
- **Effects:** People +10, Army +5, Treasury -10

**Choice 3:** Patrols only in dangerous areas.
- **Response:** Reasonable expense. I'm almost satisfied.
- **Effects:** People +5, Army +5, Treasury -5

**Choice 4:** What about poor areas?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Poor areas will pay less. Or they won't pay at all. Then they will have less security. Mathematics is cruel, but fair.

**Choice 1:** The rich pay for themselves and the poor.
- **Response:** Wonderful. A tax that can be called mercy.
- **Effects:** People +8, Army +8, Treasury +10

**Choice 2:** Whoever pays gets the patrol.
- **Response:** Clean system. Dirty consequences.
- **Effects:** People -10, Army +8, Treasury +20

**Choice 3:** Patrols are free for everyone.
- **Response:** The treasury will sigh with pain. The city is relieved.
- **Effects:** People +10, Army +5, Treasury -10

---

### Encounter #246 — Healer Mira

**Character:** Healer Mira
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** The pharmacy burned down at night. People say it's a punishment from the gods, but I see traces of oil.

**Choice 1:** Investigate arson.
- **Response:** Thank you. Fire rarely lights itself where there is benefit.
- **Effects:** People +5, Treasury -5

**Choice 2:** Restore the pharmacy at the expense of the treasury.
- **Response:** People will get medicine before rumors become poison.
- **Effects:** People +20, Treasury -15

**Choice 3:** Hand over the matter to the guards.
- **Response:** Let them search. If only they wouldn’t find a convenient poor man.
- **Effects:** Army +5, Treasury -3

**Choice 4:** Who benefits from arson?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** To the one who sells medicines at a higher price. Or to someone who wants the sick to go not to the doctor, but to the altar.

**Choice 1:** Investigate drug dealers.
- **Response:** Look for money. They often stand next to fire.
- **Effects:** People +8, Treasury -5

**Choice 2:** Restore the pharmacy and provide security.
- **Response:** Now patients will receive a door that will not burn without witnesses.
- **Effects:** People +22, Army +3, Treasury -18

**Choice 3:** Don't make a big deal.
- **Response:** Then the next fire will be bolder.
- **Effects:** People -10, Treasury +5

---

### Encounter #247 — Cook Gromm

**Character:** Cook Gromm
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Prisoners are hardly fed. If they die in the cells, Morwen will have less work to do, but the stench will reach the throne room.

**Choice 1:** Feeding prisoners is fine.
- **Response:** It's not mercy, it's sanitation. Sometimes they are similar.
- **Effects:** People +10, Food -10

**Choice 2:** Feed only those who work.
- **Response:** Food for work. Prison justice.
- **Effects:** Treasury +5, Food -5

**Choice 3:** Don't waste food on traitors.
- **Response:** Then the cells will soon begin to prepare their own scent.
- **Effects:** People -15, Food +10

**Choice 4:** Are they really dying of hunger?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Not yet. For now they only gnaw at crusts, walls and each other with their eyes. But a couple more days and it will start to smell like a problem.

**Choice 1:** Feed all prisoners.
- **Response:** Fine. Dead enemies are less dangerous, but smell worse.
- **Effects:** People +10, Food -10

**Choice 2:** Send prisoners to work for food.
- **Response:** At least let them dig their own graves.
- **Effects:** People -3, Treasury +10, Food -5

**Choice 3:** Let them endure.
- **Response:** Patience does not feed. But it decomposes slowly.
- **Effects:** People -15, Food +10

---

### Encounter #248 — Captain Varn

**Character:** Captain Varn
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Carts without seals go through the night gate. If you close the gates, the city will be safer, but the food will be delayed.

**Choice 1:** Close the gate at night.
- **Response:** Safer. But the morning will greet us with a line of hungry carts.
- **Effects:** People +3, Army +8, Food -10

**Choice 2:** Leave the gate open.
- **Response:** Food will come in. Hopefully not with knives.
- **Effects:** Army -8, Food +10

**Choice 3:** Check every cart.
- **Response:** Slow but sure. The gates will become eyes.
- **Effects:** Army +5, Treasury -5, Food +3

**Choice 4:** What is more often carried at night - food or danger?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Both. The trouble is that sacks of grain and sacks of daggers look the same until they are untied.

**Choice 1:** Check every cart.
- **Response:** Then we will be slow, but not blind.
- **Effects:** Army +5, Treasury -5, Food +3

**Choice 2:** Introduce night duty and inspection.
- **Response:** Fine. Even danger will pay an entrance fee.
- **Effects:** Army +3, Treasury +8, Food -3

**Choice 3:** Leave the gate open.
- **Response:** I'll put in the best people. And I won't sleep well.
- **Effects:** Army -8, Food +10

---

### Encounter #249 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** After blood and fear, people need a holiday. But the holiday is worth gold, food and peace of mind.

**Choice 1:** Have a big celebration.
- **Response:** The city will smile. Even with empty barns.
- **Effects:** People +20, Treasury -20, Food -15

**Choice 2:** Have a modest celebration.
- **Response:** Modest joy is sometimes stronger than luxurious joy.
- **Effects:** People +10, Treasury -8, Food -5

**Choice 3:** Ban holidays until stability.
- **Response:** The order has been preserved. Mood - no.
- **Effects:** People -10, Army +5, Treasury +5

**Choice 4:** Is now the time to celebrate?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Right now. When people hear only orders and funeral bells for a long time, they begin to wait not for the king, but for the end.

**Choice 1:** A modest holiday for the whole city.
- **Response:** Fine. Enough light so that the night doesn't seem forever.
- **Effects:** People +10, Treasury -8, Food -5

**Choice 2:** A holiday with the distribution of bread.
- **Response:** Expensive. But people will remember the taste of this day.
- **Effects:** People +25, Treasury -20, Food -20

**Choice 3:** Postpone the holiday.
- **Response:** Then joy will wait. I hope it doesn't go away completely.
- **Effects:** People -8, Treasury +5

---

### Encounter #250 — Merchant Selena

**Character:** Merchant Selena
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** I can give the treasury gold. In exchange, I want the right to collect tolls on the south bridge. This benefits you now and always benefits me.

**Choice 1:** Give the bridge away for a month.
- **Response:** Wonderful. A bridge is not a stone. This is a river of coins.
- **Effects:** People -8, Treasury +25, Food +5

**Choice 2:** Give the bridge away for a week.
- **Response:** A week is a short excuse to become rich. I can handle it.
- **Effects:** Treasury +10

**Choice 3:** Don't give the bridge to merchants.
- **Response:** The crown keeps the stones. I'll find another way to gold.
- **Effects:** People +5, Treasury -5

**Choice 4:** Why do you need a bridge?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Because everything passes through the bridge: grain, salt, rumors, debtors and people who think they know how to hide money.

**Choice 1:** Give the bridge away for a week and install a caretaker.
- **Response:** You give me the door, but leave your eye on the lock. Not bad.
- **Effects:** People -3, Treasury +12

**Choice 2:** Demand grain instead of gold.
- **Response:** Bread instead of coins. During the fasting month it is almost the same thing.
- **Effects:** Treasury +5, Food +20

**Choice 3:** The bridge will remain with the crown.
- **Response:** Then let the crown itself count each cart. It's boring work.
- **Effects:** People +5, Treasury -5

---

### Encounter #251 — Old Advisor Edric

**Character:** Old Advisor Edric
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your first decisions are already costing the kingdom blood, gold, bread and trust. Now we need to choose what price we are willing to pay next.

**Choice 1:** Power rests on the army.
- **Response:** The sword will hold the throne. But the sword does not know how to sow grain.
- **Effects:** People -10, Army +25, Treasury -10

**Choice 2:** Power rests on bread.
- **Response:** Hungry people are dangerous. Well-fed people at least listen.
- **Effects:** People +5, Treasury -15, Food +25

**Choice 3:** Power rests on the treasury.
- **Response:** Gold will give us time. But time bought by suffering often ends in screaming.
- **Effects:** People -10, Treasury +25, Food -10

**Choice 4:** Power rests on living people.
- **Response:** Living subjects can still forgive the king. The dead only pursue his name.
- **Effects:** People +25, Treasury -15, Food -5

**Choice 5:** What if you try to hold on to everything?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** You can. But kingdoms perish not only from bad decisions. Sometimes they die from good decisions made too late.

**Choice 1:** Distribute forces equally.
- **Response:** Careful choice. Not great, not disgraceful. Sometimes these are the ones who survive the winter.
- **Effects:** People +7, Army +7, Treasury +7, Food +7

**Choice 2:** No, first the army.
- **Response:** Then let the soldiers remember that they are protecting the kingdom, not just your door.
- **Effects:** Army +20, Treasury -10, Food -5

**Choice 3:** No, first the bread.
- **Response:** Bread is the king's quietest ally. While it is there.
- **Effects:** People +5, Treasury -12, Food +20

**Choice 4:** No, first the health of the residents.
- **Response:** You chose life. Now we need to make sure that the living have something to live on.
- **Effects:** People +20, Treasury -12

---
