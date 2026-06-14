# Questions & Choices Reference

Complete catalogue of court encounters: prompts, player choices, NPC responses, and stat effects.

**Language:** English (from `encounters_en.das`, `edric_opener.das`, `ashford.das`; story arcs documented below — implementation pending in `old_kings_household_arc.das`, `church_crown_arc.das`, `northern_price_arc.das`, `plague_cure_arc.das`, `empty_purse_arc.das`, `hungry_season_arc.das`, `guild_compact_arc.das`, `prophets_winter_arc.das`, `great_houses_arc.das`, `scaffolds_ledger_arc.das`, `star_chamber_arc.das`, `below_tapestry_arc.das`, `court_of_knives_arc.das`, `nephew_fog_arc.das`)

**Russian version:** [QUESTIONS_REFERENCE_RU.md](QUESTIONS_REFERENCE_RU.md)

**Stat order:** People, Church, Army, Treasury, Health, Loyalty, Nobility, Food, Succession

**Stat unlock cutscenes (arc writing must respect these days):**

| Day | Stat | Cutscene title | Conflict encounter (next day) |
|-----|------|----------------|------------------------------|
| 30 | Church | "The Faith" | Day **30** — [Malrik verdict](#beat-1--day-30--the-verdict) (same day, after cutscene) |
| 89 | People | "The Peasantry" | Day **90** — [Village Elder Bran](#people-unlock--day-90--the-voice-of-the-commons) |
| 175 | Nobility | "The Great Houses" | Day **175** — [Lady Ashford debut](#lady-ashford-debut-nobility-unlock) (same day, after cutscene) |
| 260 | Loyalty | "Court Loyalty" | Day **261** — [Captain Varn](#loyalty-unlock--day-261--oath-or-whisper) |
| 320 | Succession | "The Line of Succession" | Day **321** — [Old Advisor Edric](#succession-unlock--day-321--who-inherits-the-blade) |

**Stat unlock conflict pattern:** Each cutscene introduces a locked stat on day *N*. The **first fixed audience** for that stat is a conflict encounter — not a random pool pick — where a representative petitioner defines what the meter means (blessing vs usurpation, bread vs riot, blood vs brigand, oath vs whisper, heir vs knife). Church and Nobility fire **same day** after the cutscene (days 30, 175); People, Loyalty, and Succession fire **the next calendar day** (90, 261, 321). See [Stat unlock conflict encounters](#stat-unlock-conflict-encounters).

Until a stat unlocks, arc effects use **Loyalty** or banked bonuses instead of locked stats (e.g. People before day 89).

**Arc finale pattern (all persistent arcs):**

Beats **before** the finale accumulate hidden stats and flags. The **finale does not let the player pick an ending.**

1. **On load** — engine runs that arc's **outcome priority** table → sets `{arc}Outcome` and `{arc}ArcPhase = resolved`.
2. **Dialogue** — the finale speaker **informs** the player what the realm believes (thanks, curse, or cold summary). Prompt and response vary by computed outcome only.
3. **One choice** — acknowledgment only (e.g. *"I have heard enough — dismiss the court"*). Listed **Effects** are **outcome rewards**, not inputs to the label.

Mid-arc choices shape the priority table; the finale **reports** the result.

**Story arcs (fixed-day, persistent):**
- **The Old King's Household** — Days 1, 8, 16, 24, 33, 49, 58, 67, 86 — see [The Old King's Household](#the-old-kings-household-persistent-story)
- **Below the Tapestry** — Days 87–127 (8 beats) — see [Below the Tapestry](#below-the-tapestry-persistent-story)
- **The Empty Purse** — Days 11, 17, 23, 29, 36, 47, 54, 65 — see [The Empty Purse](#the-empty-purse-persistent-story)
- **The Hungry Season** — Days 42–119 (12 beats) — see [The Hungry Season](#the-hungry-season-persistent-story)
- **The Guild Compact** — Days 128–222 (12 beats) — see [The Guild Compact](#the-guild-compact-persistent-story)
- **The Northern Price** — Days 5–350 (16 beats) — see [The Northern Price](#the-northern-price-persistent-story)
- **The Crown Forfeit & Tithe War** — Days 30, 35, 37, 40, 44, 48, 55, 61, 69, 77, 108 — see [The Crown Forfeit & Tithe War](#the-crown-forfeit--tithe-war-persistent-story)
- **Grey Lung Cure Arc** — Days 25, 38, 45 (optional), 52, 70, 95, 130, 200, 340 — see [Grey Lung Cure Arc](#grey-lung-cure-arc-persistent-story)
- **The Prophet's Winter** — Days 62, 95 (or 96), 140, 187 (was 185), 265, 325 — see [The Prophet's Winter](#the-prophets-winter-wildcard--cross-arc)
- **The Great Houses** — Days 158–218 (16 beats) — see [The Great Houses](#the-great-houses-persistent-story)
- **The Scaffold's Ledger** — Days 92–183 (9 beats) — see [The Scaffold's Ledger](#the-scaffolds-ledger-persistent-story)
- **The Star Chamber** — Days 105, 155, 212, 235, 280, 318 (6 beats) — see [The Star Chamber](#the-star-chamber-wildcard--cross-arc)
- **The Court of Knives** — Days 248–315 (10 beats) — see [The Court of Knives](#the-court-of-knives-persistent-story)
- **The Nephew in the Fog** — Days 234–335 (10 beats) — see [The Nephew in the Fog](#the-nephew-in-the-fog-persistent-story)

**Arc day priority (when days collide):** **Stat unlock conflict days (30, 90, 175, 261, 321)** override random pool and defer non-unlock arcs on those days → Church day 30 (unlock) → Household (until day 86) → **Below the Tapestry (87–127)** → Empty Purse (until day 65) → **Hungry Season (42–119)** → **Scaffold's Ledger (92–183)** — opens day **92** (not 90; People unlock conflict owns day 90) → Grey Lung plague days (**day 130:** Grey Lung only — Below the Tapestry finale is day **127**) → **Day 95:** Grey Lung resolution beats Prophet's Winter (Prophet defers to day 96) → Northern Price → Church tithe beats → **Guild Compact (128–222)** interleaves with Great Houses (158–218) on non-overlapping days → **Day 185:** Great Houses beats Prophet's Winter (Prophet defers to day 187) → Star Chamber (sparse) → Prophet's Winter (other beats) → **Loyalty unlock conflict day 261** (defers pool only) → **Nephew in the Fog (234–335)** interleaves Court of Knives (248–315) on non-overlapping days; Talen **257** (not 255), Knox **271** (not 268) → Court of Knives wraps Loyalty unlock (260); Ilana day **276** (Star Chamber owns 280) → **Succession unlock conflict day 321** → **Day 335:** Nephew Prophet coda (not Prophet arc beat) → Grey Lung day 340 → other. No days currently overlap.

**Pools (day routing — implementation pending in `question_pools.das`):**

| Pool | Indices | Calendar days | Stat focus |
|------|---------|---------------|------------|
| Early | 0–29 | 1–10 | No People (index 0 = Edric tutorial, replaced at runtime) |
| Mid | 30–79 | 11–29 | No People |
| Late A | 80–159 | 30–89 | Church+ from day 30 (index 80 = Church unlock fixed) |
| Late B | 160–179 | 30–89 | Extension |
| People | 180–251 | **90–174** | People unlocked (day 89) |
| Nobility | 252–306 | **175–259** | + Nobility (day 175) |
| Loyalty | 307–350 | **260–319** | + Loyalty (day 260) |
| Succession | 351–390 | **320–365** | + Succession (day 320) |

**Total pool encounters:** 391 (252 existing + 139 new)

**Pool stat rules (effects in encounter text):**

| Pool era | Stats allowed in Effects | Stats must be 0 |
|----------|--------------------------|-----------------|
| People (90–174) | People, Church, Army, Treasury, Health, Food | Nobility, Loyalty, Succession |
| Nobility (175–259) | Above + Nobility | Loyalty, Succession |
| Loyalty (260–319) | Above + Loyalty | Succession |
| Succession (320–365) | All 9 stats | — |

See [Pool coverage audit](#pool-coverage-audit) for 365-day sufficiency after story arcs.

**Portrait assets:** 47 files in `static/Portraits/` — see [Characters](#characters).

---

## Characters

| File | Display name | Encounter name | In game |
|------|--------------|----------------|---------|
| `ambassador_ingvar.png` | Ambassador Ingvar | Ambassador Ingvar | Court petitioner |
| `apothecary_sybil.png` | Apothecary Sivil | Apothecary Sivil | Court petitioner (portrait file: sybil) |
| `astrologer_meribald.png` | Astrologer Meribald | — | Star Chamber arc (visitor: "The Wizard") |
| `banker_dominic_salt.png` | Banker Dominic Salt | — | Empty Purse + Guild Compact arcs |
| `baroness_yvette_crow.png` | Baroness Yvette Crow | — | Great Houses arc |
| `bishop_yarmak.png` | Bishop Yarmak | High Priest Malrik | Court petitioner + visitor ("The Bishop") |
| `bodyguard_raena.png` | Bodyguard Raena | — | Household + Empty Purse arcs |
| `chronicler_ilana.png` | Chronicler Ilana | — | Great Houses + Guild Compact arcs |
| `colonel_marcus_grey.png` | Colonel Marcus Grey | Captain Varn | Court petitioner |
| `cook_gromm.png` | Cook Gromm | Cook Gromm | Court petitioner |
| `countess_marianna_dell.png` | Countess Marianna Dell | — | Great Houses arc |
| `deserter_finn.png` | Deserter Finn | — | Empty Purse arc |
| `drunken_knight_brom.png` | Drunken Knight Brom | — | Asset only |
| `duke_the_goose.png` | Duke the Goose | — | Great Houses arc |
| `executioner_morwen.png` | Executioner Morwen | Executioner Morwen | Scaffold's Ledger + Great Houses arcs |
| `folk_singer_elina.png` | Folk Singer Elina | — | Hungry Season arc |
| `general_rudolf_steeel.png` | General Rudolf | General Rudolf | Court petitioner |
| `head_of_guild_fara.png` | Head of Guild Fara | — | Hungry Season + Guild Compact arcs |
| `healer_mira.png` | Healer Mira | Healer Mira | Court petitioner |
| `inquisitor_cyrus.png` | Inquisitor Cyrus | — | Church arc |
| `king.png` | The King | — | Player portrait |
| `lady_ashford.png` | Lady Ashford | Lady Ashford | Nobility unlock + Great Houses + Nephew in the Fog arcs |
| `lord_kaspar_vayne.png` | Lord Kaspar Vayne | — | Great Houses arc |
| `lord_raymond_the_landless.png` | Lord Raymond the Landless | — | Great Houses arc |
| `maid_lissa.png` | Maid Lissa | — | Below the Tapestry arc |
| `master_of_the_mint_nerius.png` | Master of the Mint Nerius | — | Guild Compact arc |
| `mercenary_kara.png` | Mercenary Kara | — | Empty Purse + Northern arcs |
| `merchant.png` | The Merchant | — | Visitor portrait |
| `merchant_selena_ro.png` | Merchant Selena | Merchant Selena | Court petitioner |
| `millers_wife_ruta.png` | Miller's Wife Ruta | — | Hungry Season arc |
| `miner_yarek.png` | Miner Yarek | — | Hungry Season arc |
| `monk_arvel.png` | Monk Arvel | Monk Arvel | Court petitioner |
| `nameless_prophet.png` | Nameless Prophet | — | Prophet's Winter arc |
| `old_advisor_edric.png` | Old Advisor Edric | Old Advisor Edric | Court petitioner + day-1 tutorial + advisor UI |
| `peasant.png` | The Peasant | — | Visitor portrait |
| `plague_doctor_odo.png` | Plague Doctor Odo | — | Grey Lung arc (scandal path) |
| `royal_jester_til.png` | Royal Jester Til | — | Below the Tapestry arc |
| `royal_scribe_osric.png` | Royal Scribe Osric | — | Household arc |
| `saint_fox.png` | Saint Fox | — | Prophet's Winter arc (beat 3 only) |
| `sir_otto_the_silent.png` | Sir Otto the Silent | — | Empty Purse arc |
| `sister_velda.png` | Sister Velda | — | Church arc |
| `spy_knox.png` | Spy Knox | — | Northern + Guild Compact arcs |
| `talen.png` | Talen | — | Scaffold's Ledger + Court of Knives + Nephew in the Fog arcs |
| `the_masked_one.png` | The Masked One | — | Court of Knives + Nephew in the Fog arcs |
| `treasurer_borvin_copperhand.png` | Treasurer Borvin | Treasurer Borvin | Court petitioner |
| `veteran_orm.png` | Veteran Orm | — | Household arc |
| `village_elder_bran.png` | Village Elder Bran | — | Hungry Season arc (portrait: peasant body sprite) |

---

## Special Encounters (outside random pools)

### Encounter #0 — Day 1 Tutorial — Old Advisor Edric

**Character:** Old Advisor Edric
**Note:** Replaces pool encounter #0 on day 1 (POOL_EARLY_FIXED_IDX). **Beat 1** of [The Old King's Household](#the-old-kings-household-persistent-story) arc — node 1 always follows node 0.
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Old Advisor Edric. The blade has placed you on the throne, but blades alone cannot keep it. From this day forward, each dawn will bring a petitioner through your door. Every answer you give will shift the measures of the realm. Let any measure fall to nothing, and your reign ends. How do you mean to bear it?

**Choice 1:** Steadily — I will weigh each crisis before I decide
- **Response:** Wise. Haste crowned many kings and buried them faster. I will bring the first petitioner when you are ready to listen.
- **Effects:** Loyalty +5
- **Sets tone:** `steady`
- **Next node:** 1

**Choice 2:** Boldly — a king who hesitates is a king who falls
- **Response:** Then let none mistake silence for weakness. The court will test you soon enough.
- **Effects:** Army +5
- **Sets tone:** `bold`
- **Next node:** 1

**Choice 3:** Mercifully — I will not rule as the old king did
- **Response:** Mercy wins hearts the sword cannot touch. Guard it — the realm devours soft kings as readily as cruel ones.
- **Effects:** Church +2, Army -2
- **Sets tone:** `merciful`
- **Next node:** 1

#### Node 1

**Prompt:** Your Majesty, one matter before the petitioners begin. King Edwin's people did not vanish when his heart stopped — cooks, guards, clerks, confessors, and names on ledgers that still breathe. Six of his servants still sleep under this roof. The coup took the crown; it did not take their habits. How do you mean to treat the old king's household?

**Choice 1:** Root them out — no ghost of Edwin serves my court
- **Response:** Steel on the first week. The court will call it cruelty — until the calling stops. I will remember you chose the broom.
- **Effects:** Army +3, Loyalty -3
- **Sets stance:** `purge`

**Choice 2:** Keep those who kneel — usefulness before blood
- **Response:** Pragmatic. Old hands know where the passages leak and which lords still dine on memory. Dangerous, if you trust too easily.
- **Effects:** Loyalty +4, Treasury -3
- **Sets stance:** `integrate`

**Choice 3:** Let the dead king keep his ghosts — I have larger worries
- **Response:** Then do not be surprised when those ghosts vote in whispers. I will count them for you, if you will not.
- **Effects:** Church +3, Succession -4
- **Sets stance:** `ignore`

**Choice 4:** Justice for the guilty, mercy for the innocent
- **Response:** A fine sentence. Harder to govern. Every beat of this reign will test whether you meant it.
- **Effects:** Loyalty +2, Church +2
- **Sets stance:** `selective`

---

### Lady Ashford Debut (Nobility unlock)

**Character:** Lady Ashford
**Note:** [Nobility stat unlock conflict](#stat-unlock-conflict-encounters) — fires **day 175** after Great Houses cutscene. Replaces random pool. Not from question pools.
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

## Stat unlock conflict encounters

Fixed audiences that replace the random pool on their day. Each defines the **conflict** behind a newly unlocked stat — the same role Church day 30 (Malrik) plays for Faith. Implementation: `stat_unlock_intro.das` (pending) queues these after cutscenes via `apply_encounter_after_stat_cutscene()` in [`question_pools.das`](question_pools.das).

| Stat | Cutscene day | Conflict day | Character | Document |
|------|--------------|--------------|-----------|----------|
| Church | 30 | 30 (same day) | High Priest Malrik | [Crown Forfeit beat 1](#beat-1--day-30--the-verdict) |
| People | 89 | **90** | Village Elder Bran | [below](#people-unlock--day-90--the-voice-of-the-commons) |
| Nobility | 175 | 175 (same day) | Lady Ashford | [Ashford debut](#lady-ashford-debut-nobility-unlock) |
| Loyalty | 260 | **261** | Captain Varn | [below](#loyalty-unlock--day-261--oath-or-whisper) |
| Succession | 320 | **321** | Old Advisor Edric | [below](#succession-unlock--day-321--who-inherits-the-blade) |

**Visitor textures:** People intro uses `VISITOR_PEASANT_IDX` (`village_elder_bran.png` body). Nobility uses `VISITOR_LADY_ASHFORD_IDX`. Church uses `VISITOR_BISHOP_IDX` during Malrik beat. Loyalty and Succession use court petitioner sprites (Varn, Edric).

**Runtime routing (pending):**

```
Day N cutscene ends → if stat == Church → church_crown_arc beat 1
                    → if stat == Nobility → ashford_debut
                    → if stat == People → queue day 90 bran intro (or fire day 89 if same-day preferred)
                    → if stat == Loyalty → queue day 261 varn intro
                    → if stat == Succession → queue day 321 edric intro
```

---

### People unlock — Day 90 — The Voice of the Commons

**Character:** Village Elder Bran
**Note:** Fires **day 90** (morning after day 89 Peasantry cutscene). Replaces random pool and defers [Scaffold's Ledger beat 1](#beat-1--day-92--cells-after-the-household) to day **92**. First encounter where **People** effects apply live. Callback [Hungry Season](#the-hungry-season-persistent-story) and [Northern refugees day 91](#beat-9--day-91--refugees-at-the-ford).
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Bran — elder of Millford, speaker for villages that fed Edwin's wars and starved through your coup. Yesterday the court learned a new word for us on the bar. Today we learn whether you hear it. The commons do not read ledgers — they read bellies, boots, and whether the king's guard kicks down doors. I heard hunger in the provinces before your throne was warm. Do you rule for the people, tax the people, or fear the people?

**Prompt variant (`hungryArcPhase = active`):** Your Majesty, I heard famine reached the ford before your heralds reached us. The new measure on your bar names us — good. Name us hungry honestly, and we may still kneel.

**Prompt variant (`northernTrust` ≤ −15):** Your Majesty, I heard the north sends refugees while the south sends tax collectors. The people measure you by which arrives first.

**Choice 1:** Hear the commons — bread before banners
- **Response:** Then hear this: empty granaries are louder than trumpets. Feed us, and we forget Edwin. Starve us, and we remember him fondly.
- **Effects:** People +15, Food -10, Treasury -5
- **Sets tone:** `bread_first`
- **Next node:** 1

**Choice 2:** Tax fairly — every sack counted, every house pays
- **Response:** Fair words. Fair collectors are rarer than fair kings. We will watch the scales.
- **Effects:** People -8, Treasury +15, Food -5
- **Sets tone:** `iron_ledger`
- **Next node:** 1

**Choice 3:** Fear keeps order — disperse village delegations
- **Response:** Fear feeds riots slower than hunger — but it feeds them nonetheless. You chose the shorter leash.
- **Effects:** People -15, Army +10, Loyalty -6
- **Sets tone:** `iron_fist`
- **Next node:** 1

**Choice 4:** What do the villages want first?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Your Majesty, three things — grain, justice, and a king who does not pretend the coup was a blessing. I heard you chose your tone. Grain we can measure. Justice we will test when your bailiff beats a widow. Blessing we leave to Malrik.

**Prompt variant (`bread_first`):** Your Majesty, I heard you put bread first. Then open the crown granaries before the guild merchants do. The people will call it mercy — until the sacks run dry.

**Prompt variant (`iron_ledger`):** Your Majesty, I heard you put the ledger first. Then post the rates in the square. Hidden tax is called theft, even when a king signs it.

**Prompt variant (`iron_fist`):** Your Majesty, I heard you put fear first. Then post guards where I stand. The people will call it rule — until someone throws a stone.

**Choice 1:** Open crown granaries to the commons
- **Response:** Then Millford will sing your name before winter. One village — many ears.
- **Effects:** People +18, Food -15, Treasury -8

**Choice 2:** Promise justice — send judges to the provinces
- **Response:** Promises are cheap. Judges are expensive. We will see which you keep.
- **Effects:** People +10, Treasury -10, Army +3

**Choice 3:** The crown cannot feed every village — survive on your own
- **Response:** Then survive we shall — without loving you. Remember that on the day the mob learns your name.
- **Effects:** People -12, Treasury +8, Army +5

---

### Loyalty unlock — Day 261 — Oath or Whisper

**Character:** Captain Varn
**Note:** Fires **day 261** (morning after day 260 Court Loyalty cutscene). Replaces random pool. Post–[Court of Knives](#the-court-of-knives-persistent-story) era; first encounter where **Loyalty** effects apply live. Two days before Court Knox beat day 262.
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the court has a new measure today — loyalty. I command the palace guard. I heard smiles at your coronation; I hear prices now. Every chamberlain, cook, and clerk sells whispers. My men swear to the crown. The question is whether the crown swears back. Do you demand oaths, buy loyalty, or spy on your own house?

**Prompt variant (`knivesArcPhase = active`):** Your Majesty, I heard foreign coins and masked audiences before loyalty had a name on your bar. Name it now — or the knives name it for you.

**Prompt variant (`householdOutcome = haunted_palace`):** Your Majesty, I heard Edwin's ghosts still vote in the halls. Loyalty cannot measure ghosts — only the living who admit they stay.

**Choice 1:** Public oaths — every servant swears to the living king
- **Response:** Then the square hears unity. The disloyal hear unemployment. Both useful.
- **Effects:** Loyalty +15, Army +5, People -5
- **Sets stance:** `oath`
- **Next node:** 1

**Choice 2:** Pay the household — loyalty has a wage
- **Response:** Gold buys silence in corridors. Not forever — but through winter, perhaps.
- **Effects:** Loyalty +10, Treasury -18, People +3
- **Sets stance:** `pay`
- **Next node:** 1

**Choice 3:** Spy on the court — loyalty proven by fear
- **Response:** Then I will help you watch. And wonder who watches me. Efficient — and corrosive.
- **Effects:** Loyalty +8, People -8, Army +3
- **Sets stance:** `spy`
- **Next node:** 1

**Choice 4:** Trust until broken — a king without paranoia
- **Response:** Brave. Rare. The last king who trusted died in his bed — briefly.
- **Effects:** Loyalty -5, People +5, Nobility +5
- **Sets stance:** `trust`
- **Next node:** 1

#### Node 1

**Prompt:** Your Majesty, one test. A guard was offered gold to leave your door unlatched tonight. He reported it — or he took it. I need your verdict before loyalty becomes rumor.

**Prompt variant (`oath`):** Your Majesty, I heard you chose oaths. Hang the bribed guard and make the household swear again at dawn.

**Prompt variant (`pay`):** Your Majesty, I heard you chose wages. Pay the honest guard double and transfer the tempted one to the stables.

**Choice 1:** Reward the honest guard — promote before the court
- **Response:** Then loyalty learns your handwriting. Others will report offers — for a time.
- **Effects:** Loyalty +12, Army +5, Treasury -8

**Choice 2:** Punish the tempted guard — mercy if he names the buyer
- **Response:** Names buy pardons. Useful — if you act on the names.
- **Effects:** Loyalty +8, People -3, Army +3

**Choice 3:** Ignore the test — kings do not chase every coin
- **Response:** Then the next offer may not be reported. You chose calm over certainty.
- **Effects:** Loyalty -8, Treasury +5

---

### Succession unlock — Day 321 — Who Inherits the Blade

**Character:** Old Advisor Edric
**Note:** Fires **day 321** (morning after day 320 Line of Succession cutscene). Replaces random pool. Three days before [Nephew unmasking day 322](#beat-8--day-322--unmasking). First encounter where **Succession** effects apply live. Distinct from [Nephew finale](#beat-9--day-328--legitimacy-finale).
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, succession now sits on your bar beside army and church — the question you avoided since the coup: who inherits if you fall? I survived three reigns by asking it early. Edwin had blood. You have blade. The realm wants a name before winter politics offers one for you. Do you name an heir, deny the question, or let the houses fight over the answer?

**Prompt variant (`heirArcPhase = active`):** Your Majesty, I heard fog speaks Edwin's nephew. Succession on your bar makes that fog expensive. Name your story before the mask names his.

**Prompt variant (`prophetOutcome` set):** Your Majesty, I heard the prophet sold omens of empty thrones. Succession is the realm's attempt to fill the omen with law.

**Choice 1:** Name a successor — crown chooses its own continuity
- **Response:** Then ink and blood align — for a day. Every named heir gains enemies before allies.
- **Effects:** Succession +12, Nobility +8, Loyalty +5, People -5
- **Sets stance:** `named_heir`
- **Next node:** 1

**Choice 2:** Deny the question — the living king needs no shadow
- **Response:** Defiance. The realm will answer anyway — in couriers, cousins, and knives.
- **Effects:** Succession +15, Loyalty -8, Nobility -6
- **Sets stance:** `no_heir`
- **Next node:** 1

**Choice 3:** Let council elect — succession by vote after you
- **Response:** Democracy of vultures. Bold. Ashford will call it eastern. It may hold.
- **Effects:** Succession +8, Nobility +10, Treasury -10, Army -3
- **Sets stance:** `election`
- **Next node:** 1

**Choice 4:** What does Edwin's law say?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt:** Your Majesty, Edwin's law says blood. Your law says survival. The church says rite. The army says strongest sword. Pick which ledger outlives you — or watch them fight on your grave.

**Prompt variant (`named_heir`):** Your Majesty, I heard you named an heir. Publish it before Malrik publishes a sermon correcting you.

**Prompt variant (`no_heir`):** Your Majesty, I heard you refused a name. Then prepare for every cousin with a claim and every priest with a prophecy.

**Choice 1:** Publish succession law this week
- **Response:** Then lawyers eat well. Rebels eat better when confused — but confusion ends.
- **Effects:** Succession +10, Church +5, Treasury -8

**Choice 2:** Quiet letters to great houses only
- **Response:** Private succession — public rumor. Classic. Dangerous. Yours.
- **Effects:** Succession +6, Nobility +8, Loyalty -4

**Choice 3:** Delay — winter first, dynasty later
- **Response:** Delay feeds pretenders. You chose one more season of fog.
- **Effects:** Succession +8, Army +5, People -5

---

## The Old King's Household (persistent story)

Multi-day story arc spanning days 1–86. Edwin's servants, guards, clerks, and confessors still haunt the usurper's court. Each beat replaces the random pool encounter on its scheduled day. Characters reference prior choices in dialogue — implementation swaps prompt/response variants via `householdBeatFlags`, not live stat checks.

**Arc state (runtime):** `householdStance` (purge / integrate / ignore / selective), `householdTone` (steady / bold / merciful — from Edric node 0), `householdConsistency` (0–100, rises when choices match stance; falls when player zigzags), per-beat flags (`householdKeptGromm`, `householdPurgedGuards`, `householdCutClerks`, `householdShelteredConfessor`, `householdChurchDeal`, `householdSelenaBribe`, `householdVeteranPurge`), `householdOutcome` (none / clean_court / turned_household / haunted_palace / ledger_king / iron_crown)

**Cross-reference rule:** Each beat after day 8 includes a callback line keyed to the **most recent relevant flag** or `householdStance`. If no flag matches, use the stance-default prompt variant listed in **Note**.

**Beat schedule (no overlap with Grey Lung days 25, 38, 45, 52, 70…):**

| Day | Character | Beat |
|-----|-----------|------|
| 1 | Old Advisor Edric | Tutorial + household seed (nodes 0–1) |
| 8 | Cook Gromm | The kitchen remembers |
| 16 | Captain Varn | Old swords on the wall |
| 24 | Royal Scribe Osric | Ghost signatures |
| 33 | Monk Arvel | The confessor in the cloister |
| 49 | Merchant Selena | Loyalists buy grain |
| 58 | Veteran Orm | Veterans who will not kneel |
| 67 | Bodyguard Raena | Who stands at the door |
| 86 | Old Advisor Edric | Verdict on the household |

**Merged into Church arc:** Former Beat 6 (day 41 Malrik) — callbacks appear in [Crown Forfeit beat 3 (day 37)](#beat-3--day-37--the-other-half-of-the-church) when `householdShelteredConfessor` or `householdChurchDeal` is set.

**Possible endings:** Clean Court · Turned Household · Haunted Palace · The Ledger King · Iron Crown

### Household — beat resolution rules

**Day 86 outcome priority:** `householdConsistency` ≥ 70 and stance `purge` → **clean_court** · stance `integrate` + `householdKeptGromm` → **turned_household** · stance `ignore` → **haunted_palace** · stance `selective` → **ledger_king** · consistency &lt; 30 → **iron_crown** (mixed mercy and cruelty) · else fallback **ledger_king**.

**People stat before day 89:** Effects listed as People apply on day 86+; before that, bank or substitute Loyalty per beat **Note**.

**Church unlock day 30:** Household Beat 5 (day 33 Arvel) follows the Church arc opener. Former Household Malrik beat (day 41) merged into Church arc day 37.

---

### Beat 2 — Day 8 — The Kitchen Remembers

**Character:** Cook Gromm
**Note:** Default prompt if no prior beats beyond day 1. If `householdStance = purge`: Gromm opens frightened. If `integrate`: cooperative. If `ignore`: Gromm assumes he stays. If `selective`: Gromm asks who counts as innocent.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I cooked for King Edwin the night before the coup — and I cook for you now. The kitchen staff whisper which crown they serve. I heard you told Edric you would not rule like the old king — so I ask before someone else asks for you: do I keep my place, or do I keep my head?

**Prompt variant (`purge`):** Your Majesty, I cooked for Edwin the night the blades came. I heard you mean to root out his household — the scullions are already packing. I know which lords ate poisoned wine that never reached the table. Turn me out, and you lose that memory. Turn me in, and you lose my ovens.

**Prompt variant (`integrate`):** Your Majesty, Edric says you keep those who kneel. I kneel. I also know every passage behind the pantry and which guard still spits when your name is said. Keep me, and the kitchens stay yours. Dismiss me, and Edwin's cook feeds someone else by winter.

**Choice 1:** Keep Gromm — the kitchens stay open
- **Response:** Then I serve you as I served him — with discretion. The first lesson: do not trust the soup on feast nights.
- **Effects:** Food +8, Loyalty +4, Succession -2
- **Sets flag:** `householdKeptGromm`

**Choice 2:** Dismiss him — replace the kitchen staff
- **Response:** As you will. The new cooks will learn slowly. The old ones will learn elsewhere.
- **Effects:** Army +3, Food -8, Loyalty -4
- **Clears flag:** `householdKeptGromm`

**Choice 3:** Question him — then decide
- **Response:** Wise. Ask about the wine, the passages, and the guard who still wears Edwin's badge under his coat. Then decide if mercy feeds you or kills you.
- **Effects:** Loyalty +2, Succession +3
- **Sets flag:** `householdKeptGromm` (provisional — confirmed if not purged by day 16)

---

### Beat 3 — Day 16 — Old Swords on the Wall

**Character:** Captain Varn
**Note:** Callback to Beat 2. If `householdKeptGromm`: Varn references kitchen mercy. If Gromm dismissed: Varn references purge. If day 1 `bold`: Varn expects hard line.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. I heard you kept Gromm in the kitchens — my men want to know if old swords get the same mercy, or only old spoons. Give me an order before they give themselves one.

**Prompt variant (Gromm dismissed):** Your Majesty, Gromm is gone and the kitchens already suffer for it. I heard you mean to scour the household — my twelve guards are not waiting to be discovered. I can replace them with men who answer only to you, or I can arrest them tonight. Choose before they choose for you.

**Prompt variant (`ignore` stance):** Your Majesty, you told Edric the dead king could keep his ghosts. My guards took that literally — they still toast Edwin on night watch. I heard you prefer patience. Patience is not the same as permission.

**Choice 1:** Replace them — new guard, no Edwin's men
- **Response:** Done by morning. The old ones will hate you. The new ones will owe you. That is the trade.
- **Effects:** Army +10, Loyalty -6, Treasury -5
- **Sets flag:** `householdPurgedGuards`

**Choice 2:** Swear them to me — keep the swords, change the oath
- **Response:** I will extract their oaths before dawn. If one refuses, you will hear it from me first.
- **Effects:** Army +5, Loyalty +5, Succession -3

**Choice 3:** Arrest the ringleaders — mercy for the rest
- **Response:** Selective steel. The barracks will call it justice or spite depending on tomorrow's rations.
- **Effects:** Army +3, Loyalty -2, Church +2
- **Sets flag:** `householdSelectiveGuards`

---

### Beat 4 — Day 24 — Ghost Signatures

**Character:** Royal Scribe Osric
**Note:** Callback to Beats 2–3. References kitchen and guard choices. Day 24 is before Grey Lung (day 25) and after Empty Purse beat 3 (day 23 may have fired).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. I heard you kept Gromm, and Varn reforged the guard. Yet warrants signed in a dead king's name still leave this room. Which forgery is yours: the seal, the clerk, or the silence?

**Prompt variant (`householdPurgedGuards` + Gromm dismissed):** Your Majesty, you purged the kitchens and the barracks but my copyists still draw coin as if Edwin breathes. I heard the bold talk on day one — finish what you began, or my archive makes you a liar.

**Prompt variant (`ignore`):** Your Majesty, you chose to let ghosts walk. The ghosts still sign decrees. I heard patience from Edric's lips; I hear forgers in the night. Even ghosts need ink.

**Choice 1:** Burn Edwin's seal — new scribes, new hand
- **Response:** The archives will riot in parchment before steel. But the throne will sign in your name alone.
- **Effects:** Treasury +12, Loyalty -8, Succession +4
- **Sets flag:** `householdCutClerks`

**Choice 2:** Pay one season — then dissolve the ghost offices
- **Response:** A soft landing. Expensive. The copyists will use the season to plot or pray.
- **Effects:** Treasury -10, Loyalty +3, Succession +2

**Choice 3:** Investigate — find who still collects under Edwin's seal
- **Response:** Then we follow the wax. Names will surface. Some will be innocent. None will be cheap.
- **Effects:** Treasury -5, Loyalty +5, Succession +6

---

### Beat 5 — Day 33 — The Confessor in the Cloister

**Character:** Monk Arvel
**Note:** Follows Church unlock (day 30). Callback to Osric and day 1 stance. If `householdCutClerks`: Arvel mentions hungry clerks fleeing to monastery.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Brother Aldo confessed King Edwin every seventh day — he still does, to an empty throne. I heard you burned Edwin's seal or cut his ghost offices last week. Three of them fled to my gate with Osric's ink on their fingers. Aldo asks whether the new king shelters priests, or only hungers for names.

**Prompt variant (`merciful` tone):** Your Majesty, I feed the poor at my gate. Lately I feed Edwin's dismissed clerks too. I heard you told Edric you would not rule like the old king — Aldo asks if that mercy extends to the men who heard his sins.

**Prompt variant (`purge`):** Your Majesty, your purge reached my threshold. Aldo will not surrender his ledger of confessions. I heard you root out Edwin's people — will you root through God's closet as well?

**Choice 1:** Shelter Aldo — priests are not clerks
- **Response:** Then he stays under my roof and your risk. Malrik will hear of it before sunset.
- **Effects:** Church +8, Loyalty +4, Succession -5
- **Sets flag:** `householdShelteredConfessor`

**Choice 2:** Surrender him to the crown for questioning
- **Response:** He will come quietly. What he knows about lords and sins could fill a scaffold schedule.
- **Effects:** Nobility -8, Succession +8, Loyalty -4
- **Sets flag:** `householdChurchDeal`

**Choice 3:** Exile him — send Aldo east with coin
- **Response:** Gold buys silence and distance. Whether it buys enough depends on how loudly he prays on the road.
- **Effects:** Treasury -8, Church +3, Succession +3

---

### Beat 6 — Day 41 — _Merged into Church arc_

**Character:** High Priest Malrik  
**Note:** This beat no longer fires on day 41. Content merged into [Crown Forfeit & Tithe War — Beat 3 (day 37)](#beat-3--day-37--the-other-half-of-the-church). Household arc jumps from day 33 (Arvel) to day 49 (Selena).

---

### Beat 7 — Day 49 — Loyalists Buy Grain

**Character:** Merchant Selena
**Note:** Callback to Varn (`householdPurgedGuards` squeezes caravans), Osric, Malrik. Grey Lung optional day 45 may have fired — Selena can reference fever in variant if `plagueArcPhase = active`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, loyalist households still buy grain through my caravans — they pay in Edwin's sealed notes and curse your name between mouthfuls. I heard Captain Varn tightened the gates after you purged his old guard. That squeezes my routes and their purses. Do you want loyalists starved, spied on, or sold to you?

**Prompt variant (`householdKeptGromm` + no purge):** Your Majesty, Gromm still feeds your court and I still feed the realm. I heard you favor mercy in the kitchens. Loyalists ask whether that mercy extends to merchants who remember Edwin — or only to cooks who betrayed him.

**Prompt variant (plague arc active):** Your Majesty, Grey Lung makes every house hoard. Loyalists pay triple for grain and swear Edwin would not have let the ports cough. I heard you fund physic in the wards — do you also mean to strangle old names while the fever spreads?

**Choice 1:** Seize loyalist storehouses — feed the crown first
- **Response:** Hungry enemies are slow enemies. Hungry subjects are loud subjects. Choose which noise you prefer.
- **Effects:** Food +15, Loyalty -10, Treasury +8

**Choice 2:** Spy through Selena's routes — names for gold
- **Response:** I will sell you names, not honor. Remember I can sell yours as well if the price changes.
- **Effects:** Treasury -6, Succession +10, Loyalty -3
- **Sets flag:** `householdSelenaBribe`

**Choice 3:** Ignore loyalist trade — legal grain only
- **Response:** Then they eat in shadows and thank Edwin by candlelight. You will not see the cost until a province stops paying tax.
- **Effects:** Food -5, Loyalty +4, Succession -4

---

### Beat 8 — Day 58 — Veterans Who Will Not Kneel

**Character:** Veteran Orm
**Note:** Callback cumulative — Gromm, Varn, Selena, Malrik. If inconsistent choices: Orm mentions mixed signals. If `householdPurgedGuards`: veterans angry. If [Empty Purse](#the-empty-purse-persistent-story) active: references unpaid muster.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I wore Edwin's tabard at Grey Pass and I wear yours now — but three companies still toast the dead king in the barracks. I heard you kept his cook, reforged his guard, cut his scribes, and bought names from Selena — each week a different message. Soldiers follow clarity. Tell me whether we purge brothers, pay them, or parade them before the men who replaced them.

**Prompt variant (`purge` consistent):** Your Majesty, you have been consistent — steel in the kitchen, steel in the guard, steel in the archive. I heard the court call you cruel. The companies call you clear. We still resist. Give me leave to finish what you began — or give me coin.

**Prompt variant (`integrate` + `householdKeptGromm`):** Your Majesty, I heard mercy bought Gromm and oaths bought the guard. Veterans call it treason with better table manners. We want proof the usurper is still a soldier's king — and that soldier's king still pays.

**Prompt variant (`emptyPurseCrisis` set):** Your Majesty, I heard Rudolf beg Borvin and Borvin beg heaven. The companies heard emptier purses. We will kneel when the crown kneels to arithmetic — or we will march.

**Choice 1:** Purge the veteran companies — Edwin's oath is treason
- **Response:** Then blood in the barracks before spring. The rest will kneel harder — if you pay the rest.
- **Effects:** Army +12, Loyalty -12, Succession +6
- **Sets flag:** `householdVeteranPurge`

**Choice 2:** Pay them off — gold buys forgetfulness
- **Response:** Expensive peace. Cheaper than mutiny until the next empty purse.
- **Effects:** Treasury -18, Army +8, Loyalty -4

**Choice 3:** Parade a pardon — public oath to the new king
- **Response:** Theater with swords. If it works, you gain a song. If it fails, you gain a riot.
- **Effects:** Army +5, Loyalty +6, Nobility -5

---

### Beat 9 — Day 67 — Who Stands at the Door

**Character:** Bodyguard Raena
**Note:** Callback entire arc — lists cumulative flags in prompt. Pre-resolution judgment at the king's threshold (not the scaffold). Grey Lung Beat 4 is day 70 — this beat sets tone before plague crisis.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, my post is your door — not the yard below. Yet Varn sent prisoners here, Osric's audit named clerks, and Arvel's gate still shelters whispers unless you forbade it. I heard mercy in the kitchens, steel in the barracks, gold in the market, and prayer in the cloister. The stair asks a simpler question: who do I turn away when the palace is full of Edwin's names?

**Prompt variant (`householdShelteredConfessor` + no purge):** Your Majesty, you sheltered priests and spared cooks while petitioners crowd my landing. I heard selective justice from Edric's lips on day one. The prisoners heard it too. They ask why Aldo breathes free and they wait on my mat.

**Prompt variant (`householdVeteranPurge`):** Your Majesty, Orm's purge sent thirty names to the lower gate. I heard consistency at last. My sword arm aches from turning them away. The realm expects a crown that finishes sentences — not only begins them at the threshold.

**Choice 1:** Amnesty — open the door to loyalists you have held
- **Response:** The stair goes quiet. The whispers do not. You have chosen mercy twice — pray it rhymes.
- **Effects:** Loyalty +12, Army -6, Succession -8

**Choice 2:** Send ringleaders to Morwen — mercy for the rest at the door
- **Response:** A few swings below, many sighs above. The middle path — until the next crisis.
- **Effects:** Army +6, Loyalty -4, Succession +5

**Choice 3:** Bar the door — every loyalist name waits outside
- **Response:** Then I hold the stair and the realm learns coldness by knocking. You will not lack for enemies at dawn.
- **Effects:** Army +8, Loyalty -15, Succession +10, Church +5

---

### Beat 10 — Day 86 — Verdict on the Household

**Character:** Old Advisor Edric
**Note:** Arc finale. **On load:** run [day 86 outcome priority](#household--beat-resolution-rules) → `householdOutcome`, `householdArcPhase = resolved`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `clean_court`):** Your Majesty, eighty-six days since you told me how you would bear Edwin's household — and the court has its answer. I heard Gromm dismissed or driven out, Varn replaced, Osric's ghosts locked away. The kitchens are quiet. The barracks call you iron. You cleansed the court. History will argue justice. It will not argue hesitation.

**Prompt (outcome `turned_household`):** Your Majesty, Edwin's cook still feeds you, Edwin's guard still watches your stair, and you still watch them. I heard mercy became policy. The household did not vanish — it changed collars. Dangerous — but the kitchens are warm, and the realm calls you a king who keeps witnesses.

**Prompt (outcome `haunted_palace`):** Your Majesty, you had greater wars, you said — and Edwin's people still walk these halls like smoke. I heard whispers in the archive, prayers in the cloister, old songs in the yard. You chose a haunted palace. The court obeys. It does not forget.

**Prompt (outcome `ledger_king`):** Your Majesty, you ruled case by case — no doctrine, only judgment. I heard mercy for Gromm, rope for others, coin for Selena, silence for Osric. The court calls it wisdom or weakness depending on who survived. I call it the hardest throne to defend.

**Prompt (outcome `iron_crown`):** Your Majesty, you were merciful, then cruel — and the household learned both lessons. I heard inconsistency louder than policy. The barracks fear you. The kitchens hate you. The ghosts are quiet only because they are calculating. You are iron wearing velvet.

**Choice 1:** I have heard enough — dismiss the household court
- **Response (outcome `clean_court`):** Then I write *iron* once, and close the chapter. You bought clarity at the price of warmth.
- **Effects (outcome `clean_court`):** Army +8, Succession +10, Loyalty -5
- **Response (outcome `turned_household`):** Then I write *turned household* — same hands, new oaths. Fewer ghosts. More witnesses.
- **Effects (outcome `turned_household`):** Loyalty +10, Food +8, Treasury -5, Succession +3
- **Response (outcome `haunted_palace`):** Then I write *haunted* and leave the door unlatched. Do not be surprised when whispers vote.
- **Effects (outcome `haunted_palace`):** Church +6, Succession -10, Loyalty -6
- **Response (outcome `ledger_king`):** Then I write *judgment* without doctrine. The realm will test every line you crossed.
- **Effects (outcome `ledger_king`):** Loyalty +5, Nobility +5, Succession +5
- **Response (outcome `iron_crown`):** Then I write *fear* and hope it holds. Consistency failed you. Steel may not.
- **Effects (outcome `iron_crown`):** Army +5, Loyalty -8, Church +3

---

## Below the Tapestry (persistent story)

**Defeat lanes:** Loyalty / Health — *"A palace that cannot trust its own stairs cannot trust its throne."*  
**Span:** days **87–127**, **8 beats** — begins the day after [Household day 86](#beat-10--day-86--verdict-on-the-household), runs under [Hungry Season](#the-hungry-season-persistent-story), ends **before** [Grey Lung day 130](#beat-6--day-130--political-fallout-outcome-cured) and [Guild Compact day 128](#beat-1--day-128--credit-withheld). **Maid Lissa** and **Royal Jester Til** own the below-stairs world; Gromm and Raena callback [Household](#the-old-kings-household-persistent-story).

**Hidden stat (runtime, not shown in top bar):** `tapestryTrust` (−100…+100, starts at **0**)

| Tier | Range | Palace tone |
|------|-------|-------------|
| **Haunted** | ≤ −35 | Servants afraid; whispers everywhere |
| **Wary** | −34…−5 | Gossip, tested loyalties |
| **Routine** | −4…+4 | Normal palace friction |
| **Warm** | +5…+34 | Staff speak well of crown |
| **Loyal staff** | ≥ +35 | Stairs defend the throne |

**Arc state:** `tapestryTrust`, `tapestryArcPhase` (active / resolved), `tapestryCrownStance` (open / silence / loyalty / haunt), flags (`tapestryLissaCoupNight`, `tapestryTilMockCrown`, `tapestryGrommKitchen`, `tapestryRaenaDoor`, `tapestryChamberUsed`, `tapestryTilPublicRoast`, `tapestryKnoxServants`, `tapestryCoupNarrow`), `tapestryOutcome` (none / loyal_staff / coup_avoided / haunted_servants / jesters_truth)

**Beat schedule (finale day 127 — not 130; Grey Lung owns 130):**

| Day | Character | Beat |
|-----|-----------|------|
| 87 | Maid Lissa | Who slept where on coup night |
| 94 | Royal Jester Til | Mock usurper or mock court |
| 98 | Cook Gromm | Kitchen hears everything |
| 102 | Bodyguard Raena | Gossip vs silence at the door |
| 112 | Maid Lissa | Edwin's chamber still used? |
| 118 | Royal Jester Til | Public roast before hunger finale |
| 126 | Spy Knox | Servants sell names |
| 127 | Old Advisor Edric | Verdict on the stairs (finale) |

**Possible endings (day 127):** Loyal Staff · Palace Coup Narrowly Avoided · Haunted Servants · Jester's Truth

### Below the Tapestry — beat resolution rules

Every scheduled day shows one Tapestry beat while `tapestryArcPhase = active`. Day 87 sets `tapestryArcPhase = active`. Day 127 finale: compute `tapestryOutcome` from priority on load, then show [notification beat](#beat-8--day-127--verdict-on-the-stairs).

**Day 127 outcome priority:** `tapestryTrust` ≥ +35 + `tapestryCrownStance = loyalty` → **loyal_staff** · `tapestryCoupNarrow` or (`tapestryKnoxServants` + trust ≥ 0) → **coup_avoided** · `householdOutcome = haunted_palace` or `tapestryCrownStance = haunt` + trust ≤ −20 → **haunted_servants** · `tapestryTilPublicRoast` + trust ≥ −10 → **jesters_truth** · else **loyal_staff** (fallback).

**People before day 89:** Beats 1–2 (days 87, 94) bank People effects; beat 4 (day 102) onward applies People live.

**Cross-arc callbacks:** `householdOutcome`, `householdKeptGromm`, `householdStance`, [Hungry Season](#the-hungry-season-persistent-story) severity foreshadow, [Scaffold](#the-scaffolds-ledger-persistent-story) if active by day 126.

---

### Beat 1 — Day 87 — Who Slept Where

**Character:** Maid Lissa
**Note:** Opens arc one day after [Household finale](#beat-10--day-86--verdict-on-the-household). Pre–People unlock (89). Sets `tapestryArcPhase = active`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Lissa — I change sheets and pretend not to count the stains. The night of the coup, three chambers lit candles after midnight. I heard you cleansed Edwin's household, turned them, or let ghosts keep their shifts. Servants know who slept where. Hang gossip, pay gossip, or learn from it.

**Prompt variant (`householdOutcome = haunted_palace`):** Your Majesty, I heard you let ghosts remain. The stairs already believe you. I am merely confirming.

**Prompt variant (`householdOutcome = clean_court`):** Your Majesty, I heard you purged the court. The staff fear you more than they love Edwin's memory. Fear keeps sheets clean — sometimes.

**Choice 1:** Hear her privately — crown wants the truth
- **Response:** Then I speak softly and charge dearly. Truth is employment, not loyalty.
- **Effects:** Loyalty +6, Succession +4
- **Trust:** +12
- **Sets stance:** `open`
- **Sets flag:** `tapestryLissaCoupNight`

**Choice 2:** Silence her — no servant testifies about coup night
- **Response:** Then whispers go underground. Underground whispers grow mold. You chose silence.
- **Effects:** Army +3, Loyalty -6, Health -3
- **Trust:** −10
- **Sets stance:** `silence`

**Choice 3:** Reward her silence — buy the stairs with coin
- **Response:** Gold buys lips closed. It does not buy hearts open. I will take the coin anyway.
- **Effects:** Treasury -10, Loyalty +3
- **Trust:** +5
- **Sets stance:** `loyalty`

---

### Beat 2 — Day 94 — Mock the Usurper

**Character:** Royal Jester Til
**Note:** Between Hungry beats (93 Ruta, 100 Gromm). Pre–People unlock. Til tests whether court laughs at crown or court.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Til — licensed fool, unlicensed mirror. The court wants laughter before the granaries empty. I can mock the usurper, mock the court that serves him, or mock neither and let tension rot. Malrik hates my mouth. The barracks love it. You hire the joke — choose the target.

**Prompt variant (`tapestryLissaCoupNight`):** Your Majesty, I heard Lissa knows coup-night sheets. I can rhyme that — or bury it. Rhymes travel faster than maids.

**Prompt variant (`churchArcPhase = active`):** Your Majesty, I heard Malrik's forfeit machine warms up. Jokes about heaven go viral. I charge extra for blasphemy.

**Choice 1:** Mock the court — servants and soldiers first
- **Response:** Then nobles blush and commons cheer. Dangerous comedy. Delicious comedy.
- **Effects:** Loyalty +8, Nobility -6, Army +4
- **Trust:** +10
- **Sets flag:** `tapestryTilMockCrown` (inverted — mocks court not crown)

**Choice 2:** Mock the usurper — laugh at yourself
- **Response:** Bold. Rare. The court relaxes because you do not flinch. They may forget to fear you.
- **Effects:** Loyalty +5, Succession -4, Health +5
- **Trust:** +6

**Choice 3:** Silence Til — no jokes this season
- **Response:** Then the hall learns to whisper instead of laugh. Whispers are less funny and more pointed.
- **Effects:** Loyalty -5, Church +4
- **Trust:** −8
- **Sets stance:** `silence`

---

### Beat 3 — Day 98 — Kitchen Hears Everything

**Character:** Cook Gromm
**Note:** Two days before Hungry [day 100](#beat-10--day-100--kitchens-versus-provinces). Callback `householdKeptGromm`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the kitchen hears vows the chapel does not. I heard Lissa's gossip, Til's rhymes, and whether Edwin's cook still feeds a usurper. Borvin counts grain while Ruta counts dust. Tell me whether the crown feeds the staff first, audits the staff, or pretends kitchens are not politics.

**Prompt variant (`householdKeptGromm`):** Your Majesty, I heard you kept me. I remember Edwin's table. I serve yours — but the pots remember both.

**Prompt variant (`famineSeverity` ≥ 40):** Your Majesty, hunger reached the servants' hall before the provinces sang. Feed us and they call you human. Starve us and they call you Edwin's echo.

**Choice 1:** Staff rations first — loyalty begins below stairs
- **Response:** Then pots bless your name before heralds do. Expensive — but the stairs warm.
- **Effects:** Food -6, Loyalty +10, Health +4
- **Trust:** +15
- **Sets flag:** `tapestryGrommKitchen`
- **Sets stance:** `loyalty`

**Choice 2:** Audit the kitchens — theft before sentiment
- **Response:** Then spoons hide and whispers sharpen. Order without love. Familiar palace music.
- **Effects:** Treasury +8, Loyalty -6, Food +3
- **Trust:** −8

**Choice 3:** Shared hardship — servants eat what provinces eat
- **Response:** Dangerous solidarity. I will not call it noble until it works.
- **Effects:** Food -4, People +4, Loyalty +6
- **Trust:** +8

---

### Beat 4 — Day 102 — Gossip at the Door

**Character:** Bodyguard Raena
**Note:** Post–People unlock (89). Lissa vs Raena tension.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Lissa sells stories. I sell silence. I heard you opened the stairs, silenced them, or bought them. My sword guards your door — not your reputation. Double my post, gag the maids, or let gossip flow and prove you can survive it.

**Prompt variant (`tapestryLissaCoupNight`):** Your Majesty, I heard what Lissa knows. I do not repeat it. That is loyalty — or blackmail with better posture.

**Prompt variant (`emptyPursePhase = active`):** Your Majesty, I heard the purse empties. Unpaid guards gossip too.

**Choice 1:** Trust Raena — gag servant gossip, not the guard
- **Response:** Then Lissa learns fear. I learn overtime. The door stays yours.
- **Effects:** Army +5, Loyalty +6, People -4
- **Trust:** +10
- **Sets flag:** `tapestryRaenaDoor`

**Choice 2:** Trust the stairs — let Lissa speak, Raena listens
- **Response:** Then I hear everything and repeat nothing — unless you ask. Harder job. Better court.
- **Effects:** Loyalty +8, Health +3
- **Trust:** +12
- **Sets stance:** `open`

**Choice 3:** Trust neither — rotate both posts
- **Response:** Then both hate you equally. Paranoia loves rotation. So does Knox, apparently.
- **Effects:** Loyalty -8, Succession +4
- **Trust:** −12

---

### Beat 5 — Day 112 — Edwin's Chamber

**Character:** Maid Lissa
**Note:** Mid–Hungry Season. Callback `tapestryLissaCoupNight`, `householdOutcome`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Edwin's chamber still receives candles — not from piety, from habit. I heard you haunt the palace, cleanse it, or ledger it case by case. Lock the room and anger ghosts, use it and anger nobles, or turn it into servant quarters and anger poets. The stairs watch which king you become at night.

**Prompt variant (`tapestryChamberUsed` false):** Your Majesty, no one has slept there since the coup — until last week. I will not say who without your policy.

**Choice 1:** Seal the chamber — crown does not sleep in Edwin's ghost
- **Response:** Then poets mourn and servants breathe easier. Both matter — on different floors.
- **Effects:** Church +5, Loyalty +4, Health +3
- **Trust:** +6
- **Sets stance:** `haunt` (respectful)

**Choice 2:** Use the chamber openly — usurper owns night and day
- **Response:** Bold insult to memory. The court calls it strength or sacrilege depending on who lost kin.
- **Effects:** Succession +8, Nobility -8, Loyalty -4
- **Trust:** −5
- **Sets flag:** `tapestryChamberUsed`

**Choice 3:** Gift chamber to loyal staff — stairs inherit the room
- **Response:** Then Gromm weeps or curses. I cannot tell which. You bought warmth with symbolism.
- **Effects:** Loyalty +12, Food -3, Nobility -4
- **Trust:** +18
- **Sets stance:** `loyalty`

---

### Beat 6 — Day 118 — Public Roast

**Character:** Royal Jester Til
**Note:** One day before [Hungry Season finale](#beat-12--day-119--verdict-on-hunger). High visibility beat.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the square wants bread — but it will take a joke first. I can roast the usurper before the hungry finale, roast Ashford before she rides, or roast Malrik and dare the Church to laugh. Public roast builds trust or builds mobs. Choose the victim — or cancel the show.

**Prompt variant (`famineSeverity` ≥ 50):** Your Majesty, severity outran jokes. Roast badly and they riot. Roast well and they forget hunger for an hour. Both are policy.

**Prompt variant (`tapestryTilMockCrown`):** Your Majesty, I heard you let me mock the court. The commons want an encore with sharper teeth.

**Choice 1:** Roast the crown — humility before hunger verdict
- **Response:** Then they love you for a day. A day is currency this year.
- **Effects:** People +10, Loyalty +8, Succession -6
- **Trust:** +12
- **Sets flag:** `tapestryTilPublicRoast`

**Choice 2:** Roast the Church — bread before tithe
- **Response:** Malrik will call it treason. The market calls it overdue. I call it employment.
- **Effects:** Church -12, People +8, Loyalty +4
- **Trust:** +8
- **Sets flag:** `tapestryTilPublicRoast`

**Choice 3:** Cancel the roast — fear beats laughter
- **Response:** Then the square goes home angry without a punchline. Hunger remains. You chose caution.
- **Effects:** Loyalty -6, Army +4
- **Trust:** −10

---

### Beat 7 — Day 126 — Servants Sell Names

**Character:** Spy Knox
**Note:** One day before finale. One day before [Guild day 128](#beat-1--day-128--credit-withheld). Foreshadows [Court of Knives](#the-court-of-knives-persistent-story).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I bought a maid's memory and a pot-boy's schedule. Lissa's coup-night story walks in three ledgers already — Salt's, Ashford's eventual, and mine. I heard open stairs, silenced stairs, or loyal stairs. Purge the sellers, outbid the buyers, or let the leak teach you who still wants Edwin's chair.

**Prompt variant (`tapestryLissaCoupNight`):** Your Majesty, I heard you paid Lissa for truth. I sell cheaper truth. Competition is healthy.

**Prompt variant (`tapestryRaenaDoor`):** Your Majesty, Raena's silence has a price too. Everyone's does — except mine, which is higher.

**Choice 1:** Purge sellers — hang one servant as warning
- **Response:** Then the stairs freeze. Fear works. Loyalty pretends to work. Both invoice you.
- **Effects:** Army +6, Loyalty -12, People -8
- **Trust:** −15

**Choice 2:** Outbid Knox — buy the list back
- **Response:** Then you rent silence weekly. I appreciate repeat customers.
- **Effects:** Treasury -15, Loyalty +8
- **Trust:** +10
- **Sets flag:** `tapestryKnoxServants`

**Choice 3:** Let coup story leak — controlled scandal
- **Response:** Then the court controls nothing — but learns who moves. Dangerous pedagogy.
- **Effects:** Loyalty -4, Succession +6, People +4
- **Trust:** −5
- **Sets flag:** `tapestryCoupNarrow` (if Raena + Lissa loyal)

---

### Beat 8 — Day 127 — Verdict on the Stairs

**Character:** Old Advisor Edric
**Note:** Arc finale. **On load:** run [day 127 outcome priority](#below-the-tapestry--beat-resolution-rules) → `tapestryOutcome`, `tapestryArcPhase = resolved`. Before Grey Lung day 130 and Guild day 128.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `loyal_staff`):** Your Majesty, forty days since Lissa counted coup-night candles — and the stairs speak your name without spitting. I heard kitchens fed, doors guarded, jokes aimed at court not crown, Knox outbid. Loyal staff. Rare beneath a usurper. Guard it before Ashford measures the upper halls.

**Prompt (outcome `coup_avoided`):** Your Majesty, I heard servants sell names and knives almost find your door. Knox lost the bid — or you hung the sellers. Palace coup narrowly avoided. The stairs remember how close it was.

**Prompt (outcome `haunted_servants`):** Your Majesty, I heard ghosts in Edwin's chamber, silence in Til's mouth, fear in Lissa's eyes. Haunted servants — loyal to memory more than you. The palace obeys. It does not warm.

**Prompt (outcome `jesters_truth`):** Your Majesty, I heard Til roast crown, Church, and hunger before the square. Jester's truth — laughter as policy. The commons trust the fool more than the herald. Dangerous. Effective.

**Choice 1:** I have heard the stairs — dismiss the servants' court
- **Response (outcome `loyal_staff`):** Then I write *warm stairs*. Upper halls will test it soon.
- **Effects (outcome `loyal_staff`):** Loyalty +12, Health +6, People +6
- **Response (outcome `coup_avoided`):** Then I write *narrow survival*. Sleep lighter anyway.
- **Effects (outcome `coup_avoided`):** Loyalty +6, Army +8, Treasury -5
- **Response (outcome `haunted_servants`):** Then I write *haunted* again. You chose familiarity with ghosts.
- **Effects (outcome `haunted_servants`):** Health -5, Loyalty -8, Church +5
- **Response (outcome `jesters_truth`):** Then I write *laughter*. Malrik will not forgive. The market might.
- **Effects (outcome `jesters_truth`):** People +10, Loyalty +8, Church -8

---

## The Empty Purse (persistent story)

**Defeat lane:** Army — *"An unpaid army does not guard a bankrupt usurper."*  
**Span:** days **11–65**, **8 beats**. Runs parallel to [Household](#the-old-kings-household-persistent-story) and ends before its day-67 beat. Callbacks to Household (`householdKeptGromm`, `householdCutClerks`, `householdVeteranPurge`), [Church tithe](#the-crown-forfeit--tithe-war-persistent-story) (from day 30 onward), and [Northern](#the-northern-price-persistent-story) (Kara's steel).

**Hidden stat (runtime, not shown in top bar):** `armyPayTrust` (−100…+100, starts at **0**)

| Tier | Range | Army tone |
|------|-------|-----------|
| **Mutinous** | ≤ −35 | Refusal, desertion, march threats |
| **Grumbling** | −34…−5 | Slow obedience, shakedowns |
| **Transactional** | −4…+4 | Pay for service |
| **Loyal** | +5…+34 | Discipline holds |
| **Devoted** | ≥ +35 | Coup veterans defend the throne |

**Arc state:** `armyPayTrust`, `emptyPursePhase` (active / resolved), flags (`emptyPurseSaltLoan`, `emptyPurseFinnAmnesty`, `emptyPurseKaraCrown`, `emptyPurseOttoSworn`, `emptyPurseRaenaDoubled`, `emptyPurseCrisis`), `emptyPurseOutcome` (none / paid_crown / mercenary_throne / mutiny_avoided / sold_sword / ghost_army)

**Beat schedule (no overlap with other arcs):**

| Day | Character | Beat |
|-----|-----------|------|
| 11 | General Rudolf | Muster without coin |
| 17 | Banker Dominic Salt | Coup creditors |
| 23 | Deserter Finn | Hillside oath-breakers |
| 29 | Treasurer Borvin | Which ledger bleeds |
| 36 | General Rudolf | Companies threaten march |
| 47 | Mercenary Kara | Steel for sale |
| 54 | Sir Otto the Silent | The oath that pays no wages |
| 65 | General Rudolf | Who guards an empty purse (finale) |

**Possible endings (day 65):** Paid Crown · Mercenary Throne · Mutiny Narrowly Avoided · Sold Sword · Ghost Army

### Empty Purse — beat resolution rules

**Day 65 outcome priority:** `armyPayTrust` ≥ 35 + `emptyPurseSaltLoan` paid → **paid_crown** · `emptyPurseKaraCrown` + trust ≤ 0 → **mercenary_throne** · trust ≤ −35 → **ghost_army** · `emptyPurseFinnAmnesty` + trust ≥ 0 → **mutiny_avoided** · `emptyPurseOttoSworn` + low pay → **sold_sword** · else **mutiny_avoided** (fallback).

**People stat before day 89:** Listed People effects on day 65+ only; substitute Loyalty before that.

**Church day 30+:** Beats 36 and 47 variants reference tithe if `churchArcPhase = active`. [Church beat 9 (day 69)](#beat-9--day-69--crossed-swords-and-empty-purses) callbacks `emptyPurseCrisis`.

---

### Beat 1 — Day 11 — Muster Without Coin

**Character:** General Rudolf
**Note:** Opens arc. Pre-Church, pre-Grey Lung day 25. Household beats 2–3 may have fired. Sets `emptyPursePhase = active`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the men who put you on the throne assembled for muster at dawn. The treasury sent silence. I heard Edric warn you that blades alone cannot keep a crown — he did not mention they still expect coin. Pay, promise, or tell them honor feeds barracks better than bread.

**Prompt variant (`bold` tone):** Your Majesty, you told Edric a hesitating king falls. My captains heard boldness. The paymaster heard nothing. Choose whether the coup was a contract or a sermon.

**Choice 1:** Pay half now — promise the rest in two weeks
- **Response:** Half a purse buys half loyalty. Today that may suffice. Do not make it habit.
- **Effects:** Army +10, Treasury -15, Loyalty +3
- **Trust:** +8

**Choice 2:** Full payment — buy silence while you can
- **Response:** Generous. The men will remember — until the next muster.
- **Effects:** Army +18, Treasury -25, Loyalty +5
- **Trust:** +18

**Choice 3:** Honor is payment — the coup was the reward
- **Response:** Then pray your walls are stronger than my captains' patience.
- **Effects:** Army -12, Treasury +5, Loyalty -6
- **Trust:** −25
- **Sets flag:** `emptyPurseCrisis`

---

### Beat 2 — Day 17 — Coup Creditors

**Character:** Banker Dominic Salt
**Note:** Coup debts to mercenary lenders. Callback day 11 payment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the blades that crowned you were rented before they were bloodied. My house financed the captains who opened the gates. I heard you paid the muster — or promised — or preached honor. I do not finance sermons. Repay with crown land, crown tax, or crown patience. Default, and your soldiers learn who truly owns their captain.

**Prompt variant (`emptyPurseCrisis`):** Your Majesty, I heard you told the army honor feeds them. My ledgers feed captains. Choose whether the throne pays in gold or in deeds before my patience sells to someone who will.

**Choice 1:** Crown loan on harsh terms — Salt owns the shortfall
- **Response:** Then my ink owns your mornings until the debt sleeps. The army will not know — yet.
- **Effects:** Treasury +20, Army +5, Succession -8, Loyalty -4
- **Sets flag:** `emptyPurseSaltLoan`
- **Trust:** +5

**Choice 2:** Seize Salt's rival ledgers — pay soldiers, anger bankers
- **Response:** You will find my books clean and my enemies' dirty. Useful — until every merchant fears you.
- **Effects:** Treasury +12, Army +8, Loyalty -8
- **Trust:** +10

**Choice 3:** Renegotiate — time for interest, not land
- **Response:** Time is also currency. I will wait — and charge for waiting.
- **Effects:** Treasury -5, Loyalty +4, Succession -3
- **Trust:** +12

---

### Beat 3 — Day 23 — Hillside Oath-Breakers

**Character:** Deserter Finn
**Note:** Day before Grey Lung proposal (25). Callback Household purge flags and army pay.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I deserted Edwin's third company the week before your coup — and I did not return for yours. Forty men hide in the southern hills because the paymaster forgot them twice. I heard you kept Gromm or purged him, paid Rudolf or preached. We ask simpler questions: amnesty, coin, or rope?

**Prompt variant (`householdPurgedGuards`):** Your Majesty, I heard you purged the palace guard. Hillside men think you will purge us next. Offer coin or offer graves — middle paths fail with hungry deserters.

**Choice 1:** Amnesty and enlistment — hills return to the banner
- **Response:** Then we march for you until someone pays better. Today that is you.
- **Effects:** Army +12, Treasury -10, Loyalty -3
- **Sets flag:** `emptyPurseFinnAmnesty`
- **Trust:** +15

**Choice 2:** Pay them off — gold to vanish
- **Response:** Cheap peace. They will drink your coin and remember your name in songs you will not like.
- **Effects:** Treasury -15, Army +3, Loyalty +2
- **Trust:** +5

**Choice 3:** Hunt them — deserters are traitors twice
- **Response:** Then send men who are paid. Unpaid hunters become deserters by supper.
- **Effects:** Army -8, Loyalty -6, Succession +4
- **Trust:** −20

---

### Beat 4 — Day 29 — Which Ledger Bleeds

**Character:** Treasurer Borvin
**Note:** One day before Church unlock. Chooses army vs court vs reserves. Callback Salt loan and Household `householdCutClerks`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, three ledgers scream at once: Salt's coup debt, Rudolf's muster, and Edwin's ghost offices Osric still signs. I heard you paid soldiers, bargained with bankers, or fed them honor. Malrik's tithe has not yet arrived — but winter will. Which purse empties first: army, court, or crown reserves?

**Prompt variant (`emptyPurseSaltLoan`):** Your Majesty, Salt's interest ate this week's receipts before the grain tax arrived. I heard you borrowed to quiet the barracks. The court eats scraps. The army still waits.

**Choice 1:** Army first — cut court luxuries and clerk wages
- **Response:** Hungry scribes plot slower than hungry soldiers march. Arithmetic, not mercy.
- **Effects:** Army +12, Treasury -8, Loyalty -5
- **Trust:** +12

**Choice 2:** Balance all three — everyone bleeds a little
- **Response:** Everyone hates you equally. Politically efficient.
- **Effects:** Army +5, Treasury -5, Loyalty -2
- **Trust:** +5

**Choice 3:** Hold reserves — promise another fortnight
- **Response:** Promises are coins you mint yourself. Spend carefully.
- **Effects:** Army -6, Treasury +8, Loyalty -4
- **Trust:** −15
- **Sets flag:** `emptyPurseCrisis`

---

### Beat 5 — Day 36 — Companies Threaten March

**Character:** General Rudolf
**Note:** Day after Church beat 1; tithe may be active. Callback Finn amnesty and Borvin choices.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, two companies stack wagons at the lower gate — not to leave, they swear, but to remind you they could. I heard you chose which ledger bleeds, sheltered deserters or hunted them, and knelt or defied Malrik in the same fortnight. Soldiers listen to priests when pay is silence. Pay, punish, or parade.

**Prompt variant (`churchArcPhase = active` + `defy`):** Your Majesty, I heard you spat at Malrik while Borvin starved the barracks. My men think heaven and the treasury conspired against them. Fix one enemy at a time — starting with coin.

**Prompt variant (`emptyPurseFinnAmnesty`):** Your Majesty, I heard you amnestied Finn's hills. Good steel — bad example. Veterans ask why deserters eat before loyalists.

**Choice 1:** Emergency pay from reserves — march cancelled
- **Response:** Bought time. Not bought loyalty. Know the difference.
- **Effects:** Treasury -20, Army +15, Loyalty +4
- **Trust:** +18

**Choice 2:** Hang wagon captains — discipline before coin
- **Response:** Steel solves one company. The rest calculate whether rope pays better than gold.
- **Effects:** Army +6, Loyalty -12, Church +3
- **Trust:** −12

**Choice 3:** Parade and promise after tithe negotiation
- **Response:** Theatre. If Malrik takes your purse on Sunday, cancel the play with interest.
- **Effects:** Army -4, Loyalty +6, Church +5
- **Trust:** −5

---

### Beat 6 — Day 47 — Steel for Sale

**Character:** Mercenary Kara
**Note:** Shared speaker with [Northern beat 11](#beat-11--day-145--guns-on-the-northern-road) — here she tests crown pay before northern arms escalate. Day after Church beat 6 (48) avoided; before Grey Lung 52.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, my company escorts grain — when grain pays. Rudolf wants a crown contract. Salt wants collateral. I heard your purse rattles emptier each week. Hire us on the throne's tab, let us sell to whoever pays today, or seize our wagons and pray unpaid men fight for free.

**Prompt variant (`emptyPurseSaltLoan`):** Your Majesty, Salt whispered your debt before I reached the gate. Mercenaries price crowns by solvency. I heard you owe bankers and soldiers both. Who do I bill when the throne defaults?

**Choice 1:** Crown contract — Kara works for you alone this season
- **Response:** Then my bolts point where you point — until your purse stops singing.
- **Effects:** Army +14, Treasury -18, Loyalty +3
- **Sets flag:** `emptyPurseKaraCrown`
- **Trust:** +10

**Choice 2:** Free company — she sells to highest bidder
- **Response:** Gold flows. Loyalties blur. War gets cheaper for everyone except you.
- **Effects:** Treasury +8, Army -5, Loyalty -4
- **Trust:** −8

**Choice 3:** Seize wagons — impress steel into Rudolf's host
- **Response:** Then you gain bolts and lose reputation. Mercenaries remember seizures longer than kings remember pay.
- **Effects:** Army +10, Loyalty -10, Succession +5
- **Trust:** −15

---

### Beat 7 — Day 54 — The Oath That Pays No Wages

**Character:** Sir Otto the Silent
**Note:** Between Grey Lung day 52 and Church fasting day 55 — day 54 is clear. Otto represents honor-bound knights who serve without pay — until they do not.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I swore to Edwin as his household knight — and you sit in Edwin's chair. I have not spoken in court since the coup because speech costs coin I was not paid. I heard your army grumbles, your banker counts, your mercenary haggles. My silence is not loyalty. It is arithmetic. Swear me a wage, or swear me release.

**Prompt variant (`armyPayTrust` ≤ −20):** Your Majesty, the barracks toast your name with vinegar. I heard unpaid steel. My oath does not require poverty. Pay or release me before silence becomes siding with whoever pays.

**Choice 1:** Knight's stipend — bind Otto to the crown
- **Response:** Then I draw steel when you ask. I still prefer not to speak. Saves us both embarrassment.
- **Effects:** Army +8, Treasury -12, Loyalty +6, Nobility +4
- **Sets flag:** `emptyPurseOttoSworn`
- **Trust:** +12

**Choice 2:** Release with honor — no pay, no obligation
- **Response:** Clean exit. The court loses a sword. You gain a witness who may testify elsewhere.
- **Effects:** Loyalty +3, Succession -4, Army -3
- **Trust:** −5

**Choice 3:** Service without pay — glory must suffice
- **Response:** Then my silence means contempt, not devotion. Remember I warned you.
- **Effects:** Army -5, Loyalty -6, Nobility -5
- **Trust:** −18

---

### Beat 8 — Day 65 — Who Guards an Empty Purse

**Character:** General Rudolf
**Note:** Arc finale. **On load:** run [day 65 outcome priority](#empty-purse--beat-resolution-rules) → `emptyPurseOutcome`, `emptyPursePhase = resolved`. Rudolf **reports** what the barracks decided — player does not pick the ending. Callbacks entire arc (Salt, Finn, Borvin, Kara, Otto, Raena).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `paid_crown`):** Your Majesty, fifty-four days since muster without coin — and the men still answer when you call. I heard Salt paid, Otto sworn, wagons funded, deserters judged. The barracks call you a king who pays when it hurts. That is rarer than courage. Guard it.

**Prompt (outcome `mercenary_throne`):** Your Majesty, I heard Kara's coin at your door and crown honor in the counting house. The loyal companies watch mercenaries eat first. My men obey — for now — because you bought steel you did not breed. The realm calls it pragmatism. The yard calls it a warning.

**Prompt (outcome `mutiny_avoided`):** Your Majesty, I heard hunger, amnesty, promises, and one march that did not happen. You did not buy devotion — you bought time. The barracks grumble but do not stack wagons. Call it survival. Soldiers do.

**Prompt (outcome `sold_sword`):** Your Majesty, I heard Otto's silence and glory speeches from the throne. Honor without wages is a sermon, not an army. The knights serve because they must, not because they believe. The next creditor may outbid you with a whisper.

**Prompt (outcome `ghost_army`):** Your Majesty, I heard unpaid steel, seized wagons, hung captains, and empty chests. The companies calculate faster than you count. Desertion is policy now — not crime. You still have a throne. You may not have a host by spring.

**Choice 1:** I have heard the barracks — dismiss the muster
- **Response (outcome `paid_crown`):** Then march when I say march. Coin bought this loyalty. Spend it wisely.
- **Effects (outcome `paid_crown`):** Army +12, Loyalty +10, Treasury -5
- **Response (outcome `mercenary_throne`):** Then pray Kara's mood outlasts your purse. I will hold the line until I cannot.
- **Effects (outcome `mercenary_throne`):** Army +8, Loyalty -8, Treasury -5
- **Response (outcome `mutiny_avoided`):** Then we march on faith and rations. Do not make it a habit.
- **Effects (outcome `mutiny_avoided`):** Army +5, Loyalty +8
- **Response (outcome `sold_sword`):** Then draw steel when asked. Do not ask why we hesitate.
- **Effects (outcome `sold_sword`):** Army +3, Loyalty -6, Nobility -4
- **Response (outcome `ghost_army`):** Then guard your own door. I cannot promise the yard will.
- **Effects (outcome `ghost_army`):** Army -10, Loyalty -12, Succession -5

---

## The Hungry Season (persistent story)

**Defeat lane:** Food — *"A realm that cannot eat will not kneel long."* Secondary pressure on **People** after day 89 unlock.  
**Span:** days **42–119**, **12 beats** — **starts early** (twelve days after Church unlock), runs through Empty Purse tail, Church tithe war, Grey Lung, and ends before [Great Houses](#the-great-houses-persistent-story). Provincial hunger arrives **before** the Peasantry meter unlocks; commons anger banks as Loyalty until day 89, then People effects apply in full.

**Hidden stat (runtime, not shown in top bar):** `famineSeverity` (0–100, starts at **10** — coup winter baseline)

| Tier | Range | Realm tone |
|------|-------|----------------|
| **Plenty** | 0–24 | Stable granaries |
| **Tight** | 25–49 | Local shortages, rumour |
| **Hunger** | 50–74 | Riots, hoarding, sermons |
| **Famine** | 75–100 | Provincial collapse, Food defeat risk |

**Arc state:** `famineSeverity`, `hungryArcPhase` (active / resolved), `hungryCrownPolicy` (feed / ration / requisition / faith), flags (`hungryRutaHeard`, `hungryGrommFeast`, `hungryChurchSoup`, `hungryBranPetition`, `hungryYarekRiots`, `hungryFaraCartel`, `hungryElinaBallads`, `hungrySelenaHoard`, `hungryRudolfRequisition`, `hungryPeopleMeterLive`), `hungryOutcome` (none / bread_king / starving_crown / church_kitchen / guild_republic / peasant_fury / managed_famine)

**Beat schedule (no overlap with other arcs):**

| Day | Character | Beat |
|-----|-----------|------|
| 42 | Miller's Wife Ruta | First empty granaries |
| 50 | Cook Gromm | Court feasts |
| 56 | Monk Arvel | Soup lines |
| 63 | Village Elder Bran | Provincial delegation |
| 68 | Miner Yarek | Ore for bread |
| 74 | Head of Guild Fara | Grain cartel |
| 80 | Folk Singer Elina | Ballads in the market |
| 85 | Merchant Selena | Hoarded routes |
| 93 | Miller's Wife Ruta | After the ford (post–People unlock) |
| 100 | Cook Gromm | Kitchens versus provinces |
| 106 | General Rudolf | Requisition |
| 119 | Old Advisor Edric | Verdict on hunger |

**Possible endings (day 119):** Bread King · Starving Crown · Church Kitchen · Guild Republic · Peasant Fury · Managed Famine

### Hungry Season — beat resolution rules

**People before day 89:** Beats 1–8 list People effects as **banked** — apply on day 89+ or substitute Loyalty per beat **Note**. Beat 9 (day 93) is first beat where People applies live (`hungryPeopleMeterLive`).

**Severity:** Bad choices (feast, requisition, hoarding) raise `famineSeverity` +8–15. Good choices (soup, open granaries, guild deal) lower it −5–12. Clamped 0–100.

**Day 119 outcome priority:** `famineSeverity` ≤ 30 + `hungryCrownPolicy = feed` → **bread_king** · `famineSeverity` ≥ 75 → **starving_crown** · `hungryChurchSoup` + Arvel path dominant → **church_kitchen** · `hungryFaraCartel` + Fara favored → **guild_republic** · `hungryYarekRiots` + severity ≥ 50 → **peasant_fury** · else **managed_famine**.

**Cross-arc callbacks:** [Household](#the-old-kings-household-persistent-story) `householdKeptGromm`, [Church](#the-crown-forfeit--tithe-war-persistent-story) grain monopoly / fasting, [Northern](#beat-9--day-91--refugees-at-the-ford) day 91 refugees, [Grey Lung](#grey-lung-cure-arc-persistent-story) from beat 8 onward, [Empty Purse](#the-empty-purse-persistent-story) treasury starvation.

---

### Beat 1 — Day 42 — First Empty Granaries

**Character:** Miller's Wife Ruta
**Note:** Opens arc early — during Church tithe buildup, before People unlock. Callback [Church beat 6](#beat-6--day-48--church-buys-the-granaries) foreshadow if `churchArcPhase = active`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Ruta from the western mills. The granaries cough dust where they once coughed grain. I heard Malrik's tithe collectors reach the villages before your tax men. I did not ride here for poetry — I rode because hungry millers remember who stole the harvest, and they do not always mean the weather.

**Prompt variant (`churchArcStance = submit`):** Your Majesty, I heard you knelt for blessing while our bins emptied. God's name does not fill a child's bowl unless someone pays for the grain.

**Choice 1:** Open crown reserves — send grain west at once
- **Response:** Then the mills will bless you until the next wagon. Expensive. Remembered.
- **Effects:** Food +12, Treasury -15, Loyalty +8
- **Severity:** −10
- **Sets flag:** `hungryRutaHeard`
- **Sets policy:** `feed`

**Choice 2:** Investigate hoarders — hang a mayor if you must
- **Response:** Rope frightens merchants faster than sermons. You may hang the wrong man. The mills will not care if the right one squeals.
- **Effects:** Food +5, Loyalty -4, Succession +4
- **Severity:** −3

**Choice 3:** The provinces must endure — the crown eats first
- **Response:** Then I return with more women and fewer manners. Remember I warned you before the ballads start.
- **Effects:** Food -8, Treasury +8, Loyalty -10
- **Severity:** +15
- **Sets policy:** `ration` (crown-first)

---

### Beat 2 — Day 50 — Court Feasts

**Character:** Cook Gromm
**Note:** Callback [Household](#beat-2--day-8--the-kitchen-remembers) `householdKeptGromm`. Competes with provincial hunger.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the court expects roast on holy days and every day is holy when kings are nervous. I heard western mills send dust instead of flour. My ovens can bake for the palace or bake for the city — not both without coin or lies. Do I cook silence in the kitchens, or honesty at your table?

**Prompt variant (`householdKeptGromm`):** Your Majesty, you kept me when others purged Edwin's ghosts. I will cook for you — but I will not pretend the city is fed while we chew fat.

**Prompt variant (`hungryRutaHeard` + policy `feed`):** Your Majesty, I heard you opened reserves for Ruta's mills. The court still wants feast. The commons want proof you meant it.

**Choice 1:** Public feast — crown shares the roast with the city
- **Response:** Then the commons see smoke and believe you. The treasury sees smoke and weeps.
- **Effects:** Food +10, Treasury -12, Loyalty +10
- **Severity:** −8
- **Sets flag:** `hungryGrommFeast`

**Choice 2:** Private court — feast while provinces tighten belts
- **Response:** Hypocrisy with spices. The servants talk. They always talk.
- **Effects:** Food -5, Nobility +4, Loyalty -8
- **Severity:** +12

**Choice 3:** Fast with the city — simple tables, shared penance
- **Response:** Thin soup for thin times. Malrik will call it piety. I call it politics that fills bellies a little.
- **Effects:** Food +6, Church +5, Loyalty +4
- **Severity:** −5

---

### Beat 3 — Day 56 — Soup Lines

**Character:** Monk Arvel
**Note:** Between Church fasting beat (55) and Northern agents (57). Church grain vs crown grain.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, my soup line wraps around the lower ward — longer each dawn. I heard Malrik named meat unclean or grain God's property. I heard you fed soldiers in secret or starved the faithful. The poor do not care which sermon wins. They care which pot boils.

**Prompt variant (`churchGrainMonopoly`):** Your Majesty, I heard you seized temple grain. Malrik answered with fasting. My line answered with hunger. Choose who owns mercy.

**Prompt variant (`churchFastingDecree` defied):** Your Majesty, I heard you fed barracks while the realm fasted. The poor noticed. So did my brothers.

**Choice 1:** Fund Arvel's lines — crown soup, not Church soup
- **Response:** Then the poor bless your name before Malrik's. He will call it theft of holiness. I call it lunch.
- **Effects:** Food +8, Treasury -10, Church -6, Loyalty +8
- **Severity:** −10
- **Sets flag:** `hungryChurchSoup`
- **Sets policy:** `feed`

**Choice 2:** Let Malrik feed them — altar owns hunger
- **Response:** Then he owns their knees. You own the walls. Standard trade.
- **Effects:** Church +10, Food -5, Loyalty -4
- **Severity:** +5
- **Sets policy:** `faith`

**Choice 3:** Shut the lines — order before charity mobs
- **Response:** Then riot becomes theology. You chose clarity. Clarity is not always mercy.
- **Effects:** Army +6, Loyalty -12, Food -6
- **Severity:** +14

---

### Beat 4 — Day 63 — Provincial Delegation

**Character:** Village Elder Bran
**Note:** Day after Prophet beat 1 (62). Provincial voice before People unlock.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I speak for nine villages that still call you usurper — and still ask you for bread. I heard Ruta from the mills and Arvel from the soup line. We do not want your soul. We want your granary keys. Grant provincial charters to store grain, or send soldiers to guard empty bins.

**Prompt variant (`hungryGrommFeast`):** Your Majesty, I heard the court feasted while we tightened belts. Delegations are polite riots. Remember that.

**Choice 1:** Grant provincial grain charters — local stores, crown audit
- **Response:** Then villages guard their own winter. You guard your reputation. Both are work.
- **Effects:** Food +10, Loyalty +8, Succession -5
- **Severity:** −8
- **Sets flag:** `hungryBranPetition`

**Choice 2:** Refuse — grain is crown property
- **Response:** Then we bury our dead and remember your answer. Ruta will rhyme it.
- **Effects:** Food -6, Army +4, Loyalty -10
- **Severity:** +12

**Choice 3:** Hire Bran's militia — grain in exchange for oaths
- **Response:** Dangerous peasants with spears. Cheaper than knights — until it isn't.
- **Effects:** Army +8, Food +4, Treasury -8, Loyalty -3
- **Severity:** −2

---

### Beat 5 — Day 68 — Ore for Bread

**Character:** Miner Yarek
**Note:** Between Household day 67 (Raena) and Church day 69. Miners strike for food.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the mountain eats men and spits ore. I heard villages store grain while miners eat pebbles. We can stop the forges that pay your army, or you can price bread in iron instead of gold. The crown buys our sweat — will it buy our supper?

**Prompt variant (`emptyPurseCrisis`):** Your Majesty, I heard the treasury rattles empty. Empty treasuries love ore. Hungry miners do not.

**Choice 1:** Bread for ore — fixed exchange, crown mills
- **Response:** Then the forges breathe and the mountains whisper your name. Until the price changes.
- **Effects:** Food +8, Treasury -10, Army +5, Loyalty +6
- **Severity:** −6

**Choice 2:** Crush the strike — soldiers in the pits
- **Response:** Steel on starving men. The ore flows. The story spreads.
- **Effects:** Army +8, Loyalty -14, Food -4
- **Severity:** +10
- **Sets flag:** `hungryYarekRiots`

**Choice 3:** Let Fara's guild broker — private bread, public ore
- **Response:** Merchants profit. Forges turn. You owe Fara a favor — she will collect.
- **Effects:** Treasury +6, Food +4, Loyalty -5
- **Severity:** +3
- **Sets flag:** `hungryFaraCartel` (early)

---

### Beat 6 — Day 74 — Grain Cartel

**Character:** Head of Guild Fara
**Note:** Guild vs crown supply. Before Prophet-adjacent Grey Lung beats.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I speak for the grain guild — not the Church, not the army, not the romantic millers. I heard you opened reserves, fed soup lines, or threatened strikers. Caravans will move if the crown guarantees prices. They will stop if you seize wagons. Hunger is a market. I am its priest.

**Prompt variant (`hungryFaraCartel` early from Yarek):** Your Majesty, I heard you let me broker miners' bread. Extend the compact, or watch caravans vanish into private cellars.

**Choice 1:** Crown-guild compact — fixed prices, shared profit
- **Response:** Then the realm eats steadily and I grow rich steadily. Fair, if you control the word *fair*.
- **Effects:** Food +12, Treasury -8, Loyalty +4
- **Severity:** −10
- **Sets flag:** `hungryFaraCartel`

**Choice 2:** Seize guild granaries — crown monopoly
- **Response:** Then the guild calls you tyrant. The people call you fed — briefly.
- **Effects:** Food +15, Loyalty -12, Treasury +10
- **Severity:** −5
- **Sets policy:** `requisition`

**Choice 3:** Free market — no guarantees, no seizures
- **Response:** Gold flows upward. Bellies empty downward. Economics as theology.
- **Effects:** Treasury +12, Food -10, Loyalty -8
- **Severity:** +12

---

### Beat 7 — Day 80 — Ballads in the Market

**Character:** Folk Singer Elina
**Note:** Street narrative beat. Severity high → harsher ballads.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I sing for coins and causes. I heard mills empty, soup lines grow, miners strike, and merchants count. My new verse names the usurper — hungry or generous, depending what you fed the city this week. Sponsor the song, silence it, or let the market choose your reputation.

**Prompt variant (`famineSeverity` ≥ 50):** Your Majesty, I heard children share one loaf in the western ward. My ballad will travel faster than your decrees.

**Choice 1:** Sponsor the generous ballad — pay for your own praise
- **Response:** Flattering lyrics. Expensive chorus. The commons hum your name until the next hunger.
- **Effects:** Treasury -8, Loyalty +10, Food +3
- **Severity:** −4
- **Sets flag:** `hungryElinaBallads`

**Choice 2:** Ban hunger ballads — Morwen for musicians
- **Response:** Banned songs sing loudest. I will whisper where you cannot hang.
- **Effects:** Army +3, Loyalty -10
- **Severity:** +8

**Choice 3:** Let her mock you — honesty buys more than gold
- **Response:** Brave or stupid. The crowd will decide. I will still eat.
- **Effects:** Loyalty +6, Nobility -4
- **Severity:** −6

---

### Beat 8 — Day 85 — Hoarded Routes

**Character:** Merchant Selena
**Note:** One day before [Household finale](#beat-10--day-86--verdict-on-the-household) — distinct from household day 49 Selena beat (loyalists). Hoarding vs provinces.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, my caravans still move — when paid triple. I heard crown reserves opened, guilds compacted, or markets left to rot. Loyalists hoard in Edwin's name. Your peasants hoard in God's. I can sell you routes, sell you names, or sell your enemies grain you refuse to price.

**Prompt variant (`plagueArcPhase = active`):** Your Majesty, Grey Lung makes every house hoard. I heard you fund physic while bins lock. Fear eats faster than men.

**Choice 1:** Crown escorts — force caravans at fair price
- **Response:** Then Rudolf's men guard wheat. Merchants guard grudges. Food moves.
- **Effects:** Food +12, Army -4, Treasury -10, Loyalty +5
- **Severity:** −8

**Choice 2:** Pay Selena's premium — gold before famine
- **Response:** I will deliver. I will also remember you could not negotiate. Inflation is a memoir.
- **Effects:** Food +10, Treasury -18, Loyalty +2
- **Severity:** −5
- **Sets flag:** `hungrySelenaHoard`

**Choice 3:** Let hoarders starve each other — no escorts
- **Response:** Then routes die and bandits feast. Arithmetic of cruelty.
- **Effects:** Food -12, Treasury +8, Loyalty -10
- **Severity:** +15

---

### Beat 9 — Day 93 — After the Ford

**Character:** Miller's Wife Ruta
**Note:** **Four days after People unlock (89)** and [Northern refugees (91)](#beat-9--day-91--refugees-at-the-ford). First beat with live People stat. Callback refugee choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I return from the mills — and from the ford, where northern refugees camp beside our own hungry. I heard you sheltered strangers, turned them back, or let Arvel boil soup for Ingvar's politics. The Peasantry now has a name in your court. Do you feed your own first, share with the ford, or tell us all to pray?

**Prompt variant (`northernRefugeesAccepted`):** Your Majesty, I heard you fed the north while western bins still cough dust. The People see it. Malrik sees it. I see children sharing bowls.

**Prompt variant (`northernRefugeesTurnedBack`):** Your Majesty, I heard you closed the ford. Good for arithmetic. Bad for ballads. Elina already writes the second verse.

**Choice 1:** Feed locals first — refugees wait their turn
- **Response:** Then the ford curses you. The mills bless you. Politics as portion control.
- **Effects:** Food +8, People +8, Loyalty +4
- **Severity:** −4

**Choice 2:** Shared ration — crown counts every mouth
- **Response:** Expensive fairness. The only kind that sometimes keeps both song and sword quiet.
- **Effects:** Food +6, Treasury -15, People +12, Loyalty +6
- **Severity:** −10
- **Sets flag:** `hungryPeopleMeterLive`

**Choice 3:** Church feeds the ford — crown feeds the mills only
- **Response:** Split mercy. Malrik gains converts. You gain arithmetic. Ruta gains grudges.
- **Effects:** Church +8, People +4, Food -6
- **Severity:** +3

---

### Beat 10 — Day 100 — Kitchens Versus Provinces

**Character:** Cook Gromm
**Note:** Second Gromm beat — policy stress test before Church conclave era.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, ninety-nine days since your blade and still the city asks whether the usurper starves them on purpose. I heard refugees, guilds, miners, and Malrik's fasts. My kitchens can stretch one more month — or confess we already serve the court before the commons. Tell the truth at table, or tell a better lie.

**Prompt variant (`householdOutcome` imminent):** Your Majesty, Edric will ask who you became on day eighty-six. The city asks the same with spoons instead of scrolls.

**Choice 1:** Halve court rations — honest shared hunger
- **Response:** Thin plates for thin times. Nobles sulk. Servants remember.
- **Effects:** Food +10, People +8, Loyalty +6, Nobility -5
- **Severity:** −10

**Choice 2:** Double court rations — show the elite unafraid
- **Response:** Then the market smells roast while children lick pots. Elina will rhyme it.
- **Effects:** Food -10, Nobility +6, People -10, Loyalty -8
- **Severity:** +14

**Choice 3:** Export palace stores to provinces — crown goes hungry
- **Response:** Dangerous symbolism. I will cook barley and call it policy.
- **Effects:** Food +15, People +12, Loyalty +10, Treasury -5
- **Severity:** −15
- **Sets policy:** `feed` (confirmed)

---

### Beat 11 — Day 106 — Requisition

**Character:** General Rudolf
**Note:** Two days before [Church conclave](#beat-11--day-108--the-conclave). Army requisition vs food stability.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the army must eat before it must love you. I heard guilds compact, peasants charter, and Elina sing your sins. I can requisition grain from villages that still have it — legal theft with banners — or march on empty stomachs and call it virtue. Soldiers are not ballads. They are appetites.

**Prompt variant (`emptyPurseOutcome` weak):** Your Majesty, I heard the purse failed before the harvest. Requisition is not policy — it is appetite with law attached.

**Choice 1:** Authorize requisition — army fed first
- **Response:** Then villages hate you efficiently. The army marches on full bellies. Choose your enemy.
- **Effects:** Army +12, Food -12, People -10, Loyalty -8
- **Severity:** +12
- **Sets flag:** `hungryRudolfRequisition`
- **Sets policy:** `requisition`

**Choice 2:** Half rations for soldiers — share the famine
- **Response:** Discipline with hunger. Mutiny with honor. A familiar recipe.
- **Effects:** Army -6, Food +6, Loyalty +6, People +4
- **Severity:** −6

**Choice 3:** Buy grain at market — treasury bleeds, villages keep stores
- **Response:** Expensive peace. Cheaper than revolt — if the treasury survives.
- **Effects:** Treasury -20, Food +10, Army +6, Loyalty +4
- **Severity:** −8

---

### Beat 12 — Day 119 — Verdict on Hunger

**Character:** Old Advisor Edric
**Note:** Arc finale. **On load:** run [day 119 outcome priority](#hungry-season--beat-resolution-rules) → `hungryOutcome`, `hungryArcPhase = resolved`. Edric **reports** how the realm names your hunger policy — player does not pick the ending. Before Great Houses (158).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `bread_king`):** Your Majesty, seventy-seven days since Ruta coughed dust at your feet — and the provinces still have breath to praise you. I heard soup lines, open granaries, guild deals that bent without breaking. The commons call you the bread king. Ashford will sneer. The mills will not.

**Prompt (outcome `starving_crown`):** Your Majesty, severity outran every ledger. I heard requisitions, rotting stores, ballads of blame, and silence where children should eat. The realm calls it famine. The court calls it mismanagement. I call it the verdict you earned.

**Prompt (outcome `church_kitchen`):** Your Majesty, I heard Arvel's soup and Malrik's sermons feed what your treasury would not. The faithful call it mercy. The barracks call it surrender. The hungry call it supper. You ruled through heaven's ladle.

**Prompt (outcome `guild_republic`):** Your Majesty, I heard Fara's compact buy bread the crown could not price. Merchants fed the realm and billed the throne. The guild calls it partnership. The commons call it survival. You call it policy — if you are wise.

**Prompt (outcome `peasant_fury`):** Your Majesty, I heard Yarek's riots and Rudolf's ropes. Order without grain is arithmetic with blood. The provinces remember who rationed and who feasted. They will not forget before Ashford rides.

**Prompt (outcome `managed_famine`):** Your Majesty, you did what you could — no doctrine, only portions. Some fed, some angry, some singing in Elina's ballads. The year continues. Hunger does too, but slower than it might have.

**Choice 1:** I have heard the provinces — dismiss the hunger court
- **Response (outcome `bread_king`):** Then I write *bread* before *blade*. Rare for a usurper. Do not waste it.
- **Effects (outcome `bread_king`):** Food +8, People +10, Loyalty +8
- **Response (outcome `starving_crown`):** Then I write *famine* and close the granary ledgers. Spring will judge you harsher than I will.
- **Effects (outcome `starving_crown`):** Food -10, People -12, Loyalty -8
- **Response (outcome `church_kitchen`):** Then I write *shared mercy*. Malrik owns part of your kitchen now.
- **Effects (outcome `church_kitchen`):** Church +8, People +6, Treasury -5
- **Response (outcome `guild_republic`):** Then I write *merchant bread*. Fara will collect interest in favors.
- **Effects (outcome `guild_republic`):** Treasury +8, People +5, Nobility -6
- **Response (outcome `peasant_fury`):** Then I write *rope and riot*. Order is not peace.
- **Effects (outcome `peasant_fury`):** Army +6, People -10, Loyalty -6
- **Response (outcome `managed_famine`):** Then I write *survival*. Not triumph. The year continues.
- **Effects (outcome `managed_famine`):** Loyalty +5, Food +3

---

## The Guild Compact (persistent story)

**Defeat lane:** Treasury — *"A crown that cannot pay its debts belongs to its creditors."*  
**Span:** days **128–222**, **12 beats** — deliberately **late** (after [Hungry Season](#the-hungry-season-persistent-story), weaving through [Great Houses](#the-great-houses-persistent-story) gaps, ending before Loyalty unlock). Merchants, bankers, and mintmasters collect on the coup while Ashford measures the throne.

**Hidden stat (runtime, not shown in top bar):** `guildStanding` (−100…+100, starts at **0**)

| Tier | Range | Creditor tone |
|------|-------|----------------|
| **Hostile** | ≤ −35 | Embargo, run on treasury |
| **Wary** | −34…−5 | Harsh rates, public threats |
| **Transactional** | −4…+4 | Normal spreads |
| **Favored** | +5…+34 | Extensions, quiet support |
| **Partner** | ≥ +35 | Crown-guild co-rule of credit |

**Arc state:** `guildStanding`, `guildArcPhase` (active / resolved), `guildCrownStance` (pay / renegotiate / seize / default), flags (`guildFaraEmbargo`, `guildSaltLoan`, `guildNeriusCounterfeit`, `guildBorvinAudit`, `guildSelenaCredit`, `guildJointUltimatum`, `guildMintSeized`, `guildKnoxLeak`), `guildOutcome` (none / sound_treasury / debt_crown / merchant_throne / counterfeit_crisis / guild_republic / managed_debt)

**Beat schedule (late days; no overlap with Great Houses, Grey Lung 130/200, Northern 145/172/196):**

| Day | Character | Beat |
|-----|-----------|------|
| 128 | Head of Guild Fara | Credit withheld |
| 136 | Banker Dominic Salt | Coup investors return |
| 144 | Master of the Mint Nerius | Counterfeit Edwin coin |
| 152 | Treasurer Borvin | Two ledgers, one throne |
| 160 | Merchant Selena | Trade credit frozen |
| 169 | Old Advisor Edric | Before Ashford's price |
| 177 | Fara & Salt | Joint ultimatum (2 nodes) |
| 184 | Master of the Mint Nerius | Mint seizure |
| 192 | Treasurer Borvin | Default clock |
| 204 | Spy Knox | Ledger sold |
| 214 | Chronicler Ilana | Debt chapter |
| 222 | Old Advisor Edric | Verdict on the compact |

**Possible endings (day 222):** Sound Treasury · Debt Crown · Merchant Throne · Counterfeit Crisis · Guild Republic · Managed Debt

### Guild Compact — beat resolution rules

**Day 177:** Two-node beat — Fara node 0, Salt node 1 always follows (like Ashford debut).

**Day 222 outcome priority:** `guildStanding` ≥ 35 + stance `pay` → **sound_treasury** · `guildJointUltimatum` refused + standing ≤ −35 → **debt_crown** · `guildSaltLoan` + standing ≤ −20 → **merchant_throne** · `guildNeriusCounterfeit` unresolved → **counterfeit_crisis** · `guildFaraEmbargo` + Fara favored → **guild_republic** · else **managed_debt**.

**Cross-arc callbacks:** [Empty Purse](#the-empty-purse-persistent-story) `emptyPurseSaltLoan`, [Hungry Season](#the-hungry-season-persistent-story) `hungryFaraCartel`, [Church](#the-crown-forfeit--tithe-war-persistent-story) tithe pressure, [Great Houses](#the-great-houses-persistent-story) day 175 Ashford debut (beat 6 references), [Northern](#the-northern-price-persistent-story) war spending.

**Ashford day 175:** Guild beat 6 (day 169) sets tone; beat 7 (day 177) fires two days after unlock — Ashford may appear in ultimatum variants if `housesAshfordCouncil`.

---

### Beat 1 — Day 128 — Credit Withheld

**Character:** Head of Guild Fara
**Note:** Opens arc on **late** day 128 (post–Hungry Season). Callback `hungryFaraCartel` from [day 74](#beat-6--day-74--grain-cartel).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the grain guild remembers compacts and betrayals. I heard you fed provinces, seized wagons, or let markets rot during the hungry months. Credit to the crown is frozen until regicides prove they can pay more than sermons. Reopen trade on guild terms, or watch caravans route around your capital.

**Prompt variant (`hungryFaraCartel`):** Your Majesty, I heard we compacted bread in the famine. You owe goodwill — not gold. I am here to convert the first into the second.

**Choice 1:** Accept guild terms — crown borrows at guild rates
- **Response:** Then my ledgers own your mornings until you pay. The treasury breathes — on my schedule.
- **Effects:** Treasury +20, Succession -8, Loyalty -4
- **Standing:** +10
- **Sets flag:** `guildFaraEmbargo` (lifted)
- **Sets stance:** `renegotiate`

**Choice 2:** Reject — crown mints promissory notes instead
- **Response:** Paper is not coin. Merchants will learn that at your expense.
- **Effects:** Treasury +8, Nobility -5, Loyalty -6
- **Standing:** −15
- **Sets flag:** `guildFaraEmbargo`

**Choice 3:** Seize a guild house — terror as policy
- **Response:** Then the guild calls you brigand — accurately. Embargo hardens. Enjoy solitude.
- **Effects:** Treasury +15, Loyalty -12, Army +4
- **Standing:** −30

---

### Beat 2 — Day 136 — Coup Investors Return

**Character:** Banker Dominic Salt
**Note:** Callback [Empty Purse day 17](#beat-2--day-17--coup-creditors) `emptyPurseSaltLoan`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the men who rented your coup want returns — with interest compounding while you fed peasants and paid soldiers. I heard Fara froze credit or you froze her. My house holds the shorter leash. Pay Salt first, pay Fara second, or pay neither and learn who forecloses faster.

**Prompt variant (`emptyPurseSaltLoan`):** Your Majesty, I heard you already borrowed for the barracks. This is not a new debt — it is the old one wearing armour.

**Choice 1:** Pay Salt in full — buy time with gold
- **Response:** Then my quill clears your name — temporarily. The guild will hate your priority. The army will love it.
- **Effects:** Treasury -25, Army +5, Loyalty +4
- **Standing:** +15
- **Sets stance:** `pay`

**Choice 2:** Renegotiate Salt — longer term, higher rate
- **Response:** Time is coin. I sell both. You will buy again.
- **Effects:** Treasury +10, Succession -6
- **Standing:** +5
- **Sets flag:** `guildSaltLoan`

**Choice 3:** Default on coup debt — crown vs creditors
- **Response:** Then I sell your defaults to whoever hates you most. Ingvar reads ledgers too.
- **Effects:** Treasury +5, Loyalty -10, Succession -10
- **Standing:** −25
- **Sets stance:** `default`

---

### Beat 3 — Day 144 — Counterfeit Edwin Coin

**Character:** Master of the Mint Nerius
**Note:** Mid-era beat (day 144, after [Prophet day 140](#beat-3--day-140--the-absurd-miracle)). Edwin's ghost money undermines treasury.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, false crowns circulate — struck with King Edwin's face, spent with your usurper's blessing. I heard Osric's ghost seals and Salt's hungry loans. My mint can purge the forgeries, or your treasury can pretend they are tribute. Counterfeit is a tax on kings who cannot count.

**Prompt variant (`householdCutClerks` or `guildFaraEmbargo`):** Your Majesty, I heard you cut clerks and angered guilds. Forgers thrive in confusion. That is not philosophy — it is arithmetic.

**Choice 1:** Fund a mint purge — recall bad coin, issue new crown marks
- **Response:** Expensive honesty. Markets stall, then trust returns — if you finish.
- **Effects:** Treasury -18, Loyalty +8, Succession +6
- **Standing:** +8
- **Clears risk:** `guildNeriusCounterfeit` path

**Choice 2:** Ignore — let false coin circulate
- **Response:** Then prices lie and taxes lie with them. Borvin will scream. Thieves will cheer.
- **Effects:** Treasury +10, Loyalty -8
- **Sets flag:** `guildNeriusCounterfeit`

**Choice 3:** Blame Nerius — hang the mintmaster
- **Response:** Convenient scapegoat. The forgeries continue without a neck to blame. You chose theatre.
- **Effects:** Loyalty -6, Succession +4
- **Sets flag:** `guildNeriusCounterfeit` (worse fallout)

---

### Beat 4 — Day 152 — Two Ledgers, One Throne

**Character:** Treasurer Borvin
**Note:** Church tithe vs guild debt vs army pay.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik's tithe, Salt's interest, and Fara's fees eat the same chest — and Rudolf still wants rations. I heard you purged forgeries or let them spread. Choose which creditor starves this month: heaven, merchants, or steel.

**Prompt variant (`churchHolyLedger`):** Your Majesty, I heard you promised Malrik a shared ledger. He did not share. Neither did Salt.

**Choice 1:** Pay merchants first — keep credit alive
- **Response:** Then Malrik calls you usurer. The army calls you prudent. Both may be right.
- **Effects:** Treasury -15, Church -5, Loyalty +3
- **Standing:** +10
- **Sets flag:** `guildBorvinAudit`

**Choice 2:** Pay Church first — buy sermons over credit
- **Response:** Then Fara tightens the embargo. Malrik smiles. Arithmetic weeps.
- **Effects:** Church +10, Treasury -12, Loyalty -4
- **Standing:** −12

**Choice 3:** Pay army — creditors wait
- **Response:** Soldiers eat. Merchants remember. A classic usurper's triangle.
- **Effects:** Army +8, Treasury -10, Loyalty +5
- **Standing:** −8

---

### Beat 5 — Day 160 — Trade Credit Frozen

**Character:** Merchant Selena
**Note:** Distinct from Hungry Season day 85 / Great Houses uses Kara later. Trade routes as leverage.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Fara froze crown credit and Salt called your notes — I heard both before my caravans left the yard. I move grain and gold, not loyalty. Extend me crown escorts and premium pay, or I sell your shortages to your enemies at markup.

**Prompt variant (`guildFaraEmbargo` active):** Your Majesty, I heard the guild embargo holds. I am the embargo with wheels. Pay or walk.

**Choice 1:** Crown escorts and premium — buy routes back
- **Response:** I will deliver. I will also tell Fara you paid retail for wholesale problems.
- **Effects:** Treasury -20, Food +8, Loyalty +4
- **Standing:** +5
- **Sets flag:** `guildSelenaCredit`

**Choice 2:** Nationalize one caravan line — seize Selena's contract
- **Response:** Then I sell to Ingvar. You get wagons and a reputation for theft.
- **Effects:** Treasury +12, Loyalty -10, Army +4
- **Standing:** −15

**Choice 3:** Let routes fail — austerity as doctrine
- **Response:** Hungry markets remember. So do ballads. You chose purity over portions.
- **Effects:** Food -10, Treasury +8, Loyalty -8
- **Standing:** −10

---

### Beat 6 — Day 169 — Before Ashford's Price

**Character:** Old Advisor Edric
**Note:** Six days before [Nobility unlock / Ashford](#lady-ashford-debut-nobility-unlock). Warns that noble levies require solvent treasury.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, in six days Lady Ashford measures whether you are a ruler or a debtor in ermine. I heard Fara withhold credit, Salt compound interest, and Nerius find false coin. Great houses lend to kings who can pay — not to regicides who owe merchants more than bishops.

**Prompt variant (`guildStanding` ≤ −20):** Your Majesty, creditors talk louder than heralds. Ashford will hear them before she hears you.

**Choice 1:** Prepare solvency — pay one creditor publicly before she arrives
- **Response:** Theatre with receipts. Expensive. Ashford respects expensive truths.
- **Effects:** Treasury -15, Nobility +5, Loyalty +4
- **Standing:** +12
- **Sets stance:** `pay`

**Choice 2:** Prepare bluff — parade full coffers, hide empty ones
- **Response:** Confidence with varnish. Ashford peels paint for sport.
- **Effects:** Loyalty -4, Succession +6, Nobility -3
- **Sets stance:** `default` (hidden)

**Choice 3:** Prepare seizure — crown takes guild assets before nobles arrive
- **Response:** Bold piracy. Fara will scream. Ashford may applaud — if you win.
- **Effects:** Treasury +15, Loyalty -8, Army +5
- **Sets stance:** `seize`

---

### Beat 7 — Day 177 — Joint Ultimatum

**Character:** Head of Guild Fara (node 0) → Banker Dominic Salt (node 1)
**Note:** **Two-node beat** — fires two days after Ashford debut. Great Houses [day 175](#beat-6--day-175--nobility-unlock-ashford-debut) colors variants.
**Nodes:** 2 (start node: 0)

#### Node 0 — Fara

**Prompt:** Your Majesty, Ashford offers legitimacy at a price. I offer liquidity at a sharper one. Sign the Guild Compact — crown tariffs fixed, private credit open, temple tithe capped by merchants not Malrik — or we call your notes due before sunset.

**Prompt variant (`housesAshfordCouncil`):** Your Majesty, I heard you seated Ashford. She sells bloodlines. I sell time. Buy at least one honestly.

**Choice 1:** Sign the compact — merchants co-write policy
- **Response:** Then we are partners until you try to break us. Read the ink twice.
- **Effects:** Treasury +15, Church -8, Nobility -6, Succession -5
- **Standing:** +20
- **Sets flag:** `guildJointUltimatum` (accepted)
- **Next node:** 1

**Choice 2:** Refuse — crown does not share sovereignty
- **Response:** Then Salt finishes this conversation. I have done my courtesy.
- **Effects:** Loyalty +5, Treasury -5
- **Standing:** −15
- **Sets flag:** `guildJointUltimatum` (refused)
- **Next node:** 1

**Choice 3:** Counter — crown caps tithe, not tariffs
- **Response:** Half a compact. Half a war. Salt will price the difference.
- **Effects:** Church +5, Treasury -8, Succession +4
- **Standing:** +5
- **Next node:** 1

#### Node 1 — Salt

**Prompt:** Your Majesty, Fara spoke of compacts. I speak of clocks. Pay forty thousand crowns by week's end — coup principal, coup interest, coup insult — or I transfer your debts to northern buyers who prefer regicide stories to regicide reigns.

**Choice 1:** Pay — bleed the chest to buy the year
- **Response:** Then you are poor and alive. A respectable combination.
- **Effects:** Treasury -40, Loyalty +6, Succession +5
- **Standing:** +15
- **Sets stance:** `pay`

**Choice 2:** Offer Ashford marriage dowry as collateral
- **Response:** Then you mortgage bloodlines for coin. Ashford will notice. So will history.
- **Effects:** Treasury +20, Nobility -10, Succession +8
- **Standing:** +8

**Choice 3:** Refuse payment — default declared
- **Response:** Then I sell your name in every counting house from here to the pass. Enjoy ruling on barter.
- **Effects:** Treasury +5, Loyalty -15, Succession -12
- **Standing:** −35
- **Sets stance:** `default`

---

### Beat 8 — Day 184 — Mint Seizure

**Character:** Master of the Mint Nerius
**Note:** Between Great Houses days 181 and 185. Counterfeit crisis branch.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, false coin reached the army's pay chest — or would have, if Rudolf were less suspicious. I heard you defaulted on Salt or signed Fara's compact. My mint begs authority to seize every bad piece in the capital. Grant it, and trust returns slowly. Deny it, and trust never arrives.

**Prompt variant (`guildNeriusCounterfeit`):** Your Majesty, I heard you let forgeries spread. Seizure is surgery. You are already bleeding.

**Choice 1:** Grant seizure — martial law in the markets
- **Response:** Then coin is honest at the cost of riots. Honesty is not free.
- **Effects:** Army +6, Treasury -10, Loyalty -6
- **Standing:** +10
- **Sets flag:** `guildMintSeized`

**Choice 2:** Private seizure — guild pays, crown names it policy
- **Response:** Shared blame. Shared credit. Fara owns the muscle. You own the headline.
- **Effects:** Treasury -8, Loyalty +3, Nobility -4
- **Standing:** +15

**Choice 3:** Deny — trust the market to self-correct
- **Response:** Markets do not self-correct. They self-devour. You chose faith over mint.
- **Effects:** Treasury +5, Loyalty -10
- **Standing:** −12

---

### Beat 9 — Day 192 — Default Clock

**Character:** Treasurer Borvin
**Note:** Four days before Northern [day 196](#beat-13--day-196--mobilize-or-bluff) mobilization — war costs vs default.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the default clock strikes — Salt's agents camp at the lower gate, Fara's clerks audit your cellars, and Rudolf asks for war coin you do not have. I heard you signed, refused, or bluffed. Pay one final consolidated sum, declare open insolvency, or sell Edwin's crown jewels to merchants who will display them in shop windows.

**Choice 1:** Consolidated payment — one chest, all creditors pacified
- **Response:** Expensive silence. The rarest music in finance.
- **Effects:** Treasury -35, Loyalty +8, Succession +6
- **Standing:** +25
- **Sets stance:** `pay`

**Choice 2:** Open insolvency — crown admits bankruptcy
- **Response:** Honest catastrophe. Creditors take pieces. You keep the chair — maybe.
- **Effects:** Treasury +10, Nobility -15, Loyalty -12, Succession -10
- **Standing:** −40
- **Influences finale priority:** `debt_crown`

**Choice 3:** Sell crown jewels — humiliation with liquidity
- **Response:** Then the realm sees your mother's rubies in a guild window. You eat nonetheless.
- **Effects:** Treasury +25, Loyalty -10, Nobility -12
- **Standing:** −5

---

### Beat 10 — Day 204 — Ledger Sold

**Character:** Spy Knox
**Note:** Foreshadows [Northern day 278](#beat-15--day-278--leaks-to-the-north) / Court of Knives energy. Treasury secrets sold.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I sold a copy of Borvin's true ledger — not the court version — to whoever paid highest this week. Fara, Salt, Ingvar, and Ashford each hold pages you wished private. I can buy pages back, sell you forgeries instead, or vanish. Your treasury's shame is now a commodity.

**Choice 1:** Buy the ledger back — pay Knox and pray
- **Response:** Then you rent silence. I will sell again if the price improves.
- **Effects:** Treasury -18, Loyalty +6, Succession +4
- **Standing:** +5
- **Sets flag:** `guildKnoxLeak` (contained)

**Choice 2:** Feed forgeries — false numbers to all buyers
- **Response:** Clever until two liars compare notes. Still — buy time.
- **Effects:** Loyalty +4, Army +3
- **Standing:** +8

**Choice 3:** Arrest Knox — hang the messenger
- **Response:** Too late. The copies already walk. You chose theatre over arithmetic.
- **Effects:** Loyalty -8, Army +2
- **Sets flag:** `guildKnoxLeak` (exposed)

---

### Beat 11 — Day 214 — Debt Chapter

**Character:** Chronicler Ilana
**Note:** Four days after Great Houses [Ilana day 210](#beat-15--day-210--who-bowed-who-bled) — different chapter, treasury not scaffold.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I write the second draft — not who bowed, but who owns your mornings. I heard Fara's compact, Salt's clock, Nerius's false coin, Selena's premiums, and Knox's stolen numbers. Title this chapter *Solvent King*, *Debt Crown*, or *The Merchant's Throne* — the realm copies my verbs into law.

**Choice 1:** *Solvent King* — claim victory honestly
- **Response:** Flattering if true. Dangerous if not. I will verify before I print.
- **Effects:** Loyalty +6, Nobility +4
- **Standing:** +5

**Choice 2:** *Debt Crown* — admit the leash
- **Response:** Honest prose. Creditors hate it. Commons love it. You chose truth over tone.
- **Effects:** Loyalty +8, Nobility -8, Treasury +5
- **Standing:** −5

**Choice 3:** Bribe the chapter — omit Knox and Salt
- **Response:** Expensive fiction. Knox sells the footnotes anyway.
- **Effects:** Treasury -12, Loyalty -6
- **Standing:** −10

---

### Beat 12 — Day 222 — Verdict on the Compact

**Character:** Old Advisor Edric
**Note:** Arc finale. Four days after Great Houses [day 218](#beat-16--day-218--verdict-on-the-houses). **On load:** run [day 222 outcome priority](#guild-compact--beat-resolution-rules) → `guildOutcome`, `guildArcPhase = resolved`. Edric **reports** what creditors believe — player does not pick the ending.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `sound_treasury`):** Your Majesty, ninety-four days since Fara froze your credit — and the counting houses speak your name without spitting. I heard Salt paid, forgeries purged, Borvin's ledgers reconciled. You bought time with gold. The oldest miracle. The crown owns its coffers again — for now.

**Prompt (outcome `debt_crown`):** Your Majesty, I heard open insolvency, refused ultimatums, and creditors camping at the lower gate. The realm does not sue its king in court — it sues him in whispers, embargoes, and nephews. You belong to tomorrow's ledgers. You keep today's chair — barely.

**Prompt (outcome `merchant_throne`):** Your Majesty, I heard Salt's interest outlive your pride and Fara's smile outlive your policy. The merchants do not kneel — they invoice. You reign as partner-king or debtor-king. The compact calls it commerce. Ashford calls it humiliation.

**Prompt (outcome `counterfeit_crisis`):** Your Majesty, I heard false Edwin coin spread while the mintmaster begged or hung. Prices lie. Taxes lie with them. Trust does not return because you decree it. The treasury has a wound that gold alone cannot stitch.

**Prompt (outcome `guild_republic`):** Your Majesty, I heard Fara's embargo lift on guild terms and Salt's leash shorten together. You do not rule the markets — you share breath with them. Ashford sneers. Fara smiles. Both matter.

**Prompt (outcome `managed_debt`):** Your Majesty, no doctrine — only extensions, bluffs, and Knox's sold pages. The merchant's peace. Expensive. Familiar. You remain. That is also policy.

**Choice 1:** I have heard the creditors — dismiss the counting court
- **Response (outcome `sound_treasury`):** Then I write *solvent* before *loyal*. Winter has other invoices — pay them too.
- **Effects (outcome `sound_treasury`):** Treasury +5, Loyalty +8, Succession +6
- **Response (outcome `debt_crown`):** Then I write *bankrupt crown*. Creditors own tomorrow.
- **Effects (outcome `debt_crown`):** Treasury -10, Loyalty -10, Succession -8
- **Response (outcome `merchant_throne`):** Then I write *partner-king*. The throne breathes on merchant terms.
- **Effects (outcome `merchant_throne`):** Treasury +10, Nobility -8, Loyalty -4
- **Response (outcome `counterfeit_crisis`):** Then I write *false coin*. Fix the mint or lose the realm's arithmetic.
- **Effects (outcome `counterfeit_crisis`):** Treasury -8, Loyalty -12, Succession -6
- **Response (outcome `guild_republic`):** Then I write *compact*. You share the throne's breath with Fara's ledgers.
- **Effects (outcome `guild_republic`):** Treasury +10, Nobility -8, Loyalty -4
- **Response (outcome `managed_debt`):** Then I write *extensions*. Familiar music. Expensive rhythm.
- **Effects (outcome `managed_debt`):** Loyalty +3, Treasury -5

---

## The Crown Forfeit & Tithe War (persistent story)

Merged arc: **Proposition A** (Church can preach you king, usurper, or *nothing* — crown forfeit, interdict, deposition) + **Proposition B** (tithe war starves treasury and army while Malrik buys the mob with grain and rites). Spans days 30–108. Replaces pool encounter **#80** on day 30. Fires after Church stat-unlock cutscene.

**Arc state (runtime):** `churchArcStance` (submit / defy / bargain / schism), `churchForfeitPressure` (0–100), `churchTithePressure` (0–100), flags (`churchCapTithe`, `churchGrainMonopoly`, `churchFastingDecree`, `churchPilgrimCrisis`, `churchArmyFedByAltar`, `churchInterdictDeclared`, `churchHolyLedger`, `churchCyrusCooperated`), `churchOutcome` (none / anointed_usurper / secular_crown / schism_king / puppet_throne / forfeit_survived)

**Cross-reference rule:** Beats reference prior church and household flags. Malrik callbacks use *"I heard you…"* keyed to `churchArcStance` and `householdShelteredConfessor` / `householdChurchDeal`.

**Beat schedule (no overlap with Grey Lung 38, 45, 52, 70, 95 or Household 33, 49, 58, 67, 86 or Empty Purse 36, 47, 54, 65):**

| Day | Character | Beat |
|-----|-----------|------|
| 30 | High Priest Malrik | The Verdict (replaces #80) |
| 35 | Inquisitor Cyrus | The holy inquiry |
| 37 | Monk Arvel | The other half of the Church |
| 40 | Treasurer Borvin | Two kings' tax |
| 44 | Old Advisor Edric | The forfeit machinery |
| 48 | Merchant Selena | Church buys the granaries |
| 55 | Sister Velda | The fasting decree |
| 61 | Captain Varn | Pilgrims at the gate |
| 69 | General Rudolf | Crossed swords and empty purses |
| 77 | High Priest Malrik | The interdict and the ledger |
| 108 | Malrik or Arvel | The conclave |

**Possible endings:** Anointed Usurper · Secular Crown · Schism King · Puppet Throne · Forfeit Survived

### Church arc — beat resolution rules

**Day 108 outcome priority:** `churchArcStance = schism` → **schism_king** · `churchInterdictDeclared` + defied + army flag → **secular_crown** · `churchArcStance = submit` + pressure &lt; 50 → **anointed_usurper** · `churchArcStance = bargain` → **puppet_throne** · forfeitPressure ≥ 80 but still reigning → **forfeit_survived** · else **puppet_throne**.

**Church stat:** Unlocks day 30 on beat 1 — effects apply from this arc onward.

**Grey Lung `church_route`:** If active by day 55+, Malrik variants reference holy water and physic; `churchForfeitPressure` gains +10 on miracle-leaning choices.

---

### Beat 1 — Day 30 — The Verdict

**Character:** High Priest Malrik
**Note:** Replaces encounter #80 after Church unlock cutscene. Node 1 always follows node 0.
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the people know your crown, but do not know whether it is blessed. Today the Church must decide whether to name you king or usurper. I did not come for your soul — I came for your name in the square.

**Choice 1:** Ask the Church for a blessing — humility before heaven
- **Response:** Humility is a fitting mask for one who reached the throne through blood. The faithful will hear it.
- **Effects:** Church +15, Treasury -8, Loyalty +3
- **Sets stance:** `submit`
- **Next node:** 1

**Choice 2:** Demand recognition — the crown needs no sermon
- **Response:** Orders reach soldiers. They rise to heaven far less well. You will learn that soon.
- **Effects:** Church -12, Army +8, Loyalty -4
- **Sets stance:** `defy`
- **Next node:** 1

**Choice 3:** Offer an alliance — throne and altar share the realm
- **Response:** An alliance of crown and crosier may save Estedor. Or smother it. We will see which hungers more.
- **Effects:** Church +8, Treasury -5, Succession +3
- **Sets stance:** `bargain`
- **Next node:** 1

**Choice 4:** Name the schism — I will not kneel to one priest's voice
- **Response:** Then you align yourself with Arvel's muttering monks and against my choir. Dangerous. Popular, perhaps, among the hungry.
- **Effects:** Church -8, Loyalty +5
- **Sets stance:** `schism`
- **Next node:** 1

#### Node 1

**Prompt:** Your Majesty, blessing is not a gift — it is a leash. I can preach you king and make the mob kneel. I can preach you usurper and make them sharpen knives. Or I can preach silence — and let every lord decide whether you rule tomorrow. I heard you chose your tone on the threshold. Now choose what the Church buys with it.

**Prompt variant (`submit`):** Your Majesty, you asked for blessing. Then hear the price: tithe flows to God's house before yours, and my scribes copy your decrees only after my seal. I heard humility from your lips. The realm will hear ownership from mine.

**Prompt variant (`defy`):** Your Majesty, you demanded recognition as if heaven were a barracks. I heard steel in your voice. Steel does not consecrate. My scribes already draft a second sermon — for the day your guards cross themselves and step aside.

**Choice 1:** Accept Church custody of legitimacy — the altar crowns the throne
- **Response:** Then kneel in the square when I bid it. The usurper becomes anointed — or becomes a lesson.
- **Effects:** Church +12, Succession +5, Army -3
- **Pressure:** forfeit +15, tithe +10

**Choice 2:** Refuse — the crown recognizes itself
- **Response:** Then prepare for a sermon that names you regicide. I heard defiance. The faithful heard a challenge.
- **Effects:** Church -10, Army +5, Loyalty -6
- **Pressure:** forfeit +25

**Choice 3:** Shared ledger — tax and tithe negotiated, not decreed
- **Response:** A merchant's peace. Borvin will hate it. I will tolerate it — until I do not.
- **Effects:** Church +5, Treasury -8, Loyalty +2
- **Sets flag:** `churchHolyLedger`
- **Pressure:** forfeit +10, tithe +15

---

### Beat 2 — Day 35 — The Holy Inquiry

**Character:** Inquisitor Cyrus
**Note:** Fires five days after Malrik's verdict. Hunts schism, shelter, and forfeit resistance before Arvel's day-37 beat. Callback day 30 stance and Household `householdShelteredConfessor`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik names you king or usurper in the square. I name you suspect in God's ledger. I heard you knelt, defied, or bargained on day thirty — and I heard Edwin's confessor still breathes in Arvel's cloister if rumour serves. My commission is inquiry, not sermon. Surrender names, surrender Aldo, or surrender patience.

**Prompt variant (`defy` + `householdShelteredConfessor`):** Your Majesty, I heard you defied the altar and sheltered a priest who heard Edwin's sins. That is two treasons by Malrik's count. By mine, it is one investigation with excellent witnesses.

**Prompt variant (`schism` stance):** Your Majesty, I heard you named schism before my boots crossed your threshold. Arvel's monks smile. I do not. Inquiry feeds on smiles.

**Choice 1:** Cooperate — feed Cyrus loyalist names, not Aldo
- **Response:** Useful. Malrik will call it crown justice. Arvel will call it cowardice. Both may be right.
- **Effects:** Church +8, Loyalty -6, Succession +6
- **Sets flag:** `churchCyrusCooperated`

**Choice 2:** Refuse inquiry — the crown is not a confessional
- **Response:** Then I write *obstruction* beside *usurper* and sleep well. You may not.
- **Effects:** Church -12, Army +5, Loyalty +4
- **Pressure:** forfeit +10

**Choice 3:** Trade Aldo's exile for ending the inquiry
- **Response:** One priest for one peace. Malrik gains a scalp. You gain a week. Weeks add up.
- **Effects:** Church +5, Loyalty -4, Succession +4
- **Clears flag:** `householdShelteredConfessor` (if set — Aldo sent east)

---

### Beat 3 — Day 37 — The Other Half of the Church

**Character:** Monk Arvel
**Note:** Intro schism from intro cutscene. Absorbs former Household day-41 Malrik callbacks when `householdShelteredConfessor` or `householdChurchDeal` set. Follows [Inquisitor Cyrus day 35](#beat-2--day-35--the-holy-inquiry).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, half the Church says the calamities were God's punishment. The other half says punishment sat on Edwin's throne long before your blade. I heard you chose a sermon on day thirty — kneel, defy, or bargain. Brother Malrik speaks for the altar. I speak for the poor who listen to both.

**Prompt variant (`churchCyrusCooperated`):** Your Majesty, I heard you fed Cyrus names while my brothers starved. Malrik calls that kingship. I call it appetite. Choose whether schism feeds the poor or only the inquisitor.

**Prompt variant (`householdShelteredConfessor`):** Your Majesty, I sheltered Edwin's confessor while Malrik drafts forfeit in his chapter house. I heard you kept Aldo under my roof — Malrik calls it treason in God's closet. The faithful heard mercy. Which sermon wins the lower wards?
### Beat 4 — Day 40 — Two Kings' Tax

**Character:** Treasurer Borvin
**Note:** Tithe War beat. Callback day 30 stance and Household `householdCutClerks`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, temple tithe reached the treasury's throat this week — more coin to Malrik's house than to yours. I heard you opened day thirty with blessings or threats. The faithful pay God first now. If I cut clerks, he calls it sacrilege. If I pay soldiers, the altar calls it theft. Which king goes hungry — you or heaven?

**Prompt variant (`defy` + `householdCutClerks`):** Your Majesty, you purged Edwin's clerks and spat at Malrik in the same moon. I heard consistency. The tithe collectors heard a target. They are faster than your tax men.

**Prompt variant (`churchHolyLedger`):** Your Majesty, you promised a shared ledger on day thirty. Malrik's collectors did not read your contract. I heard negotiation. They heard suggestion.

**Choice 1:** Cap the tithe — crown law limits Church collection
- **Response:** The altar will hiss. The treasury will breathe. Malrik will call it persecution by sunset.
- **Effects:** Church -18, Treasury +15, Loyalty -5
- **Sets flag:** `churchCapTithe`
- **Pressure:** forfeit +15, tithe -20

**Choice 2:** Pay the tithe from treasury — buy peace with gold
- **Response:** Expensive holiness. Soldiers will ask why God eats before they do.
- **Effects:** Treasury -20, Church +10, Army -6
- **Pressure:** tithe +20

**Choice 3:** Audit both — expose who steals in God's name
- **Response:** Then we follow ink and incense. Names will surface. None will thank you.
- **Effects:** Treasury -8, Church -5, Loyalty +6, Succession +4

---

### Beat 5 — Day 44 — The Forfeit Machinery

**Character:** Old Advisor Edric
**Note:** Crown Forfeit beat — explains deposition tools. Callback day 30 and Borvin.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I served three kings and buried two. Malrik does not need a blade to end you — he has a ledger, a pulpit, and a word: *forfeit*. I heard you capped the tithe — or fed it. His scribes copy your name with a strike through it when forfeit is preached. Interdict next: no rites, no legitimacy, no guards who fear hell. Do you understand the machine you argued with on day thirty?

**Prompt variant (`submit`):** Your Majesty, you knelt for blessing. I heard humility. Malrik heard leash. Forfeit is how he shortens it when you tug.

**Prompt variant (`churchCapTithe`):** Your Majesty, I heard you capped God's share. Malrik will not answer with arithmetic. He answers with pulpits.

**Choice 1:** Prepare secular law — crown legitimacy without sacrament
- **Response:** Bold. The faithful call it heresy. Soldiers may call it clarity. Write it before Sunday.
- **Effects:** Church -8, Army +6, Succession +5

**Choice 2:** Negotiate boundaries — what Malrik may preach, what he may not
- **Response:** A treaty with heaven's broker. It holds until it does not. Usually until gold runs thin.
- **Effects:** Church +5, Loyalty +4, Treasury -6

**Choice 3:** Let him try forfeit — and ready the army
- **Response:** Then you bet steel against scripture. I have seen scripture win in the square and lose in the barracks. Rarely in that order.
- **Effects:** Army +10, Church -12, Loyalty -8

---

### Beat 6 — Day 48 — Church Buys the Granaries

**Character:** Merchant Selena
**Note:** Tithe War beat — Church outbids crown for grain. Grey Lung optional day 45 may have fired.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik's tithe buys grain at prices my caravans cannot match. I heard you fought him in ledgers on day forty — he answered in bread. Temples feed the hungry and preach who saved them. Your crown feeds soldiers and preaches who paid them. Which sermon fills the belly faster?

**Prompt variant (plague arc active):** Your Majesty, Grey Lung makes every granary a fortress. Malrik sells blessed grain from temple stores. I heard you fund physic in the wards — he funds prayer in the lines. The sick thank heaven before they thank you.

**Prompt variant (`churchCapTithe`):** Your Majesty, I heard you capped tithe. Malrik capped nothing — he spends temple reserves on grain and calls it charity. The mob calls it love.

**Choice 1:** Outbid the Church — crown grain at temple steps
- **Response:** Hungry praise is expensive. Worth it, until the next empty purse.
- **Effects:** Treasury -18, Food +12, Loyalty +8, Church -6

**Choice 2:** Seize temple granaries — feed the crown first
- **Response:** Then hear forfeit by dawn. You will have bread and sermons about your black soul.
- **Effects:** Food +15, Church -20, Loyalty -5, Army +5
- **Sets flag:** `churchGrainMonopoly` (broken)

**Choice 3:** Let Selena broker — shared caravans, shared credit
- **Response:** I will sell you grain and sell Malrik your caution. Remember I sell both ways.
- **Effects:** Treasury -10, Food +8, Church +3
- **Sets flag:** `churchSelenaBroker`

---

### Beat 7 — Day 55 — The Fasting Decree

**Character:** Sister Velda
**Note:** Tithe War beat — Malrik declares meat unclean / fasting. Velda runs hospital sisters who feed the sick while the realm fasts. Callback Household `householdKeptGromm` (Gromm no longer speaks in this arc) and church stance.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik named meat unclean this week — penance for a regicide's reign. My sisters still boil broth for Grey Lung wards while the faithful fast in the square. I heard you purged Edwin's kitchens or kept them; either way, the court must eat and the sick must drink. Soldiers ask why God hates their supper. I ask why heaven starves hospitals to feed sermons.

**Prompt variant (`householdKeptGromm`):** Your Majesty, Gromm still feeds your court because you kept him when others purged Edwin's ghosts. My wards feed the poor because I kept my vows. Malrik hears corruption on both pots. Choose whether mercy stops at the palace door.

**Prompt variant (`churchGrainMonopoly` broken):** Your Majesty, I heard you seized temple grain. Malrik answered with fasting — hunger as holiness. The barracks are louder than the chapel. My sisters hide soup beneath habits.

**Choice 1:** Ignore the decree — the court and wards eat as they please
- **Response:** Then the faithful call you glutton and sinner. The soldiers call you king. My patients call you sensible.
- **Effects:** Church -15, Army +8, Food +5, Loyalty -4, Health +3
- **Sets flag:** `churchFastingDecree` (defied)

**Choice 2:** Observe the fast — public penance at table
- **Response:** Humility in public, resentment in the wards. Malrik will call it conversion. I call it theatre that kills slowly.
- **Effects:** Church +12, Army -6, Loyalty +3, Health -5

**Choice 3:** Feed the barracks in secret — fast in the chapel, meat in the yard
- **Response:** Hypocrisy feeds armies. A time-honored recipe. Do not let Malrik smell the roast — or my soup.
- **Effects:** Army +10, Church -5, Treasury -8, Health +2

---

### Beat 8 — Day 61 — Pilgrims at the Gate

**Character:** Captain Varn
**Note:** Crown Forfeit beat — faithful block palace demanding forfeit or blessing.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, three thousand pilgrims camp at the lower gate — Malrik's doing, though he swears innocence. They chant forfeit or blessing, whichever comes first. I heard you defied fasting in the yards or knelt at table — they heard both from spies. My guards will not disperse a holy crowd without your word on blood.

**Prompt variant (`defy` consistent):** Your Majesty, I heard you chose steel over scripture on day thirty, capped tithe, and fed soldiers while the faithful fasted. The pilgrims are your sermon made flesh. They want your crown or your confession.

**Prompt variant (`submit`):** Your Majesty, I heard you knelt for blessing. They want you to kneel again — publicly, permanently. Malrik says once is theatre. Three times is doctrine.

**Choice 1:** Disperse them — soldiers clear the gate
- **Response:** Blood in a holy crowd buys martyrs. Malrik knows that. He hopes you do not.
- **Effects:** Army -10, Church -18, Loyalty -12, Succession +6

**Choice 2:** Address them yourself — speak before Malrik speaks for you
- **Response:** Brave or foolish. The square will hear one king today. Pray it is you.
- **Effects:** Loyalty +10, Church +5, Army +3

**Choice 3:** Let Malrik disperse his own flock — he made the pilgrimage
- **Response:** Then he owns the miracle and the riot. You own the walls. For now.
- **Effects:** Church +12, Loyalty -8, Succession -5
- **Sets flag:** `churchPilgrimCrisis`

---

### Beat 9 — Day 69 — Crossed Swords and Empty Purses

**Character:** General Rudolf
**Note:** Merged A+B — army unpaid (tithe war + [Empty Purse](#the-empty-purse-persistent-story)) + soldiers cross themselves (forfeit). Callback pilgrims, Borvin, `emptyPurseCrisis`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, two companies crossed themselves instead of marching when I ordered dispersal at the gate. I heard pilgrims camped because you would not or could not clear them. Borvin says tithe ate their pay. Malrik says heaven outranks you. I heard Salt's coup debt and Kara's wagons in the same breath. Tell me whether I discipline soldiers, pay them, or let the Church feed their families and steal their oaths.

**Prompt variant (`emptyPurseCrisis` or `emptyPurseOutcome = ghost_army`):** Your Majesty, I heard you told the army honor feeds barracks. They believed you until the third empty muster. Crossed themselves? They crossed you first.

**Prompt variant (`churchPilgrimCrisis`):** Your Majesty, I heard you let Malrik own the crowd at the gate. My men think he pays better in bread and blessings. They are not wrong.

**Prompt variant (`churchFastingDecree` defied):** Your Majesty, I heard you fed the barracks while the realm fasted. The faithful call your soldiers sinners. Your soldiers call the faithful unpaid creditors.

**Choice 1:** Pay the army from crown reserves — buy oaths back
- **Response:** Gold before God. A soldier's theology. Expensive — until cheaper than mutiny.
- **Effects:** Treasury -22, Army +15, Church -8, Loyalty +5

**Choice 2:** Arrest the ringleaders — steel before scripture
- **Response:** Then hang men who crossed themselves. The barracks will remember. The chaplains will scream.
- **Effects:** Army +8, Church -15, Loyalty -10

**Choice 3:** Let Malrik feed their families — but demand their oaths remain
- **Response:** You ask the altar to pay and the sword to obey. I give it one month.
- **Effects:** Church +10, Army -6, Treasury +5
- **Sets flag:** `churchArmyFedByAltar`

---

### Beat 10 — Day 77 — The Interdict and the Ledger

**Character:** High Priest Malrik
**Note:** Climax — interdict (no rites) plus tithe ultimatum. Callback entire arc.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I heard you capped my tithe, seized my grain, fed sinners in barracks, and let pilgrims name you forfeit at the gate. I do not need a blade. I suspend sacraments in the capital — no baptisms, no last rites, no quiet conscience for your guards. Either you submit the crown to God's ledger, or you rule a city that fears hell more than you.

**Prompt variant (`churchHolyLedger` + `bargain`):** Your Majesty, you promised shared ledger and shared power. I heard a merchant's offer. I answer with interdict — heaven does not haggle on its knees.

**Prompt variant (`schism` confirmed):** Your Majesty, Arvel's monks preach against me while you fund both sides. I heard you split the Church. I will unsplit the capital — one sermon, one king, and it will not be you unless you kneel.

**Choice 1:** Kneel — accept anointed legitimacy on Church terms
- **Response:** Then forfeit dies in the square and lives in the chapter house. You survive. You serve.
- **Effects:** Church +20, Succession +10, Army -8, Loyalty +5
- **Sets flag:** `churchInterdictDeclared` (lifted)
- **Influences finale priority:** `anointed_usurper` / `puppet_throne`

**Choice 2:** Defy the interdict — secular crown, secular law
- **Response:** Then every pulpit names you cursed. I heard steel in your voice on day thirty. Steel must finish what it began.
- **Effects:** Church -20, Army +12, Loyalty -8
- **Sets flag:** `churchInterdictDeclared` (active)
- **Pressure:** forfeit +30

**Choice 3:** Counter with Arvel — schism rites in the open, defy Malrik's monopoly
- **Response:** Two churches, one bleeding city. You chose the fracture. May it not fracture you.
- **Effects:** Church -5, Loyalty +10, Food -10
- **Influences finale priority:** `schism_king`

---

### Beat 11 — Day 108 — The Conclave

**Character:** High Priest Malrik or Monk Arvel
**Note:** Finale. **On load:** run [day 108 outcome priority](#church-arc--beat-resolution-rules) → `churchOutcome`, `churchArcPhase = resolved`. **Malrik** speaks unless `churchArcStance = schism` (then **Arvel**). Speaker **reports** the conclave's verdict — player does not pick the ending.
**Nodes:** 1 (start node: 0)

#### Node 0 — Malrik (default)

**Prompt (outcome `anointed_usurper`):** Your Majesty, the conclave met without you — and heaven voted pragmatic. I heard you knelt, bargained, or bent before interdict became pyre. Forfeit dies in the square and lives in the chapter house. You leave anointed. You leave leashed. The mob kneels. Rudolf grimaces. You breathe.

**Prompt (outcome `secular_crown`):** Your Majesty, I heard steel in God's chapter house — or steel in your voice since day thirty. Interdict could not bury you. Sacrament could not buy you. The conclave names you secular king: cursed in chapel, obeyed in barracks. Scripture lost. You did not.

**Prompt (outcome `schism_king`):** Your Majesty, two churches, one bleeding city. I heard you chose Arvel's gate over my altar — or fractured us until neither sermon owned the capital. History will call it heresy or liberation. Rarely both. You rule a schism you fed.

**Prompt (outcome `puppet_throne`):** Your Majesty, I heard shared ledger promises and tithe-throne arithmetic. You are puppet and partner both. The treasury will learn the difference slowly. Heaven keeps a hand on your collar. You keep the chair. Common arrangement. Uncommon honesty.

**Prompt (outcome `forfeit_survived`):** Your Majesty, forfeit was proclaimed — and you still sit. Unprecedented. Exhausting. I heard pressure break against your stubborn pulse. Every chapel names you usurper. The throne does not care for names. Neither, apparently, do you.

**Choice 1:** I have heard the conclave — dismiss the chapter
- **Response (outcome `anointed_usurper`):** Then kneel when I ask. Heaven owns part of your mornings now.
- **Effects (outcome `anointed_usurper`):** Church +15, Succession +12, Loyalty +8, Army -5
- **Response (outcome `secular_crown`):** Then rule without my blessing. Steel finishes what scripture could not.
- **Effects (outcome `secular_crown`):** Army +15, Church -25, Loyalty -12
- **Response (outcome `puppet_throne`):** Then share the ledger. I will collect my half on schedule.
- **Effects (outcome `puppet_throne`):** Church +10, Treasury -15, Succession +5
- **Response (outcome `forfeit_survived`):** Then endure the name *usurper*. Chairs outlast sermons.
- **Effects (outcome `forfeit_survived`):** Church -15, Army +10, Loyalty -10, Succession -8

#### Node 0 — Arvel (`churchArcStance = schism` → outcome `schism_king`)

**Prompt:** Your Majesty, Malrik's conclave met to name you forfeit. My brothers met to name you possible. I heard you chose schism when others chose kneeling. The capital has two sermons and one throne. Reform, bread, and a king who does not buy heaven — that is what the streets will remember.

**Choice 1:** I have heard the brethren — dismiss the gate
- **Response:** Then Estedor has two faiths. May neither fracture you before spring.
- **Effects:** Church -12, Loyalty +12, Food -8, Succession +6

---

## The Northern Price (persistent story)

Foreign-war arc spanning **day 5 to day 350**. Ambassador Ingvar and the northern princes test the usurper before Church even unlocks (day 30) and keep testing through Nobility (175), Loyalty (260), and Succession (320). Each beat replaces the random pool encounter on its day.

**Hidden stat (runtime, not shown in top bar):** `northernTrust` (−100…+100, starts at **0**)

| Tier | Range | Ingvar's tone |
|------|-------|----------------|
| **Hostile** | ≤ −35 | Threats, embargoes, war talk |
| **Wary** | −34…−5 | Cold courtesy, leverage |
| **Neutral** | −4…+4 | Transactional |
| **Cordial** | +5…+34 | Partnership offers |
| **Allied** | ≥ +35 | Mutual defence, shared enemies |

**Arc state:** `northernTrust`, `northernWarStage` (none / tension / skirmish / mobilized / truce / war / vassal), flags (`northernTributePaid`, `northernAllianceSigned`, `northernWarDeclared`, `northernRefugeesAccepted`, `northernRefugeesTurnedBack`, `northernAshfordLinked`), `northernOutcome` (none / cold_peace / tributary / ally / victor / broken / vassal)

**Cross-reference rule:** Beats use `northernTrust` tier for prompt/response variants. Static beats also set **Trust ±** on listed choices. Callbacks: *"I heard you…"* from prior northern flags and other arcs (Church schism, Grey Lung, Household).

**Beat schedule (no overlap with other arcs):**

| Day | Character | Beat | Era |
|-----|-----------|------|-----|
| 5 | Ambassador Ingvar | First envoy | Pre-Church |
| 12 | Ambassador Ingvar | The regicide's receipt | Pre-Church |
| 20 | General Rudolf | Smoke on the border | Pre-Church |
| 27 | Ambassador Ingvar | Before the Faith | Pre-Church (3 days before unlock) |
| 46 | Treasurer Borvin | The war chest | Church era |
| 57 | Spy Knox | Agents from the north | Church era |
| 66 | Ambassador Ingvar | Alliance charter | Church era |
| 78 | General Rudolf | Skirmish at Grey Pass | Church era |
| 91 | Ambassador Ingvar | Refugees at the ford | People era (unlock day 89) |
| 122 | Ambassador Ingvar | Mid-year ultimatum | People era |
| 145 | Mercenary Kara | Guns on the northern road | People era |
| 172 | Old Advisor Edric | Houses measure your wars | Pre-Nobility (Ashford day 175) |
| 196 | General Rudolf | Mobilize or bluff | Nobility era |
| 252 | Ambassador Ingvar | Loyalties for sale | Pre-Loyalty (unlock day 260) |
| 278 | Spy Knox | Leaks to the north | Loyalty era |
| 350 | Ambassador Ingvar | The year's ledger | Late era (Succession unlocked) |

**Possible endings (day 350):** Cold Peace · Tributary Crown · Northern Ally · Victorious Usurper · Broken Realm · Vassal Throne

### Northern Price — beat resolution rules

**Prompt variant priority:** `northernWarStage` crisis overrides tier → else `northernTrust` tier → else default. **Grey Lung day 130** (Ingvar formula beat) is a separate plague-arc encounter if both fire; northern arc uses day 122/145, not 130.

**Day 350 outcome:** `northernTrust` ≥ 35 + alliance → **ally** · war declared + army high → **victor** or **broken** · tribute paid repeatedly → **tributary** · trust ≤ −35 + war → **broken** · trust neutral + truce → **cold_peace** · submit on day 122 ultimatum → **vassal**.

**People / Nobility / Loyalty / Succession:** Effects on locked stats bank until unlock day or apply as Loyalty substitute per beat **Note**.

---

### Beat 1 — Day 5 — First Envoy

**Character:** Ambassador Ingvar
**Note:** First northern contact — before Church, Household beat 2 (day 8). Sets initial trust trajectory.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Ambassador Ingvar of the northern princes. They have not decided whether you are a king, a regicide, or a temporary inconvenience. I am here to learn which before their banners learn it for them.

**Choice 1:** Receive him as an equal envoy — the north has our respect
- **Response:** Then they will call you prudent. For a week. After that they price respect in coin and corpses.
- **Effects:** Loyalty +3, Army +2
- **Trust:** +8

**Choice 2:** Insult the princes — Edwin's throne was ours by right of conquest
- **Response:** I will carry your eloquence north. They will answer with winter and horses. You chose the loud door.
- **Effects:** Army +5, Treasury +3
- **Trust:** −22

**Choice 3:** Bribe him for time — gold buys silence
- **Response:** I am not cheap, but I am persuadable. They will hear you are buying days, not alliances.
- **Effects:** Treasury -10, Loyalty +2
- **Trust:** +12

---

### Beat 2 — Day 12 — The Regicide's Receipt

**Character:** Ambassador Ingvar
**Note:** Variant by `northernTrust` tier from beat 1.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? I heard you received me on day five with courtesy — or with spit. They want the same answer in writing before they recognize your seal.

**Prompt variant (Hostile):** Your Majesty, I heard you called the north vultures before your crown was warm. The princes do not send recognition — they send a list of exiles they already shelter. Pay attention to the names.

**Prompt variant (Cordial / Allied):** Your Majesty, I heard you treated an envoy as an equal. Unusual for a usurper. The princes offer a provisional letter — not friendship, but a door left unbarred.

**Choice 1:** Send recognition papers — ask the north to name you king
- **Response:** Then you ask wolves to bless the lamb. Brave. They will answer with conditions, not hymns.
- **Effects:** Succession +5, Treasury -5
- **Trust:** +10

**Choice 2:** Refuse all forms — the crown needs no northern ink
- **Response:** Ink is cheaper than cavalry. You will learn which runs out first.
- **Effects:** Army +4, Loyalty -4
- **Trust:** −15

**Choice 3:** Trade receipts — Edwin's debts for your recognition
- **Response:** A merchant's peace. Borvin will curse you. The princes will read your ledgers before your titles.
- **Effects:** Treasury -8, Succession +8
- **Trust:** +5
- **Sets flag:** `northernTributePaid` (partial)

---

### Beat 3 — Day 20 — Smoke on the Border

**Character:** General Rudolf
**Note:** Military pressure. Callback day 5 trust (Ingvar warned or praised).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, riders report smoke on the Grey Pass — not army campfires, but villages burning. I heard Ingvar left your hall on day five pleased or furious. The north tests borders when words fail. Do I reinforce the pass, raid in answer, or send you to negotiate what steel should not?

**Prompt variant (Hostile trust):** Your Majesty, I heard you spat at the northern envoy. The smoke is your answer. Give me two companies or give me a better sermon.

**Choice 1:** Reinforce Grey Pass — hold the line
- **Response:** Then the treasury bleeds and the north knows you flinch with walls, not horses.
- **Effects:** Army +8, Treasury -12, Food -5
- **Trust:** −5 (shows fear)

**Choice 2:** Raid northern scouts — answer smoke with steel
- **Response:** A border war by breakfast. Ingvar will call it banditry. The princes will call it invitation.
- **Effects:** Army +5, Loyalty -6
- **Trust:** −25
- **Sets:** `northernWarStage = skirmish`

**Choice 3:** Send Ingvar to the pass — words before blood
- **Response:** Then we bet diplomacy on a man who sells all sides. Cheaper than graves — if it works.
- **Effects:** Loyalty +4, Treasury -6
- **Trust:** +8

---

### Beat 4 — Day 27 — Before the Faith

**Character:** Ambassador Ingvar
**Note:** Three days before Church unlock (day 30). Malrik will soon compete for legitimacy — Ingvar offers secular alternative.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, in three days your priests will ask whether heaven blesses regicide. I heard Rudolf reinforced the pass — or raided it. The princes offer a secular bargain before Malrik offers a holy one: recognize their trade rights, and they recognize your seal. God can wait. Politics cannot.

**Prompt variant (Wary):** Your Majesty, I heard you hold the border with stone, not gifts. Fair. The princes raise tribute instead of banners — for now. Pay, or let Malrik become your only friend.

**Choice 1:** Pay northern tribute — buy time before the Church acts
- **Response:** Then Borvin weeps and the pass stays quiet. Malrik will call it selling your soul to merchants instead of priests.
- **Effects:** Treasury -18, Succession +6, Church -3
- **Trust:** +18
- **Sets flag:** `northernTributePaid`

**Choice 2:** Refuse — let Malrik and the princes bid separately
- **Response:** Then you enter day thirty with two enemies and no ledger. Bold arithmetic.
- **Effects:** Church +2, Army +3
- **Trust:** −12

**Choice 3:** Offer double trade — Estedor becomes northern gateway
- **Response:** Commerce as diplomacy. Selena will grow rich. Rudolf will grow suspicious. Useful tensions.
- **Effects:** Treasury -5, Food +5, Loyalty +3
- **Trust:** +14

---

### Beat 5 — Day 46 — The War Chest

**Character:** Treasurer Borvin
**Note:** Church tithe war may be active. Northern trust affects whether princes offer loan or embargo.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ingvar's treaty still smells of your day-twenty-seven choice — tribute paid, border held, or insult banked. The princes offer a loan for forts on the Grey Pass, or an embargo if we arm further. I heard Malrik eats our tithe. The north eats our trade. Which wolf do we feed?

**Prompt variant (Allied trust):** Your Majesty, I heard the north calls you pragmatic. They offer gold at shameful interest — better than Rudolf's mutiny. Take the loan, build the wall, owe a friend.

**Prompt variant (Hostile):** Your Majesty, I heard the princes embargo grain on the northern road. Arm the pass and we starve. Disarm and we kneel. Choose your favorite humiliation.

**Choice 1:** Take the northern loan — owe the princes
- **Response:** Gold in the chest, rope around the crown. Standard diplomacy.
- **Effects:** Treasury +20, Succession -5, Army +5
- **Trust:** +10

**Choice 2:** Refuse foreign coin — crown pays its own forts
- **Response:** Honorable and slow. Rudolf approves. Ingvar smiles elsewhere.
- **Effects:** Treasury -15, Army +6, Loyalty +4
- **Trust:** −8

**Choice 3:** Let Selena finance the pass — private debt, public wall
- **Response:** Merchants own the battlements. For a time. Then they own the conversation.
- **Effects:** Treasury +8, Nobility -5
- **Trust:** +3

---

### Beat 6 — Day 57 — Agents from the North

**Character:** Spy Knox
**Note:** Espionage beat. Knox presents catch (or exposure) of northern scribes. Household callbacks if loyalists sheltered. [Captain Varn](#beat-3--day-16--old-swords-on-the-wall) no longer speaks in this arc.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, my nets caught northern agents in the lower city — not soldiers, scribes. I heard you sheltered Edwin's clerks or cut them; these men carry lists of who still mourns the old king. Ingvar calls them merchants. I call them a map of your enemies. Torture, trade, or return them with a message?

**Prompt variant (`householdShelteredConfessor`):** Your Majesty, I heard you sheltered Aldo while northern scribes map disloyalty. These agents and your ghosts rhyme. Return them and Ingvar learns your soft spots. Keep them and learn his.

**Choice 1:** Return them politely — gift to Ingvar
- **Response:** Courtesy with shackles. He will call it trust. I call it habit.
- **Effects:** Loyalty +3, Army -2
- **Trust:** +12

**Choice 2:** Interrogate — learn northern intentions
- **Response:** Ink and screams. Useful mix. Ingvar will hear before sunset.
- **Effects:** Succession +6, Loyalty -5
- **Trust:** −18

**Choice 3:** Execute as spies — send heads to the pass
- **Response:** Then war speaks a dialect everyone understands.
- **Effects:** Army +6, Church -3
- **Trust:** −35
- **Sets:** `northernWarStage = tension` → `skirmish`

---

### Beat 7 — Day 66 — Alliance Charter

**Character:** Ambassador Ingvar
**Note:** Major trust branch. High trust = alliance offer; low = ultimatum.
**Nodes:** 1 (start node: 0)

#### Node 0 — Cordial / Allied trust

**Prompt:** Your Majesty, I heard you returned my agents — or questioned them — or hung them. The princes read your habit as clearly as I do. They offer a charter: mutual defence, shared tolls, your seal beside theirs on the Grey Pass. Sign, and the north calls you king in every market from here to winter.

**Choice 1:** Sign the alliance — share the pass
- **Response:** Then we are partners in more than ink. Rudolf grumbles. Malrik fumes. You breathe.
- **Effects:** Army +8, Treasury -10, Succession +10
- **Trust:** +25
- **Sets flag:** `northernAllianceSigned`

**Choice 2:** Sign trade only — no mutual defence
- **Response:** Half a friendship. Cheaper until the first raid.
- **Effects:** Treasury +5, Food +8
- **Trust:** +10

**Choice 3:** Refuse — Estedor stands alone
- **Response:** Alone is how usurpers often end. You chose it with eyes open.
- **Effects:** Army +5, Loyalty -4
- **Trust:** −20

#### Node 0 — Hostile / Wary trust

**Prompt:** Your Majesty, I heard you hung my scribes or starved my merchants. The princes do not offer alliance — they offer terms. Dismantle forts on the Grey Pass, pay twelve years of tribute, and they will not call you regicide in every hall from here to the sea.

**Choice 1:** Accept terms — buy survival
- **Response:** Then you are tributary, not king. Cheaper than graves — for now.
- **Effects:** Treasury -25, Army -8, Succession -8
- **Trust:** +15
- **Influences finale priority:** `vassal`

**Choice 2:** Reject — prepare for northern march
- **Response:** Then Rudolf earns his keep. Ingvar earns his commission. Winter earns its reputation.
- **Effects:** Army +12, Treasury -10
- **Trust:** −15
- **Sets:** `northernWarStage = mobilized`

**Choice 3:** Counter-offer Edwin's nephew — they keep the boy, you keep the pass
- **Response:** Dangerous trade. Succession for peace. Ashford will hear. So will history.
- **Effects:** Succession -10, Treasury -5
- **Trust:** +5

---

### Beat 8 — Day 78 — Skirmish at Grey Pass

**Character:** General Rudolf
**Note:** Military climax of early-mid arc. Trust and `northernWarStage` drive variants.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, blood at the Grey Pass — our men or theirs, depending who lies. I heard you signed Ingvar's charter — or spat on his terms. The north tests whether the usurper's army is real. Do I hold, pursue, or sue for parley while the snow still owns the heights?

**Prompt variant (`northernAllianceSigned`):** Your Majesty, I heard you allied with the princes. These skirmishers may be rogue companies — or a test. Hold fire until Ingvar answers, or answer with steel and lose a friend.

**Choice 1:** Pursue into the pass — strike before spring
- **Response:** Victory wins songs. Defeat wins northern sermons about regicide's price.
- **Effects:** Army -8, Treasury -12, Loyalty +5
- **Trust:** −20
- **Sets flag:** `northernWarDeclared`

**Choice 2:** Hold the line — no pursuit
- **Response:** Discipline before glory. The men will call it caution. The treasury will call it wisdom.
- **Effects:** Army +5, Food -6
- **Trust:** +5

**Choice 3:** Parley under white banner — let Ingvar speak
- **Response:** Then we bet words again. Cheaper if you still have credit with him.
- **Effects:** Loyalty +4, Army -3
- **Trust:** +10

---

### Beat 9 — Day 91 — Refugees at the Ford

**Character:** Ambassador Ingvar
**Note:** **People stat unlocked day 89** — first beat that may apply People directly. Refugee crisis.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, two thousand northern refugees crowd the ford — famine in the princes' hills, or a leash to embarrass you. I heard you allied with us — or declared us enemies. The commons already watch whether the usurper feeds strangers while Edwin's widows beg. Malrik offers baptisms. I offer politics.

**Prompt variant (Allied):** Your Majesty, I heard our charter holds. These are my people, not your enemies. Shelter them and the princes remember. Turn them away and I remember.

**Choice 1:** Shelter refugees — camps on crown land
- **Response:** Mercy with a bill. The People will see it — if they are allowed to look.
- **Effects:** People +12, Food -15, Treasury -10, Loyalty +6
- **Trust:** +15
- **Sets flag:** `northernRefugeesAccepted`

**Choice 2:** Turn them back — close the ford
- **Response:** Cold borders make clean arithmetic. Loud sermons follow.
- **Effects:** Army +4, People -10, Loyalty -8
- **Trust:** −18
- **Sets flag:** `northernRefugeesTurnedBack`

**Choice 3:** Let Arvel feed them — Church bears the cost
- **Response:** Then Malrik owns the miracle. You own the wall. Standard trade.
- **Effects:** Church +8, People +6, Food -8
- **Trust:** +5

---

### Beat 10 — Day 122 — Mid-Year Ultimatum

**Character:** Ambassador Ingvar
**Note:** Major branch on `northernTrust`. Grey Lung may be active — variant references physic trade.
**Nodes:** 1 (start node: 0)

#### Node 0 — Allied / Cordial

**Prompt:** Your Majesty, half the year gone. I heard you sheltered our refugees — or closed the ford. The princes ask whether Estedor is ally, market, or future province. Renew the charter, share Grey Lung physic if your wards still cough, or stand alone before winter returns.

**Choice 1:** Renew alliance — deepen the charter
- **Response:** Then your seal and ours share winter. Rudolf mutters. You endure.
- **Effects:** Army +6, Succession +8, Treasury -8
- **Trust:** +20

**Choice 2:** Offer plague formula — science for peace
- **Response:** Then we owe you breath. Dangerous debt. Better than siege.
- **Effects:** Health +5, People +5, Church -5
- **Trust:** +25

**Choice 3:** End alliance — friendly divorce
- **Response:** Then we are strangers who remember each other's ledgers. War becomes possible again.
- **Effects:** Army +4, Loyalty -3
- **Trust:** −25

#### Node 0 — Hostile / Wary

**Prompt:** Your Majesty, I heard your year has been steel and hunger. The princes will not renew courtesy. Withdraw from the Grey Pass by month's end, or northern hosts march when the roads thaw. I am not threatening you. I am translating winter.

**Choice 1:** Withdraw from the pass — strategic retreat
- **Response:** Then you gift them the heights. The court will call it peace. The barracks will call it something else.
- **Effects:** Army -10, Succession -6, Treasury +5
- **Trust:** +8

**Choice 2:** Refuse — war before thaw
- **Response:** Then Rudolf stops pretending diplomacy is a career.
- **Effects:** Army +15, Treasury -20, Food -10
- **Trust:** −30
- **Sets:** `northernWarStage = war`

**Choice 3:** Submit as vassal — tribute and hostages
- **Response:** You survive as a crowned administrator. History will be unkind. You will be alive.
- **Effects:** Treasury -30, Army -5, Succession -15
- **Sets outcome path:** `vassal`

---

### Beat 11 — Day 145 — Guns on the Northern Road

**Character:** Mercenary Kara
**Note:** Kara sells to both sides. Shared with [Empty Purse beat 6](#beat-6--day-47--steel-for-sale). Trust tier changes who she betrays. [Merchant Selena](#beat-7--day-49--loyalists-buy-grain) no longer speaks in this arc.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I heard Ingvar's ultimatum on day one-twenty-two — alliance, retreat, or war. Northern buyers want crossbows. Rudolf wants them first. I sell to whoever pays and remembers — I heard your purse on day forty-seven. Do you seize my caravan, match their price, or let steel flow north and hope it points away from you?

**Prompt variant (Allied):** Your Majesty, I heard the charter holds. Sell to the north and you arm friends. Sell only to Rudolf and you arm suspicion. I profit either way. You choose which risk is yours.

**Prompt variant (`emptyPurseKaraCrown`):** Your Majesty, I heard you hired me on the throne's tab. Rudolf wants exclusivity. Ingvar wants discretion. I want coin that does not bounce. Renew the contract or lose the wagons.

**Choice 1:** Crown monopoly — all arms through Rudolf
- **Response:** Then the army is fed and Kara is angry. A familiar balance.
- **Effects:** Army +10, Treasury -12, Loyalty -3
- **Trust:** −10

**Choice 2:** Free trade — Kara sells to both
- **Response:** Gold flows. Loyalties blur. War gets cheaper for everyone.
- **Effects:** Treasury +15, Army -5
- **Trust:** +5 north; Rudolf loyalty −5

**Choice 3:** Sell only to the north — buy alliance in steel
- **Response:** Then Rudolf calls it treason. Ingvar calls it friendship. You call it Tuesday.
- **Effects:** Army -8, Treasury +8
- **Trust:** +18

---

### Beat 12 — Day 172 — Houses Measure Your Wars

**Character:** Old Advisor Edric
**Note:** **Three days before Nobility unlock (day 175) and Lady Ashford.** Great houses watch foreign policy.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, in three days the great houses stop watching from their estates and start measuring your throat. I heard you allied with the north, or angered it, or fed its refugees while your own provinces hunger. Ashford will ask whether you can win a war abroad and a ledger at home. Before she arrives — do you seek noble levies for the pass, or keep this a crown war the houses can ignore?

**Choice 1:** Summon noble levies — bind houses to your war
- **Response:** Then they bleed with you — or plot while you bleed. Ashford will note who came.
- **Effects:** Army +12, Nobility -8, Succession +5
- **Sets flag:** `northernAshfordLinked`

**Choice 2:** Keep war a crown matter — do not involve houses yet
- **Response:** Privacy preserves options. It also preserves their knives until later.
- **Effects:** Nobility +5, Army -3

**Choice 3:** Marry war to peace — offer houses northern trade shares
- **Response:** Ledger diplomacy. Ashford respects ledgers. Whether she respects you remains her hobby.
- **Effects:** Treasury -8, Nobility +8, Loyalty +4
- **Trust:** +8

---

### Beat 13 — Day 196 — Mobilize or Bluff

**Character:** General Rudolf
**Note:** Nobility era. `northernWarStage` and trust drive war/peace.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, northern hosts gather beyond the pass — or so my scouts swear. I heard the great houses offer levies — or withhold them. Ingvar says it is training. I say it is a clock. Mobilize fully and empty the treasury. Bluff with parades and hope. Or strike first and dare the north to answer before Ashford's couriers spread the tale.

**Choice 1:** Full mobilization — war footing
- **Response:** Then every coin feeds steel until steel feeds us back or buries us.
- **Effects:** Army +18, Treasury -25, Food -12, Loyalty +5
- **Sets:** `northernWarStage = war`

**Choice 2:** Parade bluff — look strong, stay hollow
- **Response:** Theater with drums. Cheaper until someone calls the bluff with cavalry.
- **Effects:** Army +5, Treasury -8, Loyalty -4

**Choice 3:** Pre-emptive strike — hit muster camps
- **Response:** Aggression as policy. Ingvar will call it banditry. History may call it survival.
- **Effects:** Army -10, Treasury -15, Succession +8
- **Trust:** −40
- **Sets flag:** `northernWarDeclared`

---

### Beat 14 — Day 252 — Loyalties for Sale

**Character:** Ambassador Ingvar
**Note:** **Eight days before Loyalty unlock (day 260).** Court betrayal + northern gold.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, in eight days your court's loyalty becomes a counted thing. I heard whispers that my princes already priced several of your advisors. I am not here to confess — I am here to bid. Match northern gold, expose the buyers, or let the market decide who owns your tomorrow.

**Prompt variant (Hostile + war):** Your Majesty, war makes traitors cheap. I heard your chancellor listens when we speak. Surrender the pass and I deliver loyalty. Refuse and I sell to whoever wins the knife fight.

**Choice 1:** Pay crown gold — outbid the north
- **Response:** Expensive throne. Still a throne — if the payments hold.
- **Effects:** Treasury -22, Loyalty +12
- **Trust:** −5

**Choice 2:** Expose northern bribes — public trial
- **Response:** Scandal as hygiene. Someone swings. Someone talks. The court learns fear.
- **Effects:** Loyalty +8, Army +5, Nobility -6
- **Trust:** −15

**Choice 3:** Secret deal — sell minor secrets for truce
- **Response:** Then you are merchant and monarch both. Edric would call it familiar. He would not call it wise.
- **Effects:** Treasury +10, Loyalty -15, Succession -8
- **Trust:** +20

---

### Beat 15 — Day 278 — Leaks to the North

**Character:** Spy Knox
**Note:** Loyalty era (unlock day 260 passed). Knox confesses or exposes guard who sold maps. Callback [Empty Purse](#the-empty-purse-persistent-story) unpaid guard.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, palace guard sold patrol maps to northern buyers — I heard Ingvar's gold on day two-fifty-two land in familiar pockets. I also heard you starved the barracks on day sixty-five. Loyalty is arithmetic. Purge the guard, feed them better, or feed Ingvar a lie and hope he buys it.

**Prompt variant (`emptyPurseOutcome` = `ghost_army` or `mercenary_throne`):** Your Majesty, I heard you chose mercenaries or honor over pay. Maps leaked because oaths leaked first. Hang thieves, pay soldiers, or hire me to lie better.

**Prompt variant (`prophetKnoxNamed`):** Your Majesty, I heard the Nameless Prophet named me in the square before you did. The mob already knows my price. Hang me for theatre, or hire me for truth — Ingvar pays better when you hesitate.

**Choice 1:** Purge the guard — new oaths, new men
- **Response:** Steel solves loyalty until it becomes the next problem.
- **Effects:** Army +6, Loyalty -8, Treasury -10

**Choice 2:** Double pay and investigation — find the buyers
- **Response:** Gold and gallows. Traditional pairing.
- **Effects:** Treasury -15, Loyalty +10, Army +4

**Choice 3:** Feed Ingvar false maps — counter-intelligence
- **Response:** Clever. If he believes you, the pass is yours for a month. If not, you armed him twice.
- **Effects:** Loyalty +5, Army +3
- **Trust:** −10 or +10 (counter-intelligence roll)

---

### Beat 16 — Day 350 — The Year's Ledger

**Character:** Ambassador Ingvar
**Note:** **After Succession unlock (day 320).** Arc finale. **On load:** run [day 350 outcome priority](#northern-price--beat-resolution-rules) → `northernOutcome`, `northernArcPhase = resolved`. Ingvar **reports** how the northern princes name your year — player does not pick the ending.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `ally`):** Your Majesty, three hundred and fifty days since a blade gave you a crown the north did not grant. I heard tribute refused, charter signed, refugees housed, maps guarded. The princes end the year calling you ally — not friend, not vassal, but the usurper worth binding. Your heirs and ours will argue together. Better than arguing alone.

**Prompt (outcome `cold_peace`):** Your Majesty, I heard every choice — trade where oaths failed, courtesy where war tempted. The princes offer no alliance and no war. Estedor ends the year independent and watched. Partners who do not trust partners. Common in thrones.

**Prompt (outcome `tributary`):** Your Majesty, I heard coin crossing the pass more often than steel. Tribute bought seasons. The princes call you solvent, not sovereign. You keep the throne as a rented chair. Humiliating. Durable, sometimes.

**Prompt (outcome `victor`):** Your Majesty, I heard mobilization, raids, and timing over honor. You chose steel when winter closed. The pass is yours — for now. Rudolf approves. I mourn. War returns as habit if you sleep.

**Prompt (outcome `broken`):** Your Majesty, I heard lies, hangings, bankrupt maps, and spring avoided once too often. The princes offer no friendship. The realm is cracked — by war, by abdication of quarrel, or by trust spent. You end the year smaller than you began it.

**Prompt (outcome `vassal`):** Your Majesty, I heard the ultimatum on day one-twenty-two and your signature after. The pass is theirs. The regent's name travels south in ledgers. You keep a chair with a northern leash. Call it peace. Call it what you will.

**Choice 1:** I have heard the princes — dismiss the envoy
- **Response (outcome `ally`):** Then may your heirs argue with mine in ledgers, not pass graves.
- **Effects (outcome `ally`):** Succession +15, Army +8, Treasury -10
- **Response (outcome `cold_peace`):** Then trade without oaths. Winter respects neither.
- **Effects (outcome `cold_peace`):** Treasury +10, Loyalty +5
- **Response (outcome `tributary`):** Then pay on schedule. Creditors remember lapses.
- **Effects (outcome `tributary`):** Treasury -15, Army -5, Succession -8
- **Response (outcome `victor`):** Then hold the pass with steel. Spring will test the bill.
- **Effects (outcome `victor`):** Army +12, Succession -10, Treasury +15
- **Response (outcome `broken`):** Then rebuild what you broke — or outlive the name *broken*.
- **Effects (outcome `broken`):** Succession -15, Loyalty -10, Army -8
- **Response (outcome `vassal`):** Then bow on schedule. Chairs with leashes still seat kings.
- **Effects (outcome `vassal`):** Treasury -20, Army -10, Succession -12

---

## The Great Houses (persistent story)

**Defeat lane:** Nobility — *"The great houses do not kneel to a brigand with empty promises."*  
**Span:** days **158–218**, **16 beats**. Extends — does **not** replace — [Lady Ashford's Nobility unlock (day 175)](#lady-ashford-debut-nobility-unlock). Rival houses feud with each other and with the crown; **you choose who lives and who dies** in the trial and night-beats. Callbacks [Northern](#the-northern-price-persistent-story) (day 172 prelude), [Prophet's Winter](#the-prophets-winter-wildcard--cross-arc) (day 187 deferred).

**Factions (internal conflict):**

| House | Speaker | Wants | Hates |
|-------|---------|-------|-------|
| **Ashford** | Lady Ashford | Privy council, nephew silenced, eastern supremacy | Dell-Crow compact, Raymond's mob |
| **Vayne** | Lord Kaspar Vayne | Eastern second seat, war levies | Ashford monopoly, Dell's forged dowry |
| **Dell** | Countess Marianna Dell | Marriage alliance, treasury access | Crow's higher bid, Ashford condescension |
| **Crow** | Baroness Yvette Crow | Outbid Dell, joint regency | Dell's "legitimate" claim, Kaspar's spies |
| **Landless** | Lord Raymond | Land from crown or houses | All landed peers |
| **Goose** | Duke the Goose | Absurd crown claim (hides real genealogy) | Anyone who laughs first |

**Per-house favor (runtime, hidden):** `housesFavorAshford`, `housesFavorKaspar`, `housesFavorDell`, `housesFavorCrow`, `housesFavorRaymond`, `housesFavorGoose` (−100…+100 each, start **0**)

**Alive flags (runtime):** `housesAliveAshford`, `housesAliveKaspar`, `housesAliveDell`, `housesAliveCrow`, `housesAliveRaymond`, `housesAliveGoose` (all **true** at day 158; set **false** on death)

**Arc state:** `housesArcPhase` (active / resolved), `housesCrownStance` (conciliate / divide / terror / marriage), flags (`housesAshfordCouncil`, `housesAshfordMarriage`, `housesAshfordHostile`, `housesAshfordLevy`, `housesDellCrowCompact`, `housesKasparLevy`, `housesRaymondMarch`, `housesGooseTournament`, `housesTrialHeld`, `housesNightOfKnives`), `housesDeadCount` (0–6), `housesOutcome` (none / ashford_ascendant / crow_dell_compact / landless_fury / comic_horror / shattered_peerage / bloodless_ledger)

**Beat schedule (no overlap with Northern 145/172/196, Grey Lung 200, Prophet 187):**

| Day | Character | Beat |
|-----|-----------|------|
| 158 | Lord Kaspar Vayne | Eastern watchers |
| 161 | Countess Marianna Dell | The dowry ledger |
| 164 | Baroness Yvette Crow | The higher bid |
| 168 | Lord Raymond the Landless | No land, much anger |
| 174 | Old Advisor Edric | Before the march |
| 175 | Lady Ashford | Nobility unlock (Ashford debut) |
| 178 | Lord Kaspar Vayne | Forgery accusation |
| 181 | Duke the Goose | The absurd claimant |
| 185 | Lady Ashford | Council fracture |
| 188 | Countess Dell & Baroness Crow | Feast of insults |
| 191 | Lord Raymond the Landless | The march |
| 199 | Lord Kaspar Vayne | Levies refused |
| 201 | Executioner Morwen | The sentence |
| 205 | Spy Knox | Night of knives |
| 210 | Chronicler Ilana | Who bowed, who bled |
| 218 | Old Advisor Edric | Verdict on the houses |

**Possible endings (day 218):** Ashford Ascendant · Crow-Dell Compact · Landless Fury · Comic Horror · Shattered Peerage · Bloodless Ledger

### Great Houses — beat resolution rules

**Death rules:** Only beats **13 (day 201)** and **14 (day 205)** may set `housesAlive*` to false. Beat 13: player **must** choose exactly **one** execution or formal acquittal of all (`housesTrialHeld`). Beat 14: zero to **two** additional deaths depending on choices and who is already dead. **Ashford can die** on night 205 if `housesAshfordHostile` and player allows assassination. **Goose** can die comically at trial or survive as joke-victor. Implementation: on death, skip future beats for that speaker (variant prompts reference *"I heard {name} fell"*).

**Day 175:** Runs [Lady Ashford Debut](#lady-ashford-debut-nobility-unlock) encounter unchanged; arc adds `housesCrownStance` + favor shifts on existing choices (see beat 6).

**Day 218 outcome priority:** Ashford alive + ≥3 rivals dead → **ashford_ascendant** · Dell + Crow alive, Ashford dead → **crow_dell_compact** · Raymond alive + ≥2 landed dead → **landless_fury** · Goose alive + ≥4 others dead → **comic_horror** · `housesDeadCount` ≥ 4 → **shattered_peerage** · all alive → **bloodless_ledger** · else faction with highest combined favor among survivors.

**Nobility stat:** Unlocks day 175 on beat 6 — Nobility effects apply from beat 6 onward.

---

### Beat 1 — Day 158 — Eastern Watchers

**Character:** Lord Kaspar Vayne
**Note:** Opens arc. Pre-Nobility unlock. Kaspar positions against Ashford before she arrives. Callback [Northern](#beat-12--day-172--houses-measure-your-wars) foreign policy if `northernAshfordLinked`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Lady Ashford rides from the eastern marches in seventeen days. I ride from the east beside her — not beneath. I heard you bled for this throne without our swords. Fair. Neither did we kneel. Will you seat one eastern house and call it peace, or seat two and call it balance?

**Prompt variant (`northernAllianceSigned`):** Your Majesty, I heard you allied with northern princes before you seated a single great house. Ashford will call that foreign policy. I call it leverage — if you seat me before she arrives.

**Choice 1:** Promise Kaspar equal standing with Ashford
- **Response:** Then I will remember you when she tries to own the privy council. Eastern levies may follow — if coin follows first.
- **Effects:** Nobility +5, Succession +4, Treasury -5
- **Favor (Kaspar):** +20
- **Favor (Ashford):** −10

**Choice 2:** Ashford leads the east — Kaspar serves or sulks
- **Response:** Sulking is cheaper than war. For now. I will find other allies — Dell, Crow, or your gallows.
- **Effects:** Army +3, Nobility -3
- **Favor (Kaspar):** −15

**Choice 3:** Play them against each other — no promises
- **Response:** Honest cynicism. I respect it. They will not. Expect poison in the hospitality.
- **Effects:** Loyalty +4, Succession +6
- **Sets stance:** `divide`

---

### Beat 2 — Day 161 — The Dowry Ledger

**Character:** Countess Marianna Dell
**Note:** Marriage alliance offer rivals Ashford. Crow beat 3 will outbid.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ashford offers condescension and a nephew's noose. I offer coin, cousins, and a marriage bed that could make the realm forget a blade put you here. My dowry is real — unlike certain eastern ledgers I could name. Do you open treasury doors to Dell, or wait for Ashford's permission?

**Choice 1:** Accept Dell's marriage terms in principle
- **Response:** Then my couriers ride before Ashford's banners crest the hill. Love is politics at speed.
- **Effects:** Treasury +10, Nobility +8, Succession +10
- **Favor (Dell):** +25
- **Favor (Ashford):** −12
- **Sets flag:** `housesDellOffer`

**Choice 2:** Reject — no marriage markets on my throne
- **Response:** Then I sell my cousins to Crow instead of you. Do not act surprised when the bidding starts.
- **Effects:** Nobility -5, Loyalty +3
- **Favor (Dell):** −10
- **Favor (Crow):** +8

**Choice 3:** Demand proof of dowry — audit before vows
- **Response:** Wise. Insulting. Kaspar will forge something regardless. I will bring receipts — and guards.
- **Effects:** Treasury +5, Succession +5
- **Favor (Dell):** +5
- **Sets stance:** `conciliate`

---

### Beat 3 — Day 164 — The Higher Bid

**Character:** Baroness Yvette Crow
**Note:** Direct rival to Dell. Establishes Dell-Crow compact path.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I heard Dell offered you marriage and arithmetic. I offer more arithmetic. Double the dowry, half the sermons, and no Ashford on the privy council. Marry Crow, and the southern roads fund your throne. Marry Dell, and you marry her debt.

**Prompt variant (`housesDellOffer`):** Your Majesty, I heard you entertained Dell's bed. I am here to entertain your ambition. She counts sheep. I count regiments.

**Choice 1:** Favor Crow's bid — invite formal negotiations
- **Response:** Then Dell will call me thief. She is not wrong. She is also not louder than my coin.
- **Effects:** Treasury +12, Nobility +6, Army +4
- **Favor (Crow):** +25
- **Favor (Dell):** −20

**Choice 2:** Force Dell and Crow to share terms — joint compact
- **Response:** Shared? We will smile in public and cut in linen. Useful for you. Expensive for someone.
- **Effects:** Nobility +4, Succession +8, Loyalty -4
- **Favor (Dell):** +10
- **Favor (Crow):** +10
- **Sets flag:** `housesDellCrowCompact`

**Choice 3:** Reject both — nobility is not a market
- **Response:** Everything is a market. You are merely bad at haggling. Watch what Ashford prices you at.
- **Effects:** Nobility -8, Loyalty +5
- **Favor (Crow):** −12
- **Favor (Dell):** −8

---

### Beat 4 — Day 168 — No Land, Much Anger

**Character:** Lord Raymond the Landless
**Note:** Landless faction threatens all houses. Sets march flag path.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ashford, Kaspar, Dell, and Crow measure your throat in velvet. I measure it in men who own nothing but hunger. I heard you paid soldiers before you paid truth. Give the landless titles from seized estates, or we take fields while lords debate dowries.

**Choice 1:** Promise Raymond crown lands from Edwin's loyalists
- **Response:** Then lords will scream theft. I will scream hunger. You will scream order. One of us will be heard.
- **Effects:** Nobility -10, Loyalty +8, Army +5
- **Favor (Raymond):** +20
- **Sets flag:** `housesRaymondPromised`

**Choice 2:** Refuse — landless men are not a house
- **Response:** Then we are a storm. Storms do not need titles. Remember I warned you before the march.
- **Effects:** Nobility +5, Loyalty -6
- **Favor (Raymond):** −25
- **Sets flag:** `housesRaymondMarch` (early)

**Choice 3:** Use Raymond against the great houses — crown-backed pressure
- **Response:** Dangerous hire. I will march where you point — until I point somewhere you dislike.
- **Effects:** Succession +6, Nobility -5, Loyalty -3
- **Favor (Raymond):** +12
- **Sets stance:** `terror`

---

### Beat 5 — Day 174 — Before the March

**Character:** Old Advisor Edric
**Note:** Three days before Nobility unlock. Distinct from [Northern day 172](#beat-12--day-172--houses-measure-your-wars) — domestic houses, not foreign war.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, in three days Lady Ashford enters your hall and nobility becomes a meter the realm can read. I heard Kaspar watch the east, Dell and Crow bid for your bed, and Raymond gather men with nothing to lose. You can arrive divided, married, or armed. You cannot arrive surprised.

**Prompt variant (`housesDellCrowCompact`):** Your Majesty, I heard you let Dell and Crow share a compact. Ashford will call that encirclement. She is not wrong.

**Choice 1:** Prepare conciliation — feast all houses before Ashford speaks
- **Response:** Feasts buy time. Time buys options. Do not confuse either with safety.
- **Effects:** Treasury -10, Nobility +5, Loyalty +4
- **Sets stance:** `conciliate`

**Choice 2:** Prepare division — seat Kaspar opposite Ashford at the table
- **Response:** Then steel hides behind napkins. Efficient — if you control the cutlery.
- **Effects:** Army +4, Nobility -3, Succession +5
- **Sets stance:** `divide`

**Choice 3:** Prepare terror — Morwen visible, guards doubled
- **Response:** Fear opens councils and closes throats. Ashford will notice. So will history.
- **Effects:** Army +6, Nobility -8, Loyalty -5
- **Sets stance:** `terror`

---

### Beat 6 — Day 175 — Nobility Unlock (Ashford Debut)

**Character:** Lady Ashford
**Note:** **Does not replace** [Lady Ashford Debut](#lady-ashford-debut-nobility-unlock) — same four-node encounter fires on Nobility unlock. Arc layer: each choice also adjusts `housesFavor*` and sets `housesAshfordCouncil`, `housesAshfordMarriage`, or `housesAshfordHostile` per table below. If `housesAliveAshford = false` later, this beat is skipped (edge case: only if death rules bug; Ashford cannot die before day 175).

**Arc flags on debut choices (additive to existing effects):**

| Debut choice | Arc flag / favor |
|--------------|------------------|
| Grant privy council | `housesAshfordCouncil`, Ashford +25, Kaspar −15 |
| Marriage alliance | `housesAshfordMarriage`, Ashford +20, Dell −20, Crow −20 |
| Bow or be broken | `housesAshfordHostile`, Ashford −30, Raymond +10 |
| Need time | no flag, all favors −5 |

**Nodes:** 4 (start node: 0) — see [Lady Ashford Debut](#lady-ashford-debut-nobility-unlock) for full text.

---

### Beat 7 — Day 178 — Forgery Accusation

**Character:** Lord Kaspar Vayne
**Note:** Kaspar accuses Dell; internal east/south feud. Skip if `housesAliveKaspar = false`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Countess Dell's dowry receipts are eastern forgeries — or Ashford forgeries meant to look like mine. I heard you promised someone marriage, someone balance, someone terror. I accuse Dell before she accuses me. Do you judge, defer, or let us duel without you?

**Prompt variant (`housesAshfordCouncil`):** Your Majesty, I heard you seated Ashford. She smiles while Dell forges eastern seals. Seat me on the council you promised, or watch forgery become policy.

**Choice 1:** Side with Kaspar — seize Dell's ledgers for audit
- **Response:** Then Dell screams theft. Crow will whisper alliance. Ashford will call it weak kingship. Enjoy the noise.
- **Effects:** Nobility -6, Succession +8, Treasury +8
- **Favor (Kaspar):** +15
- **Favor (Dell):** −25

**Choice 2:** Side with Dell — expel Kaspar from the capital for slander
- **Response:** Exile is a kind of death. He may return with armies if you are not careful.
- **Effects:** Nobility -8, Army -4, Loyalty +4
- **Favor (Dell):** +15
- **Favor (Kaspar):** −30

**Choice 3:** Defer judgment — let houses fight in your hall tonight
- **Response:** Then blood on marble before supper ends. At least you will learn who wants you alive.
- **Effects:** Loyalty -5, Succession +6
- **Sets flag:** `housesFeudEscalated`

---

### Beat 8 — Day 181 — The Absurd Claimant

**Character:** Duke the Goose
**Note:** Comic beat; genealogy threat is real. Goose can die later at trial.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Duke the Goose — by baptism, by theatre, and by a genealogy my fool swears is truer than yours. I heard great houses measure your throat. I measure your funny bone. Support my claim and the commons love you. Hang me and the commons still love me — from a distance.

**Prompt variant (`housesRaymondMarch`):** Your Majesty, I heard landless men march. I march differently — waddling, but with purpose. Crown the goose and Raymond looks less ridiculous. Useful.

**Choice 1:** Patronize the claim — court jester with a title
- **Response:** Honk and politics. Ashford will gag. The people will cheer. I accept your danger.
- **Effects:** Loyalty +10, Nobility -12, Succession -5
- **Favor (Goose):** +30

**Choice 2:** Arrest the fool — no absurd claims on my succession
- **Response:** Then the cells learn comedy. My supporters learn knives. Choose which worries you more.
- **Effects:** Nobility +6, Loyalty -8
- **Favor (Goose):** −20

**Choice 3:** Tournament proof — beat Goose publicly, end the claim
- **Response:** Steel versus poultry. I accept. Bring your best knight — or your worst, for the story.
- **Effects:** Army +4, Loyalty +6
- **Sets flag:** `housesGooseTournament`

---

### Beat 9 — Day 185 — Council Fracture

**Character:** Lady Ashford
**Note:** Skip if `housesAliveAshford = false`. Internal Ashford vs Kaspar vs Dell-Crow. **Day 185:** Prophet's Winter beat 4 defers to day 187.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, your privy council is a cage of eastern tigers — and one goose outside the bars. I heard Kaspar accuse Dell, Crow outbid Dell, and Raymond gather landless steel. I will not share a council with Kaspar unless you mean to split the east. Choose who sits, who stands, who leaves in chains.

**Prompt variant (`housesDellCrowCompact`):** Your Majesty, I heard Dell and Crow share terms. I call that a southern noose around my house. Cut it, or wear it.

**Prompt variant (`housesAshfordHostile`):** Your Majesty, you threatened to break nobility on day one-seventy-five. I am still here. Are you still brave?

**Choice 1:** Ashford leads council — Kaspar excluded
- **Response:** Then eastern levies die with Kaspar's patience. He will blame you — correctly.
- **Effects:** Nobility +10, Army -6, Succession +5
- **Favor (Ashford):** +20
- **Favor (Kaspar):** −35

**Choice 2:** Dual eastern seats — Ashford and Kaspar both
- **Response:** Shared power. Shared knives. I will smile until one of us stops.
- **Effects:** Nobility +5, Treasury -8, Army +4
- **Favor (Ashford):** +8
- **Favor (Kaspar):** +8

**Choice 3:** Exclude Ashford — crown rules through Dell-Crow compact
- **Response:** Then you declare war on my house in all but name. I will answer in all but mercy.
- **Effects:** Nobility -12, Treasury +10, Succession -8
- **Favor (Ashford):** −40
- **Favor (Dell):** +15
- **Favor (Crow):** +15

---

### Beat 10 — Day 188 — Feast of Insults

**Character:** Countess Marianna Dell
**Note:** Dell speaks; Crow interjects in variants. Mutual destruction path. Skip if both dead — if only one alive, variant solo speaker.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Baroness Crow told the hall my dowry was pig iron and my cousins were pig farmers. I heard you laughed — or did not stop her. I demand satisfaction: public apology, private divorce from this politics, or a duel by proxy before the realm chooses a side.

**Prompt variant (`housesAliveCrow` + compact):** Your Majesty, Crow sits beside me smiling and poisons my cup in whispers. I heard you needed a compact. I need a crown that enforces peace — or admits war.

**Choice 1:** Force Crow to apologize — humiliate south
- **Response:** Then Crow is enemy. Dell is not friend. You have two fewer allies and one fewer problem — for a week.
- **Effects:** Nobility -8, Loyalty +4
- **Favor (Dell):** +12
- **Favor (Crow):** −30

**Choice 2:** Force Dell to yield bid — Crow wins the marriage track
- **Response:** Dell will remember. Crow will collect. You bought quiet at someone's expense.
- **Effects:** Treasury +8, Nobility +4, Succession +6
- **Favor (Crow):** +18
- **Favor (Dell):** −35

**Choice 3:** Let them duel by proxy — knights at dawn
- **Response:** Then blood before breakfast. The victor claims your favor. The loser claims a grudge.
- **Effects:** Army -4, Loyalty +6, Succession +4
- **Sets flag:** `housesProxyDuel` (random knight death — implementation: favor shift only)

---

### Beat 11 — Day 191 — The March

**Character:** Lord Raymond the Landless
**Note:** Skip if `housesAliveRaymond = false`. Landless vs landed climax before trial.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, three hundred men without fields camp on Ashford's border — or Dell's — or yours, depending who you angered least. I heard great houses feud while commons starve. I march tomorrow unless you grant titles now, hang a lord for sport, or send Ashford's knights to stop me.

**Prompt variant (`housesRaymondPromised`):** Your Majesty, I heard you promised crown lands. Promises without deeds are how usurpers end. March with me or against me.

**Choice 1:** Hang a small lord's title — give Raymond seized loyalist estates
- **Response:** Then nobility screams. Raymond kneels — today. You have bought a dangerous friend.
- **Effects:** Nobility -15, Loyalty +10, Army +8
- **Favor (Raymond):** +25
- **Favor (Ashford):** −15

**Choice 2:** Send Ashford's knights to crush the march
- **Response:** Steel on peasants. Ashford gains glory. You gain guilt. Raymond gains martyrs.
- **Effects:** Army +6, Nobility +5, Loyalty -12
- **Favor (Raymond):** −20
- **Favor (Ashford):** +10
- **Sets flag:** `housesRaymondMarch`

**Choice 3:** Let houses fight Raymond themselves — crown watches
- **Response:** Then I war on all of them. Chaos is also a policy. You chose spectator.
- **Effects:** Loyalty -8, Succession +8, Food -8
- **Favor (Raymond):** +5
- **Sets flag:** `housesRaymondMarch`

---

### Beat 12 — Day 199 — Levies Refused

**Character:** Lord Kaspar Vayne
**Note:** Skip if dead. Kaspar vs Ashford on war tax; northern war context from day 196 beat (three days prior).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, northern smoke still rises — I heard Rudolf mobilize while you host feuds. Ashford refuses eastern levies unless she leads them. I refuse levies unless I am not her subordinate. Dell and Crow refuse unless marriage is signed. Raymond refuses unless land is deeded. Goose refuses unless bread is thrown. Levy the houses, or levy the scaffold.

**Choice 1:** Levy Ashford first — force her host
- **Response:** Then she marches with hatred and banners. Useful — if she returns.
- **Effects:** Army +10, Nobility -8, Treasury -8
- **Favor (Ashford):** −10
- **Sets flag:** `housesAshfordLevy` (Ashford path)

**Choice 2:** Levy Kaspar — humiliate Ashford
- **Response:** Then east splits openly. War may come from your own marches.
- **Effects:** Army +8, Nobility -10
- **Favor (Kaspar):** +10
- **Favor (Ashford):** −25
- **Sets flag:** `housesKasparLevy` (Kaspar path)

**Choice 3:** Levy no one — buy mercenaries instead
- **Response:** Then houses call you bankrupt and correct. Kara will love you. Rudolf will not.
- **Effects:** Treasury -15, Army +6, Nobility -5

---

### Beat 13 — Day 201 — The Sentence

**Character:** Executioner Morwen
**Note:** Player **must** choose exactly **one** execution or formal acquittal of all (`housesTrialHeld`). Callback [Scaffold's Ledger](#the-scaffolds-ledger-persistent-story) — if `scaffoldOutcome = bloody_peace` or `scaffoldMercy` ≤ −20`, Morwen's tone is harsher; if `mercy_crown`, she notes empty yard habit.
### Beat 14 — Day 205 — Night of Knives

**Character:** Spy Knox
**Note:** **Zero to two additional deaths** based on choices. Assassination attempts among houses. Player can allow, prevent, or redirect. Skip targets already dead.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, knives move tonight — Kaspar's on Dell, Crow's on Ashford, Ashford's on Raymond, Raymond's on everyone with a field. I heard who you hanged and who you spared. I can sell you the map, stop one blade, or let winter sort the peerage. Who dies in the dark is yours if you act — or theirs if you sleep.

**Prompt variant (`housesAshfordHostile`):** Your Majesty, Ashford's knife points at you unless you point first. Rare honesty.

**Choice 1:** Stop the attack on Ashford — save eastern order
- **Response:** Then someone else bleeds instead. I will tell you who — after.
- **Effects:** Nobility +8, Loyalty -4, Treasury -8
- **Favor (Ashford):** +20
- *(If redirect: random rival `housesAlive* = false` OR Dell/Crow — implementation: Crow −50% if compact)*

**Choice 2:** Allow Ashford's death — eastern throne empties
- **Response:** Then the east belongs to whoever survives dawn. You chose speed over mercy.
- **Effects:** Nobility -15, Succession +12, Army -8
- **Sets:** `housesAliveAshford = false`, `housesDeadCount += 1`
- **Requires:** `housesAliveAshford` at beat start

**Choice 3:** Stop Dell-Crow blood — save compact
- **Response:** Peace in the south for a price. Kaspar or Raymond pays it in the dark.
- **Effects:** Treasury +5, Nobility +4
- **Sets:** one of Kaspar/Raymond dead if alive (`housesDeadCount += 1`)

**Choice 4:** Let the knives fall — whoever dies, dies
- **Response:** Then I sell memoirs. You inherit a shorter council and longer nightmares.
- **Effects:** Loyalty -12, Succession +10
- **Sets:** up to **two** deaths among surviving rivals (implementation: lowest favor toward crown die first; never kill more than 2)

**Choice 5:** Knox takes the contract — you choose the target
- **Response:** Clean. Criminal. Yours. Name them and pay.
- **Effects:** Treasury -12, Loyalty -8, Succession +8
- **Player picks second target** (UI): any alive except Ashford if `housesAshfordCouncil` · sets that `housesAlive* = false`

---

### Beat 15 — Day 210 — Who Bowed, Who Bled

**Character:** Chronicler Ilana
**Note:** Reads survivor list aloud. Callback all deaths and favors. Sets tone before finale.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I write the first draft of your reign while blood dries. I heard Ashford {alive/dead}, Kaspar {alive/dead}, Dell {alive/dead}, Crow {alive/dead}, Raymond {alive/dead}, Goose {alive/dead}. The realm will copy my verbs into law. Do you want the chapter titled *Conciliation*, *Terror*, or *The Year Great Houses Learned Fear*?

*(Implementation: substitute alive/dead per flags.)*

**Choice 1:** Title it Conciliation — emphasize peace
- **Response:** Flattering. Fragile. I will write what you need — not what you earned.
- **Effects:** Nobility +6, Loyalty +5

**Choice 2:** Title it Terror — emphasize scaffold
- **Response:** Honest. Cruel. Future lords will read it before they plot.
- **Effects:** Army +4, Nobility -6, Succession +6

**Choice 3:** Bribe the chronicle — omit the worst night
- **Response:** Expensive fiction. Knox will sell the true chapter anyway.
- **Effects:** Treasury -15, Loyalty -8, Nobility +3

---

### Beat 16 — Day 218 — Verdict on the Houses

**Character:** Old Advisor Edric
**Note:** Arc finale. **On load:** run [day 218 outcome priority](#great-houses--beat-resolution-rules) → `housesOutcome`, `housesArcPhase = resolved`. Edric **reports** who survived and what the peerage believes — player does not pick the ending. Summarizes `housesDeadCount` and survivor list in prompt.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `ashford_ascendant`):** Your Majesty, sixty days since the great houses stopped watching and started cutting — and Lady Ashford stands above the rest. I heard {housesDeadCount} names ended. Ashford lives. Rivals do not. The privy council will be eastern, narrow, and grateful to steel. You built government by whichever hawk remained.

**Prompt (outcome `crow_dell_compact`):** Your Majesty, Ashford fell — or sleeps — and Dell and Crow share a compact the court calls indecent and efficient. I heard {housesDeadCount} graves. Marriage ledgers outlived blood feuds. You rule a shortened parliament bound by dowry and spite.

**Prompt (outcome `landless_fury`):** Your Majesty, Raymond still breathes and landed peers do not — or kneel. I heard {housesDeadCount} ended. The landless have a voice now, whether you granted it or they took it. Revolution in velvet. Survivors hate you. Commons may not.

**Prompt (outcome `comic_horror`):** Your Majesty, the Goose lives — absurd claimant, accidental victor — and the peerage is poultry and pulp. I heard {housesDeadCount} names ended. History will record tragedy wearing feathers. I will burn the draft and write *farce* instead.

**Prompt (outcome `shattered_peerage`):** Your Majesty, {housesDeadCount} lords ended. The peerage is a wound. You are either surgeon or infection. The throne stands alone above corpses. Lone wolf theology. Ashford warned you.

**Prompt (outcome `bloodless_ledger`):** Your Majesty, no scaffold claimed a lord — miraculous or temporary. I heard insults, levies, trials, and knives in alleys that missed throats. All six still bow in daylight. You ruled ledger and patience. Knives wait for year two.

**Choice 1:** I have heard the peerage — dismiss the houses
- **Response (outcome `ashford_ascendant`):** Then rule with Ashford's shadow on your shoulder. Efficient — if you like knives at your back.
- **Effects (outcome `ashford_ascendant`):** Nobility +12, Succession +10, Loyalty +4
- **Response (outcome `crow_dell_compact`):** Then marry policy to compact. Dell and Crow will bill you in favors.
- **Effects (outcome `crow_dell_compact`):** Nobility +8, Treasury +6, Loyalty +3
- **Response (outcome `landless_fury`):** Then hear Raymond in every petition. Landless men remember.
- **Effects (outcome `landless_fury`):** Loyalty +12, Nobility -15, People +10
- **Response (outcome `comic_horror`):** Then may the Goose outlive the chronicles. I doubt it.
- **Effects (outcome `comic_horror`):** Loyalty +15, Nobility -20, Succession -10
- **Response (outcome `shattered_peerage`):** Then rule corpses and caution. Spring brings new claimants.
- **Effects (outcome `shattered_peerage`):** Army +6, Nobility -10, Succession +5
- **Response (outcome `bloodless_ledger`):** Then patience bought a day. It will not buy a dynasty.
- **Effects (outcome `bloodless_ledger`):** Nobility +10, Succession +8, Loyalty +4

---

## The Scaffold's Ledger (persistent story)

**Defeat lanes:** Loyalty / Succession — *"A crown that cannot judge cannot command."*  
**Span:** days **92–183**, **9 beats** — opens day **92** (People unlock conflict owns day 90; Northern refugees day 91). Runs after [Household](#the-old-kings-household-persistent-story) day 86, through [Hungry Season](#the-hungry-season-persistent-story), [Grey Lung](#grey-lung-cure-arc-persistent-story), and ends before [Guild Compact](#the-guild-compact-persistent-story) day 184. **Executioner Morwen** owns the scaffold; **Talen** tests whether justice has a price. Callbacks [Church](#the-crown-forfeit--tithe-war-persistent-story) heretics, [Great Houses](#the-great-houses-persistent-story) trial (day 201 echoes this arc).

**Hidden stat (runtime, not shown in top bar):** `scaffoldMercy` (−100…+100, starts at **0**)

| Tier | Range | Realm tone |
|------|-------|------------|
| **Terror** | ≤ −35 | Mass hangings; fear in streets |
| **Harsh** | −34…−5 | Rope frequent; order prized |
| **Measured** | −4…+4 | Case-by-case scaffold |
| **Merciful** | +5…+34 | Amnesties; empty cells |
| **Empty rope** | ≥ +35 | Morwen idle; crown forgives |

**Arc state:** `scaffoldMercy`, `scaffoldArcPhase` (active / resolved), `scaffoldCrownStance` (terror / law / mercy / bargain), flags (`scaffoldCellsFull`, `scaffoldChurchHeretic`, `scaffoldRiotHangings`, `scaffoldWardMadness`, `scaffoldHousesEcho`, `scaffoldTalenBribe`, `scaffoldMassAmnesty`, `scaffoldAshfordBlock`), `scaffoldOutcome` (none / bloody_peace / mercy_crown / morwens_republic / selective_justice)

**Beat schedule (no overlap with Hungry 93/100/106/119, Grey Lung 130, Northern 91/122/145/172, Great Houses 158–218, Guild 184+):**

| Day | Character | Beat |
|-----|-----------|------|
| 92 | Executioner Morwen | Cells after the household |
| 104 | Executioner Morwen | Heaven wants heretics |
| 117 | Executioner Morwen | Rioters in the rope |
| 134 | Executioner Morwen | Ward madness |
| 148 | Executioner Morwen | Echo before the houses |
| 154 | Executioner Morwen | Who swings before Ashford |
| 165 | Talen | Bribe the executioner |
| 179 | Executioner Morwen | Mass amnesty or mass hanging |
| 183 | Old Advisor Edric | Verdict on mercy (finale) |

**Possible endings (day 183):** Bloody Peace · Mercy Crown · Morwen's Republic · Selective Justice

### Scaffold's Ledger — beat resolution rules

Every scheduled day shows one Scaffold beat while `scaffoldArcPhase = active`. Day **92** sets `scaffoldArcPhase = active`. Day 183 finale: compute `scaffoldOutcome` from priority on load, then show [notification beat](#beat-9--day-183--verdict-on-mercy).

**Day 183 outcome priority:** `scaffoldMercy` ≤ −35 + `scaffoldRiotHangings` or `scaffoldChurchHeretic` → **bloody_peace** · `scaffoldMercy` ≥ +35 + `scaffoldMassAmnesty` → **mercy_crown** · `scaffoldTalenBribe` + `scaffoldCrownStance = bargain` + mercy ≤ 0 → **morwens_republic** · `scaffoldCrownStance = law` + mercy between −10 and +25 → **selective_justice** · else **selective_justice** (fallback).

**People before day 89:** Beats 1–3 list People effects as **banked** on day 90+; substitute Loyalty before day 89 per beat **Note**.

**Cross-arc callbacks:** [Household](#the-old-kings-household-persistent-story) purge/ghost flags, [Hungry Season](#the-hungry-season-persistent-story) `hungryYarekRiots`, [Grey Lung](#grey-lung-cure-arc-persistent-story) `plagueOutcome` / scandal, [Great Houses](#the-great-houses-persistent-story) day 201 trial (`scaffoldHousesEcho` if scaffold terror high).

---

### Beat 1 — Day 92 — Cells After the Household

**Character:** Executioner Morwen
**Note:** Opens arc one day before [Northern day 91](#beat-9--day-91--refugees-at-the-ford). Post–[Household day 86](#beat-10--day-86--verdict-on-the-household). Sets `scaffoldArcPhase = active`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Morwen — the woman who turns policy into rope. Edwin's cells still hold men who swore to his ghost. I heard you cleansed the court, turned the household, or let whispers walk the halls. The lower dungeon breathes overcrowded. Hang the loyalists, sell amnesty for coin, or empty the cells and dare the realm to test you.

**Prompt variant (`householdOutcome = clean_court`):** Your Majesty, I heard you purged Edwin's people. My queue is long and your mercy short. Good — rope appreciates clarity.

**Prompt variant (`householdOutcome = haunted_palace`):** Your Majesty, I heard ghosts vote in whispers. Prisoners vote with fists. Both cost you sleep.

**Choice 1:** Hang ringleaders — mercy for the rest
- **Response:** Then fear learns your handwriting. The loyalists die. The frightened obey.
- **Effects:** Army +6, Loyalty -8, Succession +5
- **Mercy:** −15
- **Sets stance:** `terror`
- **Sets flag:** `scaffoldCellsFull`

**Choice 2:** Sell amnesty — coin for clemency
- **Response:** Justice as tariff. Borvin will call it crude. I call it employment.
- **Effects:** Treasury +15, Loyalty -4, Nobility -5
- **Mercy:** +5
- **Sets stance:** `bargain`

**Choice 3:** Empty the cells — dare the realm
- **Response:** Dangerous mercy. Men you free may love you — or stab you. I sharpen steel either way.
- **Effects:** Loyalty +10, Army -5, Succession -6
- **Mercy:** +20
- **Sets stance:** `mercy`

---

### Beat 2 — Day 104 — Heaven Wants Heretics

**Character:** Executioner Morwen
**Note:** Between Hungry Season beats (day 100 Gromm, day 106 Rudolf). [Church](#the-crown-forfeit--tithe-war-persistent-story) active. Cyrus may be referenced.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik sends names — schismatics, soup-preachers, men who call you forfeit in rhyme. I heard you knelt, defied, or fractured the Church. Heaven wants heretics. The crown wants traitors. My scaffold fits both if you widen it. Burn Church lists, hang crown lists, or hang everyone and let the mob sort scripture.

**Prompt variant (`churchArcStance = schism`):** Your Majesty, I heard Arvel's gate breeds sermons faster than I braid rope. Hang one side and the other calls you partisan. Hang both and the city calls you mad.

**Prompt variant (`scaffoldCellsFull`):** Your Majesty, I heard your cells still crowded from day ninety. Add heretics and the stench reaches the cathedral steps.

**Choice 1:** Hang Church's list — crown obeys heaven's rope
- **Response:** Then Malrik smiles and the streets whisper *puppet*. Efficient — if you like holy collars.
- **Effects:** Church +12, Loyalty -10, People -6
- **Mercy:** −20
- **Sets flag:** `scaffoldChurchHeretic`

**Choice 2:** Hang crown traitors only — refuse Church names
- **Response:** Then Malrik calls you secular tyrant. Soldiers call you consistent. I call it busy.
- **Effects:** Army +5, Church -8, Loyalty +4
- **Mercy:** −8
- **Sets stance:** `law`

**Choice 3:** Commute to fines — no scaffold this week
- **Response:** Gold instead of necks. Priests hate it. Merchants love it. I oil the hinges.
- **Effects:** Treasury +8, Church -4, Loyalty +6
- **Mercy:** +12

---

### Beat 3 — Day 117 — Rioters in the Rope

**Character:** Executioner Morwen
**Note:** Three days before [Hungry Season finale](#beat-12--day-119--verdict-on-hunger). Callback `hungryYarekRiots`, `famineSeverity`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Yarek's miners and Ruta's millers knocked on the granary with tools that were not for milling. I heard requisition, soup lines, or rotting stores. The hungry do not read statutes — they read empty bowls. Hang rioters to teach arithmetic, pardon them to teach mercy, or hang the captain who fired first and pardon the rest.

**Prompt variant (`famineSeverity` ≥ 60):** Your Majesty, severity outran policy. Rope may buy order. It will not buy grain.

**Prompt variant (`hungryYarekRiots`):** Your Majesty, I heard you already faced Yarek once. He returns with friends. My scaffold is a language. Speak it clearly.

**Choice 1:** Mass hanging — order before bread
- **Response:** Then the provinces learn fear. They may not learn loyalty. Both keep thrones — briefly.
- **Effects:** Army +8, People -12, Food -3
- **Mercy:** −25
- **Sets flag:** `scaffoldRiotHangings`

**Choice 2:** Hang officers, pardon miners — split the guilt
- **Response:** Surgical rope. The commons may call it justice. Officers call it betrayal. Both can be true.
- **Effects:** Loyalty +5, People +4, Army -4
- **Mercy:** +8
- **Sets stance:** `law`

**Choice 3:** Pardon all — feed them instead
- **Response:** Then Rudolf grumbles and Arvel prays. I idle. Rare and dangerous.
- **Effects:** Food -8, People +10, Loyalty +8
- **Mercy:** +18

---

### Beat 4 — Day 134 — Ward Madness

**Character:** Executioner Morwen
**Note:** Four days after [Grey Lung day 130](#beat-6--day-130--political-fallout-outcome-cured). Callback `plagueOutcome`, `plagueScandalFlag`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the fever wards sent me three men who woke screaming and never stopped. I heard Mira's bottles, Malrik's miracles, or Odo's cheaper brew. Madness is not treason — but treason is easier to explain to mobs. Hang the mad to quiet the square, lock them in Morwen's quiet cells, or fund Mira's care and call it crown mercy.

**Prompt variant (`plagueOutcome = scandal`):** Your Majesty, I heard Odo's compound broke minds. Families want necks. I have rope. You have reputation.

**Prompt variant (`plagueOutcome = failed`):** Your Majesty, pyres taught the city violence. Madness feels like continuation. Do not feed it without purpose.

**Choice 1:** Hang the mad — public calm
- **Response:** Cruel clarity. The square sleeps. The wards scream louder where no one listens.
- **Effects:** Health -5, Loyalty -8, Army +4
- **Mercy:** −22
- **Sets flag:** `scaffoldWardMadness`

**Choice 2:** Crown-funded asylums — Mira oversees
- **Response:** Expensive mercy. Mira will call it late. The families will call it something.
- **Effects:** Treasury -12, Health +8, Loyalty +6
- **Mercy:** +15

**Choice 3:** Morwen's private cells — no scaffold, no sermons
- **Response:** Quiet horror. Better than loud horror. The chronicles may still find out.
- **Effects:** Loyalty -4, Health +3, Succession +3
- **Mercy:** −5

---

### Beat 5 — Day 148 — Echo Before the Houses

**Character:** Executioner Morwen
**Note:** Between [Guild day 144](#beat-3--day-144--counterfeit-edwin-coin) and day 152. Foreshadows [Great Houses](#the-great-houses-persistent-story). Lords will soon demand rope for rivals.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, great houses send preliminary lists — names they want gone before they bow. I heard Ashford, Kaspar, Dell, and Crow in the same sentence as *treason*. Nobility unlock approaches on day one-seventy-five. Hang commoners now to warn peers, refuse all noble lists until Ashford rides, or sell expedited trials to the highest bidder.

**Prompt variant (`scaffoldRiotHangings` or `scaffoldChurchHeretic`):** Your Majesty, I heard your rope already busy. Lords want priority. Peasants want survival. You cannot please both without lying.

**Choice 1:** Refuse noble lists — rope serves crown law only
- **Response:** Then peers hate you early. You may hate them later. Fair trade.
- **Effects:** Nobility -6, Loyalty +8, Succession +4
- **Mercy:** +10
- **Sets flag:** `scaffoldAshfordBlock`

**Choice 2:** Hang two commoners as warning — peers wait
- **Response:** Theatre for the soon-to-arrive. Cruel. Effective. I am employed.
- **Effects:** Army +4, Loyalty -6, People -5
- **Mercy:** −12
- **Sets flag:** `scaffoldHousesEcho`

**Choice 3:** Sell expedited trials — Talen's friends arrive early
- **Response:** Commerce precedes the feast. Knox smiles somewhere. I sharpen steel.
- **Effects:** Treasury +12, Nobility -8, Loyalty -5
- **Mercy:** −8
- **Sets stance:** `bargain`

---

### Beat 6 — Day 154 — Who Swings Before Ashford

**Character:** Executioner Morwen
**Note:** Four days before [Great Houses day 158](#beat-1--day-158--eastern-watchers). Ashford debut day 175. Callback `scaffoldAshfordBlock`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Lady Ashford rides soon and she will measure your scaffold like a tailor measures spine. I heard you blocked noble lists, sold trials, or filled the yard with rioters and heretics. Hang a traitor from Edwin's guard to impress her, empty the yard to disarm her, or let her send the first name and see whether you obey.

**Prompt variant (`scaffoldAshfordBlock`):** Your Majesty, I heard you refused peer lists. Ashford will call it weakness until you prove otherwise.

**Prompt variant (`scaffoldMercy` ≥ 20):** Your Majesty, I heard mercy became habit. Ashford will test whether habit or fear owns you.

**Choice 1:** Hang Edwin's last captain — show Ashford steel
- **Response:** Then eastern eyes see rope. Western ghosts see warning. Both look at you.
- **Effects:** Army +6, Nobility +4, Loyalty -8
- **Mercy:** −15

**Choice 2:** Empty the yard — disarm her leverage
- **Response:** Bold mercy before nobility unlocks. She will call it bribery of conscience.
- **Effects:** Loyalty +10, Nobility -6, Succession +5
- **Mercy:** +15
- **Sets flag:** `scaffoldMassAmnesty` (partial)

**Choice 3:** Accept Ashford's first name — partnership in rope
- **Response:** Then you hang before she bows. Partnership — or submission. She will know which.
- **Effects:** Nobility +8, Loyalty -10, Succession +6
- **Mercy:** −10

---

### Beat 7 — Day 165 — Bribe the Executioner

**Character:** Talen
**Note:** Between Great Houses beats (day 164 Crow, day 168 Raymond). First **Talen** beat. Tests `scaffoldCrownStance`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Talen — I fix problems the scaffold cannot price. I heard Morwen's rope busy, Knox's ledgers louder, and Ashford's lists longer. For a chest of silver I can lose a noble's name before dawn. For a secret I can hang a commoner instead. For nothing I can tell the market which king you are. What do you buy?

**Prompt variant (`scaffoldCrownStance = bargain`):** Your Majesty, I heard you sold justice already. I am merely your renewal fee.

**Prompt variant (`scaffoldHousesEcho`):** Your Majesty, peers circle each other like wolves. I sell teeth.

**Choice 1:** Pay Talen — lose a noble's name from Morwen's list
- **Response:** Then one throat breathes who should not. You will forget which. I will not.
- **Effects:** Treasury -18, Nobility +6, Loyalty -8
- **Mercy:** +5
- **Sets flag:** `scaffoldTalenBribe`

**Choice 2:** Refuse and expose him — hang the fixer
- **Response:** Then I vanish before Morwen wakes. You gain sermon fodder and lose convenience.
- **Effects:** Loyalty +8, Army +3, Nobility -4
- **Mercy:** +10

**Choice 3:** Hire him for the crown — Morwen reports to Talen
- **Response:** Republic of rope. Morwen will hate me. You will love the quiet lists.
- **Effects:** Treasury -25, Loyalty -12, Succession -8
- **Mercy:** −5
- **Sets flag:** `scaffoldTalenBribe`
- **Sets stance:** `bargain` (strong)

---

### Beat 8 — Day 179 — Mass Amnesty or Mass Hanging

**Character:** Executioner Morwen
**Note:** Between [Great Houses day 178](#beat-7--day-178--forgery-accusation) and day 181 Goose. Post–[Northern day 172](#beat-12--day-172--houses-measure-your-wars) (no collision — northern 172, scaffold 179). Callback `housesDeadCount` if trial fired early... trial is day 201 — use `scaffoldHousesEcho` only.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the cells are full again — rioters, heretics, madmen, names Talen misplaced, names lords prepaid. I heard Great Houses sharpening knives for each other. Declare mass amnesty and empty my yard, declare mass hanging and teach the realm silence, or continue case by case while peers murder in alleys without me.

**Prompt variant (`scaffoldTalenBribe`):** Your Majesty, I heard Talen owns part of my list. Amnesty embarrasses him. Hanging embarrasses you. Choose who blushes.

**Prompt variant (`scaffoldMassAmnesty` partial):** Your Majesty, I heard you emptied the yard once before Ashford. Finish the habit or break it.

**Choice 1:** Mass amnesty — empty Morwen's yard
- **Response:** Then I oil unused hinges. The realm calls it weakness until it calls it wisdom.
- **Effects:** Loyalty +15, Army -6, People +8
- **Mercy:** +30
- **Sets flag:** `scaffoldMassAmnesty`

**Choice 2:** Mass hanging — forty in one dawn
- **Response:** Then birds avoid the square. Order arrives. Mercy leaves on horseback.
- **Effects:** Army +10, Loyalty -15, People -10, Church +4
- **Mercy:** −35

**Choice 3:** Case by case — I judge, Morwen obeys
- **Response:** The hardest throne. I will sleep less. You will sleep barely.
- **Effects:** Loyalty +5, Nobility +3, Succession +4
- **Mercy:** +5
- **Sets stance:** `law`

---

### Beat 9 — Day 183 — Verdict on Mercy

**Character:** Old Advisor Edric
**Note:** Arc finale. One day before [Guild day 184](#beat-8--day-184--mint-seizure). **On load:** run [day 183 outcome priority](#scaffolds-ledger--beat-resolution-rules) → `scaffoldOutcome`, `scaffoldArcPhase = resolved`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `bloody_peace`):** Your Majesty, ninety-three days since Morwen first counted Edwin's loyalists — and the realm knows you by rope. I heard heretics, rioters, madmen, and Talen's misplaced names. The square is quiet. The heart is not. You bought bloody peace. It holds — until it does not.

**Prompt (outcome `mercy_crown`):** Your Majesty, I heard amnesty more often than axe-strokes. Morwen's yard is empty enough to embarrass a tyrant. The commons call you merciful. The barracks call you soft. Both may be wrong. You rule a mercy crown.

**Prompt (outcome `morwens_republic`):** Your Majesty, I heard Talen price throats and Morwen hate her ledger. Justice became commerce without your face on the coin. Morwen's republic — rope sold by fixers. Efficient. Monstrous. Yours.

**Prompt (outcome `selective_justice`):** Your Majesty, no doctrine — only cases, bribes refused or paid, lists blocked or sold. Some hung, some walked. The realm calls it selective justice. I call it the hardest reign to defend — and the only one worth trying twice.

**Choice 1:** I have heard the scaffold — dismiss the yard
- **Response (outcome `bloody_peace`):** Then I write *rope* and hope fear outlasts resentment.
- **Effects (outcome `bloody_peace`):** Army +10, Loyalty -10, Succession +6
- **Response (outcome `mercy_crown`):** Then I write *mercy*. Ashford will test it soon enough.
- **Effects (outcome `mercy_crown`):** Loyalty +12, People +8, Army -5
- **Response (outcome `morwens_republic`):** Then I write *sold justice* and lock the ledger twice.
- **Effects (outcome `morwens_republic`):** Treasury +8, Loyalty -15, Nobility -8
- **Response (outcome `selective_justice`):** Then I write *judgment* without doctrine. May it survive the peers.
- **Effects (outcome `selective_justice`):** Loyalty +8, Succession +6, Nobility +3

---

## The Star Chamber (wildcard / cross-arc)

Sparse **wildcard** arc spanning days **105–318**. **Astrologer Meribald** reads comets and birth-charts while [Prophet's Winter](#the-prophets-winter-wildcard--cross-arc) reads riddles and street faith. Rival omens tug **Church vs People** via hidden `omenCredibility`. Not a single defeat lane — pressures **Health** (madness of signs) and **Succession** (heaven's ledger). Touches [Hungry Season](#the-hungry-season-persistent-story), [Great Houses](#the-great-houses-persistent-story), [Prophet](#the-prophets-winter-wildcard--cross-arc), [Northern](#the-northern-price-persistent-story) Knox leaks, and Succession unlock (320).

**Hidden stat (runtime, not shown in top bar):** `omenCredibility` (−100…+100, starts at **0**)

| Tier | Range | Who believes |
|------|-------|----------------|
| **Street faith** | ≤ −35 | People follow Prophet; Malrik pleased |
| **Doubt** | −34…−5 | Mixed sermons and star-charts |
| **Balanced** | −4…+4 | Court jokes about both |
| **Charted** | +5…+34 | Nobles consult Meribald |
| **Astrologer king** | ≥ +35 | Crown rules by omen |

*High Church stat favors Meribald at implementation (Malrik hates Prophet more); high People favors Prophet — encoded in beat choices as Church ± and People ±.*

**Arc state:** `omenCredibility`, `starArcPhase` (active / resolved), `starCrownStance` (embrace / regulate / suppress), flags (`starCometProclaimed`, `starAshfordMapped`, `starOmenClash`, `starSuccessionOmen`, `starKnoxStars`, `starSilenced`), `starOutcome` (none / astrologer_king / omen_wars / silenced_heavens)

**Beat schedule (sparse; day 212 is two-node — Meribald then Prophet; avoids Great Houses day 210):**

| Day | Character | Beat | Era |
|-----|-----------|------|-----|
| 105 | Astrologer Meribald | Comet confirms regicide | People era (unlock 89) |
| 155 | Astrologer Meribald | Ashford's house in the stars | Pre-Nobility |
| 212 | Meribald & Nameless Prophet | Two omens, one mob (2 nodes) | Great Houses era |
| 235 | Astrologer Meribald | Succession omen | Pre-Loyalty (260) |
| 280 | Astrologer Meribald | Knox leak and aligned stars | Loyalty era |
| 318 | Astrologer Meribald | Verdict before Succession (finale) | Pre-Succession (320) |

**Possible endings (day 318):** Astrologer King · Omen Wars · Silenced Heavens

### Star Chamber — beat resolution rules

Every scheduled beat fires while `starArcPhase = active` unless suppressed. Day 105 sets `starArcPhase = active`. Day 318 finale: compute `starOutcome` from priority on load, then show [notification beat](#beat-6--day-318--verdict-before-succession).

**Day 212:** Two-node beat — Meribald node 0, [Prophet](#the-prophets-winter-wildcard--cross-arc) node 1 always follows if `prophetArcPhase = active` and not `prophetSilenced`. Sets `starOmenClash`.

**Day 318 outcome priority:** `starSilenced` or credibility ≤ −35 → **silenced_heavens** · `starOmenClash` + credibility between −25 and +25 + both `prophetFirstHeard` and `starCometProclaimed` → **omen_wars** · credibility ≥ +35 + `starCrownStance = embrace` → **astrologer_king** · credibility ≥ +20 without embrace → **astrologer_king** (weak) · else **silenced_heavens** (fallback).

**Cross-arc callbacks:** `prophetFavor`, `prophetSilenced`, `housesAshfordCouncil`, `guildKnoxLeak`, `northernTrust`, `plagueOutcome`, *"I heard you…"* throughout.

---

### Beat 1 — Day 105 — Comet Confirms Regicide

**Character:** Astrologer Meribald
**Note:** Between Hungry beats (100, 106). Opens arc. Post–People unlock (89). Sets `starArcPhase = active`, `starCometProclaimed` on public embrace.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Meribald — I read what heaven writes in numbers, not rhymes. A comet crosses Edwin's constellation on the night you took his chair. I heard a blade, a household purged or haunted, and Malrik still deciding your soul's tax bracket. The comet confirms regicide to anyone who looks up. Silence me, regulate me, or crown the sky your privy council.

**Prompt variant (`prophetFirstHeard`):** Your Majesty, I heard a nameless prophet rhymes in the market while I measure angles in the tower. Street faith hates comets. Comets hate street faith. You stand between.

**Prompt variant (`churchArcStance = submit`):** Your Majesty, I heard you knelt to Malrik. He will hate my chart. The chart does not kneel.

**Choice 1:** Proclaim the comet — court astronomy is crown policy
- **Response:** Then nobles look up before they look at you. Dangerous — if heaven changes its mind.
- **Effects:** Church -10, Nobility +8, Succession +6
- **Credibility:** +18
- **Sets stance:** `embrace`
- **Sets flag:** `starCometProclaimed`

**Choice 2:** Private audience only — stars advise, not command
- **Response:** Prudent. Boring. The mob will still look up without your permission.
- **Effects:** Loyalty +5, Treasury -5
- **Credibility:** +8
- **Sets stance:** `regulate`

**Choice 3:** Hand him to Cyrus — Church owns the sky
- **Response:** Inquisitors love comets — briefly. You will not hear my tower again until you do.
- **Effects:** Church +12, Loyalty -6
- **Credibility:** −15
- **Sets flag:** `starSilenced` (provisional — lifted if credibility > 0 by beat 3)

---

### Beat 2 — Day 155 — Ashford's House in the Stars

**Character:** Astrologer Meribald
**Note:** Between Hungry finale (119) and [Great Houses day 158](#beat-1--day-158--eastern-watchers). Pre–Nobility unlock (175). Foreshadows Ashford.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Lady Ashford's birth-house sits in the eastern quadrant — ambitious, brittle, fond of nephews and rope. I heard hunger, scaffold mercy, and Church forfeit machinery. The chart says she will measure your reign on day one-seventy-five. Publish her omen and she will hate you. Withhold it and she will fear you. Sell it and she will own you.

**Prompt variant (`scaffoldRiotHangings` or `scaffoldMercy` ≤ −20):** Your Majesty, I heard Morwen's yard loud. Ashford's chart loves loud kings — briefly.

**Prompt variant (`hungryOutcome = bread_king`):** Your Majesty, I heard the commons praise you. Ashford's stars call that *temporary*.

**Choice 1:** Publish Ashford's chart — let the court read her ambition
- **Response:** Then she arrives already insulted. Prepared. Dangerous. Like eastern weather.
- **Effects:** Nobility -6, Loyalty +6, Succession +5
- **Credibility:** +12
- **Sets flag:** `starAshfordMapped`

**Choice 2:** Share chart privately with Ashford — partnership in stars
- **Response:** Then you buy her entrance with prophecy. She will bill you in council seats.
- **Effects:** Nobility +8, Loyalty -4, Treasury -8
- **Credibility:** +5

**Choice 3:** Burn the chart — no omen before she rides
- **Response:** Then you rule without heaven's preview. She will bring her own omens — and soldiers.
- **Effects:** Army +4, Church +4
- **Credibility:** −8

---

### Beat 3 — Day 212 — Two Omens, One Mob (node 0)

**Character:** Astrologer Meribald
**Note:** **Day 212** (not 210 — [Great Houses Ilana](#beat-15--day-210--who-bowed-who-bled) owns 210). Two-node beat. Node 1: [Prophet](#beat-4--day-212--two-omens-one-mob-node-1) if active.
**Nodes:** 2 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the market square fills for two sermons — my eclipse math and the Prophet's winter rhyme. I heard Dell and Crow insult each other in verse while Knox sells maps. The mob wants one truth. Heaven offers two. Regulate both, embrace mine, or let the square choose and call it policy.

**Prompt variant (`prophetFavor` ≥ 20):** Your Majesty, I heard the streets love his riddles. Stars are colder. Cold can be authority if you wield it.

**Prompt variant (`housesDeadCount` ≥ 1 if early deaths — usually 0):** Your Majesty, blood in the peerage makes omens easy to sell. I will not pretend otherwise.

**Choice 1:** Crown astronomy — my chart, his silence today
- **Response:** Then the Prophet's rhymes go underground. Underground rhymes grow teeth.
- **Effects:** Church +6, People -10, Succession +8
- **Credibility:** +15
- **Sets flag:** `starOmenClash`

**Choice 2:** License both — regulated omens, taxed sermons
- **Response:** Bureaucracy of miracles. Malrik hates it. Borvin loves it. I tolerate it.
- **Effects:** Treasury +10, Church -4, Loyalty +4
- **Credibility:** +5
- **Sets stance:** `regulate`
- **Sets flag:** `starOmenClash`

**Choice 3:** Let the mob choose — no crown preference
- **Response:** Then you are not king of signs — you are referee. Referees get hit by both teams.
- **Effects:** People +8, Loyalty -8, Church -6
- **Credibility:** −10
- **Sets flag:** `starOmenClash`

---

### Beat 4 — Day 212 — Two Omens, One Mob (node 1)

**Character:** Nameless Prophet
**Note:** Always follows Meribald node 0 same day if `prophetArcPhase = active` and not `prophetSilenced`. Cross-arc clash beat.
**Nodes:** (continues beat 3)

#### Node 1

**Prompt:** Your Majesty, Meribald counts lights while I count breaths. I heard you proclaimed his comet, burned Ashford's chart, or sold omens like salt. The mob asked which king winter serves. I say: the one who feeds lungs and ears. He says: the one who reads charts. Choose a victor, choose both, or choose silence and let faith fight faith without your badge.

**Choice 1:** Back the Prophet — street faith is crown faith today
- **Response:** Then Meribald's tower darkens. Malrik roars. The poor hum your name. Dangerous music.
- **Effects:** People +12, Church -12, Loyalty +6
- **Credibility:** −20
- **Favor (Prophet):** +15

**Choice 2:** Back Meribald — stars outrank rhymes
- **Response:** Then my market shrinks. His tower brightens. Nobles smile. Peasants calculate.
- **Effects:** Nobility +8, People -8, Church +4
- **Credibility:** +18

**Choice 3:** Hang neither — disperse the square
- **Response:** Steel solves sermons until it becomes the next sermon. Both of us remember.
- **Effects:** Army +8, Loyalty -10, People -6
- **Credibility:** −5
- **Sets flag:** `starSilenced` (partial)

---

### Beat 5 — Day 235 — Succession Omen

**Character:** Astrologer Meribald
**Note:** Between [Great Houses finale](#beat-16--day-218--verdict-on-the-houses) (218) and [Prophet day 265](#beat-5--day-265--the-knife-in-the-sermon). Twenty-five days before Loyalty unlock (260). [Nephew in the Fog](#the-nephew-in-the-fog-persistent-story) opens day **234** — this beat foreshadows the child-shaped gap.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the succession house flickers — Edwin's line, your line, no line. I heard nephews whisper, Ashford map her council, and Ilana write chapters in blood or ink. The chart shows a child-shaped gap before day three-twenty. Publish it and rivals move. Suppress it and rivals guess. Forge it and rivals laugh — until they do not.

**Prompt variant (`housesOutcome = ashford_ascendant`):** Your Majesty, I heard Ashford ascendant. Her stars want the gap filled with her blood, not yours.

**Prompt variant (`starOmenClash`):** Your Majesty, I heard faith fought faith in the square. Succession omens land louder when the mob is already warm.

**Choice 1:** Publish the gap — crown admits no clear heir
- **Response:** Honest terror. Honest policy. Ingvar will read it before Malrik does.
- **Effects:** Succession -10, Loyalty +8, Nobility +4
- **Credibility:** +10
- **Sets flag:** `starSuccessionOmen`

**Choice 2:** Suppress the chart — burn copies
- **Response:** Then Knox sells forgeries by Friday. You chose mystery. Mystery is expensive.
- **Effects:** Loyalty -6, Treasury -8
- **Credibility:** −5

**Choice 3:** Forge a favorable heir-omen — lie with math
- **Response:** Beautiful fraud. Ashford will audit heaven. I will watch.
- **Effects:** Succession +12, Church -8, Loyalty -10
- **Credibility:** +8
- **Sets stance:** `embrace`

---

### Beat 6 — Day 280 — Knox Leak and Aligned Stars

**Character:** Astrologer Meribald
**Note:** Two days after [Northern day 278](#beat-15--day-278--leaks-to-the-north) Knox. Callback `guildKnoxLeak`, `prophetKnoxNamed`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Knox sold your birth hour to Ingvar, Ashford, and a prophet who pretends not to buy. I heard northern steel, guild ledgers, and street rhymes share my tower's trash. The stars align for a leak — not water, secrets. Hang Knox, buy my silence, or publish everything and dare the realm to digest truth at once.

**Prompt variant (`guildKnoxLeak` or `prophetKnoxNamed`):** Your Majesty, I heard Knox already sold you twice. My chart merely confirms his character.

**Prompt variant (`northernTrust` ≤ −20):** Your Majesty, Ingvar owns part of your sky now. That is what leaks mean.

**Choice 1:** Publish Knox's buyers — truth as policy
- **Response:** Then the court panics uniformly. Rare achievement. Stars approve chaos sometimes.
- **Effects:** Loyalty +10, Nobility -12, Succession +5
- **Credibility:** +12
- **Sets flag:** `starKnoxStars`

**Choice 2:** Buy Meribald's silence — stars forget Knox
- **Response:** Expensive astronomy. Knox forgets nothing. Neither do I — for a time.
- **Effects:** Treasury -20, Loyalty -4, Succession +6
- **Credibility:** +15

**Choice 3:** Hang Knox — theatre without prevention
- **Response:** Too late for copies. Early enough for sermon. Both of us knew that.
- **Effects:** Army +5, Loyalty -8
- **Credibility:** −8

---

### Beat 7 — Day 318 — Verdict Before Succession

**Character:** Astrologer Meribald
**Note:** Arc finale. Two days before Succession unlock (320). **On load:** run [day 318 outcome priority](#star-chamber--beat-resolution-rules) → `starOutcome`, `starArcPhase = resolved`. [Prophet finale](#beat-6--day-325--the-last-sign) follows on day 325.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `astrologer_king`):** Your Majesty, two hundred and thirteen days since a comet confirmed what the blade began — and the court looks up before it looks down. I heard charts proclaimed, Ashford mapped, Knox exposed, succession weighed in angles. You rule as astrologer king. Malrik calls it heresy. Nobles call it service. The tower calls it Tuesday.

**Prompt (outcome `omen_wars`):** Your Majesty, I heard rhymes fight math in the square, faith fight faith, Knox sell both. No single omen owns Estedor. Omen wars — street and tower, Prophet and chart. You survive between sermons. Exhausting. Familiar.

**Prompt (outcome `silenced_heavens`):** Your Majesty, I heard Cyrus seize charts, steel disperse mobs, or indifference starve my tower. Heaven goes quiet. The realm calls it peace. Prophets call it winter. I call it silenced heavens — whether you won or merely muted the sky.

**Choice 1:** I have heard the stars — dismiss the tower
- **Response (outcome `astrologer_king`):** Then govern by chart and chair. May both agree on succession.
- **Effects (outcome `astrologer_king`):** Succession +12, Nobility +10, Church -10
- **Response (outcome `omen_wars`):** Then referee faith with steel when you must. No one will thank you.
- **Effects (outcome `omen_wars`):** Loyalty -6, People +8, Church -8, Succession +4
- **Response (outcome `silenced_heavens`):** Then look down only. The sky will not forget you looked up once.
- **Effects (outcome `silenced_heavens`):** Church +10, Army +6, Loyalty +3

---

## The Court of Knives (persistent story)

**Defeat lane:** Loyalty — *"A court that trusts no one cannot rule anyone."*  
**Span:** days **248–315**, **10 beats** — opens before Loyalty unlock (260), runs through [Northern day 252](#beat-14--day-252--loyalties-for-sale) and [278](#beat-15--day-278--leaks-to-the-north), ends before [Star Chamber day 318](#beat-7--day-318--verdict-before-succession) and Succession unlock (320). **The Masked One** and **Talen** anchor intrigue; Knox, Osric, Raena, Ilana, Borvin, Varn callback prior arcs.

**Hidden stat (runtime, not shown in top bar):** `courtTrust` (−100…+100, starts at **0**)

| Tier | Range | Court tone |
|------|-------|-------------|
| **Paranoid** | ≤ −35 | Purges, hollow council |
| **Wary** | −34…−5 | Spies everywhere |
| **Transactional** | −4…+4 | Mutual suspicion |
| **Cordial** | +5…+34 | Managed trust |
| **Trusted court** | ≥ +35 | Catalogued loyalty, mutual leverage |

**Arc state:** `courtTrust`, `knivesArcPhase` (active / resolved), `knivesCrownStance` (purge / manage / trust / sell), flags (`knivesKnoxOffer`, `knivesOsricForgery`, `knivesMaskedAudience`, `knivesRaenaDoor`, `knivesIlanaSold`, `knivesBorvinLeak`, `knivesTalenTriple`, `knivesVarnPurge`), `knivesOutcome` (none / iron_chancellor / hollow_court / traitor_king / managed_spies)

**Beat schedule (Ilana day 276 — not 280; [Star Chamber](#the-star-chamber-wildcard--cross-arc) owns 280):**

| Day | Character | Beat |
|-----|-----------|------|
| 248 | Spy Knox | Foreign offer |
| 255 | Old Advisor Edric | Paranoia or policy |
| 262 | Royal Scribe Osric | Forged decrees |
| 268 | The Masked One | Public audience |
| 274 | Bodyguard Raena | Who guards the door |
| 276 | Chronicler Ilana | History for sale |
| 286 | Treasurer Borvin | Ledger leaks |
| 292 | Talen | Three crowns |
| 304 | Captain Varn | Guard purge |
| 315 | Old Advisor Edric | Verdict on trust (finale) |

**Possible endings (day 315):** Iron Chancellor · Hollow Court · Traitor King · Managed Spies

### Court of Knives — beat resolution rules

Every scheduled day shows one Court of Knives beat while `knivesArcPhase = active`. Day 248 sets `knivesArcPhase = active`. Day 315 finale: compute `knivesOutcome` from priority on load, then show [notification beat](#beat-10--day-315--verdict-on-trust).

**Loyalty unlock day 260:** Beats 1–4 (days 248–268) bank Loyalty effects as documented; beats 5+ apply Loyalty stat live.

**Day 315 outcome priority:** `courtTrust` ≤ −35 + (`knivesVarnPurge` or `knivesCrownStance = purge`) → **iron_chancellor** · `courtTrust` ≤ −20 + three+ flags (`knivesKnoxOffer`, `knivesOsricForgery`, `knivesBorvinLeak`) → **hollow_court** · `knivesKnoxOffer` accepted + trust ≤ 0 or `knivesTalenTriple` + trust ≤ −10 → **traitor_king** · trust ≥ +20 + `knivesCrownStance = manage` → **managed_spies** · else **managed_spies** (fallback).

**Cross-arc callbacks:** [Northern](#the-northern-price-persistent-story) `northernTrust`, [Guild](#the-guild-compact-persistent-story) `guildKnoxLeak`, [Star Chamber](#the-star-chamber-wildcard--cross-arc) `starKnoxStars`, [Below the Tapestry](#below-the-tapestry-persistent-story) `tapestryKnoxServants`, [Scaffold](#the-scaffolds-ledger-persistent-story) Talen, [Great Houses](#the-great-houses-persistent-story) `housesOutcome`.

---

### Beat 1 — Day 248 — Foreign Offer

**Character:** Spy Knox
**Note:** Opens arc. Six days before [Northern day 252](#beat-14--day-252--loyalties-for-sale). Pre-echo of day 278 Knox leak. Sets `knivesArcPhase = active`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ingvar is not my only buyer this month. I heard northern steel, guild ledgers, and servant names from below your stairs. A foreign house offers coin for your council roster — who sleeps at the door, who signs your decrees, who still whispers Edwin. Sell the court map, refuse and hunt buyers, or hire me exclusively and pray I stay hungry.

**Prompt variant (`northernTrust` ≤ −20):** Your Majesty, I heard the north hates you efficiently. Foreign offers multiply when neighbors do.

**Prompt variant (`tapestryKnoxServants`):** Your Majesty, I heard you bought servant lists on day one-twenty-six. This is the deluxe edition — with guards attached.

**Choice 1:** Refuse and purge buyers — crown hunts spies
- **Response:** Then I vanish before dusk — or sell to someone angrier. You chose steel over commerce.
- **Effects:** Army +8, Loyalty -6, Treasury -8
- **Trust:** +8
- **Sets stance:** `purge`

**Choice 2:** Accept foreign retainer — Knox works abroad this season
- **Response:** Then your court has a landlord overseas. Efficient. Treasonous. Often both.
- **Effects:** Treasury +20, Loyalty -15, Succession -10
- **Trust:** −25
- **Sets flag:** `knivesKnoxOffer`
- **Sets stance:** `sell`

**Choice 3:** Exclusive crown contract — Knox eats only from you
- **Response:** Expensive pet. I bite other hands. Not yours — until the price changes.
- **Effects:** Treasury -18, Loyalty +6
- **Trust:** +12
- **Sets stance:** `manage`

---

### Beat 2 — Day 255 — Paranoia or Policy

**Character:** Old Advisor Edric
**Note:** Five days before Loyalty unlock (260). Frames arc for post-unlock era.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, loyalty is about to become a meter the realm reads aloud. I heard Knox's foreign offer, servant leaks from the stairs, and northern maps sold twice. Paranoia keeps thrones — policy keeps realms. Purge the court before day two-sixty, manage spies like a treasury, or trust someone — name who — and dare the statistic.

**Prompt variant (`knivesKnoxOffer`):** Your Majesty, I heard you rented Knox abroad. Loyalty will call that treason before breakfast.

**Prompt variant (`guildKnoxLeak` or `starKnoxStars`):** Your Majesty, I heard Knox sold ledgers already. This is not new sin — it is repeat business.

**Choice 1:** Policy of purge — fear before Loyalty unlocks
- **Response:** Then I write *iron* early. The court will not thank you. It will obey — briefly.
- **Effects:** Army +10, Loyalty -8
- **Trust:** −10
- **Sets stance:** `purge`

**Choice 2:** Policy of managed spies — catalog, do not hang
- **Response:** Clever. Exhausting. Like ruling two courts — one visible, one numbered.
- **Effects:** Treasury -10, Loyalty +6, Succession +4
- **Trust:** +10
- **Sets stance:** `manage`

**Choice 3:** Policy of trust — name Raena and no one else
- **Response:** Dangerous simplicity. If you are wrong, you are wrong magnificently.
- **Effects:** Loyalty +10, Army +4
- **Trust:** +15
- **Sets stance:** `trust`

---

### Beat 3 — Day 262 — Forged Decrees

**Character:** Royal Scribe Osric
**Note:** Between [Prophet day 265](#beat-5--day-265--the-knife-in-the-sermon) — no collision. Callback [Household](#the-old-kings-household-persistent-story) Osric ghost signatures.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, decrees circulate in Edwin's hand — my hand — your hand — and the forgery is exquisite. I heard Knox sell maps, foreign houses bid, and Loyalty unlock approach. Hang the forger, authenticate every seal with pain, or use false decrees to feed false buyers and learn who bites.

**Prompt variant (`householdCutClerks` or `householdOutcome = clean_court`):** Your Majesty, I heard you purged archives. Forgers thrive in confusion. That is not philosophy — it is paperwork.

**Choice 1:** Authenticate all seals — slow honest government
- **Response:** Then policy crawls and trust inches upward. Rare. Boring. Useful.
- **Effects:** Loyalty +10, Treasury -8, Succession +6
- **Trust:** +12

**Choice 2:** Feed forgeries to Knox's buyers — counter-intelligence
- **Response:** Then liars eat liars. If they compare notes, you burn. Until then, you learn.
- **Effects:** Loyalty +4, Army +3
- **Trust:** +6
- **Sets flag:** `knivesOsricForgery`

**Choice 3:** Hang Osric — scapegoat the archive
- **Response:** Convenient. Forgeries continue without a neck to blame. You chose theatre.
- **Effects:** Loyalty -12, Succession +5
- **Trust:** −18
- **Sets flag:** `knivesOsricForgery` (worse fallout)

---

### Beat 4 — Day 268 — Public Audience

**Character:** The Masked One
**Note:** Post–Loyalty unlock (260). First Masked One beat in [Court of Knives](#the-court-of-knives-persistent-story). [Nephew in the Fog](#the-nephew-in-the-fog-persistent-story) day 234 opens the succession claim; this beat escalates court intrigue. Unknown identity drives Succession rumor.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I wear a mask because names are contracts — and I have not decided whom I serve. The court demands audience. I heard forged decrees, foreign offers, and Edwin's chamber still debated below stairs. Unmask me publicly, grant private council, or refuse audience and let rumor name me nephew, ghost, or merchant prince.

**Prompt variant (`tapestryChamberUsed`):** Your Majesty, I heard Edwin's bed still warm. The mask is not the only thing that frightens Ashford.

**Prompt variant (`housesOutcome` set):** Your Majesty, I heard great houses bleed. Masks are fashionable this season.

**Choice 1:** Public audience — let the court see the mask
- **Response:** Then rumor becomes spectacle. Spectacle is cheaper than truth and twice as loud.
- **Effects:** Loyalty -6, Succession +10, Nobility -8
- **Trust:** −5
- **Sets flag:** `knivesMaskedAudience`

**Choice 2:** Private council — masked voice advises throne
- **Response:** Then you govern whispers. I will whisper back. Knox will try to listen.
- **Effects:** Loyalty +6, Succession +8, Treasury -10
- **Trust:** +8
- **Sets flag:** `knivesMaskedAudience`
- **Sets stance:** `manage`

**Choice 3:** Refuse audience — mask leaves unnamed
- **Response:** Then I vanish and ten masks appear. You chose mystery. Mystery multiplies.
- **Effects:** Army +4, Loyalty -4
- **Trust:** −3

---

### Beat 5 — Day 274 — Who Guards the Door

**Character:** Bodyguard Raena
**Note:** Callback [Below the Tapestry](#below-the-tapestry-persistent-story) `tapestryRaenaDoor`, [Empty Purse](#the-empty-purse-persistent-story).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, three men claim my post — mercenary, Edwin's veteran, foreign sworn sword. I heard Knox's offer, Osric's forgeries, and a mask in your council. Loyalty meter says the realm watches who you trust at the door. Keep me, rotate guards, or double posts and bankrupt trust.

**Prompt variant (`knivesKnoxOffer`):** Your Majesty, I heard you sold maps abroad. My sword is not for export — yet.

**Prompt variant (`knivesCrownStance = trust`):** Your Majesty, I heard Edric named me policy. Flattering. Heavy.

**Choice 1:** Keep Raena — one sword, one door
- **Response:** Then I stay. If you fail me, you fail simplicity.
- **Effects:** Loyalty +12, Army +4, Treasury -8
- **Trust:** +18
- **Sets flag:** `knivesRaenaDoor`

**Choice 2:** Rotate guard — no one owns the stair
- **Response:** Then assassins schedule around shifts. So will you.
- **Effects:** Army +6, Loyalty -6
- **Trust:** −8

**Choice 3:** Hire foreign sword — Knox's recommendation
- **Response:** Then I leave before dusk. You chose novelty over memory.
- **Effects:** Treasury -15, Army +10, Loyalty -15
- **Trust:** −20

---

### Beat 6 — Day 276 — History for Sale

**Character:** Chronicler Ilana
**Note:** **Day 276** (not 280 — Star Chamber Knox/stars beat owns 280). Callback [Guild day 214](#beat-11--day-214--debt-chapter) Ilana debt chapter.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I write the first draft of your reign while knives sell second drafts abroad. I heard Knox, foreign houses, and Talen price your mornings. Buy my chapter exclusively, let chapters leak and learn who reads, or burn drafts and rule without chronicle — blind, but unquoted.

**Prompt variant (`knivesOsricForgery`):** Your Majesty, I heard decrees lie. I prefer verbs that do not need forgeries to rhyme.

**Prompt variant (`housesDeadCount` ≥ 2):** Your Majesty, I heard blood in the peerage. My ink is still wet.

**Choice 1:** Exclusive chronicle — crown owns history
- **Response:** Then you buy sentences. Expensive. Worth it if you finish the book.
- **Effects:** Treasury -12, Loyalty +8, Succession +8
- **Trust:** +10

**Choice 2:** Let chapters leak — learn who quotes them
- **Response:** Then Knox profits and you learn. Both can be true. Both hurt.
- **Effects:** Loyalty +4, Nobility -6
- **Trust:** +4
- **Sets flag:** `knivesIlanaSold`

**Choice 3:** Burn drafts — no history until victory
- **Response:** Then rumor owns your verbs. Soldiers may prefer it that way.
- **Effects:** Army +6, Loyalty -8
- **Trust:** −10

---

### Beat 7 — Day 286 — Ledger Leaks

**Character:** Treasurer Borvin
**Note:** Six days after Ilana. Callback `knivesIlanaSold`, `guildKnoxLeak`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, true ledgers walk while court ledgers lie. I heard Knox sold pages, Ilana sold chapters, foreign houses bought both. Borvin's numbers say Loyalty is a luxury line-item. Publish true accounts, feed false numbers to spies, or hang the clerks and pretend arithmetic is moral.

**Prompt variant (`guildOutcome = debt_crown`):** Your Majesty, I heard creditors own tomorrow. Leaks are the least of your debts.

**Choice 1:** Publish true accounts — honest bankruptcy or honest surplus
- **Response:** Then the court panics uniformly. Honesty is a kind of purge.
- **Effects:** Loyalty +10, Treasury -5, Nobility -8
- **Trust:** +12

**Choice 2:** Feed false ledgers — counter-intelligence
- **Response:** Clever until two liars compare. Still — buy time.
- **Effects:** Loyalty +4, Army +3
- **Trust:** +6
- **Sets flag:** `knivesBorvinLeak`

**Choice 3:** Hang clerks — scapegoat arithmetic
- **Response:** Theatre. The numbers continue without necks to blame.
- **Effects:** Loyalty -10, Treasury +8
- **Trust:** −15

---

### Beat 8 — Day 292 — Three Crowns

**Character:** Talen
**Note:** Callback [Scaffold day 165](#beat-7--day-165--bribe-the-executioner) Talen. *"I heard Knox works for three crowns."*
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I am Talen — fixer, whisperer, bill presented after damage. I heard Knox works for three crowns: yours, Ingvar's, and a masked third who pays in succession rumors. Expose Knox, join the auction, or hire me to lie to all three and call it policy.

**Prompt variant (`knivesKnoxOffer`):** Your Majesty, I heard you already sold Knox abroad. He works for four crowns now. Inflation is spiritual.

**Prompt variant (`knivesMaskedAudience`):** Your Majesty, the masked third pays well. I could introduce you — for a fee.

**Choice 1:** Expose Knox publicly — loyalty through humiliation
- **Response:** Then he vanishes and ten smaller Knoxes appear. You chose sermon over solution.
- **Effects:** Loyalty +8, Army +5, Treasury -5
- **Trust:** +8

**Choice 2:** Join the auction — crown outbids foreign houses
- **Response:** Then you rent loyalty weekly. I approve of subscriptions.
- **Effects:** Treasury -25, Loyalty +10
- **Trust:** +5
- **Sets stance:** `manage`

**Choice 3:** Hire Talen to lie to all three crowns
- **Response:** Then truth dies of overwork. You survive — until the lies meet.
- **Effects:** Loyalty -8, Succession +6, Treasury -12
- **Trust:** −12
- **Sets flag:** `knivesTalenTriple`

---

### Beat 9 — Day 304 — Guard Purge

**Character:** Captain Varn
**Note:** Twenty-six days after [Northern day 278](#beat-15--day-278--leaks-to-the-north). Guard purge vs reform.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the yard lists traitors — or loyalists — depending who writes lists. I heard Knox, Talen, foreign swords, and forged decrees. Purge the guard and teach fear, reform oaths and teach patience, or ignore the yard and teach contempt. Loyalty meter will read your choice aloud.

**Prompt variant (`knivesRaenaDoor`):** Your Majesty, I heard Raena owns the door. The yard wants to know if she owns the throne.

**Prompt variant (`knivesCrownStance = purge`):** Your Majesty, I heard Edric chose fear. I sharpen steel accordingly.

**Choice 1:** Purge the guard — new oaths, new men
- **Response:** Then fear keeps order until fear finds a leader.
- **Effects:** Army +10, Loyalty -12, Treasury -10
- **Trust:** −20
- **Sets flag:** `knivesVarnPurge`

**Choice 2:** Reform oaths — pay, investigate, retain
- **Response:** Gold and ledgers. Traditional pairing. Less bloody. Not bloodless.
- **Effects:** Treasury -15, Loyalty +12, Army +4
- **Trust:** +15

**Choice 3:** Ignore the yard — throne above barracks gossip
- **Response:** Then gossip becomes policy without your signature.
- **Effects:** Loyalty -8, Army -5
- **Trust:** −10

---

### Beat 10 — Day 315 — Verdict on Trust

**Character:** Old Advisor Edric
**Note:** Arc finale. Three days before [Star Chamber day 318](#beat-7--day-318--verdict-before-succession). Five days before Succession unlock (320). **On load:** run [day 315 outcome priority](#court-of-knives--beat-resolution-rules) → `knivesOutcome`, `knivesArcPhase = resolved`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `iron_chancellor`):** Your Majesty, sixty-seven days since Knox's foreign offer — and the court knows you by purge. I heard forgeries hunted, masks refused, guards replaced, ledgers scapegoated. Iron chancellor — fear keeps the council in line. Loyalty survives. Warmth does not.

**Prompt (outcome `hollow_court`):** Your Majesty, I heard maps sold, chapters leaked, ledgers false, masks unnamed. Hollow court — everyone present, no one believed. You reign among spies who hate each other almost as much as they hate you.

**Prompt (outcome `traitor_king`):** Your Majesty, I heard Knox work abroad, Talen lie to three crowns, foreign steel at your door. Traitor king — or king who bought time with treason. The realm cannot tell. Neither can I.

**Prompt (outcome `managed_spies`):** Your Majesty, no doctrine — only managed spies, catalogued leaks, and a mask who may or may not advise. Managed trust. Exhausting. Durable. The Loyalty meter calls it survival.

**Choice 1:** I have heard the court — dismiss the knives
- **Response (outcome `iron_chancellor`):** Then I write *iron* and hope fear outlasts resentment.
- **Effects (outcome `iron_chancellor`):** Army +12, Loyalty -6, Succession +8
- **Response (outcome `hollow_court`):** Then I write *hollow* and lock the ledgers twice.
- **Effects (outcome `hollow_court`):** Loyalty -10, Treasury +8, Nobility -6
- **Response (outcome `traitor_king`):** Then I write *traitor* and hope history disagrees.
- **Effects (outcome `traitor_king`):** Treasury +15, Loyalty -18, Succession -10
- **Response (outcome `managed_spies`):** Then I write *managed* — the hardest verb in government.
- **Effects (outcome `managed_spies`):** Loyalty +10, Treasury -8, Succession +6

---

## The Nephew in the Fog (persistent story)

**Defeat lane:** Succession — *"A usurper without a story dies when a nephew finds his voice."*  
**Span:** days **234–335**, **10 beats** — begins between [Star Chamber day 235](#beat-5--day-235--succession-omen) and [Court of Knives day 248](#beat-1--day-248--foreign-offer), crosses Succession unlock (**320**), ends before [Grey Lung day 340](#beat-8--day-340--historical-verdict-outcome-cured). **The Masked One** claims to speak for Edwin's nephew; **Talen**, **Ashford**, **Knox**, **Osric**, **Ilana**, and **Ingvar** price the boy's location. Day **335** is a **Prophet coda** after the day-328 finale — not a Prophet-arc beat.

**Hidden stat (runtime, not shown in top bar):** `heirCredibility` (−100…+100, starts at **0**)

| Tier | Range | Realm belief |
|------|-------|----------------|
| **Usurper secure** | ≤ −35 | Nephew dismissed; your line stands |
| **Doubted** | −34…−5 | Rumours without proof |
| **Contested** | −4…+4 | Two stories, one throne |
| **Credible heir** | +5…+34 | Nephew gains allies |
| **True line** | ≥ +35 | Succession crisis imminent |

**Arc state:** `heirCredibility`, `heirArcPhase` (active / resolved), `heirCrownStance` (silence / hunt / legitimize / exile), flags (`heirMaskedClaim`, `heirAshfordMarriage`, `heirTalenBuyers`, `heirKnoxNorth`, `heirOsricBirthForge`, `heirIlanaDualChapter`, `heirIngvarBid`, `heirUnmasked`, `heirNephewAlive`, `heirIdentity` none / nephew / impostor / ashford_pawn), `heirOutcome` (none / nephew_dead / nephew_crowned / nephew_exiled / usurper_legitimized)

**Beat schedule (Talen day 257, Knox day 271 — avoid Court of Knives 255/268):**

| Day | Character | Beat |
|-----|-----------|------|
| 234 | The Masked One | Voice of the nephew |
| 242 | Lady Ashford | Marriage was to silence him |
| 257 | Talen | Three buyers for the boy |
| 271 | Spy Knox | Nephew sold north? |
| 285 | Royal Scribe Osric | Birth records |
| 298 | Chronicler Ilana | Two succession chapters |
| 310 | Ambassador Ingvar | Northern princes want the heir |
| 322 | The Masked One | Unmasking |
| 328 | Old Advisor Edric | Legitimacy finale |
| 335 | Nameless Prophet | Omen on the true line (coda) |

**Possible endings (day 328):** Nephew Dead · Nephew Crowned (game over) · Nephew Exiled · Usurper Legitimized

### Nephew in the Fog — beat resolution rules

Every scheduled day shows one Nephew beat while `heirArcPhase = active`. Day 234 sets `heirArcPhase = active`. Day 328 finale: compute `heirOutcome` from priority on load, then show [notification beat](#beat-9--day-328--legitimacy-finale). Day 335 coda fires after finale regardless of outcome — Prophet **reports** an omen; one acknowledgment choice; does not change `heirOutcome`.

**Succession before day 320:** Beats 1–7 bank Succession effects; beats 8+ apply Succession stat live.

**Day 328 outcome priority:** `heirNephewAlive` false or (`heirCrownStance = hunt` + credibility ≤ −25) → **nephew_dead** · `heirUnmasked` + `heirIdentity = nephew` + credibility ≥ +40 → **nephew_crowned** (triggers **game over** at implementation — nephew takes throne) · `heirIngvarBid` + `heirCrownStance = exile` + nephew alive → **nephew_exiled** · `heirAshfordMarriage` or `heirCrownStance = legitimize` + credibility ≤ −15 → **usurper_legitimized** · else **usurper_legitimized** (fallback — fog persists).

**Cross-arc callbacks:** [Court of Knives](#the-court-of-knives-persistent-story) `knivesMaskedAudience`, `knivesTalenTriple`, `knivesKnoxOffer`, [Great Houses](#the-great-houses-persistent-story) `housesAshfordCouncil`, [Star Chamber](#the-star-chamber-wildcard--cross-arc) `starSuccessionOmen`, [Prophet](#the-prophets-winter-wildcard--cross-arc) `prophetOutcome`, [Northern](#the-northern-price-persistent-story) `northernTrust`.

---

### Beat 1 — Day 234 — Voice of the Nephew

**Character:** The Masked One
**Note:** Opens arc one day before [Star Chamber day 235](#beat-5--day-235--succession-omen). Pre–[Court of Knives](#the-court-of-knives-persistent-story). May be same masked figure as day 268 Court beat — identity unresolved until day 322. Sets `heirArcPhase = active`, `heirMaskedClaim`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I speak for a boy you hoped was fog — Edwin's nephew, exiled, hungry, and tired of your chair. I heard guild creditors, star-charts, and great houses measure your reign. Deny him and call me liar, seek him and call me guide, or use my claim to frighten Ashford before she rides again. The mask stays. The question does not.

**Prompt variant (`housesAshfordCouncil` or `housesOutcome = ashford_ascendant`):** Your Majesty, I heard Ashford ascendant. Nephews are problems eastern ladies solve with marriage or murder. I offer a third inconvenience.

**Prompt variant (`starSuccessionOmen`):** Your Majesty, I heard Meribald mapped a child-shaped gap. I am the gap's voice — or its vendor.

**Choice 1:** Deny the nephew — crown calls claim forgery
- **Response:** Then the fog thickens. Someone will believe anyway. Lies need only patience.
- **Effects:** Succession +8, Nobility +6, Loyalty -4
- **Credibility:** −12
- **Sets stance:** `silence`

**Choice 2:** Seek the nephew — crown wants the boy found
- **Response:** Then hunters multiply. I sell directions. Others sell traps. You bought motion.
- **Effects:** Treasury -10, Loyalty +6, Succession -6
- **Credibility:** +15
- **Sets stance:** `hunt`
- **Sets flag:** `heirNephewAlive` (true)

**Choice 3:** Weaponize the claim — frighten peers, not chase boys
- **Response:** Dangerous theatre. Ashford will call it slander. The market will call it policy.
- **Effects:** Nobility -8, Succession +5, Army +4
- **Credibility:** +5
- **Sets flag:** `heirMaskedClaim`

---

### Beat 2 — Day 242 — Marriage Was to Silence Him

**Character:** Lady Ashford
**Note:** Eight days before [Court of Knives day 248](#beat-1--day-248--foreign-offer). Callback [Great Houses](#the-great-houses-persistent-story) Ashford arc.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a marriage was arranged to silence Edwin's nephew — my family's insurance, not your romance. I heard a mask speaks his name in the capital. Marry the silence properly, hunt the boy for me, or admit the nephew lives and let Ashford broker his cage. I do not share power with fog.

**Prompt variant (`heirMaskedClaim`):** Your Majesty, I heard you weaponized the claim. Weaponize it toward my house or I weaponize it toward your throat.

**Prompt variant (`heirCrownStance = hunt`):** Your Majesty, I heard you hunt the boy. Hunt for Ashford, not for yourself.

**Choice 1:** Accept Ashford marriage — silence nephew by alliance
- **Response:** Then my house owns eastern peace and your succession story. You gain a leash. I gain a crown-adjacent future.
- **Effects:** Nobility +12, Succession +10, Loyalty -8, Army +4
- **Credibility:** −10
- **Sets flag:** `heirAshfordMarriage`
- **Sets stance:** `legitimize`

**Choice 2:** Refuse marriage — hunt nephew for crown alone
- **Response:** Then we are rivals, not kin. I will remember who refused insurance.
- **Effects:** Nobility -10, Succession -5, Loyalty +6
- **Credibility:** +8
- **Sets stance:** `hunt`

**Choice 3:** Broker nephew to Ashford — she cages, you reign
- **Response:** Shared custody of a kinglet. Humiliating. Efficient. Very eastern.
- **Effects:** Nobility +6, Treasury -12, Succession +6
- **Credibility:** −5
- **Sets flag:** `heirAshfordMarriage` (partial)

---

### Beat 3 — Day 257 — Three Buyers for the Boy

**Character:** Talen
**Note:** **Day 257** (not 255 — [Court of Knives Edric](#beat-2--day-255--paranoia-or-policy) owns 255). Callback [Court day 292](#beat-8--day-292--three-crowns) and [Scaffold day 165](#beat-7--day-165--bribe-the-executioner).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, three buyers want the boy's location — Ashford, Ingvar, and a masked fixer who pays in succession rumors. I heard you denied, hunted, or brokered the nephew. I sell coordinates to the highest bidder unless you outbid everyone and buy fog outright.

**Prompt variant (`knivesTalenTriple`):** Your Majesty, I heard you hired me to lie to three crowns already. Adding a fourth buyer is professional growth.

**Prompt variant (`heirAshfordMarriage`):** Your Majesty, Ashford is buyer one. She does not like competition.

**Choice 1:** Outbid all buyers — crown owns the secret
- **Response:** Then fog is rented, not cleared. I appreciate subscriptions.
- **Effects:** Treasury -25, Succession +8, Loyalty +4
- **Credibility:** +10
- **Sets flag:** `heirTalenBuyers` (contained)

**Choice 2:** Sell to Ashford — she owns the hunt
- **Response:** Then eastern insurance activates. You bought peace with a boy's leash.
- **Effects:** Nobility +10, Succession +6, Loyalty -10
- **Credibility:** −12

**Choice 3:** Let auction run — learn who bites
- **Response:** Then Knox profits and you learn. Both hurt. Standard Tuesday.
- **Effects:** Loyalty -6, Succession +4
- **Credibility:** −5
- **Sets flag:** `heirTalenBuyers` (exposed)

---

### Beat 4 — Day 271 — Nephew Sold North?

**Character:** Spy Knox
**Note:** **Day 271** (not 268 — [Court Masked One](#beat-4--day-268--public-audience) owns 268). Callback [Northern](#the-northern-price-persistent-story), [Court Knox](#beat-1--day-248--foreign-offer).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ingvar's clerks offer coin for a boy matching the nephew's description — alive, dead, or convincingly dead. I heard Talen's auction and Ashford's marriage plots. Sell the nephew north and buy peace, refuse and arm a legend, or fake a corpse and sell the forgery twice.

**Prompt variant (`knivesKnoxOffer`):** Your Majesty, I heard you rented me abroad. Nephews are a side market. I diversify.

**Prompt variant (`northernTrust` ≤ −20):** Your Majesty, the north already hates you. Heirs are leverage with faces.

**Choice 1:** Refuse — nephew stays a domestic problem
- **Response:** Then Ingvar prices your stubbornness in steel. Domestic problems beat foreign crowns — usually.
- **Effects:** Loyalty +8, Army +5, Succession -4
- **Credibility:** +8

**Choice 2:** Sell location north — buy truce with the boy
- **Response:** Then you rent peace with blood you may never see. Efficient. Monstrous. Familiar.
- **Effects:** Treasury +15, Succession -15, Loyalty -12
- **Credibility:** −20
- **Sets flag:** `heirKnoxNorth`

**Choice 3:** Fake death — sell corpse story to all sides
- **Response:** Then three ledgers own a dead boy who may still breathe. I admire the accounting.
- **Effects:** Treasury +10, Succession +5, Nobility -6
- **Credibility:** −8
- **Sets flag:** `heirNephewAlive` (false if was true — implementation: roll narrative "boy lives in hiding")

---

### Beat 5 — Day 285 — Birth Records

**Character:** Royal Scribe Osric
**Note:** One day before [Court Borvin day 286](#beat-7--day-286--ledger-leaks). Callback [Court Osric day 262](#beat-3--day-262--forged-decrees), Household ghost signatures.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, birth records disagree — Edwin's nephew born in spring, summer, or not at all. I heard Knox sold north, Talen sold coordinates, Ashford sold marriage. Forge records proving nephew bastard, restore Edwin's original line, or burn the archive and let fog win.

**Prompt variant (`knivesOsricForgery`):** Your Majesty, I heard decrees already lie. Birth is merely decrees with crying.

**Prompt variant (`heirKnoxNorth`):** Your Majesty, I heard the north wants a boy. Records are how they justify the invoice.

**Choice 1:** Forge bastardy — nephew illegitimate on paper
- **Response:** Then ink kills boys whom steel cannot find. Ashford will call it crude. It may work.
- **Effects:** Succession +12, Church +4, Loyalty -8
- **Credibility:** −18
- **Sets flag:** `heirOsricBirthForge`

**Choice 2:** Restore Edwin's records — crown admits nephew exists
- **Response:** Honest paperwork. Dangerous honesty. The realm reads ledgers like sermons.
- **Effects:** Succession -10, Loyalty +10, Nobility -6
- **Credibility:** +20

**Choice 3:** Burn the archive — no birth, no nephew, no problem
- **Response:** Then historians hate you. Historians are not armies. Yet.
- **Effects:** Army +6, Loyalty -6, Succession +6
- **Credibility:** −5
- **Sets stance:** `silence`

---

### Beat 6 — Day 298 — Two Succession Chapters

**Character:** Chronicler Ilana
**Note:** Between [Court Talen day 292](#beat-8--day-292--three-crowns) and [Court Varn day 304](#beat-9--day-304--guard-purge). Callback [Court Ilana day 276](#beat-6--day-276--history-for-sale).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I write two succession chapters — yours by blade, his by blood. I heard forged births, northern bids, and masks in council. Publish the nephew chapter and split the realm, publish yours only and call him myth, or publish both and let the realm choose its headache.

**Prompt variant (`heirOsricBirthForge`):** Your Majesty, I heard you forged bastardy. My chapter can match — or contradict. Contradiction pays better.

**Prompt variant (`heirIlanaDualChapter` false + high credibility):** Your Majesty, the boy gains verbs in my draft whether you approve or not.

**Choice 1:** Publish nephew chapter — legitimacy contest in ink
- **Response:** Then the realm reads civil war before breakfast. Honest — if you survive it.
- **Effects:** Succession -12, People +8, Loyalty +6
- **Credibility:** +15
- **Sets flag:** `heirIlanaDualChapter`

**Choice 2:** Crown chapter only — nephew stays footnote
- **Response:** Then footnotes grow teeth in alley sermons. You chose narrative discipline.
- **Effects:** Succession +10, Loyalty -4, Nobility +5
- **Credibility:** −10

**Choice 3:** Dual publication — realm chooses headache
- **Response:** Democracy of disaster. Bold. Exhausting. Very this year.
- **Effects:** Succession -6, Loyalty +4, Treasury -8
- **Credibility:** +8
- **Sets flag:** `heirIlanaDualChapter`

---

### Beat 7 — Day 310 — Northern Princes Want the Heir

**Character:** Ambassador Ingvar
**Note:** Between [Court finale day 315](#beat-10--day-315--verdict-on-trust) preview era and Succession unlock (320). Callback [Northern](#the-northern-price-persistent-story).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the northern princes want Edwin's nephew — as hostage, heir, or saint. I heard Knox sold coordinates, Ilana published chapters, Osric forged births. Surrender the boy for alliance, deny him and fight spring, or offer your own succession story and dare them to call it lie.

**Prompt variant (`heirKnoxNorth`):** Your Majesty, I heard you already sold him once. We call that a down payment.

**Prompt variant (`heirTalenBuyers` exposed):** Your Majesty, Talen's auction reached our ports before your heralds.

**Choice 1:** Deny the north — nephew is domestic crown business
- **Response:** Then we price your denial in steel next spring. Consistent diplomacy.
- **Effects:** Army +8, Succession +6, Loyalty +4
- **Credibility:** +6

**Choice 2:** Surrender nephew — northern alliance via hostage
- **Response:** Then you buy peace with Edwin's bloodline. Humiliating. Durable, sometimes.
- **Effects:** Treasury -10, Succession -12, Army +10
- **Credibility:** −15
- **Sets flag:** `heirIngvarBid`
- **Sets stance:** `exile`

**Choice 3:** Offer usurper's charter — you are the only king that matters
- **Response:** Bold blasphemy against blood. I will carry the message north. They will laugh — then calculate.
- **Effects:** Succession +15, Nobility -8, Loyalty -6
- **Credibility:** −12
- **Sets stance:** `legitimize`

---

### Beat 8 — Day 322 — Unmasking

**Character:** The Masked One
**Note:** Two days after Succession unlock (320). Two days after [Star Chamber finale day 318](#beat-7--day-318--verdict-before-succession). **Interactive beat** — player choices set `heirUnmasked` and `heirIdentity`. Does not pick final outcome (finale day 328 computes that).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the mask comes off because stories must end or explode. I heard chapters, forgeries, northern bids, and your reign measured in fog. I may be Edwin's nephew, Ashford's pawn, a merchant's son, or a mask Knox wears for profit. Demand truth publicly, accept private answer, or declare the mask itself the only heir that matters.

**Prompt variant (`knivesMaskedAudience`):** Your Majesty, I heard you granted me council once. Unmasking is payment due.

**Prompt variant (`heirAshfordMarriage`):** Your Majesty, Ashford prays I am her pawn. Prayers are not policy. You will see.

**Choice 1:** Public unmasking — square sees the face
- **Response:** Then the realm gasps collectively. Useful sound. Dangerous sound.
- **Effects:** Succession -15, Loyalty +10, People +8
- **Sets flag:** `heirUnmasked`
- **Sets identity:** `nephew` if credibility ≥ +25 · `impostor` if ≤ −10 · `ashford_pawn` if `heirAshfordMarriage` · else implementation table

**Choice 2:** Private answer — crown learns first
- **Response:** Then you carry truth alone awhile. Heavier than crowns. Lighter than mobs.
- **Effects:** Succession +5, Loyalty +6, Treasury -8
- **Sets flag:** `heirUnmasked`
- **Sets identity:** per `heirCredibility` + flags (same table, hidden from court)

**Choice 3:** Reject unmasking — mask remains policy
- **Response:** Then fog persists. Fog elected kings before. It may again.
- **Effects:** Succession +8, Loyalty -8
- **Credibility:** −8

**Identity table (implementation):** credibility ≥ +30 → `nephew` · `heirAshfordMarriage` + credibility &lt; +10 → `ashford_pawn` · `heirOsricBirthForge` + credibility ≤ 0 → `impostor` · else contested → random weighted by flags.

---

### Beat 9 — Day 328 — Legitimacy Finale

**Character:** Old Advisor Edric
**Note:** Arc finale. Eight days after Succession unlock (320). **On load:** run [day 328 outcome priority](#nephew-in-the-fog--beat-resolution-rules) → `heirOutcome`, `heirArcPhase = resolved`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `nephew_dead`):** Your Majesty, ninety-four days since a mask named Edwin's nephew — and the boy is dead on paper, in fact, or convincingly enough. I heard hunts, forgeries, northern bids, and Ashford's insurance. Nephew dead. Your line stands on blade and ledger. Guard it — fog has cousins.

**Prompt (outcome `nephew_crowned`):** Your Majesty, I heard the mask was blood, the chapters were true, and the realm prefers birth to blade. The nephew lives and the throne moves. Nephew crowned — **your reign ends here** at implementation. I write the last page you will authorize.

**Prompt (outcome `nephew_exiled`):** Your Majesty, I heard the north bought a boy and you bought spring. Nephew exiled — alive, elsewhere, hungry for your mistakes. Peace today. Story tomorrow.

**Prompt (outcome `usurper_legitimized`):** Your Majesty, I heard marriage, forged bastardy, or fog too thick to cut. The realm accepts your story — not Edwin's line, not Ashford's pawn, **you**. Usurper legitimized. Rare. Costly. Yours.

**Choice 1:** I have heard the line — dismiss the succession court
- **Response (outcome `nephew_dead`):** Then I write *survivor* and close the nephew ledger.
- **Effects (outcome `nephew_dead`):** Succession +15, Loyalty +8, Army +5
- **Response (outcome `nephew_crowned`):** Then I write *abdication* and hand the pen to the boy.
- **Effects (outcome `nephew_crowned`):** *(game over — no further days)*
- **Response (outcome `nephew_exiled`):** Then I write *exile* and hope distance equals mercy.
- **Effects (outcome `nephew_exiled`):** Succession +8, Army +6, Treasury -10
- **Response (outcome `usurper_legitimized`):** Then I write *legitimacy bought* and pray it holds past winter.
- **Effects (outcome `usurper_legitimized`):** Succession +12, Nobility +8, Loyalty +6

---

### Beat 10 — Day 335 — Omen on the True Line (coda)

**Character:** Nameless Prophet
**Note:** **Coda** after [finale day 328](#beat-9--day-328--legitimacy-finale). `heirArcPhase` already `resolved`. Does **not** change `heirOutcome`. Cross-callback [Prophet day 325](#beat-6--day-325--the-last-sign). Ten days before [Grey Lung day 340](#beat-8--day-340--historical-verdict-outcome-cured).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (heirOutcome `nephew_dead`):** Your Majesty, winter ends and the true line sleeps in earth or ink. I heard you killed a boy, a myth, or both. My last succession omen is short: **the chair eats names**. Yours remains — for now.

**Prompt (heirOutcome `nephew_crowned`):** *(Should not fire — game over on day 328. Edge case: Prophet mocks empty throne.)*

**Prompt (heirOutcome `nephew_exiled`):** Your Majesty, I heard the nephew walks northern snow. Exile is a kind of crown — cold, far, patient. The true line breathes where you cannot reach.

**Prompt (heirOutcome `usurper_legitimized`):** Your Majesty, I heard the realm chose your story over Edwin's blood. Legitimacy is a sermon the living preach. My omen: **the usurper becomes dynasty** — if you survive the next winter.

**Choice 1:** I have heard the omen — let the prophet go
- **Response (heirOutcome `nephew_dead`):** Then fog closes. Spring opens other ledgers.
- **Effects (heirOutcome `nephew_dead`):** Church -4, Loyalty +3
- **Response (heirOutcome `nephew_exiled`):** Then pray the north keeps him hungry, not ambitious.
- **Effects (heirOutcome `nephew_exiled`):** Succession +4, Loyalty +2
- **Response (heirOutcome `usurper_legitimized`):** Then dynasty is a verb. Prove it daily.
- **Effects (heirOutcome `usurper_legitimized`):** Succession +6, People +4

---

## The Prophet's Winter (wildcard / cross-arc)

Sparse **wildcard** arc spanning days **62–325**. The **Nameless Prophet** speaks in riddles that stitch other arcs together; **Saint Fox** appears once as an absurd rival miracle. Not tied to a single defeat lane — instead shifts **Church vs People** tension via hidden `prophetFavor`. Touches [Household](#the-old-kings-household-persistent-story), [Empty Purse](#the-empty-purse-persistent-story), [Church](#the-crown-forfeit--tithe-war-persistent-story), [Northern](#the-northern-price-persistent-story), [Grey Lung](#grey-lung-cure-arc-persistent-story), and stat-unlock eras (People 89, Nobility 175, Loyalty 260, Succession 320).

**Hidden stat (runtime, not shown in top bar):** `prophetFavor` (−100…+100, starts at **0**)

| Tier | Range | Realm reaction |
|------|-------|----------------|
| **Condemned** | ≤ −35 | Church-led suppression; mob fearful |
| **Doubted** | −34…−5 | Court jokes; peasants whisper |
| **Heard** | −4…+4 | Mixed sermons |
| **Beloved** | +5…+34 | Street cults; Malrik angry |
| **Oracle** | ≥ +35 | Prophet shapes policy; crown endangered by faith |

**Arc state:** `prophetFavor`, `prophetArcPhase` (active / resolved), flags (`prophetFirstHeard`, `prophetFoxCult`, `prophetSilenced`, `prophetAshfordOmen`, `prophetKnoxNamed`, `prophetDeferredDay96`), `prophetOutcome` (none / voice_of_winter / silenced_seer / saint_and_fox / omen_throne / ignored_winter)

**Beat schedule (sparse — six beats across the year):**

| Day | Character | Beat | Era |
|-----|-----------|------|-----|
| 62 | Nameless Prophet | The first frost | Pre-People |
| 95 or 96 | Nameless Prophet | The fever sermon | Grey Lung season |
| 140 | Saint Fox | The absurd miracle | People era |
| 187 | Nameless Prophet | Ashford's shadow | Post-Great Houses (185) |
| 265 | Nameless Prophet | The knife in the sermon | Pre-/post-Loyalty (260) |
| 325 | Nameless Prophet | The last sign | Succession unlocked (320) |

**Possible endings (day 325):** Voice of Winter · Silenced Seer · Saint and Fox · Omen Throne · Ignored Winter

### Prophet's Winter — beat resolution rules

**Day 95 collision (Grey Lung):** If `plagueArcPhase = active` on day 95, [Grey Lung Beat 5](#beat-5--day-95--resolution-outcome-cured) runs per its existing priority waterfall. Prophet beat 2 **defers to day 96** and sets `prophetDeferredDay96`. If plague arc already `resolved` before day 95 (edge case), Prophet beat 2 fires on day 95. Day 96 shows no other arc beat.

**Day 187 collision (Great Houses):** If [Great Houses beat 9](#beat-9--day-185--council-fracture) fires day 185, Prophet beat 4 runs day **187** (not 185). Day 187 has no other arc beat.

**Day 212 (Star Chamber):** [Star Chamber beat 3–4](#beat-3--day-212--two-omens-one-mob-node-0) runs day 212. Prophet node 1 on 212 only if `prophetArcPhase = active` and not `prophetSilenced`. No Prophet standalone beat on 212.

**Day 335 (Nephew coda):** [Nephew in the Fog beat 10](#beat-10--day-335--omen-on-the-true-line-coda) uses the Prophet as speaker but is **not** a Prophet-arc beat. Fires after Nephew finale (328). Prophet arc last beat remains day 325.

**Day 325 outcome priority:** `prophetSilenced` → **silenced_seer** · `prophetFoxCult` + favor ≥ 20 → **saint_and_fox** · favor ≥ 35 → **voice_of_winter** · favor ≤ −35 → **omen_throne** (crown feared as blasphemy) · else **ignored_winter**.

**People before day 89:** Beats 1–2 use Loyalty instead of People where noted. Beat 3 (day 140) is first beat that may apply People freely.

**Cross-arc callbacks:** Each beat's prompt variants key off flags from other arcs (`householdStance`, `churchArcStance`, `emptyPurseOutcome`, `northernTrust` tier, `plagueOutcome`, `householdOutcome`, etc.) using *"I heard you…"*.

---

### Beat 1 — Day 62 — The First Frost

**Character:** Nameless Prophet
**Note:** Opens arc. Fires after [Empty Purse](#the-empty-purse-persistent-story) mid-run and [Household](#the-old-kings-household-persistent-story) beat 8 (day 58). Church arc active (day 30+). Sets `prophetArcPhase = active`, `prophetFirstHeard`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I have no name because names are for men who die once. I have a winter — three frosts, three kings, one throne. I heard a blade gave you Edwin's chair while his household still breathes. I heard Malrik still chooses whether heaven knows your face. The market wants a sign. Do you silence me, hear me, or sell me to the Church?

**Prompt variant (`churchArcStance = defy`):** Your Majesty, I heard you told Malrik the crown needs no sermon. Winter does not ask permission either. The poor already listen to me because the cathedral listens to you with knives.

**Prompt variant (`householdStance = purge`):** Your Majesty, I heard you purged Edwin's ghosts from kitchen and yard. Ghosts are cheap in winter. Prophets are cheaper. Hang me and the rhyme survives.

**Prompt variant (`emptyPurseCrisis`):** Your Majesty, I heard your purse rattles before your sword does. Men who cannot pay soldiers buy omens instead. I am affordable.

**Choice 1:** Hear him publicly — let the square listen
- **Response:** Then winter has a third voice — yours, Malrik's, and mine. Dangerous music. The poor will hum it.
- **Effects:** Church -8, Loyalty +8, Food -3
- **Favor:** +15
- **Sets flag:** `prophetFirstHeard`

**Choice 2:** Give him to Cyrus — Church owns the omen
- **Response:** Inquisitors love unnamed tongues. You will not hear mine again — until you do.
- **Effects:** Church +10, Loyalty -5
- **Favor:** −12
- **Sets flag:** `prophetSilenced` (provisional — lifted if favor rises above 0 by beat 3)

**Choice 3:** Ignore him — winter passes, prophets fade
- **Response:** Wise. Boring. Most winters are. I will be back when the cough reaches the altar.
- **Effects:** Loyalty +2
- **Favor:** −3

---

### Beat 2 — Day 95 or 96 — The Fever Sermon

**Character:** Nameless Prophet
**Note:** Thematically tied to [Grey Lung](#grey-lung-cure-arc-persistent-story) season. **Day 95:** only if `plagueArcPhase = resolved` before this date. **Day 95 / day 340 finales:** Branch variant is chosen on load from arc state (progress, path, scandal flag). That sets `plagueOutcome` and `plagueArcPhase = resolved` on day 95. Day 340 **reports** the year-end legacy for the already-set outcome — one acknowledgment choice only. See [arc finale pattern](#arc-finale-pattern-all-persistent-arcs).

**Day 96:** default when Grey Lung Beat 5 fires day 95. Callbacks `plagueOutcome`, Church miracle path, Mira funding.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the wards cough and the bells toll. I heard you funded Mira's bottles — or Malrik's holy water — or neither and called it prudence. I preach what the fever teaches: the throne is a lung, the realm exhales debt, and the usurper is whichever king stops breathing last. Do you baptize my sermon, ban it, or let the sick decide?

**Prompt variant (`plagueOutcome = miracle` or `church_route`):** Your Majesty, I heard Malrik calls it God's mercy. The coughing poor call it timing. I call it a miracle with your face on the poster. Share the altar, or share the blame.

**Prompt variant (`plagueOutcome = scandal` or `plagueScandalFlag`):** Your Majesty, I heard cheaper physic drove men mad. The realm wants a villain — Odo, Mira, or you. I can point anywhere. Choose where.

**Prompt variant (`plagueOutcome = failed`):** Your Majesty, I heard the pyres outnumber your decrees. Failure is a sermon Malrik will not preach. I will — unless you stop my mouth.

**Choice 1:** Let him preach in the wards — faith beside physic
- **Response:** Then the sick hear two cures. One may save you. One may save me. Neither is guaranteed.
- **Effects:** Health +5, Church -10, Loyalty +10
- **Favor:** +18
- **Note:** People +5 if day ≥ 89

**Choice 2:** Ban street sermons during the plague — order before omen
- **Response:** Bans feed martyrs. The cough does not read decrees. Remember I warned you.
- **Effects:** Church +6, Army +4, Loyalty -8
- **Favor:** −15
- **Sets flag:** `prophetSilenced`

**Choice 3:** Co-opt him — crown-sponsored prophecies only
- **Response:** Then I speak your winter with your accent. Useful. False. Popular enough.
- **Effects:** Treasury -8, Loyalty +5, Church +3
- **Favor:** +8

---

### Beat 3 — Day 140 — The Absurd Miracle

**Character:** Saint Fox
**Note:** **Saint Fox** speaks (via handler or possessed peasant — implementation choice; prompt is in-character). Absurd miracle competes with Malrik. Day after Grey Lung fallout (130), before Northern mid-year heat. [Inquisitor Cyrus](#beat-2--day-35--the-holy-inquiry) may appear in response text only.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the fox appeared on three legs and left on four. I am the voice it borrowed — ridiculous, yes. The lame walked in the lower market yesterday. Malrik calls it mockery. The people call it hope with a tail. Crown the fox, crown the Church, or crown your common sense and deny us all.

**Prompt variant (`prophetFirstHeard` + favor ≥ 10):** Your Majesty, I heard you let the Nameless Prophet speak in winter. Now a fox out-preaches him. That is comedy — until it is politics.

**Prompt variant (`churchArcStance = submit` or `churchOutcome` anointed):** Your Majesty, I heard you knelt for Malrik. The fox does not kneel. The mob prefers fur to incense today.

**Choice 1:** Embrace the fox cult — street faith is still faith
- **Response:** Then banners will carry whiskers. Malrik will excommunicate a mammal. You will laugh until the levies refuse to march.
- **Effects:** Church -18, Loyalty +12, Food -5
- **Favor:** +22
- **Sets flag:** `prophetFoxCult`
- **Note:** People +10 (unlock passed)

**Choice 2:** Burn the shrine — Cyrus cleans the square
- **Response:** Ash and squeals. The people will remember who killed the miracle. So will the chronicles.
- **Effects:** Church +15, Loyalty -12, Army +5
- **Favor:** −25

**Choice 3:** Investigate fraud — find the handlers
- **Response:** Clever. There are always handlers. There are also always believers. You cannot jail both.
- **Effects:** Succession +6, Loyalty -3, Treasury -5
- **Favor:** −5

---

### Beat 4 — Day 187 — Ashford's Shadow

**Character:** Nameless Prophet
**Note:** Ten days after [Great Houses](#the-great-houses-persistent-story) mid-arc (day 175–185). **Deferred from day 185** when Great Houses beat 9 fires. Callbacks `housesDeadCount`, `housesAlive*`, northern policy. **People** and **Nobility** effects allowed.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Lady Ashford measured your throat and the great houses took notes — I heard Kaspar accuse, Dell shriek, Crow bid, Raymond march, and Goose honk before the scaffold even warmed. I prophesy a house that bowed in public and plots in linen — or plots in the grave. Name the liar, or name yourself — winter returns either way.

**Prompt variant (`housesDeadCount` ≥ 1):** Your Majesty, I heard Morwen's rope found work. The living hate the living more efficiently when the dead are recent. I will rhyme their names in the market unless you buy silence.

**Prompt variant (`housesAliveAshford = false`):** Your Majesty, I heard Ashford fell in the dark. The east is a knife without a handle. Prophecy loves such moments.

**Prompt variant (`northernAllianceSigned`):** Your Majesty, I heard you signed Ingvar's charter. Ashford heard *foreign king* — when she still breathed. I will put that rhyme in every tavern unless you give me a better one.

**Choice 1:** Use the prophecy against a rival house — Ashford's game
- **Response:** Then you wield my tongue like a dagger. Flattering. Unworthy. Effective.
- **Effects:** Nobility -8, Succession +10, Loyalty +4
- **Favor:** +5
- **Sets flag:** `prophetAshfordOmen`

**Choice 2:** Denounce prophecy in the hall — kings are not omens
- **Response:** Brave words. Ashford will smile. The provinces will shrug. Winter keeps its calendar.
- **Effects:** Nobility +6, Loyalty -4, Church +4
- **Favor:** −10

**Choice 3:** Invite him to Ashford's table — let houses hear the same riddle
- **Response:** Dangerous theatre. I will speak in tongues they understand: debt, heirs, and hunger.
- **Effects:** Nobility -4, Loyalty +8, Treasury -6
- **Favor:** +12

---

### Beat 5 — Day 265 — The Knife in the Sermon

**Character:** Nameless Prophet
**Note:** Five days after Loyalty unlock (day 260). Foreshadows [Spy Knox day 278](#beat-15--day-278--leaks-to-the-north). Callbacks `northernTrust`, Knox, empty purse guard loyalty.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Loyalty is no longer a sermon — it is arithmetic. I heard Ingvar's gold and Knox's nets in the same sentence last month. I prophesy the knife that buys you dawn and the kiss that sells your maps. Do you hang the prophet who names traitors, or hang the traitors he names?

**Prompt variant (`northernTrust` ≤ −20):** Your Majesty, I heard the north owns your whispers. Prophecy is cheaper than spies. I offer both. Payment optional.

**Prompt variant (`emptyPurseOutcome = ghost_army` or `mercenary_throne`):** Your Majesty, I heard you paid mercenaries before household guards. Men who sell swords sell secrets. I name no names — yet.

**Prompt variant (`prophetSilenced` without lift):** Your Majesty, you tried to silence winter. Winter remembered. I name Knox anyway.

**Choice 1:** Let him name names in the square — mob justice
- **Response:** Then the square decides before your judges do. Fast. Filthy. Yours if you control the outcome.
- **Effects:** Loyalty -10, Army +6, Succession +8
- **Favor:** +10
- **Sets flag:** `prophetKnoxNamed` (Knox beat 278 variant unlocks)

**Choice 2:** Arrest him — only the crown names traitors
- **Response:** Then I become the martyr Malrik wanted and Cyrus could not make. Hang the voice, not the message.
- **Effects:** Church +8, Loyalty +5, Army -3
- **Favor:** −20
- **Sets flag:** `prophetSilenced`

**Choice 3:** Private audience — trade names for protection
- **Response:** Then we sin together in silence. I will point at Knox. You will point at whoever serves you least.
- **Effects:** Loyalty +8, Treasury -10, Succession +5
- **Favor:** +6

---

### Beat 6 — Day 325 — The Last Sign

**Character:** Nameless Prophet
**Note:** Five days after Succession unlock (day 320). Arc finale. **On load:** run [day 325 outcome priority](#prophets-winter--beat-resolution-rules) → `prophetOutcome`, `prophetArcPhase = resolved`. Prophet **reports** how the realm names your winter — player does not pick the ending. Northern finale is day 350.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt (outcome `voice_of_winter`):** Your Majesty, three hundred and twenty-five days since a blade made you king and winter made me your shadow. The streets call you the Winter King — not for cruelty, for listening. Malrik calls it heresy. The people call it the first honest reign. You crowned the omen. History will rhyme your name.

**Prompt (outcome `silenced_seer`):** Your Majesty, I heard ash and edicts where sermons once walked. The prophets go quiet. So do some hearts. You buried superstition — or tried. Order remains. Wonder does not.

**Prompt (outcome `saint_and_fox`):** Your Majesty, the fox still has shrines. You still have a crown. One of us will survive the chronicles. You chose absurd policy — therefore memorable. The court laughs. The provinces pray. Both serve you poorly and well.

**Prompt (outcome `omen_throne`):** Your Majesty, I heard you fought every omen until the realm learned fear. Fear keeps thrones — until it doesn't. You declared yourself the sign. Ashford pales. Malrik roars. A nephew in exile might pray. Bold blasphemy is still blasphemy.

**Prompt (outcome `ignored_winter`):** Your Majesty, I leave unnamed. Winter ends. What you built remains — for Ingvar to count on day three-fifty. Neither faith nor purge. The omen walks into spring without crown or scaffold.

**Choice 1:** I have heard the last sign — let the prophet go
- **Response (outcome `voice_of_winter`):** Then rule sermons and steel. Malrik will excommunicate the year. The people will remember rhymes.
- **Effects (outcome `voice_of_winter`):** Church -20, Loyalty +15, Succession -8, People +12
- **Response (outcome `silenced_seer`):** Then sleep without whispers. You bought quiet at a price you may not see yet.
- **Effects (outcome `silenced_seer`):** Church +12, Army +6, Loyalty -6
- **Response (outcome `saint_and_fox`):** Then regulate miracles. Absurd thrones last longer than sensible ones.
- **Effects (outcome `saint_and_fox`):** Loyalty +8, Church -8, Treasury -8, People +8
- **Response (outcome `omen_throne`):** Then wear the knife's theology. Heaven and earth will test the fit.
- **Effects (outcome `omen_throne`):** Succession +15, Church -15, Loyalty -10, Nobility -8
- **Response (outcome `ignored_winter`):** Then govern without omens. Ingvar still counts coin, not comets.
- **Effects (outcome `ignored_winter`):** Loyalty +3, Nobility +3, Succession +3

---

## Grey Lung Cure Arc (persistent story)

Multi-day story arc spanning days 25–340. Each beat replaces the random pool encounter on its scheduled day. All prompts are spoken by the listed character — never narrator text.

**Arc state (runtime):** `plagueFundingPath` (declined / deferred / partial / full / church_route), `plagueCureProgress` (0–100), `plagueScandalFlag` (bool), `plagueOutcome` (none / cured / slow_burn / failed / miracle / scandal)

**Suppressed pool encounters while arc is active:** Healer Mira plague one-shots (#72, #144, and duplicates in Late / People pools) — replaced by this arc.

**Beat schedule:**

| Day | Character | Beat |
|-----|-----------|------|
| 25 | Healer Mira | The Proposal |
| 38 | Healer Mira | First Results (branch by funding path) |
| 45 (optional) | Plague Doctor Odo | The rival formula (funded path only) |
| 52 | High Priest Malrik | Church intervention (branch by path) |
| 70 | General Rudolf or Healer Mira | Crisis (branch by progress / path) |
| 95 | Healer Mira or High Priest Malrik | Resolution |
| 130 | Ambassador Ingvar / Healer Mira / Old Advisor Edric | Political fallout |
| 200 | varies by outcome | The Echo |
| 340 | Healer Mira or Old Advisor Edric | Historical verdict |

**Possible endings:** The Physician King · The Slow Mercy · The Crown of Ash · God's Mercy · The Poisoned Cure

### Grey Lung — beat resolution rules

**Day 38:** `deferred` → deferred node · else `full`/`partial` → funded node · else `declined` → declined node.  
*(Deferred + Treasury &lt; 60 uses the declined prompt, not a silent skip.)*

**Day 45 (optional):** Only when `plagueFundingPath` is `full` or `partial`. Declined / church paths skip to day 52 — intentional.

**Day 52:** `declined` (still, after Beat 2 lock or refusal) → Holy Remedies · else → Bishop's Shadow (includes late reversals to `full`/`partial`).

**Day 70:** `church_route` → Church fraud (Mira) · else `plagueCureProgress` ≥ 50 → Rudolf crisis · else → Mira low-progress crisis.  
*(`church_route` always wins over progress. Late reversals start at progress 0 — they get the low-progress beat unless emergency funding on this beat raises progress.)*

**Day 95:** `plagueScandalFlag` → Scandal (Odo) · else `church_route` → Miracle (Malrik) · else `plagueCureProgress` ≥ 80 → Cured · else `plagueCureProgress` ≥ 40 → Slow burn · else → Failed.  
*(No Church ≥ 60 gate — `church_route` flag is set by player choice, not stat threshold.)*  
**Day 95 / day 340 finales:** Branch variant is chosen on load from arc state. Day 95 sets `plagueOutcome` and `plagueArcPhase = resolved`. Each variant is a **notification beat** — one acknowledgment choice. Day 340 reports year-end legacy for the already-set outcome. See [arc finale pattern](#arc-finale-pattern-all-persistent-arcs).

**Day 96:** If Grey Lung occupied day 95, [Prophet's Winter beat 2](#beat-2--day-95-or-96--the-fever-sermon) fires (no pool encounter).

**Day 130 / 200 / 340:** Use `plagueOutcome` set on day 95. **Fallback** if still `none` (edge case): treat as `slow_burn`.

**Late-reversal catch-up:** If path becomes `full` or `partial` only at Beat 2 declined choice 1 or Beat 3 declined choice 2, set `plagueCureProgress = 15` (missed Beat 2 funded beat) so the player can still reach `slow_burn` with strong Beat 4 choices.

**People stat before day 89:** Beat 4 Rudolf choice 2 lists People +10 for documentation; at implementation, bank as `pendingPeopleBonus` or apply to Loyalty +5 until People unlocks.

**Death before arc day:** If the run ends, arc state is irrelevant. No beat is skipped mid-arc while the run continues.

### Known gaps fixed in this document

| Gap | Fix |
|-----|-----|
| `church_route` + Church &lt; 60 → no Beat 5 | Miracle uses `church_route` flag only |
| `church_route` + high progress → Rudolf or Church Beat 4? | `church_route` wins on day 70 |
| Beat 6/7/8 missing `scandal` / `slow_burn` | Added below |
| Beat 7 missing `slow_burn` | Added below |
| Beat 8 missing `scandal` | Added below |
| Optional day 45 only on funded path | Documented as intentional skip |

---

### Beat 1 — Day 25 — The Proposal

**Character:** Healer Mira
**Note:** Replaces random encounter on day 25. Starts the Grey Lung arc (`plagueArcPhase = active`).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Grey Lung has returned in the southern ports — the same fever that hollowed Estedor under King Edwin. I have a physic's formula from the eastern courts: distilled willow bark, sulfur smoke, and a tincture that breaks the lung-cough. My apprentices can brew it within the month, but I need the crown's gold and your word that no priest will burn my stills as witchcraft.

**Choice 1:** Fund the cure in full
- **Response:** Then let the realm see a king who spends on breath, not banners. I will begin the distilleries tonight.
- **Effects:** Treasury -22, Health +8, Loyalty +3
- **Sets path:** `full`

**Choice 2:** Fund half — prove it works first
- **Response:** Half buys half a chance. I will not let the sick wait for your caution, but I will try.
- **Effects:** Treasury -12, Health +4
- **Sets path:** `partial`

**Choice 3:** The treasury cannot spare it
- **Response:** Then prepare your coffers for funeral candles instead of soldiers. I will do what I can without your coin.
- **Effects:** Church +5, Health -6, Loyalty -4
- **Sets path:** `declined`

**Choice 4:** Return in two weeks
- **Response:** Two weeks is a thousand coughs. I will count them for you, Majesty.
- **Effects:** Loyalty -2
- **Sets path:** `deferred`

---

### Beat 2 — Day 38 — First Results (funded: `full` or `partial`)

**Character:** Healer Mira
**Note:** Shown when `plagueFundingPath` is `full` or `partial`. Increases `plagueCureProgress`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the tincture works in the test wards — but slowly. Three patients who coughed blood on Sunday could speak full sentences by Thursday. To brew enough for the lower wards I need either more gold from your treasurer, or your permission to press conscripted laborers into the distilleries. I will not pretend this is a gentle request.

**Choice 1:** Pay for faster production
- **Response:** Then the sick will have bottles before the next moon. Borvin will hate me, but the wards will bless you.
- **Effects:** Treasury -15, Health +6, Loyalty +3
- **Progress:** +30

**Choice 2:** Use army labor in the distilleries
- **Response:** Soldiers smell of pitch and vinegar, but their hands are steady. Rudolf will call it humiliation. I call it survival.
- **Effects:** Army -8, Health +8, Loyalty +2
- **Progress:** +25

**Choice 3:** The formula is enough — be patient
- **Response:** Patience is a virtue for the healthy. I will stretch what we have and pray it reaches in time.
- **Effects:** Health +2
- **Progress:** +10

---

### Beat 2 — Day 38 — First Results (declined: `declined`)

**Character:** Healer Mira
**Note:** Shown when `plagueFundingPath` is `declined`.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the fever has crossed the river. I did not come to beg — I came to count. Forty dead in the lower wards this week, and the priests already call it judgment on the throne. You refused me once. Will you refuse the arithmetic as well?

**Choice 1:** You were right — fund the cure now
- **Response:** Late coin still buys breath. I will not shame you for changing your mind — only for how many died while you did.
- **Effects:** Treasury -25, Health +10, Loyalty +5
- **Sets path:** `full` (reversal)
- **Progress:** 15 (late-reversal catch-up)

**Choice 2:** Quarantine the lower wards
- **Response:** Walls keep the cough in and the hatred in with it. It may slow the fever. It will not slow the rumors.
- **Effects:** Army -5, Health +5, Loyalty -8

**Choice 3:** Stand by the refusal
- **Response:** Then record my words, Majesty: when the pyres smoke, do not ask why the people call you King of Ash.
- **Effects:** Church +8, Health -12, Loyalty -6
- **Locks path:** `declined`

---

### Beat 2 — Day 38 — First Results (deferred: `deferred`)

**Character:** Healer Mira
**Note:** Shown when `plagueFundingPath` is `deferred`. If Treasury ≥ 60, offers Beat 1 choices at Loyalty -3 penalty. If Treasury < 60, uses declined-branch text above.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, you asked for two weeks. I gave them. Twenty-seven dead in the lower wards while your treasurer counted coins. I am back — not to plead, but to learn whether a usurper can afford to save the realm he seized, or whether Estedor must burn twice.

**Choice 1:** Fund the cure in full — the wait is over
- **Response:** Then let the realm see a king who spends on breath, not banners. I will begin the distilleries tonight.
- **Effects:** Treasury -22, Health +8, Loyalty +1
- **Sets path:** `full`

**Choice 2:** Fund half — prove it works first
- **Response:** Half buys half a chance. At least you did not make me wait a third week.
- **Effects:** Treasury -12, Health +4, Loyalty -1
- **Sets path:** `partial`

**Choice 3:** The treasury still cannot spare it
- **Response:** Then prepare your coffers for funeral candles instead of soldiers.
- **Effects:** Church +5, Health -6, Loyalty -6
- **Sets path:** `declined`

---

### Beat 3 — Day 52 — The Bishop's Shadow (funded path)

**Character:** High Priest Malrik
**Note:** Shown when `plagueFundingPath` is `full`, `partial`, or reversed from decline. Fires 22 days after Church stat unlock (day 30).
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the faithful already whisper that your crown poisons souls with foreign physic. Healer Mira's tincture may break the cough, but it will not mend a realm that thinks its king trusts herbs more than heaven. Grant the Church stewardship of the cure, and the people will thank God — and perhaps forget the blade that put you here.

**Choice 1:** Medicine stays with Mira
- **Response:** Then let the sick thank the physic, and let the priests learn humility. I will not burn her stills — but I will not bless them either.
- **Effects:** Church -12, Health +5, Loyalty +4

**Choice 2:** Shared distribution — temples and wards together
- **Response:** A prudent compromise. The faithful see God's hand; the sick still swallow the tincture. Both may call it mercy.
- **Effects:** Church +8, Health +3, Treasury -5
- **Sets path:** `church_route` (soft)

**Choice 3:** Let the Church take the cure — peace is worth the cost
- **Response:** Then the miracle belongs to the altar, and Mira's name fades from the ledger. The realm will hear that heaven saved Estedor — not you.
- **Effects:** Church +15, Health -5, Loyalty -3
- **Sets path:** `church_route` (hard)

---

### Beat 3 — Day 52 — Holy Remedies (declined path)

**Character:** High Priest Malrik
**Note:** Shown when `plagueFundingPath` remains `declined` after Beat 2.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, you refused the physic and the fever climbs. My brothers offer what Mira cannot: relics, prayer, and holy water from the shrine of Saint Alaric. The people are frightened. If you will not buy eastern tinctures, will you at least let God try?

**Choice 1:** Accept holy remedies — we cannot afford physic
- **Response:** Then kneel with your subjects and pray. If the fever breaks, heaven receives the glory. If it does not, you will have no one left to blame.
- **Effects:** Church +18, Health -8
- **Sets path:** `church_route` (desperate)

**Choice 2:** Mira's last offer — fund the cure or lose her
- **Response:** A king who waits until the pyres smoke to buy mercy deserves the physic he refused. Fund her, or bury your pride with the dead.
- **Effects:** Treasury -20, Health +8, Church -5, Loyalty +4
- **Sets path:** `full` (late reversal)
- **Progress:** 15 (late-reversal catch-up)

**Choice 3:** Neither physic nor miracle — the crown waits
- **Response:** Then the realm will know its king trusts nothing: not gold, not God, not the breath of his people.
- **Effects:** Health -10, Church -8, Loyalty -10
- **Locks path:** `declined` (unchanged — still declined for Beat 4/5)

---

### Beat 4 — Day 70 — The Crisis (high progress: `plagueCureProgress` ≥ 50)

**Character:** General Rudolf
**Note:** Shown when cure progress is on track. Nobles hoarding doses; army barracks report sick soldiers.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, my men cough before battle. Mira's bottles reach the great houses first and the barracks last — if they reach them at all. Either the cure marches with the army, or the army marches on your throne. I do not make threats lightly. I make them when soldiers cannot draw breath.

**Choice 1:** Soldiers first — the army gets the cure
- **Response:** Then my men will remember who kept them breathing. The nobles will scream. Let them.
- **Effects:** Army +12, Nobility -10, Health +5, Loyalty +3

**Choice 2:** Common wards first — the people get the cure
- **Response:** Bread and breath win more loyalty than banners. My soldiers will curse you — until they stop coughing too.
- **Effects:** Loyalty +8, Army -8, Health +4
- **Note:** People +10 at implementation if day ≥ 89; else bank or apply as Loyalty +5 (People stat unlocks day 89)

**Choice 3:** Sell doses to nobles to refill the treasury
- **Response:** Gold in the coffers, fever in the barracks. I hope your walls are stronger than your arithmetic.
- **Effects:** Treasury +15, Health -5, Nobility +10, Loyalty -12, Army -5

---

### Beat 4 — Day 70 — The Crisis (low progress or declined)

**Character:** Healer Mira
**Note:** Shown when `plagueCureProgress` < 50 or `declined` path locked. Capital outbreak — point of no return for failure ending.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the cough is in the palace kitchens and the guard barracks. I have patients on straw in the great hall. This is no longer a ward in the lower city — it is the capital itself. Either you find the gold you denied me, or you find the men to wall off half your city before the court catches what the commons have.

**Choice 1:** Emergency funding — whatever it costs
- **Response:** Too late for elegance, but not too late for breath. Give me the coin and stand clear of my tables.
- **Effects:** Treasury -30, Health +15, Loyalty +5
- **Progress:** +40

**Choice 2:** Fire-quarantine the infected quarter
- **Response:** Torches at the gates and screams behind the walls. It may slow the fever. It will not slow the songs they sing about you.
- **Effects:** Army -15, Health +8, Loyalty -15

**Choice 3:** It will burn itself out — do nothing
- **Response:** Then write my report for the chronicles: the usurper watched Estedor cough itself hollow and called it patience.
- **Effects:** Health -20, Loyalty -10
- **Locks outcome:** `failed`

---

### Beat 4 — Day 70 — The Crisis (`church_route`)

**Character:** Healer Mira
**Note:** Shown when `plagueFundingPath` is `church_route` (any variant). Malrik's distribution is failing in some wards.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the priests anoint the sick with holy water and call it cure. In two wards the coughing stopped. In four wards it worsened — because they were given blessed water instead of tincture. I will not stand in your chapel and call it fraud, but I will stand in your court and tell you: heaven is not brewing willow bark. Take the bottles back from Malrik, or bury more than sinners.

**Choice 1:** Return the cure to the physic — secular wards only
- **Response:** Then let the priests keep their miracles and I will keep my patients. Choose who lives by fact, not by sermon.
- **Effects:** Church -15, Health +10, Loyalty +5

**Choice 2:** Double the Church's share — the faithful must believe
- **Response:** Belief does not stop lung-cough. But it may stop riots. I wash my hands — you will need more than holy water for that.
- **Effects:** Church +12, Health -8, Loyalty -5

**Choice 3:** Split the city — church wards and physic wards
- **Response:** A kingdom divided by bottles and blessings. May you outlive the experiment, Majesty.
- **Effects:** Church +5, Health +2, Treasury -8

---

### Beat 5 — Day 95 — Resolution (outcome: `cured`)

**Character:** Healer Mira
**Note:** Shown when `plagueCureProgress` ≥ 80 and `plagueFundingPath` is not `church_route`. **On load:** set `plagueOutcome = cured`, `plagueArcPhase = resolved`. Mira **reports** victory — one acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the cough has broken. In the lower wards they shout your name without spitting — I did not think I would live to hear that under a usurper's reign. The formula holds. The chronicles will call you the king who saved breath. I will call you the king who paid for bottles when others paid for prayers.

**Choice 1:** I have heard the wards — dismiss the physic court
- **Response:** Then may the next plague find a crown that remembers the price of air.
- **Effects:** Loyalty +12, Health +5, Treasury -5

---

### Beat 5 — Day 95 — Resolution (outcome: `slow_burn`)

**Character:** Healer Mira
**Note:** Shown when `plagueCureProgress` is 40–79. **On load:** set `plagueOutcome = slow_burn`, `plagueArcPhase = resolved`. Mira **reports** the scarred verdict — one acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the fever fades — but not before it carved a scar across three provinces. We saved many. We buried more. I will not lie and call it triumph. The realm will call you the Scarred King — or the usurper who did enough. Both are true. Neither is comfort.

**Choice 1:** I have heard the dead counted — dismiss the physic court
- **Response:** Grief named aloud heals faster than grief denied. You counted the dead. That matters.
- **Effects:** Treasury -10, Loyalty +10, Health +3

---

### Beat 5 — Day 95 — Resolution (outcome: `failed`)

**Character:** Healer Mira
**Note:** Shown when `plagueCureProgress` &lt; 40 and not `church_route`, or `declined` locked through Beat 2 choice 3. **On load:** set `plagueOutcome = failed`, `plagueArcPhase = resolved`. Emergency funding on Beat 4 can raise progress above 40 — if so, use `slow_burn` or `cured` branch instead.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the pyres smoke day and night. Estedor burns twice — once under Edwin, once under you. I have no more bottles and no more patience for kings who count coins while lungs fill with blood. The survivors already name you King of Ash. I will not argue with them.

**Choice 1:** I have heard the pyres — dismiss the physic court
- **Response:** Then I say it once for the ledger: King of Ash, second of his name. Outlive it if you can.
- **Effects:** Church +10, Loyalty +5, Health -5

---

### Beat 5 — Day 95 — Resolution (outcome: `miracle`)

**Character:** High Priest Malrik
**Note:** Shown when `plagueFundingPath` is `church_route`. **On load:** set `plagueOutcome = miracle`, `plagueArcPhase = resolved`. Malrik **reports** heaven's verdict — one acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, God cured the realm. The fever broke where holy water fell and prayer did not cease. The people kneel — not to the blade that took the throne, but to the hand that held the chalice. The conclave will call you the anointed usurper. Mira will call it theatre. The faithful will call it salvation.

**Choice 1:** I have heard heaven's verdict — dismiss the chapter
- **Response:** Then kneel when I ask. Heaven owns part of this story now.
- **Effects:** Church +15, Loyalty +8, Health +3

---

### Beat 5 — Day 95 — Resolution (outcome: `scandal`)

**Character:** Plague Doctor Odo
**Note:** Shown when `plagueScandalFlag` is set (day 45 rival formula accepted). Takes priority over all other Beat 5 variants. **On load:** set `plagueOutcome = scandal`, `plagueArcPhase = resolved`. Odo **reports** the poisoned cure — one acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I warned you Mira's eastern tincture was not the only brew, nor the safest. Three wards took my mask-and-vinegar compound — the cough broke faster, but two men woke screaming and never slept again. The families knock with stones. The chronicles will call you the Mad King's Physic. I call you the king who chose haste.

**Choice 1:** I have heard the screaming wards — dismiss the physic court
- **Response:** Madness in the square is worse than fever in the ward. Remember I warned you.
- **Effects:** Treasury -15, Health +5, Loyalty +5

---

### Beat 6 — Day 130 — Political Fallout (outcome: `cured`)

**Character:** Ambassador Ingvar
**Note:** Northern princes want the formula.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the northern princes sent me with congratulations and a sharper question. Their ports sniff the wind from Estedor and want Mira's formula before Grey Lung crosses the mountains. Share it freely and earn allies. Sell it and earn coin. Refuse, and earn their suspicion at the worst possible season.

**Choice 1:** Share the formula — friendship before profit
- **Response:** Generous. The princes will call you a statesman. Borvin will call you a fool. Both may be right.
- **Effects:** Loyalty +8, Treasury -5, Health +3

**Choice 2:** Sell the formula — the treasury needs gold
- **Response:** Commerce, not charity. They will pay and resent you. A familiar diplomacy.
- **Effects:** Treasury +20, Loyalty -5

**Choice 3:** Refuse — Estedor's physic stays in Estedor
- **Response:** Then arm your borders. Fever travels faster than envoys, but suspicion travels faster still.
- **Effects:** Army +5, Loyalty -3

---

### Beat 6 — Day 130 — Political Fallout (outcome: `miracle`)

**Character:** Healer Mira
**Note:** Mira confronts church credit after miracle ending.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the square kneels to Malrik and his holy water. My distilleries still run at night — you know whose bottles broke the cough. I do not ask for statues. I ask whether the crown remembers who brewed the mercy the Church now sells with incense.

**Choice 1:** Publicly credit Mira — share the victory honestly
- **Response:** Then I will stand beside you, and let the priests choke on their hymns. Dangerous. Honest. Like you.
- **Effects:** Church -10, Loyalty +10, Health +3

**Choice 2:** Private thanks — gold, not glory
- **Response:** Gold I will take. Glory I would have earned. I will stay — for the sick, not for you.
- **Effects:** Treasury -12, Health +5, Loyalty +2

**Choice 3:** The Church won peace — let them have the story
- **Response:** Then I pack my stills and leave your court. The wards will find me. You will find Malrik.
- **Effects:** Church +8, Loyalty -8, Health -5

---

### Beat 6 — Day 130 — Political Fallout (outcome: `slow_burn`)

**Character:** Healer Mira
**Note:** Memorial demands after partial victory.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the survivors want a day to name their dead before the heralds shout victory. Three provinces scarred, and you have not yet spoken the count aloud. Give them a memorial, or give them silence — but know that silence also travels.

**Choice 1:** Grant a national day of mourning
- **Response:** Then the realm will know its king counts the dead as well as the living. That is rarer than cure.
- **Effects:** Loyalty +12, Treasury -8, People +5

**Choice 2:** Local vigils only — the crown cannot stop for grief
- **Response:** Cold. Practical. The people will bury their own and remember who did not come.
- **Effects:** Loyalty -6, Army +3

**Choice 3:** Turn mourning into tax relief for the worst provinces
- **Response:** Bread and remission — the oldest mercy. They will take it. They will still whisper the names.
- **Effects:** Treasury -15, Loyalty +8, People +8

---

### Beat 6 — Day 130 — Political Fallout (outcome: `failed`)

**Character:** Old Advisor Edric
**Note:** After catastrophic failure — can you survive the year?
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I have served three kings and buried two. The court whispers that Grey Lung will finish what the coup began. I do not bring comfort. I bring arithmetic: rebellions germinate in graveyards. Tell me whether you intend to outlive this fever, or merely outlast the next audit.

**Choice 1:** Marshal every resource — the crown fights to survive
- **Response:** Then stop counting coins and start counting breath. I will bring what counsel I have left.
- **Effects:** Treasury -10, Army +8, Health +5, Loyalty +3

**Choice 2:** Seek the Church's blessing — calm the terrified faithful
- **Response:** Incense will not empty the pyres. But frightened men kill kings before fevers do. A grim trade.
- **Effects:** Church +12, Loyalty +5, Health -3

**Choice 3:** If the realm wants a new king, let them try
- **Response:** Bold words. The graveyard is full of bold kings. I hope you are the exception.
- **Effects:** Army +5, Loyalty -10

---

### Beat 6 — Day 130 — Political Fallout (outcome: `scandal`)

**Character:** Treasurer Borvin
**Note:** After the mad-wards scandal — crown finances and reputation under scrutiny.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the scandal wards cost you more than bottles of tincture. Families demand compensation, Odo's creditors demand answers, and my ledgers demand a king who can still count. The realm will pay for madness one way or another. How do you want your treasury to bleed?

**Choice 1:** Open the coffers — pay every family and close the scandal wards
- **Response:** Expensive. Honest. The sort of choice that keeps a crown on your head — if anything still can.
- **Effects:** Treasury -25, Loyalty +8, Health +3

**Choice 2:** Fine Odo's estate and seize his stock
- **Response:** Blood from a stone, but stones crack. The families will call it justice. Odo will call it theft.
- **Effects:** Treasury +12, Loyalty -6, Health -3

**Choice 3:** Say the crown was misled — blame the physic, not the king
- **Response:** Cowardice dressed as policy. Cheap today. Priced in daggers tomorrow.
- **Effects:** Loyalty -12, Nobility -5, Treasury +5

---

### Beat 7 — Day 200 — The Echo (outcome: `cured`)

**Character:** Healer Mira
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the lower wards want a statue — not of a saint, not of a soldier, but of the king who funded the bottles. Vulgar, flattering, and politically useful. Borvin says it costs gold. I say it buys something rarer: a usurper remembered for breath instead of blood.

**Choice 1:** Fund the statue — let the people see their king
- **Response:** Then stand still long enough to be carved. Even usurpers may have one honest portrait.
- **Effects:** Treasury -10, Loyalty +10, People +5

**Choice 2:** Refuse vanity — fund another ward instead
- **Response:** Wiser. Stone does not cough. Living patients do.
- **Effects:** Treasury -8, Health +8, Loyalty +5

**Choice 3:** Put Malrik on the plinth instead — share the glory
- **Response:** You mock us both. I will take the ward. Let the priests take the stone.
- **Effects:** Church +8, Loyalty -3

---

### Beat 7 — Day 200 — The Echo (outcome: `failed`)

**Character:** Ambassador Ingvar
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the northern princes closed their mountain passes to Estedor caravans. They call it caution. I call it the smell of pyres carried on the wind. Your neighbors do not fear the usurper's blade anymore. They fear your cough.

**Choice 1:** Send physic and gold — reopen trade with proof of cure
- **Response:** Too late for pride. If you can prove the fever wanes, they may unlock the gates. May.
- **Effects:** Treasury -18, Health +5, Loyalty +3

**Choice 2:** Threaten reprisal if they keep the passes shut
- **Response:** Threaten a kingdom that wheezes? Their archers do not cough. Yours may.
- **Effects:** Army +8, Loyalty -8

**Choice 3:** Accept isolation — Estedor heals alone
- **Response:** Alone is how empires shrink. But it is how some kings survive the winter.
- **Effects:** Health +3, Treasury -5, Food -8

---

### Beat 7 — Day 200 — The Echo (outcome: `miracle`)

**Character:** High Priest Malrik
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the Holy See sends word: they would canonize the miracle of Estedor and name you its instrument on earth. A usurper anointed by Rome itself. Mira calls it theft. The faithful call it destiny. What shall I answer?

**Choice 1:** Accept canonization — let the Church crown the reign
- **Response:** Then kneel once more. The throne becomes altar. Your enemies lose their best argument.
- **Effects:** Church +18, Succession +10, Loyalty +5

**Choice 2:** Decline — the crown needs no foreign saints
- **Response:** Proud. The See will not forget. Neither will the peasants who saw holy water work.
- **Effects:** Church -8, Loyalty +5, Army +3

**Choice 3:** Propose Mira as the saint — honor the physic
- **Response:** You would make Rome choke on truth. I admire the impulse. I will not deliver the letter.
- **Effects:** Church -15, Loyalty +8, Health +3

---

### Beat 7 — Day 200 — The Echo (outcome: `scandal`)

**Character:** Executioner Morwen
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the mad wards produced three rioters who broke a tax collector's skull with a bedpan. The prisons are full and the families want blood for blood. I can hang rioters and quiet the square, or you can find another way to answer madness born from your physic.

**Choice 1:** Hang the rioters — order before sentiment
- **Response:** The scaffold creaks. The square goes quiet. Quiet is not the same as forgiven.
- **Effects:** Army +5, Loyalty -10, People -8

**Choice 2:** Pardon them — the crown caused this madness
- **Response:** Merciful. Dangerous. The collectors will arm themselves. The people will remember.
- **Effects:** Loyalty +10, People +8, Army -5

**Choice 3:** Fund asylums — house the mad instead of hanging them
- **Response:** Expensive mercy. The rioters live. The realm learns you count madness as your sin.
- **Effects:** Treasury -20, Loyalty +8, Health +5

---

### Beat 7 — Day 200 — The Echo (outcome: `slow_burn`)

**Character:** Monk Arvel
**Note:** Memorial processions in the scarred provinces.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I feed the poor at my monastery gate. Lately they speak of Grey Lung more than bread. The fever faded, but the grief did not. They ask whether the usurper who funded bottles will fund a name for their dead — or whether survival is the only mercy they will ever see.

**Choice 1:** Fund provincial memorials — let the dead be named
- **Response:** Then I will read their names aloud at my gate. That is more than most thrones offer.
- **Effects:** Treasury -12, Loyalty +10, People +5

**Choice 2:** Send Church prayers — Malrik's brothers will mourn for them
- **Response:** Prayers cost less than stone. The hungry will know which you chose.
- **Effects:** Church +8, Loyalty -3

**Choice 3:** Survival is mercy enough — the realm must move on
- **Response:** Then they will move on — and remember that you told them to.
- **Effects:** Loyalty -8, Army +3

---

### Beat 8 — Day 340 — Historical Verdict (outcome: `cured`)

**Character:** Healer Mira
**Note:** Near Succession stat unlock (day 320). **On load:** use existing `plagueOutcome` (must be `cured`). Sets nickname flag: *The Physician*. Mira **reports** year-end legacy — one acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the year turns and the cough is memory. When the chronicles write of your reign, they will begin with the fever — and end with breath restored. I buried patients and praised you in the same breath. The realm will call you the Physician King. I will not argue.

**Choice 1:** I have heard the legacy — dismiss the physic court
- **Response:** Then may the next plague find a crown that remembers the price of air.
- **Effects:** Loyalty +10, Health +5, Succession +8

---

### Beat 8 — Day 340 — Historical Verdict (outcome: `slow_burn`)

**Character:** Healer Mira
**Note:** **On load:** use existing `plagueOutcome` (must be `slow_burn`). Sets nickname flag: *The Scarred King*. One acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the year turns and the cough is memory — but scars remain in three provinces. The chronicles will not call it triumph. They will call it survival with a bill. The Scarred King. Honest. Unpopular. Like most truths worth keeping.

**Choice 1:** I have heard the legacy — dismiss the physic court
- **Response:** Survival is its own hymn. The dead may disagree.
- **Effects:** Loyalty +3, Army +3, Succession +5

---

### Beat 8 — Day 340 — Historical Verdict (outcome: `failed`)

**Character:** Old Advisor Edric
**Note:** **On load:** use existing `plagueOutcome` (must be `failed`). Sets nickname flag: *King of Ash*. Edric **reports** year-end legacy — one acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, I have served three kings and buried two. The year ends and the pyres still warm. When the realm names your reign, they will not begin with the coup — they will begin with the cough. They already call you King of Ash. I will not soften it.

**Choice 1:** I have heard the legacy — dismiss the court
- **Response:** Then outlive the name. Names are lighter than coffins, but they last longer.
- **Effects:** Loyalty -5, Army +8, Succession +5

---

### Beat 8 — Day 340 — Historical Verdict (outcome: `miracle`)

**Character:** High Priest Malrik
**Note:** **On load:** use existing `plagueOutcome` (must be `miracle`). Sets nickname flag: *The Anointed Usurper*. Malrik **reports** year-end legacy — one acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the year closes and heaven still owns the story. The people call you the king the saints saved. The soldiers call you the priest's puppet. The nobles call you useful. The See will write *anointed usurper*. Mira will not. History rarely pleases everyone.

**Choice 1:** I have heard heaven's ledger — dismiss the chapter
- **Response:** Then kneel when I ask. Heaven owns part of your memory now.
- **Effects:** Church +12, Succession +12, Loyalty +5

---

### Beat 8 — Day 340 — Historical Verdict (outcome: `scandal`)

**Character:** Healer Mira
**Note:** **On load:** use existing `plagueOutcome` (must be `scandal`). Sets nickname flag: *The Mad King's Physic*. Mira **reports** year-end legacy — one acknowledgment choice.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the year ends and men still wake screaming in the night. The cough broke, but something else broke with it. The chronicles will not speak of willow bark — they will speak of the cheaper brew and the king who chose haste. The Mad King's Physic. I still tend the wards. I still remember.

**Choice 1:** I have heard the legacy — dismiss the physic court
- **Response:** Too late for some. Not too late for the next ward. I will stay — not for you, for them.
- **Effects:** Health +8, Loyalty +5, Treasury -10

---

### Optional — Day 45 — The Rival Formula (funded path only)

**Character:** Plague Doctor Odo
**Note:** Optional branch between Beats 2 and 3. If player accepts, enables `scandal` outcome at Beat 5. If refused, no effect.
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Mira's eastern tincture is not the only brew that breaks lung-cough. My mask-and-vinegar compound uses local herbs — cheaper, faster, and untested on madmen. She will call me a charlatan. Borvin will call me a bargain. I call myself an honest physician of risk. Do you want speed, or do you want her sermons about eastern purity?

**Choice 1:** Use Odo's compound in two test wards
- **Response:** Fast and dangerous. If the men scream, remember you chose discount over caution.
- **Effects:** Treasury +5, Health +5
- **Enables:** `scandal` path

**Choice 2:** Stick with Mira's formula — no experiments on the sick
- **Response:** Wise. Boring. Expensive. The qualities of a king who may survive the year.
- **Effects:** Health +3, Loyalty +2

**Choice 3:** Fund both — let them compete
- **Response:** Science by rivalry. I like it. Mira will not. The sick may benefit — or pay.
- **Effects:** Treasury -10, Health +6
- **Enables:** `scandal` path (higher risk)

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
- **Response:** The North will hear and decide you share your sword with prayer.
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

**Choice 1:** Make the church the throne's official support.
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
- **Response:** Ink will save what blind prayer cannot.
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
- **Response:** Then the North will extend its hand. Cold, but open.
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
- **Response:** The feast will be hearty. The next day will be ordinary.
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
- **Response:** Thank you. The sick are glad when you treat them instead of telling them to endure.
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
- **Response:** A generous gesture. Or a dear request to remain silent.
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
- **Response:** Holy beer in the barracks. I have seen that lead to brawls.
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
**Note:** Pool slot on day 30 (Church unlock). **At runtime replaced by** [Crown Forfeit & Tithe War — Beat 1](#beat-1--day-30--the-verdict). Legacy one-node text preserved in encounters_en.das until `church_crown_arc.das` ships.
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
- **Response:** The feast will be hearty. The next day will be ordinary.
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

**Choice 3:** Punish them publicly.
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

_Days 90–174 (People stat unlock at day 89)_

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

**Prompt:** Months after the coup, the palace still holds strangers at the gates. I ask that the night watch be doubled. It's expensive, but you'll sleep longer.

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

**Prompt:** Your next decree will be remembered by the realm. It should be simple. Grace, tax or sword?

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

**Prompt:** People suffer not only in body, but also in fear. Allow churches to hold night services. Crowds will come to pray.

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

**Prompt:** A crowd gathered at the palace gates. They are not armed, but they demand bread and an answer: whether you still rule them, or the church does.

**Choice 1:** Go out to them in person.
- **Response:** A bold move. I'll post guards close, but not too noticeably.
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
- **Response:** They will be angry. But at least they'll be angry while alive.
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

**Choice 3:** Only dilute the officers' rations.
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

**Prompt:** Weapons still circulate in the lower districts months after the coup. If you collect them, it will become calmer. If not, every basement can become a fortress.

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

**Prompt:** Unburied bodies are still turning up in the lower streets. If they are not buried quickly, the city will become sick.

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

**Prompt:** Your Majesty, the kingdom cannot be saved by everyone at once. At this stage of your reign you must choose what matters most: bread, sword, treasury, or people's lives.

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
- **Response:** Living traitors are more useful than dead ones if you keep them in chains.
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

**Prompt:** The army holds the throne, but the throne feeds the army poorly. Introduce a military levy.

**Choice 1:** Introduce a fee for everyone.
- **Response:** The soldiers will be well fed. The rest are careful.
- **Effects:** People -15, Army +15, Treasury +25

**Choice 2:** Introduce a tax only from the rich.
- **Response:** Less gold, less anger. Acceptable.
- **Effects:** Army +8, Treasury +15

**Choice 3:** Refuse the army's demand.
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

**Choice 3:** The square must see the strength.
- **Response:** Then the square will also see broken ribs.
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
- **Response:** The food will be saved—if people don't then save themselves from the food.
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
- **Response:** The square will understand. Whether they will forgive is another question.
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

**Choice 1:** Protect the healer.
- **Response:** You are choosing water over preaching. The temple will notice this.
- **Effects:** People +15, Treasury -3

**Choice 2:** Make the healer apologize.
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

**Choice 1:** The healer speaks about water, the temple speaks about the soul.
- **Response:** The division is wise. If both sides remember their place.
- **Effects:** People +10, Treasury -3

**Choice 2:** The healer must speak more carefully.
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
- **Response:** The square will receive a lesson. Children are memories.
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

**Prompt:** The soldiers were brought to the monastery with fever. If we accept them, the poor will get sick. If not, the defenders of the throne will die.

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

**Choice 3:** A fast for the army too.
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

**Choice 1:** Feed the prisoners properly.
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
## Nobility Pool

_Days 175–259 (Nobility stat unlock at day 175). Loyalty and Succession effects must be 0._

### Encounter #252 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the eastern lords want a privy council seat before winter — or they will call your reign a merchant's coup.

**Choice 1:** Grant Ashford's cousin a seat.
- **Response:** Then blood buys silence. Efficient, if you can stomach the receipt.
- **Effects:** Treasury -12, Nobility +15

**Choice 2:** Offer a lesser title without council voice.
- **Response:** Half a crown for half a loyalty. They will negotiate louder tomorrow.
- **Effects:** Treasury -5, Nobility +8

**Choice 3:** Refuse — the throne names its own council.
- **Response:** Bold. The great houses will remember who refused insurance.
- **Effects:** People -5, Army +5, Nobility -12

---

### Encounter #253 — Merchant Selena

**Character:** Merchant Selena
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a marriage proposal arrived from the Dell house — land for legitimacy, and legitimacy for your usurper's name.

**Choice 1:** Accept the match.
- **Response:** Then ink binds blood. The realm sees a dynasty forming, not a blade.
- **Effects:** People +5, Treasury -8, Nobility +18

**Choice 2:** Counter with a trade charter instead.
- **Response:** Commerce instead of cousins. Cold, but cheaper.
- **Effects:** Treasury +10, Nobility +6, Food -3

**Choice 3:** Decline — I need no bride-price.
- **Response:** Pride keeps the crown light. The houses will call it arrogance.
- **Effects:** People -8, Nobility -10

---

### Encounter #254 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.

**Choice 1:** Pay for new heraldry.
- **Response:** Then your sigil flies before your name is safe. Vanity with purpose.
- **Effects:** Treasury -15, Nobility +12

**Choice 2:** Keep Edwin's crest and claim continuity.
- **Response:** Dangerous symbolism. The loyalists cheer; the coup soldiers frown.
- **Effects:** People -5, Church +5, Army -5, Nobility -8

**Choice 3:** Issue a plain banner — no history, no boast.
- **Response:** Modest. Boring. Sometimes survival wears grey.
- **Effects:** Army +3, Treasury +5, Nobility +3

---

### Encounter #255 — Captain Varn

**Character:** Captain Varn
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, landless lords camp outside the walls. They want estates from Edwin's confiscated holdings — or they will fund your enemies.

**Choice 1:** Grant eastern manors to loyal lords.
- **Response:** Land buys swords. The peasants on those manors will scream.
- **Effects:** People -10, Army +8, Treasury -10, Nobility +15, Food -5

**Choice 2:** Sell the estates at auction.
- **Response:** Gold now, grudges later. The treasury breathes.
- **Effects:** Treasury +20, Nobility -5

**Choice 3:** Refuse — crown land stays crown land.
- **Response:** Then the landless become dangerous. You chose principle over peace.
- **Effects:** People -5, Army -5, Treasury +5, Nobility -15

---

### Encounter #256 — General Rudolf

**Character:** General Rudolf
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.

**Choice 1:** Side with the guilds — cut noble tariffs.
- **Response:** Merchants cheer. Great houses plot. Gold flows faster.
- **Effects:** People +8, Treasury +12, Nobility -12, Food +5

**Choice 2:** Side with the nobles — tax the guild halls.
- **Response:** Blood applauds. Caravans detour. The purse swells.
- **Effects:** People -5, Treasury +15, Nobility +12, Food -8

**Choice 3:** Split the difference and anger everyone equally.
- **Response:** Fairness that satisfies no one. Remarkably stable, briefly.
- **Effects:** Treasury +5, Nobility +3

---

### Encounter #257 — Lady Ashford

**Character:** Lady Ashford
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.

**Choice 1:** Pay for silence.
- **Response:** Gold oils gossip. The story sleeps until someone hungrier wakes it.
- **Effects:** Treasury -18, Nobility +8

**Choice 2:** Publicly deny and punish the scribe.
- **Response:** Hard denial. The court believes you or pretends to.
- **Effects:** Church -5, Army +5, Nobility +5

**Choice 3:** Offer the baron a council post.
- **Response:** Ambition cures jealousy, sometimes. Expensive cure.
- **Effects:** People -3, Treasury -10, Nobility +12

---

### Encounter #258 — Lord Kaspar Vayne

**Character:** Lord Kaspar Vayne
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.

**Choice 1:** Restoration — Edwin's line failed the realm.
- **Response:** History becomes ally. Living Edwin loyalists become enemies.
- **Effects:** People -8, Nobility +10

**Choice 2:** Usurpation — honest ink.
- **Response:** Honest and humiliating. Future generations will judge plainly.
- **Effects:** People +5, Nobility -8

**Choice 3:** Omit judgment — let time decide.
- **Response:** Coward's wisdom. Scholars hate it. It often works.
- **Effects:** Nobility +3

---

### Encounter #259 — Baroness Yvette Crow

**Character:** Baroness Yvette Crow
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, eastern bankers offer a loan against next year's grain tax — if great houses co-sign. They want your word first.

**Choice 1:** Sign — let nobles co-sign after.
- **Response:** Debt chains crown to elite. Fast gold, slow leash.
- **Effects:** Treasury +25, Nobility +8, Food -5

**Choice 2:** Refuse foreign paper.
- **Response:** Independence tastes poor. The army may notice empty coffers.
- **Effects:** Army -5, Treasury -5, Nobility +5

**Choice 3:** Tax the bankers instead of borrowing.
- **Response:** Audacity. They will call it brigandage. Your purse calls it policy.
- **Effects:** Treasury +12, Nobility -5

---

### Encounter #260 — Countess Marianna Dell

**Character:** Countess Marianna Dell
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a young lord challenges your knight to a duel over an insult at feast. The court watches whether law or blood rules.

**Choice 1:** Allow the duel — noble custom stands.
- **Response:** Steel settles what words broke. The commons call it justice.
- **Effects:** People -5, Army +5, Nobility +10

**Choice 2:** Forbid duels — crown law above honor.
- **Response:** Order wins. Nobles whisper you fear their blades.
- **Effects:** People +5, Army -3, Nobility -8

**Choice 3:** Fine both houses and cancel the duel.
- **Response:** Mercantile peace. Both sides hate the arithmetic.
- **Effects:** Treasury +8, Nobility +3

---

### Encounter #261 — Chronicler Ilana

**Character:** Chronicler Ilana
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.

**Choice 1:** Grant the barony — buy recognition.
- **Response:** Land for legitimacy abroad. The eastern lords will riot.
- **Effects:** People -8, Army +5, Nobility +12

**Choice 2:** Refuse — recognition is not for sale.
- **Response:** Pride intact. Diplomacy colder. Soldiers may benefit.
- **Effects:** Army +8, Nobility -6

**Choice 3:** Offer trade rights instead of land.
- **Response:** Cheaper tribute. They will call it insult. It may hold.
- **Effects:** People +3, Treasury +8, Nobility +5

---

### Encounter #262 — Banker Dominic Salt

**Character:** Banker Dominic Salt
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.

**Choice 1:** Pay the feast — nobles must see splendor.
- **Response:** Full tables, empty purse. They toast your name tonight.
- **Effects:** Treasury -20, Nobility +15, Food -5

**Choice 2:** Serve a modest meal and explain austerity.
- **Response:** Thin soup, thick pride. Some lords will respect it.
- **Effects:** People +5, Treasury +5, Nobility -5, Food +5

**Choice 3:** Cancel the feast — send gifts instead.
- **Response:** Missed opportunity for alliances. Saved gold for soldiers.
- **Effects:** Army +5, Treasury +10, Nobility -8

---

### Encounter #263 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.

**Choice 1:** Revoke Crow's rights.
- **Response:** One house fed, one house furious. Forests do not vote.
- **Effects:** People -5, Army +10, Nobility +8

**Choice 2:** Uphold Crow's ancient charter.
- **Response:** Tradition wins. Vayne's mercenaries look elsewhere.
- **Effects:** Army -5, Nobility +10

**Choice 3:** Split the forest between both.
- **Response:** Nobody happy. Fewer poachers, more lawsuits.
- **Effects:** Treasury -5, Nobility +5

---

### Encounter #264 — Healer Mira

**Character:** Healer Mira
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.

**Choice 1:** Grant a title — buy quiet loyalty.
- **Response:** Cheap nobility. True claimants will notice.
- **Effects:** People -3, Treasury -8, Nobility +12

**Choice 2:** Refuse — only crown creates peers now.
- **Response:** Hard line. The petitioner's friends become whisperers.
- **Effects:** Army +3, Nobility -6

**Choice 3:** Exile him with gold.
- **Response:** Gone with gossip. Gold well spent, perhaps.
- **Effects:** Treasury -12, Nobility +5

---

### Encounter #265 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the mint master says counterfeit noble seals flood the markets — your face on false decrees.

**Choice 1:** Hang the forgers publicly.
- **Response:** Fear refreshes respect. Merchants tremble honestly.
- **Effects:** People -5, Army +5, Nobility +8

**Choice 2:** Recall all seals and reissue.
- **Response:** Expensive order. Forgery dies slowly, dies nonetheless.
- **Effects:** Treasury -15, Nobility +10

**Choice 3:** Ignore — decrees are verified by word not wax.
- **Response:** Lazy. Someone will test that theory with rebellion.
- **Effects:** Army -5, Treasury +5, Nobility -8

---

### Encounter #266 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ashford's envoy asks whether you will attend the eastern hunt — or be called too common for noble sport.

**Choice 1:** Attend the hunt — pay for the honor.
- **Response:** Sport buys gossip. You will hear useful things between boars.
- **Effects:** Treasury -12, Nobility +18

**Choice 2:** Send a proxy — keep the crown at court.
- **Response:** Practical snub. They will measure the proxy's rank.
- **Effects:** Treasury -5, Nobility +5

**Choice 3:** Decline — kings hunt rebels, not deer.
- **Response:** Insult dressed as principle. Army approves.
- **Effects:** Army +8, Nobility -10

---

### Encounter #267 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, two houses dispute a bride's dowry after the groom died in your levy. Both want the crown to judge.

**Choice 1:** Rule for the bride's house.
- **Response:** Mercy seen as weakness or justice, depending on the hall.
- **Effects:** People +5, Nobility +8

**Choice 2:** Rule for the groom's house — levy debt owed.
- **Response:** Hard law. Soldiers' families cheer.
- **Effects:** People -5, Army +5, Treasury +8, Nobility +5

**Choice 3:** Seize dowry for the treasury.
- **Response:** Everyone hates you equally. The purse smiles.
- **Effects:** Treasury +15, Nobility -12

---

### Encounter #268 — Merchant Selena

**Character:** Merchant Selena
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the eastern lords want a privy council seat before winter — or they will call your reign a merchant's coup.

**Choice 1:** Grant Ashford's cousin a seat.
- **Response:** Then blood buys silence. Efficient, if you can stomach the receipt.
- **Effects:** Treasury -12, Nobility +15

**Choice 2:** Offer a lesser title without council voice.
- **Response:** Half a crown for half a loyalty. They will negotiate louder tomorrow.
- **Effects:** Treasury -5, Nobility +8

**Choice 3:** Refuse — the throne names its own council.
- **Response:** Bold. The great houses will remember who refused insurance.
- **Effects:** People -5, Army +5, Nobility -12

---

### Encounter #269 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a marriage proposal arrived from the Dell house — land for legitimacy, and legitimacy for your usurper's name.

**Choice 1:** Accept the match.
- **Response:** Then ink binds blood. The realm sees a dynasty forming, not a blade.
- **Effects:** People +5, Treasury -8, Nobility +18

**Choice 2:** Counter with a trade charter instead.
- **Response:** Commerce instead of cousins. Cold, but cheaper.
- **Effects:** Treasury +10, Nobility +6, Food -3

**Choice 3:** Decline — I need no bride-price.
- **Response:** Pride keeps the crown light. The houses will call it arrogance.
- **Effects:** People -8, Nobility -10

---

### Encounter #270 — Captain Varn

**Character:** Captain Varn
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.

**Choice 1:** Pay for new heraldry.
- **Response:** Then your sigil flies before your name is safe. Vanity with purpose.
- **Effects:** Treasury -15, Nobility +12

**Choice 2:** Keep Edwin's crest and claim continuity.
- **Response:** Dangerous symbolism. The loyalists cheer; the coup soldiers frown.
- **Effects:** People -5, Church +5, Army -5, Nobility -8

**Choice 3:** Issue a plain banner — no history, no boast.
- **Response:** Modest. Boring. Sometimes survival wears grey.
- **Effects:** Army +3, Treasury +5, Nobility +3

---

### Encounter #271 — General Rudolf

**Character:** General Rudolf
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, landless lords camp outside the walls. They want estates from Edwin's confiscated holdings — or they will fund your enemies.

**Choice 1:** Grant eastern manors to loyal lords.
- **Response:** Land buys swords. The peasants on those manors will scream.
- **Effects:** People -10, Army +8, Treasury -10, Nobility +15, Food -5

**Choice 2:** Sell the estates at auction.
- **Response:** Gold now, grudges later. The treasury breathes.
- **Effects:** Treasury +20, Nobility -5

**Choice 3:** Refuse — crown land stays crown land.
- **Response:** Then the landless become dangerous. You chose principle over peace.
- **Effects:** People -5, Army -5, Treasury +5, Nobility -15

---

### Encounter #272 — Lady Ashford

**Character:** Lady Ashford
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.

**Choice 1:** Side with the guilds — cut noble tariffs.
- **Response:** Merchants cheer. Great houses plot. Gold flows faster.
- **Effects:** People +8, Treasury +12, Nobility -12, Food +5

**Choice 2:** Side with the nobles — tax the guild halls.
- **Response:** Blood applauds. Caravans detour. The purse swells.
- **Effects:** People -5, Treasury +15, Nobility +12, Food -8

**Choice 3:** Split the difference and anger everyone equally.
- **Response:** Fairness that satisfies no one. Remarkably stable, briefly.
- **Effects:** Treasury +5, Nobility +3

---

### Encounter #273 — Lord Kaspar Vayne

**Character:** Lord Kaspar Vayne
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.

**Choice 1:** Pay for silence.
- **Response:** Gold oils gossip. The story sleeps until someone hungrier wakes it.
- **Effects:** Treasury -18, Nobility +8

**Choice 2:** Publicly deny and punish the scribe.
- **Response:** Hard denial. The court believes you or pretends to.
- **Effects:** Church -5, Army +5, Nobility +5

**Choice 3:** Offer the baron a council post.
- **Response:** Ambition cures jealousy, sometimes. Expensive cure.
- **Effects:** People -3, Treasury -10, Nobility +12

---

### Encounter #274 — Baroness Yvette Crow

**Character:** Baroness Yvette Crow
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.

**Choice 1:** Restoration — Edwin's line failed the realm.
- **Response:** History becomes ally. Living Edwin loyalists become enemies.
- **Effects:** People -8, Nobility +10

**Choice 2:** Usurpation — honest ink.
- **Response:** Honest and humiliating. Future generations will judge plainly.
- **Effects:** People +5, Nobility -8

**Choice 3:** Omit judgment — let time decide.
- **Response:** Coward's wisdom. Scholars hate it. It often works.
- **Effects:** Nobility +3

---

### Encounter #275 — Countess Marianna Dell

**Character:** Countess Marianna Dell
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, eastern bankers offer a loan against next year's grain tax — if great houses co-sign. They want your word first.

**Choice 1:** Sign — let nobles co-sign after.
- **Response:** Debt chains crown to elite. Fast gold, slow leash.
- **Effects:** Treasury +25, Nobility +8, Food -5

**Choice 2:** Refuse foreign paper.
- **Response:** Independence tastes poor. The army may notice empty coffers.
- **Effects:** Army -5, Treasury -5, Nobility +5

**Choice 3:** Tax the bankers instead of borrowing.
- **Response:** Audacity. They will call it brigandage. Your purse calls it policy.
- **Effects:** Treasury +12, Nobility -5

---

### Encounter #276 — Chronicler Ilana

**Character:** Chronicler Ilana
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a young lord challenges your knight to a duel over an insult at feast. The court watches whether law or blood rules.

**Choice 1:** Allow the duel — noble custom stands.
- **Response:** Steel settles what words broke. The commons call it justice.
- **Effects:** People -5, Army +5, Nobility +10

**Choice 2:** Forbid duels — crown law above honor.
- **Response:** Order wins. Nobles whisper you fear their blades.
- **Effects:** People +5, Army -3, Nobility -8

**Choice 3:** Fine both houses and cancel the duel.
- **Response:** Mercantile peace. Both sides hate the arithmetic.
- **Effects:** Treasury +8, Nobility +3

---

### Encounter #277 — Banker Dominic Salt

**Character:** Banker Dominic Salt
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.

**Choice 1:** Grant the barony — buy recognition.
- **Response:** Land for legitimacy abroad. The eastern lords will riot.
- **Effects:** People -8, Army +5, Nobility +12

**Choice 2:** Refuse — recognition is not for sale.
- **Response:** Pride intact. Diplomacy colder. Soldiers may benefit.
- **Effects:** Army +8, Nobility -6

**Choice 3:** Offer trade rights instead of land.
- **Response:** Cheaper tribute. They will call it insult. It may hold.
- **Effects:** People +3, Treasury +8, Nobility +5

---

### Encounter #278 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.

**Choice 1:** Pay the feast — nobles must see splendor.
- **Response:** Full tables, empty purse. They toast your name tonight.
- **Effects:** Treasury -20, Nobility +15, Food -5

**Choice 2:** Serve a modest meal and explain austerity.
- **Response:** Thin soup, thick pride. Some lords will respect it.
- **Effects:** People +5, Treasury +5, Nobility -5, Food +5

**Choice 3:** Cancel the feast — send gifts instead.
- **Response:** Missed opportunity for alliances. Saved gold for soldiers.
- **Effects:** Army +5, Treasury +10, Nobility -8

---

### Encounter #279 — Healer Mira

**Character:** Healer Mira
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.

**Choice 1:** Revoke Crow's rights.
- **Response:** One house fed, one house furious. Forests do not vote.
- **Effects:** People -5, Army +10, Nobility +8

**Choice 2:** Uphold Crow's ancient charter.
- **Response:** Tradition wins. Vayne's mercenaries look elsewhere.
- **Effects:** Army -5, Nobility +10

**Choice 3:** Split the forest between both.
- **Response:** Nobody happy. Fewer poachers, more lawsuits.
- **Effects:** Treasury -5, Nobility +5

---

### Encounter #280 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.

**Choice 1:** Grant a title — buy quiet loyalty.
- **Response:** Cheap nobility. True claimants will notice.
- **Effects:** People -3, Treasury -8, Nobility +12

**Choice 2:** Refuse — only crown creates peers now.
- **Response:** Hard line. The petitioner's friends become whisperers.
- **Effects:** Army +3, Nobility -6

**Choice 3:** Exile him with gold.
- **Response:** Gone with gossip. Gold well spent, perhaps.
- **Effects:** Treasury -12, Nobility +5

---

### Encounter #281 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the mint master says counterfeit noble seals flood the markets — your face on false decrees.

**Choice 1:** Hang the forgers publicly.
- **Response:** Fear refreshes respect. Merchants tremble honestly.
- **Effects:** People -5, Army +5, Nobility +8

**Choice 2:** Recall all seals and reissue.
- **Response:** Expensive order. Forgery dies slowly, dies nonetheless.
- **Effects:** Treasury -15, Nobility +10

**Choice 3:** Ignore — decrees are verified by word not wax.
- **Response:** Lazy. Someone will test that theory with rebellion.
- **Effects:** Army -5, Treasury +5, Nobility -8

---

### Encounter #282 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ashford's envoy asks whether you will attend the eastern hunt — or be called too common for noble sport.

**Choice 1:** Attend the hunt — pay for the honor.
- **Response:** Sport buys gossip. You will hear useful things between boars.
- **Effects:** Treasury -12, Nobility +18

**Choice 2:** Send a proxy — keep the crown at court.
- **Response:** Practical snub. They will measure the proxy's rank.
- **Effects:** Treasury -5, Nobility +5

**Choice 3:** Decline — kings hunt rebels, not deer.
- **Response:** Insult dressed as principle. Army approves.
- **Effects:** Army +8, Nobility -10

---

### Encounter #283 — Merchant Selena

**Character:** Merchant Selena
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, two houses dispute a bride's dowry after the groom died in your levy. Both want the crown to judge.

**Choice 1:** Rule for the bride's house.
- **Response:** Mercy seen as weakness or justice, depending on the hall.
- **Effects:** People +5, Nobility +8

**Choice 2:** Rule for the groom's house — levy debt owed.
- **Response:** Hard law. Soldiers' families cheer.
- **Effects:** People -5, Army +5, Treasury +8, Nobility +5

**Choice 3:** Seize dowry for the treasury.
- **Response:** Everyone hates you equally. The purse smiles.
- **Effects:** Treasury +15, Nobility -12

---

### Encounter #284 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the eastern lords want a privy council seat before winter — or they will call your reign a merchant's coup.

**Choice 1:** Grant Ashford's cousin a seat.
- **Response:** Then blood buys silence. Efficient, if you can stomach the receipt.
- **Effects:** Treasury -12, Nobility +15

**Choice 2:** Offer a lesser title without council voice.
- **Response:** Half a crown for half a loyalty. They will negotiate louder tomorrow.
- **Effects:** Treasury -5, Nobility +8

**Choice 3:** Refuse — the throne names its own council.
- **Response:** Bold. The great houses will remember who refused insurance.
- **Effects:** People -5, Army +5, Nobility -12

---

### Encounter #285 — Captain Varn

**Character:** Captain Varn
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a marriage proposal arrived from the Dell house — land for legitimacy, and legitimacy for your usurper's name.

**Choice 1:** Accept the match.
- **Response:** Then ink binds blood. The realm sees a dynasty forming, not a blade.
- **Effects:** People +5, Treasury -8, Nobility +18

**Choice 2:** Counter with a trade charter instead.
- **Response:** Commerce instead of cousins. Cold, but cheaper.
- **Effects:** Treasury +10, Nobility +6, Food -3

**Choice 3:** Decline — I need no bride-price.
- **Response:** Pride keeps the crown light. The houses will call it arrogance.
- **Effects:** People -8, Nobility -10

---

### Encounter #286 — General Rudolf

**Character:** General Rudolf
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.

**Choice 1:** Pay for new heraldry.
- **Response:** Then your sigil flies before your name is safe. Vanity with purpose.
- **Effects:** Treasury -15, Nobility +12

**Choice 2:** Keep Edwin's crest and claim continuity.
- **Response:** Dangerous symbolism. The loyalists cheer; the coup soldiers frown.
- **Effects:** People -5, Church +5, Army -5, Nobility -8

**Choice 3:** Issue a plain banner — no history, no boast.
- **Response:** Modest. Boring. Sometimes survival wears grey.
- **Effects:** Army +3, Treasury +5, Nobility +3

---

### Encounter #287 — Lady Ashford

**Character:** Lady Ashford
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, landless lords camp outside the walls. They want estates from Edwin's confiscated holdings — or they will fund your enemies.

**Choice 1:** Grant eastern manors to loyal lords.
- **Response:** Land buys swords. The peasants on those manors will scream.
- **Effects:** People -10, Army +8, Treasury -10, Nobility +15, Food -5

**Choice 2:** Sell the estates at auction.
- **Response:** Gold now, grudges later. The treasury breathes.
- **Effects:** Treasury +20, Nobility -5

**Choice 3:** Refuse — crown land stays crown land.
- **Response:** Then the landless become dangerous. You chose principle over peace.
- **Effects:** People -5, Army -5, Treasury +5, Nobility -15

---

### Encounter #288 — Lord Kaspar Vayne

**Character:** Lord Kaspar Vayne
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.

**Choice 1:** Side with the guilds — cut noble tariffs.
- **Response:** Merchants cheer. Great houses plot. Gold flows faster.
- **Effects:** People +8, Treasury +12, Nobility -12, Food +5

**Choice 2:** Side with the nobles — tax the guild halls.
- **Response:** Blood applauds. Caravans detour. The purse swells.
- **Effects:** People -5, Treasury +15, Nobility +12, Food -8

**Choice 3:** Split the difference and anger everyone equally.
- **Response:** Fairness that satisfies no one. Remarkably stable, briefly.
- **Effects:** Treasury +5, Nobility +3

---

### Encounter #289 — Baroness Yvette Crow

**Character:** Baroness Yvette Crow
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.

**Choice 1:** Pay for silence.
- **Response:** Gold oils gossip. The story sleeps until someone hungrier wakes it.
- **Effects:** Treasury -18, Nobility +8

**Choice 2:** Publicly deny and punish the scribe.
- **Response:** Hard denial. The court believes you or pretends to.
- **Effects:** Church -5, Army +5, Nobility +5

**Choice 3:** Offer the baron a council post.
- **Response:** Ambition cures jealousy, sometimes. Expensive cure.
- **Effects:** People -3, Treasury -10, Nobility +12

---

### Encounter #290 — Countess Marianna Dell

**Character:** Countess Marianna Dell
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.

**Choice 1:** Restoration — Edwin's line failed the realm.
- **Response:** History becomes ally. Living Edwin loyalists become enemies.
- **Effects:** People -8, Nobility +10

**Choice 2:** Usurpation — honest ink.
- **Response:** Honest and humiliating. Future generations will judge plainly.
- **Effects:** People +5, Nobility -8

**Choice 3:** Omit judgment — let time decide.
- **Response:** Coward's wisdom. Scholars hate it. It often works.
- **Effects:** Nobility +3

---

### Encounter #291 — Chronicler Ilana

**Character:** Chronicler Ilana
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, eastern bankers offer a loan against next year's grain tax — if great houses co-sign. They want your word first.

**Choice 1:** Sign — let nobles co-sign after.
- **Response:** Debt chains crown to elite. Fast gold, slow leash.
- **Effects:** Treasury +25, Nobility +8, Food -5

**Choice 2:** Refuse foreign paper.
- **Response:** Independence tastes poor. The army may notice empty coffers.
- **Effects:** Army -5, Treasury -5, Nobility +5

**Choice 3:** Tax the bankers instead of borrowing.
- **Response:** Audacity. They will call it brigandage. Your purse calls it policy.
- **Effects:** Treasury +12, Nobility -5

---

### Encounter #292 — Banker Dominic Salt

**Character:** Banker Dominic Salt
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a young lord challenges your knight to a duel over an insult at feast. The court watches whether law or blood rules.

**Choice 1:** Allow the duel — noble custom stands.
- **Response:** Steel settles what words broke. The commons call it justice.
- **Effects:** People -5, Army +5, Nobility +10

**Choice 2:** Forbid duels — crown law above honor.
- **Response:** Order wins. Nobles whisper you fear their blades.
- **Effects:** People +5, Army -3, Nobility -8

**Choice 3:** Fine both houses and cancel the duel.
- **Response:** Mercantile peace. Both sides hate the arithmetic.
- **Effects:** Treasury +8, Nobility +3

---

### Encounter #293 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.

**Choice 1:** Grant the barony — buy recognition.
- **Response:** Land for legitimacy abroad. The eastern lords will riot.
- **Effects:** People -8, Army +5, Nobility +12

**Choice 2:** Refuse — recognition is not for sale.
- **Response:** Pride intact. Diplomacy colder. Soldiers may benefit.
- **Effects:** Army +8, Nobility -6

**Choice 3:** Offer trade rights instead of land.
- **Response:** Cheaper tribute. They will call it insult. It may hold.
- **Effects:** People +3, Treasury +8, Nobility +5

---

### Encounter #294 — Healer Mira

**Character:** Healer Mira
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.

**Choice 1:** Pay the feast — nobles must see splendor.
- **Response:** Full tables, empty purse. They toast your name tonight.
- **Effects:** Treasury -20, Nobility +15, Food -5

**Choice 2:** Serve a modest meal and explain austerity.
- **Response:** Thin soup, thick pride. Some lords will respect it.
- **Effects:** People +5, Treasury +5, Nobility -5, Food +5

**Choice 3:** Cancel the feast — send gifts instead.
- **Response:** Missed opportunity for alliances. Saved gold for soldiers.
- **Effects:** Army +5, Treasury +10, Nobility -8

---

### Encounter #295 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.

**Choice 1:** Revoke Crow's rights.
- **Response:** One house fed, one house furious. Forests do not vote.
- **Effects:** People -5, Army +10, Nobility +8

**Choice 2:** Uphold Crow's ancient charter.
- **Response:** Tradition wins. Vayne's mercenaries look elsewhere.
- **Effects:** Army -5, Nobility +10

**Choice 3:** Split the forest between both.
- **Response:** Nobody happy. Fewer poachers, more lawsuits.
- **Effects:** Treasury -5, Nobility +5

---

### Encounter #296 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.

**Choice 1:** Grant a title — buy quiet loyalty.
- **Response:** Cheap nobility. True claimants will notice.
- **Effects:** People -3, Treasury -8, Nobility +12

**Choice 2:** Refuse — only crown creates peers now.
- **Response:** Hard line. The petitioner's friends become whisperers.
- **Effects:** Army +3, Nobility -6

**Choice 3:** Exile him with gold.
- **Response:** Gone with gossip. Gold well spent, perhaps.
- **Effects:** Treasury -12, Nobility +5

---

### Encounter #297 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the mint master says counterfeit noble seals flood the markets — your face on false decrees.

**Choice 1:** Hang the forgers publicly.
- **Response:** Fear refreshes respect. Merchants tremble honestly.
- **Effects:** People -5, Army +5, Nobility +8

**Choice 2:** Recall all seals and reissue.
- **Response:** Expensive order. Forgery dies slowly, dies nonetheless.
- **Effects:** Treasury -15, Nobility +10

**Choice 3:** Ignore — decrees are verified by word not wax.
- **Response:** Lazy. Someone will test that theory with rebellion.
- **Effects:** Army -5, Treasury +5, Nobility -8

---

### Encounter #298 — Merchant Selena

**Character:** Merchant Selena
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ashford's envoy asks whether you will attend the eastern hunt — or be called too common for noble sport.

**Choice 1:** Attend the hunt — pay for the honor.
- **Response:** Sport buys gossip. You will hear useful things between boars.
- **Effects:** Treasury -12, Nobility +18

**Choice 2:** Send a proxy — keep the crown at court.
- **Response:** Practical snub. They will measure the proxy's rank.
- **Effects:** Treasury -5, Nobility +5

**Choice 3:** Decline — kings hunt rebels, not deer.
- **Response:** Insult dressed as principle. Army approves.
- **Effects:** Army +8, Nobility -10

---

### Encounter #299 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, two houses dispute a bride's dowry after the groom died in your levy. Both want the crown to judge.

**Choice 1:** Rule for the bride's house.
- **Response:** Mercy seen as weakness or justice, depending on the hall.
- **Effects:** People +5, Nobility +8

**Choice 2:** Rule for the groom's house — levy debt owed.
- **Response:** Hard law. Soldiers' families cheer.
- **Effects:** People -5, Army +5, Treasury +8, Nobility +5

**Choice 3:** Seize dowry for the treasury.
- **Response:** Everyone hates you equally. The purse smiles.
- **Effects:** Treasury +15, Nobility -12

---

### Encounter #300 — Captain Varn

**Character:** Captain Varn
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the eastern lords want a privy council seat before winter — or they will call your reign a merchant's coup.

**Choice 1:** Grant Ashford's cousin a seat.
- **Response:** Then blood buys silence. Efficient, if you can stomach the receipt.
- **Effects:** Treasury -12, Nobility +15

**Choice 2:** Offer a lesser title without council voice.
- **Response:** Half a crown for half a loyalty. They will negotiate louder tomorrow.
- **Effects:** Treasury -5, Nobility +8

**Choice 3:** Refuse — the throne names its own council.
- **Response:** Bold. The great houses will remember who refused insurance.
- **Effects:** People -5, Army +5, Nobility -12

---

### Encounter #301 — General Rudolf

**Character:** General Rudolf
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a marriage proposal arrived from the Dell house — land for legitimacy, and legitimacy for your usurper's name.

**Choice 1:** Accept the match.
- **Response:** Then ink binds blood. The realm sees a dynasty forming, not a blade.
- **Effects:** People +5, Treasury -8, Nobility +18

**Choice 2:** Counter with a trade charter instead.
- **Response:** Commerce instead of cousins. Cold, but cheaper.
- **Effects:** Treasury +10, Nobility +6, Food -3

**Choice 3:** Decline — I need no bride-price.
- **Response:** Pride keeps the crown light. The houses will call it arrogance.
- **Effects:** People -8, Nobility -10

---

### Encounter #302 — Lady Ashford

**Character:** Lady Ashford
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.

**Choice 1:** Pay for new heraldry.
- **Response:** Then your sigil flies before your name is safe. Vanity with purpose.
- **Effects:** Treasury -15, Nobility +12

**Choice 2:** Keep Edwin's crest and claim continuity.
- **Response:** Dangerous symbolism. The loyalists cheer; the coup soldiers frown.
- **Effects:** People -5, Church +5, Army -5, Nobility -8

**Choice 3:** Issue a plain banner — no history, no boast.
- **Response:** Modest. Boring. Sometimes survival wears grey.
- **Effects:** Army +3, Treasury +5, Nobility +3

---

### Encounter #303 — Lord Kaspar Vayne

**Character:** Lord Kaspar Vayne
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, landless lords camp outside the walls. They want estates from Edwin's confiscated holdings — or they will fund your enemies.

**Choice 1:** Grant eastern manors to loyal lords.
- **Response:** Land buys swords. The peasants on those manors will scream.
- **Effects:** People -10, Army +8, Treasury -10, Nobility +15, Food -5

**Choice 2:** Sell the estates at auction.
- **Response:** Gold now, grudges later. The treasury breathes.
- **Effects:** Treasury +20, Nobility -5

**Choice 3:** Refuse — crown land stays crown land.
- **Response:** Then the landless become dangerous. You chose principle over peace.
- **Effects:** People -5, Army -5, Treasury +5, Nobility -15

---

### Encounter #304 — Baroness Yvette Crow

**Character:** Baroness Yvette Crow
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.

**Choice 1:** Side with the guilds — cut noble tariffs.
- **Response:** Merchants cheer. Great houses plot. Gold flows faster.
- **Effects:** People +8, Treasury +12, Nobility -12, Food +5

**Choice 2:** Side with the nobles — tax the guild halls.
- **Response:** Blood applauds. Caravans detour. The purse swells.
- **Effects:** People -5, Treasury +15, Nobility +12, Food -8

**Choice 3:** Split the difference and anger everyone equally.
- **Response:** Fairness that satisfies no one. Remarkably stable, briefly.
- **Effects:** Treasury +5, Nobility +3

---

### Encounter #305 — Countess Marianna Dell

**Character:** Countess Marianna Dell
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.

**Choice 1:** Pay for silence.
- **Response:** Gold oils gossip. The story sleeps until someone hungrier wakes it.
- **Effects:** Treasury -18, Nobility +8

**Choice 2:** Publicly deny and punish the scribe.
- **Response:** Hard denial. The court believes you or pretends to.
- **Effects:** Church -5, Army +5, Nobility +5

**Choice 3:** Offer the baron a council post.
- **Response:** Ambition cures jealousy, sometimes. Expensive cure.
- **Effects:** People -3, Treasury -10, Nobility +12

---

### Encounter #306 — Chronicler Ilana

**Character:** Chronicler Ilana
**Pool:** Nobility | **Era:** days 175–259
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.

**Choice 1:** Restoration — Edwin's line failed the realm.
- **Response:** History becomes ally. Living Edwin loyalists become enemies.
- **Effects:** People -8, Nobility +10

**Choice 2:** Usurpation — honest ink.
- **Response:** Honest and humiliating. Future generations will judge plainly.
- **Effects:** People +5, Nobility -8

**Choice 3:** Omit judgment — let time decide.
- **Response:** Coward's wisdom. Scholars hate it. It often works.
- **Effects:** Nobility +3

---

## Loyalty Pool

_Days 260–319 (Loyalty stat unlock at day 260). Succession effects must be 0._

### Encounter #307 — Captain Varn

**Character:** Captain Varn
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.

**Choice 1:** Double the loyalty oath at muster.
- **Response:** Words bind some. Others count coins.
- **Effects:** Army +12, Treasury -8, Loyalty +10

**Choice 2:** Pay a bonus from the privy purse.
- **Response:** Gold buys silence in steel. Brief silence.
- **Effects:** Army +15, Treasury -15, Loyalty +8

**Choice 3:** Hang one rumormonger as example.
- **Response:** Fear works. The rest salute louder.
- **Effects:** People -8, Army +8, Loyalty +5

---

### Encounter #308 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.

**Choice 1:** Protect her and investigate quietly.
- **Response:** Patience catches rats. The court sweats politely.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2:** Pay her and forget the names.
- **Response:** Cheap insurance. Dangerous if she talks twice.
- **Effects:** Treasury -10, Loyalty +5

**Choice 3:** Dismiss her — servants' gossip is wind.
- **Response:** Blind spot chosen. Someone will use it.
- **Effects:** Treasury +5, Loyalty -10

---

### Encounter #309 — General Rudolf

**Character:** General Rudolf
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.

**Choice 1:** Buy the list and purge the clerks.
- **Response:** Efficient treachery. The court learns you purchase truth.
- **Effects:** Treasury -12, Loyalty +15

**Choice 2:** Arrest the spy and ignore the list.
- **Response:** Principle over intelligence. Loyal fools remain hidden.
- **Effects:** Army +5, Loyalty +5

**Choice 3:** Buy the list but spare the clerks — watch them.
- **Response:** Soft trap. They will know. They may behave.
- **Effects:** Treasury -8, Loyalty +10

---

### Encounter #310 — Executioner Morwen

**Character:** Executioner Morwen
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.

**Choice 1:** Execute the ringleaders only.
- **Response:** Surgical fear. Mercy seen in the survivors.
- **Effects:** People -5, Army +5, Loyalty +8

**Choice 2:** Mass pardon for oaths, not for treason.
- **Response:** Generous line-drawing. Purists will call it chaos.
- **Effects:** People +8, Army -5, Loyalty +10

**Choice 3:** Empty cells into the levy — choice or rope.
- **Response:** Brutal recruitment. Army swells, loyalty questionable.
- **Effects:** People -10, Army +15, Loyalty -5

---

### Encounter #311 — Cook Gromm

**Character:** Cook Gromm
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.

**Choice 1:** Grant leave — trust the guard rotation.
- **Response:** Humanity costs risk. The court notes your nerve.
- **Effects:** Army -3, Loyalty +8

**Choice 2:** Refuse — the crown's safety first.
- **Response:** Safe and cruel. She will remember.
- **Effects:** Army +5, Loyalty -8

**Choice 3:** Send her with pay and a replacement.
- **Response:** Gold softens refusal. Professional solution.
- **Effects:** Army +3, Treasury -8, Loyalty +5

---

### Encounter #312 — Spy Knox

**Character:** Spy Knox
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.

**Choice 1:** Let the monk feed who he chooses.
- **Response:** Charity buys whispers of mercy. Malrik frowns.
- **Effects:** People +10, Church -5, Health +5, Loyalty +8, Food -5

**Choice 2:** Arrest Edwin's sympathizers.
- **Response:** Hard crown. Safer throne. Hungrier streets.
- **Effects:** People -12, Church +5, Army +5, Loyalty +5

**Choice 3:** Tax the soup kitchen — crown shares the virtue.
- **Response:** Cynical. Surprisingly effective accounting.
- **Effects:** Treasury +8, Loyalty +3, Food -3

---

### Encounter #313 — Bodyguard Raena

**Character:** Bodyguard Raena
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.

**Choice 1:** Hang the clerks, spare the treasurer.
- **Response:** Scapegoats die. The court learns the price of theft.
- **Effects:** Treasury +5, Loyalty +10

**Choice 2:** Dismiss the treasurer and reform the office.
- **Response:** Clean house. Expensive honesty.
- **Effects:** Treasury -10, Loyalty +12

**Choice 3:** Take a cut and regulate the bribes.
- **Response:** Corruption with a ledger. Loyalty has a tariff now.
- **Effects:** People -5, Treasury +15, Loyalty -5

---

### Encounter #314 — Sir Otto the Silent

**Character:** Sir Otto the Silent
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the silent knight has not spoken in years — today he writes that your chamberlain plots with Ingvar's clerks.

**Choice 1:** Arrest the chamberlain immediately.
- **Response:** Swift stroke. If wrong, you have made a martyr.
- **Effects:** Army +5, Loyalty +8

**Choice 2:** Watch quietly for proof.
- **Response:** Patience. The plot may deepen into visibility.
- **Effects:** Treasury -5, Loyalty +10

**Choice 3:** Confront Ingvar publicly.
- **Response:** Drama. Diplomacy suffers; truth may surface.
- **Effects:** Army +3, Loyalty +5

---

### Encounter #315 — Maid Lissa

**Character:** Maid Lissa
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.

**Choice 1:** Seal every scriptorium door and investigate.
- **Response:** Paranoia with cause. Work slows; traitors sweat.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2:** Execute the junior scribe as warning.
- **Response:** Fast justice. The guilty may remain.
- **Effects:** People -5, Army +3, Loyalty +5

**Choice 3:** Issue a new decree confirming the true text.
- **Response:** Ink fights ink. The realm reads confusion.
- **Effects:** Loyalty +8

---

### Encounter #316 — Royal Scribe Osric

**Character:** Royal Scribe Osric
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.

**Choice 1:** Free the prisoner — reward the cook's honesty.
- **Response:** Mercy visible. Plotters may test your softness.
- **Effects:** People +5, Loyalty +10, Food +3

**Choice 2:** Interrogate the prisoner privately.
- **Response:** Information first. Justice later, maybe.
- **Effects:** Treasury -3, Loyalty +8

**Choice 3:** Punish the cook for meddling.
- **Response:** Message sent: look away. Loyalty bought with fear.
- **Effects:** People -5, Army +3, Loyalty -8, Food -5

---

### Encounter #317 — Healer Mira

**Character:** Healer Mira
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.

**Choice 1:** Accept — a second blade in the shadows.
- **Response:** Personal power grows. The army notices.
- **Effects:** Army -8, Treasury -10, Loyalty +15

**Choice 2:** Refuse — one army, one loyalty.
- **Response:** Unity preserved. Personal risk remains.
- **Effects:** Army +8, Loyalty +5

**Choice 3:** Expose the offer to Rudolf publicly.
- **Response:** Transparency as weapon. He may respect or resent it.
- **Effects:** Army +5, Loyalty +8

---

### Encounter #318 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.

**Choice 1:** Treat him — hunger explains, not excuses.
- **Response:** Mercy noted. Guards debate your softness.
- **Effects:** People +5, Army +5, Health +8, Loyalty +8

**Choice 2:** Turn him over to Varn for discipline.
- **Response:** Order restored. Fear refreshed.
- **Effects:** People -3, Army +8, Loyalty +10

**Choice 3:** Dismiss him without treatment or pay.
- **Response:** Harsh lesson. The barracks will remember.
- **Effects:** People -5, Army -5, Treasury +5, Loyalty +5

---

### Encounter #319 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.

**Choice 1:** Accept church reports on disloyalty.
- **Response:** Faith becomes spy. Loyalty measurable, humiliating.
- **Effects:** Church +12, Loyalty +10

**Choice 2:** Refuse — crown does not buy souls' ledgers.
- **Response:** Independence declared. Blind spots remain.
- **Effects:** Church -8, Loyalty +5

**Choice 3:** Demand public oaths instead of secrets.
- **Response:** Theatre of loyalty. Some will mean it.
- **Effects:** Church +5, Army +5, Loyalty +8

---

### Encounter #320 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?

**Choice 1:** Arrest the officers.
- **Response:** Discipline restored. Resentment bottled.
- **Effects:** People -5, Army +10, Loyalty +8

**Choice 2:** Ignore — drunk nostalgia is not rebellion.
- **Response:** Risk accepted. Cheap peace tonight.
- **Effects:** Army -3, Loyalty +5

**Choice 3:** Buy the next round in the crown's name.
- **Response:** Bold charm. They toast you before midnight.
- **Effects:** Army +8, Treasury -8, Loyalty +12

---

### Encounter #321 — Merchant Selena

**Character:** Merchant Selena
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a chambermaid refuses to change the sheets in the guest wing — she says the lord there plotted against you at feast.

**Choice 1:** Reward her refusal — investigate the lord.
- **Response:** Servants as eyes. Nobles as enemies.
- **Effects:** Treasury -5, Loyalty +10, Nobility +5

**Choice 2:** Order her to obey or leave service.
- **Response:** Hierarchy enforced. Useful warning silenced.
- **Effects:** Army +3, Loyalty -5

**Choice 3:** Move the lord to lesser quarters quietly.
- **Response:** Subtle punishment. He will understand.
- **Effects:** Loyalty +8, Nobility +3

---

### Encounter #322 — Captain Varn

**Character:** Captain Varn
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.

**Choice 1:** Double the loyalty oath at muster.
- **Response:** Words bind some. Others count coins.
- **Effects:** Army +12, Treasury -8, Loyalty +10

**Choice 2:** Pay a bonus from the privy purse.
- **Response:** Gold buys silence in steel. Brief silence.
- **Effects:** Army +15, Treasury -15, Loyalty +8

**Choice 3:** Hang one rumormonger as example.
- **Response:** Fear works. The rest salute louder.
- **Effects:** People -8, Army +8, Loyalty +5

---

### Encounter #323 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.

**Choice 1:** Protect her and investigate quietly.
- **Response:** Patience catches rats. The court sweats politely.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2:** Pay her and forget the names.
- **Response:** Cheap insurance. Dangerous if she talks twice.
- **Effects:** Treasury -10, Loyalty +5

**Choice 3:** Dismiss her — servants' gossip is wind.
- **Response:** Blind spot chosen. Someone will use it.
- **Effects:** Treasury +5, Loyalty -10

---

### Encounter #324 — General Rudolf

**Character:** General Rudolf
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.

**Choice 1:** Buy the list and purge the clerks.
- **Response:** Efficient treachery. The court learns you purchase truth.
- **Effects:** Treasury -12, Loyalty +15

**Choice 2:** Arrest the spy and ignore the list.
- **Response:** Principle over intelligence. Loyal fools remain hidden.
- **Effects:** Army +5, Loyalty +5

**Choice 3:** Buy the list but spare the clerks — watch them.
- **Response:** Soft trap. They will know. They may behave.
- **Effects:** Treasury -8, Loyalty +10

---

### Encounter #325 — Executioner Morwen

**Character:** Executioner Morwen
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.

**Choice 1:** Execute the ringleaders only.
- **Response:** Surgical fear. Mercy seen in the survivors.
- **Effects:** People -5, Army +5, Loyalty +8

**Choice 2:** Mass pardon for oaths, not for treason.
- **Response:** Generous line-drawing. Purists will call it chaos.
- **Effects:** People +8, Army -5, Loyalty +10

**Choice 3:** Empty cells into the levy — choice or rope.
- **Response:** Brutal recruitment. Army swells, loyalty questionable.
- **Effects:** People -10, Army +15, Loyalty -5

---

### Encounter #326 — Cook Gromm

**Character:** Cook Gromm
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.

**Choice 1:** Grant leave — trust the guard rotation.
- **Response:** Humanity costs risk. The court notes your nerve.
- **Effects:** Army -3, Loyalty +8

**Choice 2:** Refuse — the crown's safety first.
- **Response:** Safe and cruel. She will remember.
- **Effects:** Army +5, Loyalty -8

**Choice 3:** Send her with pay and a replacement.
- **Response:** Gold softens refusal. Professional solution.
- **Effects:** Army +3, Treasury -8, Loyalty +5

---

### Encounter #327 — Spy Knox

**Character:** Spy Knox
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.

**Choice 1:** Let the monk feed who he chooses.
- **Response:** Charity buys whispers of mercy. Malrik frowns.
- **Effects:** People +10, Church -5, Health +5, Loyalty +8, Food -5

**Choice 2:** Arrest Edwin's sympathizers.
- **Response:** Hard crown. Safer throne. Hungrier streets.
- **Effects:** People -12, Church +5, Army +5, Loyalty +5

**Choice 3:** Tax the soup kitchen — crown shares the virtue.
- **Response:** Cynical. Surprisingly effective accounting.
- **Effects:** Treasury +8, Loyalty +3, Food -3

---

### Encounter #328 — Bodyguard Raena

**Character:** Bodyguard Raena
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.

**Choice 1:** Hang the clerks, spare the treasurer.
- **Response:** Scapegoats die. The court learns the price of theft.
- **Effects:** Treasury +5, Loyalty +10

**Choice 2:** Dismiss the treasurer and reform the office.
- **Response:** Clean house. Expensive honesty.
- **Effects:** Treasury -10, Loyalty +12

**Choice 3:** Take a cut and regulate the bribes.
- **Response:** Corruption with a ledger. Loyalty has a tariff now.
- **Effects:** People -5, Treasury +15, Loyalty -5

---

### Encounter #329 — Sir Otto the Silent

**Character:** Sir Otto the Silent
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the silent knight has not spoken in years — today he writes that your chamberlain plots with Ingvar's clerks.

**Choice 1:** Arrest the chamberlain immediately.
- **Response:** Swift stroke. If wrong, you have made a martyr.
- **Effects:** Army +5, Loyalty +8

**Choice 2:** Watch quietly for proof.
- **Response:** Patience. The plot may deepen into visibility.
- **Effects:** Treasury -5, Loyalty +10

**Choice 3:** Confront Ingvar publicly.
- **Response:** Drama. Diplomacy suffers; truth may surface.
- **Effects:** Army +3, Loyalty +5

---

### Encounter #330 — Maid Lissa

**Character:** Maid Lissa
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.

**Choice 1:** Seal every scriptorium door and investigate.
- **Response:** Paranoia with cause. Work slows; traitors sweat.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2:** Execute the junior scribe as warning.
- **Response:** Fast justice. The guilty may remain.
- **Effects:** People -5, Army +3, Loyalty +5

**Choice 3:** Issue a new decree confirming the true text.
- **Response:** Ink fights ink. The realm reads confusion.
- **Effects:** Loyalty +8

---

### Encounter #331 — Royal Scribe Osric

**Character:** Royal Scribe Osric
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.

**Choice 1:** Free the prisoner — reward the cook's honesty.
- **Response:** Mercy visible. Plotters may test your softness.
- **Effects:** People +5, Loyalty +10, Food +3

**Choice 2:** Interrogate the prisoner privately.
- **Response:** Information first. Justice later, maybe.
- **Effects:** Treasury -3, Loyalty +8

**Choice 3:** Punish the cook for meddling.
- **Response:** Message sent: look away. Loyalty bought with fear.
- **Effects:** People -5, Army +3, Loyalty -8, Food -5

---

### Encounter #332 — Healer Mira

**Character:** Healer Mira
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.

**Choice 1:** Accept — a second blade in the shadows.
- **Response:** Personal power grows. The army notices.
- **Effects:** Army -8, Treasury -10, Loyalty +15

**Choice 2:** Refuse — one army, one loyalty.
- **Response:** Unity preserved. Personal risk remains.
- **Effects:** Army +8, Loyalty +5

**Choice 3:** Expose the offer to Rudolf publicly.
- **Response:** Transparency as weapon. He may respect or resent it.
- **Effects:** Army +5, Loyalty +8

---

### Encounter #333 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.

**Choice 1:** Treat him — hunger explains, not excuses.
- **Response:** Mercy noted. Guards debate your softness.
- **Effects:** People +5, Army +5, Health +8, Loyalty +8

**Choice 2:** Turn him over to Varn for discipline.
- **Response:** Order restored. Fear refreshed.
- **Effects:** People -3, Army +8, Loyalty +10

**Choice 3:** Dismiss him without treatment or pay.
- **Response:** Harsh lesson. The barracks will remember.
- **Effects:** People -5, Army -5, Treasury +5, Loyalty +5

---

### Encounter #334 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.

**Choice 1:** Accept church reports on disloyalty.
- **Response:** Faith becomes spy. Loyalty measurable, humiliating.
- **Effects:** Church +12, Loyalty +10

**Choice 2:** Refuse — crown does not buy souls' ledgers.
- **Response:** Independence declared. Blind spots remain.
- **Effects:** Church -8, Loyalty +5

**Choice 3:** Demand public oaths instead of secrets.
- **Response:** Theatre of loyalty. Some will mean it.
- **Effects:** Church +5, Army +5, Loyalty +8

---

### Encounter #335 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?

**Choice 1:** Arrest the officers.
- **Response:** Discipline restored. Resentment bottled.
- **Effects:** People -5, Army +10, Loyalty +8

**Choice 2:** Ignore — drunk nostalgia is not rebellion.
- **Response:** Risk accepted. Cheap peace tonight.
- **Effects:** Army -3, Loyalty +5

**Choice 3:** Buy the next round in the crown's name.
- **Response:** Bold charm. They toast you before midnight.
- **Effects:** Army +8, Treasury -8, Loyalty +12

---

### Encounter #336 — Merchant Selena

**Character:** Merchant Selena
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a chambermaid refuses to change the sheets in the guest wing — she says the lord there plotted against you at feast.

**Choice 1:** Reward her refusal — investigate the lord.
- **Response:** Servants as eyes. Nobles as enemies.
- **Effects:** Treasury -5, Loyalty +10, Nobility +5

**Choice 2:** Order her to obey or leave service.
- **Response:** Hierarchy enforced. Useful warning silenced.
- **Effects:** Army +3, Loyalty -5

**Choice 3:** Move the lord to lesser quarters quietly.
- **Response:** Subtle punishment. He will understand.
- **Effects:** Loyalty +8, Nobility +3

---

### Encounter #337 — Captain Varn

**Character:** Captain Varn
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.

**Choice 1:** Double the loyalty oath at muster.
- **Response:** Words bind some. Others count coins.
- **Effects:** Army +12, Treasury -8, Loyalty +10

**Choice 2:** Pay a bonus from the privy purse.
- **Response:** Gold buys silence in steel. Brief silence.
- **Effects:** Army +15, Treasury -15, Loyalty +8

**Choice 3:** Hang one rumormonger as example.
- **Response:** Fear works. The rest salute louder.
- **Effects:** People -8, Army +8, Loyalty +5

---

### Encounter #338 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.

**Choice 1:** Protect her and investigate quietly.
- **Response:** Patience catches rats. The court sweats politely.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2:** Pay her and forget the names.
- **Response:** Cheap insurance. Dangerous if she talks twice.
- **Effects:** Treasury -10, Loyalty +5

**Choice 3:** Dismiss her — servants' gossip is wind.
- **Response:** Blind spot chosen. Someone will use it.
- **Effects:** Treasury +5, Loyalty -10

---

### Encounter #339 — General Rudolf

**Character:** General Rudolf
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.

**Choice 1:** Buy the list and purge the clerks.
- **Response:** Efficient treachery. The court learns you purchase truth.
- **Effects:** Treasury -12, Loyalty +15

**Choice 2:** Arrest the spy and ignore the list.
- **Response:** Principle over intelligence. Loyal fools remain hidden.
- **Effects:** Army +5, Loyalty +5

**Choice 3:** Buy the list but spare the clerks — watch them.
- **Response:** Soft trap. They will know. They may behave.
- **Effects:** Treasury -8, Loyalty +10

---

### Encounter #340 — Executioner Morwen

**Character:** Executioner Morwen
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.

**Choice 1:** Execute the ringleaders only.
- **Response:** Surgical fear. Mercy seen in the survivors.
- **Effects:** People -5, Army +5, Loyalty +8

**Choice 2:** Mass pardon for oaths, not for treason.
- **Response:** Generous line-drawing. Purists will call it chaos.
- **Effects:** People +8, Army -5, Loyalty +10

**Choice 3:** Empty cells into the levy — choice or rope.
- **Response:** Brutal recruitment. Army swells, loyalty questionable.
- **Effects:** People -10, Army +15, Loyalty -5

---

### Encounter #341 — Cook Gromm

**Character:** Cook Gromm
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.

**Choice 1:** Grant leave — trust the guard rotation.
- **Response:** Humanity costs risk. The court notes your nerve.
- **Effects:** Army -3, Loyalty +8

**Choice 2:** Refuse — the crown's safety first.
- **Response:** Safe and cruel. She will remember.
- **Effects:** Army +5, Loyalty -8

**Choice 3:** Send her with pay and a replacement.
- **Response:** Gold softens refusal. Professional solution.
- **Effects:** Army +3, Treasury -8, Loyalty +5

---

### Encounter #342 — Spy Knox

**Character:** Spy Knox
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.

**Choice 1:** Let the monk feed who he chooses.
- **Response:** Charity buys whispers of mercy. Malrik frowns.
- **Effects:** People +10, Church -5, Health +5, Loyalty +8, Food -5

**Choice 2:** Arrest Edwin's sympathizers.
- **Response:** Hard crown. Safer throne. Hungrier streets.
- **Effects:** People -12, Church +5, Army +5, Loyalty +5

**Choice 3:** Tax the soup kitchen — crown shares the virtue.
- **Response:** Cynical. Surprisingly effective accounting.
- **Effects:** Treasury +8, Loyalty +3, Food -3

---

### Encounter #343 — Bodyguard Raena

**Character:** Bodyguard Raena
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.

**Choice 1:** Hang the clerks, spare the treasurer.
- **Response:** Scapegoats die. The court learns the price of theft.
- **Effects:** Treasury +5, Loyalty +10

**Choice 2:** Dismiss the treasurer and reform the office.
- **Response:** Clean house. Expensive honesty.
- **Effects:** Treasury -10, Loyalty +12

**Choice 3:** Take a cut and regulate the bribes.
- **Response:** Corruption with a ledger. Loyalty has a tariff now.
- **Effects:** People -5, Treasury +15, Loyalty -5

---

### Encounter #344 — Sir Otto the Silent

**Character:** Sir Otto the Silent
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the silent knight has not spoken in years — today he writes that your chamberlain plots with Ingvar's clerks.

**Choice 1:** Arrest the chamberlain immediately.
- **Response:** Swift stroke. If wrong, you have made a martyr.
- **Effects:** Army +5, Loyalty +8

**Choice 2:** Watch quietly for proof.
- **Response:** Patience. The plot may deepen into visibility.
- **Effects:** Treasury -5, Loyalty +10

**Choice 3:** Confront Ingvar publicly.
- **Response:** Drama. Diplomacy suffers; truth may surface.
- **Effects:** Army +3, Loyalty +5

---

### Encounter #345 — Maid Lissa

**Character:** Maid Lissa
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.

**Choice 1:** Seal every scriptorium door and investigate.
- **Response:** Paranoia with cause. Work slows; traitors sweat.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2:** Execute the junior scribe as warning.
- **Response:** Fast justice. The guilty may remain.
- **Effects:** People -5, Army +3, Loyalty +5

**Choice 3:** Issue a new decree confirming the true text.
- **Response:** Ink fights ink. The realm reads confusion.
- **Effects:** Loyalty +8

---

### Encounter #346 — Royal Scribe Osric

**Character:** Royal Scribe Osric
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.

**Choice 1:** Free the prisoner — reward the cook's honesty.
- **Response:** Mercy visible. Plotters may test your softness.
- **Effects:** People +5, Loyalty +10, Food +3

**Choice 2:** Interrogate the prisoner privately.
- **Response:** Information first. Justice later, maybe.
- **Effects:** Treasury -3, Loyalty +8

**Choice 3:** Punish the cook for meddling.
- **Response:** Message sent: look away. Loyalty bought with fear.
- **Effects:** People -5, Army +3, Loyalty -8, Food -5

---

### Encounter #347 — Healer Mira

**Character:** Healer Mira
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.

**Choice 1:** Accept — a second blade in the shadows.
- **Response:** Personal power grows. The army notices.
- **Effects:** Army -8, Treasury -10, Loyalty +15

**Choice 2:** Refuse — one army, one loyalty.
- **Response:** Unity preserved. Personal risk remains.
- **Effects:** Army +8, Loyalty +5

**Choice 3:** Expose the offer to Rudolf publicly.
- **Response:** Transparency as weapon. He may respect or resent it.
- **Effects:** Army +5, Loyalty +8

---

### Encounter #348 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.

**Choice 1:** Treat him — hunger explains, not excuses.
- **Response:** Mercy noted. Guards debate your softness.
- **Effects:** People +5, Army +5, Health +8, Loyalty +8

**Choice 2:** Turn him over to Varn for discipline.
- **Response:** Order restored. Fear refreshed.
- **Effects:** People -3, Army +8, Loyalty +10

**Choice 3:** Dismiss him without treatment or pay.
- **Response:** Harsh lesson. The barracks will remember.
- **Effects:** People -5, Army -5, Treasury +5, Loyalty +5

---

### Encounter #349 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.

**Choice 1:** Accept church reports on disloyalty.
- **Response:** Faith becomes spy. Loyalty measurable, humiliating.
- **Effects:** Church +12, Loyalty +10

**Choice 2:** Refuse — crown does not buy souls' ledgers.
- **Response:** Independence declared. Blind spots remain.
- **Effects:** Church -8, Loyalty +5

**Choice 3:** Demand public oaths instead of secrets.
- **Response:** Theatre of loyalty. Some will mean it.
- **Effects:** Church +5, Army +5, Loyalty +8

---

### Encounter #350 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Loyalty | **Era:** days 260–319
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?

**Choice 1:** Arrest the officers.
- **Response:** Discipline restored. Resentment bottled.
- **Effects:** People -5, Army +10, Loyalty +8

**Choice 2:** Ignore — drunk nostalgia is not rebellion.
- **Response:** Risk accepted. Cheap peace tonight.
- **Effects:** Army -3, Loyalty +5

**Choice 3:** Buy the next round in the crown's name.
- **Response:** Bold charm. They toast you before midnight.
- **Effects:** Army +8, Treasury -8, Loyalty +12

---

## Succession Pool

_Days 320–365 (Succession stat unlock at day 320). All nine stats may appear._

### Encounter #351 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.

**Choice 1:** Name a loyal general as heir.
- **Response:** Steel inherits. Bloodlines scream heresy.
- **Effects:** People -8, Church +10, Army +15, Loyalty +5, Nobility -10, Succession +12

**Choice 2:** Refuse — the living king needs no shadow.
- **Response:** Defiance. Succession whispers grow teeth.
- **Effects:** Church -8, Army +5, Nobility +5, Succession +15

**Choice 3:** Adopt a distant cousin quietly.
- **Response:** Paper heir. Fragile peace.
- **Effects:** Church +5, Treasury -10, Loyalty +5, Nobility +12, Succession +8

---

### Encounter #352 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.

**Choice 1:** Promise the throne passes by council vote.
- **Response:** Institutional answer. Weak kings like it.
- **Effects:** Army +5, Loyalty +5, Nobility +8, Succession +10

**Choice 2:** Declare no heir — only conquest decides.
- **Response:** Blunt threat. War more likely.
- **Effects:** People -5, Army +12, Loyalty -5, Nobility -8, Succession +18

**Choice 3:** Offer marriage tie to their bloodline.
- **Response:** Diplomatic heir. Expensive tomorrow.
- **Effects:** Treasury -15, Nobility +10, Succession +6

---

### Encounter #353 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.

**Choice 1:** Pursue election by great houses.
- **Response:** Legitimacy bought in votes. Ashford smiles.
- **Effects:** Treasury -10, Loyalty +5, Nobility +15, Succession +10

**Choice 2:** Pursue blood — find any kin.
- **Response:** Desperate heraldry. Succession stabilizes, maybe.
- **Effects:** Treasury -8, Nobility +8, Succession +12

**Choice 3:** Keep conquest — the throne is held by blade.
- **Response:** Honest brutality. Future uncertain.
- **Effects:** Army +8, Loyalty -5, Nobility -5, Succession +15

---

### Encounter #354 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the prophet speaks without being asked: 'When the usurper names no heir, the realm names three.'

**Choice 1:** Hear him in private.
- **Response:** Omen noted. Court nervous.
- **Effects:** Church -5, Loyalty +5, Succession +8

**Choice 2:** Arrest him for threatening succession.
- **Response:** Silence purchased. Rumors cheaper.
- **Effects:** People -5, Church +8, Army +5, Loyalty -5, Succession +12

**Choice 3:** Name a public heir to contradict him.
- **Response:** Theatre answer. Stability or target acquired.
- **Effects:** Loyalty +8, Nobility +5, Succession -5

---

### Encounter #355 — Nameless Prophet

**Character:** Nameless Prophet
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.

**Choice 1:** Adopt the star-named child.
- **Response:** Myth becomes policy. Peasants cheer.
- **Effects:** People +10, Church +5, Treasury -12, Loyalty +5, Nobility +5, Succession +10

**Choice 2:** Dismiss astrology from state business.
- **Response:** Rational crown. Superstitious unrest.
- **Effects:** Church -5, Succession +8

**Choice 3:** Pay for a private chart only.
- **Response:** Secrets in heaven. Leaks on earth.
- **Effects:** Treasury -8, Loyalty +3, Succession +5

---

### Encounter #356 — Talen

**Character:** Talen
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.

**Choice 1:** Promise reform — succession by law.
- **Response:** Hope sold. Enemies price it.
- **Effects:** People +8, Loyalty +8, Nobility +5, Succession +12

**Choice 2:** Promise blood — my line or none.
- **Response:** Hard answer. Stability through fear.
- **Effects:** People -5, Army +10, Loyalty -5, Succession +15

**Choice 3:** Promise nothing — fog persists.
- **Response:** Mystery maintained. Anxiety spreads.
- **Effects:** Loyalty -8, Succession +10

---

### Encounter #357 — The Masked One

**Character:** The Masked One
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the duke who calls himself a goose demands succession rights because his house 'laid the golden egg of the treasury.'

**Choice 1:** Grant a ceremonial title — quiet him.
- **Response:** Absurdity buys peace. Chroniclers weep.
- **Effects:** Treasury -5, Loyalty +5, Nobility +8, Succession +5

**Choice 2:** Throw him from court.
- **Response:** Laughter and danger. He may return meaner.
- **Effects:** Army +3, Loyalty -3, Nobility -5, Succession +8

**Choice 3:** Make him regent of the poultry accounts.
- **Response:** Joke becomes office. Surprisingly loyal bird.
- **Effects:** People +5, Treasury +8, Loyalty +8, Nobility +3, Food +5, Succession +3

---

### Encounter #358 — Astrologer Meribald

**Character:** Astrologer Meribald
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ilana will publish your succession table unless you approve the chapter. She has three drafts — blood, blade, and bargain.

**Choice 1:** Approve blood chapter.
- **Response:** Dynasty narrative. Rivals mobilize.
- **Effects:** Loyalty +5, Nobility +10, Succession +12

**Choice 2:** Approve blade chapter.
- **Response:** Honest usurper myth. Honest unrest.
- **Effects:** People -5, Army +8, Nobility -5, Succession +15

**Choice 3:** Approve bargain chapter.
- **Response:** Election fiction. Houses preen.
- **Effects:** Treasury -8, Loyalty +8, Nobility +12, Succession +8

---

### Encounter #359 — Duke the Goose

**Character:** Duke the Goose
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Talen sells a rumor that you have named a secret heir. Buy the rumor, spread it, or let it run?

**Choice 1:** Buy and bury the rumor.
- **Response:** Quiet coin. Loud questions remain.
- **Effects:** Treasury -15, Loyalty +5, Succession +8

**Choice 2:** Spread the rumor — stability through lie.
- **Response:** False heir protects true throne. Fragile trick.
- **Effects:** Treasury -8, Loyalty +8, Nobility +5, Succession +10

**Choice 3:** Deny publicly and hunt the source.
- **Response:** Chaos contained. Court sweats.
- **Effects:** Army +5, Loyalty +10, Succession +12

---

### Encounter #360 — General Rudolf

**Character:** General Rudolf
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ingvar offers to recognize your heir if you recognize his prince's claim to a border duchy after your death.

**Choice 1:** Accept — succession peace abroad.
- **Response:** Future sold for present calm.
- **Effects:** Army +5, Nobility +5, Succession -8

**Choice 2:** Refuse — Loria is not mortgaged.
- **Response:** Pride intact. Northern knives sharpen.
- **Effects:** Army +10, Loyalty +5, Succession +15

**Choice 3:** Counter — mutual non-aggression only.
- **Response:** Diplomatic draw. Both sides grumble.
- **Effects:** People +3, Army +5, Loyalty +5, Nobility +3, Succession +5

---

### Encounter #361 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik says the cathedral vault holds Edwin's will — unread since the coup. Open it or burn it?

**Choice 1:** Open the will publicly.
- **Response:** Truth ritual. Succession chaos possible.
- **Effects:** Church +12, Nobility -8, Succession +15

**Choice 2:** Read privately then decide.
- **Response:** Knowledge is leverage. Suspicion grows.
- **Effects:** Church +5, Loyalty +5, Succession +8

**Choice 3:** Burn it unopened.
- **Response:** Peace of ignorance. Hell gets the paperwork.
- **Effects:** Church -10, Army +5, Loyalty -5, Nobility +5, Succession +12

---

### Encounter #362 — Healer Mira

**Character:** Healer Mira
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Arvel says the poor pray for 'a name after the usurper.' Give them a name or give them bread?

**Choice 1:** Announce a public heir.
- **Response:** Name given. Target acquired.
- **Effects:** People +8, Church +5, Loyalty +8, Food -5, Succession +10

**Choice 2:** Announce grain instead of heirs.
- **Response:** Bread now. Succession later.
- **Effects:** People +12, Treasury -12, Loyalty +5, Food +15, Succession +5

**Choice 3:** Announce both — heir and harvest festival.
- **Response:** Grand gesture. Expensive faith.
- **Effects:** People +10, Church +5, Treasury -18, Loyalty +10, Nobility +5, Food +10, Succession +8

---

### Encounter #363 — Captain Varn

**Character:** Captain Varn
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Rudolf wants the succession law to favor generals. The nobles want blood. The church wants rites. You want sleep.

**Choice 1:** Military succession clause.
- **Response:** Army content. Elite furious.
- **Effects:** People -5, Army +15, Loyalty +5, Nobility -12, Succession +12

**Choice 2:** Noble blood clause.
- **Response:** Houses content. Soldiers wary.
- **Effects:** Army -5, Nobility +15, Succession +10

**Choice 3:** Church rite clause.
- **Response:** Altar binds succession. Crown shares power.
- **Effects:** Church +15, Loyalty +5, Nobility +5, Succession +8

---

### Encounter #364 — Chronicler Ilana

**Character:** Chronicler Ilana
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Borvin proposes taxing empty succession titles — lords pay to keep hypothetical heirs on paper.

**Choice 1:** Enact the tax.
- **Response:** Treasury laughs. Nobility plots.
- **Effects:** Treasury +20, Nobility -10, Succession +8

**Choice 2:** Reject — do not mock blood.
- **Response:** Respect bought. Gold lost.
- **Effects:** Treasury -5, Loyalty +5, Nobility +8, Succession +5

**Choice 3:** Tax only foreign claimants.
- **Response:** Narrow policy. Ingvar annoyed.
- **Effects:** Army +5, Treasury +10, Nobility +3, Succession +10

---

### Encounter #365 — Lady Ashford

**Character:** Lady Ashford
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Mira tends a feverish lord who mutters Edwin's nephew's name. Save him and hear prophecy, or let fever finish the sentence?

**Choice 1:** Save him — hear what he says.
- **Response:** Life bought. Succession rumor strengthened.
- **Effects:** Treasury -5, Health +10, Loyalty +5, Succession +12

**Choice 2:** Let nature finish — fewer claimants.
- **Response:** Hard choice. Whispers call it murder.
- **Effects:** People -8, Loyalty -5, Succession +8

**Choice 3:** Save him but isolate from court.
- **Response:** Middle path. Secrets in the sickroom.
- **Effects:** Treasury -8, Health +8, Loyalty +8, Succession +5

---

### Encounter #366 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Varn found succession pamphlets in the barracks. Hang the printers, burn the pamphlets, or rewrite them with your heir?

**Choice 1:** Hang the printers.
- **Response:** Fear stills presses. Martyrs possible.
- **Effects:** People -8, Army +8, Loyalty +8, Succession +10

**Choice 2:** Burn pamphlets only.
- **Response:** Softer censorship. Ideas smolder.
- **Effects:** Army +3, Loyalty +5, Succession +8

**Choice 3:** Publish crown pamphlet answering them.
- **Response:** War of words. Succession debated openly.
- **Effects:** People +5, Treasury -10, Loyalty +8, Nobility +5, Succession +12

---

### Encounter #367 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ashford offers to legitimize your line through her house's blood — if succession names her nephew as regent.

**Choice 1:** Accept regency bargain.
- **Response:** Succession tethered to Ashford. Peace costly.
- **Effects:** Treasury -10, Nobility +18, Succession -5

**Choice 2:** Refuse — Ashford is not dynasty.
- **Response:** Independence kept. Eastern threat returns.
- **Effects:** Army +8, Loyalty +5, Nobility -10, Succession +15

**Choice 3:** Counter — marriage only, no regency.
- **Response:** Half alliance. Half insult.
- **Effects:** Treasury -8, Nobility +10, Succession +8

---

### Encounter #368 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.

**Choice 1:** Name a loyal general as heir.
- **Response:** Steel inherits. Bloodlines scream heresy.
- **Effects:** People -8, Church +10, Army +15, Loyalty +5, Nobility -10, Succession +12

**Choice 2:** Refuse — the living king needs no shadow.
- **Response:** Defiance. Succession whispers grow teeth.
- **Effects:** Church -8, Army +5, Nobility +5, Succession +15

**Choice 3:** Adopt a distant cousin quietly.
- **Response:** Paper heir. Fragile peace.
- **Effects:** Church +5, Treasury -10, Loyalty +5, Nobility +12, Succession +8

---

### Encounter #369 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.

**Choice 1:** Promise the throne passes by council vote.
- **Response:** Institutional answer. Weak kings like it.
- **Effects:** Army +5, Loyalty +5, Nobility +8, Succession +10

**Choice 2:** Declare no heir — only conquest decides.
- **Response:** Blunt threat. War more likely.
- **Effects:** People -5, Army +12, Loyalty -5, Nobility -8, Succession +18

**Choice 3:** Offer marriage tie to their bloodline.
- **Response:** Diplomatic heir. Expensive tomorrow.
- **Effects:** Treasury -15, Nobility +10, Succession +6

---

### Encounter #370 — Nameless Prophet

**Character:** Nameless Prophet
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.

**Choice 1:** Pursue election by great houses.
- **Response:** Legitimacy bought in votes. Ashford smiles.
- **Effects:** Treasury -10, Loyalty +5, Nobility +15, Succession +10

**Choice 2:** Pursue blood — find any kin.
- **Response:** Desperate heraldry. Succession stabilizes, maybe.
- **Effects:** Treasury -8, Nobility +8, Succession +12

**Choice 3:** Keep conquest — the throne is held by blade.
- **Response:** Honest brutality. Future uncertain.
- **Effects:** Army +8, Loyalty -5, Nobility -5, Succession +15

---

### Encounter #371 — Talen

**Character:** Talen
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the prophet speaks without being asked: 'When the usurper names no heir, the realm names three.'

**Choice 1:** Hear him in private.
- **Response:** Omen noted. Court nervous.
- **Effects:** Church -5, Loyalty +5, Succession +8

**Choice 2:** Arrest him for threatening succession.
- **Response:** Silence purchased. Rumors cheaper.
- **Effects:** People -5, Church +8, Army +5, Loyalty -5, Succession +12

**Choice 3:** Name a public heir to contradict him.
- **Response:** Theatre answer. Stability or target acquired.
- **Effects:** Loyalty +8, Nobility +5, Succession -5

---

### Encounter #372 — The Masked One

**Character:** The Masked One
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.

**Choice 1:** Adopt the star-named child.
- **Response:** Myth becomes policy. Peasants cheer.
- **Effects:** People +10, Church +5, Treasury -12, Loyalty +5, Nobility +5, Succession +10

**Choice 2:** Dismiss astrology from state business.
- **Response:** Rational crown. Superstitious unrest.
- **Effects:** Church -5, Succession +8

**Choice 3:** Pay for a private chart only.
- **Response:** Secrets in heaven. Leaks on earth.
- **Effects:** Treasury -8, Loyalty +3, Succession +5

---

### Encounter #373 — Astrologer Meribald

**Character:** Astrologer Meribald
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.

**Choice 1:** Promise reform — succession by law.
- **Response:** Hope sold. Enemies price it.
- **Effects:** People +8, Loyalty +8, Nobility +5, Succession +12

**Choice 2:** Promise blood — my line or none.
- **Response:** Hard answer. Stability through fear.
- **Effects:** People -5, Army +10, Loyalty -5, Succession +15

**Choice 3:** Promise nothing — fog persists.
- **Response:** Mystery maintained. Anxiety spreads.
- **Effects:** Loyalty -8, Succession +10

---

### Encounter #374 — Duke the Goose

**Character:** Duke the Goose
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the duke who calls himself a goose demands succession rights because his house 'laid the golden egg of the treasury.'

**Choice 1:** Grant a ceremonial title — quiet him.
- **Response:** Absurdity buys peace. Chroniclers weep.
- **Effects:** Treasury -5, Loyalty +5, Nobility +8, Succession +5

**Choice 2:** Throw him from court.
- **Response:** Laughter and danger. He may return meaner.
- **Effects:** Army +3, Loyalty -3, Nobility -5, Succession +8

**Choice 3:** Make him regent of the poultry accounts.
- **Response:** Joke becomes office. Surprisingly loyal bird.
- **Effects:** People +5, Treasury +8, Loyalty +8, Nobility +3, Food +5, Succession +3

---

### Encounter #375 — General Rudolf

**Character:** General Rudolf
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ilana will publish your succession table unless you approve the chapter. She has three drafts — blood, blade, and bargain.

**Choice 1:** Approve blood chapter.
- **Response:** Dynasty narrative. Rivals mobilize.
- **Effects:** Loyalty +5, Nobility +10, Succession +12

**Choice 2:** Approve blade chapter.
- **Response:** Honest usurper myth. Honest unrest.
- **Effects:** People -5, Army +8, Nobility -5, Succession +15

**Choice 3:** Approve bargain chapter.
- **Response:** Election fiction. Houses preen.
- **Effects:** Treasury -8, Loyalty +8, Nobility +12, Succession +8

---

### Encounter #376 — Treasurer Borvin

**Character:** Treasurer Borvin
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Talen sells a rumor that you have named a secret heir. Buy the rumor, spread it, or let it run?

**Choice 1:** Buy and bury the rumor.
- **Response:** Quiet coin. Loud questions remain.
- **Effects:** Treasury -15, Loyalty +5, Succession +8

**Choice 2:** Spread the rumor — stability through lie.
- **Response:** False heir protects true throne. Fragile trick.
- **Effects:** Treasury -8, Loyalty +8, Nobility +5, Succession +10

**Choice 3:** Deny publicly and hunt the source.
- **Response:** Chaos contained. Court sweats.
- **Effects:** Army +5, Loyalty +10, Succession +12

---

### Encounter #377 — Healer Mira

**Character:** Healer Mira
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ingvar offers to recognize your heir if you recognize his prince's claim to a border duchy after your death.

**Choice 1:** Accept — succession peace abroad.
- **Response:** Future sold for present calm.
- **Effects:** Army +5, Nobility +5, Succession -8

**Choice 2:** Refuse — Loria is not mortgaged.
- **Response:** Pride intact. Northern knives sharpen.
- **Effects:** Army +10, Loyalty +5, Succession +15

**Choice 3:** Counter — mutual non-aggression only.
- **Response:** Diplomatic draw. Both sides grumble.
- **Effects:** People +3, Army +5, Loyalty +5, Nobility +3, Succession +5

---

### Encounter #378 — Captain Varn

**Character:** Captain Varn
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Malrik says the cathedral vault holds Edwin's will — unread since the coup. Open it or burn it?

**Choice 1:** Open the will publicly.
- **Response:** Truth ritual. Succession chaos possible.
- **Effects:** Church +12, Nobility -8, Succession +15

**Choice 2:** Read privately then decide.
- **Response:** Knowledge is leverage. Suspicion grows.
- **Effects:** Church +5, Loyalty +5, Succession +8

**Choice 3:** Burn it unopened.
- **Response:** Peace of ignorance. Hell gets the paperwork.
- **Effects:** Church -10, Army +5, Loyalty -5, Nobility +5, Succession +12

---

### Encounter #379 — Chronicler Ilana

**Character:** Chronicler Ilana
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Arvel says the poor pray for 'a name after the usurper.' Give them a name or give them bread?

**Choice 1:** Announce a public heir.
- **Response:** Name given. Target acquired.
- **Effects:** People +8, Church +5, Loyalty +8, Food -5, Succession +10

**Choice 2:** Announce grain instead of heirs.
- **Response:** Bread now. Succession later.
- **Effects:** People +12, Treasury -12, Loyalty +5, Food +15, Succession +5

**Choice 3:** Announce both — heir and harvest festival.
- **Response:** Grand gesture. Expensive faith.
- **Effects:** People +10, Church +5, Treasury -18, Loyalty +10, Nobility +5, Food +10, Succession +8

---

### Encounter #380 — Lady Ashford

**Character:** Lady Ashford
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Rudolf wants the succession law to favor generals. The nobles want blood. The church wants rites. You want sleep.

**Choice 1:** Military succession clause.
- **Response:** Army content. Elite furious.
- **Effects:** People -5, Army +15, Loyalty +5, Nobility -12, Succession +12

**Choice 2:** Noble blood clause.
- **Response:** Houses content. Soldiers wary.
- **Effects:** Army -5, Nobility +15, Succession +10

**Choice 3:** Church rite clause.
- **Response:** Altar binds succession. Crown shares power.
- **Effects:** Church +15, Loyalty +5, Nobility +5, Succession +8

---

### Encounter #381 — Old Advisor Edric

**Character:** Old Advisor Edric
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Borvin proposes taxing empty succession titles — lords pay to keep hypothetical heirs on paper.

**Choice 1:** Enact the tax.
- **Response:** Treasury laughs. Nobility plots.
- **Effects:** Treasury +20, Nobility -10, Succession +8

**Choice 2:** Reject — do not mock blood.
- **Response:** Respect bought. Gold lost.
- **Effects:** Treasury -5, Loyalty +5, Nobility +8, Succession +5

**Choice 3:** Tax only foreign claimants.
- **Response:** Narrow policy. Ingvar annoyed.
- **Effects:** Army +5, Treasury +10, Nobility +3, Succession +10

---

### Encounter #382 — High Priest Malrik

**Character:** High Priest Malrik
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Mira tends a feverish lord who mutters Edwin's nephew's name. Save him and hear prophecy, or let fever finish the sentence?

**Choice 1:** Save him — hear what he says.
- **Response:** Life bought. Succession rumor strengthened.
- **Effects:** Treasury -5, Health +10, Loyalty +5, Succession +12

**Choice 2:** Let nature finish — fewer claimants.
- **Response:** Hard choice. Whispers call it murder.
- **Effects:** People -8, Loyalty -5, Succession +8

**Choice 3:** Save him but isolate from court.
- **Response:** Middle path. Secrets in the sickroom.
- **Effects:** Treasury -8, Health +8, Loyalty +8, Succession +5

---

### Encounter #383 — Ambassador Ingvar

**Character:** Ambassador Ingvar
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Varn found succession pamphlets in the barracks. Hang the printers, burn the pamphlets, or rewrite them with your heir?

**Choice 1:** Hang the printers.
- **Response:** Fear stills presses. Martyrs possible.
- **Effects:** People -8, Army +8, Loyalty +8, Succession +10

**Choice 2:** Burn pamphlets only.
- **Response:** Softer censorship. Ideas smolder.
- **Effects:** Army +3, Loyalty +5, Succession +8

**Choice 3:** Publish crown pamphlet answering them.
- **Response:** War of words. Succession debated openly.
- **Effects:** People +5, Treasury -10, Loyalty +8, Nobility +5, Succession +12

---

### Encounter #384 — Monk Arvel

**Character:** Monk Arvel
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Ashford offers to legitimize your line through her house's blood — if succession names her nephew as regent.

**Choice 1:** Accept regency bargain.
- **Response:** Succession tethered to Ashford. Peace costly.
- **Effects:** Treasury -10, Nobility +18, Succession -5

**Choice 2:** Refuse — Ashford is not dynasty.
- **Response:** Independence kept. Eastern threat returns.
- **Effects:** Army +8, Loyalty +5, Nobility -10, Succession +15

**Choice 3:** Counter — marriage only, no regency.
- **Response:** Half alliance. Half insult.
- **Effects:** Treasury -8, Nobility +10, Succession +8

---

### Encounter #385 — Nameless Prophet

**Character:** Nameless Prophet
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.

**Choice 1:** Name a loyal general as heir.
- **Response:** Steel inherits. Bloodlines scream heresy.
- **Effects:** People -8, Church +10, Army +15, Loyalty +5, Nobility -10, Succession +12

**Choice 2:** Refuse — the living king needs no shadow.
- **Response:** Defiance. Succession whispers grow teeth.
- **Effects:** Church -8, Army +5, Nobility +5, Succession +15

**Choice 3:** Adopt a distant cousin quietly.
- **Response:** Paper heir. Fragile peace.
- **Effects:** Church +5, Treasury -10, Loyalty +5, Nobility +12, Succession +8

---

### Encounter #386 — Talen

**Character:** Talen
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.

**Choice 1:** Promise the throne passes by council vote.
- **Response:** Institutional answer. Weak kings like it.
- **Effects:** Army +5, Loyalty +5, Nobility +8, Succession +10

**Choice 2:** Declare no heir — only conquest decides.
- **Response:** Blunt threat. War more likely.
- **Effects:** People -5, Army +12, Loyalty -5, Nobility -8, Succession +18

**Choice 3:** Offer marriage tie to their bloodline.
- **Response:** Diplomatic heir. Expensive tomorrow.
- **Effects:** Treasury -15, Nobility +10, Succession +6

---

### Encounter #387 — The Masked One

**Character:** The Masked One
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.

**Choice 1:** Pursue election by great houses.
- **Response:** Legitimacy bought in votes. Ashford smiles.
- **Effects:** Treasury -10, Loyalty +5, Nobility +15, Succession +10

**Choice 2:** Pursue blood — find any kin.
- **Response:** Desperate heraldry. Succession stabilizes, maybe.
- **Effects:** Treasury -8, Nobility +8, Succession +12

**Choice 3:** Keep conquest — the throne is held by blade.
- **Response:** Honest brutality. Future uncertain.
- **Effects:** Army +8, Loyalty -5, Nobility -5, Succession +15

---

### Encounter #388 — Astrologer Meribald

**Character:** Astrologer Meribald
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the prophet speaks without being asked: 'When the usurper names no heir, the realm names three.'

**Choice 1:** Hear him in private.
- **Response:** Omen noted. Court nervous.
- **Effects:** Church -5, Loyalty +5, Succession +8

**Choice 2:** Arrest him for threatening succession.
- **Response:** Silence purchased. Rumors cheaper.
- **Effects:** People -5, Church +8, Army +5, Loyalty -5, Succession +12

**Choice 3:** Name a public heir to contradict him.
- **Response:** Theatre answer. Stability or target acquired.
- **Effects:** Loyalty +8, Nobility +5, Succession -5

---

### Encounter #389 — Duke the Goose

**Character:** Duke the Goose
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.

**Choice 1:** Adopt the star-named child.
- **Response:** Myth becomes policy. Peasants cheer.
- **Effects:** People +10, Church +5, Treasury -12, Loyalty +5, Nobility +5, Succession +10

**Choice 2:** Dismiss astrology from state business.
- **Response:** Rational crown. Superstitious unrest.
- **Effects:** Church -5, Succession +8

**Choice 3:** Pay for a private chart only.
- **Response:** Secrets in heaven. Leaks on earth.
- **Effects:** Treasury -8, Loyalty +3, Succession +5

---

### Encounter #390 — General Rudolf

**Character:** General Rudolf
**Pool:** Succession | **Era:** days 320–365
**Nodes:** 1 (start node: 0)

#### Node 0

**Prompt:** Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.

**Choice 1:** Promise reform — succession by law.
- **Response:** Hope sold. Enemies price it.
- **Effects:** People +8, Loyalty +8, Nobility +5, Succession +12

**Choice 2:** Promise blood — my line or none.
- **Response:** Hard answer. Stability through fear.
- **Effects:** People -5, Army +10, Loyalty -5, Succession +15

**Choice 3:** Promise nothing — fog persists.
- **Response:** Mystery maintained. Anxiety spreads.
- **Effects:** Loyalty -8, Succession +10

---

## Pool coverage audit

Random-pool days = calendar days minus story-arc beats (142 unique arc days documented in header).

| Era | Calendar days | Arc days | Random-pool days | Pool encounters | Headroom |
|-----|---------------|----------|------------------|-----------------|----------|
| 1–29 | 29 | 13 | 16 | Early 29 + Mid 50 = 79 | 4.9× |
| 30–89 | 60 | 37 | 23 | Late A+B = 99 | 4.3× |
| 90–174 | 85 | 40 | 45 | People = 72 | 1.6× |
| 175–259 | 85 | 30 | 55 | Nobility = 55 | 1.0× |
| 260–319 | 60 | 16 | 44 | Loyalty = 44 | 1.0× |
| 320–365 | 46 | 6 | 40 | Succession = 40 | 1.0× |
| **Total** | **365** | **142** | **223** | **391** | **1.75×** |

With character cooldown (2 days) and pool recycling after exhaustion, late-era pools are sized for **one full unique pass per playthrough** in each stat-unlock window. Early/mid/late pools retain surplus for variety.

**Future `.das` routing** (`question_pools.das`):

- Days 90–174 → People pool (indices 180–251)
- Days 175–259 → Nobility pool (indices 252–306)
- Days 260–319 → Loyalty pool (indices 307–350)
- Days 320–365 → Succession pool (indices 351–390)

Story-arc beats override pool picks on their scheduled days per arc day priority rules in the header.

---
