# Questions & Choices Reference — Bilingual (EN / RU)

Complete catalogue of court encounters with **English and Russian** prompts, player choices, and NPC responses.

Organized by **story arcs** and **question pools**. Stat effects use English stat names.

**Source:** [`QUESTIONS_REFERENCE.md`](QUESTIONS_REFERENCE.md) + [`QUESTIONS_REFERENCE_RU.md`](QUESTIONS_REFERENCE_RU.md)

**Stat order:** People, Church, Army, Treasury, Health, Loyalty, Nobility, Food, Succession

---

## Special Encounters

### Encounter #0 — Day 1 Tutorial — Old Advisor Edric
**Title (RU):** Encounter #0 — День 1. Обучение — Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, I am Old Advisor Edric. The blade has placed you on the throne, but blades alone cannot keep it. From this day forward, each dawn will bring a petitioner through your door. Every answer you give will shift the measures of the realm. Let any measure fall to nothing, and your reign ends. How do you mean to bear it?
**Prompt (RU):** Ваше Величество, я — Старый советник Эдрик. Клинок возвёл вас на трон, но одними клинками его не удержать. Отныне каждый рассвет будет приводить просителя к вашим дверям. Каждый ваш ответ изменит баланс королевства. Если любой показатель упадёт до нуля — ваше правление закончится. Как вы намерены нести это бремя?

**Choice 1**
- **Choice (EN):** Steadily — I will weigh each crisis before I decide
- **Choice (RU):** Взвешенно — я буду обдумывать каждый кризис, прежде чем решать
- **Response (EN):** Wise. Haste crowned many kings and buried them faster. I will bring the first petitioner when you are ready to listen.
- **Response (RU):** Мудро. Поспешность возводила многих королей на трон — и хоронила их ещё быстрее. Я приведу первого просителя, когда вы будете готовы выслушать.
- **Effects:** Loyalty +5
- **Sets tone: `steady`**
- **Устанавливает тон: `steady`**
- **Next node:** 1

**Choice 2**
- **Choice (EN):** Boldly — a king who hesitates is a king who falls
- **Choice (RU):** Смело — король, который медлит, — это король, который падёт
- **Response (EN):** Then let none mistake silence for weakness. The court will test you soon enough.
- **Response (RU):** Пусть никто не принимает молчание за слабость. Двор скоро испытает вас.
- **Effects:** Army +5
- **Sets tone: `bold`**
- **Устанавливает тон: `bold`**
- **Next node:** 1

**Choice 3**
- **Choice (EN):** Mercifully — I will not rule as the old king did
- **Choice (RU):** Милосердно — я не буду править, как старый король
- **Response (EN):** Mercy wins hearts the sword cannot touch. Guard it — the realm devours soft kings as readily as cruel ones.
- **Response (RU):** Милосердие завоёвывает сердца там, куда меч не достанет. Берегите его — королевство пожирает мягких королей не хуже жестоких.
- **Effects:** Church +2, Army -2
- **Sets tone: `merciful`**
- **Устанавливает тон: `merciful`**
- **Next node:** 1

#### Node 1

**Prompt (EN):** Your Majesty, one matter before the petitioners begin. King Edwin's people did not vanish when his heart stopped — cooks, guards, clerks, confessors, and names on ledgers that still breathe. Six of his servants still sleep under this roof. The coup took the crown; it did not take their habits. How do you mean to treat the old king's household?
**Prompt (RU):** Ваше Величество, одно дело — прежде чем начнут являться просители. Люди короля Эдвина не исчезли, когда остановилось его сердце: повара, стражники, клерки, исповедники, имена в книгах счёта, которые ещё дышат. Шестеро его слуг до сих пор спят под этой крышей. Переворот взял корону, но не изменил их привычек. Как вы намерены обращаться со свитой старого короля?

**Choice 1**
- **Choice (EN):** Root them out — no ghost of Edwin serves my court
- **Choice (RU):** Выгнать их — никакой тени Эдвина при моём дворе
- **Response (EN):** Steel on the first week. The court will call it cruelty — until the calling stops. I will remember you chose the broom.
- **Response (RU):** Железо на первой неделе. Двор назовёт это жестокостью — пока не перестанет называть. Я запомню, что вы выбрали метлу.
- **Effects:** Army +3, Loyalty -3

**Choice 2**
- **Choice (EN):** Keep those who kneel — usefulness before blood
- **Choice (RU):** Оставить тех, кто преклонит колено, — польза важнее крови
- **Response (EN):** Pragmatic. Old hands know where the passages leak and which lords still dine on memory. Dangerous, if you trust too easily.
- **Response (RU):** Прагматично. Старые руки знают, где текут переходы и какие лорды по-прежнему питаются воспоминаниями. Опасно — если вы слишком легко доверяете.
- **Effects:** Loyalty +4, Treasury -3

**Choice 3**
- **Choice (EN):** Let the dead king keep his ghosts — I have larger worries
- **Choice (RU):** Пусть мёртвый король хранит своих призраков — у меня заботы важнее
- **Response (EN):** Then do not be surprised when those ghosts vote in whispers. I will count them for you, if you will not.
- **Response (RU):** Тогда не удивляйтесь, когда эти призраки начнут голосовать шёпотом. Я сосчитаю их для вас, раз вы не хотите.
- **Effects:** Church +3, Succession -4

**Choice 4**
- **Choice (EN):** Justice for the guilty, mercy for the innocent
- **Choice (RU):** Справедливость для виновных, милосердие для невинных
- **Response (EN):** A fine sentence. Harder to govern. Every beat of this reign will test whether you meant it.
- **Response (RU):** Красивые слова. Управлять по ним труднее. Каждый шаг этого правления проверит, искренне ли вы так думали.
- **Effects:** Loyalty +2, Church +2

---

### Lady Ashford Debut (Nobility unlock)
**Title (RU):** Дебют леди Эшфорд (разблокировка Nobility)

#### Node 0

**Prompt (EN):** Your Grace, I am Lady Ashford of the eastern marches. My house did not bleed for your coup, nor did we kneel when the old king fell. We have waited seven days to see whether this throne belongs to a ruler — or a brigand who got lucky with a blade.
**Prompt (RU):** Ваша Светлость, я — леди Эшфорд из восточных марок. Мой дом не пролил кровь ради вашего переворота и не преклонил колено, когда пал старый король. Мы ждали семь дней, чтобы понять: этот трон принадлежит правителю — или удачливому разбойнику с клинком?

**Choice 1**
- **Choice (EN):** You may speak freely, my lady
- **Choice (RU):** Вы можете говорить свободно, миледи
- **Effects:** Loyalty +5, Nobility +8, Succession +5
- **Next node:** 1

**Choice 2**
- **Choice (EN):** Mind your tone. I hold the sword of Loria
- **Choice (RU):** Следите за тоном. Я держу меч Лории
- **Effects:** Loyalty -5, Nobility -10
- **Next node:** 2

#### Node 1

**Prompt (EN):** Freely? How refreshing. Most kings who took the throne prefer flattery. So — the question every great house whispers in their halls: will you make lawful your reign through noble blood, or rule as a lone wolf until the realm tears you apart? My house can crown you in the eyes of the elite — or bury you beside the king you replaced.
**Prompt (RU):** Свободно? Как освежает. Большинство тех, кто взял трон предпочитают лесть. Итак — вопрос, который великие дома шепчут в своих залах: вы узаконите своё правление через благородную кровь — или будете управлять в одиночку, пока королевство не разорвёт вас на части? Мой дом может короновать вас в глазах элиты — или похоронить рядом с королём, которого вы заменили.

**Choice 1**
- **Choice (EN):** Grant Ashford a seat on the king's close advisors
- **Choice (RU):** Предоставить Эшфорду место в тайном совете
- **Response (EN):** A seat, not merely a title. My house will speak for you in halls where your name still tastes of treason.
- **Response (RU):** Место, а не просто титул. Мой дом будет говорить о вас в залах, где ваше имя ещё отдаёт изменой.
- **Effects:** Treasury -10, Loyalty +10, Nobility +18, Succession +8

**Choice 2**
- **Choice (EN):** Propose a marriage alliance
- **Choice (RU):** Предложить союз через брак
- **Effects:** People +3, Church +5, Treasury -8, Loyalty +8, Nobility +15, Succession +12
- **Next node:** 3

**Choice 3**
- **Choice (EN):** The nobility will bow or be broken
- **Choice (RU):** Знать склонится — или будет сломлена
- **Response (EN):** You mistake fear for loyalty. My house will remember this audience — and so will every lord who asked whether you could endure.
- **Response (RU):** Вы путаете страх с верностью. Мой дом запомнит эту аудиенцию — и каждый лорд, который спрашивал, выдержите ли вы испытание, тоже.
- **Effects:** Army +5, Loyalty -10, Nobility -20, Succession -8

#### Node 2

**Prompt (EN):** A sword rusts without gold to sharpen it. I did not come to trade threats — I came to learn whether you are worth the risk of an alliance. Will you make lawful your reign through noble blood, or rule as a lone wolf until the realm tears you apart?
**Prompt (RU):** Меч ржавеет без золота, чтобы его точить. Я пришла не обмениваться угрозами — я пришла понять, стоит ли рисковать союзом с вами. Вы узаконите своё правление через благородную кровь — или будете управлять в одиночку, пока королевство не разорвёт вас на части?

**Choice 1**
- **Choice (EN):** Grant Ashford a seat on the king's close advisors
- **Choice (RU):** Предоставить Эшфорду место в тайном совете
- **Response (EN):** A seat, not merely a title. My house will speak for you in halls where your name still tastes of treason.
- **Response (RU):** Место, а не просто титул. Мой дом будет говорить о вас в залах, где ваше имя ещё отдаёт изменой.
- **Effects:** Treasury -10, Loyalty +10, Nobility +18, Succession +8

**Choice 2**
- **Choice (EN):** Propose a marriage alliance
- **Choice (RU):** Предложить союз через брак
- **Effects:** People +3, Church +5, Treasury -8, Loyalty +8, Nobility +15, Succession +12
- **Next node:** 3

**Choice 3**
- **Choice (EN):** The nobility will bow or be broken
- **Choice (RU):** Знать склонится — или будет сломлена
- **Response (EN):** You mistake fear for loyalty. My house will remember this audience — and so will every lord who asked whether you could endure.
- **Response (RU):** Вы путаете страх с верностью. Мой дом запомнит эту аудиенцию — и каждый лорд, который спрашивал, выдержите ли вы испытание, тоже.
- **Effects:** Army +5, Loyalty -10, Nobility -20, Succession -8

#### Node 3

**Prompt (EN):** One final matter before I withdraw: the old king's nephew still lives. Marry into my house, and we can silence that threat together — or leave it to fester while lesser lords choose their side.
**Prompt (RU):** Последнее дело перед тем, как я удалюсь: племянник старого короля ещё жив. Вступите в союз с моим домом — и мы вместе заглушим эту угрозу. Или оставьте её гноиться, пока мелкие лорды не выберут сторону.

**Choice 1**
- **Choice (EN):** We will deal with the nephew together
- **Choice (RU):** Мы разберёмся с племянником вместе
- **Response (EN):** Then we are partners in more than name. My couriers ride tonight — let the realm see unity where it expected collapse.
- **Response (RU):** Значит, мы партнёры не только по имени. Мои гонцы скачут этой ночью — пусть королевство увидит единство там, где ожидало разрухи.
- **Effects:** Army +3, Treasury -5, Loyalty +12, Nobility +10, Succession +15

---

### People unlock — Day 90 — The Voice of the Commons
**Title (RU):** Разблокировка People — День 90 — Голос простого народа

#### Node 0

**Prompt (EN):** Your Majesty, I am Bran — elder of Millford, speaker for villages that fed Edwin's wars and starved through your coup. Yesterday the court learned a new word for us on the bar. Today we learn whether you hear it. The commons do not read ledgers — they read bellies, boots, and whether the king's guard kicks down doors. I heard hunger in the provinces before your throne was warm. Do you rule for the people, tax the people, or fear the people?
**Prompt (RU):** Ваше Величество, я — Бран, старейшина Миллфорда, говорю от имени деревень, которые кормили войны Эдвина и голодали во время вашего переворота. Вчера двор выучил для нас новое слово в своих книгах. Сегодня мы узнаем, слышите ли вы его. Простой народ не читает записи казны — он читает животы, сапоги и то, выбивает ли королевская стража двери. Я слышал о голоде в провинциях ещё до того, как ваш трон успел нагреться. Вы правите для народа, облагаете его налогами или боитесь его?

**Prompt variant (`hungryArcPhase = active`) (EN):** Your Majesty, I heard famine reached the ford before your heralds reached us. The new measure on your bar names us — good. Name us hungry honestly, and we may still kneel.
**Prompt variant (`hungryArcPhase = active`) (RU):** 

**Prompt variant (`northernTrust` ≤ −15) (EN):** Your Majesty, I heard the north sends refugees while the south sends tax collectors. The people measure you by which arrives first.
**Prompt variant (`northernTrust` ≤ −15) (RU):** 

**Choice 1**
- **Choice (EN):** Hear the commons — bread before banners
- **Choice (RU):** Слушать народ — хлеб прежде знамён
- **Response (EN):** Then hear this: empty granaries are louder than trumpets. Feed us, and we forget Edwin. Starve us, and we remember him fondly.
- **Response (RU):** Тогда услышьте это: пустые амбары громче труб. Накормите нас — и мы забудем Эдвина. Уморите нас голодом — и мы вспомним его с теплотой.
- **Effects:** People +15, Food -10, Treasury -5
- **Sets tone: `bread_first`**
- **Устанавливает тон: `bread_first`**
- **Next node:** 1

**Choice 2**
- **Choice (EN):** Tax fairly — every sack counted, every house pays
- **Choice (RU):** Справедливые налоги — каждый мешок учтён, каждый дом платит
- **Response (EN):** Fair words. Fair collectors are rarer than fair kings. We will watch the scales.
- **Response (RU):** Справедливые слова. Справедливые сборщики встречаются реже справедливых королей. Мы будем наблюдать за весами.
- **Effects:** People -8, Treasury +15, Food -5
- **Sets tone: `iron_ledger`**
- **Устанавливает тон: `iron_ledger`**
- **Next node:** 1

**Choice 3**
- **Choice (EN):** Fear keeps order — disperse village delegations
- **Choice (RU):** Страх держит порядок — разогнать деревенские делегации
- **Response (EN):** Fear feeds riots slower than hunger — but it feeds them nonetheless. You chose the shorter leash.
- **Response (RU):** Страх кормит бунты медленнее голода — но всё же кормит. Вы выбрали более короткий поводок.
- **Effects:** People -15, Army +10, Loyalty -6
- **Sets tone: `iron_fist`**
- **Устанавливает тон: `iron_fist`**
- **Next node:** 1

**Choice 4**
- **Choice (EN):** What do the villages want first?
- **Choice (RU):** Чего деревни хотят в первую очередь?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Your Majesty, three things — grain, justice, and a king who does not pretend the coup was a blessing. I heard you chose your tone. Grain we can measure. Justice we will test when your bailiff beats a widow. Blessing we leave to Malrik.
**Prompt (RU):** Ваше Величество, три вещи — зерно, справедливость и король, который не притворяется, что переворот был благословением. Я слышал, вы избрали свой тон. Зерно мы можем измерить. Справедливость проверим, когда ваш судебный пристав изобьёт вдову. Благословение оставим Малрику.

**Prompt variant (`bread_first`) (EN):** Your Majesty, I heard you put bread first. Then open the crown granaries before the guild merchants do. The people will call it mercy — until the sacks run dry.
**Prompt variant (`bread_first`) (RU):** 

**Prompt variant (`iron_ledger`) (EN):** Your Majesty, I heard you put the ledger first. Then post the rates in the square. Hidden tax is called theft, even when a king signs it.
**Prompt variant (`iron_ledger`) (RU):** 

**Prompt variant (`iron_fist`) (EN):** Your Majesty, I heard you put fear first. Then post guards where I stand. The people will call it rule — until someone throws a stone.
**Prompt variant (`iron_fist`) (RU):** 

**Choice 1**
- **Choice (EN):** Open crown granaries to the commons
- **Choice (RU):** Открыть королевские амбары для народа
- **Response (EN):** Then Millford will sing your name before winter. One village — many ears.
- **Response (RU):** Тогда Миллфорд будет петь ваше имя до зимы. Одна деревня — много ушей.
- **Effects:** People +18, Food -15, Treasury -8

**Choice 2**
- **Choice (EN):** Promise justice — send judges to the provinces
- **Choice (RU):** Пообещать справедливость — отправить судей в провинции
- **Response (EN):** Promises are cheap. Judges are expensive. We will see which you keep.
- **Response (RU):** Обещания дёшевы. Судьи дороги. Посмотрим, что вы сдержите.
- **Effects:** People +10, Treasury -10, Army +3

---

### Loyalty unlock — Day 261 — Oath or Whisper
**Title (RU):** Разблокировка Loyalty — День 261 — Клятва или шёпот

#### Node 0

**Prompt (EN):** Your Majesty, the court has a new measure today — loyalty. I command the palace guard. I heard smiles at your coronation; I hear prices now. Every chamberlain, cook, and clerk sells whispers. My men swear to the crown. The question is whether the crown swears back. Do you demand oaths, buy loyalty, or spy on your own house?
**Prompt (RU):** Ваше Величество, у двора сегодня появился новый показатель — верность. Я командую дворцовой стражей. Я слышал улыбки на вашей коронации; теперь слышу цены. Каждый камергер, повар и клерк торгует шёпотом. Мои люди клянутся короне. Вопрос в том, клянётся ли корона в ответ. Вы требуете клятв, покупаете верность или шпионите за собственным домом?

**Prompt variant (`knivesArcPhase = active`) (EN):** Your Majesty, I heard foreign coins and masked audiences before loyalty had a name on your bar. Name it now — or the knives name it for you.
**Prompt variant (`knivesArcPhase = active`) (RU):** 

**Prompt variant (`householdOutcome = haunted_palace`) (EN):** Your Majesty, I heard Edwin's ghosts still vote in the halls. Loyalty cannot measure ghosts — only the living who admit they stay.
**Prompt variant (`householdOutcome = haunted_palace`) (RU):** 

**Choice 1**
- **Choice (EN):** Public oaths — every servant swears to the living king
- **Choice (RU):** Публичные клятвы — каждый слуга клянётся живому королю
- **Response (EN):** Then the square hears unity. The disloyal hear unemployment. Both useful.
- **Response (RU):** Тогда площадь услышит единство. Нелояльные услышат увольнение. Оба полезны.
- **Effects:** Loyalty +15, Army +5, People -5
- **Next node:** 1

**Choice 2**
- **Choice (EN):** Pay the household — loyalty has a wage
- **Choice (RU):** Платить двору — у верности есть цена
- **Response (EN):** Gold buys silence in corridors. Not forever — but through winter, perhaps.
- **Response (RU):** Золото покупает тишину в коридорах. Не навсегда — но до зимы, возможно.
- **Effects:** Loyalty +10, Treasury -18, People +3
- **Next node:** 1

**Choice 3**
- **Choice (EN):** Spy on the court — loyalty proven by fear
- **Choice (RU):** Следить за двором — верность, доказанная страхом
- **Response (EN):** Then I will help you watch. And wonder who watches me. Efficient — and corrosive.
- **Response (RU):** Тогда я помогу вам наблюдать. И задамся вопросом, кто наблюдает за мной. Эффективно — и разрушительно.
- **Effects:** Loyalty +8, People -8, Army +3
- **Next node:** 1

**Choice 4**
- **Choice (EN):** Trust until broken — a king without paranoia
- **Choice (RU):** Доверять, пока не предадут — король без паранойи
- **Response (EN):** Brave. Rare. The last king who trusted died in his bed — briefly.
- **Response (RU):** Смело. Редко. Последний король, который доверял, умер в своей постели — недолго.
- **Effects:** Loyalty -5, People +5, Nobility +5
- **Next node:** 1

#### Node 1

**Prompt (EN):** Your Majesty, one test. A guard was offered gold to leave your door unlatched tonight. He reported it — or he took it. I need your verdict before loyalty becomes rumor.
**Prompt (RU):** Ваше Величество, одно испытание. Страже предложили золото, чтобы оставить вашу дверь незапертой этой ночью. Он доложил об этом — или взял деньги. Мне нужен ваш приговор, пока верность не стала слухом.

**Prompt variant (`oath`) (EN):** Your Majesty, I heard you chose oaths. Hang the bribed guard and make the household swear again at dawn.
**Prompt variant (`oath`) (RU):** 

**Prompt variant (`pay`) (EN):** Your Majesty, I heard you chose wages. Pay the honest guard double and transfer the tempted one to the stables.
**Prompt variant (`pay`) (RU):** 

**Choice 1**
- **Choice (EN):** Reward the honest guard — promote before the court
- **Choice (RU):** Наградить честного стражника — произвести повышение при дворе
- **Response (EN):** Then loyalty learns your handwriting. Others will report offers — for a time.
- **Response (RU):** Тогда верность учит ваш почерк. Другие будут докладывать о предложениях — какое-то время.
- **Effects:** Loyalty +12, Army +5, Treasury -8

**Choice 2**
- **Choice (EN):** Punish the tempted guard — mercy if he names the buyer
- **Choice (RU):** Наказать поддавшегося искушению стражника — помилование, если назовёт покупателя
- **Response (EN):** Names buy pardons. Useful — if you act on the names.
- **Response (RU):** Имена покупают помилования. Полезно — если вы действуете по именам.
- **Effects:** Loyalty +8, People -3, Army +3

---

### Succession unlock — Day 321 — Who Inherits the Blade
**Title (RU):** Разблокировка Succession — День 321 — Кому достанется клинок

#### Node 0

**Prompt (EN):** Your Majesty, succession now sits on your bar beside army and church — the question you avoided since the coup: who inherits if you fall? I survived three reigns by asking it early. Edwin had blood. You have blade. The realm wants a name before winter politics offers one for you. Do you name an heir, deny the question, or let the houses fight over the answer?
**Prompt (RU):** Ваше Величество, наследование теперь стоит на вашей шкале рядом с войском и церковью — вопрос, которого вы избегали со времён переворота: кто наследует, если вы падёте? Я пережил три правления, задавая его рано. У Эдвина была кровь. У вас — клинок. Королевство хочет имя до того, как зимняя политика предложит его за вас. Вы назовёте наследника, уйдёте от ответа или позволите домам сражаться за него?

**Prompt variant (`heirArcPhase = active`) (EN):** Your Majesty, I heard fog speaks Edwin's nephew. Succession on your bar makes that fog expensive. Name your story before the mask names his.
**Prompt variant (`heirArcPhase = active`) (RU):** 

**Prompt variant (`prophetOutcome` set) (EN):** Your Majesty, I heard the prophet sold omens of empty thrones. Succession is the realm's attempt to fill the omen with law.
**Prompt variant (`prophetOutcome` set) (RU):** 

**Choice 1**
- **Choice (EN):** Name a successor — crown chooses its own continuity
- **Choice (RU):** Назвать преемника — корона выбирает собственную преемственность
- **Response (EN):** Then ink and blood align — for a day. Every named heir gains enemies before allies.
- **Response (RU):** Тогда чернила и кровь совпадают — на один день. Каждый названный наследник наживает врагов прежде союзников.
- **Effects:** Succession +12, Nobility +8, Loyalty +5, People -5
- **Next node:** 1

**Choice 2**
- **Choice (EN):** Deny the question — the living king needs no shadow
- **Choice (RU):** Уйти от вопроса — живому королю не нужна тень
- **Response (EN):** Defiance. The realm will answer anyway — in couriers, cousins, and knives.
- **Response (RU):** Вызов. Королевство ответит всё равно — гонцами, кузенами и ножами.
- **Effects:** Succession +15, Loyalty -8, Nobility -6
- **Next node:** 1

**Choice 3**
- **Choice (EN):** Let council elect — succession by vote after you
- **Choice (RU):** Позволить совету избрать — преемственность голосованием после вас
- **Response (EN):** Democracy of vultures. Bold. Ashford will call it eastern. It may hold.
- **Response (RU):** Демократия стервятников. Смело. Эшфорд назовёт это восточным обычаем. Возможно, выдержит.
- **Effects:** Succession +8, Nobility +10, Treasury -10, Army -3
- **Next node:** 1

**Choice 4**
- **Choice (EN):** What does Edwin's law say?
- **Choice (RU):** Что говорит закон Эдвина?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Your Majesty, Edwin's law says blood. Your law says survival. The church says rite. The army says strongest sword. Pick which ledger outlives you — or watch them fight on your grave.
**Prompt (RU):** Ваше Величество, закон Эдвина говорит: кровь. Ваш закон говорит: выживание. Церковь говорит: обряд. Войско говорит: сильнейший меч. Выберите, какая книга переживёт вас — или наблюдайте, как они сражаются на вашей могиле.

**Prompt variant (`named_heir`) (EN):** Your Majesty, I heard you named an heir. Publish it before Malrik publishes a sermon correcting you.
**Prompt variant (`named_heir`) (RU):** 

**Prompt variant (`no_heir`) (EN):** Your Majesty, I heard you refused a name. Then prepare for every cousin with a claim and every priest with a prophecy.
**Prompt variant (`no_heir`) (RU):** 

**Choice 1**
- **Choice (EN):** Publish succession law this week
- **Choice (RU):** Опубликовать закон о наследовании на этой неделе
- **Response (EN):** Then lawyers eat well. Rebels eat better when confused — but confusion ends.
- **Response (RU):** Тогда юристы будут сыты. Бунтовщики сытее, когда в замешательстве — но замешательство заканчивается.
- **Effects:** Succession +10, Church +5, Treasury -8

**Choice 2**
- **Choice (EN):** Quiet letters to great houses only
- **Choice (RU):** Тихие письма только великим домам
- **Response (EN):** Private succession — public rumor. Classic. Dangerous. Yours.
- **Response (RU):** Частное наследование — публичный слух. Классика. Опасно. По-вашему.
- **Effects:** Succession +6, Nobility +8, Loyalty -4

---

## Story Arcs

## The Old King's Household (persistent story)
## Двор Старого Короля (длящаяся история)

### Beat 2 — Day 8

**Title (EN):** The Kitchen Remembers
**Title (RU):** Кухня помнит
**Character (EN):** Cook Gromm
**Character (RU):** Повар Гром
**Note (EN):** Default prompt if no prior beats beyond day 1. If `householdStance = purge`: Gromm opens frightened. If `integrate`: cooperative. If `ignore`: Gromm assumes he stays. If `selective`: Gromm asks who counts as innocent.
**Note (RU):** Реплика по умолчанию, если нет предшествующих эпизодов после дня 1. Если `householdStance = purge`: Гром открывается испуганным. Если `integrate`: сотруднически настроен. Если `ignore`: Гром предполагает, что остаётся. Если `selective`: Гром спрашивает, кого считать невиновным.

#### Node 0

**Prompt (EN):** Your Majesty, I cooked for King Edwin the night before the coup — and I cook for you now. The kitchen staff whisper which crown they serve. I heard you told Edric you would not rule like the old king — so I ask before someone else asks for you: do I keep my place, or do I keep my head?
**Prompt (RU):** Ваше Величество, я готовил для короля Эдвина в ночь накануне переворота — и готовлю для вас теперь. Кухонная прислуга шепчется, какой короне служит. Я слышал, вы сказали Эдрику, что не будете править, как прежний король, — потому спрашиваю прежде, чем кто-то спросит от вашего имени: мне сохранить место или сохранить голову?

**Prompt variant (`purge`) (EN):** Your Majesty, I cooked for Edwin the night the blades came. I heard you mean to send away all from his household — the scullions are already packing. I know which lords ate poisoned wine that never reached the table. Turn me out, and you lose that memory. Turn me in, and you lose my ovens.
**Prompt variant (`purge`) (RU):** Ваше Величество, я готовил для Эдвина в ночь, когда пришли клинки. Я слышал, вы намерены выгнать всех его двор — судомойки уже собирают пожитки. Я знаю, какие лорды пили отравленное вино, которое так и не добралось до стола. Выгоните меня — потеряете эту память. Сдайте меня — потеряете мои печи.

**Prompt variant (`integrate`) (EN):** Your Majesty, Edric says you keep those who kneel. I kneel. I also know every passage behind the pantry and which guard still spits when your name is said. Keep me, and the kitchens stay yours. Dismiss me, and Edwin's cook feeds someone else by winter.
**Prompt variant (`integrate`) (RU):** Ваше Величество, Эдрик говорит, вы оставляете тех, кто склоняет колено. Я склоняю. Я также знаю каждый проход за кладовой и который из стражников до сих пор плюёт при упоминании вашего имени. Оставьте меня — и кухни останутся вашими. Отпустите — и повар Эдвина будет кормить кого-то другого до зимы.

**Choice 1**
- **Choice (EN):** Keep Gromm — the kitchens stay open
- **Choice (RU):** Оставить Грома — кухни остаются открытыми
- **Response (EN):** Then I serve you as I served him — with discretion. The first lesson: do not trust the soup on feast nights.
- **Response (RU):** Тогда я служу вам, как служил ему, — с осторожностью. Первый урок: не доверяйте похлёбке на пиршественных вечерах.
- **Effects:** Food +8, Loyalty +4, Succession -2
- **Sets flag: `householdKeptGromm`**
- **Устанавливает флаг: `householdKeptGromm`**

**Choice 2**
- **Choice (EN):** Dismiss him — replace the kitchen staff
- **Choice (RU):** Отпустить его — заменить кухонный персонал
- **Response (EN):** As you will. The new cooks will learn slowly. The old ones will learn elsewhere.
- **Response (RU):** Как вам угодно. Новые повара будут учиться медленно. Старые будут учиться в другом месте.
- **Effects:** Army +3, Food -8, Loyalty -4
- **Clears flag: `householdKeptGromm`**
- **Снимает флаг: `householdKeptGromm`**

**Choice 3**
- **Choice (EN):** Question him — then decide
- **Choice (RU):** Допросить его — а затем решить
- **Response (EN):** Wise. Ask about the wine, the passages, and the guard who still wears Edwin's badge under his coat. Then decide if mercy feeds you or kills you.
- **Response (RU):** Мудро. Спросите о вине, о проходах и о стражнике, который до сих пор носит знак Эдвина под кафтаном. Потом решайте, кормит ли вас милосердие или убивает.
- **Effects:** Loyalty +2, Succession +3
- **Sets flag: `householdKeptGromm` (provisional — confirmed if not purged by day 16)**
- **Устанавливает флаг: `householdKeptGromm` (предварительно — подтверждается, если не выгнан до дня 16)**

---

### Beat 3 — Day 16

**Title (EN):** Old Swords on the Wall
**Title (RU):** Старые мечи на стене
**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн
**Note (EN):** Callback to Beat 2. If `householdKeptGromm`: Varn references kitchen mercy. If Gromm dismissed: Varn references purge. If day 1 `bold`: Varn expects hard line.
**Note (RU):** Обратная отсылка к Эпизоду 2. Если `householdKeptGromm`: Варн ссылается на кухонное милосердие. Если Гром отпущен: Варн ссылается на чистку. Если на день 1 была выбрана позиция `bold`: Варн ожидает твёрдой линии.

#### Node 0

**Prompt (EN):** Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. I heard you kept Gromm in the kitchens — my men want to know if old swords get the same mercy, or only old spoons. Give me an order before they give themselves one.
**Prompt (RU):** Ваше Величество, двенадцать из моих дворцовых стражников по-прежнему носят знак Эдвина под нагрудником. Я слышал, вы оставили Грома на кухне — мои люди хотят знать, распространяется ли такое же милосердие на старые мечи, или только на старые ложки. Дайте мне приказ, пока они сами себе его не дали.

**Prompt variant (Gromm dismissed) (EN):** Your Majesty, Gromm is gone and the kitchens already suffer for it. I heard you mean to scour the household — my twelve guards are not waiting to be discovered. I can replace them with men who answer only to you, or I can arrest them tonight. Choose before they choose for you.
**Prompt variant (Gromm dismissed) (RU):** 

**Prompt variant (`ignore` stance) (EN):** Your Majesty, you told Edric the dead king could keep his ghosts. My guards took that literally — they still toast Edwin on night watch. I heard you prefer patience. Patience is not the same as permission.
**Prompt variant (`ignore` stance) (RU):** 

**Prompt variant (Гром отпущен) (EN):** 
**Prompt variant (Гром отпущен) (RU):** Ваше Величество, Грома нет, и кухни уже страдают от этого. Я слышал, вы намерены вычистить двор — мои двенадцать стражников не намерены ждать, пока их обнаружат. Я могу заменить их людьми, которые отвечают только вам, или арестовать их этой ночью. Выбирайте, пока они не выбрали сами.

**Prompt variant (позиция `ignore`) (EN):** 
**Prompt variant (позиция `ignore`) (RU):** Ваше Величество, вы сказали Эдрику, что мёртвый король вправе держать своих призраков. Мои стражники восприняли это буквально — они всё ещё поднимают тост за Эдвина на ночном дежурстве. Я слышал о терпении из уст Эдрика; терпение — это не разрешение.

**Choice 1**
- **Choice (EN):** Replace them — new guard, no Edwin's men
- **Choice (RU):** Заменить их — новая стража, без людей Эдвина
- **Response (EN):** Done by morning. The old ones will hate you. The new ones will owe you. That is the trade.
- **Response (RU):** К утру всё будет сделано. Старые станут вас ненавидеть. Новые будут вам обязаны. Такова цена.
- **Effects:** Army +10, Loyalty -6, Treasury -5
- **Sets flag: `householdPurgedGuards`**
- **Устанавливает флаг: `householdPurgedGuards`**

**Choice 2**
- **Choice (EN):** Swear them to me — keep the swords, change the oath
- **Choice (RU):** Привести их к присяге мне — сохранить мечи, сменить клятву
- **Response (EN):** I will extract their oaths before dawn. If one refuses, you will hear it from me first.
- **Response (RU):** Я вырву у них присягу до рассвета. Если кто откажется — вы услышите об этом от меня первым.
- **Effects:** Army +5, Loyalty +5, Succession -3

**Choice 3**
- **Choice (EN):** Arrest the ringleaders — mercy for the rest
- **Choice (RU):** Арестовать зачинщиков — помилование для остальных
- **Response (EN):** Selective steel. The barracks will call it justice or spite depending on tomorrow's rations.
- **Response (RU):** Избирательная сталь. Казармы назовут это справедливостью или злобой — в зависимости от завтрашних пайков.
- **Effects:** Army +3, Loyalty -2, Church +2
- **Sets flag: `householdSelectiveGuards`**
- **Устанавливает флаг: `householdSelectiveGuards`**

---

### Beat 4 — Day 24

**Title (EN):** Ghost Signatures
**Title (RU):** Призрачные подписи
**Character (EN):** Royal Scribe Osric
**Character (RU):** Королевский писарь Осрик
**Note (EN):** Callback to Beats 2–3. References kitchen and guard choices. Day 24 is before Grey Lung (day 25) and after Empty Purse beat 3 (day 23 may have fired).
**Note (RU):** Обратная отсылка к Эпизодам 2–3. Ссылается на решения по кухне и страже. День 24 — до Серого Кашля (день 25) и после Эпизода 3 арки Пустой Казны (день 23 мог сработать).

#### Node 0

**Prompt (EN):** Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. I heard you kept Gromm, and Varn reforged the guard. Yet warrants signed in a dead king's name still leave this room. Which fake seal is yours: the seal, the clerk, or the silence?
**Prompt (RU):** Ваше Величество, одиннадцать лет я копировал почерк короля Эдвина — и его печать до сих пор отдаёт приказы о зерне, помилованиях и жалованье с моего стола. Я слышал, вы оставили Грома и Варн перековал стражу. Но грамоты, подписанные именем мёртвого короля, всё ещё покидают эту комнату. Какой из подлогов ваш: печать, писарь или молчание?

**Prompt variant (`householdPurgedGuards` + Gromm dismissed) (EN):** Your Majesty, you purged the kitchens and the barracks but my copyists still draw coin as if Edwin breathes. I heard the bold talk on day one — finish what you began, or my archive makes you a liar.
**Prompt variant (`householdPurgedGuards` + Gromm dismissed) (RU):** 

**Prompt variant (`ignore`) (EN):** Your Majesty, you chose to let ghosts walk. The ghosts still sign decrees. I heard patience from Edric's lips; I hear forgers in the night. Even ghosts need ink.
**Prompt variant (`ignore`) (RU):** Ваше Величество, вы позволили призракам бродить. Призраки по-прежнему подписывают указы. Я слышал о терпении с уст Эдрика; терпение ночью — это слышу я. Даже призракам нужны чернила.

**Prompt variant (`householdPurgedGuards` + Гром отпущен) (EN):** 
**Prompt variant (`householdPurgedGuards` + Гром отпущен) (RU):** Ваше Величество, вы вычистили кухни и казармы, но мои переписчики по-прежнему получают жалованье, как будто Эдвин ещё дышит. Я слышал смелые речи в первый день — закончите начатое, иначе мой архив сделает из вас лжеца.

**Choice 1**
- **Choice (EN):** Burn Edwin's seal — new scribes, new hand
- **Choice (RU):** Сжечь печать Эдвина — новые писари, новый почерк
- **Response (EN):** The archives will riot in parchment before steel. But the throne will sign in your name alone.
- **Response (RU):** Архивы взбунтуются пергаментом прежде стали. Но трон будет подписывать только вашим именем.
- **Effects:** Treasury +12, Loyalty -8, Succession +4
- **Sets flag: `householdCutClerks`**
- **Устанавливает флаг: `householdCutClerks`**

**Choice 2**
- **Choice (EN):** Pay one season — then dissolve the ghost offices
- **Choice (RU):** Выплатить один сезон — затем упразднить призрачные ведомства
- **Response (EN):** A soft landing. Expensive. The copyists will use the season to plot or pray.
- **Response (RU):** Мягкая посадка. Дорогостоящая. Переписчики используют этот сезон, чтобы плести заговоры или молиться.
- **Effects:** Treasury -10, Loyalty +3, Succession +2

---

### Beat 5 — Day 33

**Title (EN):** The Confessor in the Cloister
**Title (RU):** Исповедник в монастыре
**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел
**Note (EN):** Follows Church unlock (day 30). Callback to Osric and day 1 stance. If `householdCutClerks`: Arvel mentions hungry clerks fleeing to monastery.
**Note (RU):** Следует за разблокировкой Церкви (день 30). Обратная отсылка к Осрику и позиции дня 1. Если `householdCutClerks`: Арвел упоминает голодных писарей, бежавших в монастырь.

#### Node 0

**Prompt (EN):** Your Majesty, Brother Aldo confessed King Edwin every seventh day — he still does, to an empty throne. I heard you burned Edwin's seal or cut his ghost offices last week. Three of them fled to my gate with Osric's ink on their fingers. Aldo asks whether the new king shelters priests, or only hungers for names.
**Prompt (RU):** Ваше Величество, брат Альдо исповедовал короля Эдвина каждые семь дней — и по-прежнему исповедует, только пустой трон. Я слышал, вы сожгли печать Эдвина или упразднили его призрачные ведомства на прошлой неделе. Трое из них бежали к моим воротам с чернилами Осрика на пальцах. Альдо спрашивает, укрывает ли новый король священников, или только жаждет имён.

**Prompt variant (`merciful` tone) (EN):** Your Majesty, I feed the poor at my gate. Lately I feed Edwin's dismissed clerks too. I heard you told Edric you would not rule like the old king — Aldo asks if that mercy extends to the men who heard his sins.
**Prompt variant (`merciful` tone) (RU):** 

**Prompt variant (`purge`) (EN):** Your Majesty, your purge reached my threshold. Aldo will not surrender his ledger of confessions. I heard you send away all from Edwin's people — will you root through God's closet as well?
**Prompt variant (`purge`) (RU):** Ваше Величество, ваша чистка достигла моего порога. Альдо не выдаст книгу исповедей. Я слышал, вы выкорчёвываете людей Эдвина, — неужели вы намерены рыться и в Господнем чулане?

**Prompt variant (тон `merciful`) (EN):** 
**Prompt variant (тон `merciful`) (RU):** Ваше Величество, я кормлю бедных у своих ворот. В последнее время кормлю и уволенных писарей Эдвина. Я слышал, вы сказали Эдрику, что не будете править, как прежний король, — Альдо спрашивает, распространяется ли это милосердие на тех, кто слышал его грехи.

**Choice 1**
- **Choice (EN):** Shelter Aldo — priests are not clerks
- **Choice (RU):** Укрыть Альдо — священники не писари
- **Response (EN):** Then he stays under my roof and your risk. Malrik will hear of it before sunset.
- **Response (RU):** Тогда он останется под моей кровлей и вашим риском. Малрик узнает до заката.
- **Effects:** Church +8, Loyalty +4, Succession -5
- **Sets flag: `householdShelteredConfessor`**
- **Устанавливает флаг: `householdShelteredConfessor`**

**Choice 2**
- **Choice (EN):** Surrender him to the crown for questioning
- **Choice (RU):** Выдать его короне для допроса
- **Response (EN):** He will come quietly. What he knows about lords and sins could fill a scaffold schedule.
- **Response (RU):** Он придёт тихо. То, что он знает о лордах и грехах, могло бы заполнить список для виселицы.
- **Effects:** Nobility -8, Succession +8, Loyalty -4
- **Sets flag: `householdChurchDeal`**
- **Устанавливает флаг: `householdChurchDeal`**

---

### Beat 6 — Day 41

**Title (EN):** _Merged into Church arc_
**Title (RU):** _Влит в арку Церкви_
**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик
**Note (EN):** This beat no longer fires on day 41. Content merged into [Crown Forfeit & church tax War — Beat 3 (day 37)](#beat-3--day-37--the-other-half-of-the-church). Household arc jumps from day 33 (Arvel) to day 49 (Selena).
**Note (RU):** Этот эпизод больше не срабатывает на день 41. Содержание влито в [«Утраченная корона и Десятинная война» — Эпизод 3 (день 37)](#beat-3--day-37--the-other-half-of-the-church). Арка Двора перепрыгивает с дня 33 (Арвел) на день 49 (Селена).

---

### Beat 7 — Day 49

**Title (EN):** Loyalists Buy Grain
**Title (RU):** Лоялисты скупают зерно
**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена
**Note (EN):** Callback to Varn (`householdPurgedGuards` squeezes caravans), Osric, Malrik. Grey Lung optional day 45 may have fired — Selena can reference fever in variant if `plagueArcPhase = active`.
**Note (RU):** Обратная отсылка к Варну (`householdPurgedGuards` стискивает обозы), Осрику, Малрику. Необязательный день Серого Кашля 45 мог сработать — Селена может упомянуть горячку в варианте, если `plagueArcPhase = active`.

#### Node 0

**Prompt (EN):** Your Majesty, loyalist households still buy grain through my caravans — they pay in Edwin's sealed notes and curse your name between mouthfuls. I heard Captain Varn tightened the gates after you purged his old guard. That squeezes my routes and their purses. Do you want loyalists starved, spied on, or sold to you?
**Prompt (RU):** Ваше Величество, лоялистские дома по-прежнему закупают зерно через мои обозы — платят записками с печатью Эдвина и проклинают ваше имя между кусками. Я слышала, капитан Варн затянул петлю на воротах после того, как вы вычистили его старую стражу. Это сжимает мои маршруты и их кошельки. Желаете вы, чтобы лоялисты голодали, были под наблюдением или были вам проданы?

**Prompt variant (`householdKeptGromm` + no purge) (EN):** Your Majesty, Gromm still feeds your court and I still feed the realm. I heard you favor mercy in the kitchens. Loyalists ask whether that mercy extends to merchants who remember Edwin — or only to cooks who betrayed him.
**Prompt variant (`householdKeptGromm` + no purge) (RU):** 

**Prompt variant (plague arc active) (EN):** Your Majesty, Grey Lung makes every house hoard. Loyalists pay triple for grain and swear Edwin would not have let the ports cough. I heard you fund physic in the wards — do you also mean to strangle old names while the fever spreads?
**Prompt variant (plague arc active) (RU):** 

**Prompt variant (`householdKeptGromm` + без чистки) (EN):** 
**Prompt variant (`householdKeptGromm` + без чистки) (RU):** Ваше Величество, Гром по-прежнему кормит ваш двор, а я по-прежнему кормлю королевство. Я слышала, вы склонны к милосердию на кухнях. Лоялисты спрашивают, распространяется ли это милосердие на купцов, помнящих Эдвина, — или только на поваров, предавших его.

**Prompt variant (активная арка чумы) (EN):** 
**Prompt variant (активная арка чумы) (RU):** Ваше Величество, Серый Кашель заставляет каждый дом делать запасы. Лоялисты платят втройне за зерно и клянутся, что Эдвин не позволил бы портам кашлять. Я слышала, вы финансируете лечебницы в кварталах, — намерены ли вы также задушить старые имена, пока лихорадка распространяется?

**Choice 1**
- **Choice (EN):** Seize loyalist storehouses — feed the crown first
- **Choice (RU):** Захватить лоялистские склады — сначала корм для короны
- **Response (EN):** Hungry enemies are slow enemies. Hungry subjects are loud subjects. Choose which noise you prefer.
- **Response (RU):** Голодные враги медлительны. Голодные подданные голосисты. Выбирайте, какой шум вам предпочтительнее.
- **Effects:** Food +15, Loyalty -10, Treasury +8

**Choice 2**
- **Choice (EN):** Spy through Selena's routes — names for gold
- **Choice (RU):** Вести слежку через маршруты Селены — имена в обмен на золото
- **Response (EN):** I will sell you names, not honor. Remember I can sell yours as well if the price changes.
- **Response (RU):** Я продам вам имена, не честь. Помните: я могу продать и ваши, если цена изменится.
- **Effects:** Treasury -6, Succession +10, Loyalty -3
- **Sets flag: `householdSelenaBribe`**
- **Устанавливает флаг: `householdSelenaBribe`**

---

### Beat 8 — Day 58

**Title (EN):** Veterans Who Will Not Kneel
**Title (RU):** Ветераны, не желающие склонить колено
**Character (EN):** Veteran Orm
**Character (RU):** Ветеран Орм
**Note (EN):** Callback cumulative — Gromm, Varn, Selena, Malrik. If inconsistent choices: Orm mentions mixed signals. If `householdPurgedGuards`: veterans angry. If [Empty Purse](#the-empty-purse-persistent-story) active: references unpaid muster.
**Note (RU):** Накопленные обратные отсылки — Гром, Варн, Селена, Малрик. Если выборы непоследовательны: Орм упоминает смешанные сигналы. Если `householdPurgedGuards`: ветераны злятся. Если активна [Пустая Казна](#the-empty-purse-persistent-story): ссылается на неоплаченный мустер.

#### Node 0

**Prompt (EN):** Your Majesty, I wore Edwin's tabard at Grey Pass and I wear yours now — but three companies still toast the dead king in the barracks. I heard you kept his cook, reforged his guard, cut his scribes, and bought names from Selena — each week a different message. Soldiers follow clarity. Tell me whether we purge brothers, pay them, or parade them before the men who replaced them.
**Prompt (RU):** Ваше Величество, я носил накидку Эдвина у Серого Перевала и ношу вашу теперь — но три роты всё ещё поднимают тост за мёртвого короля в казармах. Я слышал, вы оставили его повара, перековали стражу, урезали писарей и купили имена у Селены — каждую неделю разные посылы. Солдаты следуют за ясностью. Скажите мне: мы чистим братьев, платим им или устраиваем им смотр перед теми, кто их заменил.

**Prompt variant (`purge` consistent) (EN):** Your Majesty, you have been consistent — steel in the kitchen, steel in the guard, steel in the archive. I heard the court call you cruel. The companies call you clear. We still resist. Give me leave to finish what you began — or give me coin.
**Prompt variant (`purge` consistent) (RU):** 

**Prompt variant (`integrate` + `householdKeptGromm`) (EN):** Your Majesty, I heard mercy bought Gromm and oaths bought the guard. Veterans call it treason with better table manners. We want proof the king who took the throne is still a soldier's king — and that soldier's king still pays.
**Prompt variant (`integrate` + `householdKeptGromm`) (RU):** Ваше Величество, я слышал, что милосердие купило Грома, а клятвы — стражу. Ветераны называют это изменой с лучшими манерами за столом. Мы хотим доказательства, что тот, кто взял трон по-прежнему король-солдат — и что этот король-солдат по-прежнему платит.

**Prompt variant (`emptyPurseCrisis` set) (EN):** Your Majesty, I heard Rudolf beg Borvin and Borvin beg heaven. The companies heard emptier purses. We will kneel when the crown kneels to arithmetic — or we will march.
**Prompt variant (`emptyPurseCrisis` set) (RU):** 

**Prompt variant (последовательная позиция `purge`) (EN):** 
**Prompt variant (последовательная позиция `purge`) (RU):** Ваше Величество, вы были последовательны — сталь на кухне, сталь в страже, сталь в архиве. Я слышал, двор называет вас жестоким. Роты называют вас ясным. Мы всё ещё сопротивляемся. Дайте мне приказ закончить начатое — или дайте монету.

**Prompt variant (`emptyPurseCrisis` установлен) (EN):** 
**Prompt variant (`emptyPurseCrisis` установлен) (RU):** Ваше Величество, я слышал, как Рудольф умоляет Борвина, а Борвин умоляет небеса. Роты слышали только пустеющие кошельки. Мы склоним колено, когда корона склонится перед арифметикой, — или мы выступим маршем.

**Choice 1**
- **Choice (EN):** Purge the veteran companies — Edwin's oath is treason
- **Choice (RU):** Вычистить ветеранские роты — клятва Эдвину есть государственная измена
- **Response (EN):** Then blood in the barracks before spring. The rest will kneel harder — if you pay the rest.
- **Response (RU):** Тогда кровь в казармах до весны. Остальные будут клоняться усерднее — если вы им платите.
- **Effects:** Army +12, Loyalty -12, Succession +6
- **Sets flag: `householdVeteranPurge`**
- **Устанавливает флаг: `householdVeteranPurge`**

**Choice 2**
- **Choice (EN):** Pay them off — gold buys forgetfulness
- **Choice (RU):** Откупиться — золото покупает забвение
- **Response (EN):** Expensive peace. Cheaper than mutiny until the next empty purse.
- **Response (RU):** Дорогостоящий мир. Дешевле мятежа — до следующего пустого кошелька.
- **Effects:** Treasury -18, Army +8, Loyalty -4

---

### Beat 9 — Day 67

**Title (EN):** Who Stands at the Door
**Title (RU):** Кто стоит у двери
**Character (EN):** Bodyguard Raena
**Character (RU):** Телохранитель Раэна
**Note (EN):** Callback entire arc — lists cumulative flags in prompt. Pre-resolution judgment at the king's threshold (not the scaffold). Grey Lung Beat 4 is day 70 — this beat sets tone before plague crisis.
**Note (RU):** Обратная отсылка на всю арку — перечисляет накопленные флаги в реплике. Предфинальный вердикт у порога королевских покоев (не у эшафота). Эпизод 4 Серого Кашля — день 70; этот эпизод задаёт тон перед кризисом чумы.

#### Node 0

**Prompt (EN):** Your Majesty, my post is your door — not the yard below. Yet Varn sent prisoners here, Osric's audit named clerks, and Arvel's gate still shelters whispers unless you forbade it. I heard mercy in the kitchens, steel in the barracks, gold in the market, and prayer in the cloister. The stair asks a simpler question: who do I turn away when the palace is full of Edwin's names?
**Prompt (RU):** Ваше Величество, мой пост — ваша дверь, не двор внизу. Однако Варн присылал сюда узников, аудит Осрика называл имена писарей, и ворота Арвела по-прежнему укрывают шёпоты — если вы не запретили. Я слышала о милосердии на кухнях, стали в казармах, золоте на рынке и молитвах в монастыре. Лестница задаёт более простой вопрос: кого мне не пускать, когда дворец полон именами Эдвина?

**Prompt variant (`householdShelteredConfessor` + no purge) (EN):** Your Majesty, you sheltered priests and spared cooks while petitioners crowd my landing. I heard selective justice from Edric's lips on day one. The prisoners heard it too. They ask why Aldo breathes free and they wait on my mat.
**Prompt variant (`householdShelteredConfessor` + no purge) (RU):** 

**Prompt variant (`householdVeteranPurge`) (EN):** Your Majesty, Orm's purge sent thirty names to the lower gate. I heard consistency at last. My sword arm aches from turning them away. The realm expects a crown that finishes sentences — not only begins them at the threshold.
**Prompt variant (`householdVeteranPurge`) (RU):** Ваше Величество, чистка Орма отправила тридцать имён к нижним воротам. Я наконец слышала последовательность. Рука моя устала от того, что я гоню их прочь. Королевство ожидает, что корона, начиная фразу, её и заканчивает — а не только открывает на пороге.

**Prompt variant (`householdShelteredConfessor` + без чистки) (EN):** 
**Prompt variant (`householdShelteredConfessor` + без чистки) (RU):** Ваше Величество, вы укрыли священников и пощадили поваров, пока просители теснятся на моей площадке. Я слышала избирательное правосудие из уст Эдрика ещё в первый день. Узники тоже слышали. Они спрашивают, почему Альдо дышит на свободе, а они ждут на моём коврике.

**Choice 1**
- **Choice (EN):** forgiveness — open the door to loyalists you have held
- **Choice (RU):** Амнистия — открыть дверь лоялистам, которых вы держали
- **Response (EN):** The stair goes quiet. The whispers do not. You have chosen mercy twice — pray it rhymes.
- **Response (RU):** Лестница замолкает. Шёпоты — нет. Вы выбрали милосердие дважды — молите, чтобы оно рифмовалось.
- **Effects:** Loyalty +12, Army -6, Succession -8

**Choice 2**
- **Choice (EN):** Send ringleaders to Morwen — mercy for the rest at the door
- **Choice (RU):** Отправить зачинщиков к Морвен — помилование для остальных у двери
- **Response (EN):** A few swings below, many sighs above. The middle path — until the next crisis.
- **Response (RU):** Несколько взмахов внизу — много вздохов наверху. Средний путь — до следующего кризиса.
- **Effects:** Army +6, Loyalty -4, Succession +5

---

### Beat 10 — Day 86

**Title (EN):** Verdict on the Household
**Title (RU):** Вердикт о дворе
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Arc finale. **On load:** run [day 86 outcome priority](#household--beat-resolution-rules) → `householdOutcome`, `householdArcPhase = resolved`.
**Note (RU):** Финал арки. **При загрузке:** выполнить [приоритет итога дня 86](#household--beat-resolution-rules) → `householdOutcome`, `householdArcPhase = resolved`.

#### Node 0

**Prompt (outcome `clean_court`) (EN):** Your Majesty, eighty-six days since you told me how you would bear Edwin's household — and the court has its answer. I heard Gromm dismissed or driven out, Varn replaced, Osric's ghosts locked away. The kitchens are quiet. The barracks call you iron. You cleansed the court. History will argue justice. It will not argue hesitation.
**Prompt (outcome `clean_court`) (RU):** 

**Prompt (outcome `turned_household`) (EN):** Your Majesty, Edwin's cook still feeds you, Edwin's guard still watches your stair, and you still watch them. I heard mercy became policy. The household did not vanish — it changed collars. Dangerous — but the kitchens are warm, and the realm calls you a king who keeps witnesses.
**Prompt (outcome `turned_household`) (RU):** 

**Prompt (outcome `haunted_palace`) (EN):** Your Majesty, you had greater wars, you said — and Edwin's people still walk these halls like smoke. I heard whispers in the archive, prayers in the cloister, old songs in the yard. You chose a haunted palace. The court obeys. It does not forget.
**Prompt (outcome `haunted_palace`) (RU):** 

**Prompt (outcome `ledger_king`) (EN):** Your Majesty, you ruled case by case — no doctrine, only judgment. I heard mercy for Gromm, rope for others, coin for Selena, silence for Osric. The court calls it wisdom or weakness depending on who survived. I call it the hardest throne to defend.
**Prompt (outcome `ledger_king`) (RU):** 

**Prompt (outcome `iron_crown`) (EN):** Your Majesty, you were merciful, then cruel — and the household learned both lessons. I heard inconsistency louder than policy. The barracks fear you. The kitchens hate you. The ghosts are quiet only because they are calculating. You are iron wearing velvet.
**Prompt (outcome `iron_crown`) (RU):** 

**Prompt (итог `clean_court`) (EN):** 
**Prompt (итог `clean_court`) (RU):** Ваше Величество, восемьдесят шесть дней с тех пор, как вы сказали мне, как намерены обращаться с двором Эдвина, — и двор получил свой ответ. Я слышал: Гром уволен или изгнан, Варн заменён, призраки Осрика заперты. Кухни тихи. Казармы называют вас железом. Вы очистили двор. История поспорит о справедливости. О нерешительности — нет.

**Prompt (итог `turned_household`) (EN):** 
**Prompt (итог `turned_household`) (RU):** Ваше Величество, повар Эдвина по-прежнему кормит вас, стража Эдвина по-прежнему охраняет вашу лестницу, а вы по-прежнему наблюдаете за ними. Я слышал, что милосердие стало политикой. Двор не исчез — он сменил ошейник. Опасно — но кухни тёплые, и королевство называет вас королём, который держит свидетелей.

**Prompt (итог `haunted_palace`) (EN):** 
**Prompt (итог `haunted_palace`) (RU):** Ваше Величество, у вас были войны поважнее, говорили вы, — и люди Эдвина по-прежнему бродят по этим залам, как дым. Я слышал шёпоты в архиве, молитвы в монастыре, старые песни во дворе. Вы выбрали дворец призраков. Двор повинуется. Но не забывает.

**Prompt (итог `ledger_king`) (EN):** 
**Prompt (итог `ledger_king`) (RU):** Ваше Величество, вы правили от случая к случаю — без доктрины, только суждением. Я слышал: милосердие для Грома, верёвка для других, золото для Селены, молчание для Осрика. Двор называет это мудростью или слабостью — в зависимости от того, кто выжил. Я называю это самым трудным троном для защиты.

**Prompt (итог `iron_crown`) (EN):** 
**Prompt (итог `iron_crown`) (RU):** Ваше Величество, вы были милосердны — а потом жестоки — и двор усвоил оба урока. Я слышал непоследовательность громче всякой политики. Казармы вас боятся. Кухни вас ненавидят. Призраки молчат лишь потому, что подсчитывают. Вы — железо в бархате.

**Choice 1**
- **Choice (EN):** I have heard enough — dismiss the household court
- **Choice (RU):** Хватит — распустить придворный суд двора
- **Response (EN):** Then I write *iron* once, and close the chapter. You bought clarity at the price of warmth.
- **Response (RU):** Тогда я пишу *железо* один раз и закрываю главу. Вы купили ясность ценой тепла.
- **Effects:** Army +8, Succession +10, Loyalty -5

---

## Below the Tapestry (persistent story)
## За Гобеленом (длящаяся история)

### Beat 1 — Day 87

**Title (EN):** Who Slept Where
**Title (RU):** Кто где спал
**Character (EN):** Maid Lissa
**Character (RU):** Служанка Лисса
**Note (EN):** Opens arc one day after [Household finale](#beat-10--day-86--verdict-on-the-household). Pre–People unlock (89). Sets `tapestryArcPhase = active`.
**Note (RU):** Открывает арку на следующий день после [финала Двора](#beat-10--day-86--verdict-on-the-household). До разблокировки People (89). Устанавливает `tapestryArcPhase = active`.

#### Node 0

**Prompt (EN):** Your Majesty, I am Lissa — I change sheets and pretend not to count the stains. The night of the coup, three chambers lit candles after midnight. I heard you cleansed Edwin's household, turned them, or let ghosts keep their shifts. Servants know who slept where. Hang gossip, pay gossip, or learn from it.
**Prompt (RU):** Ваше Величество, я — Лисса. Меняю простыни и делаю вид, что не считаю пятна. В ночь переворота три покоя зажгли свечи после полуночи. Я слышала, что вы вычистили двор Эдвина, обратили его или позволили призракам оставаться на своих местах. Слуги знают, кто где спал. Вешайте сплетни, платите за них или учитесь у них.

**Prompt variant (`householdOutcome = haunted_palace`) (EN):** Your Majesty, I heard you let ghosts remain. The stairs already believe you. I am merely confirming.
**Prompt variant (`householdOutcome = haunted_palace`) (RU):** Ваше Величество, я слышала, что вы оставили призраков. Лестница и без того вам верит. Я лишь подтверждаю.

**Prompt variant (`householdOutcome = clean_court`) (EN):** Your Majesty, I heard you purged the court. The staff fear you more than they love Edwin's memory. Fear keeps sheets clean — sometimes.
**Prompt variant (`householdOutcome = clean_court`) (RU):** Ваше Величество, я слышала, что вы вычистили двор. Персонал боится вас больше, чем любит память об Эдвине. Страх держит простыни чистыми — иногда.

**Choice 1**
- **Choice (EN):** Hear her privately — crown wants the truth
- **Choice (RU):** Выслушать её приватно — корона хочет правды
- **Response (EN):** Then I speak softly and charge dearly. Truth is employment, not loyalty.
- **Response (RU):** Тогда я говорю тихо и беру дорого. Правда — это работа, а не верность.
- **Effects:** Loyalty +6, Succession +4
- **Trust: +12**
- **Sets flag: `tapestryLissaCoupNight`**
- **Доверие: +12**
- **Устанавливает флаг: `tapestryLissaCoupNight`**

**Choice 2**
- **Choice (EN):** Silence her — no servant testifies about coup night
- **Choice (RU):** Заткнуть её — ни один слуга не свидетельствует о ночи переворота
- **Response (EN):** Then whispers go underground. Underground whispers grow mold. You chose silence.
- **Response (RU):** Тогда шёпоты уходят под землю. Подземные шёпоты плесневеют. Вы выбрали молчание.
- **Effects:** Army +3, Loyalty -6, Health -3
- **Trust: −10**
- **Доверие: −10**

**Choice 3**
- **Choice (EN):** Reward her silence — buy the stairs with coin
- **Choice (RU):** Наградить её молчание — купить лестницу монетой
- **Response (EN):** Gold buys lips closed. It does not buy hearts open. I will take the coin anyway.
- **Response (RU):** Золото закрывает губы. Но не открывает сердца. Монету я всё равно возьму.
- **Effects:** Treasury -10, Loyalty +3
- **Trust: +5**
- **Доверие: +5**

---

### Beat 2 — Day 94

**Title (EN):** Mock the king who took the throne
**Title (RU):** Осмеять того, кто взял трон
**Character (EN):** Royal Jester Til
**Character (RU):** Придворный шут Тиль
**Note (EN):** Between Hungry beats (93 Ruta, 100 Gromm). Pre–People unlock. Til tests whether court laughs at crown or court.
**Note (RU):** Между эпизодами Голода (день 93, Рута; день 100, Гром). До разблокировки People. Тиль проверяет, над кем смеётся двор — над короной или над собой.

#### Node 0

**Prompt (EN):** Your Majesty, I am Til — licensed fool, unlicensed mirror. The court wants laughter before the granaries empty. I can mock the king who took the throne, mock the court that serves him, or mock neither and let tension rot. Malrik hates my mouth. The barracks love it. You hire the joke — choose the target.
**Prompt (RU):** Ваше Величество, я — Тиль. Официальный дурак и неофициальное зеркало. Двор хочет смеха, пока житницы не опустели. Я могу осмеять того, кто взял трон, осмеять двор, который ему служит, или не осмеять никого — и пустить напряжение гнить. Малрик ненавидит мой рот. Казармы его любят. Вы нанимаете шутку — выбирайте мишень.

**Prompt variant (`tapestryLissaCoupNight`) (EN):** Your Majesty, I heard Lissa knows coup-night sheets. I can rhyme that — or bury it. Rhymes travel faster than maids.
**Prompt variant (`tapestryLissaCoupNight`) (RU):** Ваше Величество, я слышал, что Лисса знает простыни ночи переворота. Я могу срифмовать это — или закопать. Рифмы распространяются быстрее, чем служанки.

**Prompt variant (`churchArcPhase = active`) (EN):** Your Majesty, I heard Malrik's forfeit machine warms up. Jokes about heaven go viral. I charge extra for insult to the sacred.
**Prompt variant (`churchArcPhase = active`) (RU):** Ваше Величество, я слышал, что механизм забор имущества Малрика разогревается. Шутки о небесах становятся вирусными. За богохульство беру дороже.

**Choice 1**
- **Choice (EN):** Mock the court — servants and soldiers first
- **Choice (RU):** Осмеять двор — слуги и солдаты прежде всего
- **Response (EN):** Then nobles blush and commons cheer. Dangerous comedy. Delicious comedy.
- **Response (RU):** Тогда знать краснеет, чернь ликует. Опасная комедия. Восхитительная комедия.
- **Effects:** Loyalty +8, Nobility -6, Army +4
- **Trust: +10**
- **Sets flag: `tapestryTilMockCrown` (inverted — mocks court not crown)**
- **Доверие: +10**
- **Устанавливает флаг: `tapestryTilMockCrown` (инвертировано — осмеяние двора, не короны)**

**Choice 2**
- **Choice (EN):** Mock the king who took the throne — laugh at yourself
- **Choice (RU):** Осмеять того, кто взял трон — смеяться над собой
- **Response (EN):** Bold. Rare. The court relaxes because you do not flinch. They may forget to fear you.
- **Response (RU):** Смело. Редко. Двор расслабляется, потому что вы не вздрагиваете. Они могут забыть бояться вас.
- **Effects:** Loyalty +5, Succession -4, Health +5
- **Trust: +6**
- **Доверие: +6**

**Choice 3**
- **Choice (EN):** Silence Til — no jokes this season
- **Choice (RU):** Заткнуть Тиля — никаких шуток в этом сезоне
- **Response (EN):** Then the hall learns to whisper instead of laugh. Whispers are less funny and more pointed.
- **Response (RU):** Тогда зал учится шептать вместо смеха. Шёпоты менее смешны и более остры.
- **Effects:** Loyalty -5, Church +4
- **Trust: −8**
- **Доверие: −8**

---

### Beat 3 — Day 98

**Title (EN):** Kitchen Hears Everything
**Title (RU):** Кухня слышит всё
**Character (EN):** Cook Gromm
**Character (RU):** Повар Гром
**Note (EN):** Two days before Hungry [day 100](#beat-10--day-100--kitchens-versus-provinces). Callback `householdKeptGromm`.
**Note (RU):** Два дня до [дня 100 Голода](#beat-10--day-100--kitchens-versus-provinces). Обратная отсылка: `householdKeptGromm`.

#### Node 0

**Prompt (EN):** Your Majesty, the kitchen hears vows the chapel does not. I heard Lissa's gossip, Til's rhymes, and whether Edwin's cook still feeds a king who took the throne. Borvin counts grain while Ruta counts dust. Tell me whether the crown feeds the staff first, audits the staff, or pretends kitchens are not politics.
**Prompt (RU):** Ваше Величество, кухня слышит клятвы, которых не слышит часовня. Я слышал сплетни Лиссы, рифмы Тиля и знаю, кормит ли повар Эдвина того, кто взял трон до сих пор. Борвин считает зерно, Рута считает пыль. Скажите мне: корона кормит персонал первым, проверяет персонал или делает вид, что кухни — не политика.

**Prompt variant (`householdKeptGromm`) (EN):** Your Majesty, I heard you kept me. I remember Edwin's table. I serve yours — but the pots remember both.
**Prompt variant (`householdKeptGromm`) (RU):** Ваше Величество, я слышал, что вы оставили меня. Я помню стол Эдвина. Я служу вашему — но горшки помнят оба.

**Prompt variant (`famineSeverity` ≥ 40) (EN):** Your Majesty, hunger reached the servants' hall before the provinces sang. Feed us and they call you human. Starve us and they call you Edwin's echo.
**Prompt variant (`famineSeverity` ≥ 40) (RU):** Ваше Величество, голод добрался до слуг раньше, чем провинции запели. Накормите нас — и вас назовут человеком. Оставьте голодать — и вас назовут эхом Эдвина.

**Choice 1**
- **Choice (EN):** Staff rations first — loyalty begins below stairs
- **Choice (RU):** Сначала пайки для персонала — верность начинается ниже лестницы
- **Response (EN):** Then pots bless your name before heralds do. Expensive — but the stairs warm.
- **Response (RU):** Тогда горшки благословят ваше имя раньше глашатаев. Дорого — но лестница согревается.
- **Effects:** Food -6, Loyalty +10, Health +4
- **Trust: +15**
- **Sets flag: `tapestryGrommKitchen`**
- **Доверие: +15**
- **Устанавливает флаг: `tapestryGrommKitchen`**

**Choice 2**
- **Choice (EN):** Audit the kitchens — theft before sentiment
- **Choice (RU):** Проверить кухни — сначала кражи, потом чувства
- **Response (EN):** Then spoons hide and whispers sharpen. Order without love. Familiar palace music.
- **Response (RU):** Тогда ложки прячутся, а шёпоты заостряются. Порядок без любви. Знакомая дворцовая музыка.
- **Effects:** Treasury +8, Loyalty -6, Food +3
- **Trust: −8**
- **Доверие: −8**

**Choice 3**
- **Choice (EN):** Shared hardship — servants eat what provinces eat
- **Choice (RU):** Общие лишения — слуги едят то, что едят провинции
- **Response (EN):** Dangerous solidarity. I will not call it noble until it works.
- **Response (RU):** Опасная солидарность. Называть её благородной не стану, пока не сработает.
- **Effects:** Food -4, People +4, Loyalty +6
- **Trust: +8**
- **Доверие: +8**

---

### Beat 4 — Day 102

**Title (EN):** Gossip at the Door
**Title (RU):** Сплетни у двери
**Character (EN):** Bodyguard Raena
**Character (RU):** Телохранитель Раэна
**Note (EN):** Post–People unlock (89). Lissa vs Raena tension.
**Note (RU):** После разблокировки People (89). Напряжение Лисса против Раэны.

#### Node 0

**Prompt (EN):** Your Majesty, Lissa sells stories. I sell silence. I heard you opened the stairs, silenced them, or bought them. My sword guards your door — not your reputation. Double my post, gag the maids, or let gossip flow and prove you can survive it.
**Prompt (RU):** Ваше Величество, Лисса торгует историями. Я торгую молчанием. Я слышала: вы открыли лестницу, заткнули её или купили. Мой меч охраняет вашу дверь — не вашу репутацию. Удвойте мой пост, заткните служанок или пустите сплетни течь и докажите, что вы переживёте их.

**Prompt variant (`tapestryLissaCoupNight`) (EN):** Your Majesty, I heard what Lissa knows. I do not repeat it. That is loyalty — or blackmail with better posture.
**Prompt variant (`tapestryLissaCoupNight`) (RU):** Ваше Величество, я знаю, что знает Лисса. Я не повторяю. Это верность — или шантаж с лучшей осанкой.

**Prompt variant (`emptyPursePhase = active`) (EN):** Your Majesty, I heard the purse empties. Unpaid guards gossip too.
**Prompt variant (`emptyPursePhase = active`) (RU):** Ваше Величество, я слышала, что казна пустеет. Неоплаченные стражники тоже сплетничают.

**Choice 1**
- **Choice (EN):** Trust Raena — gag servant gossip, not the guard
- **Choice (RU):** Доверять Раэне — заткнуть сплетни слуг, но не стражи
- **Response (EN):** Then Lissa learns fear. I learn overtime. The door stays yours.
- **Response (RU):** Тогда Лисса усвоит страх. Я усвою сверхурочные. Дверь остаётся вашей.
- **Effects:** Army +5, Loyalty +6, People -4
- **Trust: +10**
- **Sets flag: `tapestryRaenaDoor`**
- **Доверие: +10**
- **Устанавливает флаг: `tapestryRaenaDoor`**

**Choice 2**
- **Choice (EN):** Trust the stairs — let Lissa speak, Raena listens
- **Choice (RU):** Доверять лестнице — пусть Лисса говорит, Раэна слушает
- **Response (EN):** Then I hear everything and repeat nothing — unless you ask. Harder job. Better court.
- **Response (RU):** Тогда я слышу всё и не повторяю ничего — если вы не спросите. Работа труднее. Двор лучше.
- **Effects:** Loyalty +8, Health +3
- **Trust: +12**
- **Доверие: +12**

**Choice 3**
- **Choice (EN):** Trust neither — rotate both posts
- **Choice (RU):** Не доверять никому — чередовать оба поста
- **Response (EN):** Then both hate you equally. Paranoia loves rotation. So does Knox, apparently.
- **Response (RU):** Тогда обе одинаково вас ненавидят. Паранойя любит ротацию. Нокс, кажется, тоже.
- **Effects:** Loyalty -8, Succession +4
- **Trust: −12**
- **Доверие: −12**

---

### Beat 5 — Day 112

**Title (EN):** Edwin's Chamber
**Title (RU):** Покои Эдвина
**Character (EN):** Maid Lissa
**Character (RU):** Служанка Лисса
**Note (EN):** Mid–Hungry Season. Callback `tapestryLissaCoupNight`, `householdOutcome`.
**Note (RU):** Середина Голодного Сезона. Обратная отсылка: `tapestryLissaCoupNight`, `householdOutcome`.

#### Node 0

**Prompt (EN):** Your Majesty, Edwin's chamber still receives candles — not from piety, from habit. I heard you haunt the palace, cleanse it, or ledger it case by case. Lock the room and anger ghosts, use it and anger nobles, or turn it into servant quarters and anger poets. The stairs watch which king you become at night.
**Prompt (RU):** Ваше Величество, покои Эдвина до сих пор получают свечи — не из благочестия, а из привычки. Я слышала, что вы населяете дворец призраками, очищаете его или судите каждый случай по отдельности. Заприте комнату — разгневайте призраков; займите её — разгневайте знать; переделайте в служивые покои — разгневайте поэтов. Лестница наблюдает, каким королём вы становитесь по ночам.

**Prompt variant (`tapestryChamberUsed` false) (EN):** Your Majesty, no one has slept there since the coup — until last week. I will not say who without your policy.
**Prompt variant (`tapestryChamberUsed` false) (RU):** Ваше Величество, там никто не спал с ночи переворота — до прошлой недели. Я не назову имя без вашей политики.

**Choice 1**
- **Choice (EN):** Seal the chamber — crown does not sleep in Edwin's ghost
- **Choice (RU):** Запечатать покои — корона не спит в призраке Эдвина
- **Response (EN):** Then poets mourn and servants breathe easier. Both matter — on different floors.
- **Response (RU):** Тогда поэты скорбят, а слуги дышат свободнее. Оба имеют значение — на разных этажах.
- **Effects:** Church +5, Loyalty +4, Health +3
- **Trust: +6**
- **Доверие: +6**

**Choice 2**
- **Choice (EN):** Use the chamber openly — king who took the throne owns night and day
- **Choice (RU):** Открыто занять покои — тот, кто взял трон владеет днём и ночью
- **Response (EN):** Bold insult to memory. The court calls it strength or insult to the sacred depending on who lost kin.
- **Response (RU):** Дерзкое оскорбление памяти. Двор называет это силой или оскорблением святого — в зависимости от того, кто потерял родственников.
- **Effects:** Succession +8, Nobility -8, Loyalty -4
- **Trust: −5**
- **Sets flag: `tapestryChamberUsed`**
- **Доверие: −5**
- **Устанавливает флаг: `tapestryChamberUsed`**

**Choice 3**
- **Choice (EN):** Gift chamber to loyal staff — stairs inherit the room
- **Choice (RU):** Подарить покои преданному персоналу — лестница наследует комнату
- **Response (EN):** Then Gromm weeps or curses. I cannot tell which. You bought warmth with symbolism.
- **Response (RU):** Тогда Гром заплачет или выругается. Не могу разобрать, что именно. Вы купили тепло символом.
- **Effects:** Loyalty +12, Food -3, Nobility -4
- **Trust: +18**
- **Доверие: +18**

---

### Beat 6 — Day 118

**Title (EN):** Public Roast
**Title (RU):** Публичное осмеяние
**Character (EN):** Royal Jester Til
**Character (RU):** Придворный шут Тиль
**Note (EN):** One day before [Hungry Season finale](#beat-12--day-119--verdict-on-hunger). High visibility beat.
**Note (RU):** За день до [финала Голодного Сезона](#beat-12--day-119--verdict-on-hunger). Эпизод с высокой видимостью.

#### Node 0

**Prompt (EN):** Your Majesty, the square wants bread — but it will take a joke first. I can roast the king who took the throne before the hungry finale, roast Ashford before she rides, or roast Malrik and dare the Church to laugh. Public roast builds trust or builds mobs. Choose the victim — or cancel the show.
**Prompt (RU):** Ваше Величество, площадь хочет хлеба — но сначала возьмёт шутку. Я могу осмеять того, кто взял трон перед голодным финалом, осмеять Эшфорд до того, как она выедет, или осмеять Малрика и испытать, умеет ли Церковь смеяться. Публичное осмеяние строит доверие или строит толпы. Выбирайте жертву — или отменяйте представление.

**Prompt variant (`famineSeverity` ≥ 50) (EN):** Your Majesty, severity outran jokes. Roast badly and they riot. Roast well and they forget hunger for an hour. Both are policy.
**Prompt variant (`famineSeverity` ≥ 50) (RU):** Ваше Величество, тяжесть обогнала шутки. Осмейте плохо — получите бунт. Осмейте хорошо — они на час забудут о голоде. Оба варианта — политика.

**Prompt variant (`tapestryTilMockCrown`) (EN):** Your Majesty, I heard you let me mock the court. The commons want an encore with sharper teeth.
**Prompt variant (`tapestryTilMockCrown`) (RU):** Ваше Величество, я слышал, что вы позволили мне осмеять двор. Чернь хочет повторения с более острыми зубами.

**Choice 1**
- **Choice (EN):** Roast the crown — humility before hunger verdict
- **Choice (RU):** Осмеять корону — смирение перед вердиктом о голоде
- **Response (EN):** Then they love you for a day. A day is currency this year.
- **Response (RU):** Тогда они полюбят вас на день. День в этом году — валюта.
- **Effects:** People +10, Loyalty +8, Succession -6
- **Trust: +12**
- **Sets flag: `tapestryTilPublicRoast`**
- **Доверие: +12**
- **Устанавливает флаг: `tapestryTilPublicRoast`**

**Choice 2**
- **Choice (EN):** Roast the Church — bread before church tax
- **Choice (RU):** Осмеять Церковь — хлеб прежде церковного налога
- **Response (EN):** Malrik will call it treason. The market calls it overdue. I call it employment.
- **Response (RU):** Малрик назовёт это изменой. Рынок — давно назревшим. Я — работой.
- **Effects:** Church -12, People +8, Loyalty +4
- **Trust: +8**
- **Sets flag: `tapestryTilPublicRoast`**
- **Доверие: +8**
- **Устанавливает флаг: `tapestryTilPublicRoast`**

**Choice 3**
- **Choice (EN):** Cancel the roast — fear beats laughter
- **Choice (RU):** Отменить осмеяние — страх сильнее смеха
- **Response (EN):** Then the square goes home angry without a punchline. Hunger remains. You chose caution.
- **Response (RU):** Тогда площадь расходится злой и без финала. Голод остаётся. Вы выбрали осторожность.
- **Effects:** Loyalty -6, Army +4
- **Trust: −10**
- **Доверие: −10**

---

### Beat 7 — Day 126

**Title (EN):** Servants Sell Names
**Title (RU):** Слуги продают имена
**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс
**Note (EN):** One day before finale. One day before [Guild day 128](#beat-1--day-128--credit-withheld). Foreshadows [Court of Knives](#the-court-of-knives-persistent-story).
**Note (RU):** За день до финала. За день до [дня 128 Гильдии](#beat-1--day-128--credit-withheld). Предвестие [Суда Ножей](#the-court-of-knives-persistent-story).

#### Node 0

**Prompt (EN):** Your Majesty, I bought a maid's memory and a pot-boy's schedule. Lissa's coup-night story walks in three ledgers already — Salt's, Ashford's eventual, and mine. I heard open stairs, silenced stairs, or loyal stairs. Purge the sellers, outbid the buyers, or let the leak teach you who still wants Edwin's chair.
**Prompt (RU):** Ваше Величество, я купил память служанки и расписание поварёнка. История Лиссы о ночи переворота уже ходит в трёх книгах — у Солта, у будущей Эшфорд и у меня. Я слышал об открытой лестнице, заткнутой лестнице и преданной лестнице. Казните продавцов, перебейте покупателей ценой или пустите утечку учить вас, кто ещё хочет кресло Эдвина.

**Prompt variant (`tapestryLissaCoupNight`) (EN):** Your Majesty, I heard you paid Lissa for truth. I sell cheaper truth. Competition is healthy.
**Prompt variant (`tapestryLissaCoupNight`) (RU):** Ваше Величество, я слышал, что вы заплатили Лиссе за правду. Я продаю более дешёвую правду. Конкуренция здорова.

**Prompt variant (`tapestryRaenaDoor`) (EN):** Your Majesty, Raena's silence has a price too. Everyone's does — except mine, which is higher.
**Prompt variant (`tapestryRaenaDoor`) (RU):** Ваше Величество, молчание Раэны тоже имеет цену. Как и у всех — кроме моей, которая выше.

**Choice 1**
- **Choice (EN):** Purge sellers — hang one servant as warning
- **Choice (RU):** Казнить продавцов — повесить одного слугу для острастки
- **Response (EN):** Then the stairs freeze. Fear works. Loyalty pretends to work. Both invoice you.
- **Response (RU):** Тогда лестница замирает. Страх работает. Верность притворяется, что работает. Оба выставляют вам счёт.
- **Effects:** Army +6, Loyalty -12, People -8
- **Trust: −15**
- **Доверие: −15**

**Choice 2**
- **Choice (EN):** Outbid Knox — buy the list back
- **Choice (RU):** Перебить Нокса ценой — выкупить список обратно
- **Response (EN):** Then you rent silence weekly. I appreciate repeat customers.
- **Response (RU):** Тогда вы арендуете молчание еженедельно. Я ценю постоянных клиентов.
- **Effects:** Treasury -15, Loyalty +8
- **Trust: +10**
- **Sets flag: `tapestryKnoxServants`**
- **Доверие: +10**
- **Устанавливает флаг: `tapestryKnoxServants`**

**Choice 3**
- **Choice (EN):** Let coup story leak — controlled scandal
- **Choice (RU):** Пустить историю переворота в утечку — управляемый скандал
- **Response (EN):** Then the court controls nothing — but learns who moves. Dangerous pedagogy.
- **Response (RU):** Тогда двор ничем не управляет — но учится, кто двигается. Опасная педагогика.
- **Effects:** Loyalty -4, Succession +6, People +4
- **Trust: −5**
- **Sets flag: `tapestryCoupNarrow` (if Raena + Lissa loyal)**
- **Доверие: −5**
- **Устанавливает флаг: `tapestryCoupNarrow` (если Раэна + Лисса преданы)**

---

### Beat 8 — Day 127

**Title (EN):** Verdict on the Stairs
**Title (RU):** Вердикт о лестнице
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Arc finale. **On load:** run [day 127 outcome priority](#below-the-tapestry--beat-resolution-rules) → `tapestryOutcome`, `tapestryArcPhase = resolved`. Before Grey Lung day 130 and Guild day 128.
**Note (RU):** Финал арки. **При загрузке:** выполнить [приоритет итога дня 127](#below-the-tapestry--beat-resolution-rules) → `tapestryOutcome`, `tapestryArcPhase = resolved`. До Серого Кашля на день 130 и Гильдии на день 128.

#### Node 0

**Prompt (outcome `loyal_staff`) (EN):** Your Majesty, forty days since Lissa counted coup-night candles — and the stairs speak your name without spitting. I heard kitchens fed, doors guarded, jokes aimed at court not crown, Knox outbid. Loyal staff. Rare beneath a king who took the throne. Guard it before Ashford measures the upper halls.
**Prompt (outcome `loyal_staff`) (RU):** 

**Prompt (outcome `coup_avoided`) (EN):** Your Majesty, I heard servants sell names and knives almost find your door. Knox lost the bid — or you hung the sellers. Palace coup narrowly avoided. The stairs remember how close it was.
**Prompt (outcome `coup_avoided`) (RU):** 

**Prompt (outcome `haunted_servants`) (EN):** Your Majesty, I heard ghosts in Edwin's chamber, silence in Til's mouth, fear in Lissa's eyes. Haunted servants — loyal to memory more than you. The palace obeys. It does not warm.
**Prompt (outcome `haunted_servants`) (RU):** 

**Prompt (outcome `jesters_truth`) (EN):** Your Majesty, I heard Til roast crown, Church, and hunger before the square. Jester's truth — laughter as policy. The commons trust the fool more than the herald. Dangerous. Effective.
**Prompt (outcome `jesters_truth`) (RU):** 

**Prompt (итог `loyal_staff`) (EN):** 
**Prompt (итог `loyal_staff`) (RU):** Ваше Величество, сорок дней прошло с тех пор, как Лисса считала ночные свечи переворота, — и лестница произносит ваше имя, не сплёвывая. Я слышал: кухни накормлены, двери охраняются, шутки направлены на двор, а не корону, Нокс перебит ценой. Преданный персонал. Редкость под тем, кто взял трон. Берегите это, пока Эшфорд не начнёт мерить верхние залы.

**Prompt (итог `coup_avoided`) (EN):** 
**Prompt (итог `coup_avoided`) (RU):** Ваше Величество, я слышал, что слуги продают имена и ножи едва не находят вашу дверь. Нокс проиграл торг — или вы повесили продавцов. Дворцовый переворот едва предотвращён. Лестница помнит, как это было близко.

**Prompt (итог `haunted_servants`) (EN):** 
**Prompt (итог `haunted_servants`) (RU):** Ваше Величество, я слышал о призраках в покоях Эдвина, молчании во рту Тиля, страхе в глазах Лиссы. Призрачные слуги — преданные памяти больше, чем вам. Дворец повинуется. Но не согревается.

**Prompt (итог `jesters_truth`) (EN):** 
**Prompt (итог `jesters_truth`) (RU):** Ваше Величество, я слышал, как Тиль осмеял корону, Церковь и голод перед площадью. Правда шута — смех как политика. Чернь доверяет дураку больше, чем глашатаю. Опасно. Действенно.

**Choice 1**
- **Choice (EN):** I have heard the stairs — dismiss the servants' court
- **Choice (RU):** Я выслушал лестницу — распустить суд слуг
- **Response (EN):** Then I write *warm stairs*. Upper halls will test it soon.
- **Response (RU):** Тогда я пишу *тёплая лестница*. Верхние залы скоро испытают это.
- **Effects:** Loyalty +12, Health +6, People +6

---

## The Empty Purse (persistent story)
## Пустая Казна (длящаяся история)

### Beat 1 — Day 11

**Title (EN):** Muster Without Coin
**Title (RU):** Мустер без монеты
**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Opens arc. Pre-Church, pre-Grey Lung day 25. Household beats 2–3 may have fired. Sets `emptyPursePhase = active`.
**Note (RU):** Открывает арку. До Церкви, до Серого Кашля на день 25. Эпизоды Двора 2–3 могли сработать. Устанавливает `emptyPursePhase = active`.

#### Node 0

**Prompt (EN):** Your Majesty, the men who put you on the throne assembled for muster at dawn. The treasury sent silence. I heard Edric warn you that blades alone cannot keep a crown — he did not mention they still expect coin. Pay, promise, or tell them honor feeds barracks better than bread.
**Prompt (RU):** Ваше Величество, люди, посадившие вас на трон, собрались на мустер на рассвете. Казначейство ответило молчанием. Я слышал, Эдрик предупреждал вас, что одними клинками корону не удержать, — он не упомянул, что клинки по-прежнему ждут монеты. Платите, обещайте или скажите им, что честь кормит казармы лучше хлеба.

**Prompt variant (`bold` tone) (EN):** Your Majesty, you told Edric a hesitating king falls. My captains heard boldness. The paymaster heard nothing. Choose whether the coup was a contract or a sermon.
**Prompt variant (`bold` tone) (RU):** 

**Prompt variant (тон `bold`) (EN):** 
**Prompt variant (тон `bold`) (RU):** Ваше Величество, вы сказали Эдрику, что нерешительный король падает. Мои капитаны слышали смелость. Казначей не слышал ничего. Решайте: переворот был договором или проповедью.

**Choice 1**
- **Choice (EN):** Pay half now — promise the rest in two weeks
- **Choice (RU):** Выплатить половину сейчас — пообещать остаток через две недели
- **Response (EN):** Half a purse buys half loyalty. Today that may suffice. Do not make it habit.
- **Response (RU):** Половина кошелька покупает половину верности. На сегодня, возможно, хватит. Не превращайте это в привычку.
- **Effects:** Army +10, Treasury -15, Loyalty +3
- **Trust: +8**
- **Доверие: +8**

**Choice 2**
- **Choice (EN):** Full payment — buy silence while you can
- **Choice (RU):** Полная выплата — купить молчание, пока возможно
- **Response (EN):** Generous. The men will remember — until the next muster.
- **Response (RU):** Щедро. Люди запомнят — до следующего мустера.
- **Effects:** Army +18, Treasury -25, Loyalty +5
- **Trust: +18**
- **Доверие: +18**

**Choice 3**
- **Choice (EN):** Honor is payment — the coup was the reward
- **Choice (RU):** Честь — плата, переворот — награда
- **Response (EN):** Then pray your walls are stronger than my captains' patience.
- **Response (RU):** Тогда молитесь, что ваши стены крепче терпения моих капитанов.
- **Effects:** Army -12, Treasury +5, Loyalty -6
- **Trust: −25**
- **Sets flag: `emptyPurseCrisis`**
- **Доверие: −25**
- **Устанавливает флаг: `emptyPurseCrisis`**

---

### Beat 2 — Day 17

**Title (EN):** Coup Creditors
**Title (RU):** Кредиторы переворота
**Character (EN):** Banker Dominic Salt
**Character (RU):** Банкир Доминик Солт
**Note (EN):** Coup debts to mercenary lenders. Callback day 11 payment choice.
**Note (RU):** Долги переворота перед наёмными кредиторами. Обратная отсылка к выбору оплаты на день 11.

#### Node 0

**Prompt (EN):** Your Majesty, the blades that crowned you were rented before they were bloodied. My house financed the captains who opened the gates. I heard you paid the muster — or promised — or preached honor. I do not finance sermons. Repay with crown land, crown tax, or crown patience. Default, and your soldiers learn who truly owns their captain.
**Prompt (RU):** Ваше Величество, клинки, короновавшие вас, были взяты напрокат прежде, чем обагрились кровью. Мой дом финансировал капитанов, открывших ворота. Я слышал, что вы выплатили мустер — или пообещали — или читали проповедь о чести. Проповеди я не финансирую. Погасите долг землями короны, налогами или терпением короны. Допустите неуплата — и ваши солдаты узнают, кто на самом деле владеет их капитаном.

**Prompt variant (`emptyPurseCrisis`) (EN):** Your Majesty, I heard you told the army honor feeds them. My ledgers feed captains. Choose whether the throne pays in gold or in deeds before my patience sells to someone who will.
**Prompt variant (`emptyPurseCrisis`) (RU):** Ваше Величество, я слышал, что вы говорили армии о чести. Мои книги кормят капитанов. Выбирайте: трон платит золотом или грамотами, пока моё терпение не продастся тому, кто заплатит.

**Choice 1**
- **Choice (EN):** Crown loan on harsh terms — Salt owns the shortfall
- **Choice (RU):** Королевский заём на жёстких условиях — Солт владеет недостачей
- **Response (EN):** Then my ink owns your mornings until the debt sleeps. The army will not know — yet.
- **Response (RU):** Тогда мои чернила владеют вашими утрами, пока долг не уснёт. Армия не узнает — пока.
- **Effects:** Treasury +20, Army +5, Succession -8, Loyalty -4
- **Sets flag: `emptyPurseSaltLoan`**
- **Trust: +5**
- **Устанавливает флаг: `emptyPurseSaltLoan`**
- **Доверие: +5**

**Choice 2**
- **Choice (EN):** Seize Salt's rival ledgers — pay soldiers, anger bankers
- **Choice (RU):** Захватить конкурирующие книги Солта — платить солдатам, злить банкиров
- **Response (EN):** You will find my books clean and my enemies' dirty. Useful — until every merchant fears you.
- **Response (RU):** Мои книги вы найдёте чистыми, а книги моих врагов — грязными. Полезно — пока каждый купец не начнёт вас бояться.
- **Effects:** Treasury +12, Army +8, Loyalty -8
- **Trust: +10**
- **Доверие: +10**

**Choice 3**
- **Choice (EN):** Renegotiate — time for interest, not land
- **Choice (RU):** Перезаключить — время вместо земли, проценты вместо имущества
- **Response (EN):** Time is also currency. I will wait — and charge for waiting.
- **Response (RU):** Время — тоже валюта. Я подожду — и возьму за ожидание.
- **Effects:** Treasury -5, Loyalty +4, Succession -3
- **Trust: +12**
- **Доверие: +12**

---

### Beat 3 — Day 23

**Title (EN):** Hillside Oath-Breakers
**Title (RU):** Клятвопреступники с холмов
**Character (EN):** Deserter Finn
**Character (RU):** Дезертир Финн
**Note (EN):** Day before Grey Lung proposal (25). Callback Household purge flags and army pay.
**Note (RU):** День до предложения по Серому Кашлю (25). Обратная отсылка к флагам чистки Двора и армейской оплате.

#### Node 0

**Prompt (EN):** Your Majesty, I deserted Edwin's third company the week before your coup — and I did not return for yours. Forty men hide in the southern hills because the paymaster forgot them twice. I heard you kept Gromm or purged him, paid Rudolf or preached. We ask simpler questions: forgiveness, coin, or rope?
**Prompt (RU):** Ваше Величество, я дезертировал из третьей роты Эдвина за неделю до вашего переворота — и не вернулся ради вашего. Сорок человек прячутся в южных холмах, потому что казначей забыл о них дважды. Я слышал, что вы оставили или вычистили Грома, платили Рудольфу или читали проповеди. Мы задаём более простые вопросы: амнистия, монета или верёвка?

**Prompt variant (`householdPurgedGuards`) (EN):** Your Majesty, I heard you purged the palace guard. Hillside men think you will purge us next. Offer coin or offer graves — middle paths fail with hungry deserters.
**Prompt variant (`householdPurgedGuards`) (RU):** Ваше Величество, я слышал, что вы вычистили дворцовую стражу. Люди с холмов думают, что вы вычистите и нас следующими. Предложите монету или предложите могилы — для голодных дезертиров средний путь не работает.

**Choice 1**
- **Choice (EN):** forgiveness and enlistment — hills return to the banner
- **Choice (RU):** Амнистия и зачисление — холмы возвращаются под знамя
- **Response (EN):** Then we march for you until someone pays better. Today that is you.
- **Response (RU):** Тогда мы маршируем за вас, пока кто-то не заплатит лучше. Сегодня это вы.
- **Effects:** Army +12, Treasury -10, Loyalty -3
- **Sets flag: `emptyPurseFinnforgiveness`**
- **Trust: +15**
- **Устанавливает флаг: `emptyPurseFinnforgiveness`**
- **Доверие: +15**

**Choice 2**
- **Choice (EN):** Pay them off — gold to vanish
- **Choice (RU):** Откупиться — золото, чтобы исчезли
- **Response (EN):** Cheap peace. They will drink your coin and remember your name in songs you will not like.
- **Response (RU):** Дешёвый мир. Пропьют вашу монету и вспомнят ваше имя в песнях, которые вам не понравятся.
- **Effects:** Treasury -15, Army +3, Loyalty +2
- **Trust: +5**
- **Доверие: +5**

**Choice 3**
- **Choice (EN):** Hunt them — deserters are traitors twice
- **Choice (RU):** Охотиться на них — дезертиры изменники дважды
- **Response (EN):** Then send men who are paid. Unpaid hunters become deserters by supper.
- **Response (RU):** Тогда пошлите людей, которым платят. Неоплаченные охотники к ужину сами становятся дезертирами.
- **Effects:** Army -8, Loyalty -6, Succession +4
- **Trust: −20**
- **Доверие: −20**

---

### Beat 4 — Day 29

**Title (EN):** Which Ledger Bleeds
**Title (RU):** Какая книга истекает кровью
**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин
**Note (EN):** One day before Church unlock. Chooses army vs court vs reserves. Callback Salt loan and Household `householdCutClerks`.
**Note (RU):** За день до разблокировки Церкви. Выбор между армией, двором и резервами. Обратная отсылка к займу Солта и `householdCutClerks` Двора.

#### Node 0

**Prompt (EN):** Your Majesty, three ledgers scream at once: Salt's coup debt, Rudolf's muster, and Edwin's ghost offices Osric still signs. I heard you paid soldiers, bargained with bankers, or fed them honor. Malrik's church tax has not yet arrived — but winter will. Which purse empties first: army, court, or crown reserves?
**Prompt (RU):** Ваше Величество, три книги кричат одновременно: долг переворота Солту, мустер Рудольфа и призрачные ведомства Эдвина, которые Осрик до сих пор подписывает. Я слышал, что вы платили солдатам, торговались с банкирами или кормили их честью. Церковный налог Малрика ещё не пришла — но зима придёт. Какой кошелёк опустеет первым: армия, двор или резервы короны?

**Prompt variant (`emptyPurseSaltLoan`) (EN):** Your Majesty, Salt's interest ate this week's receipts before the grain tax arrived. I heard you borrowed to quiet the barracks. The court eats scraps. The army still waits.
**Prompt variant (`emptyPurseSaltLoan`) (RU):** Ваше Величество, проценты Солта съели поступления этой недели прежде, чем пришёл налог на зерно. Я слышал, вы заняли, чтобы утихомирить казармы. Двор ест объедки. Армия по-прежнему ждёт.

**Choice 1**
- **Choice (EN):** Army first — cut court luxuries and clerk wages
- **Choice (RU):** Сначала армия — урезать роскошь двора и жалованье писарей
- **Response (EN):** Hungry scribes plot slower than hungry soldiers march. Arithmetic, not mercy.
- **Response (RU):** Голодные писари заговоры плетут медленнее, чем голодные солдаты маршируют. Арифметика, не милосердие.
- **Effects:** Army +12, Treasury -8, Loyalty -5
- **Trust: +12**
- **Доверие: +12**

**Choice 2**
- **Choice (EN):** Balance all three — everyone bleeds a little
- **Choice (RU):** Сбалансировать все три — все немного страдают
- **Response (EN):** Everyone hates you equally. Politically efficient.
- **Response (RU):** Все ненавидят вас одинаково. Политически эффективно.
- **Effects:** Army +5, Treasury -5, Loyalty -2
- **Trust: +5**
- **Доверие: +5**

**Choice 3**
- **Choice (EN):** Hold reserves — promise another fortnight
- **Choice (RU):** Держать резервы — пообещать ещё две недели
- **Response (EN):** Promises are coins you mint yourself. Spend carefully.
- **Response (RU):** Обещания — монеты собственной чеканки. Тратьте осторожно.
- **Effects:** Army -6, Treasury +8, Loyalty -4
- **Trust: −15**
- **Sets flag: `emptyPurseCrisis`**
- **Доверие: −15**
- **Устанавливает флаг: `emptyPurseCrisis`**

---

### Beat 5 — Day 36

**Title (EN):** Companies Threaten March
**Title (RU):** Роты угрожают выступить маршем
**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Day after Church beat 1; church tax may be active. Callback Finn forgiveness and Borvin choices.
**Note (RU):** День после эпизода 1 Церкви; церковный налог может быть активна. Обратная отсылка к амнистии Финна и выборам Борвина.

#### Node 0

**Prompt (EN):** Your Majesty, two companies stack wagons at the lower gate — not to leave, they swear, but to remind you they could. I heard you chose which ledger bleeds, sheltered deserters or hunted them, and knelt or defied Malrik in the same fortnight. Soldiers listen to priests when pay is silence. Pay, punish, or parade.
**Prompt (RU):** Ваше Величество, две роты складывают телеги у нижних ворот — не уходить, клянутся они, но напомнить, что могли бы. Я слышал, что вы выбирали, какая книга истекает кровью, укрывали дезертиров или охотились на них, преклонили ли колено перед Малриком или бросили ему вызов — и всё это за одну неделю. Солдаты слушают священников, когда жалованье — молчание. Платите, наказывайте или устраивайте смотр.

**Prompt variant (`churchArcPhase = active` + `defy`) (EN):** Your Majesty, I heard you spat at Malrik while Borvin starved the barracks. My men think heaven and the treasury conspired against them. Fix one enemy at a time — starting with coin.
**Prompt variant (`churchArcPhase = active` + `defy`) (RU):** Ваше Величество, я слышал, что вы плюнули в Малрика, пока Борвин морил казармы голодом. Мои люди думают, что небо и казначейство сговорились против них. Разбирайтесь с одним врагом за раз — начиная с монеты.

**Prompt variant (`emptyPurseFinnforgiveness`) (EN):** Your Majesty, I heard you amnestied Finn's hills. Good steel — bad example. Veterans ask why deserters eat before loyalists.
**Prompt variant (`emptyPurseFinnforgiveness`) (RU):** Ваше Величество, я слышал, что вы амнистировали людей Финна с холмов. Хорошая сталь — плохой пример. Ветераны спрашивают, почему дезертиры едят прежде лоялистов.

**Choice 1**
- **Choice (EN):** Emergency pay from reserves — march cancelled
- **Choice (RU):** Экстренная выплата из резервов — марш отменён
- **Response (EN):** Bought time. Not bought loyalty. Know the difference.
- **Response (RU):** Купленное время. Не купленная верность. Знайте разницу.
- **Effects:** Treasury -20, Army +15, Loyalty +4
- **Trust: +18**
- **Доверие: +18**

**Choice 2**
- **Choice (EN):** Hang wagon captains — discipline before coin
- **Choice (RU):** Повесить капитанов телег — дисциплина прежде монеты
- **Response (EN):** Steel solves one company. The rest calculate whether rope pays better than gold.
- **Response (RU):** Сталь решает вопрос с одной ротой. Остальные высчитывают, лучше ли верёвка, чем золото.
- **Effects:** Army +6, Loyalty -12, Church +3
- **Trust: −12**
- **Доверие: −12**

**Choice 3**
- **Choice (EN):** Parade and promise after church tax negotiation
- **Choice (RU):** Смотр и обещание после переговоров о церковному налогу
- **Response (EN):** Theatre. If Malrik takes your purse on Sunday, cancel the play with interest.
- **Response (RU):** Театр. Если Малрик возьмёт ваш кошелёк в воскресенье — отменяйте спектакль с процентами.
- **Effects:** Army -4, Loyalty +6, Church +5
- **Trust: −5**
- **Доверие: −5**

---

### Beat 6 — Day 47

**Title (EN):** Steel for Sale
**Title (RU):** Сталь на продажу
**Character (EN):** Mercenary Kara
**Character (RU):** Наёмник Кара
**Note (EN):** Shared speaker with [Northern beat 11](#beat-11--day-145--guns-on-the-northern-road) — here she tests crown pay before northern arms escalate. Day after Church beat 6 (48) avoided; before Grey Lung 52.
**Note (RU):** Общий персонаж с [Эпизодом 11 Северной арки](#beat-11--day-145--guns-on-the-northern-road) — здесь она проверяет оплату короны прежде, чем северная гонка вооружений обострится. День после эпизода 6 Церкви (48) — не пересекается; до Серого Кашля 52.

#### Node 0

**Prompt (EN):** Your Majesty, my company escorts grain — when grain pays. Rudolf wants a crown contract. Salt wants collateral. I heard your purse rattles emptier each week. Hire us on the throne's tab, let us sell to whoever pays today, or seize our wagons and pray unpaid men fight for free.
**Prompt (RU):** Ваше Величество, моя рота сопровождает зерно — когда зерно платит. Рудольф хочет контракт с короной. Солт хочет залог. Я слышала, что ваш кошелёк каждую неделю пустеет чуть больше. Наймите нас на счёт трона, позвольте нам продаться тому, кто платит сегодня, или захватите наши телеги и молитесь, чтобы неоплаченные люди воевали задаром.

**Prompt variant (`emptyPurseSaltLoan`) (EN):** Your Majesty, Salt whispered your debt before I reached the gate. Mercenaries price crowns by ability to pay. I heard you owe bankers and soldiers both. Who do I bill when the throne defaults?
**Prompt variant (`emptyPurseSaltLoan`) (RU):** Ваше Величество, Солт шепнул мне о вашем долге, прежде чем я добралась до ворот. Наёмники оценивают коронные активы по платёжеспособности. Я слышала: вы должны и банкирам, и солдатам. Кому выставить счёт, когда трон не заплатит?

**Choice 1**
- **Choice (EN):** Crown contract — Kara works for you alone this season
- **Choice (RU):** Контракт с короной — Кара работает только на вас в этом сезоне
- **Response (EN):** Then my bolts point where you point — until your purse stops singing.
- **Response (RU):** Тогда мои болты направлены туда, куда укажете вы, — пока ваш кошелёк поёт.
- **Effects:** Army +14, Treasury -18, Loyalty +3
- **Sets flag: `emptyPurseKaraCrown`**
- **Trust: +10**
- **Устанавливает флаг: `emptyPurseKaraCrown`**
- **Доверие: +10**

**Choice 2**
- **Choice (EN):** Free company — she sells to highest bidder
- **Choice (RU):** Вольная рота — продаётся тому, кто больше заплатит
- **Response (EN):** Gold flows. Loyalties blur. War gets cheaper for everyone except you.
- **Response (RU):** Золото течёт. Лояльности размываются. Война дешевеет для всех — кроме вас.
- **Effects:** Treasury +8, Army -5, Loyalty -4
- **Trust: −8**
- **Доверие: −8**

**Choice 3**
- **Choice (EN):** Seize wagons — impress steel into Rudolf's host
- **Choice (RU):** Захватить телеги — принудительно включить сталь в отряды Рудольфа
- **Response (EN):** Then you gain bolts and lose reputation. Mercenaries remember seizures longer than kings remember pay.
- **Response (RU):** Тогда вы приобретаете болты и теряете репутацию. Наёмники помнят забор имущества дольше, чем короли помнят выплаты.
- **Effects:** Army +10, Loyalty -10, Succession +5
- **Trust: −15**
- **Доверие: −15**

---

### Beat 7 — Day 54

**Title (EN):** The Oath That Pays No Wages
**Title (RU):** Клятва, не приносящая жалованья
**Character (EN):** Sir Otto the Silent
**Character (RU):** Сэр Отто Молчаливый
**Note (EN):** Between Grey Lung day 52 and Church fasting day 55 — day 54 is clear. Otto represents honor-bound knights who serve without pay — until they do not.
**Note (RU):** Между Серым Кашлём на день 52 и постом Церкви на день 55 — день 54 свободен. Отто олицетворяет рыцарей, связанных честью, служащих без жалованья — до поры.

#### Node 0

**Prompt (EN):** Your Majesty, I swore to Edwin as his household knight — and you sit in Edwin's chair. I have not spoken in court since the coup because speech costs coin I was not paid. I heard your army grumbles, your banker counts, your mercenary haggles. My silence is not loyalty. It is arithmetic. Swear me a wage, or swear me release.
**Prompt (RU):** Ваше Величество, я клялся Эдвину как рыцарь его двора — а вы сидите в кресле Эдвина. Я не произносил речей при дворе с ночи переворота, потому что речи стоят монеты, которой мне не платили. Я слышал, что ваша армия ворчит, ваш банкир считает, ваш наёмник торгуется. Моё молчание — не верность. Это арифметика. Обещайте мне жалованье или дайте отставку.

**Prompt variant (`armyPayTrust` ≤ −20) (EN):** Your Majesty, the barracks toast your name with vinegar. I heard unpaid steel. My oath does not require poverty. Pay or release me before silence becomes siding with whoever pays.
**Prompt variant (`armyPayTrust` ≤ −20) (RU):** Ваше Величество, казармы пьют ваше здоровье с уксусом. Я слышал: неоплаченная сталь. Моя клятва не требует нищеты. Платите или отпустите меня, пока молчание не стало союзом с тем, кто заплатит.

**Choice 1**
- **Choice (EN):** Knight's stipend — bind Otto to the crown
- **Choice (RU):** Рыцарское содержание — привязать Отто к короне
- **Response (EN):** Then I draw steel when you ask. I still prefer not to speak. Saves us both embarrassment.
- **Response (RU):** Тогда я обнажаю меч по вашему слову. Говорить по-прежнему предпочитаю меньше. Нам обоим спокойнее.
- **Effects:** Army +8, Treasury -12, Loyalty +6, Nobility +4
- **Sets flag: `emptyPurseOttoSworn`**
- **Trust: +12**
- **Устанавливает флаг: `emptyPurseOttoSworn`**
- **Доверие: +12**

**Choice 2**
- **Choice (EN):** Release with honor — no pay, no obligation
- **Choice (RU):** Отставка с честью — без жалованья, без обязательств
- **Response (EN):** Clean exit. The court loses a sword. You gain a witness who may testify elsewhere.
- **Response (RU):** Чистый выход. Двор теряет меч. Вы приобретаете свидетеля, который может дать показания в другом месте.
- **Effects:** Loyalty +3, Succession -4, Army -3
- **Trust: −5**
- **Доверие: −5**

**Choice 3**
- **Choice (EN):** Service without pay — glory must suffice
- **Choice (RU):** Служба без жалованья — должна хватить слава
- **Response (EN):** Then my silence means contempt, not devotion. Remember I warned you.
- **Response (RU):** Тогда моё молчание означает презрение, а не преданность. Помните: я вас предупреждал.
- **Effects:** Army -5, Loyalty -6, Nobility -5
- **Trust: −18**
- **Доверие: −18**

---

### Beat 8 — Day 65

**Title (EN):** Who Guards an Empty Purse
**Title (RU):** Кто охраняет пустую казну
**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Arc finale. **On load:** run [day 65 outcome priority](#empty-purse--beat-resolution-rules) → `emptyPurseOutcome`, `emptyPursePhase = resolved`. Rudolf **reports** what the barracks decided — player does not pick the ending. Callbacks entire arc (Salt, Finn, Borvin, Kara, Otto, Raena).
**Note (RU):** Финал арки. **При загрузке:** выполнить [приоритет итога дня 65](#empty-purse--beat-resolution-rules) → `emptyPurseOutcome`, `emptyPursePhase = resolved`. Рудольф **докладывает**, что решили казармы — игрок не выбирает финал. Обратные отсылки на всю арку (Солт, Финн, Борвин, Кара, Отто, Раэна).

#### Node 0

**Prompt (outcome `paid_crown`) (EN):** Your Majesty, fifty-four days since muster without coin — and the men still answer when you call. I heard Salt paid, Otto sworn, wagons funded, deserters judged. The barracks call you a king who pays when it hurts. That is rarer than courage. Guard it.
**Prompt (outcome `paid_crown`) (RU):** 

**Prompt (outcome `mercenary_throne`) (EN):** Your Majesty, I heard Kara's coin at your door and crown honor in the counting house. The loyal companies watch mercenaries eat first. My men obey — for now — because you bought steel you did not breed. The realm calls it pragmatism. The yard calls it a warning.
**Prompt (outcome `mercenary_throne`) (RU):** 

**Prompt (outcome `mutiny_avoided`) (EN):** Your Majesty, I heard hunger, forgiveness, promises, and one march that did not happen. You did not buy devotion — you bought time. The barracks grumble but do not stack wagons. Call it survival. Soldiers do.
**Prompt (outcome `mutiny_avoided`) (RU):** 

**Prompt (outcome `sold_sword`) (EN):** Your Majesty, I heard Otto's silence and glory speeches from the throne. Honor without wages is a sermon, not an army. The knights serve because they must, not because they believe. The next creditor may outbid you with a whisper.
**Prompt (outcome `sold_sword`) (RU):** 

**Prompt (outcome `ghost_army`) (EN):** Your Majesty, I heard unpaid steel, seized wagons, hung captains, and empty chests. The companies calculate faster than you count. Desertion is policy now — not crime. You still have a throne. You may not have a host by spring.
**Prompt (outcome `ghost_army`) (RU):** 

**Prompt (итог `paid_crown`) (EN):** 
**Prompt (итог `paid_crown`) (RU):** Ваше Величество, пятьдесят четыре дня прошло с мустера без монеты — и люди по-прежнему откликаются на ваш зов. Я слышал: Солт выплачен, Отто присягнул, телеги профинансированы, дезертиры осуждены. Казармы называют вас королём, который платит, когда это больно. Это редкость — редкость большая, чем храбрость. Берегите её.

**Prompt (итог `mercenary_throne`) (EN):** 
**Prompt (итог `mercenary_throne`) (RU):** Ваше Величество, я слышал монету Кары у вашей двери и честь короны в счётной палате. Верные роты наблюдают, как наёмники едят первыми. Мои люди повинуются — пока — потому что вы купили сталь, которую не вырастили. Королевство называет это прагматизмом. Двор называет это предупреждением.

**Prompt (итог `mutiny_avoided`) (EN):** 
**Prompt (итог `mutiny_avoided`) (RU):** Ваше Величество, я слышал голод, прощение, обещания и один марш, которого не было. Вы не купили преданность — вы купили время. Казармы ворчат, но телеги не складывают. Называйте это выживанием. Солдаты так и делают.

**Prompt (итог `sold_sword`) (EN):** 
**Prompt (итог `sold_sword`) (RU):** Ваше Величество, я слышал молчание Отто и речи о славе с трона. Честь без жалованья — проповедь, не армия. Рыцари служат, потому что обязаны, не потому что верят. Следующий кредитор может перебить вас шёпотом.

**Prompt (итог `ghost_army`) (EN):** 
**Prompt (итог `ghost_army`) (RU):** Ваше Величество, я слышал: неоплаченная сталь, захваченные телеги, повешенные капитаны, пустые сундуки. Роты высчитывают быстрее, чем вы считаете. Дезертирство стало политикой — не преступлением. Трон у вас ещё есть. Войска к весне — возможно, нет.

**Choice 1**
- **Choice (EN):** I have heard the barracks — dismiss the muster
- **Choice (RU):** Я выслушал казармы — распустить мустер
- **Response (EN):** Then march when I say march. Coin bought this loyalty. Spend it wisely.
- **Response (RU):** Тогда маршируйте, когда я скажу. Монета купила эту верность. Тратьте её мудро.
- **Effects:** Army +12, Loyalty +10, Treasury -5

---

## The Hungry Season (persistent story)
## Голодный Сезон (длящаяся история)

### Beat 1 — Day 42

**Title (EN):** First Empty Granaries
**Title (RU):** Первые пустые житницы
**Character (EN):** Miller's Wife Ruta
**Character (RU):** Жена мельника Рута
**Note (EN):** Opens arc early — during Church church tax buildup, before People unlock. Callback [Church beat 6](#beat-6--day-48--church-buys-the-granaries) foreshadow if `churchArcPhase = active`.
**Note (RU):** Открывает арку рано — в разгар нарастания церковного налога Церкви, до разблокировки People. Обратная отсылка с предвестием [Эпизода 6 Церкви](#beat-6--day-48--church-buys-the-granaries), если `churchArcPhase = active`.

#### Node 0

**Prompt (EN):** Your Majesty, I am Ruta from the western mills. The granaries cough dust where they once coughed grain. I heard Malrik's church tax collectors reach the villages before your tax men. I did not ride here for poetry — I rode because hungry millers remember who stole the harvest, and they do not always mean the weather.
**Prompt (RU):** Ваше Величество, я — Рута с западных мельниц. Житницы кашляют пылью там, где прежде кашляли зерном. Я слышала, что сборщики церковного налога Малрика добираются до деревень раньше ваших налоговых чиновников. Я приехала сюда не за поэзией — я приехала потому, что голодные мельники помнят, кто украл урожай, и не всегда имеют в виду погоду.

**Prompt variant (`churchArcStance = submit`) (EN):** Your Majesty, I heard you knelt for blessing while our bins emptied. God's name does not fill a child's bowl unless someone pays for the grain.
**Prompt variant (`churchArcStance = submit`) (RU):** Ваше Величество, я слышала, что вы преклонили колено за благословение, пока наши закрома пустели. Имя Господне не наполняет детскую миску, если никто не платит за зерно.

---

### Beat 2 — Day 50

**Title (EN):** Court Feasts
**Title (RU):** Дворцовые пиры
**Character (EN):** Cook Gromm
**Character (RU):** Повар Гром
**Note (EN):** Callback [Household](#beat-2--day-8--the-kitchen-remembers) `householdKeptGromm`. Competes with provincial hunger.
**Note (RU):** Обратная отсылка к [Двору](#beat-2--day-8--the-kitchen-remembers) `householdKeptGromm`. Конкурирует с провинциальным голодом.

#### Node 0

**Prompt (EN):** Your Majesty, the court expects roast on holy days and every day is holy when kings are nervous. I heard western mills send dust instead of flour. My ovens can bake for the palace or bake for the city — not both without coin or lies. Do I cook silence in the kitchens, or honesty at your table?
**Prompt (RU):** Ваше Величество, двор ждёт жаркого в праздничные дни, а каждый день — праздничный, когда короли нервничают. Я слышал, что западные мельницы присылают пыль вместо муки. Мои печи могут печь для дворца или для города — не для обоих без монеты или лжи. Мне варить в кухнях молчание или подавать к вашему столу честность?

**Prompt variant (`householdKeptGromm`) (EN):** Your Majesty, you kept me when others purged Edwin's ghosts. I will cook for you — but I will not pretend the city is fed while we chew fat.
**Prompt variant (`householdKeptGromm`) (RU):** Ваше Величество, вы оставили меня, когда другие изгоняли призраков Эдвина. Я буду готовить для вас — но не стану притворяться, что город сыт, пока мы жуём жир.

**Prompt variant (`hungryRutaHeard` + policy `feed`) (EN):** Your Majesty, I heard you opened reserves for Ruta's mills. The court still wants feast. The commons want proof you meant it.
**Prompt variant (`hungryRutaHeard` + policy `feed`) (RU):** 

**Prompt variant (`hungryRutaHeard` + политика `feed`) (EN):** 
**Prompt variant (`hungryRutaHeard` + политика `feed`) (RU):** Ваше Величество, я слышал, что вы открыли резервы для мельниц Руты. Двор по-прежнему хочет пир. Чернь хочет доказательства, что вы имели это в виду.

---

### Beat 3 — Day 56

**Title (EN):** Soup Lines
**Title (RU):** Очереди за похлёбкой
**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел
**Note (EN):** Between Church fasting beat (55) and Northern agents (57). Church grain vs crown grain.
**Note (RU):** Между эпизодом поста Церкви (55) и агентами Северной арки (57). Зерно Церкви против зерна короны.

#### Node 0

**Prompt (EN):** Your Majesty, my soup line wraps around the lower ward — longer each dawn. I heard Malrik named meat unclean or grain God's property. I heard you fed soldiers in secret or starved the faithful. The poor do not care which sermon wins. They care which pot boils.
**Prompt (RU):** Ваше Величество, моя очередь за похлёбкой огибает нижний двор — и каждый рассвет становится длиннее. Я слышал, что Малрик объявил мясо нечистым или зерно — собственностью Господа. Я слышал, что вы кормили солдат втайне или морили верующих голодом. Бедным нет дела до того, чья проповедь победит. Им важно, какой котёл кипит.

**Prompt variant (`churchGrainMonopoly`) (EN):** Your Majesty, I heard you seized temple grain. Malrik answered with fasting. My line answered with hunger. Choose who owns mercy.
**Prompt variant (`churchGrainMonopoly`) (RU):** Ваше Величество, я слышал, что вы захватили зерно храма. Малрик ответил постом. Моя очередь ответила голодом. Выбирайте, кому принадлежит милосердие.

**Prompt variant (`churchFastingDecree` defied) (EN):** Your Majesty, I heard you fed barracks while the realm fasted. The poor noticed. So did my brothers.
**Prompt variant (`churchFastingDecree` defied) (RU):** 

**Prompt variant (`churchFastingDecree` — нарушено) (EN):** 
**Prompt variant (`churchFastingDecree` — нарушено) (RU):** Ваше Величество, я слышал, что вы кормили казармы, пока королевство постилось. Бедные заметили. И мои братья тоже.

---

### Beat 4 — Day 63

**Title (EN):** Provincial Delegation
**Title (RU):** Провинциальная делегация
**Character (EN):** Village Elder Bran
**Character (RU):** Деревенский старейшина Бран
**Note (EN):** Day after Prophet beat 1 (62). Provincial voice before People unlock.
**Note (RU):** День после первого эпизода Пророка (62). Провинциальный голос до разблокировки People.

#### Node 0

**Prompt (EN):** Your Majesty, I speak for nine villages that still call you the king who took the throne — and still ask you for bread. I heard Ruta from the mills and Arvel from the soup line. We do not want your soul. We want your granary keys. Grant provincial charters to store grain, or send soldiers to guard empty bins.
**Prompt (RU):** Ваше Величество, я говорю от имени девяти деревень, которые по-прежнему называют вас тем, кто взял трон — и по-прежнему просят у вас хлеба. Я слышал о Руте с мельниц и Арвеле из очередей за похлёбкой. Мы не хотим вашей души. Мы хотим ключи от ваших житниц. Выдайте местные права на хранение на хранение зерна или пошлите солдат охранять пустые закрома.

**Prompt variant (`hungryGrommFeast`) (EN):** Your Majesty, I heard the court feasted while we tightened belts. Delegations are polite riots. Remember that.
**Prompt variant (`hungryGrommFeast`) (RU):** Ваше Величество, я слышал, что двор пировал, пока мы затягивали пояса. Делегации — это вежливые бунты. Помните об этом.

---

### Beat 5 — Day 68

**Title (EN):** Ore for Bread
**Title (RU):** Руда в обмен на хлеб
**Character (EN):** Miner Yarek
**Character (RU):** Шахтёр Ярек
**Note (EN):** Between Household day 67 (Raena) and Church day 69. Miners strike for food.
**Note (RU):** Между Двором на день 67 (Раэна) и Церковью на день 69. Шахтёры бастуют из-за еды.

#### Node 0

**Prompt (EN):** Your Majesty, the mountain eats men and spits ore. I heard villages store grain while miners eat pebbles. We can stop the forges that pay your army, or you can price bread in iron instead of gold. The crown buys our sweat — will it buy our supper?
**Prompt (RU):** Ваше Величество, гора пожирает людей и выплёвывает руду. Я слышал, что деревни хранят зерно, пока шахтёры едят камни. Мы можем остановить кузни, которые платят вашей армии, или вы можете установить цену хлеба в железе, а не в золоте. Корона покупает наш пот — купит ли она и наш ужин?

**Prompt variant (`emptyPurseCrisis`) (EN):** Your Majesty, I heard the treasury rattles empty. Empty treasuries love ore. Hungry miners do not.
**Prompt variant (`emptyPurseCrisis`) (RU):** Ваше Величество, я слышал, что казна гремит пустотой. Пустые казны любят руду. Голодные шахтёры — нет.

---

### Beat 6 — Day 74

**Title (EN):** Grain Cartel
**Title (RU):** Зерновой картель
**Character (EN):** Head of Guild Fara
**Character (RU):** Глава гильдии Фара
**Note (EN):** Guild vs crown supply. Before Prophet-adjacent Grey Lung beats.
**Note (RU):** Гильдия против королевского снабжения. До смежных эпизодов Серого Кашля у Пророка.

#### Node 0

**Prompt (EN):** Your Majesty, I speak for the grain guild — not the Church, not the army, not the romantic millers. I heard you opened reserves, fed soup lines, or threatened strikers. Caravans will move if the crown guarantees prices. They will stop if you seize wagons. Hunger is a market. I am its priest.
**Prompt (RU):** Ваше Величество, я говорю от имени зерновой гильдии — не Церкви, не армии, не романтичных мельников. Я слышала, что вы открывали резервы, финансировали очереди за похлёбкой или угрожали бастующим. Обозы тронутся, если корона гарантирует цены. Они остановятся, если вы захватите телеги. Голод — рынок. Я — его жрица.

**Prompt variant (`hungryFaraCartel` early from Yarek) (EN):** Your Majesty, I heard you let me broker miners' bread. Extend the compact, or watch caravans vanish into private cellars.
**Prompt variant (`hungryFaraCartel` early from Yarek) (RU):** 

**Prompt variant (`hungryFaraCartel` ранний — от Ярека) (EN):** 
**Prompt variant (`hungryFaraCartel` ранний — от Ярека) (RU):** Ваше Величество, я слышала, что вы позволили мне посредничать с хлебом шахтёров. Расширьте договор или наблюдайте, как обозы исчезают в частных подвалах.

---

### Beat 7 — Day 80

**Title (EN):** Ballads in the Market
**Title (RU):** Баллады на рынке
**Character (EN):** Folk Singer Elina
**Character (RU):** Певица Элина
**Note (EN):** Street narrative beat. Severity high → harsher ballads.
**Note (RU):** Уличный нарративный эпизод. Высокая тяжесть → более суровые баллады.

#### Node 0

**Prompt (EN):** Your Majesty, I sing for coins and causes. I heard mills empty, soup lines grow, miners strike, and merchants count. My new verse names you — the king who took the throne — hungry or generous, depending what you fed the city this week. Sponsor the song, silence it, or let the market choose your reputation.
**Prompt (RU):** Ваше Величество, я пою за монеты и за дела. Я слышала: мельницы пустеют, очереди за похлёбкой растут, шахтёры бастуют, купцы подсчитывают. Мой новый стих называет того, кто взял трон — голодным или щедрым, в зависимости от того, чем вы кормили город на этой неделе. Спонсируйте песню, заглушите её или пусть рынок выбирает вашу репутацию.

**Prompt variant (`famineSeverity` ≥ 50) (EN):** Your Majesty, I heard children share one loaf in the western ward. My ballad will travel faster than your decrees.
**Prompt variant (`famineSeverity` ≥ 50) (RU):** Ваше Величество, я слышала: в западном квартале дети делят одну лепёшку. Моя баллада разойдётся быстрее ваших указов.

---

### Beat 8 — Day 85

**Title (EN):** Hoarded Routes
**Title (RU):** Перекрытые маршруты
**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена
**Note (EN):** One day before [Household finale](#beat-10--day-86--verdict-on-the-household) — distinct from household day 49 Selena beat (loyalists). Hoarding vs provinces.
**Note (RU):** За день до [финала Двора](#beat-10--day-86--verdict-on-the-household) — отличается от эпизода Двора дня 49 с Селеной (лоялисты). Накопление запасов против провинций.

#### Node 0

**Prompt (EN):** Your Majesty, my caravans still move — when paid triple. I heard crown reserves opened, guilds compacted, or markets left to rot. Loyalists hoard in Edwin's name. Your peasants hoard in God's. I can sell you routes, sell you names, or sell your enemies grain you refuse to price.
**Prompt (RU):** Ваше Величество, мои обозы по-прежнему идут — когда им платят втройне. Я слышала: резервы короны открыты, с гильдиями заключены договоры или рынки предоставлены гнить. Лоялисты делают запасы под именем Эдвина. Ваши крестьяне — под именем Господа. Я могу продать вам маршруты, продать имена или продать вашим врагам зерно, которое вы не хотите оценивать.

**Prompt variant (`plagueArcPhase = active`) (EN):** Your Majesty, Grey Lung makes every house hoard. I heard you fund physic while bins lock. Fear eats faster than men.
**Prompt variant (`plagueArcPhase = active`) (RU):** Ваше Величество, Серый Кашель заставляет каждый дом делать запасы. Я слышала, что вы финансируете лечебницы, пока закрома запираются. Страх ест быстрее людей.

---

### Beat 9 — Day 93

**Title (EN):** After the Ford
**Title (RU):** После брода
**Character (EN):** Miller's Wife Ruta
**Character (RU):** Жена мельника Рута
**Note (EN):** **Four days after People unlock (89)** and [Northern refugees (91)](#beat-9--day-91--refugees-at-the-ford). First beat with live People stat. Callback refugee choice.
**Note (RU):** **Четыре дня после разблокировки People (89)** и [северных беженцев (91)](#beat-9--day-91--refugees-at-the-ford). Первый эпизод с живым параметром People. Обратная отсылка к выбору с беженцами.

#### Node 0

**Prompt (EN):** Your Majesty, I return from the mills — and from the ford, where northern refugees camp beside our own hungry. I heard you sheltered strangers, turned them back, or let Arvel boil soup for Ingvar's politics. The Peasantry now has a name in your court. Do you feed your own first, share with the ford, or tell us all to pray?
**Prompt (RU):** Ваше Величество, я возвращаюсь с мельниц — и с брода, где северные беженцы разбили лагерь рядом с нашими голодающими. Я слышала, что вы укрыли чужестранцев, выдворили их или позволили Арвелу варить похлёбку ради политики Ингвара. У Крестьянства теперь есть имя в вашем дворе. Вы кормите своих первыми, делитесь у брода или говорите всем молиться?

**Prompt variant (`northernRefugeesAccepted`) (EN):** Your Majesty, I heard you fed the north while western bins still cough dust. The People see it. Malrik sees it. I see children sharing bowls.
**Prompt variant (`northernRefugeesAccepted`) (RU):** Ваше Величество, я слышала, что вы кормили север, пока западные закрома по-прежнему кашляли пылью. Народ это видит. Малрик это видит. Дети делят миски.

**Prompt variant (`northernRefugeesTurnedBack`) (EN):** Your Majesty, I heard you closed the ford. Good for arithmetic. Bad for ballads. Elina already writes the second verse.
**Prompt variant (`northernRefugeesTurnedBack`) (RU):** Ваше Величество, я слышала, что вы закрыли брод. Хорошо для арифметики. Плохо для баллад. Элина уже пишет второй куплет.

---

### Beat 10 — Day 100

**Title (EN):** Kitchens Versus Provinces
**Title (RU):** Кухни против провинций
**Character (EN):** Cook Gromm
**Character (RU):** Повар Гром
**Note (EN):** Second Gromm beat — policy stress test before Church conclave era.
**Note (RU):** Второй эпизод Грома — стресс-тест политики перед эрой конклавов Церкви.

#### Node 0

**Prompt (EN):** Your Majesty, ninety-nine days since your blade and still the city asks whether the king who took the throne starves them on purpose. I heard refugees, guilds, miners, and Malrik's fasts. My kitchens can stretch one more month — or confess we already serve the court before the commons. Tell the truth at table, or tell a better lie.
**Prompt (RU):** Ваше Величество, девяносто девять дней прошло с вашего удара, и город по-прежнему спрашивает, морит ли тот, кто взял трон их голодом намеренно. Я слышал о беженцах, гильдиях, шахтёрах и постах Малрика. Мои кухни могут продержаться ещё месяц — или признать, что мы уже ставим двор прежде черни. Говорите правду за столом или рассказывайте ложь получше.

**Prompt variant (`householdOutcome` imminent) (EN):** Your Majesty, Edric will ask who you became on day eighty-six. The city asks the same with spoons instead of scrolls.
**Prompt variant (`householdOutcome` imminent) (RU):** 

**Prompt variant (итог `householdOutcome` неминуем) (EN):** 
**Prompt variant (итог `householdOutcome` неминуем) (RU):** Ваше Величество, Эдрик спросит, кем вы стали на день восемьдесят шестой. Город задаёт тот же вопрос — ложками вместо свитков.

---

### Beat 11 — Day 106

**Title (EN):** Requisition
**Title (RU):** Реквизиция
**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Two days before [Church conclave](#beat-11--day-108--the-conclave). Army requisition vs food stability.
**Note (RU):** За два дня до [конклава Церкви](#beat-11--day-108--the-conclave). Армейская реквизиция против продовольственной стабильности.

#### Node 0

**Prompt (EN):** Your Majesty, the army must eat before it must love you. I heard guilds compact, peasants charter, and Elina sing your sins. I can requisition grain from villages that still have it — legal theft with banners — or march on empty stomachs and call it virtue. Soldiers are not ballads. They are appetites.
**Prompt (RU):** Ваше Величество, армия должна есть прежде, чем любить вас. Я слышал: гильдии компакт, крестьяне права, Элина поёт ваши грехи. Я могу реквизировать зерно из деревень, у которых оно ещё есть, — законная кража под знамёнами, — или маршировать на пустой желудок и называть это добродетелью. Солдаты — не баллады. Они — аппетиты.

**Prompt variant (`emptyPurseOutcome` weak) (EN):** Your Majesty, I heard the purse failed before the harvest. Requisition is not policy — it is appetite with law attached.
**Prompt variant (`emptyPurseOutcome` weak) (RU):** 

**Prompt variant (`emptyPurseOutcome` слабый) (EN):** 
**Prompt variant (`emptyPurseOutcome` слабый) (RU):** Ваше Величество, я слышал, что казна рухнула раньше урожая. Реквизиция — не политика. Это аппетит с законом в придачу.

---

### Beat 12 — Day 119

**Title (EN):** Verdict on Hunger
**Title (RU):** Вердикт о голоде
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Arc finale. **On load:** run [day 119 outcome priority](#hungry-season--beat-resolution-rules) → `hungryOutcome`, `hungryArcPhase = resolved`. Edric **reports** how the realm names your hunger policy — player does not pick the ending. Before Great Houses (158).
**Note (RU):** Финал арки. **При загрузке:** выполнить [приоритет итога дня 119](#hungry-season--beat-resolution-rules) → `hungryOutcome`, `hungryArcPhase = resolved`. Эдрик **докладывает**, как королевство именует вашу политику питания — игрок не выбирает финал. До Великих Домов (158).

#### Node 0

**Prompt (outcome `bread_king`) (EN):** Your Majesty, seventy-seven days since Ruta coughed dust at your feet — and the provinces still have breath to praise you. I heard soup lines, open granaries, guild deals that bent without breaking. The commons call you the bread king. Ashford will sneer. The mills will not.
**Prompt (outcome `bread_king`) (RU):** 

**Prompt (outcome `starving_crown`) (EN):** Your Majesty, severity outran every ledger. I heard requisitions, rotting stores, ballads of blame, and silence where children should eat. The realm calls it famine. The court calls it mismanagement. I call it the verdict you earned.
**Prompt (outcome `starving_crown`) (RU):** 

**Prompt (outcome `church_kitchen`) (EN):** Your Majesty, I heard Arvel's soup and Malrik's sermons feed what your treasury would not. The faithful call it mercy. The barracks call it surrender. The hungry call it supper. You ruled through heaven's ladle.
**Prompt (outcome `church_kitchen`) (RU):** 

**Prompt (outcome `guild_republic`) (EN):** Your Majesty, I heard Fara's compact buy bread the crown could not price. Merchants fed the realm and billed the throne. The guild calls it partnership. The commons call it survival. You call it policy — if you are wise.
**Prompt (outcome `guild_republic`) (RU):** 

**Prompt (outcome `peasant_fury`) (EN):** Your Majesty, I heard Yarek's riots and Rudolf's ropes. Order without grain is arithmetic with blood. The provinces remember who rationed and who feasted. They will not forget before Ashford rides.
**Prompt (outcome `peasant_fury`) (RU):** 

**Prompt (outcome `managed_famine`) (EN):** Your Majesty, you did what you could — no doctrine, only portions. Some fed, some angry, some singing in Elina's ballads. The year continues. Hunger does too, but slower than it might have.
**Prompt (outcome `managed_famine`) (RU):** 

**Prompt (итог `bread_king`) (EN):** 
**Prompt (итог `bread_king`) (RU):** Ваше Величество, семьдесят семь дней прошло с тех пор, как Рута кашляла пылью у ваших ног — и у провинций ещё есть дыхание, чтобы хвалить вас. Я слышал: очереди за похлёбкой, открытые житницы, гильдейские договоры, согнувшиеся, но не сломавшиеся. Чернь называет вас королём-хлебодаром. Эшфорд будет презирать. Мельницы — нет.

**Prompt (итог `starving_crown`) (EN):** 
**Prompt (итог `starving_crown`) (RU):** Ваше Величество, тяжесть обогнала все книги. Я слышал: реквизиции, гниющие запасы, баллады обвинений и молчание там, где должны есть дети. Королевство называет это голодомором. Двор называет это недоуправлением. Я называю это вынесенным вами вердиктом.

**Prompt (итог `church_kitchen`) (EN):** 
**Prompt (итог `church_kitchen`) (RU):** Ваше Величество, я слышал, что похлёбка Арвела и проповеди Малрика кормят то, что ваша казна не пожелала. Верующие называют это милосердием. Казармы называют это капитуляцией. Голодные называют это ужином. Вы правили через ладонь небес.

**Prompt (итог `guild_republic`) (EN):** 
**Prompt (итог `guild_republic`) (RU):** Ваше Величество, я слышал, что договор Фары покупает хлеб, который корона не могла оценить. Купцы накормили королевство и выставили счёт трону. Гильдия называет это партнёрством. Чернь называет это выживанием. Вы называете это политикой — если вы мудры.

**Prompt (итог `peasant_fury`) (EN):** 
**Prompt (итог `peasant_fury`) (RU):** Ваше Величество, я слышал о бунтах Ярека и верёвках Рудольфа. Порядок без зерна — арифметика с кровью. Провинции помнят, кто пайковал и кто пировал. Они не забудут до того, как Эшфорд выедет.

**Prompt (итог `managed_famine`) (EN):** 
**Prompt (итог `managed_famine`) (RU):** Ваше Величество, вы делали что могли — без доктрины, только порциями. Одни были накормлены, другие злятся, третьи поют в балладах Элины. Год продолжается. Голод тоже — но медленнее, чем мог бы.

**Choice 1**
- **Choice (EN):** I have heard the provinces — dismiss the hunger court
- **Choice (RU):** Я выслушал провинции — распустить голодный суд
- **Response (EN):** Then I write *bread* before *blade*. Rare for a king who took the throne. Do not waste it.
- **Response (RU):** Тогда я пишу *хлеб* прежде *клинка*. Редкость для того, кто взял трон. Не расточайте это.
- **Effects:** Food +8, People +10, Loyalty +8

---

## The Guild Compact (persistent story)
## Гильдейский компакт (длящаяся история)

### Beat 1 — Day 128

**Title (EN):** Credit Withheld
**Title (RU):** Кредит удержан
**Character (EN):** Head of Guild Fara
**Character (RU):** Глава гильдии Фара
**Note (EN):** Opens arc on **late** day 128 (post–Hungry Season). Callback `hungryFaraCartel` from [day 74](#beat-6--day-74--grain-cartel).
**Note (RU):** Открывает арку в **поздний** день 128 (после Голодного сезона). Обратная отсылка `hungryFaraCartel` с [дня 74](#beat-6--day-74--grain-cartel).

#### Node 0

**Prompt (EN):** Your Majesty, the grain guild remembers compacts and betrayals. I heard you fed provinces, seized wagons, or let markets rot during the hungry months. Credit to the crown is frozen until king-killers prove they can pay more than sermons. Reopen trade on guild terms, or watch caravans route around your capital.
**Prompt (RU):** Ваше Величество, зерновая гильдия помнит договоры и предательства. Я слышал, вы кормили провинции, захватывали повозки или позволяли рынкам гнить в голодные месяцы. Кредит короне заморожен, пока регicide не докажут, что платят больше, чем проповедями. Откройте торговлю на условиях гильдии — или смотрите, как караваны объезжают вашу столицу.

**Prompt variant (`hungryFaraCartel`) (EN):** Your Majesty, I heard we compacted bread in the famine. You owe goodwill — not gold. I am here to convert the first into the second.
**Prompt variant (`hungryFaraCartel`) (RU):** Ваше Величество, я слышал, мы заключили компакт о хлебе во время голода. Вы должны добрую волю — не золото. Я здесь, чтобы обменять первое на второе.

---

### Beat 2 — Day 136

**Title (EN):** Coup Investors Return
**Title (RU):** Инвесторы переворота возвращаются
**Character (EN):** Banker Dominic Salt
**Character (RU):** Банкир Доминик Солт
**Note (EN):** Callback [Empty Purse day 17](#beat-2--day-17--coup-creditors) `emptyPurseSaltLoan`.
**Note (RU):** Обратная отсылка [Пустой кошелёк, день 17](#beat-2--day-17--coup-creditors) `emptyPurseSaltLoan`.

#### Node 0

**Prompt (EN):** Your Majesty, the men who rented your coup want returns — with interest compounding while you fed peasants and paid soldiers. I heard Fara froze credit or you froze her. My house holds the shorter leash. Pay Salt first, pay Fara second, or pay neither and learn who forecloses faster.
**Prompt (RU):** Ваше Величество, люди, сдававшие переворот в аренду, хотят отдачи — с процентами, капающими, пока вы кормили крестьян и платили солдатам. Я слышал, Фара заморозила кредит или вы заморозили её. Мой дом держит более короткий поводок. Платите Солту первым, Фаре второй — или никому и узнайте, кто обращается взыскание быстрее.

**Prompt variant (`emptyPurseSaltLoan`) (EN):** Your Majesty, I heard you already borrowed for the barracks. This is not a new debt — it is the old one wearing armour.
**Prompt variant (`emptyPurseSaltLoan`) (RU):** Ваше Величество, я слышал, вы уже брали в долг на казармы. Это не новый долг — это старый в доспехах.

---

### Beat 3 — Day 144

**Title (EN):** fake coin Edwin Coin
**Title (RU):** Поддельная монета Эдвина
**Character (EN):** Master of the Mint Nerius
**Character (RU):** Мастер монетного двора Нерий
**Note (EN):** Mid-era beat (day 144, after [Prophet day 140](#beat-3--day-140--the-absurd-miracle)). Edwin's ghost money undermines treasury.
**Note (RU):** Эпизод середины эры (день 144, после [Пророка, день 140](#beat-3--day-140--the-absurd-miracle)). Призрачные деньги Эдвина подрывают казну.

#### Node 0

**Prompt (EN):** Your Majesty, false crowns circulate — struck with King Edwin's face, spent with your throne-stealer's blessing. I heard Osric's ghost seals and Salt's hungry loans. My mint can purge the fake seals, or your treasury can pretend they are tribute. Fake coins are a tax on kings who cannot count.
**Prompt (RU):** Ваше Величество, по королевству ходят ложные короны — чеканенные с лицом короля Эдвина, тратимые с благословения вашего того, кто взял трон. Я слышал о печатях-призраках Осрика и голодных займах Солта. Мой монетный двор может очистить фальшивые монеты, или ваша казна может притвориться, что это дань. Фальшивая монета — налог на королей, не умеющих считать.

**Prompt variant (`householdCutClerks` or `guildFaratrade ban`) (EN):** Your Majesty, I heard you cut clerks and angered guilds. Forgers thrive in confusion. That is not philosophy — it is arithmetic.
**Prompt variant (`householdCutClerks` or `guildFaratrade ban`) (RU):** 

**Prompt variant (`householdCutClerks` или `guildFaratrade ban`) (EN):** 
**Prompt variant (`householdCutClerks` или `guildFaratrade ban`) (RU):** Ваше Величество, я слышал, вы сократили писарей и разгневали гильдии. Подделчики процветают в путанице. Это не философия — арифметика.

**Choice 2**
- **Choice (EN):** Ignore — let false coin circulate
- **Choice (RU):** Игнорировать — пусть ложная монета ходит
- **Response (EN):** Then prices lie and taxes lie with them. Borvin will scream. Thieves will cheer.
- **Response (RU):** Тогда цены лгут — и налоги лгут вместе с ними. Борвин закричит. Воры обрадуются.
- **Effects:** Treasury +10, Loyalty -8
- **Sets flag: `guildNeriusfake coin`**
- **Устанавливает флаг: `guildNeriusfake coin`**

**Choice 3**
- **Choice (EN):** Blame Nerius — hang the mintmaster
- **Choice (RU):** Обвинить Нерия — повесить мастера монетного двора
- **Response (EN):** Convenient scapegoat. The fake seals continue without a neck to blame. You chose theatre.
- **Response (RU):** Удобная коза отпущения. Фальшивые монеты продолжаются без шеи, на которую можно свалить вину. Вы выбрали театр.
- **Effects:** Loyalty -6, Succession +4
- **Sets flag: `guildNeriusfake coin` (worse fallout)**
- **Устанавливает флаг: `guildNeriusfake coin` (худшие последствия)**

---

### Beat 4 — Day 152

**Title (EN):** Two Ledgers, One Throne
**Title (RU):** Две книги, один трон
**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин
**Note (EN):** Church church tax vs guild debt vs army pay.
**Note (RU):** Церковный налог Церкви против долга гильдии против армейской платы.

#### Node 0

**Prompt (EN):** Your Majesty, Malrik's church tax, Salt's interest, and Fara's fees eat the same chest — and Rudolf still wants rations. I heard you purged fake seals or let them spread. Choose which creditor starves this month: heaven, merchants, or steel.
**Prompt (RU):** Ваше Величество, церковный налог Малрика, проценты Солта и сборы Фары едят один сундук — а Рудольф всё ещё хочет пайки. Я слышал, вы очистили фальшивые монеты или позволили им расползтись. Выберите, какой кредитор голодает в этом месяце: небо, купцы или сталь.

**Prompt variant (`churchHolyLedger`) (EN):** Your Majesty, I heard you promised Malrik a shared ledger. He did not share. Neither did Salt.
**Prompt variant (`churchHolyLedger`) (RU):** Ваше Величество, я слышал, вы пообещали Малрику общую книгу. Он не поделился. Солт тоже.

---

### Beat 5 — Day 160

**Title (EN):** Trade Credit Frozen
**Title (RU):** Торговый кредит заморожен
**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена
**Note (EN):** Distinct from Hungry Season day 85 / Great Houses uses Kara later. Trade routes as leverage.
**Note (RU):** Отличается от Голодного сезона день 85 / Великие дома позже используют Кару. Торговые пути как рычаг.

#### Node 0

**Prompt (EN):** Your Majesty, Fara froze crown credit and Salt called your notes — I heard both before my caravans left the yard. I move grain and gold, not loyalty. Extend me crown escorts and premium pay, or I sell your shortages to your enemies at markup.
**Prompt (RU):** Ваше Величество, Фара заморозила королевский кредит, а Солт объявил ваши долговые записки — я слышал оба, прежде чем мои караваны покинули двор. Я вожу зерно и золото, не верность. Дайте мне королевские конвои и премиальную плату — или я продам ваши нехватки врагам с наценкой.

**Prompt variant (`guildFaratrade ban` active) (EN):** Your Majesty, I heard the guild trade ban holds. I am the trade ban with wheels. Pay or walk.
**Prompt variant (`guildFaratrade ban` active) (RU):** 

**Prompt variant (`guildFaratrade ban` активен) (EN):** 
**Prompt variant (`guildFaratrade ban` активен) (RU):** Ваше Величество, я слышал, запрет на торговлю гильдии держится. Я — запрет на торговлю на колёсах. Платите или идите пешком.

---

### Beat 6 — Day 169

**Title (EN):** Before Ashford's Price
**Title (RU):** Прежде чем Эшфорд назовёт цену
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Six days before [Nobility unlock / Ashford](#lady-ashford-debut-nobility-unlock). Warns that noble levies require able to pay treasury.
**Note (RU):** За шесть дней до [разблокировки Nobility / Эшфорд](#lady-ashford-debut-nobility-unlock). Предупреждает, что дворянские levies требуют платёжеспособной казны.

#### Node 0

**Prompt (EN):** Your Majesty, in six days Lady Ashford measures whether you are a ruler or a debtor in ermine. I heard Fara withhold credit, Salt compound interest, and Nerius find false coin. Great houses lend to kings who can pay — not to king-killers who owe merchants more than bishops.
**Prompt (RU):** Ваше Величество, через шесть дней леди Эшфорд решит, правитель вы или должник в горностае. Я слышал, Фара удержала кредит, Солт начисляет проценты, а Нерий нашёл ложную монету. Великие дома дают взаймы королям, способным платить — не killing a king, которые должны купцам больше, чем епископам.

**Prompt variant (`guildStanding` ≤ −20) (EN):** Your Majesty, creditors talk louder than heralds. Ashford will hear them before she hears you.
**Prompt variant (`guildStanding` ≤ −20) (RU):** Ваше Величество, кредиторы говорят громче глашатаев. Эшфорд услышит их раньше вас.

**Choice 2**
- **Choice (EN):** Prepare bluff — parade full coffers, hide empty ones
- **Choice (RU):** Готовить блеф — выставить полные сундуки, спрятать пустые
- **Response (EN):** Confidence with varnish. Ashford peels paint for sport.
- **Response (RU):** Уверенность с лаком. Эшфорд снимает краску для развлечения.
- **Effects:** Loyalty -4, Succession +6, Nobility -3

**Choice 3**
- **Choice (EN):** Prepare seizure — crown takes guild assets before nobles arrive
- **Choice (RU):** Готовить захват — корона забирает активы гильдии до прибытия дворян
- **Response (EN):** Bold piracy. Fara will scream. Ashford may applaud — if you win.
- **Response (RU):** Смелое пиратство. Фара закричит. Эшфорд может аплодировать — если вы победите.
- **Effects:** Treasury +15, Loyalty -8, Army +5

---

### Beat 7 — Day 177

**Title (EN):** Joint final demand
**Title (RU):** Совместный последнее требование
**Character (EN):** Head of Guild Fara (node 0) → Banker Dominic Salt (node 1)
**Character (RU):** Глава гильдии Фара (узел 0) → Банкир Доминик Солт (узел 1)
**Note (EN):** **Two-node beat** — fires two days after Ashford debut. Great Houses [day 175](#beat-6--day-175--nobility-unlock-ashford-debut) colors variants.
**Note (RU):** **Эпизод из двух узлов** — срабатывает через два дня после дебюта Эшфорд. [День 175 Великих домов](#beat-6--day-175--nobility-unlock-ashford-debut) окрашивает варианты.

#### Node 0

**Prompt (EN):** Your Majesty, Ashford offers your lawful rule at a price. I offer money in the treasury at a sharper one. Sign the Guild Compact — crown tariffs fixed, private credit open, church tax capped by merchants not Malrik — or we call your notes due before sunset.
**Prompt (RU):** Ваше Величество, Эшфорд предлагает законное право править за цену. Я предлагаю деньги в казне — острее. Подпишите Гильдейский компакт — королевские пошлины фиксированы, частный кредит открыт, церковный налог ограничена купцами, а не Малриком — или мы объявим ваши долговые записки к оплате до заката.

**Prompt variant (`housesAshfordCouncil`) (EN):** Your Majesty, I heard you seated Ashford. She sells bloodlines. I sell time. Buy at least one honestly.
**Prompt variant (`housesAshfordCouncil`) (RU):** Ваше Величество, я слышал, вы посадили Эшфорд. Она продаёт родословные. Я продаю время. Купите хотя бы одно честно.

#### Node 1

**Prompt (EN):** Your Majesty, Fara spoke of compacts. I speak of clocks. Pay forty thousand crowns by week's end — coup principal, coup interest, coup insult — or I transfer your debts to northern buyers who prefer killing a king stories to killing a king reigns.
**Prompt (RU):** Ваше Величество, Фара говорила о компактах. Я говорю о часах. Заплатите сорок тысяч корон к концу недели — основной долг переворота, проценты переворота, оскорбление переворота — или я передам ваши долги северным покупателям, которым больше нравятся истории о killing a king, чем killing a king на троне.

---

### Beat 8 — Day 184

**Title (EN):** Mint Seizure
**Title (RU):** Захват монетного двора
**Character (EN):** Master of the Mint Nerius
**Character (RU):** Мастер монетного двора Нерий
**Note (EN):** Between Great Houses days 181 and 185. fake coin crisis branch.
**Note (RU):** Между днями 181 и 185 Великих домов. Ветка кризиса фальшивых монет.

#### Node 0

**Prompt (EN):** Your Majesty, false coin reached the army's pay chest — or would have, if Rudolf were less suspicious. I heard you defaulted on Salt or signed Fara's compact. My mint begs authority to seize every bad piece in the capital. Grant it, and trust returns slowly. Deny it, and trust never arrives.
**Prompt (RU):** Ваше Величество, ложная монета дошла до солдатской казны — или дошла бы, если бы Рудольф был менее подозрителен. Я слышал, вы объявили неуплата Солту или подписали компакт Фары. Мой монетный двор просит власти изъять каждую плохую монету в столице. Дайте её — и доверие вернётся медленно. Откажите — и доверие не придёт никогда.

**Prompt variant (`guildNeriusfake coin`) (EN):** Your Majesty, I heard you let fake seals spread. Seizure is surgery. You are already bleeding.
**Prompt variant (`guildNeriusfake coin`) (RU):** Ваше Величество, я слышал, вы позволили фальшивая монетам расползтись. Изъятие — хирургия. Вы уже кровоточите.

---

### Beat 9 — Day 192

**Title (EN):** payment deadline
**Title (RU):** Часы неуплаты
**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин
**Note (EN):** Four days before Northern [day 196](#beat-13--day-196--mobilize-or-bluff) mobilization — war costs vs default.
**Note (RU):** За четыре дня до [мобилизации Севера, день 196](#beat-13--day-196--mobilize-or-bluff) — расходы на войну против неуплаты.

#### Node 0

**Prompt (EN):** Your Majesty, the payment deadline strikes — Salt's agents camp at the lower gate, Fara's clerks audit your cellars, and Rudolf asks for war coin you do not have. I heard you signed, refused, or bluffed. Pay one final big sum, say you have no money left, or sell Edwin's crown jewels to merchants who will display them in shop windows.
**Prompt (RU):** Ваше Величество, часы неуплаты бьют — агенты Солта стоят у нижних ворот, клерки Фары ревизуют ваши погреба, а Рудольф просит военную монету, которой у вас нет. Я слышал, вы подписали, отказали или блефовали. Заплатите одну итоговую одну общую сумму, объявите открытую нет денег или продайте коронные драгоценности Эдвина купцам, которые выставят их в витринах лавок.

---

### Beat 10 — Day 204

**Title (EN):** Ledger Sold
**Title (RU):** Проданная книга
**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс
**Note (EN):** Foreshadows [Northern day 278](#beat-15--day-278--leaks-to-the-north) / Court of Knives energy. Treasury secrets sold.
**Note (RU):** Предвещает [Север, день 278](#beat-15--day-278--leaks-to-the-north) / дух Двора кинжалов. Тайны казны проданы.

#### Node 0

**Prompt (EN):** Your Majesty, I sold a copy of Borvin's true ledger — not the court version — to whoever paid highest this week. Fara, Salt, Ingvar, and Ashford each hold pages you wished private. I can buy pages back, sell you fake seals instead, or vanish. Your treasury's shame is now a commodity.
**Prompt (RU):** Ваше Величество, я продал копию истинного счёта Борвина — не той версии для двора — тому, кто заплатил больше всего на этой неделе. Фара, Солт, Ингвар и Эшфорд держат по несколько страниц, которые вы желали бы сохранить в тайне. Я могу выкупить страницы обратно, продать вам фальшивые монеты или исчезнуть. Позор вашей казны теперь — товар.

**Choice 3**
- **Choice (EN):** Arrest Knox — hang the messenger
- **Choice (RU):** Арестовать Нокса — повесить гонца
- **Response (EN):** Too late. The copies already walk. You chose theatre over arithmetic.
- **Response (RU):** Слишком поздно. Копии уже гуляют. Вы выбрали театр вместо арифметики.
- **Effects:** Loyalty -8, Army +2
- **Sets flag: `guildKnoxLeak` (exposed)**
- **Устанавливает флаг: guildKnoxLeak (раскрыт)**

---

### Beat 11 — Day 214

**Title (EN):** Debt Chapter
**Title (RU):** Глава о долге
**Character (EN):** Chronicler Ilana
**Character (RU):** Летописец Илана
**Note (EN):** Four days after Great Houses [Ilana day 210](#beat-15--day-210--who-bowed-who-bled) — different chapter, treasury not scaffold.
**Note (RU):** Четыре дня после [Иланы Великих домов, день 210](#beat-15--day-210--who-bowed-who-bled) — другая глава: казна, а не эшафот.

#### Node 0

**Prompt (EN):** Your Majesty, I write the second draft — not who bowed, but who owns your mornings. I heard Fara's compact, Salt's clock, Nerius's false coin, Selena's premiums, and Knox's stolen numbers. Title this chapter *King Who Can Pay*, *Debt Crown*, or *The Merchant's Throne* — the realm copies my verbs into law.
**Prompt (RU):** Ваше Величество, я пишу второй черновик — не о том, кто поклонился, а о том, кто владеет вашими утрами. Я слышала о компакте Фары, часах Солта, ложной монете Нерия, надбавках Селены и украденных числах Нокса. Озаглавьте эту главу *Король, который может платить*, *Долговая корона* или *Купеческий трон* — держава превращает мои глаголы в закон.

---

### Beat 12 — Day 222

**Title (EN):** Verdict on the Compact
**Title (RU):** Вердикт о компакте
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Arc finale. Four days after Great Houses [day 218](#beat-16--day-218--verdict-on-the-houses). **On load:** run [day 222 outcome priority](#guild-compact--beat-resolution-rules) → `guildOutcome`, `guildArcPhase = resolved`. Edric **reports** what creditors believe — player does not pick the ending.
**Note (RU):** Финал арки. Четыре дня после [дня 218 Великих домов](#beat-16--day-218--verdict-on-the-houses). **При загрузке:** выполнить [приоритет итога дня 222](#гильдейский-компакт--правила-разрешения-эпизодов) → guildOutcome, guildArcPhase = resolved. Эдрик **докладывает**, что думают кредиторы — игрок не выбирает концовку.

#### Node 0

**Prompt (outcome `sound_treasury`) (EN):** Your Majesty, ninety-four days since Fara froze your credit — and the counting houses speak your name without spitting. I heard Salt paid, fake seals purged, Borvin's ledgers matched. You bought time with gold. The oldest miracle. The crown owns its coffers again — for now.
**Prompt (outcome `sound_treasury`) (RU):** 

**Prompt (outcome `debt_crown`) (EN):** Your Majesty, I heard you have no money left, refused final demands, and creditors camping at the lower gate. The realm does not sue its king in court — it sues him in whispers, trade bans, and nephews. You belong to tomorrow's ledgers. You keep today's chair — barely.
**Prompt (outcome `debt_crown`) (RU):** 

**Prompt (outcome `merchant_throne`) (EN):** Your Majesty, I heard Salt's interest outlive your pride and Fara's smile outlive your policy. The merchants do not kneel — they invoice. You reign as partner-king or debtor-king. The compact calls it commerce. Ashford calls it humiliation.
**Prompt (outcome `merchant_throne`) (RU):** 

**Prompt (outcome `fake coin_crisis`) (EN):** Your Majesty, I heard false Edwin coin spread while the mintmaster begged or hung. Prices lie. Taxes lie with them. Trust does not return because you decree it. The treasury has a wound that gold alone cannot stitch.
**Prompt (outcome `fake coin_crisis`) (RU):** 

**Prompt (outcome `guild_republic`) (EN):** Your Majesty, I heard Fara's trade ban lift on guild terms and Salt's leash shorten together. You do not rule the markets — you share breath with them. Ashford sneers. Fara smiles. Both matter.
**Prompt (outcome `guild_republic`) (RU):** 

**Prompt (outcome `managed_debt`) (EN):** Your Majesty, no doctrine — only extensions, bluffs, and Knox's sold pages. The merchant's peace. Expensive. Familiar. You remain. That is also policy.
**Prompt (outcome `managed_debt`) (RU):** 

**Prompt (исход sound_treasury) (EN):** 
**Prompt (исход sound_treasury) (RU):** Ваше Величество, девяносто четыре дня прошло с тех пор, как Фара заморозила ваш кредит, — и торговые дома произносят ваше имя, не сплёвывая. Я слышал: Солту заплатили, фальшивые монеты очищены, записи казны Борвина сведены. Вы купили время за золото. Старейшее из чудес. Корона снова владеет своей казной — пока.

**Prompt (исход debt_crown) (EN):** 
**Prompt (исход debt_crown) (RU):** Ваше Величество, я слышал: открытая нет денег, отклонённые последние требования, кредиторы у нижних ворот. Держава не судит своего короля в суде — она судит его в шёпоте, запрет на торговлю и племянниках. Вы принадлежите завтрашним счетам. Сегодняшнее кресло вы держите — едва.

**Prompt (исход merchant_throne) (EN):** 
**Prompt (исход merchant_throne) (RU):** Ваше Величество, я слышал: проценты Солта пережили вашу гордость, а улыбка Фары пережила вашу политику. Купцы не кланяются — они выставляют счёт. Вы правите как король-партнёр или король-должник. Компакт называет это коммерцией. Эшфорд называет это унижением.

**Prompt (исход fake coin_crisis) (EN):** 
**Prompt (исход fake coin_crisis) (RU):** Ваше Величество, я слышал: фальшивые монеты Эдвина расползлись, пока монетный мастер умолял или болтался в петле. Цены лгут. Налоги лгут вместе с ними. Доверие не возвращается по вашему указу. У казны рана, которую золото одно не зашьёт.

**Prompt (исход guild_republic) (EN):** 
**Prompt (исход guild_republic) (RU):** Ваше Величество, я слышал: запрет на торговлю Фары снято на условиях гильдии, поводок Солта укоротился одновременно. Вы не правите рынками — вы дышите с ними в такт. Эшфорд насмехается. Фара улыбается. Важны обе.

**Prompt (исход managed_debt) (EN):** 
**Prompt (исход managed_debt) (RU):** Ваше Величество, никакой доктрины — только отсрочки, блефы и проданные страницы Нокса. Купеческий мир. Дорогостоящий. Привычный. Вы остались. Это тоже политика.

**Choice 1**
- **Choice (EN):** I have heard the creditors — dismiss the counting court
- **Choice (RU):** Я выслушал кредиторов — распустить счётный двор
- **Response (EN):** Then I write *able to pay* before *loyal*. Winter has other invoices — pay them too.
- **Response (RU):** Тогда я пишу *кто может платить* прежде *верного*. У зимы есть другие счета — их тоже оплатите.
- **Effects:** Treasury +5, Loyalty +8, Succession +6

---

## The Crown Forfeit & church tax War (persistent story)
## Отречение короны и война десятин (длящаяся история)

### Beat 1 — Day 30

**Title (EN):** The Verdict
**Title (RU):** Вердикт
**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик
**Note (EN):** Replaces encounter #80 after Church unlock cutscene. Node 1 always follows node 0.
**Note (RU):** Заменяет встречу #80 после сцены разблокировки Church. Узел 1 всегда следует за узлом 0.

#### Node 0

**Prompt (EN):** Your Majesty, the people know your crown, but do not know whether it is blessed. Today the Church must decide whether to name you king or one who took the throne. I did not come for your soul — I came for your name in the square.
**Prompt (RU):** Ваше Величество, народ знает вашу корону, но не знает — благословлена ли она. Сегодня Церковь обязана решить, называть вас королём или тем, кто взял трон. Я явился не за вашей душой — я явился за вашим именем на площади.

**Choice 1**
- **Choice (EN):** Ask the Church for a blessing — humility before heaven
- **Choice (RU):** Просить Церковь о благословении — смирение пред небом
- **Response (EN):** Humility is a fitting mask for one who reached the throne through blood. The faithful will hear it.
- **Response (RU):** Смирение — подходящая маска для того, кто достиг трона через кровь. Верующие это услышат.
- **Effects:** Church +15, Treasury -8, Loyalty +3
- **Next node:** 1

**Choice 2**
- **Choice (EN):** Demand recognition — the crown needs no sermon
- **Choice (RU):** Потребовать признания — короне не нужны проповеди
- **Response (EN):** Orders reach soldiers. They rise to heaven far less well. You will learn that soon.
- **Response (RU):** Приказы находят солдат. До неба они доходят значительно хуже. Вы скоро это узнаете.
- **Effects:** Church -12, Army +8, Loyalty -4
- **Next node:** 1

**Choice 3**
- **Choice (EN):** Offer an alliance — throne and altar share the realm
- **Choice (RU):** Предложить союз — трон и алтарь делят державу
- **Response (EN):** An alliance of crown and crosier may save Estedor. Or smother it. We will see which hungers more.
- **Response (RU):** Союз короны и посоха может спасти Эстедор. Или задушить его. Посмотрим, кто голоднее.
- **Effects:** Church +8, Treasury -5, Succession +3
- **Next node:** 1

**Choice 4**
- **Choice (EN):** Name the church split — I will not kneel to one priest's voice
- **Choice (RU):** Назвать раскол — я не встану на колени перед голосом одного жреца
- **Response (EN):** Then you align yourself with Arvel's muttering monks and against my choir. Dangerous. Popular, perhaps, among the hungry.
- **Response (RU):** Тогда вы встаёте на сторону бормочущих монахов Арвела и против моего хора. Опасно. Пожалуй, популярно среди голодных.
- **Effects:** Church -8, Loyalty +5
- **Next node:** 1

#### Node 1

**Prompt (EN):** Your Majesty, blessing is not a gift — it is a leash. I can preach you king and make the mob kneel. I can preach you king who took the throne and make them sharpen knives. Or I can preach silence — and let every lord decide whether you rule tomorrow. I heard you chose your tone on the threshold. Now choose what the Church buys with it.
**Prompt (RU):** Ваше Величество, благословение — не дар, а поводок. Я могу проповедовать вас королём и заставить толпу пасть на колени. Я могу проповедовать вас тем, кто взял трон и заставить точить ножи. Или я могу проповедовать молчание — и предоставить каждому лорду решать, правите ли вы завтра. Я слышал, что на пороге вы выбрали свой тон. Теперь выберите, что Церковь покупает за него.

**Prompt variant (`submit`) (EN):** Your Majesty, you asked for blessing. Then hear the price: church tax flows to God's house before yours, and my scribes copy your decrees only after my seal. I heard humility from your lips. The realm will hear ownership from mine.
**Prompt variant (`submit`) (RU):** 

**Prompt variant (`defy`) (EN):** Your Majesty, you demanded recognition as if heaven were a barracks. I heard steel in your voice. Steel does not consecrate. My scribes already draft a second sermon — for the day your guards cross themselves and step aside.
**Prompt variant (`defy`) (RU):** 

**Prompt variant (submit) (EN):** 
**Prompt variant (submit) (RU):** Ваше Величество, вы просили благословения. Тогда выслушайте цену: церковный налог течёт в Дом Господень прежде вашего, а мои писцы переписывают ваши указы лишь после моей печати. Я слышал смирение с ваших уст. Держава услышит владение с моих.

**Prompt variant (defy) (EN):** 
**Prompt variant (defy) (RU):** Ваше Величество, вы требовали признания, точно небо — казарма. Я слышал сталь в вашем голосе. Сталь не освящает. Мои писцы уже составляют вторую проповедь — на тот день, когда ваши стражники перекрестятся и отступят.

**Choice 3**
- **Choice (EN):** Shared ledger — tax and church tax negotiated, not decreed
- **Choice (RU):** Общий счёт — налог и церковный налог по договорённости, не по указу
- **Response (EN):** A merchant's peace. Borvin will hate it. I will tolerate it — until I do not.
- **Response (RU):** Купеческий мир. Борвин возненавидит. Я стерплю — до поры.
- **Effects:** Church +5, Treasury -8, Loyalty +2
- **Sets flag: `churchHolyLedger`**
- **Устанавливает флаг: churchHolyLedger**

---

### Beat 2 — Day 35

**Title (EN):** The Holy Inquiry
**Title (RU):** Святое расследование
**Character (EN):** Inquisitor Cyrus
**Character (RU):** Инквизитор Кирус
**Note (EN):** Fires five days after Malrik's verdict. Hunts church split, shelter, and forfeit resistance before Arvel's day-37 beat. Callback day 30 stance and Household `householdShelteredConfessor`.
**Note (RU):** Срабатывает через пять дней после вердикта Малрика. Преследует раскол, укрывательство и сопротивление отречению — до эпизода Арвела на день 37. Обратная отсылка: позиция дня 30 и householdShelteredConfessor.

#### Node 0

**Prompt (EN):** Your Majesty, Malrik names you king or one who took the throne in the square. I name you suspect in God's ledger. I heard you knelt, defied, or bargained on day thirty — and I heard Edwin's confessor still breathes in Arvel's cloister if rumour serves. My commission is inquiry, not sermon. Surrender names, surrender Aldo, or surrender patience.
**Prompt (RU):** Ваше Величество, Малрик называет вас королём или тем, кто взял трон на площади. Я называю вас подозреваемым в Господней книге счёта. Я слышал — вы преклонились, бросили вызов или торговались на тридцатый день, — и слышал, что исповедник Эдвина ещё дышит в обители Арвела, если слухи не лгут. Мои полномочия — расследование, не проповедь. Назовите имена, выдайте Альдо или исчерпайте моё терпение.

**Prompt variant (`defy` + `householdShelteredConfessor`) (EN):** Your Majesty, I heard you defied the altar and sheltered a priest who heard Edwin's sins. That is two treasons by Malrik's count. By mine, it is one investigation with excellent witnesses.
**Prompt variant (`defy` + `householdShelteredConfessor`) (RU):** 

**Prompt variant (`church split` stance) (EN):** Your Majesty, I heard you named church split before my boots crossed your threshold. Arvel's monks smile. I do not. Inquiry feeds on smiles.
**Prompt variant (`church split` stance) (RU):** 

**Prompt variant (defy + householdShelteredConfessor) (EN):** 
**Prompt variant (defy + householdShelteredConfessor) (RU):** Ваше Величество, я слышал — вы бросили вызов алтарю и укрыли жреца, слышавшего грехи Эдвина. По счёту Малрика — две измены. По моему — одно расследование с превосходными свидетелями.

**Prompt variant (позиция church split) (EN):** 
**Prompt variant (позиция church split) (RU):** Ваше Величество, я слышал — вы назвали раскол прежде, чем мои сапоги пересекли ваш порог. Монахи Арвела улыбаются. Я — нет. Дознание питается улыбками.

**Choice 1**
- **Choice (EN):** Cooperate — feed Cyrus loyalist names, not Aldo
- **Choice (RU):** Сотрудничать — снабдить Кируса именами лоялистов, но не Альдо
- **Response (EN):** Useful. Malrik will call it crown justice. Arvel will call it cowardice. Both may be right.
- **Response (RU):** Полезно. Малрик назовёт это королевским правосудием. Арвел назовёт трусостью. Оба могут быть правы.
- **Effects:** Church +8, Loyalty -6, Succession +6
- **Sets flag: `churchCyrusCooperated`**
- **Устанавливает флаг: churchCyrusCooperated**

**Choice 3**
- **Choice (EN):** Trade Aldo's exile for ending the inquiry
- **Choice (RU):** Обменять изгнание Альдо на прекращение расследования
- **Response (EN):** One priest for one peace. Malrik gains a scalp. You gain a week. Weeks add up.
- **Response (RU):** Один жрец за один мир. Малрик получает трофей. Вы получаете неделю. Недели складываются.
- **Effects:** Church +5, Loyalty -4, Succession +4
- **Clears flag: `householdShelteredConfessor` (if set — Aldo sent east)**
- **Снимает флаг: householdShelteredConfessor (если установлен — Альдо отправлен на восток)**

---

### Beat 3 — Day 37

**Title (EN):** The Other Half of the Church
**Title (RU):** Другая половина Церкви
**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел
**Note (EN):** Intro church split from intro cutscene. Absorbs former Household day-41 Malrik callbacks when `householdShelteredConfessor` or `householdChurchDeal` set. Follows [Inquisitor Cyrus day 35](#beat-2--day-35--the-holy-inquiry).
**Note (RU):** Раскол из вводной сцены. Поглощает обратные отсылки бывшего эпизода Малрика (Двор, день 41), если установлены householdShelteredConfessor или householdChurchDeal. Следует за [Инквизитором Кирусом, день 35](#эпизод-2--день-35--святое-расследование).

#### Node 0

**Prompt (EN):** Your Majesty, half the Church says the calamities were God's punishment. The other half says punishment sat on Edwin's throne long before your blade. I heard you chose a sermon on day thirty — kneel, defy, or bargain. Brother Malrik speaks for the altar. I speak for the poor who listen to both.
**Prompt (RU):** Ваше Величество, половина Церкви говорит, что бедствия — кара Господня. Другая половина говорит: кара сидела на троне Эдвина задолго до вашего клинка. Я слышал — вы выбрали проповедь на тридцатый день: преклониться, бросить вызов или торговаться. Брат Малрик говорит за алтарь. Я говорю за бедных, которые слушают обоих.

**Prompt variant (`churchCyrusCooperated`) (EN):** Your Majesty, I heard you fed Cyrus names while my brothers starved. Malrik calls that kingship. I call it appetite. Choose whether church split feeds the poor or only the inquisitor.
**Prompt variant (`churchCyrusCooperated`) (RU):** 

**Prompt variant (`householdShelteredConfessor`) (EN):** Your Majesty, I sheltered Edwin's confessor while Malrik drafts forfeit in his chapter house. I heard you kept Aldo under my roof — Malrik calls it treason in God's closet. The faithful heard mercy. Which sermon wins the lower wards?
**Prompt variant (`householdShelteredConfessor`) (RU):** 

**Prompt variant (churchCyrusCooperated) (EN):** 
**Prompt variant (churchCyrusCooperated) (RU):** Ваше Величество, я слышал — вы кормили Кируса именами, пока мои братья голодали. Малрик называет это королевским управлением. Я называю это аппетитом. Выберите: раскол питает бедных или только инквизитора.

**Prompt variant (householdShelteredConfessor) (EN):** 
**Prompt variant (householdShelteredConfessor) (RU):** Ваше Величество, я укрывал исповедника Эдвина, пока Малрик составлял отречение в своём капитуле. Я слышал — вы держали Альдо под моей кровлей; Малрик называет это изменой в Господнем шкафу. Верующие услышали милосердие. Какая проповедь побеждает в нижних кварталах?

---

### Beat 4 — Day 40

**Title (EN):** Two Kings' Tax
**Title (RU):** Налог двух королей
**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин
**Note (EN):** church tax War beat. Callback day 30 stance and Household `householdCutClerks`.
**Note (RU):** Война десятин начинается. Обратная отсылка: churchArcStance, churchHolyLedger.

#### Node 0

**Prompt (EN):** Your Majesty, church tax reached the treasury's throat this week — more coin to Malrik's house than to yours. I heard you opened day thirty with blessings or threats. The faithful pay God first now. If I cut clerks, he calls it insult to the sacred. If I pay soldiers, the altar calls it theft. Which king goes hungry — you or heaven?
**Prompt (RU):** Ваше Величество, казна платит дважды: раз короне, раз алтарю. Малрик называет церковный налог святым. Я называю его вторым налогом, который не спрашивает разрешения. Я слышал — вы торговались со счётом или бросили вызов его писцам. Сегодня я пришёл узнать, кто получает золото, когда солдаты не получают ни гроша.

**Prompt variant (`defy` + `householdCutClerks`) (EN):** Your Majesty, you purged Edwin's clerks and spat at Malrik in the same moon. I heard consistency. The church tax collectors heard a target. They are faster than your tax men.
**Prompt variant (`defy` + `householdCutClerks`) (RU):** 

**Prompt variant (`churchHolyLedger`) (EN):** Your Majesty, you promised a shared ledger on day thirty. Malrik's collectors did not read your contract. I heard negotiation. They heard suggestion.
**Prompt variant (`churchHolyLedger`) (RU):** 

**Prompt variant (churchHolyLedger) (EN):** 
**Prompt variant (churchHolyLedger) (RU):** Ваше Величество, вы и Малрик подписали общий счёт. Прекрасно на пергаменте. В казне — дыра. Я слышал соглашение. Я вижу дефицит.

**Choice 1**
- **Choice (EN):** Cap the church tax — crown law limits Church collection
- **Choice (RU):** Ограничить церковный налог — корона взыскивает первой
- **Response (EN):** The altar will hiss. The treasury will breathe. Malrik will call it persecution by sunset.
- **Response (RU):** Малрик назовёт это оскорблением святого. Солдаты назовут это жалованьем. Оба могут быть правы.
- **Effects:** Church -18, Treasury +15, Loyalty -5
- **Sets flag: `churchCapchurch tax`**
- **Устанавливает флаг: churchCapchurch tax**

---

### Beat 5 — Day 44

**Title (EN):** The Forfeit Machinery
**Title (RU):** Машина отречения
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Crown Forfeit beat — explains deposition tools. Callback day 30 and Borvin.
**Note (RU):** Политика отречения. Обратная отсылка: churchForfeitPressure, churchArcStance.

#### Node 0

**Prompt (EN):** Your Majesty, I served three kings and buried two. Malrik does not need a blade to end you — he has a ledger, a pulpit, and a word: *forfeit*. I heard you capped the church tax — or fed it. His scribes copy your name with a strike through it when forfeit is preached. Interdict next: no rites, no lawful rule, no guards who fear hell. Do you understand the machine you argued with on day thirty?
**Prompt (RU):** Ваше Величество, Малрик строит машину, которая снимает короны без меча. Проповедь, интердикт, отказ в помазании — всё это винты, которые крутят лордов против вас. Я слышал — вы выбрали тон на тридцатый день. Сегодня я пришёл сказать: машина работает, если вы позволяете ей работать.

**Prompt variant (`submit`) (EN):** Your Majesty, you knelt for blessing. I heard humility. Malrik heard leash. Forfeit is how he shortens it when you tug.
**Prompt variant (`submit`) (RU):** 

**Prompt variant (`churchCapchurch tax`) (EN):** Your Majesty, I heard you capped God's share. Malrik will not answer with arithmetic. He answers with pulpits.
**Prompt variant (`churchCapchurch tax`) (RU):** 

**Prompt variant (churchForfeitPressure ≥ 50) (EN):** 
**Prompt variant (churchForfeitPressure ≥ 50) (RU):** Ваше Величество, давление отречения уже высоко. Лорды шепчут. Малрик не шепчет — он проповедует. Вы можете остановить машину или стать её жертвой.

**Choice 1**
- **Choice (EN):** Prepare secular law — crown lawful right to rule without sacrament
- **Choice (RU):** 
- **Response (EN):** Bold. The faithful call it heresy. Soldiers may call it clarity. Write it before Sunday.
- **Response (RU):** 
- **Effects:** Church -8, Army +6, Succession +5

**Choice 2**
- **Choice (EN):** Negotiate boundaries — what Malrik may preach, what he may not
- **Choice (RU):** 
- **Response (EN):** A treaty with heaven's broker. It holds until it does not. Usually until gold runs thin.
- **Response (RU):** 
- **Effects:** Church +5, Loyalty +4, Treasury -6

---

### Beat 6 — Day 48

**Title (EN):** Church Buys the Granaries
**Title (RU):** Церковь скупает закрома
**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена
**Note (EN):** church tax War beat — Church outbids crown for grain. Grey Lung optional day 45 may have fired.
**Note (RU):** Экономическое давление войны десятин. Обратная отсылка: churchCapchurch tax, churchGrainMonopoly.

#### Node 0

**Prompt (EN):** Your Majesty, Malrik's church tax buys grain at prices my caravans cannot match. I heard you fought him in ledgers on day forty — he answered in bread. Temples feed the hungry and preach who saved them. Your crown feeds soldiers and preaches who paid them. Which sermon fills the belly faster?
**Prompt (RU):** Ваше Величество, Малрик покупает зерно быстрее, чем я могу продать. Он называет это милостыней. Я называю это единоличной властью над рынком. Голодные слушают того, кто кормит. Я слышал — вы ограничили церковный налог или заплатили в полном объёме. Сегодня рынок говорит громче казны.

**Prompt variant (plague arc active) (EN):** Your Majesty, Grey Lung makes every granary a fortress. Malrik sells blessed grain from temple stores. I heard you fund physic in the wards — he funds prayer in the lines. The sick thank heaven before they thank you.
**Prompt variant (plague arc active) (RU):** 

**Prompt variant (`churchCapchurch tax`) (EN):** Your Majesty, I heard you capped church tax. Malrik capped nothing — he spends temple reserves on grain and calls it charity. The mob calls it love.
**Prompt variant (`churchCapchurch tax`) (RU):** 

**Prompt variant (churchCapchurch tax) (EN):** 
**Prompt variant (churchCapchurch tax) (RU):** Ваше Величество, вы ограничили церковный налог. Малрик ответил — скупает зерно. Он кормит толпу. Вы кормите солдат. Кто победит на площади?

**Choice 1**
- **Choice (EN):** Outbid the Church — crown grain at temple steps
- **Choice (RU):** Запретить церковные закупки зерна — корона контролирует хлеб
- **Response (EN):** Hungry praise is expensive. Worth it, until the next empty purse.
- **Response (RU):** Малрик назовёт это гонением. Голодные назовут это голодом. Выберите, кого бояться больше.
- **Effects:** Treasury -18, Food +12, Loyalty +8, Church -6
- **Устанавливает флаг: churchGrainMonopoly (корона)**

**Choice 2**
- **Choice (EN):** Seize temple granaries — feed the crown first
- **Choice (RU):** Конкурировать — казна покупает зерно для народа
- **Response (EN):** Then hear forfeit by dawn. You will have bread and sermons about your black soul.
- **Response (RU):** Дорого. Эффективно. Малрик не любит конкуренцию.
- **Effects:** Food +15, Church -20, Loyalty -5, Army +5
- **Sets flag: `churchGrainMonopoly` (broken)**

**Choice 3**
- **Choice (EN):** Let Selena broker — shared caravans, shared credit
- **Choice (RU):** Позволить единоличную власть над рынком — сберечь казну, рискуя толпой
- **Response (EN):** I will sell you grain and sell Malrik your caution. Remember I sell both ways.
- **Response (RU):** Казна цела. Репутация — нет. Малрик кормит. Вы считаете.
- **Effects:** Treasury -10, Food +8, Church +3
- **Sets flag: `churchSelenaBroker`**
- **Устанавливает флаг: churchGrainMonopoly (церковь)**

---

### Beat 7 — Day 55

**Title (EN):** The Fasting Decree
**Title (RU):** Указ о посте
**Character (EN):** Sister Velda
**Character (RU):** Сестра Велда
**Note (EN):** church tax War beat — Malrik declares meat unclean / fasting. Velda runs hospital sisters who feed the sick while the realm fasts. Callback Household `householdKeptGromm` (Gromm no longer speaks in this arc) and church stance.
**Note (RU):** Духовное давление на народ. Обратная отсылка: church_route Серого Кашля, churchArcStance.

#### Node 0

**Prompt (EN):** Your Majesty, Malrik named meat unclean this week — penance for a killing a king's reign. My sisters still boil broth for Grey Lung wards while the faithful fast in the square. I heard you purged Edwin's kitchens or kept them; either way, the court must eat and the sick must drink. Soldiers ask why God hates their supper. I ask why heaven starves hospitals to feed sermons.
**Prompt (RU):** Ваше Величество, Малрик объявил пост — не для души, а для желудка. Голодные молятся громче. Я слышал — вы выбрали путь смирения, вызова или раскола. Сегодня пост — это оружие, и оно бьёт по вашим подданным.

**Prompt variant (`householdKeptGromm`) (EN):** Your Majesty, Gromm still feeds your court because you kept him when others purged Edwin's ghosts. My wards feed the poor because I kept my vows. Malrik hears corruption on both pots. Choose whether mercy stops at the palace door.
**Prompt variant (`householdKeptGromm`) (RU):** 

**Prompt variant (`churchGrainMonopoly` broken) (EN):** Your Majesty, I heard you seized temple grain. Malrik answered with fasting — hunger as holiness. The barracks are louder than the chapel. My sisters hide soup beneath habits.
**Prompt variant (`churchGrainMonopoly` broken) (RU):** 

**Prompt variant (church_route активен) (EN):** 
**Prompt variant (church_route активен) (RU):** Ваше Величество, Серый Кашель говорит о святой воде и чудесах. Малрик говорит о посте и покаянии. Народ слушает обоих. Кто кормит душу — кормит и толпу.

**Choice 1**
- **Choice (EN):** Ignore the decree — the court and wards eat as they please
- **Choice (RU):** 
- **Response (EN):** Then the faithful call you glutton and sinner. The soldiers call you king. My patients call you sensible.
- **Response (RU):** 
- **Effects:** Church -15, Army +8, Food +5, Loyalty -4, Health +3
- **Sets flag: `churchFastingDecree` (defied)**

**Choice 2**
- **Choice (EN):** Observe the fast — public penance at table
- **Choice (RU):** Поддержать пост — показать смирение
- **Response (EN):** Humility in public, resentment in the wards. Malrik will call it conversion. I call it theatre that kills slowly.
- **Response (RU):** Смирение покупает время. Голод покупает Малрика. Выберите, что дороже.
- **Effects:** Church +12, Army -6, Loyalty +3, Health -5
- **Устанавливает флаг: churchFastingDecree**

---

### Beat 8 — Day 61

**Title (EN):** Pilgrims at the Gate
**Title (RU):** Странники у ворот
**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн
**Note (EN):** Crown Forfeit beat — faithful block palace demanding forfeit or blessing.
**Note (RU):** Эпизод отречения — верующие блокируют дворец, требуя отречения или благословения.

#### Node 0

**Prompt (EN):** Your Majesty, three thousand pilgrims camp at the lower gate — Malrik's doing, though he swears innocence. They chant forfeit or blessing, whichever comes first. I heard you defied fasting in the yards or knelt at table — they heard both from spies. My guards will not disperse a holy crowd without your word on blood.
**Prompt (RU):** Ваше Величество, три тысячи странников разбили лагерь у нижних ворот — дело рук Малрика, хотя он клянётся в невиновности. Они скандируют: отречение или благословение — что наступит раньше. Я слышал — вы бросили вызов посту во дворах или преклонились за столом; шпионы слышали и то, и другое. Мои стражи не разгонят святую толпу без вашего слова о крови.

**Prompt variant (`defy` consistent) (EN):** Your Majesty, I heard you chose steel over scripture on day thirty, capped church tax, and fed soldiers while the faithful fasted. The pilgrims are your sermon made flesh. They want your crown or your confession.
**Prompt variant (`defy` consistent) (RU):** 

**Prompt variant (`submit`) (EN):** Your Majesty, I heard you knelt for blessing. They want you to kneel again — publicly, permanently. Malrik says once is theatre. Three times is doctrine.
**Prompt variant (`submit`) (RU):** Ваше Величество, я слышал — вы преклонились за благословением. Они хотят, чтобы вы преклонились снова — публично, навсегда. Малрик говорит: раз — театр. Три раза — доктрина.

**Prompt variant (последовательный `defy`) (EN):** 
**Prompt variant (последовательный `defy`) (RU):** Ваше Величество, я слышал — на тридцатый день вы выбрали сталь вместо писания, ограничили церковный налог и кормили солдат, пока верующие постились. Странники — ваша проповедь, облечённая в плоть. Они хотят вашу корону или ваше признание.

**Choice 1**
- **Choice (EN):** Disperse them — soldiers clear the gate
- **Choice (RU):** Разогнать их — солдаты очищают ворота
- **Response (EN):** Blood in a holy crowd buys martyrs. Malrik knows that. He hopes you do not.
- **Response (RU):** Кровь в святой толпе покупает мучеников. Малрик это знает. Надеется, что вы — нет.
- **Effects:** Army -10, Church -18, Loyalty -12, Succession +6

**Choice 2**
- **Choice (EN):** Address them yourself — speak before Malrik speaks for you
- **Choice (RU):** Обратиться к ним лично — говорить прежде, чем заговорит Малрик
- **Response (EN):** Brave or foolish. The square will hear one king today. Pray it is you.
- **Response (RU):** Смело или глупо. Площадь услышит одного короля сегодня. Молитесь, чтобы это были вы.
- **Effects:** Loyalty +10, Church +5, Army +3

**Choice 3**
- **Choice (EN):** Let Malrik disperse his own flock — he made the pilgrimage
- **Choice (RU):** Пусть Малрик разгоняет своё стадо — он создал паломничество
- **Response (EN):** Then he owns the miracle and the riot. You own the walls. For now.
- **Response (RU):** Тогда он владеет чудом и бунтом. Вы владеете стенами. Пока что.
- **Effects:** Church +12, Loyalty -8, Succession -5
- **Sets flag: `churchPilgrimCrisis`**
- **Устанавливает флаг: `churchPilgrimCrisis`**

---

### Beat 9 — Day 69

**Title (EN):** Crossed Swords and Empty Purses
**Title (RU):** Скрещённые мечи и пустые кошельки
**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Merged A+B — army unpaid (church tax war + [Empty Purse](#the-empty-purse-persistent-story)) + soldiers cross themselves (forfeit). Callback pilgrims, Borvin, `emptyPurseCrisis`.
**Note (RU):** Объединение A+B — армия без жалованья (война десятин + [Пустой кошелёк](#the-empty-purse-persistent-story)) + солдаты крестятся (отречение). Обратные отсылки: странники, Борвин, `emptyPurseCrisis`.

#### Node 0

**Prompt (EN):** Your Majesty, two companies crossed themselves instead of marching when I ordered dispersal at the gate. I heard pilgrims camped because you would not or could not clear them. Borvin says church tax ate their pay. Malrik says heaven outranks you. I heard Salt's coup debt and Kara's wagons in the same breath. Tell me whether I discipline soldiers, pay them, or let the Church feed their families and steal their oaths.
**Prompt (RU):** Ваше Величество, две роты перекрестились вместо того, чтобы маршировать, когда я приказал разогнать толпу у ворот. Я слышал — странники разбили лагерь, потому что вы не могли или не хотели их очистить. Борвин говорит: церковный налог съел их жалованье. Малрик говорит: небо выше вас. Я слышал долг переворота Солта и повозки Кары в одном дыхании. Скажите — дисциплинировать солдат, платить им или позволить Церкви кормить их семьи и красть их клятвы.

**Prompt variant (`emptyPurseCrisis` or `emptyPurseOutcome = ghost_army`) (EN):** Your Majesty, I heard you told the army honor feeds barracks. They believed you until the third empty muster. Crossed themselves? They crossed you first.
**Prompt variant (`emptyPurseCrisis` or `emptyPurseOutcome = ghost_army`) (RU):** 

**Prompt variant (`churchPilgrimCrisis`) (EN):** Your Majesty, I heard you let Malrik own the crowd at the gate. My men think he pays better in bread and blessings. They are not wrong.
**Prompt variant (`churchPilgrimCrisis`) (RU):** Ваше Величество, я слышал — вы позволили Малрику владеть толпой у ворот. Мои люди думают, он платит лучше — хлебом и благословениями. Они не ошибаются.

**Prompt variant (`churchFastingDecree` defied) (EN):** Your Majesty, I heard you fed the barracks while the realm fasted. The faithful call your soldiers sinners. Your soldiers call the faithful unpaid creditors.
**Prompt variant (`churchFastingDecree` defied) (RU):** Ваше Величество, я слышал — вы кормили казармы, пока держава постилась. Верующие зовут ваших солдат грешниками. Солдаты зовут верующих неоплаченными кредиторами.

**Prompt variant (`emptyPurseCrisis` или `emptyPurseOutcome = ghost_army`) (EN):** 
**Prompt variant (`emptyPurseCrisis` или `emptyPurseOutcome = ghost_army`) (RU):** Ваше Величество, я слышал — вы сказали армии, что честь кормит казармы. Они поверили — до третьего пустого сбора. Перекрестились? Они перекрестили вас первыми.

**Choice 1**
- **Choice (EN):** Pay the army from crown reserves — buy oaths back
- **Choice (RU):** Заплатить армии из королевских резервов — выкупить клятвы
- **Response (EN):** Gold before God. A soldier's theology. Expensive — until cheaper than mutiny.
- **Response (RU):** Золото прежде Бога. Солдатская теология. Дорого — пока не дешевле мятежа.
- **Effects:** Treasury -22, Army +15, Church -8, Loyalty +5

**Choice 2**
- **Choice (EN):** Arrest the ringleaders — steel before scripture
- **Choice (RU):** Арестовать зачинщиков — сталь прежде писания
- **Response (EN):** Then hang men who crossed themselves. The barracks will remember. The chaplains will scream.
- **Response (RU):** Тогда повесьте людей, перекрестившихся. Казармы запомнят. Капелланы закричат.
- **Effects:** Army +8, Church -15, Loyalty -10

**Choice 3**
- **Choice (EN):** Let Malrik feed their families — but demand their oaths remain
- **Choice (RU):** Пусть Малрик кормит их семьи — но требуйте, чтобы клятвы остались
- **Response (EN):** You ask the altar to pay and the sword to obey. I give it one month.
- **Response (RU):** Вы просите алтарь платить, а меч повиноваться. Даю месяц.
- **Effects:** Church +10, Army -6, Treasury +5
- **Sets flag: `churchArmyFedByAltar`**
- **Устанавливает флаг: `churchArmyFedByAltar`**

---

### Beat 10 — Day 77

**Title (EN):** The Interdict and the Ledger
**Title (RU):** Интердикт и счёт
**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик
**Note (EN):** Climax — interdict (no rites) plus church tax final demand. Callback entire arc.
**Note (RU):** Кульминация — интердикт (нет обрядов) плюс последнее требование церковного налога. Обратная отсылка на всю арку.

#### Node 0

**Prompt (EN):** Your Majesty, I heard you capped my church tax, seized my grain, fed sinners in barracks, and let pilgrims name you forfeit at the gate. I do not need a blade. I suspend sacraments in the capital — no baptisms, no last rites, no quiet conscience for your guards. Either you submit the crown to God's ledger, or you rule a city that fears hell more than you.
**Prompt (RU):** Ваше Величество, я слышал — вы ограничили мой церковный налог, захватили моё зерно, кормили грешников в казармах и позволили странникам назвать вас отречённым у ворот. Мне не нужен клинок. Я приостанавливаю обряды в столице — ни крещений, ни обрядов умирания, ни тихой совести для ваших стражников. Либо вы подчиняете корону Божьей книге счёта, либо правите городом, который боится ада больше, чем вас.

**Prompt variant (`churchHolyLedger` + `bargain`) (EN):** Your Majesty, you promised shared ledger and shared power. I heard a merchant's offer. I answer with interdict — heaven does not haggle on its knees.
**Prompt variant (`churchHolyLedger` + `bargain`) (RU):** Ваше Величество, вы обещали общий счёт и разделённую власть. Я слышал купеческое предложение. Отвечаю интердиктом — небо не торгуется на коленях.

**Prompt variant (`church split` confirmed) (EN):** Your Majesty, Arvel's monks preach against me while you fund both sides. I heard you split the Church. I will unsplit the capital — one sermon, one king, and it will not be you unless you kneel.
**Prompt variant (`church split` confirmed) (RU):** 

**Prompt variant (подтверждённый `church split`) (EN):** 
**Prompt variant (подтверждённый `church split`) (RU):** Ваше Величество, монахи Арвела проповедуют против меня, пока вы кормите обе стороны. Я слышал — вы раскололи Церковь. Я соберу столицу в одно — одна проповедь, один король, и это будете не вы, если не преклонитесь.

**Choice 1**
- **Choice (EN):** Kneel — accept blessed by the church lawful right to rule on Church terms
- **Choice (RU):** Преклониться — принять помазанную законность на условиях Церкви
- **Response (EN):** Then forfeit dies in the square and lives in the chapter house. You survive. You serve.
- **Response (RU):** Тогда отречение умирает на площади и живёт в капитуле. Вы выживаете. Вы служите.
- **Effects:** Church +20, Succession +10, Army -8, Loyalty +5
- **Sets flag: `churchInterdictDeclared` (lifted)**
- **Устанавливает флаг: `churchInterdictDeclared` (снят)**

**Choice 2**
- **Choice (EN):** Defy the interdict — secular crown, secular law
- **Choice (RU):** Бросить вызов интердикту — светская корона, светский закон
- **Response (EN):** Then every pulpit names you cursed. I heard steel in your voice on day thirty. Steel must finish what it began.
- **Response (RU):** Тогда каждая кафедра назовёт вас проклятым. Я слышал сталь в вашем голосе на тридцатый день. Сталь должна завершить начатое.
- **Effects:** Church -20, Army +12, Loyalty -8
- **Sets flag: `churchInterdictDeclared` (active)**
- **Устанавливает флаг: `churchInterdictDeclared` (активен)**

---

### Beat 11 — Day 108

**Title (EN):** The Conclave
**Title (RU):** Конклав
**Character (EN):** High Priest Malrik or Monk Arvel
**Character (RU):** Верховный жрец Малрик или монах Арвел
**Note (EN):** Finale. **On load:** run [day 108 outcome priority](#church-arc--beat-resolution-rules) → `churchOutcome`, `churchArcPhase = resolved`. **Malrik** speaks unless `churchArcStance = church split` (then **Arvel**). Speaker **reports** the conclave's verdict — player does not pick the ending.
**Note (RU):** Финал. **При загрузке:** применить [приоритет итога дня 108](#арка-церкви--правила-разрешения-эпизодов) → `churchOutcome`, `churchArcPhase = resolved`. **Малрик** говорит, если только `churchArcStance ≠ church split` (тогда **Арвел**). Оратор **докладывает** вердикт конклава — игрок не выбирает концовку.

#### Node 0

**Prompt (EN):** Your Majesty, Malrik's conclave met to name you forfeit. My brothers met to name you possible. I heard you chose church split when others chose kneeling. The capital has two sermons and one throne. Reform, bread, and a king who does not buy heaven — that is what the streets will remember.
**Prompt (RU):** Ваше Величество, конклав Малрика собрался, чтобы назвать вас отречённым. Мои братья собрались, чтобы назвать вас возможным. Я слышал — вы выбрали раскол, когда другие выбрали колени. У столицы две проповеди и один трон. Реформа, хлеб и король, не покупающий небо — вот что запомнят улицы.

---

## The Northern Price (persistent story)
## Северная цена (длящаяся история)

### Beat 1 — Day 5

**Title (EN):** First Envoy
**Title (RU):** Первый посланник
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** First northern contact — before Church, Household beat 2 (day 8). Sets initial trust trajectory.
**Note (RU):** Первый северный контакт — до Church, до эпизода 2 Двора (день 8). Задаёт начальную траекторию доверия.

#### Node 0

**Prompt (EN):** Your Majesty, I am Ambassador Ingvar of the northern princes. They have not decided whether you are a king, a killing a king, or a temporary inconvenience. I am here to learn which before their banners learn it for them.
**Prompt (RU):** Ваше Величество, я — посол Ингвар северных князей. Они ещё не решили, король вы, цареубийца или временная неудобность. Я здесь, чтобы узнать, какой из вариантов, прежде чем их знамёна узнают сами.

**Choice 1**
- **Choice (EN):** Receive him as an equal envoy — the north has our respect
- **Choice (RU):** Принять его как равного посланника — север заслуживает уважения
- **Response (EN):** Then they will call you prudent. For a week. After that they price respect in coin and corpses.
- **Response (RU):** Тогда назовут вас благоразумным. Неделю. Потом оценят уважение в монетах и трупах.
- **Effects:** Loyalty +3, Army +2
- **Trust: +8**

**Choice 2**
- **Choice (EN):** Insult the princes — Edwin's throne was ours by right of conquest
- **Choice (RU):** Оскорбить князей — трон Эдвина наш по праву завоевания
- **Response (EN):** I will carry your eloquence north. They will answer with winter and horses. You chose the loud door.
- **Response (RU):** Я донесу вашу красноречивость на север. Ответят зимой и конями. Вы выбрали громкую дверь.
- **Effects:** Army +5, Treasury +3
- **Trust: −22**

**Choice 3**
- **Choice (EN):** Bribe him for time — gold buys silence
- **Choice (RU):** Подкупить его за время — золото покупает молчание
- **Response (EN):** I am not cheap, but I am persuadable. They will hear you are buying days, not alliances.
- **Response (RU):** Я не дешёв, но поддаюсь убеждению. Они услышат: вы покупаете дни, не союзы.
- **Effects:** Treasury -10, Loyalty +2
- **Trust: +12**

---

### Beat 2 — Day 12

**Title (EN):** The killing a king's Receipt
**Title (RU):** Квитанция цареубийцы
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** Ingvar was present on day 5 — use **direct witness** phrasing (*You treated me…* / *You called the north vultures…*), never *I heard X or Y*. Implemented in `build_northern_receipt_prompt()` (`arc_prompts.das`) from `northernEnvoyChoice` + `northernTrust` tier set in `apply_northern_beat_choice()` (`arc_effects.das`).
**Note (RU):** Вариант по уровню `northernTrust` из эпизода 1.

#### Node 0

**Prompt (default — no day-5 data) (EN):** Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? They want the same answer in writing before they recognize your seal.
**Prompt (default — no day-5 data) (RU):** 

**Prompt variant (choice 1 insult / Hostile) (EN):** Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? You called the north vultures before your crown was warm. They do not send recognition — they send a list of exiles they already shelter. Pay attention to the names.
**Prompt variant (choice 1 insult / Hostile) (RU):** 

**Prompt variant (choice 0 equal envoy / Cordial) (EN):** Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? You treated me as an equal envoy on day five. Unusual for a king who took the throne. They want the same answer in writing before they recognize your seal.
**Prompt variant (choice 0 equal envoy / Cordial) (RU):** 

**Prompt variant (choice 2 feast / delay) (EN):** Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? You fed me wine on day five and bought time. They will price that habit in coin, not alliances — but they still want your answer in writing.
**Prompt variant (choice 2 feast / delay) (RU):** 

**Prompt (EN):** 
**Prompt (RU):** Ваше Величество, князья просят квитанцию: сколько стоил переворот и кому ещё должны? Я слышал — на пятый день вы приняли меня с учтивостью — или со плевком. Они хотят тот же ответ письменно, прежде чем признают вашу печать.

**Prompt variant (Hostile) (EN):** 
**Prompt variant (Hostile) (RU):** Ваше Величество, я слышал — вы назвали север стервятниками, пока корона ещё не остыла. Князья не шлют признание — шлют список изгнанников, которых уже укрывают. Обратите внимание на имена.

**Prompt variant (Cordial / Allied) (EN):** 
**Prompt variant (Cordial / Allied) (RU):** Ваше Величество, я слышал — вы приняли посланника как равного. Необычно для того, кто взял трон. Князья предлагают предварительное письмо — не дружбу, но незапертую дверь.

**Choice 1**
- **Choice (EN):** Send recognition papers — ask the north to name you king
- **Choice (RU):** Послать документы признания — попросить север назвать вас королём
- **Response (EN):** Then you ask wolves to bless the lamb. Brave. They will answer with conditions, not hymns.
- **Response (RU):** Тогда просите волков благословить ягнёнка. Смело. Ответят условиями, не гимнами.
- **Effects:** Succession +5, Treasury -5
- **Trust: +10**

**Choice 2**
- **Choice (EN):** Refuse all forms — the crown needs no northern ink
- **Choice (RU):** Отказать от всех форм — короне не нужна северная чернила
- **Response (EN):** Ink is cheaper than cavalry. You will learn which runs out first.
- **Response (RU):** Чернила дешевле кавалерии. Узнаете, что кончится раньше.
- **Effects:** Army +4, Loyalty -4
- **Trust: −15**

**Choice 3**
- **Choice (EN):** Trade receipts — Edwin's debts for your recognition
- **Choice (RU):** Обменять квитанции — долги Эдвина на ваше признание
- **Response (EN):** A merchant's peace. Borvin will curse you. The princes will read your ledgers before your titles.
- **Response (RU):** Купеческий мир. Борвин проклянёт вас. Князья прочтут ваши книги прежде титулов.
- **Effects:** Treasury -8, Succession +8
- **Trust: +5**
- **Sets flag: `northernTributePaid` (partial)**
- **Устанавливает флаг: `northernTributePaid` (частично)**

---

### Beat 3 — Day 20

**Title (EN):** Smoke on the Border
**Title (RU):** Дым на границе
**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Military pressure. Callback day 5 trust (Ingvar warned or praised).
**Note (RU):** Военное давление. Обратная отсылка: доверие дня 5 (Ингвар предупреждал или хвалил).

#### Node 0

**Prompt (EN):** Your Majesty, riders report smoke on the Grey Pass — not army campfires, but villages burning. I heard Ingvar left your hall on day five pleased or furious. The north tests borders when words fail. Do I reinforce the pass, raid in answer, or send you to negotiate what steel should not?
**Prompt (RU):** Ваше Величество, всадники докладывают о дыме у Серого Перевала — не костры армии, а горящие деревни. Я слышал — Ингвар покинул ваш зал на пятый день довольным или в ярости. Север испытывает границы, когда слова не срабатывают. Усилить перевал, ответить набегом или послать вас договариваться о том, что сталь не должна?

**Prompt variant (Hostile trust) (EN):** Your Majesty, I heard you spat at the northern envoy. The smoke is your answer. Give me two companies or give me a better sermon.
**Prompt variant (Hostile trust) (RU):** Ваше Величество, я слышал — вы плюнули в северного посланника. Дым — ваш ответ. Дайте две роты или лучшую проповедь.

**Choice 1**
- **Choice (EN):** Reinforce Grey Pass — hold the line
- **Choice (RU):** Усилить Серый Перевал — держать линию
- **Response (EN):** Then the treasury bleeds and the north knows you flinch with walls, not horses.
- **Response (RU):** Тогда казна истекает кровью, а север узнаёт: вы дёргаетесь стенами, не конями.
- **Effects:** Army +8, Treasury -12, Food -5
- **Trust: −5 (shows fear)**

**Choice 2**
- **Choice (EN):** Raid northern scouts — answer smoke with steel
- **Choice (RU):** Набег на северных разведчиков — ответить дымом сталью
- **Response (EN):** A border war by breakfast. Ingvar will call it banditry. The princes will call it invitation.
- **Response (RU):** Пограничная война к завтраку. Ингвар назовет разбойничеством. Князья — приглашением.
- **Effects:** Army +5, Loyalty -6
- **Trust: −25**

**Choice 3**
- **Choice (EN):** Send Ingvar to the pass — words before blood
- **Choice (RU):** Послать Ингвара к перевалу — слова прежде крови
- **Response (EN):** Then we bet diplomacy on a man who sells all sides. Cheaper than graves — if it works.
- **Response (RU):** Тогда ставим на дипломатию человека, продающего все стороны. Дешевле могил — если сработает.
- **Effects:** Loyalty +4, Treasury -6
- **Trust: +8**

---

### Beat 4 — Day 27

**Title (EN):** Before the Faith
**Title (RU):** Прежде веры
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** Three days before Church unlock (day 30). Malrik will soon compete for lawful right to rule — Ingvar offers secular alternative.
**Note (RU):** За три дня до разблокировки Church (день 30). Малрик скоро будет конкурировать за законность — Ингвар предлагает светскую альтернативу.

#### Node 0

**Prompt (EN):** Your Majesty, in three days your priests will ask whether heaven blesses killing a king. I heard Rudolf reinforced the pass — or raided it. The princes offer a secular bargain before Malrik offers a holy one: recognize their trade rights, and they recognize your seal. God can wait. Politics cannot.
**Prompt (RU):** Ваше Величество, через три дня ваши жрецы спросят, благословляет ли небо цареубийство. Я слышал — Рудольф укрепил перевал — или ударил по нему. Князья предлагают светскую сделку прежде святой Малрика: признайте их торговые права — и они признают вашу печать. Бог может подождать. Политика — нет.

**Prompt variant (Wary) (EN):** Your Majesty, I heard you hold the border with stone, not gifts. Fair. The princes raise tribute instead of banners — for now. Pay, or let Malrik become your only friend.
**Prompt variant (Wary) (RU):** Ваше Величество, я слышал — вы держите границу камнем, не дарами. Справедливо. Князья поднимают дань вместо знамён — пока. Платите — или пусть Малрик станет вашим единственным другом.

**Choice 1**
- **Choice (EN):** Pay northern tribute — buy time before the Church acts
- **Choice (RU):** Заплатить северную дань — купить время, пока Церковь не действует
- **Response (EN):** Then Borvin weeps and the pass stays quiet. Malrik will call it selling your soul to merchants instead of priests.
- **Response (RU):** Тогда Борвин плачет, а перевал молчит. Малрик назовет это продажей души купцам вместо жрецов.
- **Effects:** Treasury -18, Succession +6, Church -3
- **Trust: +18**
- **Sets flag: `northernTributePaid`**
- **Устанавливает флаг: `northernTributePaid`**

**Choice 2**
- **Choice (EN):** Refuse — let Malrik and the princes bid separately
- **Choice (RU):** Отказать — пусть Малрик и князья торгуются отдельно
- **Response (EN):** Then you enter day thirty with two enemies and no ledger. Bold arithmetic.
- **Response (RU):** Тогда встречаете тридцатый день с двумя врагами и без гроссбука. Смелая арифметика.
- **Effects:** Church +2, Army +3
- **Trust: −12**

**Choice 3**
- **Choice (EN):** Offer double trade — Estedor becomes northern gateway
- **Choice (RU):** Предложить двойную торговлю — Эстедор становится северными воротами
- **Response (EN):** Commerce as diplomacy. Selena will grow rich. Rudolf will grow suspicious. Useful tensions.
- **Response (RU):** Коммерция как дипломатия. Селена разбогатеет. Рудольф насторожится. Полезные напряжения.
- **Effects:** Treasury -5, Food +5, Loyalty +3
- **Trust: +14**

---

### Beat 5 — Day 46

**Title (EN):** The War Chest
**Title (RU):** Военная казна
**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин
**Note (EN):** Church church tax war may be active. Northern trust affects whether princes offer loan or trade ban.
**Note (RU):** Война десятин Церкви может быть активна. Северное доверие влияет: князья предлагают заём или запрет на торговлю.

#### Node 0

**Prompt (EN):** Your Majesty, Ingvar's treaty still smells of your day-twenty-seven choice — tribute paid, border held, or insult banked. The princes offer a loan for forts on the Grey Pass, or a trade ban if we arm further. I heard Malrik eats our church tax. The north eats our trade. Which wolf do we feed?
**Prompt (RU):** Ваше Величество, договор Ингвара всё ещё пахнет вашим выбором двадцать седьмого дня — дань уплачена, граница удержана или оскорбление в казне. Князья предлагают заём на форты у Серого Перевала или запрет на торговлю, если мы вооружаемся дальше. Я слышал — Малрик ест наш церковный налог. Север ест нашу торговлю. Какого волка кормим?

**Prompt variant (Allied trust) (EN):** Your Majesty, I heard the north calls you pragmatic. They offer gold at shameful interest — better than Rudolf's mutiny. Take the loan, build the wall, owe a friend.
**Prompt variant (Allied trust) (RU):** Ваше Величество, я слышал — север зовёт вас прагматичным. Предлагают золото под позорными процентами — лучше, чем мятеж Рудольфа. Берите заём, стройте стену, должны другу.

**Prompt variant (Hostile) (EN):** Your Majesty, I heard the princes ban grain trade on the northern road. Arm the pass and we starve. Disarm and we kneel. Choose your favorite humiliation.
**Prompt variant (Hostile) (RU):** Ваше Величество, я слышал — князья вводят запрет на торговлю на зерно с северной дороги. Вооружайте перевал — и голодайте. Разоружайте — и преклоняйтесь. Выбирайте любимое унижение.

**Choice 1**
- **Choice (EN):** Take the northern loan — owe the princes
- **Choice (RU):** Взять северный заём — должны князьям
- **Response (EN):** Gold in the chest, rope around the crown. Standard diplomacy.
- **Response (RU):** Золото в сундуке, петля на короне. Обычная дипломатия.
- **Effects:** Treasury +20, Succession -5, Army +5
- **Trust: +10**

**Choice 2**
- **Choice (EN):** Refuse foreign coin — crown pays its own forts
- **Choice (RU):** Отказаться от чужой монеты — корона платит за свои форты
- **Response (EN):** Honorable and slow. Rudolf approves. Ingvar smiles elsewhere.
- **Response (RU):** Честно и медленно. Рудольф одобрит. Ингвар улыбнётся где-то ещё.
- **Effects:** Treasury -15, Army +6, Loyalty +4
- **Trust: −8**

**Choice 3**
- **Choice (EN):** Let Selena finance the pass — private debt, public wall
- **Choice (RU):** Пусть Селена финансирует перевал — частный долг, общая стена
- **Response (EN):** Merchants own the battlements. For a time. Then they own the conversation.
- **Response (RU):** Купцы владеют бастионами. На время. Потом — разговором.
- **Effects:** Treasury +8, Nobility -5
- **Trust: +3**

---

### Beat 6 — Day 57

**Title (EN):** Agents from the North
**Title (RU):** Агенты с севера
**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс
**Note (EN):** Espionage beat. Knox presents catch (or exposure) of northern scribes. Household callbacks if loyalists sheltered. [Captain Varn](#beat-3--day-16--old-swords-on-the-wall) no longer speaks in this arc.
**Note (RU):** Шпионский эпизод. Нокс представляет пойманных (или разоблачённых) северных писцов. Обратные отсылки Двора, если укрывали лоялистов. [Капитан Варн](#beat-3--day-16--old-swords-on-the-wall) больше не говорит в этой арке.

#### Node 0

**Prompt (EN):** Your Majesty, my nets caught northern agents in the lower city — not soldiers, scribes. I heard you sheltered Edwin's clerks or cut them; these men carry lists of who still mourns the old king. Ingvar calls them merchants. I call them a map of your enemies. Torture, trade, or return them with a message?
**Prompt (RU):** Ваше Величество, мои сети поймали северных агентов в нижнем городе — не солдат, писцов. Я слышал — вы укрывали клерков Эдвина или отсекли их; эти люди несут списки тех, кто ещё скорбит о старом короле. Ингвар зовёт их купцами. Я зову их картой ваших врагов. Пытать, обменять или вернуть с посланием?

**Prompt variant (`householdShelteredConfessor`) (EN):** Your Majesty, I heard you sheltered Aldo while northern scribes map disloyalty. These agents and your ghosts rhyme. Return them and Ingvar learns your soft spots. Keep them and learn his.
**Prompt variant (`householdShelteredConfessor`) (RU):** Ваше Величество, я слышал — вы укрыли Альдо, пока северные писцы картографировали нелояльность. Эти агенты и ваши призраки рифмуются. Верните их — и Ингвар узнает ваши слабые места. Держите — и узнаете его.

**Choice 1**
- **Choice (EN):** Return them politely — gift to Ingvar
- **Choice (RU):** Вернуть вежливо — дар Ингвару
- **Response (EN):** Courtesy with shackles. He will call it trust. I call it habit.
- **Response (RU):** Учтивость в кандалах. Он назовет это доверием. Я — привычкой.
- **Effects:** Loyalty +3, Army -2
- **Trust: +12**

**Choice 2**
- **Choice (EN):** Interrogate — learn northern intentions
- **Choice (RU):** Допросить — узнать северные намерения
- **Response (EN):** Ink and screams. Useful mix. Ingvar will hear before sunset.
- **Response (RU):** Чернила и крики. Полезная смесь. Ингвар услышит до заката.
- **Effects:** Succession +6, Loyalty -5
- **Trust: −18**

**Choice 3**
- **Choice (EN):** Execute as spies — send heads to the pass
- **Choice (RU):** Казнить как шпионов — послать головы к перевалу
- **Response (EN):** Then war speaks a dialect everyone understands.
- **Response (RU):** Тогда война говорит диалектом, который все понимают.
- **Effects:** Army +6, Church -3
- **Trust: −35**

---

### Beat 7 — Day 66

**Title (EN):** Alliance Charter
**Title (RU):** Хартия союза
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** Major trust branch. High trust = alliance offer; low = final demand.
**Note (RU):** Крупная ветка доверия. Высокое доверие = предложение союза; низкое = последнее требование.

#### Node 0

**Prompt (EN):** Your Majesty, I heard you hung my scribes or starved my merchants. The princes do not offer alliance — they offer terms. Dismantle forts on the Grey Pass, pay twelve years of tribute, and they will not call you killing a king in every hall from here to the sea.
**Prompt (RU):** Ваше Величество, я слышал — вы повесили моих писцов или голодили моих купцов. Князья не предлагают союз — предлагают условия. Разобрать форты у Серого Перевала, платить двенадцать лет дани — и они не назовут вас цареубийцей в каждом зале отсюда до моря.

**Choice 1**
- **Choice (EN):** Accept terms — buy survival
- **Choice (RU):** Принять условия — купить выживание
- **Response (EN):** Then you are tributary, not king. Cheaper than graves — for now.
- **Response (RU):** Тогда вы данник, не король. Дешевле могил — пока.
- **Effects:** Treasury -25, Army -8, Succession -8
- **Trust: +15**

**Choice 2**
- **Choice (EN):** Reject — prepare for northern march
- **Choice (RU):** Отклонить — готовиться к северному походу
- **Response (EN):** Then Rudolf earns his keep. Ingvar earns his commission. Winter earns its reputation.
- **Response (RU):** Тогда Рудольф оправдает жалованье. Ингвар — комиссию. Зима — репутацию.
- **Effects:** Army +12, Treasury -10
- **Trust: −15**

**Choice 3**
- **Choice (EN):** Counter-offer Edwin's nephew — they keep the boy, you keep the pass
- **Choice (RU):** Встречное предложение — племянник Эдвина: они держат мальчика, вы держите перевал
- **Response (EN):** Dangerous trade. Succession for peace. Ashford will hear. So will history.
- **Response (RU):** Опасная сделка. Престолонаследие за мир. Эшфорд услышит. История — тоже.
- **Effects:** Succession -10, Treasury -5
- **Trust: +5**

---

### Beat 8 — Day 78

**Title (EN):** Skirmish at Grey Pass
**Title (RU):** Стычка у Серого Перевала
**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Military climax of early-mid arc. Trust and `northernWarStage` drive variants.
**Note (RU):** Военная кульминация ранне-средней арки. Доверие и `northernWarStage` задают варианты.

#### Node 0

**Prompt (EN):** Your Majesty, blood at the Grey Pass — our men or theirs, depending who lies. I heard you signed Ingvar's charter — or spat on his terms. The north tests whether the throne-stealer's army is real. Do I hold, pursue, or sue for parley while the snow still owns the heights?
**Prompt (RU):** Ваше Величество, кровь у Серого Перевала — наши или их, смотря кто лжёт. Я слышал — вы подписали хартию Ингвара — или плюнули в его условия. Север проверяет, настоящая ли армия того, кто взял трон. Удерживать, преследовать или просить перемирия, пока снег ещё владеет высотами?

**Prompt variant (`northernAllianceSigned`) (EN):** Your Majesty, I heard you allied with the princes. These skirmishers may be rogue companies — or a test. Hold fire until Ingvar answers, or answer with steel and lose a friend.
**Prompt variant (`northernAllianceSigned`) (RU):** Ваше Величество, я слышал — вы союзники с князьями. Эти застрельщики могут быть ренегатами — или испытанием. Держите огонь, пока Ингвар не ответит, или ответьте сталью и потеряйте друга.

**Choice 1**
- **Choice (EN):** Pursue into the pass — strike before spring
- **Choice (RU):** Преследовать в перевал — ударить до весны
- **Response (EN):** Victory wins songs. Defeat wins northern sermons about killing a king's price.
- **Response (RU):** Победа даёт песни. Поражение — северные проповеди о цене цареубийства.
- **Effects:** Army -8, Treasury -12, Loyalty +5
- **Trust: −20**
- **Sets flag: `northernWarDeclared`**
- **Устанавливает флаг: `northernWarDeclared`**

**Choice 2**
- **Choice (EN):** Hold the line — no pursuit
- **Choice (RU):** Держать линию — без преследования
- **Response (EN):** Discipline before glory. The men will call it caution. The treasury will call it wisdom.
- **Response (RU):** Дисциплина прежде славы. Люди назовут осторожностью. Казна — мудростью.
- **Effects:** Army +5, Food -6
- **Trust: +5**

**Choice 3**
- **Choice (EN):** Parley under white banner — let Ingvar speak
- **Choice (RU):** Перемирие под белым флагом — пусть говорит Ингвар
- **Response (EN):** Then we bet words again. Cheaper if you still have credit with him.
- **Response (RU):** Тогда снова ставим на слова. Дешевле, если у вас ещё есть кредит у него.
- **Effects:** Loyalty +4, Army -3
- **Trust: +10**

---

### Beat 9 — Day 91

**Title (EN):** Refugees at the Ford
**Title (RU):** Беженцы у брода
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** **People stat unlocked day 89** — first beat that may apply People directly. Refugee crisis.
**Note (RU):** **Параметр People разблокирован день 89** — первый эпизод, который может напрямую влиять на People. Кризис беженцев.

#### Node 0

**Prompt (EN):** Your Majesty, two thousand northern refugees crowd the ford — famine in the princes' hills, or a leash to embarrass you. I heard you allied with us — or declared us enemies. The commons already watch whether the king who took the throne feeds strangers while Edwin's widows beg. Malrik offers baptisms. I offer politics.
**Prompt (RU):** Ваше Величество, две тысячи северных беженцев теснят брод — голод в княжеских холмах или поводок, чтобы вас опозорить. Я слышал — вы союзники с нами — или объявили врагами. Простолюдины уже смотрят, кормит ли тот, кто взял трон, чужаков, пока вдовы Эдвина просят. Малрик предлагает крещения. Я — политику.

**Prompt variant (Allied) (EN):** Your Majesty, I heard our charter holds. These are my people, not your enemies. Shelter them and the princes remember. Turn them away and I remember.
**Prompt variant (Allied) (RU):** Ваше Величество, я слышал — наша хартия держится. Это мой народ, не ваши враги. Укройте их — и князья запомнят. Отверните — и запомню я.

**Choice 1**
- **Choice (EN):** Shelter refugees — camps on crown land
- **Choice (RU):** Укрыть беженцев — лагеря на королевской земле
- **Response (EN):** Mercy with a bill. The People will see it — if they are allowed to look.
- **Response (RU):** Милосердие со счётом. People увидят — если им позволят смотреть.
- **Effects:** People +12, Food -15, Treasury -10, Loyalty +6
- **Trust: +15**
- **Sets flag: `northernRefugeesAccepted`**
- **Устанавливает флаг: `northernRefugeesAccepted`**

**Choice 2**
- **Choice (EN):** Turn them back — close the ford
- **Choice (RU):** Развернуть назад — закрыть брод
- **Response (EN):** Cold borders make clean arithmetic. Loud sermons follow.
- **Response (RU):** Холодные границы дают чистую арифметику. Громкие проповеди следуют.
- **Effects:** Army +4, People -10, Loyalty -8
- **Trust: −18**
- **Sets flag: `northernRefugeesTurnedBack`**
- **Устанавливает флаг: `northernRefugeesTurnedBack`**

**Choice 3**
- **Choice (EN):** Let Arvel feed them — Church bears the cost
- **Choice (RU):** Пусть Арвел кормит их — Церковь несёт расходы
- **Response (EN):** Then Malrik owns the miracle. You own the wall. Standard trade.
- **Response (RU):** Тогда Малрик владеет чудом. Вы — стеной. Обычная сделка.
- **Effects:** Church +8, People +6, Food -8
- **Trust: +5**

---

### Beat 10 — Day 122

**Title (EN):** Mid-Year final demand
**Title (RU):** Ультиматум середины года
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** Major branch on `northernTrust`. Grey Lung may be active — variant references physic trade.
**Note (RU):** Крупная ветка по `northernTrust`. Серый Кашель может быть активен — вариант ссылается на торговлю лекарством.

#### Node 0

**Prompt (EN):** Your Majesty, I heard your year has been steel and hunger. The princes will not renew courtesy. Withdraw from the Grey Pass by month's end, or northern hosts march when the roads thaw. I am not threatening you. I am translating winter.
**Prompt (RU):** Ваше Величество, я слышал — ваш год был сталью и голодом. Князья не обновят учтивость. Отступите с Серого Перевала к концу месяца — или северные полки пойдут, когда дороги оттают. Я не угрожаю. Я перевожу зиму.

**Choice 1**
- **Choice (EN):** Withdraw from the pass — strategic retreat
- **Choice (RU):** Отступить с перевала — стратегическое отступление
- **Response (EN):** Then you gift them the heights. The court will call it peace. The barracks will call it something else.
- **Response (RU):** Тогда дарите им высоты. Двор назовёт миром. Казармы — иначе.
- **Effects:** Army -10, Succession -6, Treasury +5
- **Trust: +8**

**Choice 2**
- **Choice (EN):** Refuse — war before thaw
- **Choice (RU):** Отказать — война до оттепели
- **Response (EN):** Then Rudolf stops pretending diplomacy is a career.
- **Response (RU):** Тогда Рудольф перестаёт притворяться, что дипломатия — карьера.
- **Effects:** Army +15, Treasury -20, Food -10
- **Trust: −30**

**Choice 3**
- **Choice (EN):** Submit as vassal — tribute and hostages
- **Choice (RU):** 
- **Response (EN):** You survive as a crowned administrator. History will be unkind. You will be alive.
- **Response (RU):** 
- **Effects:** Treasury -30, Army -5, Succession -15

---

### Beat 11 — Day 145

**Title (EN):** Guns on the Northern Road
**Title (RU):** Оружие на северной дороге
**Character (EN):** Mercenary Kara
**Character (RU):** Наёмница Кара
**Note (EN):** Kara sells to both sides. Shared with [Empty Purse beat 6](#beat-6--day-47--steel-for-sale). Trust tier changes who she betrays. [Merchant Selena](#beat-7--day-49--loyalists-buy-grain) no longer speaks in this arc.
**Note (RU):** Кара продаёт обеим сторонам. Пересекается с [Пустым кошельком, эпизод 6](#beat-6--day-47--steel-for-sale). Уровень доверия меняет, кого она предаёт. [Купчиха Селена](#beat-7--day-49--loyalists-buy-grain) больше не говорит в этой арке.

#### Node 0

**Prompt (EN):** Your Majesty, I heard Ingvar's final demand on day one-twenty-two — alliance, retreat, or war. Northern buyers want crossbows. Rudolf wants them first. I sell to whoever pays and remembers — I heard your purse on day forty-seven. Do you seize my caravan, match their price, or let steel flow north and hope it points away from you?
**Prompt (RU):** Ваше Величество, я слышал последнее требование Ингвара на сто двадцать второй день — союз, отступление или война. Северные покупатели хотят арбалеты. Рудольф хочет их первым. Продаю тому, кто платит и помнит — я слышал ваш кошелёк на сорок седьмой день. Конфискуете мой караван, сравняетесь с их ценой или пустите сталь на север и надеетесь, что она укажет не на вас?

**Prompt variant (Allied) (EN):** Your Majesty, I heard the charter holds. Sell to the north and you arm friends. Sell only to Rudolf and you arm suspicion. I profit either way. You choose which risk is yours.
**Prompt variant (Allied) (RU):** Ваше Величество, я слышал — хартия держится. Продайте на север — вооружите друзей. Продайте только Рудольфу — вооружите подозрение. Я выиграю в любом случае. Вы выбираете, чей риск ваш.

**Prompt variant (`emptyPurseKaraCrown`) (EN):** Your Majesty, I heard you hired me on the throne's tab. Rudolf wants exclusivity. Ingvar wants discretion. I want coin that does not bounce. Renew the contract or lose the wagons.
**Prompt variant (`emptyPurseKaraCrown`) (RU):** Ваше Величество, я слышал — вы наняли меня в долг трона. Рудольф хочет эксклюзив. Ингвар — тайну. Я хочу монету, которая не отскакивает. Обновите контракт или потеряйте повозки.

**Choice 1**
- **Choice (EN):** Crown monopoly — all arms through Rudolf
- **Choice (RU):** Единоличная власть короны — всё оружие через Рудольфа
- **Response (EN):** Then the army is fed and Kara is angry. A familiar balance.
- **Response (RU):** Тогда армия сыта, а Кара зла. Знакомый баланс.
- **Effects:** Army +10, Treasury -12, Loyalty -3
- **Trust: −10**

**Choice 2**
- **Choice (EN):** Free trade — Kara sells to both
- **Choice (RU):** Свободная торговля — Кара продаёт обеим сторонам
- **Response (EN):** Gold flows. Loyalties blur. War gets cheaper for everyone.
- **Response (RU):** Золото течёт. Верности размываются. Война дешевеет для всех.
- **Effects:** Treasury +15, Army -5
- **Trust: +5 north; Rudolf loyalty −5**

**Choice 3**
- **Choice (EN):** Sell only to the north — buy alliance in steel
- **Choice (RU):** Продавать только на север — купить союз сталью
- **Response (EN):** Then Rudolf calls it treason. Ingvar calls it friendship. You call it Tuesday.
- **Response (RU):** Тогда Рудольф назовет изменой. Ингвар — дружбой. Вы назовёте вторником.
- **Effects:** Army -8, Treasury +8
- **Trust: +18**

---

### Beat 12 — Day 172

**Title (EN):** Houses Measure Your Wars
**Title (RU):** Дома меряют ваши войны
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** **Three days before Nobility unlock (day 175) and Lady Ashford.** Great houses watch foreign policy.
**Note (RU):** **За три дня до разблокировки Nobility (день 175) и леди Эшфорд.** Великие дома следят за внешней политикой.

#### Node 0

**Prompt (EN):** Your Majesty, in three days the great houses stop watching from their estates and start measuring your throat. I heard you allied with the north, or angered it, or fed its refugees while your own provinces hunger. Ashford will ask whether you can win a war abroad and a ledger at home. Before she arrives — do you seek noble levies for the pass, or keep this a crown war the houses can ignore?
**Prompt (RU):** Ваше Величество, через три дня великие дома перестанут смотреть с поместий и начнут мерить ваше горло. Я слышал — вы союзники с севером, или разозлили его, или кормили его беженцев, пока ваши провинции голодали. Эшфорд спросит, можете ли вы выиграть войну за рубежом и счёт дома. Прежде чем она приедет — зовёте ли вы дворянские ополчения на перевал или оставляете это королевской войной, которую дома могут игнорировать?

**Choice 1**
- **Choice (EN):** Summon noble levies — bind houses to your war
- **Choice (RU):** Созвать дворянские ополчения — связать дома с вашей войной
- **Response (EN):** Then they bleed with you — or plot while you bleed. Ashford will note who came.
- **Response (RU):** Тогда они истекают кровью с вами — или строят заговоры, пока вы истекаете. Эшфорд запишет, кто пришёл.
- **Effects:** Army +12, Nobility -8, Succession +5
- **Sets flag: `northernAshfordLinked`**
- **Устанавливает флаг: `northernAshfordLinked`**

**Choice 2**
- **Choice (EN):** Keep war a crown matter — do not involve houses yet
- **Choice (RU):** Оставить войну делом короны — не вовлекать дома пока
- **Response (EN):** Privacy preserves options. It also preserves their knives until later.
- **Response (RU):** Тайна сохраняет варианты. И их ножи — до поры.
- **Effects:** Nobility +5, Army -3

**Choice 3**
- **Choice (EN):** Marry war to peace — offer houses northern trade shares
- **Choice (RU):** Связать войну с миром — предложить домам доли северной торговли
- **Response (EN):** Ledger diplomacy. Ashford respects ledgers. Whether she respects you remains her hobby.
- **Response (RU):** Дипломатия счёта. Эшфорд уважает книги. Уважает ли она вас — её хобби.
- **Effects:** Treasury -8, Nobility +8, Loyalty +4
- **Trust: +8**

---

### Beat 13 — Day 196

**Title (EN):** Mobilize or Bluff
**Title (RU):** Мобилизация или блеф
**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Nobility era. `northernWarStage` and trust drive war/peace.
**Note (RU):** Эра Nobility. `northernWarStage` и доверие задают войну/мир.

#### Node 0

**Prompt (EN):** Your Majesty, northern hosts gather beyond the pass — or so my scouts swear. I heard the great houses offer levies — or withhold them. Ingvar says it is training. I say it is a clock. Mobilize fully and empty the treasury. Bluff with parades and hope. Or strike first and dare the north to answer before Ashford's couriers spread the tale.
**Prompt (RU):** Ваше Величество, северные полки собираются за перевалом — или так клянутся мои разведчики. Я слышал — великие дома предлагают ополчения — или удерживают их. Ингвар говорит, это учения. Я говорю — часы. Полная мобилизация и пустая казна. Блеф парадами и надежда. Или удар первым и вызов северу ответить, пока гонцы Эшфорд не разнесут сказание.

**Choice 1**
- **Choice (EN):** Full mobilization — war footing
- **Choice (RU):** Полная мобилизация — военное положение
- **Response (EN):** Then every coin feeds steel until steel feeds us back or buries us.
- **Response (RU):** Тогда каждая монета кормит сталь, пока сталь не кормит нас — или не хоронит.
- **Effects:** Army +18, Treasury -25, Food -12, Loyalty +5

**Choice 2**
- **Choice (EN):** Parade bluff — look strong, stay hollow
- **Choice (RU):** Блеф парадом — выглядеть сильным, оставаться пустым
- **Response (EN):** Theater with drums. Cheaper until someone calls the bluff with cavalry.
- **Response (RU):** Театр с барабанами. Дешевле — пока кто-то не проверит блеф кавалерией.
- **Effects:** Army +5, Treasury -8, Loyalty -4

**Choice 3**
- **Choice (EN):** Pre-emptive strike — hit muster camps
- **Choice (RU):** Превентивный удар — атаковать сборные лагеря
- **Response (EN):** Aggression as policy. Ingvar will call it banditry. History may call it survival.
- **Response (RU):** Агрессия как политика. Ингвар назовет разбойничеством. История может назвать выживанием.
- **Effects:** Army -10, Treasury -15, Succession +8
- **Trust: −40**
- **Sets flag: `northernWarDeclared`**
- **Устанавливает флаг: `northernWarDeclared`**

---

### Beat 14 — Day 252

**Title (EN):** Loyalties for Sale
**Title (RU):** Верности на продажу
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** **Eight days before Loyalty unlock (day 260).** Court betrayal + northern gold.
**Note (RU):** **За восемь дней до разблокировки Loyalty (день 260).** Дворцовое предательство + северное золото.

#### Node 0

**Prompt (EN):** Your Majesty, in eight days your court's loyalty becomes a counted thing. I heard whispers that my princes already priced several of your advisors. I am not here to confess — I am here to bid. Match northern gold, expose the buyers, or let the market decide who owns your tomorrow.
**Prompt (RU):** Ваше Величество, через восемь дней верность вашего двора станет считаемой величиной. Я слышал шёпот: мои князья уже оценили нескольких ваших советников. Я не для признания — я для торга. Сравняйте северное золото, разоблачите покупателей или пусть рынок решит, кому принадлежит ваш завтра.

**Prompt variant (Hostile + war) (EN):** Your Majesty, war makes traitors cheap. I heard your chancellor listens when we speak. Surrender the pass and I deliver loyalty. Refuse and I sell to whoever wins the knife fight.
**Prompt variant (Hostile + war) (RU):** Ваше Величество, война делает предателей дешёвыми. Я слышал — ваш канцлер слушает, когда мы говорим. Сдайте перевал — и я доставлю верность. Откажите — и продам тому, кто выиграет ножевую драку.

**Choice 1**
- **Choice (EN):** Pay crown gold — outbid the north
- **Choice (RU):** Заплатить королевским золотом — перебить север
- **Response (EN):** Expensive throne. Still a throne — if the payments hold.
- **Response (RU):** Дорогой трон. Всё же трон — если платежи держатся.
- **Effects:** Treasury -22, Loyalty +12
- **Trust: −5**

**Choice 2**
- **Choice (EN):** Expose northern bribes — public trial
- **Choice (RU):** Разоблачить северные взятки — публичный суд
- **Response (EN):** Scandal as hygiene. Someone swings. Someone talks. The court learns fear.
- **Response (RU):** Скандал как гигиена. Кто-то повиснет. Кто-то заговорит. Двор узнает страх.
- **Effects:** Loyalty +8, Army +5, Nobility -6
- **Trust: −15**

**Choice 3**
- **Choice (EN):** Secret deal — sell minor secrets for truce
- **Choice (RU):** Тайная сделка — продать мелкие секреты за перемирие
- **Response (EN):** Then you are merchant and monarch both. Edric would call it familiar. He would not call it wise.
- **Response (RU):** Тогда вы купец и монарх одновременно. Эдрик назвал бы это привычным. Мудрым — нет.
- **Effects:** Treasury +10, Loyalty -15, Succession -8
- **Trust: +20**

---

### Beat 15 — Day 278

**Title (EN):** Leaks to the North
**Title (RU):** Утечки на север
**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс
**Note (EN):** Loyalty era (unlock day 260 passed). Knox confesses or exposes guard who sold maps. Callback [Empty Purse](#the-empty-purse-persistent-story) unpaid guard.
**Note (RU):** Эра Loyalty (разблокировка день 260 прошла). Нокс признаётся или разоблачает стражу, продавшую карты. Обратная отсылка [Пустой кошелёк](#the-empty-purse-persistent-story) неоплаченной страже.

#### Node 0

**Prompt (EN):** Your Majesty, palace guard sold patrol maps to northern buyers — I heard Ingvar's gold on day two-fifty-two land in familiar pockets. I also heard you starved the barracks on day sixty-five. Loyalty is arithmetic. Purge the guard, feed them better, or feed Ingvar a lie and hope he buys it.
**Prompt (RU):** Ваше Величество, дворцовая стража продала карты патрулей северным покупателям — я слышал золото Ингвара со сто пятьдесят второго дня в знакомых карманах. Я также слышал — вы голодили казармы на шестьдесят пятый день. Верность — арифметика. Чистите стражу, кормите лучше или скормите Ингвару ложь и надеетесь, что купит.

**Prompt variant (`emptyPurseOutcome` = `ghost_army` or `mercenary_throne`) (EN):** Your Majesty, I heard you chose mercenaries or honor over pay. Maps leaked because oaths leaked first. Hang thieves, pay soldiers, or hire me to lie better.
**Prompt variant (`emptyPurseOutcome` = `ghost_army` or `mercenary_throne`) (RU):** 

**Prompt variant (`prophetKnoxNamed`) (EN):** Your Majesty, I heard the Nameless Prophet named me in the square before you did. The mob already knows my price. Hang me for theatre, or hire me for truth — Ingvar pays better when you hesitate.
**Prompt variant (`prophetKnoxNamed`) (RU):** Ваше Величество, я слышал — Безымянный Пророк назвал меня на площади раньше вас. Толпа уже знает мою цену. Повесьте меня для театра или наймите для правды — Ингвар платит лучше, когда вы колеблетесь.

**Prompt variant (`emptyPurseOutcome` = `ghost_army` или `mercenary_throne`) (EN):** 
**Prompt variant (`emptyPurseOutcome` = `ghost_army` или `mercenary_throne`) (RU):** Ваше Величество, я слышал — вы выбрали наёмников или честь вместо платы. Карты утекли, потому что клятвы утекли первыми. Вешайте воров, платите солдатам или наймите меня лгать лучше.

**Choice 1**
- **Choice (EN):** Purge the guard — new oaths, new men
- **Choice (RU):** Чистка стражи — новые клятвы, новые люди
- **Response (EN):** Steel solves loyalty until it becomes the next problem.
- **Response (RU):** Сталь решает верность, пока не станет следующей проблемой.
- **Effects:** Army +6, Loyalty -8, Treasury -10

**Choice 2**
- **Choice (EN):** Double pay and investigation — find the buyers
- **Choice (RU):** Удвоить плату и расследование — найти покупателей
- **Response (EN):** Gold and gallows. Traditional pairing.
- **Response (RU):** Золото и виселицы. Традиционная пара.
- **Effects:** Treasury -15, Loyalty +10, Army +4

**Choice 3**
- **Choice (EN):** Feed Ingvar false maps — counter-intelligence
- **Choice (RU):** Скормить Ингвару ложные карты — контрразведка
- **Response (EN):** Clever. If he believes you, the pass is yours for a month. If not, you armed him twice.
- **Response (RU):** Умно. Если поверит — перевал ваш на месяц. Если нет — вооружили его дважды.
- **Effects:** Loyalty +5, Army +3
- **Trust: −10 or +10 (counter-intelligence roll)**

---

### Beat 16 — Day 350

**Title (EN):** The Year's Ledger
**Title (RU):** Годовой счёт
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** **After Succession unlock (day 320).** Arc finale. **On load:** run [day 350 outcome priority](#northern-price--beat-resolution-rules) → `northernOutcome`, `northernArcPhase = resolved`. Ingvar **reports** how the northern princes name your year — player does not pick the ending.
**Note (RU):** **После разблокировки Succession (день 320).** Финал арки. **При загрузке:** применить [приоритет итога дня 350](#северная-цена--правила-разрешения-эпизодов) → `northernOutcome`, `northernArcPhase = resolved`. Ингвар **докладывает**, как северные князья называют ваш год — игрок не выбирает концовку.

#### Node 0

**Prompt (outcome `ally`) (EN):** Your Majesty, three hundred and fifty days since a blade gave you a crown the north did not grant. I heard tribute refused, charter signed, refugees housed, maps guarded. The princes end the year calling you ally — not friend, not vassal, but the king who took the throne worth binding. Your heirs and ours will argue together. Better than arguing alone.
**Prompt (outcome `ally`) (RU):** 

**Prompt (outcome `cold_peace`) (EN):** Your Majesty, I heard every choice — trade where oaths failed, courtesy where war tempted. The princes offer no alliance and no war. Estedor ends the year independent and watched. Partners who do not trust partners. Common in thrones.
**Prompt (outcome `cold_peace`) (RU):** 

**Prompt (outcome `tributary`) (EN):** Your Majesty, I heard coin crossing the pass more often than steel. Tribute bought seasons. The princes call you able to pay, not sovereign. You keep the throne as a rented chair. Humiliating. Durable, sometimes.
**Prompt (outcome `tributary`) (RU):** 

**Prompt (outcome `victor`) (EN):** Your Majesty, I heard mobilization, raids, and timing over honor. You chose steel when winter closed. The pass is yours — for now. Rudolf approves. I mourn. War returns as habit if you sleep.
**Prompt (outcome `victor`) (RU):** 

**Prompt (outcome `broken`) (EN):** Your Majesty, I heard lies, hangings, bankrupt maps, and spring avoided once too often. The princes offer no friendship. The realm is cracked — by war, by abdication of quarrel, or by trust spent. You end the year smaller than you began it.
**Prompt (outcome `broken`) (RU):** 

**Prompt (outcome `vassal`) (EN):** Your Majesty, I heard the final demand on day one-twenty-two and your signature after. The pass is theirs. The regent's name travels south in ledgers. You keep a chair with a northern leash. Call it peace. Call it what you will.
**Prompt (outcome `vassal`) (RU):** 

**Prompt (итог `ally`) (EN):** 
**Prompt (итог `ally`) (RU):** Ваше Величество, триста пятьдесят дней с тех пор, как клинок дал вам корону, которую север не даровал. Я слышал — дань отвергнута, хартия подписана, беженцы укрыты, карты охранены. Князья завершают год, называя вас союзником — не другом, не вассалом, но тем, кто взял трон, достойным связи. Ваши наследники и наши будут спорить вместе. Лучше, чем в одиночку.

**Prompt (итог `cold_peace`) (EN):** 
**Prompt (итог `cold_peace`) (RU):** Ваше Величество, я слышал каждый выбор — торговля, где клятвы не сработали, учтивость, где война соблазняла. Князья не предлагают союза и не предлагают войны. Эстедор завершает год независимым и под наблюдением. Партнёры, не доверяющие партнёрам. Обычно на тронах.

**Prompt (итог `tributary`) (EN):** 
**Prompt (итог `tributary`) (RU):** Ваше Величество, я слышал — монета пересекала перевал чаще стали. Дань покупала сезоны. Князья зовут вас платёжеспособным, не суверенным. Вы держите трон как арендованный стул. Унизительно. Иногда — долговечно.

**Prompt (итог `victor`) (EN):** 
**Prompt (итог `victor`) (RU):** Ваше Величество, я слышал мобилизацию, набеги и расчёт времени вместо чести. Вы выбрали сталь, когда зима сомкнулась. Перевал ваш — пока. Рудольф одобряет. Я скорблю. Война возвращается привычкой, если вы заснёте.

**Prompt (итог `broken`) (EN):** 
**Prompt (итог `broken`) (RU):** Ваше Величество, я слышал ложь, виселицы, банкротные карты и весну, избегнутую раз слишком. Князья не предлагают дружбы. Держава треснута — войной, отказом от спора или потраченным доверием. Вы завершаете год меньше, чем начали.

**Prompt (итог `vassal`) (EN):** 
**Prompt (итог `vassal`) (RU):** Ваше Величество, я слышал последнее требование на сто двадцать второй день и вашу подпись после. Перевал их. Имя регента путешествует на юг в книги счётах. Вы держите стул с северным поводком. Назовите миром. Назовите как хотите.

**Choice 1**
- **Choice (EN):** I have heard the princes — dismiss the envoy
- **Choice (RU):** Я услышал князей — отпустить посланника
- **Response (EN):** Then may your heirs argue with mine in ledgers, not pass graves.
- **Response (RU):** Тогда пусть ваши наследники спорят с моими в книгах, не на могилах перевала.
- **Effects:** Succession +15, Army +8, Treasury -10

---

## The Great Houses (persistent story)
## Великие дома (длящаяся история)

### Beat 1 — Day 158

**Title (EN):** Eastern Watchers
**Title (RU):** Восточные наблюдатели
**Character (EN):** Lord Kaspar Vayne
**Character (RU):** Лорд Каспар Вейн
**Note (EN):** Opens arc. Pre-Nobility unlock. Kaspar positions against Ashford before she arrives. Callback [Northern](#beat-12--day-172--houses-measure-your-wars) foreign policy if `northernAshfordLinked`.
**Note (RU):** Открывает арку. До разблокировки Nobility. Каспар позиционируется против Эшфорд до её прибытия. Обратная отсылка [Северу](#beat-12--day-172--houses-measure-your-wars) при `northernAshfordLinked`.

#### Node 0

**Prompt (EN):** Your Majesty, Lady Ashford rides from the eastern marches in seventeen days. I ride from the east beside her — not beneath. I heard you bled for this throne without our swords. Fair. Neither did we kneel. Will you seat one eastern house and call it peace, or seat two and call it balance?
**Prompt (RU):** Ваше Величество, леди Эшфорд едет с восточных марок через семнадцать дней. Я еду с востока рядом с ней — не под ней. Я слышал — вы истекали кровью за этот трон без наших мечей. Справедливо. Мы тоже не преклонялись. Посадите один восточный дом и назовёте миром — или двух и назовёте балансом?

**Prompt variant (`northernAllianceSigned`) (EN):** Your Majesty, I heard you allied with northern princes before you seated a single great house. Ashford will call that foreign policy. I call it leverage — if you seat me before she arrives.
**Prompt variant (`northernAllianceSigned`) (RU):** Ваше Величество, я слышал — вы союзники с северными князьями, прежде чем посадили хоть один великий дом. Эшфорд назовет это внешней политикой. Я — рычагом — если посадите меня прежде её прибытия.

**Choice 3**
- **Choice (EN):** Play them against each other — no promises
- **Choice (RU):** Играть их друг против друга — без обещаний
- **Response (EN):** Honest cynicism. I respect it. They will not. Expect poison in the hospitality.
- **Response (RU):** Честный цинизм. Уважаю. Они — нет. Ждите яда в гостеприимстве.
- **Effects:** Loyalty +4, Succession +6

---

### Beat 2 — Day 161

**Title (EN):** The Dowry Ledger
**Title (RU):** Книга приданого
**Character (EN):** Countess Marianna Dell
**Character (RU):** Графиня Марианна Делл
**Note (EN):** Marriage alliance offer rivals Ashford. Crow beat 3 will outbid.
**Note (RU):** Предложение брачного союза соперничает с Эшфорд. Эпизод 3 Кроу перебьёт ставку.

#### Node 0

**Prompt (EN):** Your Majesty, Ashford offers condescension and a nephew's noose. I offer coin, cousins, and a marriage bed that could make the realm forget a blade put you here. My dowry is real — unlike certain eastern ledgers I could name. Do you open treasury doors to Dell, or wait for Ashford's permission?
**Prompt (RU):** Ваше Величество, Эшфорд предлагает снисходительность и петлю для племянника. Я предлагаю монету, кузенов и брачное ложе, от которого держава может забыть клинок, поставивший вас сюда. Моё приданое настоящее — в отличие от некоторых восточных книг, что я могла бы назвать. Откроете казну Делл — или будете ждать разрешения Эшфорд?

---

### Beat 3 — Day 164

**Title (EN):** The Higher Bid
**Title (RU):** Более высокая ставка
**Character (EN):** Baroness Yvette Crow
**Character (RU):** Баронесса Иветта Кроу
**Note (EN):** Direct rival to Dell. Establishes Dell-Crow compact path.
**Note (RU):** Прямой соперник Делл. Закладывает путь компакта Делл-Кроу.

#### Node 0

**Prompt (EN):** Your Majesty, I heard Dell offered you marriage and arithmetic. I offer more arithmetic. Double the dowry, half the sermons, and no Ashford on the king's close advisors. Marry Crow, and the southern roads fund your throne. Marry Dell, and you marry her debt.
**Prompt (RU):** Ваше Величество, я слышал — Делл предложила брак и арифметику. Я предлагаю больше арифметики. Удвоенное приданое, вдвое меньше проповедей и никакой Эшфорд в тайном совете. Женитесь на Кроу — и южные дороги финансируют ваш трон. Женитесь на Делл — и женитесь на её долге.

**Prompt variant (`housesDellOffer`) (EN):** Your Majesty, I heard you entertained Dell's bed. I am here to entertain your ambition. She counts sheep. I count regiments.
**Prompt variant (`housesDellOffer`) (RU):** Ваше Величество, я слышал — вы принимали ложе Делл. Я здесь, чтобы принять вашу амбицию. Она считает овец. Я — полки.

---

### Beat 4 — Day 168

**Title (EN):** No Land, Much Anger
**Title (RU):** Нет земли, много гнева
**Character (EN):** Lord Raymond the Landless
**Character (RU):** Лорд Реймонд Безземельный
**Note (EN):** Landless faction threatens all houses. Sets march flag path.
**Note (RU):** Фракция безземельных угрожает всем домам. Закладывает путь похода.

#### Node 0

**Prompt (EN):** Your Majesty, Ashford, Kaspar, Dell, and Crow measure your throat in velvet. I measure it in men who own nothing but hunger. I heard you paid soldiers before you paid truth. Give the landless titles from seized estates, or we take fields while lords debate dowries.
**Prompt (RU):** Ваше Величество, Эшфорд, Каспар, Делл и Кроу меряют ваше горло бархатом. Я меряю людьми, у которых нет ничего, кроме голода. Я слышал — вы платили солдатам, прежде чем платили правде. Дайте безземельным титулы с конфискованных поместий — или мы возьмём поля, пока лорды спорят о приданом.

---

### Beat 5 — Day 174

**Title (EN):** Before the March
**Title (RU):** Прежде похода
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Three days before Nobility unlock. Distinct from [Northern day 172](#beat-12--day-172--houses-measure-your-wars) — domestic houses, not foreign war.
**Note (RU):** За три дня до разблокировки Nobility. Отличается от [Северного дня 172](#beat-12--day-172--houses-measure-your-wars) — домашние дома, не внешняя война.

#### Node 0

**Prompt (EN):** Your Majesty, in three days Lady Ashford enters your hall and nobility becomes a meter the realm can read. I heard Kaspar watch the east, Dell and Crow bid for your bed, and Raymond gather men with nothing to lose. You can arrive divided, married, or armed. You cannot arrive surprised.
**Prompt (RU):** Ваше Величество, через три дня леди Эшфорд войдёт в ваш зал — и дворянство станет метром, который держава может читать. Я слышал — Каспар смотрит на восток, Делл и Кроу торгуются за ваше ложе, Реймонд собирает людей, которым нечего терять. Можете прибыть разделёнными, женатыми или вооружёнными. Удивлёнными — нет.

**Prompt variant (`housesDellCrowCompact`) (EN):** Your Majesty, I heard you let Dell and Crow share a compact. Ashford will call that encirclement. She is not wrong.
**Prompt variant (`housesDellCrowCompact`) (RU):** Ваше Величество, я слышал — вы позволили Делл и Кроу делить компакт. Эшфорд назовет это окружением. Она не ошибается.

**Choice 1**
- **Choice (EN):** Prepare conciliation — feast all houses before Ashford speaks
- **Choice (RU):** Готовить примирение — пир для всех домов, прежде чем заговорит Эшфорд
- **Response (EN):** Feasts buy time. Time buys options. Do not confuse either with safety.
- **Response (RU):** Пиры покупают время. Время — варианты. Не путайте ни то, ни другое с безопасностью.
- **Effects:** Treasury -10, Nobility +5, Loyalty +4

**Choice 2**
- **Choice (EN):** Prepare division — seat Kaspar opposite Ashford at the table
- **Choice (RU):** Готовить разделение — посадить Каспара напротив Эшфорд за столом
- **Response (EN):** Then steel hides behind napkins. Efficient — if you control the cutlery.
- **Response (RU):** Тогда сталь прячется за салфетками. Эффективно — если контролируете столовые приборы.
- **Effects:** Army +4, Nobility -3, Succession +5

**Choice 3**
- **Choice (EN):** Prepare terror — Morwen visible, guards doubled
- **Choice (RU):** Готовить террор — Морвен на виду, стража удвоена
- **Response (EN):** Fear opens councils and closes throats. Ashford will notice. So will history.
- **Response (RU):** Страх открывает советы и закрывает горла. Эшфорд заметит. История — тоже.
- **Effects:** Army +6, Nobility -8, Loyalty -5

---

### Beat 6 — Day 175

**Title (EN):** Nobility Unlock (Ashford Debut)
**Title (RU):** Разблокировка Nobility (дебют Эшфорд)
**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд
**Note (EN):** **Does not replace** [Lady Ashford Debut](#lady-ashford-debut-nobility-unlock) — same four-node encounter fires on Nobility unlock. Arc layer: each choice also adjusts `housesFavor*` and sets `housesAshfordCouncil`, `housesAshfordMarriage`, or `housesAshfordHostile` per table below. If `housesAliveAshford = false` later, this beat is skipped (edge case: only if death rules bug; Ashford cannot die before day 175).
**Note (RU):** **Не заменяет** [дебют леди Эшфорд](#lady-ashford-debut-nobility-unlock) — та же встреча из четырёх узлов срабатывает при разблокировке Nobility. Слой арки: каждый выбор также корректирует `housesFavor*` и устанавливает `housesAshfordCouncil`, `housesAshfordMarriage` или `housesAshfordHostile` по таблице ниже. Если позже `housesAliveAshford = false`, эпизод пропускается (крайний случай: только при баге правил смерти; Эшфорд не может умереть до дня 175).

---

### Beat 7 — Day 178

**Title (EN):** fake seal Accusation
**Title (RU):** Обвинение в подделке
**Character (EN):** Lord Kaspar Vayne
**Character (RU):** Лорд Каспар Вейн
**Note (EN):** Kaspar accuses Dell; internal east/south feud. Skip if `housesAliveKaspar = false`.
**Note (RU):** Каспар обвиняет Делл; внутренняя восточно-южная вражда. Пропуск, если `housesAliveKaspar = false`.

#### Node 0

**Prompt (EN):** Your Majesty, Countess Dell's dowry receipts are eastern fake seals — or Ashford fake seals meant to look like mine. I heard you promised someone marriage, someone balance, someone terror. I accuse Dell before she accuses me. Do you judge, defer, or let us duel without you?
**Prompt (RU):** Ваше Величество, квитанции приданого графини Делл — восточные фальшивые монеты, или фальшивые монеты Эшфорд, сделанные похожими на мои. Я слышал — вы обещали кому-то брак, кому-то баланс, кому-то террор. Обвиняю Делл, прежде чем она обвинит меня. Судите, отложите или позвольте нам дуэлиться без вас?

**Prompt variant (`housesAshfordCouncil`) (EN):** Your Majesty, I heard you seated Ashford. She smiles while Dell forges eastern seals. Seat me on the council you promised, or watch fake seal become policy.
**Prompt variant (`housesAshfordCouncil`) (RU):** Ваше Величество, я слышал — вы посадили Эшфорд. Она улыбается, пока Делл подделывает восточные печати. Посадите меня в обещанный совет — или смотрите, как фальшивая монета становится политикой.

**Choice 3**
- **Choice (EN):** Defer judgment — let houses fight in your hall tonight
- **Choice (RU):** Отложить суд — пусть дома сражаются в вашем зале сегодня вечером
- **Response (EN):** Then blood on marble before supper ends. At least you will learn who wants you alive.
- **Response (RU):** Тогда кровь на мраморе до конца ужина. По крайней мере узнаете, кто хочет вас живым.
- **Effects:** Loyalty -5, Succession +6
- **Sets flag: `housesFeudEscalated`**
- **Устанавливает флаг: `housesFeudEscalated`**

---

### Beat 8 — Day 181

**Title (EN):** The Absurd Claimant
**Title (RU):** Абсурдный претендент
**Character (EN):** Duke the Goose
**Character (RU):** Герцог Гусь
**Note (EN):** Comic beat; genealogy threat is real. Goose can die later at trial.
**Note (RU):** Комический эпизод; угроза генеалогии реальна. Гусь может умереть позже на суде.

#### Node 0

**Prompt (EN):** Your Majesty, I am Duke the Goose — by baptism, by theatre, and by a genealogy my fool swears is truer than yours. I heard great houses measure your throat. I measure your funny bone. Support my claim and the commons love you. Hang me and the commons still love me — from a distance.
**Prompt (RU):** Ваше Величество, я — герцог Гусь: крещением, театром и генеалогией, которую мой шут клянётся правдивее вашей. Я слышал — великие дома меряют ваше горло. Я меряю ваше чувство юмора. Поддержите мою претензию — и простолюдины полюбят вас. Повесьте меня — и простолюдины всё равно полюбят меня. Издалека.

**Prompt variant (`housesRaymondMarch`) (EN):** Your Majesty, I heard landless men march. I march differently — waddling, but with purpose. Crown the goose and Raymond looks less ridiculous. Useful.
**Prompt variant (`housesRaymondMarch`) (RU):** Ваше Величество, я слышал — безземельные идут походом. Я иду иначе — переваливаясь, но с целью. Коронуйте гуся — и Реймонд выглядит менее смешным. Полезно.

**Choice 3**
- **Choice (EN):** Tournament proof — beat Goose publicly, end the claim
- **Choice (RU):** Турнирное доказательство — победить Гуся публично, положить конец претензии
- **Response (EN):** Steel versus poultry. I accept. Bring your best knight — or your worst, for the story.
- **Response (RU):** Сталь против птицы. Принимаю. Приведите лучшего рыцаря — или худшего, для истории.
- **Effects:** Army +4, Loyalty +6
- **Sets flag: `housesGooseTournament`**
- **Устанавливает флаг: `housesGooseTournament`**

---

### Beat 9 — Day 185

**Title (EN):** Council Fracture
**Title (RU):** Раскол совета
**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд
**Note (EN):** Skip if `housesAliveAshford = false`. Internal Ashford vs Kaspar vs Dell-Crow. **Day 185:** Prophet's Winter beat 4 defers to day 187.
**Note (RU):** Пропуск, если `housesAliveAshford = false`. Внутренний конфликт Эшфорд против Каспара против Делл-Кроу. **День 185:** эпизод 4 Зимы Пророка откладывается на день 187.

#### Node 0

**Prompt (EN):** Your Majesty, your king's close advisors is a cage of eastern tigers — and one goose outside the bars. I heard Kaspar accuse Dell, Crow outbid Dell, and Raymond gather landless steel. I will not share a council with Kaspar unless you mean to split the east. Choose who sits, who stands, who leaves in chains.
**Prompt (RU):** Ваше Величество, ваш тайный совет — клетка восточных тигров — и один гусь за решёткой. Я слышал — Каспар обвинил Делл, Кроу перебила Делл, Реймонд собрал безземельную сталь. Не разделю совет с Каспаром, если вы не хотите расколоть восток. Выберите, кто сидит, кто стоит, кто уходит в кандалах.

**Prompt variant (`housesDellCrowCompact`) (EN):** Your Majesty, I heard Dell and Crow share terms. I call that a southern noose around my house. Cut it, or wear it.
**Prompt variant (`housesDellCrowCompact`) (RU):** Ваше Величество, я слышал — Делл и Кроу делят условия. Называю это южной петлёй вокруг моего дома. Режьте её — или носите.

**Prompt variant (`housesAshfordHostile`) (EN):** Your Majesty, you threatened to break nobility on day one-seventy-five. I am still here. Are you still brave?
**Prompt variant (`housesAshfordHostile`) (RU):** Ваше Величество, вы угрожали сломать дворянство на сто семьдесят пятый день. Я всё ещё здесь. Вы всё ещё смелы?

---

### Beat 10 — Day 188

**Title (EN):** Feast of Insults
**Title (RU):** Пир оскорблений
**Character (EN):** Countess Marianna Dell
**Character (RU):** Графиня Марианна Делл
**Note (EN):** Dell speaks; Crow interjects in variants. Mutual destruction path. Skip if both dead — if only one alive, variant solo speaker.
**Note (RU):** Говорит Делл; Кроу вмешивается в вариантах. Путь взаимного уничтожения. Пропуск, если обе мертвы — если жива одна, вариант с одним оратором.

#### Node 0

**Prompt (EN):** Your Majesty, Baroness Crow told the hall my dowry was pig iron and my cousins were pig farmers. I heard you laughed — or did not stop her. I demand satisfaction: public apology, private divorce from this politics, or a duel by proxy before the realm chooses a side.
**Prompt (RU):** Ваше Величество, баронесса Кроу сказала залу, что моё приданое — чугун, а кузены — свинопасы. Я слышал — вы смеялись — или не остановили её. Требую удовлетворения: публичное извинение, частый развод от этой политики или дуэль через посредников, прежде чем держава выберет сторону.

**Prompt variant (`housesAliveCrow` + compact) (EN):** Your Majesty, Crow sits beside me smiling and poisons my cup in whispers. I heard you needed a compact. I need a crown that enforces peace — or admits war.
**Prompt variant (`housesAliveCrow` + compact) (RU):** Ваше Величество, Кроу сидит рядом, улыбаясь, и отравляет мой кубок шёпотом. Я слышал — вам нужен был компакт. Мне нужна корона, которая навязывает мир — или признаёт войну.

**Choice 3**
- **Choice (EN):** Let them duel by proxy — knights at dawn
- **Choice (RU):** Пусть сразятся через посредников — рыцари на рассвете
- **Response (EN):** Then blood before breakfast. The victor claims your favor. The loser claims a grudge.
- **Response (RU):** Тогда кровь до завтрака. Победитель заберёт вашу благосклонность. Проигравший — обиду.
- **Effects:** Army -4, Loyalty +6, Succession +4
- **Sets flag: `housesProxyDuel` (random knight death — implementation: favor shift only)**
- **Устанавливает флаг: `housesProxyDuel` (случайная смерть рыцаря — реализация: только сдвиг благосклонности)**

---

### Beat 11 — Day 191

**Title (EN):** The March
**Title (RU):** Поход
**Character (EN):** Lord Raymond the Landless
**Character (RU):** Лорд Реймонд Безземельный
**Note (EN):** Skip if `housesAliveRaymond = false`. Landless vs landed climax before trial.
**Note (RU):** Пропуск, если `housesAliveRaymond = false`. Кульминация безземельных против землевладельцев перед судом.

#### Node 0

**Prompt (EN):** Your Majesty, three hundred men without fields camp on Ashford's border — or Dell's — or yours, depending who you angered least. I heard great houses feud while commons starve. I march tomorrow unless you grant titles now, hang a lord for sport, or send Ashford's knights to stop me.
**Prompt (RU):** Ваше Величество, триста людей без полей разбили лагерь на границе Эшфорд — или Делл — или вашей, смотря, кого вы разозлили меньше. Я слышал — великие дома враждуют, пока простолюдины голодают. Завтра иду походом, если не дарите титулы сейчас, не повесите лорда для забавы или не пошлёте рыцарей Эшфорд остановить меня.

**Prompt variant (`housesRaymondPromised`) (EN):** Your Majesty, I heard you promised crown lands. Promises without deeds are how kings who took the throne end. March with me or against me.
**Prompt variant (`housesRaymondPromised`) (RU):** Ваше Величество, я слышал — вы обещали королевские земли. Обещания без дел — как тот, кто взял троны кончают. Идите со мной или против меня.

---

### Beat 12 — Day 199

**Title (EN):** Levies Refused
**Title (RU):** Отказ от поборов
**Character (EN):** Lord Kaspar Vayne
**Character (RU):** Лорд Каспар Вейн
**Note (EN):** Skip if dead. Kaspar vs Ashford on war tax; northern war context from day 196 beat (three days prior).
**Note (RU):** Пропуск, если мёртв. Каспар против Эшфорд по военному налогу; контекст северной войны с эпизода 196 (за три дня).

#### Node 0

**Prompt (EN):** Your Majesty, northern smoke still rises — I heard Rudolf mobilize while you host feuds. Ashford refuses eastern levies unless she leads them. I refuse levies unless I am not her subordinate. Dell and Crow refuse unless marriage is signed. Raymond refuses unless land is deeded. Goose refuses unless bread is thrown. Levy the houses, or levy the scaffold.
**Prompt (RU):** Ваше Величество, северный дым всё ещё поднимается — я слышал, Рудольф мобилизовал, пока вы устраиваете вражду. Эшфорд отказывает восточные поборы, если не ведёт их сама. Я отказываю, если не её подчинённый. Делл и Кроу отказывают, пока брак не подписан. Реймонд отказывает, пока земля не дарована. Гусь отказывает, пока не бросят хлеб. Соберите поборы с домов — или соберите эшафот.

---

### Beat 13 — Day 201

**Title (EN):** The Sentence
**Title (RU):** Приговор
**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен
**Note (EN):** Player **must** choose exactly **one** execution or formal acquittal of all (`housesTrialHeld`). Callback [Scaffold's Ledger](#the-scaffolds-ledger-persistent-story) — if `scaffoldOutcome = bloody_peace` or `scaffoldMercy` ≤ −20`, Morwen's tone is harsher; if `mercy_crown`, she notes empty yard habit.
**Note (RU):** Игрок **обязан** выбрать ровно **одну** казнь или формальное оправдание всех (`housesTrialHeld`). Обратная отсылка [Книге эшафота](#the-scaffolds-ledger-persistent-story) — если `scaffoldOutcome = bloody_peace` или `scaffoldMercy` ≤ −20, тон Морвен жёстче; если `mercy_crown`, он отмечает привычку пустого двора.

---

### Beat 14 — Day 205

**Title (EN):** Night of Knives
**Title (RU):** Ночь ножей
**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс
**Note (EN):** **Zero to two additional deaths** based on choices. Assassination attempts among houses. Player can allow, prevent, or redirect. Skip targets already dead.
**Note (RU):** **От нуля до двух дополнительных смертей** в зависимости от выборов. Покушения среди домов. Игрок может допустить, предотвратить или перенаправить. Пропускать уже мёртвые цели.

#### Node 0

**Prompt (EN):** Your Majesty, knives move tonight — Kaspar's on Dell, Crow's on Ashford, Ashford's on Raymond, Raymond's on everyone with a field. I heard who you hanged and who you spared. I can sell you the map, stop one blade, or let winter sort the peerage. Who dies in the dark is yours if you act — or theirs if you sleep.
**Prompt (RU):** Ваше Величество, сегодня ночью движутся ножи — Каспара на Делл, Кроу на Эшфорд, Эшфорд на Реймонда, Реймонда на всех с полем. Я слышал, кого вы повесили и кого пощадили. Могу продать карту, остановить одно лезвие или пустить зиму рассортировать сословие. Кто умрёт в темноте — ваш, если действуете, — их, если заснёте.

**Prompt variant (`housesAshfordHostile`) (EN):** Your Majesty, Ashford's knife points at you unless you point first. Rare honesty.
**Prompt variant (`housesAshfordHostile`) (RU):** Ваше Величество, нож Эшфорд указывает на вас, если не укажете первым. Редкая честность.

**Choice 2**
- **Choice (EN):** Allow Ashford's death — eastern throne empties
- **Choice (RU):** Допустить смерть Эшфорд — восточный трон опустеет
- **Response (EN):** Then the east belongs to whoever survives dawn. You chose speed over mercy.
- **Response (RU):** Тогда восток принадлежит тому, кто переживёт рассвет. Вы выбрали скорость вместо милосердия.
- **Effects:** Nobility -15, Succession +12, Army -8

**Choice 3**
- **Choice (EN):** Stop Dell-Crow blood — save compact
- **Choice (RU):** Остановить кровь Делл-Кроу — сохранить компакт
- **Response (EN):** Peace in the south for a price. Kaspar or Raymond pays it in the dark.
- **Response (RU):** Мир на юге за цену. Каспар или Реймонд заплатят в темноте.
- **Effects:** Treasury +5, Nobility +4

**Choice 4**
- **Choice (EN):** Let the knives fall — whoever dies, dies
- **Choice (RU):** Пусть ножи падают — кто умрёт, тот умрёт
- **Response (EN):** Then I sell memoirs. You inherit a shorter council and longer nightmares.
- **Response (RU):** Тогда продам мемуары. Вы унаследуете короче совет и длиннее кошмары.
- **Effects:** Loyalty -12, Succession +10

---

### Beat 15 — Day 210

**Title (EN):** Who Bowed, Who Bled
**Title (RU):** Кто преклонился, кто истёк кровью
**Character (EN):** Chronicler Ilana
**Character (RU):** Летописец Илана
**Note (EN):** Reads survivor list aloud. Callback all deaths and favors. Sets tone before finale.
**Note (RU):** Вслух зачитывает список выживших. Обратные отсылки на все смерти и благосклонности. Задаёт тон перед финалом.

#### Node 0

**Prompt (EN):** Your Majesty, I write the first draft of your reign while blood dries. I heard Ashford {alive/dead}, Kaspar {alive/dead}, Dell {alive/dead}, Crow {alive/dead}, Raymond {alive/dead}, Goose {alive/dead}. The realm will copy my verbs into law. Do you want the chapter titled *Conciliation*, *Terror*, or *The Year Great Houses Learned Fear*?  *(Implementation: substitute alive/dead per flags.)*
**Prompt (RU):** Ваше Величество, я пишу первый черновик вашего правления, пока кровь сохнет. Я слышал — Эшфорд {жива/мертва}, Каспар {жив/мёртв}, Делл {жива/мертва}, Кроу {жива/мертва}, Реймонд {жив/мёртв}, Гусь {жив/мёртв}. Держава скопирует мои глаголы в закон. Хотите главу *Примирение*, *Террор* или *Год, когда великие дома узнали страх*?  *(Реализация: подставить жив/мёртв по флагам.)*

**Choice 1**
- **Choice (EN):** Title it Conciliation — emphasize peace
- **Choice (RU):** Назвать Примирением — подчеркнуть мир
- **Response (EN):** Flattering. Fragile. I will write what you need — not what you earned.
- **Response (RU):** Льстиво. Хрупко. Напишу, что нужно — не то, что заслужено.
- **Effects:** Nobility +6, Loyalty +5

**Choice 2**
- **Choice (EN):** Title it Terror — emphasize scaffold
- **Choice (RU):** Назвать Террором — подчеркнуть эшафот
- **Response (EN):** Honest. Cruel. Future lords will read it before they plot.
- **Response (RU):** Честно. Жестоко. Будущие лорды прочтут, прежде чем строить заговоры.
- **Effects:** Army +4, Nobility -6, Succession +6

---

### Beat 16 — Day 218

**Title (EN):** Verdict on the Houses
**Title (RU):** Вердикт о домах
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Arc finale. **On load:** run [day 218 outcome priority](#great-houses--beat-resolution-rules) → `housesOutcome`, `housesArcPhase = resolved`. Edric **reports** who survived and what the peerage believes — player does not pick the ending. Summarizes `housesDeadCount` and survivor list in prompt.
**Note (RU):** Финал арки. **При загрузке:** применить [приоритет итога дня 218](#великие-дома--правила-разрешения-эпизодов) → `housesOutcome`, `housesArcPhase = resolved`. Эдрик **докладывает**, кто выжил и во что верит сословие — игрок не выбирает концовку. Суммирует `housesDeadCount` и список выживших в вопросе.

#### Node 0

**Prompt (outcome `ashford_ascendant`) (EN):** Your Majesty, sixty days since the great houses stopped watching and started cutting — and Lady Ashford stands above the rest. I heard {housesDeadCount} names ended. Ashford lives. Rivals do not. The king's close advisors will be eastern, narrow, and grateful to steel. You built government by whichever hawk remained.
**Prompt (outcome `ashford_ascendant`) (RU):** 

**Prompt (outcome `crow_dell_compact`) (EN):** Your Majesty, Ashford fell — or sleeps — and Dell and Crow share a compact the court calls indecent and efficient. I heard {housesDeadCount} graves. Marriage ledgers outlived blood feuds. You rule a shortened parliament bound by dowry and spite.
**Prompt (outcome `crow_dell_compact`) (RU):** 

**Prompt (outcome `landless_fury`) (EN):** Your Majesty, Raymond still breathes and landed peers do not — or kneel. I heard {housesDeadCount} ended. The landless have a voice now, whether you granted it or they took it. Revolution in velvet. Survivors hate you. Commons may not.
**Prompt (outcome `landless_fury`) (RU):** 

**Prompt (outcome `comic_horror`) (EN):** Your Majesty, the Goose lives — absurd claimant, accidental victor — and the peerage is poultry and pulp. I heard {housesDeadCount} names ended. History will record tragedy wearing feathers. I will burn the draft and write *farce* instead.
**Prompt (outcome `comic_horror`) (RU):** 

**Prompt (outcome `shattered_peerage`) (EN):** Your Majesty, {housesDeadCount} lords ended. The peerage is a wound. You are either surgeon or infection. The throne stands alone above corpses. Lone wolf theology. Ashford warned you.
**Prompt (outcome `shattered_peerage`) (RU):** 

**Prompt (outcome `bloodless_ledger`) (EN):** Your Majesty, no scaffold claimed a lord — miraculous or temporary. I heard insults, levies, trials, and knives in alleys that missed throats. All six still bow in daylight. You ruled ledger and patience. Knives wait for year two.
**Prompt (outcome `bloodless_ledger`) (RU):** 

**Prompt (итог `ashford_ascendant`) (EN):** 
**Prompt (итог `ashford_ascendant`) (RU):** Ваше Величество, шестьдесят дней с тех пор, как великие дома перестали смотреть и начали резать — и леди Эшфорд стоит над остальными. Я слышал — {housesDeadCount} имён закончились. Эшфорд жива. Соперники — нет. Тайный совет будет восточным, узким и благодарным стали. Вы построили правление тем ястребом, что остался.

**Prompt (итог `crow_dell_compact`) (EN):** 
**Prompt (итог `crow_dell_compact`) (RU):** Ваше Величество, Эшфорд пала — или спит — а Делл и Кроу делят компакт, который двор называет неприличным и эффективным. Я слышал — {housesDeadCount} могил. Брачные книги пережили кровные вражды. Вы правите укороченным парламентом, связанным приданым и злобой.

**Prompt (итог `landless_fury`) (EN):** 
**Prompt (итог `landless_fury`) (RU):** Ваше Величество, Реймонд ещё дышит, а землевладельцы — нет, или преклоняются. Я слышал — {housesDeadCount} закончились. У безземельных теперь голос — даровали вы его или они взяли. Революция в бархате. Выжившие ненавидят вас. Простолюдины — возможно, нет.

**Prompt (итог `comic_horror`) (EN):** 
**Prompt (итог `comic_horror`) (RU):** Ваше Величество, Гусь жив — абсурдный претендент, случайный победитель — а сословие стало птицей и мякотью. Я слышал — {housesDeadCount} имён закончились. История запишет трагедию в перьях. Сожгу черновик и напишу *фарс*.

**Prompt (итог `shattered_peerage`) (EN):** 
**Prompt (итог `shattered_peerage`) (RU):** Ваше Величество, {housesDeadCount} лордов закончились. Сословие — рана. Вы либо хирург, либо инфекция. Трон стоит один над трупами. Теология одинокого волка. Эшфорд предупреждала.

**Prompt (итог `bloodless_ledger`) (EN):** 
**Prompt (итог `bloodless_ledger`) (RU):** Ваше Величество, эшафот не взял лорда — чудо или отсрочка. Я слышал оскорбления, поборы, суды и ножи в переулках, промахнувшиеся по горлам. Все шестеро всё ещё кланяются при свете дня. Вы правили книгой счёта и терпением. Ножи ждут второго года.

**Choice 1**
- **Choice (EN):** I have heard the peerage — dismiss the houses
- **Choice (RU):** Я услышал сословие — распустить дома
- **Response (EN):** Then rule with Ashford's shadow on your shoulder. Efficient — if you like knives at your back.
- **Response (RU):** Тогда правите с тенью Эшфорд на плече. Эффективно — если любите ножи в спину.
- **Effects:** Nobility +12, Succession +10, Loyalty +4

---

## The Scaffold's Ledger (persistent story)
## Книга плахи (длящаяся история)

### Beat 1 — Day 92

**Title (EN):** Cells After the Household
**Title (RU):** Камеры после двора
**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен
**Note (EN):** Opens arc one day before [Northern day 91](#beat-9--day-91--refugees-at-the-ford). Post–[Household day 86](#beat-10--day-86--verdict-on-the-household). Sets `scaffoldArcPhase = active`.
**Note (RU):** Открывает арку за день до [Северного дня 91](#beat-9--day-91--refugees-at-the-ford). После [Двора дня 86](#beat-10--day-86--verdict-on-the-household). Устанавливает `scaffoldArcPhase = active`.

#### Node 0

**Prompt (EN):** Your Majesty, I am Morwen — the woman who turns policy into rope. Edwin's cells still hold men who swore to his ghost. I heard you cleansed the court, turned the household, or let whispers walk the halls. The lower dungeon breathes overcrowded. Hang the loyalists, sell forgiveness for coin, or empty the cells and dare the realm to test you.
**Prompt (RU):** Ваше Величество, я — Морвен, палач, который превращает политику в петлю. В камерах Эдвина до сих пор сидят люди, клявшиеся его призраку. Я слышал, вы очистили двор, обратили домашних или позволили шёпоту ходить по залам. Нижний подземелье задыхается от тесноты. Повесьте лоялистов, продайте прощение за монету или опустошите камеры и бросьте вызов королевству.

**Prompt variant (`householdOutcome = clean_court`) (EN):** Your Majesty, I heard you purged Edwin's people. My queue is long and your mercy short. Good — rope appreciates clarity.
**Prompt variant (`householdOutcome = clean_court`) (RU):** Ваше Величество, я слышал, вы вычистили людей Эдвина. Моя очередь длинна, а ваше милосердие коротко. Хорошо — петля ценит ясность.

**Prompt variant (`householdOutcome = haunted_palace`) (EN):** Your Majesty, I heard ghosts vote in whispers. Prisoners vote with fists. Both cost you sleep.
**Prompt variant (`householdOutcome = haunted_palace`) (RU):** Ваше Величество, я слышал, призраки голосуют шёпотом. Заключённые голосуют кулаками. И то и другое стоит вам сна.

---

### Beat 2 — Day 104

**Title (EN):** Heaven Wants Heretics
**Title (RU):** Небеса хотят еретиков
**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен
**Note (EN):** Between Hungry Season beats (day 100 Gromm, day 106 Rudolf). [Church](#the-crown-forfeit--church tax-war-persistent-story) active. Cyrus may be referenced.
**Note (RU):** Между эпизодами Голодного сезона (день 100 Громм, день 106 Рудольф). [Церковь](#the-crown-forfeit--church tax-war-persistent-story) активна. Может упоминаться Сайрус.

#### Node 0

**Prompt (EN):** Your Majesty, Malrik sends names — church splitatics, soup-preachers, men who call you forfeit in rhyme. I heard you knelt, defied, or fractured the Church. Heaven wants heretics. The crown wants traitors. My scaffold fits both if you widen it. Burn Church lists, hang crown lists, or hang everyone and let the mob sort scripture.
**Prompt (RU):** Ваше Величество, Малрик присылает имена — раскольников, проповедников супа, людей, называющих вас утратой в рифму. Я слышал, вы преклонились, восстали или раскололи Церковь. Небеса хотят еретиков. Корона хочет предателей. Моя плаха вмещает обоих, если вы её расширите. Сжечь церковные списки, повесить королевские списки или повесить всех и пусть толпа разберётся со священным писанием.

**Prompt variant (`churchArcStance = church split`) (EN):** Your Majesty, I heard Arvel's gate breeds sermons faster than I braid rope. Hang one side and the other calls you partisan. Hang both and the city calls you mad.
**Prompt variant (`churchArcStance = church split`) (RU):** Ваше Величество, я слышал, у ворот Арвела проповеди рождаются быстрее, чем я плету верёвку. Повесьте одну сторону — другая назовёт вас пристрастным. Повесьте обеих — город назовёт вас безумным.

**Prompt variant (`scaffoldCellsFull`) (EN):** Your Majesty, I heard your cells still crowded from day ninety. Add heretics and the stench reaches the cathedral steps.
**Prompt variant (`scaffoldCellsFull`) (RU):** Ваше Величество, я слышал, ваши камеры всё ещё переполнены со дня девяностого. Добавьте еретиков — и вонь дойдёт до ступеней собора.

---

### Beat 3 — Day 117

**Title (EN):** Rioters in the Rope
**Title (RU):** Бунтовщики на петле
**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен
**Note (EN):** Three days before [Hungry Season finale](#beat-12--day-119--verdict-on-hunger). Callback `hungryYarekRiots`, `famineSeverity`.
**Note (RU):** За три дня до [финала Голодного сезона](#beat-12--day-119--verdict-on-hunger). Обратная отсылка `hungryYarekRiots`, `famineSeverity`.

#### Node 0

**Prompt (EN):** Your Majesty, Yarek's miners and Ruta's millers knocked on the granary with tools that were not for milling. I heard requisition, soup lines, or rotting stores. The hungry do not read statutes — they read empty bowls. Hang rioters to teach arithmetic, pardon them to teach mercy, or hang the captain who fired first and pardon the rest.
**Prompt (RU):** Ваше Величество, шахтёры Ярека и мельники Руты постучали в зернохранилище инструментами, не предназначенными для помола. Я слышал реквизицию, очереди за супом или гниющие запасы. Голодные не читают уставы — они читают пустые миски. Повесьте бунтовщиков, чтобы научить арифметике, помилуйте их, чтобы научить милосердию, или повесьте капитана, стрелявшего первым, и помилуйте остальных.

**Prompt variant (`famineSeverity` ≥ 60) (EN):** Your Majesty, severity outran policy. Rope may buy order. It will not buy grain.
**Prompt variant (`famineSeverity` ≥ 60) (RU):** Ваше Величество, тяжесть обогнала политику. Петля может купить порядок. Она не купит зерно.

**Prompt variant (`hungryYarekRiots`) (EN):** Your Majesty, I heard you already faced Yarek once. He returns with friends. My scaffold is a language. Speak it clearly.
**Prompt variant (`hungryYarekRiots`) (RU):** Ваше Величество, я слышал, вы уже встречали Ярека однажды. Он возвращается с друзьями. Моя плаха — это язык. Говорите на нём ясно.

---

### Beat 4 — Day 134

**Title (EN):** Ward Madness
**Title (RU):** Безумие лазаретов
**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен
**Note (EN):** Four days after [Grey Lung day 130](#beat-6--day-130--political-fallout-outcome-cured). Callback `plagueOutcome`, `plagueScandalFlag`.
**Note (RU):** Через четыре дня после [Серого кашля дня 130](#beat-6--day-130--political-fallout-outcome-cured). Обратная отсылка `plagueOutcome`, `plagueScandalFlag`.

#### Node 0

**Prompt (EN):** Your Majesty, the fever wards sent me three men who woke screaming and never stopped. I heard Mira's bottles, Malrik's miracles, or Odo's cheaper brew. Madness is not treason — but treason is easier to explain to mobs. Hang the mad to quiet the square, lock them in Morwen's quiet cells, or fund Mira's care and call it crown mercy.
**Prompt (RU):** Ваше Величество, лихорадочные лазареты прислали мне троих, которые проснулись крича и не замолкли. Я слышал бутыли Миры, чудеса Малрика или более дешёвый отвар Одо. Безумие — не измена, но измена легче объяснить толпе. Повесьте безумных, чтобы успокоить площадь, заприте их в тихих камерах Морвен или финансируйте уход Миры и назовите это королевским милосердием.

**Prompt variant (`plagueOutcome = scandal`) (EN):** Your Majesty, I heard Odo's compound broke minds. Families want necks. I have rope. You have reputation.
**Prompt variant (`plagueOutcome = scandal`) (RU):** Ваше Величество, я слышал, дешёвое лекарство Одо свело с ума. Семьи хотят шей. У меня есть верёвка. У вас — репутация.

**Prompt variant (`plagueOutcome = failed`) (EN):** Your Majesty, pyres taught the city violence. Madness feels like continuation. Do not feed it without purpose.
**Prompt variant (`plagueOutcome = failed`) (RU):** Ваше Величество, костры научили город насилию. Безумие ощущается как продолжение. Не кормите его без цели.

---

### Beat 5 — Day 148

**Title (EN):** Echo Before the Houses
**Title (RU):** Эхо перед домами
**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен
**Note (EN):** Between [Guild day 144](#beat-3--day-144--fake coin-edwin-coin) and day 152. Foreshadows [Great Houses](#the-great-houses-persistent-story). Lords will soon demand rope for rivals.
**Note (RU):** Между [Гильдией дня 144](#beat-3--day-144--fake coin-edwin-coin) и днём 152. Предвосхищает [Великие дома](#the-great-houses-persistent-story). Лорды скоро потребуют петлю для соперников.

#### Node 0

**Prompt (EN):** Your Majesty, great houses send preliminary lists — names they want gone before they bow. I heard Ashford, Kaspar, Dell, and Crow in the same sentence as *treason*. Nobility unlock approaches on day one-seventy-five. Hang commoners now to warn peers, refuse all noble lists until Ashford rides, or sell expedited trials to the highest bidder.
**Prompt (RU):** Ваше Величество, великие дома присылают предварительные списки — имена, которые они хотят убрать, прежде чем склонить колено. Я слышал Эшфорд, Каспара, Делл и Кроу в одном предложении со словом *измена*. Разблокировка Nobility приближается к дню сто семьдесят пятому. Повесьте простолюдинов сейчас, чтобы предупредить знать, откажите всем дворянским спискам, пока не приедет Эшфорд, или продайте ускоренные суды тому, кто больше заплатит.

**Prompt variant (`scaffoldRiotHangings` or `scaffoldChurchHeretic`) (EN):** Your Majesty, I heard your rope already busy. Lords want priority. Peasants want survival. You cannot please both without lying.
**Prompt variant (`scaffoldRiotHangings` or `scaffoldChurchHeretic`) (RU):** 

**Prompt variant (`scaffoldRiotHangings` или `scaffoldChurchHeretic`) (EN):** 
**Prompt variant (`scaffoldRiotHangings` или `scaffoldChurchHeretic`) (RU):** Ваше Величество, я слышал, ваша петля уже занята. Лорды хотят приоритет. Крестьяне хотят выжить. Вы не можете угодить обоим, не лгая.

---

### Beat 6 — Day 154

**Title (EN):** Who Swings Before Ashford
**Title (RU):** Кто виснет до Эшфорда
**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен
**Note (EN):** Four days before [Great Houses day 158](#beat-1--day-158--eastern-watchers). Ashford debut day 175. Callback `scaffoldAshfordBlock`.
**Note (RU):** За четыре дня до [Великих домов дня 158](#beat-1--day-158--eastern-watchers). Дебют Эшфорда день 175. Обратная отсылка `scaffoldAshfordBlock`.

#### Node 0

**Prompt (EN):** Your Majesty, Lady Ashford rides soon and she will measure your scaffold like a tailor measures spine. I heard you blocked noble lists, sold trials, or filled the yard with rioters and heretics. Hang a traitor from Edwin's guard to impress her, empty the yard to disarm her, or let her send the first name and see whether you obey.
**Prompt (RU):** Ваше Величество, леди Эшфорд скоро приедет и измерит вашу плаху, как портной измеряет позвоночник. Я слышал, вы заблокировали дворянские списки, продали суды или заполнили двор бунтовщиками и еретиками. Повесьте предателя из стражи Эдвина, чтобы произвести впечатление, опустошите двор, чтобы лишить её рычага, или позвольте ей прислать первое имя и посмотрите, подчинитесь ли вы.

**Prompt variant (`scaffoldAshfordBlock`) (EN):** Your Majesty, I heard you refused peer lists. Ashford will call it weakness until you prove otherwise.
**Prompt variant (`scaffoldAshfordBlock`) (RU):** Ваше Величество, я слышал, вы отказали в списках сверстников. Эшфорд назовёт это слабостью, пока вы не докажете обратное.

**Prompt variant (`scaffoldMercy` ≥ 20) (EN):** Your Majesty, I heard mercy became habit. Ashford will test whether habit or fear owns you.
**Prompt variant (`scaffoldMercy` ≥ 20) (RU):** Ваше Величество, я слышал, милосердие стало привычкой. Эшфорд проверит, кому вы принадлежите — привычке или страху.

---

### Beat 7 — Day 165

**Title (EN):** Bribe the Executioner
**Title (RU):** Подкуп палача
**Character (EN):** Talen
**Character (RU):** Тален
**Note (EN):** Between Great Houses beats (day 164 Crow, day 168 Raymond). First **Talen** beat. Tests `scaffoldCrownStance`.
**Note (RU):** Между эпизодами Великих домов (день 164 Кроу, день 168 Раймонд). Первый эпизод **Талена**. Проверяет `scaffoldCrownStance`.

#### Node 0

**Prompt (EN):** Your Majesty, I am Talen — I fix problems the scaffold cannot price. I heard Morwen's rope busy, Knox's ledgers louder, and Ashford's lists longer. For a chest of silver I can lose a noble's name before dawn. For a secret I can hang a commoner instead. For nothing I can tell the market which king you are. What do you buy?
**Prompt (RU):** Ваше Величество, я — Тален — я решаю проблемы, которые плаха не может оценить. Я слышал, петля Морвен занята, книги Нокса громче, а списки Эшфорд длиннее. За сундук серебра я могу потерять дворянское имя до рассвета. За секрет — повесить простолюдина вместо него. За ничего — сказать рынку, какой вы король. Что покупаете?

**Prompt variant (`scaffoldCrownStance = bargain`) (EN):** Your Majesty, I heard you sold justice already. I am merely your renewal fee.
**Prompt variant (`scaffoldCrownStance = bargain`) (RU):** Ваше Величество, я слышал, вы уже продавали справедливость. Я — лишь плата за продление.

**Prompt variant (`scaffoldHousesEcho`) (EN):** Your Majesty, peers circle each other like wolves. I sell teeth.
**Prompt variant (`scaffoldHousesEcho`) (RU):** Ваше Величество, сверстники кружат друг вокруг друга, как волки. Я продаю зубы.

---

### Beat 8 — Day 179

**Title (EN):** Mass forgiveness or Mass Hanging
**Title (RU):** Массовая амнистия или массовое повешение
**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен
**Note (EN):** Between [Great Houses day 178](#beat-7--day-178--fake seal-accusation) and day 181 Goose. Post–[Northern day 172](#beat-12--day-172--houses-measure-your-wars) (no collision — northern 172, scaffold 179). Callback `housesDeadCount` if trial fired early... trial is day 201 — use `scaffoldHousesEcho` only.
**Note (RU):** Между [Великими домами дня 178](#beat-7--day-178--fake seal-accusation) и днём 181 Гусь. После [Северного дня 172](#beat-12--day-172--houses-measure-your-wars) (без столкновения — северный 172, плаха 179). Обратная отсылка `housesDeadCount`, если суд сработал рано... суд день 201 — только `scaffoldHousesEcho`.

#### Node 0

**Prompt (EN):** Your Majesty, the cells are full again — rioters, heretics, madmen, names Talen misplaced, names lords prepaid. I heard Great Houses sharpening knives for each other. Declare mass forgiveness and empty my yard, declare mass hanging and teach the realm silence, or continue case by case while peers murder in alleys without me.
**Prompt (RU):** Ваше Величество, камеры снова полны — бунтовщики, еретики, безумцы, имена, которые Тален потерял, имена, которые лорды предоплатили. Я слышал, Великие дома точат ножи друг на друга. Объявите массовую прощение и опустошите мой двор, объявите массовое повешение и научите королевство молчанию, или продолжайте по случаю, пока сверстники убивают в переулках без меня.

**Prompt variant (`scaffoldTalenBribe`) (EN):** Your Majesty, I heard Talen owns part of my list. forgiveness embarrasses him. Hanging embarrasses you. Choose who blushes.
**Prompt variant (`scaffoldTalenBribe`) (RU):** Ваше Величество, я слышал, Тален владеет частью моего списка. Амнистия смущает его. Повешение смущает вас. Выбирайте, кто покраснеет.

**Prompt variant (`scaffoldMassforgiveness` partial) (EN):** Your Majesty, I heard you emptied the yard once before Ashford. Finish the habit or break it.
**Prompt variant (`scaffoldMassforgiveness` partial) (RU):** 

**Prompt variant (`scaffoldMassforgiveness` частично) (EN):** 
**Prompt variant (`scaffoldMassforgiveness` частично) (RU):** Ваше Величество, я слышал, вы опустошали двор однажды до Эшфорда. Завершите привычку или сломайте её.

---

### Beat 9 — Day 183

**Title (EN):** Verdict on Mercy
**Title (RU):** Вердикт о милосердии
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Arc finale. One day before [Guild day 184](#beat-8--day-184--mint-seizure). **On load:** run [day 183 outcome priority](#scaffolds-ledger--beat-resolution-rules) → `scaffoldOutcome`, `scaffoldArcPhase = resolved`.
**Note (RU):** Финал арки. За день до [Гильдии дня 184](#beat-8--day-184--mint-seizure). **При загрузке:** выполнить [приоритет итога дня 183](#scaffolds-ledger--beat-resolution-rules) → `scaffoldOutcome`, `scaffoldArcPhase = resolved`.

#### Node 0

**Prompt (outcome `bloody_peace`) (EN):** Your Majesty, ninety-three days since Morwen first counted Edwin's loyalists — and the realm knows you by rope. I heard heretics, rioters, madmen, and Talen's misplaced names. The square is quiet. The heart is not. You bought bloody peace. It holds — until it does not.
**Prompt (outcome `bloody_peace`) (RU):** 

**Prompt (outcome `mercy_crown`) (EN):** Your Majesty, I heard forgiveness more often than axe-strokes. Morwen's yard is empty enough to embarrass a tyrant. The commons call you merciful. The barracks call you soft. Both may be wrong. You rule a mercy crown.
**Prompt (outcome `mercy_crown`) (RU):** 

**Prompt (outcome `morwens_republic`) (EN):** Your Majesty, I heard Talen price throats and Morwen hate her ledger. Justice became commerce without your face on the coin. Morwen's republic — rope sold by fixers. Efficient. Monstrous. Yours.
**Prompt (outcome `morwens_republic`) (RU):** 

**Prompt (outcome `selective_justice`) (EN):** Your Majesty, no doctrine — only cases, bribes refused or paid, lists blocked or sold. Some hung, some walked. The realm calls it selective justice. I call it the hardest reign to defend — and the only one worth trying twice.
**Prompt (outcome `selective_justice`) (RU):** 

**Prompt (итог `bloody_peace`) (EN):** 
**Prompt (итог `bloody_peace`) (RU):** Ваше Величество, девяносто три дня с тех пор, как Морвен впервые считал лоялистов Эдвина — и королевство знает вас по петле. Я слышал еретиков, бунтовщиков, безумцев и потерянные имена Талена. Площадь тиха. Сердце — нет. Вы купили кровавый мир. Он держится — пока не перестанет.

**Prompt (итог `mercy_crown`) (EN):** 
**Prompt (итог `mercy_crown`) (RU):** Ваше Величество, я слышал прощение чаще, чем удары топора. Двор Морвен пуст настолько, что смущает тирана. Простолюдины зовут вас милосердным. Казармы зовут вас мягким. Оба могут ошибаться. Вы правите короной милосердия.

**Prompt (итог `morwens_republic`) (EN):** 
**Prompt (итог `morwens_republic`) (RU):** Ваше Величество, я слышал, Тален оценивает глотки, а Морвен ненавидит свою книгу. Справедливость стала торговлей без вашего лица на монете. Республика Морвен — петля, проданная посредниками. Эффективно. Чудовищно. Ваше.

**Prompt (итог `selective_justice`) (EN):** 
**Prompt (итог `selective_justice`) (RU):** Ваше Величество, никакой доктрины — только случаи, отказанные или оплаченные взятки, заблокированные или проданные списки. Кого-то повесили, кого-то отпустили. Королевство зовёт это избирательной справедливостью. Я зову самое трудное правление для защиты — и единственное, стоящее второй попытки.

**Choice 1**
- **Choice (EN):** I have heard the scaffold — dismiss the yard
- **Choice (RU):** Я услышал плаху — распустить двор
- **Response (EN):** Then I write *rope* and hope fear outlasts resentment.
- **Response (RU):** Тогда я напишу *петля* и надеюсь, что страх переживёт обиду.
- **Effects:** Army +10, Loyalty -10, Succession +6

---

## The Star Chamber (wildcard / cross-arc)
## Звёздная палата (wildcard / перекрёстная арка)

### Beat 1 — Day 105

**Title (EN):** Comet Confirms killing a king
**Title (RU):** Комета подтверждает цареубийство
**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд
**Note (EN):** Between Hungry beats (100, 106). Opens arc. Post–People unlock (89). Sets `starArcPhase = active`, `starCometProclaimed` on public embrace.
**Note (RU):** Между эпизодами Голодного (100, 106). Открывает арку. После разблокировки People (89). Устанавливает `starArcPhase = active`, `starCometProclaimed` при публичном принятии.

#### Node 0

**Prompt (EN):** Your Majesty, I am Meribald — I read what heaven writes in numbers, not rhymes. A comet crosses Edwin's constellation on the night you took his chair. I heard a blade, a household purged or haunted, and Malrik still deciding your soul's tax bracket. The comet confirms killing a king to anyone who looks up. Silence me, regulate me, or crown the sky your king's close advisors.
**Prompt (RU):** Ваше Величество, я — Мерибальд — я читаю то, что небо пишет цифрами, а не рифмами. Комета пересекает созвездие Эдвина в ночь, когда вы заняли его стул. Я слышал клинок, вычищенный или одержимый двор и Малрика, всё ещё решающего налоговую категорию вашей души. Комета подтверждает цареубийство каждому, кто смотрит вверх. Заглушите меня, выслушайте или продайте Церкви.

**Prompt variant (`prophetFirstHeard`) (EN):** Your Majesty, I heard a nameless prophet rhymes in the market while I measure angles in the tower. Street faith hates comets. Comets hate street faith. You stand between.
**Prompt variant (`prophetFirstHeard`) (RU):** Ваше Величество, я слышал, безымянный пророк рифмует на рынке, пока я измеряю углы в башне. Уличная вера ненавидит кометы. Кометы ненавидят уличную веру. Вы стоите между.

**Prompt variant (`churchArcStance = submit`) (EN):** Your Majesty, I heard you knelt to Malrik. He will hate my chart. The chart does not kneel.
**Prompt variant (`churchArcStance = submit`) (RU):** Ваше Величество, я слышал, вы преклонились перед Малриком. Он возненавидит мою карту. Карта не преклоняется.

---

### Beat 2 — Day 155

**Title (EN):** Ashford's House in the Stars
**Title (RU):** Дом Эшфорд в звёздах
**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд
**Note (EN):** Between Hungry finale (119) and [Great Houses day 158](#beat-1--day-158--eastern-watchers). Pre–Nobility unlock (175). Foreshadows Ashford.
**Note (RU):** Между финалом Голодного (119) и [Великими домами дня 158](#beat-1--day-158--eastern-watchers). До разблокировки Nobility (175). Предвосхищает Эшфорд.

#### Node 0

**Prompt (EN):** Your Majesty, Lady Ashford's birth-house sits in the eastern quadrant — ambitious, brittle, fond of nephews and rope. I heard hunger, scaffold mercy, and Church forfeit machinery. The chart says she will measure your reign on day one-seventy-five. Publish her omen and she will hate you. Withhold it and she will fear you. Sell it and she will own you.
**Prompt (RU):** Ваше Величество, дом рождения леди Эшфорд сидит в восточном квадранте — амбициозный, хрупкий, любящий племянников и петлю. Я слышал голод, милосердие плахи и механизм утраты короны Церкви. Карта говорит, она измерит ваше правление к дню сто семьдесят пятому. Опубликуйте её знамение — она возненавидит вас. Скройте — она испугается. Продайте — она завладеет вами.

**Prompt variant (`scaffoldRiotHangings` or `scaffoldMercy` ≤ −20) (EN):** Your Majesty, I heard Morwen's yard loud. Ashford's chart loves loud kings — briefly.
**Prompt variant (`scaffoldRiotHangings` or `scaffoldMercy` ≤ −20) (RU):** 

**Prompt variant (`hungryOutcome = bread_king`) (EN):** Your Majesty, I heard the commons praise you. Ashford's stars call that *temporary*.
**Prompt variant (`hungryOutcome = bread_king`) (RU):** Ваше Величество, я слышал, простолюдины хвалят вас. Звёзды Эшфорд называют это *временным*.

**Prompt variant (`scaffoldRiotHangings` или `scaffoldMercy` ≤ −20) (EN):** 
**Prompt variant (`scaffoldRiotHangings` или `scaffoldMercy` ≤ −20) (RU):** Ваше Величество, я слышал двор Морвен громкий. Карта Эшфорд любит громких королей — ненадолго.

---

### Beat 3 — Day 212

**Title (EN):** Two Omens, One Mob (node 0)
**Title (RU):** Два знамения, одна толпа (узел 0)
**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд
**Note (EN):** **Day 212** (not 210 — [Great Houses Ilana](#beat-15--day-210--who-bowed-who-bled) owns 210). Two-node beat. Node 1: [Prophet](#beat-4--day-212--two-omens-one-mob-node-1) if active.
**Note (RU):** **День 212** (не 210 — [Великие дома Илана](#beat-15--day-210--who-bowed-who-bled) владеет 210). Двухузловый эпизод. Узел 1: [Пророк](#beat-4--day-212--two-omens-one-mob-node-1), если активен.

#### Node 0

**Prompt (EN):** Your Majesty, the market square fills for two sermons — my eclipse math and the Prophet's winter rhyme. I heard Dell and Crow insult each other in verse while Knox sells maps. The mob wants one truth. Heaven offers two. Regulate both, embrace mine, or let the square choose and call it policy.
**Prompt (RU):** Ваше Величество, рыночная площадь наполняется для двух проповедей — моей математики затмения и зимней рифмы Пророка. Я слышал, Делл и Кроу оскорбляют друг друга стихами, пока Нокс продаёт карты. Толпа хочет одну истину. Небо предлагает две. Регулируйте обоих, примите моё или пусть площадь выберет и назовите это политикой.

**Prompt variant (`prophetFavor` ≥ 20) (EN):** Your Majesty, I heard the streets love his riddles. Stars are colder. Cold can be authority if you wield it.
**Prompt variant (`prophetFavor` ≥ 20) (RU):** Ваше Величество, я слышал, улицы любят его загадки. Звёзды холоднее. Холод может быть властью, если вы им владеете.

**Prompt variant (`housesDeadCount` ≥ 1 if early deaths — usually 0) (EN):** Your Majesty, blood in the peerage makes omens easy to sell. I will not pretend otherwise.
**Prompt variant (`housesDeadCount` ≥ 1 if early deaths — usually 0) (RU):** 

**Prompt variant (`housesDeadCount` ≥ 1 при ранних смертях — обычно 0) (EN):** 
**Prompt variant (`housesDeadCount` ≥ 1 при ранних смертях — обычно 0) (RU):** Ваше Величество, кровь в знати делает знамения лёгкими для продажи. Я не буду притворяться иначе.

---

### Beat 4 — Day 212

**Title (EN):** Two Omens, One Mob (node 1)
**Title (RU):** Два знамения, одна толпа (узел 1)
**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк
**Note (EN):** Always follows Meribald node 0 same day if `prophetArcPhase = active` and not `prophetSilenced`. Cross-arc clash beat.
**Note (RU):** Всегда следует за узлом 0 Мерибальда в тот же день, если `prophetArcPhase = active` и не `prophetSilenced`. Перекрёстный эпизод столкновения.

#### Node 1

**Prompt (EN):** Your Majesty, Meribald counts lights while I count breaths. I heard you proclaimed his comet, burned Ashford's chart, or sold omens like salt. The mob asked which king winter serves. I say: the one who feeds lungs and ears. He says: the one who reads charts. Choose a victor, choose both, or choose silence and let faith fight faith without your badge.
**Prompt (RU):** Ваше Величество, Мерибальд считает огни, пока я считаю вдохи. Я слышал, вы провозгласили его комету, сожгли карту Эшфорд или продали знамения, как соль. Толпа спросила, какому королю служит зима. Я говорю: тому, кто кормит лёгкие и уши. Он говорит: тому, кто читает карты. Выберите победителя, выберите обоих или выберите молчание и пусть вера бьётся с верой без вашего знака.

---

### Beat 5 — Day 235

**Title (EN):** Succession Omen
**Title (RU):** Знамение престолонаследия
**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд
**Note (EN):** Between [Great Houses finale](#beat-16--day-218--verdict-on-the-houses) (218) and [Prophet day 265](#beat-5--day-265--the-knife-in-the-sermon). Twenty-five days before Loyalty unlock (260). [Nephew in the Fog](#the-nephew-in-the-fog-persistent-story) opens day **234** — this beat foreshadows the child-shaped gap.
**Note (RU):** Между [финалом Великих домов](#beat-16--day-218--verdict-on-the-houses) (218) и [Пророком дня 265](#beat-5--day-265--the-knife-in-the-sermon). Двадцать пять дней до разблокировки Loyalty (260). [Племянник в тумане](#the-nephew-in-the-fog-persistent-story) открывается день **234** — этот эпизод предвосхищает пробел в форме ребёнка.

#### Node 0

**Prompt (EN):** Your Majesty, the succession house flickers — Edwin's line, your line, no line. I heard nephews whisper, Ashford map her council, and Ilana write chapters in blood or ink. The chart shows a child-shaped gap before day three-twenty. Publish it and rivals move. Suppress it and rivals guess. Forge it and rivals laugh — until they do not.
**Prompt (RU):** Ваше Величество, дом престолонаследия мерцает — линия Эдвина, ваша линия, никакой линии. Я слышал шёпот племянников, Эшфорд, картографирующую свой совет, и Илану, пишущую главы кровью или чернилами. Карта показывает пробел в форме ребёнка до дня триста двадцатого. Опубликуйте — соперники двинутся. Подавите — соперники угадают. Подделайте — соперники засмеются — пока не перестанут.

**Prompt variant (`housesOutcome = ashford_ascendant`) (EN):** Your Majesty, I heard Ashford ascendant. Her stars want the gap filled with her blood, not yours.
**Prompt variant (`housesOutcome = ashford_ascendant`) (RU):** Ваше Величество, я слышал Эшфорд вознеслась. Её звёзды хотят заполнить пробел её кровью, не вашей.

**Prompt variant (`starOmenClash`) (EN):** Your Majesty, I heard faith fought faith in the square. Succession omens land louder when the mob is already warm.
**Prompt variant (`starOmenClash`) (RU):** Ваше Величество, я слышал, вера билась с верой на площади. Знамения престолонаследия звучат громче, когда толпа уже разогрета.

---

### Beat 6 — Day 280

**Title (EN):** Knox Leak and Aligned Stars
**Title (RU):** Утечка Нокса и выровненные звёзды
**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд
**Note (EN):** Two days after [Northern day 278](#beat-15--day-278--leaks-to-the-north) Knox. Callback `guildKnoxLeak`, `prophetKnoxNamed`.
**Note (RU):** Через два дня после [Северного дня 278](#beat-15--day-278--leaks-to-the-north) Нокса. Обратная отсылка `guildKnoxLeak`, `prophetKnoxNamed`.

#### Node 0

**Prompt (EN):** Your Majesty, Knox sold your birth hour to Ingvar, Ashford, and a prophet who pretends not to buy. I heard northern steel, guild ledgers, and street rhymes share my tower's trash. The stars align for a leak — not water, secrets. Hang Knox, buy my silence, or publish everything and dare the realm to digest truth at once.
**Prompt (RU):** Ваше Величество, Нокс продал ваш час рождения Ингвару, Эшфорд и пророку, притворяющемуся, что не покупает. Я слышал северную сталь, гильдейские книги и уличные рифмы делят мусор моей башни. Звёзды выравниваются для утечки — не воды, секретов. Повесьте Нокса, купите моё молчание или опубликуйте всё и бросьте вызов королевству переварить правду разом.

**Prompt variant (`guildKnoxLeak` or `prophetKnoxNamed`) (EN):** Your Majesty, I heard Knox already sold you twice. My chart merely confirms his character.
**Prompt variant (`guildKnoxLeak` or `prophetKnoxNamed`) (RU):** 

**Prompt variant (`northernTrust` ≤ −20) (EN):** Your Majesty, Ingvar owns part of your sky now. That is what leaks mean.
**Prompt variant (`northernTrust` ≤ −20) (RU):** Ваше Величество, Ингвар теперь владеет частью вашего неба. В этом смысл утечек.

**Prompt variant (`guildKnoxLeak` или `prophetKnoxNamed`) (EN):** 
**Prompt variant (`guildKnoxLeak` или `prophetKnoxNamed`) (RU):** Ваше Величество, я слышал, Нокс уже продал вас дважды. Моя карта лишь подтверждает его характер.

---

### Beat 7 — Day 318

**Title (EN):** Verdict Before Succession
**Title (RU):** Вердикт перед Succession
**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд
**Note (EN):** Arc finale. Two days before Succession unlock (320). **On load:** run [day 318 outcome priority](#star-chamber--beat-resolution-rules) → `starOutcome`, `starArcPhase = resolved`. [Prophet finale](#beat-6--day-325--the-last-sign) follows on day 325.
**Note (RU):** Финал арки. За два дня до разблокировки Succession (320). **При загрузке:** выполнить [приоритет итога дня 318](#star-chamber--beat-resolution-rules) → `starOutcome`, `starArcPhase = resolved`. [Финал Пророка](#beat-6--day-325--the-last-sign) следует днём 325.

#### Node 0

**Prompt (outcome `astrologer_king`) (EN):** Your Majesty, two hundred and thirteen days since a comet confirmed what the blade began — and the court looks up before it looks down. I heard charts proclaimed, Ashford mapped, Knox exposed, succession weighed in angles. You rule as astrologer king. Malrik calls it heresy. Nobles call it service. The tower calls it Tuesday.
**Prompt (outcome `astrologer_king`) (RU):** 

**Prompt (outcome `omen_wars`) (EN):** Your Majesty, I heard rhymes fight math in the square, faith fight faith, Knox sell both. No single omen owns Estedor. Omen wars — street and tower, Prophet and chart. You survive between sermons. Exhausting. Familiar.
**Prompt (outcome `omen_wars`) (RU):** 

**Prompt (outcome `silenced_heavens`) (EN):** Your Majesty, I heard Cyrus seize charts, steel disperse mobs, or indifference starve my tower. Heaven goes quiet. The realm calls it peace. Prophets call it winter. I call it silenced heavens — whether you won or merely muted the sky.
**Prompt (outcome `silenced_heavens`) (RU):** 

**Prompt (итог `astrologer_king`) (EN):** 
**Prompt (итог `astrologer_king`) (RU):** Ваше Величество, двести тринадцать дней с тех пор, как комета подтвердила то, что начал клинок — и двор смотрит вверх, прежде чем вниз. Я слышал провозглашённые карты, размеченную Эшфорд, разоблачённого Нокса, престолонаследие, взвешенное в углах. Вы правите как король-астролог. Малрик зовёт это ересью. Знать зовёт служением. Башня зовёт это вторником.

**Prompt (итог `omen_wars`) (EN):** 
**Prompt (итог `omen_wars`) (RU):** Ваше Величество, я слышал рифмы бьются с математикой на площади, вера с верой, Нокс продаёт обоих. Ни одно знамение не владеет Эстедором. Войны знамений — улица и башня, Пророк и карта. Вы выживаете между проповедями. Изнурительно. Знакомо.

**Prompt (итог `silenced_heavens`) (EN):** 
**Prompt (итог `silenced_heavens`) (RU):** Ваше Величество, я слышал, Сайрус захватил карты, сталь разогнала толпы или равнодушие голодало мою башню. Небо замолкает. Королевство зовёт это миром. Пророки зовут зимой. Я зову заглушёнными небесами — победили ли вы или лишь приглушили небо.

**Choice 1**
- **Choice (EN):** I have heard the stars — dismiss the tower
- **Choice (RU):** Я услышал звёзды — распустить башню
- **Response (EN):** Then govern by chart and chair. May both agree on succession.
- **Response (RU):** Тогда правите по карте и стулу. Пусть оба согласятся о престолонаследии.
- **Effects:** Succession +12, Nobility +10, Church -10

---

## The Court of Knives (persistent story)
## Двор ножей (длящаяся история)

### Beat 1 — Day 248

**Title (EN):** Foreign Offer
**Title (RU):** Иностранное предложение
**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс
**Note (EN):** Opens arc. Six days before [Northern day 252](#beat-14--day-252--loyalties-for-sale). Pre-echo of day 278 Knox leak. Sets `knivesArcPhase = active`.
**Note (RU):** Открывает арку. За шесть дней до [Северного дня 252](#beat-14--day-252--loyalties-for-sale). Предэхо утечки Нокса дня 278. Устанавливает `knivesArcPhase = active`.

#### Node 0

**Prompt (EN):** Your Majesty, Ingvar is not my only buyer this month. I heard northern steel, guild ledgers, and servant names from below your stairs. A foreign house offers coin for your council roster — who sleeps at the door, who signs your decrees, who still whispers Edwin. Sell the court map, refuse and hunt buyers, or hire me exclusively and pray I stay hungry.
**Prompt (RU):** Ваше Величество, Ингвар — не мой единственный покупатель в этом месяце. Я слышал северную сталь, гильдейские книги и имена слуг снизу ваших ступеней. Иностранный дом предлагает монету за состав вашего совета — кто спит у двери, кто подписывает указы, кто всё ещё шепчет об Эдвине. Продайте карту двора, откажите и выследите покупателей или наймите меня эксклюзивно и молитесь, чтобы я остался голодным.

**Prompt variant (`northernTrust` ≤ −20) (EN):** Your Majesty, I heard the north hates you efficiently. Foreign offers multiply when neighbors do.
**Prompt variant (`northernTrust` ≤ −20) (RU):** Ваше Величество, я слышал, север ненавидит вас эффективно. Иностранные предложения умножаются, когда соседи тоже.

**Prompt variant (`tapestryKnoxServants`) (EN):** Your Majesty, I heard you bought servant lists on day one-twenty-six. This is the deluxe edition — with guards attached.
**Prompt variant (`tapestryKnoxServants`) (RU):** Ваше Величество, я слышал, вы купили списки слуг на день сто двадцать шестой. Это расширенное издание — со стражей в комплекте.

**Choice 1**
- **Choice (EN):** Refuse and purge buyers — crown hunts spies
- **Choice (RU):** Отказать и вычистить покупателей — корона охотится на шпионов
- **Response (EN):** Then I vanish before dusk — or sell to someone angrier. You chose steel over commerce.
- **Response (RU):** Тогда я исчезну до заката — или продам кому-то злее. Вы выбрали сталь вместо торговли.
- **Effects:** Army +8, Loyalty -6, Treasury -8
- **Trust: +8**
- **Доверие: +8**

**Choice 2**
- **Choice (EN):** Accept foreign retainer — Knox works abroad this season
- **Choice (RU):** Принять иностранный контракт — Нокс работает за границей этот сезон
- **Response (EN):** Then your court has a landlord overseas. Efficient. Treasonous. Often both.
- **Response (RU):** Тогда у вашего двора есть хозяин за морем. Эффективно. Изменнически. Часто оба.
- **Effects:** Treasury +20, Loyalty -15, Succession -10
- **Trust: −25**
- **Sets flag: `knivesKnoxOffer`**
- **Доверие: −25**
- **Устанавливает флаг: `knivesKnoxOffer`**

**Choice 3**
- **Choice (EN):** Exclusive crown contract — Knox eats only from you
- **Choice (RU):** Эксклюзивный контракт короны — Нокс ест только от вас
- **Response (EN):** Expensive pet. I bite other hands. Not yours — until the price changes.
- **Response (RU):** Дорогой питомец. Я кусаю чужие руки. Не вашу — пока цена не изменится.
- **Effects:** Treasury -18, Loyalty +6
- **Trust: +12**
- **Доверие: +12**

---

### Beat 2 — Day 255

**Title (EN):** Paranoia or Policy
**Title (RU):** Паранойя или политика
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Five days before Loyalty unlock (260). Frames arc for post-unlock era.
**Note (RU):** За пять дней до разблокировки Loyalty (260). Задаёт тон арки для эпохи после разблокировки.

#### Node 0

**Prompt (EN):** Your Majesty, loyalty is about to become a meter the realm reads aloud. I heard Knox's foreign offer, servant leaks from the stairs, and northern maps sold twice. Paranoia keeps thrones — policy keeps realms. Purge the court before day two-sixty, manage spies like a treasury, or trust someone — name who — and dare the statistic.
**Prompt (RU):** Ваше Величество, верность вот-вот станет параметром, который королевство читает вслух. Я слышал иностранное предложение Нокса, утечки слуг со ступеней и северные карты, проданные дважды. Паранойя держит троны — политика держит королевства. Вычистите двор до дня двести шестидесятого, управляйте шпионами, как казной, или доверьтесь кому-то — назовите кого — и бросьте вызов статистике.

**Prompt variant (`knivesKnoxOffer`) (EN):** Your Majesty, I heard you rented Knox abroad. Loyalty will call that treason before breakfast.
**Prompt variant (`knivesKnoxOffer`) (RU):** Ваше Величество, я слышал, вы сдали Нокса внаём за границу. Loyalty назовёт это изменой до завтрака.

**Prompt variant (`guildKnoxLeak` or `starKnoxStars`) (EN):** Your Majesty, I heard Knox sold ledgers already. This is not new sin — it is repeat business.
**Prompt variant (`guildKnoxLeak` or `starKnoxStars`) (RU):** 

**Prompt variant (`guildKnoxLeak` или `starKnoxStars`) (EN):** 
**Prompt variant (`guildKnoxLeak` или `starKnoxStars`) (RU):** Ваше Величество, я слышал, Нокс уже продавал книги. Это не новый грех — это повторный бизнес.

**Choice 1**
- **Choice (EN):** Policy of purge — fear before Loyalty unlocks
- **Choice (RU):** Политика чистки — страх до разблокировки Loyalty
- **Response (EN):** Then I write *iron* early. The court will not thank you. It will obey — briefly.
- **Response (RU):** Тогда я напишу *железо* рано. Двор не поблагодарит. Он подчинится — ненадолго.
- **Effects:** Army +10, Loyalty -8
- **Trust: −10**
- **Доверие: −10**

**Choice 2**
- **Choice (EN):** Policy of managed spies — catalog, do not hang
- **Choice (RU):** Политика управляемых шпионов — каталогизировать, не вешать
- **Response (EN):** Clever. Exhausting. Like ruling two courts — one visible, one numbered.
- **Response (RU):** Умно. Изнурительно. Как править двумя дворами — одним видимым, одним пронумерованным.
- **Effects:** Treasury -10, Loyalty +6, Succession +4
- **Trust: +10**
- **Доверие: +10**

**Choice 3**
- **Choice (EN):** Policy of trust — name Raena and no one else
- **Choice (RU):** Политика доверия — назвать Раэну и никого больше
- **Response (EN):** Dangerous simplicity. If you are wrong, you are wrong magnificently.
- **Response (RU):** Опасная простота. Если ошибётесь — ошибётесь великолепно.
- **Effects:** Loyalty +10, Army +4
- **Trust: +15**
- **Доверие: +15**

---

### Beat 3 — Day 262

**Title (EN):** Forged Decrees
**Title (RU):** Поддельные указы
**Character (EN):** Royal Scribe Osric
**Character (RU):** Королевский писарь Осрик
**Note (EN):** Between [Prophet day 265](#beat-5--day-265--the-knife-in-the-sermon) — no collision. Callback [Household](#the-old-kings-household-persistent-story) Osric ghost signatures.
**Note (RU):** Между [Пророком дня 265](#beat-5--day-265--the-knife-in-the-sermon) — без столкновения. Обратная отсылка [Двору](#the-old-kings-household-persistent-story) призрачным подписям Осрика.

#### Node 0

**Prompt (EN):** Your Majesty, decrees circulate in Edwin's hand — my hand — your hand — and the fake seal is exquisite. I heard Knox sell maps, foreign houses bid, and Loyalty unlock approach. Hang the forger, authenticate every seal with pain, or use false decrees to feed false buyers and learn who bites.
**Prompt (RU):** Ваше Величество, указы ходят рукой Эдвина — моей рукой — вашей рукой — и фальшивая монета изысканна. Я слышал, Нокс продаёт карты, иностранные дома торгуются, а разблокировка Loyalty приближается. Повесьте подделывателя, удостоверьте каждую печать болью или используйте ложные указы, чтобы кормить ложных покупателей и узнать, кто клюёт.

**Prompt variant (`householdCutClerks` or `householdOutcome = clean_court`) (EN):** Your Majesty, I heard you purged archives. Forgers thrive in confusion. That is not philosophy — it is paperwork.
**Prompt variant (`householdCutClerks` or `householdOutcome = clean_court`) (RU):** 

**Prompt variant (`householdCutClerks` или `householdOutcome = clean_court`) (EN):** 
**Prompt variant (`householdCutClerks` или `householdOutcome = clean_court`) (RU):** Ваше Величество, я слышал, вы вычистили архивы. Подделыватели процветают в путанице. Это не философия — это бумаги.

**Choice 1**
- **Choice (EN):** Authenticate all seals — slow honest government
- **Choice (RU):** Удостоверить все печати — медленное честное правление
- **Response (EN):** Then policy crawls and trust inches upward. Rare. Boring. Useful.
- **Response (RU):** Тогда политика ползёт, а доверие растёт сантиметрами. Редко. Скучно. Полезно.
- **Effects:** Loyalty +10, Treasury -8, Succession +6
- **Trust: +12**
- **Доверие: +12**

**Choice 2**
- **Choice (EN):** Feed fake seals to Knox's buyers — counter-intelligence
- **Choice (RU):** Кормить фальшивая монетами покупателей Нокса — контрразведка
- **Response (EN):** Then liars eat liars. If they compare notes, you burn. Until then, you learn.
- **Response (RU):** Тогда лжецы едят лжецов. Если сравнят записи — вы сгорите. Пока — узнаете.
- **Effects:** Loyalty +4, Army +3
- **Trust: +6**
- **Sets flag: `knivesOsricfake seal`**
- **Доверие: +6**
- **Устанавливает флаг: `knivesOsricfake seal`**

**Choice 3**
- **Choice (EN):** Hang Osric — scapegoat the archive
- **Choice (RU):** Повесить Осрика — козёл отпущения архива
- **Response (EN):** Convenient. fake seals continue without a neck to blame. You chose theatre.
- **Response (RU):** Удобно. Фальшивые монеты продолжатся без шеи для обвинения. Вы выбрали театр.
- **Effects:** Loyalty -12, Succession +5
- **Trust: −18**
- **Sets flag: `knivesOsricfake seal` (worse fallout)**
- **Доверие: −18**
- **Устанавливает флаг: `knivesOsricfake seal` (худшие последствия)**

---

### Beat 4 — Day 268

**Title (EN):** Public Audience
**Title (RU):** Публичная аудиенция
**Character (EN):** The Masked One
**Character (RU):** Замаскированный
**Note (EN):** Post–Loyalty unlock (260). First Masked One beat in [Court of Knives](#the-court-of-knives-persistent-story). [Nephew in the Fog](#the-nephew-in-the-fog-persistent-story) day 234 opens the succession claim; this beat escalates court intrigue. Unknown identity drives Succession rumor.
**Note (RU):** После разблокировки Loyalty (260). Первый эпизод Замаскированного в [Дворе ножей](#the-court-of-knives-persistent-story). [Племянник в тумане](#the-nephew-in-the-fog-persistent-story) день 234 открывает претензию на престолонаследие; этот эпизод обостряет дворовую интригу. Неизвестная личность питает слухи о Succession.

#### Node 0

**Prompt (EN):** Your Majesty, I wear a mask because names are contracts — and I have not decided whom I serve. The court demands audience. I heard forged decrees, foreign offers, and Edwin's chamber still debated below stairs. Unmask me publicly, grant private council, or refuse audience and let rumor name me nephew, ghost, or merchant prince.
**Prompt (RU):** Ваше Величество, я ношу маску, потому что имена — это контракты — и я ещё не решил, кому служу. Двор требует аудиенции. Я слышал поддельные указы, иностранные предложения и споры о покое Эдвина под ступенями. Снимите маску публично, дайте частный совет или откажите в аудиенции и пусть слух назовёт меня племянником, призраком или купеческим принцем.

**Prompt variant (`tapestryChamberUsed`) (EN):** Your Majesty, I heard Edwin's bed still warm. The mask is not the only thing that frightens Ashford.
**Prompt variant (`tapestryChamberUsed`) (RU):** Ваше Величество, я слышал, ложе Эдвина всё ещё тепло. Маска — не единственное, что пугает Эшфорд.

**Prompt variant (`housesOutcome` set) (EN):** Your Majesty, I heard great houses bleed. Masks are fashionable this season.
**Prompt variant (`housesOutcome` set) (RU):** 

**Prompt variant (`housesOutcome` установлен) (EN):** 
**Prompt variant (`housesOutcome` установлен) (RU):** Ваше Величество, я слышал, великие дома истекают кровью. Маски в моде в этот сезон.

**Choice 1**
- **Choice (EN):** Public audience — let the court see the mask
- **Choice (RU):** Публичная аудиенция — пусть двор увидит маску
- **Response (EN):** Then rumor becomes spectacle. Spectacle is cheaper than truth and twice as loud.
- **Response (RU):** Тогда слух становится зрелищем. Зрелище дешевле правды и вдвое громче.
- **Effects:** Loyalty -6, Succession +10, Nobility -8
- **Trust: −5**
- **Sets flag: `knivesMaskedAudience`**
- **Доверие: −5**
- **Устанавливает флаг: `knivesMaskedAudience`**

**Choice 2**
- **Choice (EN):** Private council — masked voice advises throne
- **Choice (RU):** Частный совет — замаскированный голос советует трону
- **Response (EN):** Then you govern whispers. I will whisper back. Knox will try to listen.
- **Response (RU):** Тогда вы правите шёпотом. Я буду шептать в ответ. Нокс попытается слушать.
- **Effects:** Loyalty +6, Succession +8, Treasury -10
- **Trust: +8**
- **Sets flag: `knivesMaskedAudience`**
- **Доверие: +8**
- **Устанавливает флаг: `knivesMaskedAudience`**

**Choice 3**
- **Choice (EN):** Refuse audience — mask leaves unnamed
- **Choice (RU):** Отказать в аудиенции — маска уходит безымянной
- **Response (EN):** Then I vanish and ten masks appear. You chose mystery. Mystery multiplies.
- **Response (RU):** Тогда я исчезну, и появятся десять масок. Вы выбрали тайну. Тайна умножается.
- **Effects:** Army +4, Loyalty -4
- **Trust: −3**
- **Доверие: −3**

---

### Beat 5 — Day 274

**Title (EN):** Who Guards the Door
**Title (RU):** Кто стоит у двери
**Character (EN):** Bodyguard Raena
**Character (RU):** Телохранитель Раэна
**Note (EN):** Callback [Below the Tapestry](#below-the-tapestry-persistent-story) `tapestryRaenaDoor`, [Empty Purse](#the-empty-purse-persistent-story).
**Note (RU):** Обратная отсылка [Под гобеленом](#below-the-tapestry-persistent-story) `tapestryRaenaDoor`, [Пустая казна](#the-empty-purse-persistent-story).

#### Node 0

**Prompt (EN):** Your Majesty, three men claim my post — mercenary, Edwin's veteran, foreign sworn sword. I heard Knox's offer, Osric's fake seals, and a mask in your council. Loyalty meter says the realm watches who you trust at the door. Keep me, rotate guards, or double posts and bankrupt trust.
**Prompt (RU):** Ваше Величество, трое претендуют на мой пост — наёмник, ветеран Эдвина, иностранный меч. Я слышал предложение Нокса, фальшивые монеты Осрика и маску в вашем совете. Параметр Loyalty говорит, королевство смотрит, кому вы доверяете у двери. Оставьте меня, ротируйте стражу или удвойте посты и обанкротьте доверие.

**Prompt variant (`knivesKnoxOffer`) (EN):** Your Majesty, I heard you sold maps abroad. My sword is not for export — yet.
**Prompt variant (`knivesKnoxOffer`) (RU):** Ваше Величество, я слышал, вы продали карты за границу. Мой меч пока не на экспорт.

**Prompt variant (`knivesCrownStance = trust`) (EN):** Your Majesty, I heard Edric named me policy. Flattering. Heavy.
**Prompt variant (`knivesCrownStance = trust`) (RU):** Ваше Величество, я слышал, Эдрик назвал меня политикой. Льстит. Тяжело.

**Choice 1**
- **Choice (EN):** Keep Raena — one sword, one door
- **Choice (RU):** Оставить Раэну — один меч, одна дверь
- **Response (EN):** Then I stay. If you fail me, you fail simplicity.
- **Response (RU):** Тогда я остаюсь. Если подведёте меня — подведёте простоту.
- **Effects:** Loyalty +12, Army +4, Treasury -8
- **Trust: +18**
- **Sets flag: `knivesRaenaDoor`**
- **Доверие: +18**
- **Устанавливает флаг: `knivesRaenaDoor`**

**Choice 2**
- **Choice (EN):** Rotate guard — no one owns the stair
- **Choice (RU):** Ротировать стражу — никто не владеет лестницей
- **Response (EN):** Then assassins schedule around shifts. So will you.
- **Response (RU):** Тогда убийцы планируют вокруг смен. Вы тоже.
- **Effects:** Army +6, Loyalty -6
- **Trust: −8**
- **Доверие: −8**

**Choice 3**
- **Choice (EN):** Hire foreign sword — Knox's recommendation
- **Choice (RU):** Нанять иностранный меч — рекомендация Нокса
- **Response (EN):** Then I leave before dusk. You chose novelty over memory.
- **Response (RU):** Тогда я уйду до заката. Вы выбрали новизну вместо памяти.
- **Effects:** Treasury -15, Army +10, Loyalty -15
- **Trust: −20**
- **Доверие: −20**

---

### Beat 6 — Day 276

**Title (EN):** History for Sale
**Title (RU):** История на продажу
**Character (EN):** Chronicler Ilana
**Character (RU):** Летописец Илана
**Note (EN):** **Day 276** (not 280 — Star Chamber Knox/stars beat owns 280). Callback [Guild day 214](#beat-11--day-214--debt-chapter) Ilana debt chapter.
**Note (RU):** **День 276** (не 280 — эпизод Нокса/звёзд Звёздной палаты владеет 280). Обратная отсылка [Гильдии дня 214](#beat-11--day-214--debt-chapter) глава долга Иланы.

#### Node 0

**Prompt (EN):** Your Majesty, I write the first draft of your reign while knives sell second drafts abroad. I heard Knox, foreign houses, and Talen price your mornings. Buy my chapter exclusively, let chapters leak and learn who reads, or burn drafts and rule without chronicle — blind, but unquoted.
**Prompt (RU):** Ваше Величество, я пишу первый черновик вашего правления, пока ножи продают вторые черновики за границу. Я слышал Нокса, иностранные дома и Талена, оценивающего ваши утра. Купите мою главу эксклюзивно, пусть главы утекают и узнайте, кто читает, или сожгите черновики и правите без летописи — слепо, но без цитат.

**Prompt variant (`knivesOsricfake seal`) (EN):** Your Majesty, I heard decrees lie. I prefer verbs that do not need fake seals to rhyme.
**Prompt variant (`knivesOsricfake seal`) (RU):** Ваше Величество, я слышал, указы лгут. Я предпочитаю глаголы, которым не нужны фальшивые монеты для рифмы.

**Prompt variant (`housesDeadCount` ≥ 2) (EN):** Your Majesty, I heard blood in the peerage. My ink is still wet.
**Prompt variant (`housesDeadCount` ≥ 2) (RU):** Ваше Величество, я слышал кровь в знати. Мои чернила ещё влажны.

**Choice 1**
- **Choice (EN):** Exclusive chronicle — crown owns history
- **Choice (RU):** Эксклюзивная летопись — корона владеет историей
- **Response (EN):** Then you buy sentences. Expensive. Worth it if you finish the book.
- **Response (RU):** Тогда вы покупаете предложения. Дорого. Стоит того, если допишете книгу.
- **Effects:** Treasury -12, Loyalty +8, Succession +8
- **Trust: +10**
- **Доверие: +10**

**Choice 2**
- **Choice (EN):** Let chapters leak — learn who quotes them
- **Choice (RU):** Пусть главы утекают — узнать, кто цитирует
- **Response (EN):** Then Knox profits and you learn. Both can be true. Both hurt.
- **Response (RU):** Тогда Нокс наживается, а вы узнаёте. Оба могут быть правдой. Оба больно.
- **Effects:** Loyalty +4, Nobility -6
- **Trust: +4**
- **Sets flag: `knivesIlanaSold`**
- **Доверие: +4**
- **Устанавливает флаг: `knivesIlanaSold`**

**Choice 3**
- **Choice (EN):** Burn drafts — no history until victory
- **Choice (RU):** Сжечь черновики — никакой истории до победы
- **Response (EN):** Then rumor owns your verbs. Soldiers may prefer it that way.
- **Response (RU):** Тогда слух владеет вашими глаголами. Солдаты могут предпочесть это.
- **Effects:** Army +6, Loyalty -8
- **Trust: −10**
- **Доверие: −10**

---

### Beat 7 — Day 286

**Title (EN):** Ledger Leaks
**Title (RU):** Утечки из книг
**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин
**Note (EN):** Six days after Ilana. Callback `knivesIlanaSold`, `guildKnoxLeak`.
**Note (RU):** Через шесть дней после Иланы. Обратная отсылка `knivesIlanaSold`, `guildKnoxLeak`.

#### Node 0

**Prompt (EN):** Your Majesty, true ledgers walk while court ledgers lie. I heard Knox sold pages, Ilana sold chapters, foreign houses bought both. Borvin's numbers say Loyalty is a luxury line-item. Publish true accounts, feed false numbers to spies, or hang the clerks and pretend arithmetic is moral.
**Prompt (RU):** Ваше Величество, истинные книги ходят, пока дворовые лгут. Я слышал, Нокс продал страницы, Илана — главы, иностранные дома купили оба. Числа Борвина говорят, Loyalty — статья роскоши. Опубликуйте истинные счета, кормите ложные цифры шпионам или повесьте писцов и притворитесь, что арифметика моральна.

**Prompt variant (`guildOutcome = debt_crown`) (EN):** Your Majesty, I heard creditors own tomorrow. Leaks are the least of your debts.
**Prompt variant (`guildOutcome = debt_crown`) (RU):** Ваше Величество, я слышал, кредиторы владеют завтра. Утечки — наименьшее из ваших долгов.

**Choice 1**
- **Choice (EN):** Publish true accounts — honest bankruptcy or honest surplus
- **Choice (RU):** Опубликовать истинные счета — честное банкротство или честный профицит
- **Response (EN):** Then the court panics uniformly. Honesty is a kind of purge.
- **Response (RU):** Тогда двор паникует равномерно. Честность — вид чистки.
- **Effects:** Loyalty +10, Treasury -5, Nobility -8
- **Trust: +12**
- **Доверие: +12**

**Choice 2**
- **Choice (EN):** Feed false ledgers — counter-intelligence
- **Choice (RU):** Кормить ложные книги — контрразведка
- **Response (EN):** Clever until two liars compare. Still — buy time.
- **Response (RU):** Умно, пока два лжеца не сравнят. Всё же — купите время.
- **Effects:** Loyalty +4, Army +3
- **Trust: +6**
- **Sets flag: `knivesBorvinLeak`**
- **Доверие: +6**
- **Устанавливает флаг: `knivesBorvinLeak`**

**Choice 3**
- **Choice (EN):** Hang clerks — scapegoat arithmetic
- **Choice (RU):** Повесить писцов — козёл отпущения арифметики
- **Response (EN):** Theatre. The numbers continue without necks to blame.
- **Response (RU):** Театр. Числа продолжаются без шей для обвинения.
- **Effects:** Loyalty -10, Treasury +8
- **Trust: −15**
- **Доверие: −15**

---

### Beat 8 — Day 292

**Title (EN):** Three Crowns
**Title (RU):** Три короны
**Character (EN):** Talen
**Character (RU):** Тален
**Note (EN):** Callback [Scaffold day 165](#beat-7--day-165--bribe-the-executioner) Talen. *"I heard Knox works for three crowns."*
**Note (RU):** Обратная отсылка [Книге плахи дня 165](#beat-7--day-165--bribe-the-executioner) Тален. *«Я слышал, Нокс работает на три короны».*

#### Node 0

**Prompt (EN):** Your Majesty, I am Talen — fixer, whisperer, bill presented after damage. I heard Knox works for three crowns: yours, Ingvar's, and a masked third who pays in succession rumors. Expose Knox, join the auction, or hire me to lie to all three and call it policy.
**Prompt (RU):** Ваше Величество, я — Тален — посредник, шептун, счёт, предъявленный после ущерба. Я слышал, Нокс работает на три короны: вашу, Ингвара и замаскированную третью, платящую слухами о престолонаследии. Разоблачите Нокса, присоединитесь к аукциону или наймите меня лгать всем троим и назовите это политикой.

**Prompt variant (`knivesKnoxOffer`) (EN):** Your Majesty, I heard you already sold Knox abroad. He works for four crowns now. Inflation is spiritual.
**Prompt variant (`knivesKnoxOffer`) (RU):** Ваше Величество, я слышал, вы уже сдали Нокса за границу. Теперь он работает на четыре короны. Инфляция духовная.

**Prompt variant (`knivesMaskedAudience`) (EN):** Your Majesty, the masked third pays well. I could introduce you — for a fee.
**Prompt variant (`knivesMaskedAudience`) (RU):** Ваше Величество, замаскированная третья хорошо платит. Я могу представить вас — за плату.

**Choice 1**
- **Choice (EN):** Expose Knox publicly — loyalty through humiliation
- **Choice (RU):** Разоблачить Нокса публично — верность через унижение
- **Response (EN):** Then he vanishes and ten smaller Knoxes appear. You chose sermon over solution.
- **Response (RU):** Тогда он исчезнет, и появятся десять меньших Ноксов. Вы выбрали проповедь вместо решения.
- **Effects:** Loyalty +8, Army +5, Treasury -5
- **Trust: +8**
- **Доверие: +8**

**Choice 2**
- **Choice (EN):** Join the auction — crown outbids foreign houses
- **Choice (RU):** Присоединиться к аукциону — корона перебивает иностранные дома
- **Response (EN):** Then you rent loyalty weekly. I approve of subscriptions.
- **Response (RU):** Тогда вы снимаете верность еженедельно. Я одобряю подписки.
- **Effects:** Treasury -25, Loyalty +10
- **Trust: +5**
- **Доверие: +5**

**Choice 3**
- **Choice (EN):** Hire Talen to lie to all three crowns
- **Choice (RU):** Нанять Талена лгать всем трём коронам
- **Response (EN):** Then truth dies of overwork. You survive — until the lies meet.
- **Response (RU):** Тогда правда умирает от переработки. Вы выживаете — пока лжи не встретятся.
- **Effects:** Loyalty -8, Succession +6, Treasury -12
- **Trust: −12**
- **Sets flag: `knivesTalenTriple`**
- **Доверие: −12**
- **Устанавливает флаг: `knivesTalenTriple`**

---

### Beat 9 — Day 304

**Title (EN):** Guard Purge
**Title (RU):** Чистка стражи
**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн
**Note (EN):** Twenty-six days after [Northern day 278](#beat-15--day-278--leaks-to-the-north). Guard purge vs reform.
**Note (RU):** Через двадцать шесть дней после [Северного дня 278](#beat-15--day-278--leaks-to-the-north). Чистка стражи против реформы.

#### Node 0

**Prompt (EN):** Your Majesty, the yard lists traitors — or loyalists — depending who writes lists. I heard Knox, Talen, foreign swords, and forged decrees. Purge the guard and teach fear, reform oaths and teach patience, or ignore the yard and teach contempt. Loyalty meter will read your choice aloud.
**Prompt (RU):** Ваше Величество, двор перечисляет предателей — или лоялистов — в зависимости от того, кто пишет списки. Я слышал Нокса, Талена, иностранные мечи и поддельные указы. Вычистите стражу и научите страху, реформируйте клятвы и научите терпению или игнорируйте двор и научите презрению. Параметр Loyalty прочтёт ваш выбор вслух.

**Prompt variant (`knivesRaenaDoor`) (EN):** Your Majesty, I heard Raena owns the door. The yard wants to know if she owns the throne.
**Prompt variant (`knivesRaenaDoor`) (RU):** Ваше Величество, я слышал, Раэна владеет дверью. Двор хочет знать, владеет ли она троном.

**Prompt variant (`knivesCrownStance = purge`) (EN):** Your Majesty, I heard Edric chose fear. I sharpen steel accordingly.
**Prompt variant (`knivesCrownStance = purge`) (RU):** Ваше Величество, я слышал, Эдрик выбрал страх. Я точу сталь соответственно.

**Choice 1**
- **Choice (EN):** Purge the guard — new oaths, new men
- **Choice (RU):** Вычистить стражу — новые клятвы, новые люди
- **Response (EN):** Then fear keeps order until fear finds a leader.
- **Response (RU):** Тогда страх держит порядок, пока страх не найдёт лидера.
- **Effects:** Army +10, Loyalty -12, Treasury -10
- **Trust: −20**
- **Sets flag: `knivesVarnPurge`**
- **Доверие: −20**
- **Устанавливает флаг: `knivesVarnPurge`**

**Choice 2**
- **Choice (EN):** Reform oaths — pay, investigate, retain
- **Choice (RU):** Реформировать клятвы — платить, расследовать, сохранять
- **Response (EN):** Gold and ledgers. Traditional pairing. Less bloody. Not bloodless.
- **Response (RU):** Золото и книги. Традиционная пара. Менее кроваво. Не без крови.
- **Effects:** Treasury -15, Loyalty +12, Army +4
- **Trust: +15**
- **Доверие: +15**

**Choice 3**
- **Choice (EN):** Ignore the yard — throne above barracks gossip
- **Choice (RU):** Игнорировать двор — трон выше казарменных сплетен
- **Response (EN):** Then gossip becomes policy without your signature.
- **Response (RU):** Тогда сплетни становятся политикой без вашей подписи.
- **Effects:** Loyalty -8, Army -5
- **Trust: −10**
- **Доверие: −10**

---

### Beat 10 — Day 315

**Title (EN):** Verdict on Trust
**Title (RU):** Вердикт о доверии
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Arc finale. Three days before [Star Chamber day 318](#beat-7--day-318--verdict-before-succession). Five days before Succession unlock (320). **On load:** run [day 315 outcome priority](#court-of-knives--beat-resolution-rules) → `knivesOutcome`, `knivesArcPhase = resolved`.
**Note (RU):** Финал арки. За три дня до [Звёздной палаты дня 318](#beat-7--day-318--verdict-before-succession). За пять дней до разблокировки Succession (320). **При загрузке:** выполнить [приоритет итога дня 315](#court-of-knives--beat-resolution-rules) → `knivesOutcome`, `knivesArcPhase = resolved`.

#### Node 0

**Prompt (outcome `iron_chancellor`) (EN):** Your Majesty, sixty-seven days since Knox's foreign offer — and the court knows you by purge. I heard fake seals hunted, masks refused, guards replaced, ledgers scapegoated. Iron chancellor — fear keeps the council in line. Loyalty survives. Warmth does not.
**Prompt (outcome `iron_chancellor`) (RU):** 

**Prompt (outcome `hollow_court`) (EN):** Your Majesty, I heard maps sold, chapters leaked, ledgers false, masks unnamed. Hollow court — everyone present, no one believed. You reign among spies who hate each other almost as much as they hate you.
**Prompt (outcome `hollow_court`) (RU):** 

**Prompt (outcome `traitor_king`) (EN):** Your Majesty, I heard Knox work abroad, Talen lie to three crowns, foreign steel at your door. Traitor king — or king who bought time with treason. The realm cannot tell. Neither can I.
**Prompt (outcome `traitor_king`) (RU):** 

**Prompt (outcome `managed_spies`) (EN):** Your Majesty, no doctrine — only managed spies, catalogued leaks, and a mask who may or may not advise. Managed trust. Exhausting. Durable. The Loyalty meter calls it survival.
**Prompt (outcome `managed_spies`) (RU):** 

**Prompt (итог `iron_chancellor`) (EN):** 
**Prompt (итог `iron_chancellor`) (RU):** Ваше Величество, шестьдесят семь дней с иностранного предложения Нокса — и двор знает вас по чистке. Я слышал охоту на фальшивые монеты, отказ в масках, замену стражи, козлов отпущения в книгах. Железный канцлер — страх держит совет в узде. Loyalty выживает. Теплота — нет.

**Prompt (итог `hollow_court`) (EN):** 
**Prompt (итог `hollow_court`) (RU):** Ваше Величество, я слышал, карты проданы, главы утекли, книги ложны, маски безымянны. Пустой двор — все присутствуют, никому не верят. Вы царствуете среди шпионов, ненавидящих друг друга почти так же, как вас.

**Prompt (итог `traitor_king`) (EN):** 
**Prompt (итог `traitor_king`) (RU):** Ваше Величество, я слышал, Нокс работает за границей, Тален лжёт трём коронам, иностранная сталь у вашей двери. Король-предатель — или король, купивший время изменой. Королевство не отличит. Я тоже.

**Prompt (итог `managed_spies`) (EN):** 
**Prompt (итог `managed_spies`) (RU):** Ваше Величество, никакой доктрины — только управляемые шпионы, каталогизированные утечки и маска, которая может советовать, а может нет. Управляемое доверие. Изнурительно. Прочно. Параметр Loyalty зовёт это выживанием.

**Choice 1**
- **Choice (EN):** I have heard the court — dismiss the knives
- **Choice (RU):** Я услышал двор — распустить ножи
- **Response (EN):** Then I write *iron* and hope fear outlasts resentment.
- **Response (RU):** Тогда я напишу *железо* и надеюсь, что страх переживёт обиду.
- **Effects:** Army +12, Loyalty -6, Succession +8

---

## The Nephew in the Fog (persistent story)
## Племянник в тумане (длящаяся история)

### Beat 1 — Day 234

**Title (EN):** Voice of the Nephew
**Title (RU):** Голос племянника
**Character (EN):** The Masked One
**Character (RU):** Замаскированный
**Note (EN):** Opens arc one day before [Star Chamber day 235](#beat-5--day-235--succession-omen). Pre–[Court of Knives](#the-court-of-knives-persistent-story). May be same masked figure as day 268 Court beat — identity unresolved until day 322. Sets `heirArcPhase = active`, `heirMaskedClaim`.
**Note (RU):** Открывает арку за день до [Звёздной палаты дня 235](#beat-5--day-235--succession-omen). До [Двора ножей](#the-court-of-knives-persistent-story). Может быть той же замаскированной фигурой, что и эпизод Двора дня 268 — личность неясна до дня 322. Устанавливает `heirArcPhase = active`, `heirMaskedClaim`.

#### Node 0

**Prompt (EN):** Your Majesty, I speak for a boy you hoped was fog — Edwin's nephew, exiled, hungry, and tired of your chair. I heard guild creditors, star-charts, and great houses measure your reign. Deny him and call me liar, seek him and call me guide, or use my claim to frighten Ashford before she rides again. The mask stays. The question does not.
**Prompt (RU):** Ваше Величество, я говорю за мальчика, которого вы надеялись увидеть туманом — племянника Эдвина, изгнанного, голодного и уставшего от вашего стула. Я слышал гильдейских кредиторов, звёздные карты и великие дома, измеряющие ваше правление. Отвергните его и назовите меня лжецом, ищите его и назовите меня проводником или используйте мою претензию, чтобы напугать Эшфорд, прежде чем она снова приедет. Маска остаётся. Вопрос — нет.

**Prompt variant (`housesAshfordCouncil` or `housesOutcome = ashford_ascendant`) (EN):** Your Majesty, I heard Ashford ascendant. Nephews are problems eastern ladies solve with marriage or murder. I offer a third inconvenience.
**Prompt variant (`housesAshfordCouncil` or `housesOutcome = ashford_ascendant`) (RU):** 

**Prompt variant (`starSuccessionOmen`) (EN):** Your Majesty, I heard Meribald mapped a child-shaped gap. I am the gap's voice — or its vendor.
**Prompt variant (`starSuccessionOmen`) (RU):** Ваше Величество, я слышал, Мерибальд разметил пробел в форме ребёнка. Я — голос пробела — или его продавец.

**Prompt variant (`housesAshfordCouncil` или `housesOutcome = ashford_ascendant`) (EN):** 
**Prompt variant (`housesAshfordCouncil` или `housesOutcome = ashford_ascendant`) (RU):** Ваше Величество, я слышал Эшфорд вознеслась. Племянники — проблемы, которые восточные дамы решают браком или убийством. Я предлагаю третье неудобство.

---

### Beat 2 — Day 242

**Title (EN):** Marriage Was to Silence Him
**Title (RU):** Брак, чтобы заткнуть его
**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд
**Note (EN):** Eight days before [Court of Knives day 248](#beat-1--day-248--foreign-offer). Callback [Great Houses](#the-great-houses-persistent-story) Ashford arc.
**Note (RU):** За восемь дней до [Двора ножей дня 248](#beat-1--day-248--foreign-offer). Обратная отсылка [Великим домам](#the-great-houses-persistent-story) арка Эшфорд.

#### Node 0

**Prompt (EN):** Your Majesty, a marriage was arranged to silence Edwin's nephew — my family's insurance, not your romance. I heard a mask speaks his name in the capital. Marry the silence properly, hunt the boy for me, or admit the nephew lives and let Ashford broker his cage. I do not share power with fog.
**Prompt (RU):** Ваше Величество, брак был устроен, чтобы заткнуть племянника Эдвина — страховка моей семьи, не ваша романтика. Я слышала, маска произносит его имя в столице. Заключите тишину браком, выследите мальчика для меня или признайте, что племянник жив, и пусть Эшфорд брокерует его клетку. Я не делю власть с туманом.

**Prompt variant (`heirMaskedClaim`) (EN):** Your Majesty, I heard you weaponized the claim. Weaponize it toward my house or I weaponize it toward your throat.
**Prompt variant (`heirMaskedClaim`) (RU):** Ваше Величество, я слышала, вы использовали претензию как оружие. Направьте оружие на мой дом — или я направлю на ваше горло.

**Prompt variant (`heirCrownStance = hunt`) (EN):** Your Majesty, I heard you hunt the boy. Hunt for Ashford, not for yourself.
**Prompt variant (`heirCrownStance = hunt`) (RU):** Ваше Величество, я слышала, вы охотитесь за мальчиком. Охотитесь для Эшфорд, не для себя.

---

### Beat 3 — Day 257

**Title (EN):** Three Buyers for the Boy
**Title (RU):** Три покупателя мальчика
**Character (EN):** Talen
**Character (RU):** Тален
**Note (EN):** **Day 257** (not 255 — [Court of Knives Edric](#beat-2--day-255--paranoia-or-policy) owns 255). Callback [Court day 292](#beat-8--day-292--three-crowns) and [Scaffold day 165](#beat-7--day-165--bribe-the-executioner).
**Note (RU):** **День 257** (не 255 — [Эдрик Двора ножей](#beat-2--day-255--paranoia-or-policy) владеет 255). Обратная отсылка [Двору дня 292](#beat-8--day-292--three-crowns) и [Книге плахи дня 165](#beat-7--day-165--bribe-the-executioner).

#### Node 0

**Prompt (EN):** Your Majesty, three buyers want the boy's location — Ashford, Ingvar, and a masked fixer who pays in succession rumors. I heard you denied, hunted, or brokered the nephew. I sell coordinates to the highest bidder unless you outbid everyone and buy fog outright.
**Prompt (RU):** Ваше Величество, три покупателя хотят местонахождение мальчика — Эшфорд, Ингвар и замаскированный посредник, платящий слухами о престолонаследии. Я слышал, вы отвергли, искали или брокеровали племянника. Я продаю координаты высшему ставшему, если вы не перебьёте всех и не купите туман целиком.

**Prompt variant (`knivesTalenTriple`) (EN):** Your Majesty, I heard you hired me to lie to three crowns already. Adding a fourth buyer is professional growth.
**Prompt variant (`knivesTalenTriple`) (RU):** Ваше Величество, я слышал, вы уже наняли меня лгать трём коронам. Добавить четвёртого покупателя — профессиональный рост.

**Prompt variant (`heirAshfordMarriage`) (EN):** Your Majesty, Ashford is buyer one. She does not like competition.
**Prompt variant (`heirAshfordMarriage`) (RU):** Ваше Величество, Эшфорд — покупатель номер один. Ей не нравится конкуренция.

---

### Beat 4 — Day 271

**Title (EN):** Nephew Sold North?
**Title (RU):** Племянник продан на север?
**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс
**Note (EN):** **Day 271** (not 268 — [Court Masked One](#beat-4--day-268--public-audience) owns 268). Callback [Northern](#the-northern-price-persistent-story), [Court Knox](#beat-1--day-248--foreign-offer).
**Note (RU):** **День 271** (не 268 — [Замаскированный Двора](#beat-4--day-268--public-audience) владеет 268). Обратная отсылка [Северному](#the-northern-price-persistent-story), [Ноксу Двора](#beat-1--day-248--foreign-offer).

#### Node 0

**Prompt (EN):** Your Majesty, Ingvar's clerks offer coin for a boy matching the nephew's description — alive, dead, or convincingly dead. I heard Talen's auction and Ashford's marriage plots. Sell the nephew north and buy peace, refuse and arm a legend, or fake a corpse and sell the fake seal twice.
**Prompt (RU):** Ваше Величество, писцы Ингвара предлагают монету за мальчика, соответствующего описанию племянника — живого, мёртвого или убедительно мёртвого. Я слышал аукцион Талена и брачные интриги Эшфорд. Продайте племянника на север и купите мир, откажите и вооружите легенду или подделайте труп и продайте фальшивую монету дважды.

**Prompt variant (`knivesKnoxOffer`) (EN):** Your Majesty, I heard you rented me abroad. Nephews are a side market. I diversify.
**Prompt variant (`knivesKnoxOffer`) (RU):** Ваше Величество, я слышал, вы сдали меня внаём за границу. Племянники — побочный рынок. Я диверсифицируюсь.

**Prompt variant (`northernTrust` ≤ −20) (EN):** Your Majesty, the north already hates you. Heirs are leverage with faces.
**Prompt variant (`northernTrust` ≤ −20) (RU):** Ваше Величество, север уже ненавидит вас. Наследники — рычаг с лицами.

---

### Beat 5 — Day 285

**Title (EN):** Birth Records
**Title (RU):** Записи о рождении
**Character (EN):** Royal Scribe Osric
**Character (RU):** Королевский писарь Осрик
**Note (EN):** One day before [Court Borvin day 286](#beat-7--day-286--ledger-leaks). Callback [Court Osric day 262](#beat-3--day-262--forged-decrees), Household ghost signatures.
**Note (RU):** За день до [Борвина Двора дня 286](#beat-7--day-286--ledger-leaks). Обратная отсылка [Осрику Двора дня 262](#beat-3--day-262--forged-decrees), призрачным подписям Двора.

#### Node 0

**Prompt (EN):** Your Majesty, birth records disagree — Edwin's nephew born in spring, summer, or not at all. I heard Knox sold north, Talen sold coordinates, Ashford sold marriage. Forge records proving nephew bastard, restore Edwin's original line, or burn the archive and let fog win.
**Prompt (RU):** Ваше Величество, записи о рождении расходятся — племянник Эдвина рождён весной, летом или вовсе не рождён. Я слышал, Нокс продал на север, Тален — координаты, Эшфорд — брак. Подделайте записи, доказывающие незаконнорождённость племянника, восстановите первоначальную линию Эдвина или сожгите архив и пусть победит туман.

**Prompt variant (`knivesOsricfake seal`) (EN):** Your Majesty, I heard decrees already lie. Birth is merely decrees with crying.
**Prompt variant (`knivesOsricfake seal`) (RU):** Ваше Величество, я слышал, указы уже лгут. Рождение — лишь указы с плачем.

**Prompt variant (`heirKnoxNorth`) (EN):** Your Majesty, I heard the north wants a boy. Records are how they justify the invoice.
**Prompt variant (`heirKnoxNorth`) (RU):** Ваше Величество, я слышал, север хочет мальчика. Записи — как они оправдывают счёт.

---

### Beat 6 — Day 298

**Title (EN):** Two Succession Chapters
**Title (RU):** Две главы престолонаследия
**Character (EN):** Chronicler Ilana
**Character (RU):** Летописец Илана
**Note (EN):** Between [Court Talen day 292](#beat-8--day-292--three-crowns) and [Court Varn day 304](#beat-9--day-304--guard-purge). Callback [Court Ilana day 276](#beat-6--day-276--history-for-sale).
**Note (RU):** Между [Таленом Двора дня 292](#beat-8--day-292--three-crowns) и [Варном Двора дня 304](#beat-9--day-304--guard-purge). Обратная отсылка [Илане Двора дня 276](#beat-6--day-276--history-for-sale).

#### Node 0

**Prompt (EN):** Your Majesty, I write two succession chapters — yours by blade, his by blood. I heard forged births, northern bids, and masks in council. Publish the nephew chapter and split the realm, publish yours only and call him myth, or publish both and let the realm choose its headache.
**Prompt (RU):** Ваше Величество, я пишу две главы престолонаследия — вашу по клинку, его по крови. Я слышала поддельные рождения, северные ставки и маски в совете. Опубликуйте главу племянника и расколите королевство, опубликуйте только вашу и назовите его мифом или опубликуйте обе и пусть королевство выберет свою головную боль.

**Prompt variant (`heirOsricBirthForge`) (EN):** Your Majesty, I heard you forged bastardy. My chapter can match — or contradict. Contradiction pays better.
**Prompt variant (`heirOsricBirthForge`) (RU):** Ваше Величество, я слышала, вы подделали незаконнорождённость. Моя глава может совпасть — или противоречить. Противоречие платит лучше.

**Prompt variant (`heirIlanaDualChapter` false + high credibility) (EN):** Your Majesty, the boy gains verbs in my draft whether you approve or not.
**Prompt variant (`heirIlanaDualChapter` false + high credibility) (RU):** 

**Prompt variant (`heirIlanaDualChapter` false + высокая достоверность) (EN):** 
**Prompt variant (`heirIlanaDualChapter` false + высокая достоверность) (RU):** Ваше Величество, мальчик обретает глаголы в моём черновике, одобряете вы или нет.

---

### Beat 7 — Day 310

**Title (EN):** Northern Princes Want the Heir
**Title (RU):** Северные князья хотят наследника
**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар
**Note (EN):** Between [Court finale day 315](#beat-10--day-315--verdict-on-trust) preview era and Succession unlock (320). Callback [Northern](#the-northern-price-persistent-story).
**Note (RU):** Между эпохой [финала Двора дня 315](#beat-10--day-315--verdict-on-trust) и разблокировкой Succession (320). Обратная отсылка [Северному](#the-northern-price-persistent-story).

#### Node 0

**Prompt (EN):** Your Majesty, the northern princes want Edwin's nephew — as hostage, heir, or saint. I heard Knox sold coordinates, Ilana published chapters, Osric forged births. Surrender the boy for alliance, deny him and fight spring, or offer your own succession story and dare them to call it lie.
**Prompt (RU):** Ваше Величество, северные князья хотят племянника Эдвина — как заложника, наследника или святого. Я слышал, Нокс продал координаты, Илана опубликовала главы, Осрик подделал рождения. Сдайте мальчика за союз, отвергните и сражайтесь весной или предложите свою историю престолонаследия и бросьте вызов, назовут ли это ложью.

**Prompt variant (`heirKnoxNorth`) (EN):** Your Majesty, I heard you already sold him once. We call that a down payment.
**Prompt variant (`heirKnoxNorth`) (RU):** Ваше Величество, я слышал, вы уже продали его раз. Мы зовём это первым взносом.

**Prompt variant (`heirTalenBuyers` exposed) (EN):** Your Majesty, Talen's auction reached our ports before your heralds.
**Prompt variant (`heirTalenBuyers` exposed) (RU):** 

**Prompt variant (`heirTalenBuyers` разоблачён) (EN):** 
**Prompt variant (`heirTalenBuyers` разоблачён) (RU):** Ваше Величество, аукцион Талена дошёл до наших портов раньше ваших глашатаев.

---

### Beat 8 — Day 322

**Title (EN):** Unmasking
**Title (RU):** Снятие маски
**Character (EN):** The Masked One
**Character (RU):** Замаскированный
**Note (EN):** Two days after Succession unlock (320). Two days after [Star Chamber finale day 318](#beat-7--day-318--verdict-before-succession). **Interactive beat** — player choices set `heirUnmasked` and `heirIdentity`. Does not pick final outcome (finale day 328 computes that).
**Note (RU):** Через два дня после разблокировки Succession (320). Через два дня после [финала Звёздной палаты дня 318](#beat-7--day-318--verdict-before-succession). **Интерактивный эпизод** — выборы игрока устанавливают `heirUnmasked` и `heirIdentity`. Не выбирает финальный итог (финал дня 328 вычисляет его).

#### Node 0

**Prompt (EN):** Your Majesty, the mask comes off because stories must end or explode. I heard chapters, fake seals, northern bids, and your reign measured in fog. I may be Edwin's nephew, Ashford's pawn, a merchant's son, or a mask Knox wears for profit. Demand truth publicly, accept private answer, or declare the mask itself the only heir that matters.
**Prompt (RU):** Ваше Величество, маска снимается, потому что истории должны кончиться или взорваться. Я слышал главы, фальшивые монеты, северные ставки и ваше правление, измеренное туманом. Я могу быть племянником Эдвина, пешкой Эшфорд, сыном купца или маской, которую носит Нокс ради прибыли. Потребуйте правду публично, примите частный ответ или объявите, что сама маска — единственный наследник, который имеет значение.

**Prompt variant (`knivesMaskedAudience`) (EN):** Your Majesty, I heard you granted me council once. Unmasking is payment due.
**Prompt variant (`knivesMaskedAudience`) (RU):** Ваше Величество, я слышал, вы однажды дали мне совет. Снятие маски — плата по счёту.

**Prompt variant (`heirAshfordMarriage`) (EN):** Your Majesty, Ashford prays I am her pawn. Prayers are not policy. You will see.
**Prompt variant (`heirAshfordMarriage`) (RU):** Ваше Величество, Эшфорд молится, чтобы я был её пешкой. Молитвы — не политика. Вы увидите.

**Choice 1**
- **Choice (EN):** Public unmasking — square sees the face
- **Choice (RU):** Публичное снятие маски — площадь видит лицо
- **Response (EN):** Then the realm gasps collectively. Useful sound. Dangerous sound.
- **Response (RU):** Тогда королевство коллективно ахнет. Полезный звук. Опасный звук.
- **Effects:** Succession -15, Loyalty +10, People +8
- **Sets flag: `heirUnmasked`**
- **Устанавливает флаг: `heirUnmasked`**

**Choice 2**
- **Choice (EN):** Private answer — crown learns first
- **Choice (RU):** Частный ответ — корона узнаёт первой
- **Response (EN):** Then you carry truth alone awhile. Heavier than crowns. Lighter than mobs.
- **Response (RU):** Тогда вы несёте правду одни какое-то время. Тяжелее корон. Легче толп.
- **Effects:** Succession +5, Loyalty +6, Treasury -8
- **Sets flag: `heirUnmasked`**
- **Устанавливает флаг: `heirUnmasked`**

---

### Beat 9 — Day 328

**Title (EN):** lawful right to rule Finale
**Title (RU):** Финал легитимности
**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** Arc finale. Eight days after Succession unlock (320). **On load:** run [day 328 outcome priority](#nephew-in-the-fog--beat-resolution-rules) → `heirOutcome`, `heirArcPhase = resolved`.
**Note (RU):** Финал арки. Через восемь дней после разблокировки Succession (320). **При загрузке:** выполнить [приоритет итога дня 328](#nephew-in-the-fog--beat-resolution-rules) → `heirOutcome`, `heirArcPhase = resolved`.

#### Node 0

**Prompt (outcome `nephew_dead`) (EN):** Your Majesty, ninety-four days since a mask named Edwin's nephew — and the boy is dead on paper, in fact, or convincingly enough. I heard hunts, fake seals, northern bids, and Ashford's insurance. Nephew dead. Your line stands on blade and ledger. Guard it — fog has cousins.
**Prompt (outcome `nephew_dead`) (RU):** 

**Prompt (outcome `nephew_crowned`) (EN):** Your Majesty, I heard the mask was blood, the chapters were true, and the realm prefers birth to blade. The nephew lives and the throne moves. Nephew crowned — **your reign ends here** at implementation. I write the last page you will authorize.
**Prompt (outcome `nephew_crowned`) (RU):** 

**Prompt (outcome `nephew_exiled`) (EN):** Your Majesty, I heard the north bought a boy and you bought spring. Nephew exiled — alive, elsewhere, hungry for your mistakes. Peace today. Story tomorrow.
**Prompt (outcome `nephew_exiled`) (RU):** 

**Prompt (outcome `king who took the throne_made lawful`) (EN):** Your Majesty, I heard marriage, forged bastardy, or fog too thick to cut. The realm accepts your story — not Edwin's line, not Ashford's pawn, **you**. The king who took the throne, made lawful. Rare. Costly. Yours.
**Prompt (outcome `king who took the throne_made lawful`) (RU):** 

**Prompt (итог `nephew_dead`) (EN):** 
**Prompt (итог `nephew_dead`) (RU):** Ваше Величество, девяносто четыре дня с тех пор, как маска назвала племянника Эдвина — и мальчик мёртв на бумаге, на деле или достаточно убедительно. Я слышал охоты, фальшивые монеты, северные ставки и страховку Эшфорд. Племянник мёртв. Ваша линия стоит на клинке и книге. Охраняйте её — у тумана есть двоюродные братья.

**Prompt (итог `nephew_crowned`) (EN):** 
**Prompt (итог `nephew_crowned`) (RU):** Ваше Величество, я слышал, маска была кровью, главы — правдой, и королевство предпочитает рождение клинку. Племянник жив, и трон движется. Племянник коронован — **ваше правление кончается здесь** при реализации. Я пишу последнюю страницу, которую вы санкционируете.

**Prompt (итог `nephew_exiled`) (EN):** 
**Prompt (итог `nephew_exiled`) (RU):** Ваше Величество, я слышал, север купил мальчика, а вы купили весну. Племянник изгнан — жив, в другом месте, голоден по вашим ошибкам. Мир сегодня. История завтра.

**Prompt (итог `king who took the throne_made lawful`) (EN):** 
**Prompt (итог `king who took the throne_made lawful`) (RU):** Ваше Величество, я слышал брак, поддельное незаконнорождёние или туман слишком густ, чтобы разрезать. Королевство принимает вашу историю — не линию Эдвина, не пешку Эшфорд, **вас**. Узурпатор легитимизирован. Редко. Дорого. Ваше.

**Choice 1**
- **Choice (EN):** I have heard the line — dismiss the succession court
- **Choice (RU):** Я услышал линию — распустить суд престолонаследия
- **Response (EN):** Then I write *survivor* and close the nephew ledger.
- **Response (RU):** Тогда я напишу *выживший* и закрою книгу племянника.
- **Effects:** Succession +15, Loyalty +8, Army +5

---

### Beat 10 — Day 335

**Title (EN):** Omen on the True Line (coda)
**Title (RU):** Знамение об истинной линии (кода)
**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк
**Note (EN):** **Coda** after [finale day 328](#beat-9--day-328--lawful right to rule-finale). `heirArcPhase` already `resolved`. Does **not** change `heirOutcome`. Cross-callback [Prophet day 325](#beat-6--day-325--the-last-sign). Ten days before [Grey Lung day 340](#beat-8--day-340--historical-verdict-outcome-cured).
**Note (RU):** **Кода** после [финала дня 328](#beat-9--day-328--lawful right to rule-finale). `heirArcPhase` уже `resolved`. **Не** меняет `heirOutcome`. Перекрёстная отсылка [Пророку дня 325](#beat-6--day-325--the-last-sign). За десять дней до [Серого кашля дня 340](#beat-8--day-340--historical-verdict-outcome-cured).

#### Node 0

**Prompt (heirOutcome `nephew_dead`) (EN):** Your Majesty, winter ends and the true line sleeps in earth or ink. I heard you killed a boy, a myth, or both. My last succession omen is short: **the chair eats names**. Yours remains — for now.
**Prompt (heirOutcome `nephew_dead`) (RU):** 

**Prompt (heirOutcome `nephew_crowned`) (EN):** *(Should not fire — game over on day 328. Edge case: Prophet mocks empty throne.)*
**Prompt (heirOutcome `nephew_crowned`) (RU):** 

**Prompt (heirOutcome `nephew_exiled`) (EN):** Your Majesty, I heard the nephew walks northern snow. Exile is a kind of crown — cold, far, patient. The true line breathes where you cannot reach.
**Prompt (heirOutcome `nephew_exiled`) (RU):** 

**Prompt (heirOutcome `king who took the throne_made lawful`) (EN):** Your Majesty, I heard the realm chose your story over Edwin's blood. Your right to rule is a sermon the living preach. My omen: **the king who took the throne becomes dynasty** — if you survive the next winter.
**Prompt (heirOutcome `king who took the throne_made lawful`) (RU):** 

**Prompt (итог `nephew_dead`) (EN):** 
**Prompt (итог `nephew_dead`) (RU):** Ваше Величество, зима кончается, и истинная линия спит в земле или чернилах. Я слышал, вы убили мальчика, миф или обоих. Моё последнее знамение престолонаследия коротко: **стул пожирает имена**. Ваше остаётся — пока.

**Prompt (итог `nephew_crowned`) (EN):** 
**Prompt (итог `nephew_crowned`) (RU):** *(Не должно срабатывать — game over на день 328. Крайний случай: Пророк насмехается над пустым троном.)*

**Prompt (итог `nephew_exiled`) (EN):** 
**Prompt (итог `nephew_exiled`) (RU):** Ваше Величество, я слышал, племянник идёт по северному снегу. Изгнание — вид короны — холодный, далёкий, терпеливый. Истинная линия дышит там, куда вы не достанете.

**Prompt (итог `king who took the throne_made lawful`) (EN):** 
**Prompt (итог `king who took the throne_made lawful`) (RU):** Ваше Величество, я слышал, королевство выбрало вашу историю вместо крови Эдвина. Законное право править — проповедь, которую живые читают. Моё знамение: **тот, кто взял трон становится династией** — если переживёте следующую зиму.

**Choice 1**
- **Choice (EN):** I have heard the omen — let the prophet go
- **Choice (RU):** Я услышал знамение — отпустить пророка
- **Response (EN):** Then fog closes. Spring opens other ledgers.
- **Response (RU):** Тогда туман смыкается. Весна открывает другие книги.
- **Effects:** Church -4, Loyalty +3

---

## The Prophet's Winter (wildcard / cross-arc)
## Зимний пророк (wildcard / перекрёстная арка)

### Beat 1 — Day 62

**Title (EN):** The First Frost
**Title (RU):** Первый мороз
**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк
**Note (EN):** Opens arc. Fires after [Empty Purse](#the-empty-purse-persistent-story) mid-run and [Household](#the-old-kings-household-persistent-story) beat 8 (day 58). Church arc active (day 30+). Sets `prophetArcPhase = active`, `prophetFirstHeard`.
**Note (RU):** Открывает арку. Срабатывает после середины [Пустой казны](#the-empty-purse-persistent-story) и [Двора](#the-old-kings-household-persistent-story) эпизода 8 (день 58). Арка Церкви активна (день 30+). Устанавливает `prophetArcPhase = active`, `prophetFirstHeard`.

#### Node 0

**Prompt (EN):** Your Majesty, I have no name because names are for men who die once. I have a winter — three frosts, three kings, one throne. I heard a blade gave you Edwin's chair while his household still breathes. I heard Malrik still chooses whether heaven knows your face. The market wants a sign. Do you silence me, hear me, or sell me to the Church?
**Prompt (RU):** Ваше Величество, у меня нет имени, потому что имена для людей, умирающих раз. У меня есть зима — три мороза, три короля, один трон. Я слышал, клинок дал вам стул Эдвина, пока его двор ещё дышал. Я слышал, Малрик всё ещё решает налоговую категорию вашей души. Рынок хочет знак. Заглушите меня, выслушайте или продайте Церкви?

**Prompt variant (`churchArcStance = defy`) (EN):** Your Majesty, I heard you told Malrik the crown needs no sermon. Winter does not ask permission either. The poor already listen to me because the cathedral listens to you with knives.
**Prompt variant (`churchArcStance = defy`) (RU):** Ваше Величество, я слышал, вы сказали Малрику, что короне не нужна проповедь. Зима тоже не спрашивает разрешения. Бедные уже слушают меня, потому что собор слушает вас с ножами.

**Prompt variant (`householdStance = purge`) (EN):** Your Majesty, I heard you purged Edwin's ghosts from kitchen and yard. Ghosts are cheap in winter. Prophets are cheaper. Hang me and the rhyme survives.
**Prompt variant (`householdStance = purge`) (RU):** Ваше Величество, я слышал, вы вычистили призраков Эдвина с кухни и двора. Призраки дешёвы зимой. Пророки дешевле. Повесьте меня — и рифма выживет.

**Prompt variant (`emptyPurseCrisis`) (EN):** Your Majesty, I heard your purse rattles before your sword does. Men who cannot pay soldiers buy omens instead. I am affordable.
**Prompt variant (`emptyPurseCrisis`) (RU):** Ваше Величество, я слышал, ваша казна звенит раньше меча. Люди, не способные платить солдатам, покупают знамения вместо. Я доступен.

---

### Beat 3 — Day 140

**Title (EN):** The Absurd Miracle
**Title (RU):** Абсурдное чудо
**Character (EN):** Saint Fox
**Character (RU):** Святой Лис
**Note (EN):** **Saint Fox** speaks (via handler or possessed peasant — implementation choice; prompt is in-character). Absurd miracle competes with Malrik. Day after Grey Lung fallout (130), before Northern mid-year heat. [Inquisitor Cyrus](#beat-2--day-35--the-holy-inquiry) may appear in response text only.
**Note (RU):** **Святой Лис** говорит (через посредника или одержимого крестьянина — выбор реализации; реплика в характере). Абсурдное чудо конкурирует с Малриком. День после последствий Серого кашля (130), до середины года Северного. [Инквизитор Сайрус](#beat-2--day-35--the-holy-inquiry) может появиться только в тексте ответа.

#### Node 0

**Prompt (EN):** Your Majesty, the fox appeared on three legs and left on four. I am the voice it borrowed — ridiculous, yes. The lame walked in the lower market yesterday. Malrik calls it mockery. The people call it hope with a tail. Crown the fox, crown the Church, or crown your common sense and deny us all.
**Prompt (RU):** Ваше Величество, лис появился на трёх ногах и ушёл на четырёх. Я — голос, который он одолжил — смешной, да. Вчера в нижнем рынке хромые ходили. Малрик зовёт это насмешкой. Народ зовёт надеждой с хвостом. Коронуйте лиса, коронуйте Церковь или коронуйте здравый смысл и отвергните нас всех.

**Prompt variant (`prophetFirstHeard` + favor ≥ 10) (EN):** Your Majesty, I heard you let the Nameless Prophet speak in winter. Now a fox out-preaches him. That is comedy — until it is politics.
**Prompt variant (`prophetFirstHeard` + favor ≥ 10) (RU):** Ваше Величество, я слышал, вы позволили Безымянному Пророку говорить зимой. Теперь лис перепроповедует его. Это комедия — пока не политика.

**Prompt variant (`churchArcStance = submit` or `churchOutcome` blessed by the church) (EN):** Your Majesty, I heard you knelt for Malrik. The fox does not kneel. The mob prefers fur to incense today.
**Prompt variant (`churchArcStance = submit` or `churchOutcome` blessed by the church) (RU):** 

**Prompt variant (`churchArcStance = submit` или `churchOutcome` blessed by the church) (EN):** 
**Prompt variant (`churchArcStance = submit` или `churchOutcome` blessed by the church) (RU):** Ваше Величество, я слышал, вы преклонились перед Малриком. Лис не преклоняется. Толпа сегодня предпочитает мех ладану.

---

### Beat 4 — Day 187

**Title (EN):** Ashford's Shadow
**Title (RU):** Тень Эшфорд
**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк
**Note (EN):** Ten days after [Great Houses](#the-great-houses-persistent-story) mid-arc (day 175–185). **Deferred from day 185** when Great Houses beat 9 fires. Callbacks `housesDeadCount`, `housesAlive*`, northern policy. **People** and **Nobility** effects allowed.
**Note (RU):** Через десять дней после середины [Великих домов](#the-great-houses-persistent-story) (день 175–185). **Отложен с дня 185**, когда срабатывает эпизод 9 Великих домов. Обратные отсылки `housesDeadCount`, `housesAlive*`, северная политика. Эффекты **People** и **Nobility** разрешены.

#### Node 0

**Prompt (EN):** Your Majesty, Lady Ashford measured your throat and the great houses took notes — I heard Kaspar accuse, Dell shriek, Crow bid, Raymond march, and Goose honk before the scaffold even warmed. I prophesy a house that bowed in public and plots in linen — or plots in the grave. Name the liar, or name yourself — winter returns either way.
**Prompt (RU):** Ваше Величество, леди Эшфорд измерила ваше горло, и великие дома делали заметки — я слышал, Каспар обвиняет, Делл визжит, Кроу торгуется, Раймонд марширует, а Гусь кричит, пока плаха даже не прогрелась. Я пророчу дом, склонившийся публично и интригующий в полотне — или интригующий в могиле. Назовите лжеца — или назовите себя — зима вернётся в любом случае.

**Prompt variant (`housesDeadCount` ≥ 1) (EN):** Your Majesty, I heard Morwen's rope found work. The living hate the living more efficiently when the dead are recent. I will rhyme their names in the market unless you buy silence.
**Prompt variant (`housesDeadCount` ≥ 1) (RU):** Ваше Величество, я слышал, петля Морвен нашла работу. Живые ненавидят живых эффективнее, когда мёртвые свежи. Я рифмую их имена на рынке, если не купите молчание.

**Prompt variant (`housesAliveAshford = false`) (EN):** Your Majesty, I heard Ashford fell in the dark. The east is a knife without a handle. Prophecy loves such moments.
**Prompt variant (`housesAliveAshford = false`) (RU):** Ваше Величество, я слышал, Эшфорд пала во тьме. Восток — нож без рукояти. Пророчество любит такие моменты.

**Prompt variant (`northernAllianceSigned`) (EN):** Your Majesty, I heard you signed Ingvar's charter. Ashford heard *foreign king* — when she still breathed. I will put that rhyme in every tavern unless you give me a better one.
**Prompt variant (`northernAllianceSigned`) (RU):** Ваше Величество, я слышал, вы подписали хартию Ингвара. Эшфорд услышала *иностранный король* — пока ещё дышала. Я положу эту рифму в каждую таверну, если не дадите лучшую.

---

### Beat 5 — Day 265

**Title (EN):** The Knife in the Sermon
**Title (RU):** Нож в проповеди
**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк
**Note (EN):** Five days after Loyalty unlock (day 260). Foreshadows [Spy Knox day 278](#beat-15--day-278--leaks-to-the-north). Callbacks `northernTrust`, Knox, empty purse guard loyalty.
**Note (RU):** Через пять дней после разблокировки Loyalty (день 260). Предвосхищает [Нокса дня 278](#beat-15--day-278--leaks-to-the-north). Обратные отсылки `northernTrust`, Нокс, верность стражи Пустой казны.

#### Node 0

**Prompt (EN):** Your Majesty, Loyalty is no longer a sermon — it is arithmetic. I heard Ingvar's gold and Knox's nets in the same sentence last month. I prophesy the knife that buys you dawn and the kiss that sells your maps. Do you hang the prophet who names traitors, or hang the traitors he names?
**Prompt (RU):** Ваше Величество, Loyalty больше не проповедь — это арифметика. Я слышал золото Ингвара и сети Нокса в одном предложении в прошлом месяце. Я пророчу нож, покупающий вам рассвет, и поцелуй, продающий ваши карты. Повесите пророка, называющего предателей, или повесьте предателей, которых он называет?

**Prompt variant (`northernTrust` ≤ −20) (EN):** Your Majesty, I heard the north owns your whispers. Prophecy is cheaper than spies. I offer both. Payment optional.
**Prompt variant (`northernTrust` ≤ −20) (RU):** Ваше Величество, я слышал, север владеет вашими шёпотами. Пророчество дешевле шпионов. Я предлагаю оба. Оплата необязательна.

**Prompt variant (`emptyPurseOutcome = ghost_army` or `mercenary_throne`) (EN):** Your Majesty, I heard you paid mercenaries before household guards. Men who sell swords sell secrets. I name no names — yet.
**Prompt variant (`emptyPurseOutcome = ghost_army` or `mercenary_throne`) (RU):** 

**Prompt variant (`prophetSilenced` without lift) (EN):** Your Majesty, you tried to silence winter. Winter remembered. I name Knox anyway.
**Prompt variant (`prophetSilenced` without lift) (RU):** 

**Prompt variant (`emptyPurseOutcome = ghost_army` или `mercenary_throne`) (EN):** 
**Prompt variant (`emptyPurseOutcome = ghost_army` или `mercenary_throne`) (RU):** Ваше Величество, я слышал, вы платили наёмникам раньше дворцовой стражи. Продающие мечи продают секреты. Имён не называю — пока.

**Prompt variant (`prophetSilenced` без снятия) (EN):** 
**Prompt variant (`prophetSilenced` без снятия) (RU):** Ваше Величество, вы пытались заглушить зиму. Зима помнила. Я называю Нокса в любом случае.

---

### Beat 6 — Day 325

**Title (EN):** The Last Sign
**Title (RU):** Последний знак
**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк
**Note (EN):** Five days after Succession unlock (day 320). Arc finale. **On load:** run [day 325 outcome priority](#prophets-winter--beat-resolution-rules) → `prophetOutcome`, `prophetArcPhase = resolved`. Prophet **reports** how the realm names your winter — player does not pick the ending. Northern finale is day 350.
**Note (RU):** Через пять дней после разблокировки Succession (день 320). Финал арки. **При загрузке:** выполнить [приоритет итога дня 325](#prophets-winter--beat-resolution-rules) → `prophetOutcome`, `prophetArcPhase = resolved`. Пророк **докладывает**, как королевство называет вашу зиму — игрок не выбирает финал. Северный финал — день 350.

#### Node 0

**Prompt (outcome `voice_of_winter`) (EN):** Your Majesty, three hundred and twenty-five days since a blade made you king and winter made me your shadow. The streets call you the Winter King — not for cruelty, for listening. Malrik calls it heresy. The people call it the first honest reign. You crowned the omen. History will rhyme your name.
**Prompt (outcome `voice_of_winter`) (RU):** 

**Prompt (outcome `silenced_seer`) (EN):** Your Majesty, I heard ash and edicts where sermons once walked. The prophets go quiet. So do some hearts. You buried superstition — or tried. Order remains. Wonder does not.
**Prompt (outcome `silenced_seer`) (RU):** 

**Prompt (outcome `saint_and_fox`) (EN):** Your Majesty, the fox still has shrines. You still have a crown. One of us will survive the chronicles. You chose absurd policy — therefore memorable. The court laughs. The provinces pray. Both serve you poorly and well.
**Prompt (outcome `saint_and_fox`) (RU):** 

**Prompt (outcome `omen_throne`) (EN):** Your Majesty, I heard you fought every omen until the realm learned fear. Fear keeps thrones — until it doesn't. You declared yourself the sign. Ashford pales. Malrik roars. A nephew in exile might pray. Bold insult to the sacred is still insult to the sacred.
**Prompt (outcome `omen_throne`) (RU):** 

**Prompt (outcome `ignored_winter`) (EN):** Your Majesty, I leave unnamed. Winter ends. What you built remains — for Ingvar to count on day three-fifty. Neither faith nor purge. The omen walks into spring without crown or scaffold.
**Prompt (outcome `ignored_winter`) (RU):** 

**Prompt (итог `voice_of_winter`) (EN):** 
**Prompt (итог `voice_of_winter`) (RU):** Ваше Величество, триста двадцать пять дней с тех пор, как клинок сделал вас королём, а зима — моей тенью. Улицы зовут вас Зимним королём — не за жестокость, за слушание. Малрик зовёт ересью. Народ зовёт первым честным правлением. Вы короновали знамение. История рифмует ваше имя.

**Prompt (итог `silenced_seer`) (EN):** 
**Prompt (итог `silenced_seer`) (RU):** Ваше Величество, я слышал пепел и указы там, где ходили проповеди. Пророки замолкают. Некоторые сердца тоже. Вы похоронили суеверие — или пытались. Порядок остаётся. Чудо — нет.

**Prompt (итог `saint_and_fox`) (EN):** 
**Prompt (итог `saint_and_fox`) (RU):** Ваше Величество, у лиса всё ещё святыни. У вас всё ещё корона. Один из нас переживёт летописи. Вы выбрали абсурдную политику — следовательно, запоминающуюся. Двор смеётся. Провинции молятся. Оба служат вам плохо и хорошо.

**Prompt (итог `omen_throne`) (EN):** 
**Prompt (итог `omen_throne`) (RU):** Ваше Величество, я слышал, вы боролись с каждым знамением, пока королевство не научилось страху. Страх держит троны — пока не перестаёт. Вы объявили себя знаком. Эшфорд бледнеет. Малрик рычит. Изгнанный племянник может молиться. Смелое богохульство всё ещё богохульство.

**Prompt (итог `ignored_winter`) (EN):** 
**Prompt (итог `ignored_winter`) (RU):** Ваше Величество, я ухожу безымянным. Зима кончается. То, что вы построили, остаётся — для Ингвара, чтобы считать к дню триста пятидесятому. Ни вера, ни чистка. Знамение уходит в весну без короны и плахи.

**Choice 1**
- **Choice (EN):** I have heard the last sign — let the prophet go
- **Choice (RU):** Я услышал последний знак — отпустить пророка
- **Response (EN):** Then rule sermons and steel. Malrik will cast out from church the year. The people will remember rhymes.
- **Response (RU):** Тогда правите проповедями и сталью. Малрик отвернёт от церкви год. Народ запомнит рифмы.
- **Effects:** Church -20, Loyalty +15, Succession -8, People +12

---

## Grey Lung Cure Arc (persistent story)
## Арка «Серый кашель» (длящаяся история)

### Beat 1 — Day 25

**Title (EN):** The Proposal
**Title (RU):** Предложение
**Character (EN):** Healer Mira
**Character (RU):** Целительница Мира
**Note (EN):** Replaces random encounter on day 25. Starts the Grey Lung arc (`plagueArcPhase = active`).
**Note (RU):** Заменяет случайную встречу день 25. Начинает арку Серого кашля (`plagueArcPhase = active`).

#### Node 0

**Prompt (EN):** Your Majesty, Grey Lung has returned in the southern ports — the same fever that hollowed Estedor under King Edwin. I have a physic's formula from the eastern courts: distilled willow bark, sulfur smoke, and a tincture that breaks the lung-cough. My apprentices can brew it within the month, but I need the crown's gold and your word that no priest will burn my stills as witchcraft.
**Prompt (RU):** Ваше Величество, Серый кашель вернулся в южных портах — та же лихорадка, что опустошила Эстедор при короле Эдвине. У меня есть формула физика из восточных дворов: дистиллированная ивовая кора, серный дым и настойка, прерывающая лёгочный кашель. Мои ученики сварят её в течение месяца, но мне нужны золото короны и ваше слово, что ни один священник не сожжёт мои перегонные кубы как колдовство.

**Choice 1**
- **Choice (EN):** Fund the cure in full
- **Choice (RU):** Финансировать лечение полностью
- **Response (EN):** Then let the realm see a king who spends on breath, not banners. I will begin the distilleries tonight.
- **Response (RU):** Тогда пусть королевство увидит короля, тратящего на дыхание, а не на знамёна. Я начну перегонные кубы сегодня ночью.
- **Effects:** Treasury -22, Health +8, Loyalty +3

**Choice 2**
- **Choice (EN):** Fund half — prove it works first
- **Choice (RU):** Финансировать наполовину — сначала доказать, что работает
- **Response (EN):** Half buys half a chance. I will not let the sick wait for your caution, but I will try.
- **Response (RU):** Половина покупает полшанса. Я не позволю больным ждать вашей осторожности, но попробую.
- **Effects:** Treasury -12, Health +4

**Choice 3**
- **Choice (EN):** The treasury cannot spare it
- **Choice (RU):** Казна не может позволить
- **Response (EN):** Then prepare your coffers for funeral candles instead of soldiers. I will do what I can without your coin.
- **Response (RU):** Тогда готовьте казну к похоронным свечам вместо солдат. Я сделаю, что смогу, без вашей монеты.
- **Effects:** Church +5, Health -6, Loyalty -4

**Choice 4**
- **Choice (EN):** Return in two weeks
- **Choice (RU):** Вернуться через две недели
- **Response (EN):** Two weeks is a thousand coughs. I will count them for you, Majesty.
- **Response (RU):** Две недели — тысяча кашлей. Я посчитаю их для вас, Величество.
- **Effects:** Loyalty -2

---

### Beat 2 — Day 38

**Title (EN):** First Results (deferred: `deferred`)
**Title (RU):** Первые результаты (отложено: `deferred`)
**Character (EN):** Healer Mira
**Character (RU):** Целительница Мира
**Note (EN):** Shown when `plagueFundingPath` is `deferred`. If Treasury ≥ 60, offers Beat 1 choices at Loyalty -3 penalty. If Treasury < 60, uses declined-branch text above.
**Note (RU):** Показывается, когда `plagueFundingPath` — `deferred`. Если Treasury ≥ 60, предлагает выборы Эпизода 1 со штрафом Loyalty -3. Если Treasury < 60, использует текст ветки отказа выше.

#### Node 0

**Prompt (EN):** Your Majesty, you asked for two weeks. I gave them. Twenty-seven dead in the lower wards while your treasurer counted coins. I am back — not to plead, but to learn whether a king who took the throne can afford to save the realm he seized, or whether Estedor must burn twice.
**Prompt (RU):** Ваше Величество, вы просили две недели. Я дала. Двадцать семь мёртвых в нижних лазаретах, пока ваш казначей считал монеты. Я вернулась — не умолять, а узнать, может ли тот, кто взял трон позволить себе спасти королевство, которое захватил, или Эстедор должен гореть дважды.

**Choice 1**
- **Choice (EN):** Fund the cure in full — the wait is over
- **Choice (RU):** Финансировать лечение полностью — ожидание кончилось
- **Response (EN):** Then let the realm see a king who spends on breath, not banners. I will begin the distilleries tonight.
- **Response (RU):** Тогда пусть королевство увидит короля, тратящего на дыхание, а не на знамёна. Я начну перегонные кубы сегодня ночью.
- **Effects:** Treasury -22, Health +8, Loyalty +1

**Choice 2**
- **Choice (EN):** Fund half — prove it works first
- **Choice (RU):** Финансировать наполовину — сначала доказать, что работает
- **Response (EN):** Half buys half a chance. At least you did not make me wait a third week.
- **Response (RU):** Половина покупает полшанса. По крайней мере, вы не заставили меня ждать третью неделю.
- **Effects:** Treasury -12, Health +4, Loyalty -1

**Choice 3**
- **Choice (EN):** The treasury still cannot spare it
- **Choice (RU):** Казна всё ещё не может позволить
- **Response (EN):** Then prepare your coffers for funeral candles instead of soldiers.
- **Response (RU):** Тогда готовьте казну к похоронным свечам вместо солдат.
- **Effects:** Church +5, Health -6, Loyalty -6

---

### Beat 3 — Day 52

**Title (EN):** Holy Remedies (declined path)
**Title (RU):** Священные средства (путь отказа)
**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик
**Note (EN):** Shown when `plagueFundingPath` remains `declined` after Beat 2.
**Note (RU):** Показывается, когда `plagueFundingPath` остаётся `declined` после Эпизода 2.

#### Node 0

**Prompt (EN):** Your Majesty, you refused the physic and the fever climbs. My brothers offer what Mira cannot: relics, prayer, and holy water from the shrine of Saint Alaric. The people are frightened. If you will not buy eastern tinctures, will you at least let God try?
**Prompt (RU):** Ваше Величество, вы отказали физику, и лихорадка поднимается. Мои братья предлагают то, чего не может Мира: реликвии, молитву и святую воду из святыни святого Аларика. Народ напуган. Если не купите восточные настойки, позволите ли хотя бы Богу попробовать?

**Choice 1**
- **Choice (EN):** Accept holy remedies — we cannot afford physic
- **Choice (RU):** Принять священные средства — физик нам не по карману
- **Response (EN):** Then kneel with your subjects and pray. If the fever breaks, heaven receives the glory. If it does not, you will have no one left to blame.
- **Response (RU):** Тогда преклонитесь с подданными и молитесь. Если лихорадка сломается, небо получит славу. Если нет — винить будет некого.
- **Effects:** Church +18, Health -8

**Choice 2**
- **Choice (EN):** Mira's last offer — fund the cure or lose her
- **Choice (RU):** Последнее предложение Миры — финансировать лечение или потерять её
- **Response (EN):** A king who waits until the pyres smoke to buy mercy deserves the physic he refused. Fund her, or bury your pride with the dead.
- **Response (RU):** Король, ждущий, пока костры дымят, чтобы купить милосердие, заслуживает физика, которого отказал. Финансируйте её — или похороните гордость с мёртвыми.
- **Effects:** Treasury -20, Health +8, Church -5, Loyalty +4
- **Progress: 15 (late-reversal catch-up)**
- **Прогресс: 15 (догон при позднем развороте)**

---

### Beat 4 — Day 70

**Title (EN):** The Crisis (`church_route`)
**Title (RU):** Кризис (`church_route`)
**Character (EN):** Healer Mira
**Character (RU):** Целительница Мира
**Note (EN):** Shown when `plagueFundingPath` is `church_route` (any variant). Malrik's distribution is failing in some wards.
**Note (RU):** Показывается, когда `plagueFundingPath` — `church_route` (любой вариант). Распределение Малрика терпит неудачу в некоторых лазаретах.

#### Node 0

**Prompt (EN):** Your Majesty, the priests anoint the sick with holy water and call it cure. In two wards the coughing stopped. In four wards it worsened — because they were given blessed water instead of tincture. I will not stand in your chapel and call it fraud, but I will stand in your court and tell you: heaven is not brewing willow bark. Take the bottles back from Malrik, or bury more than sinners.
**Prompt (RU):** Ваше Величество, священники помазывают больных святой водой и зовут это лечением. В двух лазаретах кашель прекратился. В четырёх ухудшился — потому что дали благословённую воду вместо настойки. Я не стану в вашей часовне называть это мошенничеством, но в вашем дворе скажу: небо не варит ивовую кору. Верните бутыли от Малрика — или хороните больше, чем грешников.

**Choice 1**
- **Choice (EN):** Return the cure to the physic — secular wards only
- **Choice (RU):** Вернуть лечение физику — только светские лазареты
- **Response (EN):** Then let the priests keep their miracles and I will keep my patients. Choose who lives by fact, not by sermon.
- **Response (RU):** Тогда пусть священники хранят чудеса, а я — пациентов. Выбирайте, кто живёт по фактам, а не по проповеди.
- **Effects:** Church -15, Health +10, Loyalty +5

**Choice 2**
- **Choice (EN):** Double the Church's share — the faithful must believe
- **Choice (RU):** Удвоить долю Церкви — верующие должны верить
- **Response (EN):** Belief does not stop lung-cough. But it may stop riots. I wash my hands — you will need more than holy water for that.
- **Response (RU):** Вера не останавливает лёгочный кашель. Но может остановить бунты. Я омываю руки — вам понадобится больше святой воды для этого.
- **Effects:** Church +12, Health -8, Loyalty -5

---

### Beat 5 — Day 95

**Title (EN):** Resolution (outcome: `scandal`)
**Title (RU):** Разрешение (итог: `scandal`)
**Character (EN):** Plague Doctor Odo
**Character (RU):** Чумной доктор Одо
**Note (EN):** Shown when `plagueScandalFlag` is set (day 45 rival formula accepted). Takes priority over all other Beat 5 variants. **On load:** set `plagueOutcome = scandal`, `plagueArcPhase = resolved`. Odo **reports** the poisoned cure — one acknowledgment choice.
**Note (RU):** Показывается, когда установлен `plagueScandalFlag` (день 45 соперничающая формула принята). Имеет приоритет над всеми другими вариантами Эпизода 5. **При загрузке:** установить `plagueOutcome = scandal`, `plagueArcPhase = resolved`. Одо **докладывает** об отравленном лечении — один выбор подтверждения.

#### Node 0

**Prompt (EN):** Your Majesty, I warned you Mira's eastern tincture was not the only brew, nor the safest. Three wards took my mask-and-vinegar compound — the cough broke faster, but two men woke screaming and never slept again. The families knock with stones. The chronicles will call you the Mad King's Physic. I call you the king who chose haste.
**Prompt (RU):** Ваше Величество, я предупреждал, что восточная настойка Миры — не единственный отвар, ни самый безопасный. Три лазарета приняли мой состав маски и уксуса — кашель прервался быстрее, но двое мужчин проснулись крича и больше не спали. Семьи стучат камнями. Летописи назовут вас Физиком безумного короля. Я зову вас королём, выбравшим спешку.

---

### Beat 6 — Day 130

**Title (EN):** Political Fallout (outcome: `scandal`)
**Title (RU):** Политические последствия (итог: `scandal`)
**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин
**Note (EN):** After the mad-wards scandal — crown finances and reputation under scrutiny.
**Note (RU):** После скандала безумных лазаретов — финансы и репутация короны под пристальным взглядом.

#### Node 0

**Prompt (EN):** Your Majesty, the scandal wards cost you more than bottles of tincture. Families demand compensation, Odo's creditors demand answers, and my ledgers demand a king who can still count. The realm will pay for madness one way or another. How do you want your treasury to bleed?
**Prompt (RU):** Ваше Величество, скандальные лазареты стоили вам больше, чем бутыли настойки. Семьи требуют компенсации, кредиторы Одо — ответов, а мои книги — короля, всё ещё способного считать. Королевство заплатит за безумие одним способом или другим. Как хотите, чтобы кровоточила ваша казна?

**Choice 1**
- **Choice (EN):** Open the coffers — pay every family and close the scandal wards
- **Choice (RU):** Открыть сундуки — заплатить каждой семье и закрыть скандальные лазареты
- **Response (EN):** Expensive. Honest. The sort of choice that keeps a crown on your head — if anything still can.
- **Response (RU):** Дорого. Честно. Тот выбор, который держит корону на голове — если что-то ещё может.
- **Effects:** Treasury -25, Loyalty +8, Health +3

**Choice 2**
- **Choice (EN):** Fine Odo's estate and seize his stock
- **Choice (RU):** Оштрафовать имение Одо и конфисковать его запасы
- **Response (EN):** Blood from a stone, but stones crack. The families will call it justice. Odo will call it theft.
- **Response (RU):** Кровь из камня, но камни трескаются. Семьи назовут справедливостью. Одо — воровством.
- **Effects:** Treasury +12, Loyalty -6, Health -3

---

### Beat 7 — Day 200

**Title (EN):** The Echo (outcome: `slow_burn`)
**Title (RU):** Эхо (итог: `slow_burn`)
**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел
**Note (EN):** Memorial processions in the scarred provinces.
**Note (RU):** Поминальные процессии в израненных провинциях.

#### Node 0

**Prompt (EN):** Your Majesty, I feed the poor at my monastery gate. Lately they speak of Grey Lung more than bread. The fever faded, but the grief did not. They ask whether the king who took the throne who funded bottles will fund a name for their dead — or whether survival is the only mercy they will ever see.
**Prompt (RU):** Ваше Величество, я кормлю бедных у ворот моего монастыря. В последнее время они говорят о Сером кашле больше, чем о хлебе. Лихорадка угасла, но скорбь — нет. Они спрашивают, финансирует ли тот, кто взял трон, оплативший бутыли, имя для их мёртвых — или выживание — единственное милосердие, которое они увидят.

**Choice 1**
- **Choice (EN):** Fund provincial memorials — let the dead be named
- **Choice (RU):** Финансировать провинциальные мемориалы — пусть мёртвые будут названы
- **Response (EN):** Then I will read their names aloud at my gate. That is more than most thrones offer.
- **Response (RU):** Тогда я прочту их имена вслух у моих ворот. Это больше, чем предлагают большинство тронов.
- **Effects:** Treasury -12, Loyalty +10, People +5

**Choice 2**
- **Choice (EN):** Send Church prayers — Malrik's brothers will mourn for them
- **Choice (RU):** Послать церковные молитвы — братья Малрика помолятся за них
- **Response (EN):** Prayers cost less than stone. The hungry will know which you chose.
- **Response (RU):** Молитвы стоят меньше камня. Голодные узнают, что вы выбрали.
- **Effects:** Church +8, Loyalty -3

---

### Beat 8 — Day 340

**Title (EN):** Historical Verdict (outcome: `scandal`)
**Title (RU):** Исторический вердикт (итог: `scandal`)
**Character (EN):** Healer Mira
**Character (RU):** Целительница Мира
**Note (EN):** **On load:** use existing `plagueOutcome` (must be `scandal`). Sets nickname flag: *The Mad King's Physic*. Mira **reports** year-end legacy — one acknowledgment choice.
**Note (RU):** **При загрузке:** использовать существующий `plagueOutcome` (должен быть `scandal`). Устанавливает флаг прозвища: *Физик безумного короля*. Мира **докладывает** наследие конца года — один выбор подтверждения.

#### Node 0

**Prompt (EN):** Your Majesty, Mira's eastern tincture is not the only brew that breaks lung-cough. My mask-and-vinegar compound uses local herbs — cheaper, faster, and untested on madmen. She will call me a charlatan. Borvin will call me a bargain. I call myself an honest physician of risk. Do you want speed, or do you want her sermons about eastern purity?
**Prompt (RU):** Ваше Величество, восточная настойка Миры — не единственный отвар, прерывающий лёгочный кашель. Мой состав маски и уксуса использует местные травы — дешевле, быстрее и не испытан на безумцах. Она назовёт меня шарлатаном. Борвин назовёт выгодой. Я называю себя честным физиком риска. Хотите скорость или её проповеди о восточной чистоте?

**Choice 1**
- **Choice (EN):** Use Odo's compound in two test wards
- **Choice (RU):** 
- **Response (EN):** Fast and dangerous. If the men scream, remember you chose discount over caution.
- **Response (RU):** 
- **Effects:** Treasury +5, Health +5
- **Enables: `scandal` path**

**Choice 2**
- **Choice (EN):** Stick with Mira's formula — no experiments on the sick
- **Choice (RU):** Придерживаться формулы Миры — никаких экспериментов на больных
- **Response (EN):** Wise. Boring. Expensive. The qualities of a king who may survive the year.
- **Response (RU):** Мудро. Скучно. Дорого. Качества короля, который может пережить год.
- **Effects:** Health +3, Loyalty +2

**Choice 3**
- **Choice (EN):** Fund both — let them compete
- **Choice (RU):** 
- **Response (EN):** Science by rivalry. I like it. Mira will not. The sick may benefit — or pay.
- **Response (RU):** 
- **Effects:** Treasury -10, Health +6
- **Enables: `scandal` path (higher risk)**

---

## Pool Encounters

## Early Pool

### Encounter #0

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф
**Note (EN):** Pool slot for day-1 Edric tutorial; at runtime shows Edric opener instead of this text.
**Note (RU):** Слот пула для обучения Эдрика в день 1; в игре показывается вступление Эдрика вместо этого текста.

#### Node 0

**Prompt (EN):** The soldiers shed blood to put you on the throne. Now they are waiting for coins. If the treasury remains silent, the swords may also speak.
**Prompt (RU):** Солдаты проливали кровь, чтобы посадить вас на трон. Теперь они ждут монет. Если казна промолчит, мечи тоже могут заговорить.

**Choice 1**
- **Choice (EN):** Pay the army in full.
- **Choice (RU):** Заплатить армии полностью.
- **Response (EN):** The soldiers will remember the generous king. At least until the next salary.
- **Response (RU):** Солдаты запомнят щедрого короля. По крайней мере, до следующего жалования.
- **Effects:** Army +20, Treasury -25

**Choice 2**
- **Choice (EN):** Pay half and promise the rest later.
- **Choice (RU):** Заплатить половину и пообещать остальное позже.
- **Response (EN):** Half a coin buys half peace of mind. But today that's enough.
- **Response (RU):** Половина монеты покупает половину спокойствия. Но сегодня этого хватит.
- **Effects:** Army +8, Treasury -10

**Choice 3**
- **Choice (EN):** Serving the king is already an honor.
- **Choice (RU):** Служба королю — уже честь.
- **Response (EN):** Honor does not ring in your wallet. I hope your walls are stronger than your generosity.
- **Response (RU):** Честь не звенит в кошеле. Я надеюсь, ваши стены крепче вашей щедрости.
- **Effects:** Army -20, Treasury +5

**Choice 4**
- **Choice (EN):** How many soldiers actually took part in the coup?
- **Choice (RU):** Сколько солдат действительно участвовало в перевороте?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Less than listed. The commanders attributed the dead, the lame and those who slept drunk that night.
**Prompt (RU):** Меньше, чем указано в списках. Командиры приписали мёртвых, хромых и тех, кто в ту ночь спал пьяным.

**Choice 1**
- **Choice (EN):** Pay only honest people.
- **Choice (RU):** Заплатить только честным.
- **Response (EN):** Fair. But the deceived commanders will begin to grumble.
- **Response (RU):** Справедливо. Но обманутые командиры начнут ворчать.
- **Effects:** Army +10, Treasury -10

**Choice 2**
- **Choice (EN):** Pay everyone so as not to anger the army.
- **Choice (RU):** Заплатить всем, чтобы не злить армию.
- **Response (EN):** Generous order. Even liars will praise you loudly.
- **Response (RU):** Щедрый приказ. Даже лжецы будут славить вас громко.
- **Effects:** Army +18, Treasury -20

---

### Encounter #1

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, the people know your crown, but do not know whether it is blessed. Today the church must decide whether to name you king or one who took the throne.
**Prompt (RU):** Ваше Величество, народ знает вашу корону, но не знает, благословлена ли она. Сегодня церковь должна решить, как называть вас: королём или тем, кто взял трон.

**Choice 1**
- **Choice (EN):** Ask the church for a blessing.
- **Choice (RU):** Попросить церковь о благословении.
- **Response (EN):** Humility is a fitting beginning for one who reached the throne through blood.
- **Response (RU):** Смирение — хорошее начало для того, кто пришёл к трону через кровь.
- **Effects:** Church +20, Treasury -10

**Choice 2**
- **Choice (EN):** Demand recognition of my authority.
- **Choice (RU):** Потребовать признания моей власти.
- **Response (EN):** Orders reach soldiers. They rise to heaven far less well.
- **Response (RU):** Приказы доходят до солдат. До небес они поднимаются хуже.
- **Effects:** Church -15, Army +8

---

### Encounter #2

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** After the sermon, more hungry folk came to the monastery than usual. They believe the temple will feed them if the king cannot.
**Prompt (RU):** После проповеди к монастырю пришло больше голодных, чем обычно. Они верят, что храм накормит их, если король не может.

**Choice 1**
- **Choice (EN):** Send grain to the monastery.
- **Choice (RU):** Передать монастырю зерно.
- **Response (EN):** Today faith will smell of bread.
- **Response (RU):** Сегодня вера будет пахнуть хлебом.
- **Effects:** Church +8, Health +15, Food -15

**Choice 2**
- **Choice (EN):** Let the monastery feed them on its own.
- **Choice (RU):** Пусть монастырь сам кормит людей.
- **Response (EN):** We will try. But an empty pot does not become holy through prayer.
- **Response (RU):** Мы попробуем. Но пустой котёл не становится святым от молитвы.
- **Effects:** Church -5, Health -8, Food +5

---

### Encounter #3

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Temples collect church tax. The treasury collects taxes. Soon the people will see they pay twice.
**Prompt (RU):** Храмы собирают церковный налог. Казна собирает налоги. Народ скоро поймёт, что платит дважды.

**Choice 1**
- **Choice (EN):** Limit the church tax.
- **Choice (RU):** Ограничить церковный налог.
- **Response (EN):** The treasury is grateful. The altar will hiss.
- **Response (RU):** Казна благодарна. Алтарь будет шипеть.
- **Effects:** Church -20, Treasury +15, Health +5

**Choice 2**
- **Choice (EN):** Leave the church tax to the church.
- **Choice (RU):** Оставить церковный налог церкви.
- **Response (EN):** Priests love it when their gold is called faith.
- **Response (RU):** Священники любят, когда их золото называют верой.
- **Effects:** Church +10, Treasury -10

---

### Encounter #4

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Malrik wants priests in the barracks. He says soldiers need souls. Soldiers need bread and steel.
**Prompt (RU):** Малрик хочет отправить священников в казармы. Говорит, солдатам нужна душа. Солдатам нужен хлеб и сталь.

**Choice 1**
- **Choice (EN):** Allow priests in the barracks.
- **Choice (RU):** Разрешить священников в казармах.
- **Response (EN):** If they start teaching mercy to soldiers, I will throw them out myself.
- **Response (RU):** Если они начнут учить солдат милосердию, я выставлю их сам.
- **Effects:** Church +12, Army -5

**Choice 2**
- **Choice (EN):** Forbid them entry.
- **Choice (RU):** Запретить им вход.
- **Response (EN):** The barracks will remain barracks, not a hall of prayer.
- **Response (RU):** Казармы останутся казармами, а не молитвенным залом.
- **Effects:** Church -12, Army +10

---

### Encounter #5

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** People refuse to drink boiled water. They buy holy water instead. It comes from the same filthy well.
**Prompt (RU):** Люди отказываются пить кипячённую воду. Они покупают святую. Она из того же грязного колодца.

**Choice 1**
- **Choice (EN):** Ban the sale of holy water.
- **Choice (RU):** Запретить продажу святой воды.
- **Response (EN):** Thank you. Disease does not vanish when filth is blessed.
- **Response (RU):** Спасибо. Болезнь не исчезнет от молитвы над грязью.
- **Effects:** Church -15, Health +15

**Choice 2**
- **Choice (EN):** Order temples to boil water before consecration.
- **Choice (RU):** Приказать храмам кипятить воду перед освящением.
- **Response (EN):** Good. Let faith at least stop carrying infection.
- **Response (RU):** Хорошо. Пусть вера хотя бы не переносит заразу.
- **Effects:** Church +5, Treasury -3, Health +12

---

### Encounter #6

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** The church has declared a fast. There will be less meat, which is fine. Yet soldiers already ask why the gods need their stew.
**Prompt (RU):** Церковь объявила пост. Мяса будет меньше, это хорошо. Но солдаты уже спрашивают, почему богам нужна их похлёбка.

**Choice 1**
- **Choice (EN):** Fast for all, army included.
- **Choice (RU):** Пост для всех, включая армию.
- **Response (EN):** Turnips will be holy. Soldiers will be furious.
- **Response (RU):** Репа станет святой. Солдаты — злые.
- **Effects:** Church +10, Army -15, Food +20

**Choice 2**
- **Choice (EN):** Fast only for the palace.
- **Choice (RU):** Пост только для дворца.
- **Response (EN):** Now that is a sight: courtiers suffering almost like common folk.
- **Response (RU):** Вот это зрелище: придворные страдают почти как люди.
- **Effects:** Church +5, Health +5, Food +5

---

### Encounter #7

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** A crowd gathers by the main temple. They demand that the church declare whether you are a lawful king.
**Prompt (RU):** У главного храма собралась толпа. Они требуют, чтобы церковь сказала, законный ли вы король.

**Choice 1**
- **Choice (EN):** Post guards at the temple.
- **Choice (RU):** Поставить стражу у храма.
- **Response (EN):** Spears may hold doors. Not questions.
- **Response (RU):** Копья удержат двери. Не вопросы.
- **Effects:** Church -5, Army +8, Health -5

**Choice 2**
- **Choice (EN):** Let the crowd hear the sermon.
- **Choice (RU):** Позволить толпе слушать проповедь.
- **Response (EN):** Very well. But if words turn to sparks, I warned you.
- **Response (RU):** Хорошо. Но если слова станут искрами, я предупреждал.
- **Effects:** Church +8, Health +5

---

### Encounter #8

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** A king who quarrels with the church gains an enemy in every temple. A king who submits to it loses his throne without battle.
**Prompt (RU):** Король, который спорит с церковью, получает врага в каждом храме. Король, который ей подчиняется, теряет трон без боя.

**Choice 1**
- **Choice (EN):** Grant the church broader rights.
- **Choice (RU):** Дать церкви больше прав.
- **Response (EN):** The altar will smile. The throne will stand a little lower.
- **Response (RU):** Алтарь улыбнётся. Трон станет чуть ниже.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2**
- **Choice (EN):** Bind the church by law.
- **Choice (RU):** Ограничить церковь законом.
- **Response (EN):** A bold move. Such footsteps are often heard near a scaffold.
- **Response (RU):** Смелый шаг. Такие шаги часто слышны у эшафота.
- **Effects:** Church -20, Army +5, Treasury +10

---

### Encounter #9

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Since the church reopened, people buy candles, icons, and amulets. I can organize the trade and pay you a share.
**Prompt (RU):** После открытия церкви люди покупают свечи, иконы, амулеты. Я могу наладить торговлю. И отдать вам долю.

**Choice 1**
- **Choice (EN):** Permit trade in holy wares.
- **Choice (RU):** Разрешить торговлю святынями.
- **Response (EN):** Faith sells better than bread, and keeps longer.
- **Response (RU):** Вера продаётся лучше хлеба. И хранится дольше.
- **Effects:** Church -8, Treasury +20

**Choice 2**
- **Choice (EN):** Forbid profit from faith.
- **Choice (RU):** Запретить наживаться на вере.
- **Response (EN):** Noble. Very unprofitable.
- **Response (RU):** Благородно. Очень невыгодно.
- **Effects:** Church +10, Treasury -10, Health +5

---

### Encounter #10

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** Priests brought a man who spat upon temple doors. They demand a public execution.
**Prompt (RU):** Священники привели человека, который плевал на храмовые двери. Они требуют публичной казни.

**Choice 1**
- **Choice (EN):** Execute him.
- **Choice (RU):** Казнить его.
- **Response (EN):** The square will receive its lesson again. I hope it is worth the blood.
- **Response (RU):** Площадь снова получит урок. Надеюсь, он будет стоить этой крови.
- **Effects:** Church +15, Army +5, Health -10

**Choice 2**
- **Choice (EN):** Throw him in the dungeon.
- **Choice (RU):** Посадить в темницу.
- **Response (EN):** A dungeon is quieter than a gallows, but priests prefer loud answers.
- **Response (RU):** Тюрьма тише виселицы. Но священники любят громкие ответы.
- **Effects:** Church -5, Army +5

---

### Encounter #11

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** Temples burn incense against pestilence. It smells lovely. It heals nothing. I have better herbs.
**Prompt (RU):** Храмы жгут ладан против заразы. Красиво пахнет. Бесполезно лечит. У меня есть травы получше.

**Choice 1**
- **Choice (EN):** Buy herbs from Sivil.
- **Choice (RU):** Купить травы у Сивил.
- **Response (EN):** Herbs are rougher than prayers, yet they work more often.
- **Response (RU):** Травы грубее молитв, зато чаще работают.
- **Effects:** Church -5, Treasury -12, Health +15

**Choice 2**
- **Choice (EN):** Support the temple incense.
- **Choice (RU):** Поддержать храмовый ладан.
- **Response (EN):** Then let disease choke on fragrance, if it can.
- **Response (RU):** Тогда пусть болезнь задохнётся от аромата. Если сможет.
- **Effects:** Church +10, Treasury -5, Health -8

---

### Encounter #12

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** My prince asks whether your church now rules beside you. In the north, such kings are called soft.
**Prompt (RU):** Мой князь спрашивает, правда ли ваша церковь теперь правит вместе с вами. На севере таких королей называют мягкими.

**Choice 1**
- **Choice (EN):** Say the church is my ally.
- **Choice (RU):** Сказать, что церковь — мой союзник.
- **Response (EN):** The North will hear and decide you share your sword with prayer.
- **Response (RU):** Север услышит. И решит, что вы делите меч с молитвой.
- **Effects:** Church +10, Army -5

**Choice 2**
- **Choice (EN):** Say the church bends to the throne.
- **Choice (RU):** Сказать, что церковь подчиняется трону.
- **Response (EN):** Good. The north respects those who keep the altar by the throat.
- **Response (RU):** Хорошо. Север уважает тех, кто держит алтарь за горло.
- **Effects:** Church -10, Army +10

---

### Encounter #13

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик
**Note (EN):** The older two-node "Which one is dangerous?" flow is retired; encounter #13 is a single-node watch-priority question gated to day 8+.
**Note (RU):** 

#### Node 0

**Prompt (EN):** Your Majesty, after your decision on Edwin's household, the court wants specifics. Six servants still walk these halls — whom do you watch first this week?
**Prompt (RU):** Во дворце ещё служат люди прежнего короля. Если прогнать всех, дворец ослепнет. Если оставить всех, вы будете спать среди чужой памяти.

**Choice 1**
- **Choice (EN):** The cook and the kitchens. *(or "Cook Gromm and the kitchens." after household beat 0)*
- **Choice (RU):** Прогнать всех старых слуг.
- **Response (EN):** Sensible. Hunger is a weapon if the cook turns.
- **Response (RU):** Дворец станет чище. И куда глупее.
- **Effects:** Loyalty +3

**Choice 2**
- **Choice (EN):** The chief scribe and the archive. *(or "Scribe Osric and the archive." after household beat 2)*
- **Choice (RU):** Оставить тех, кто принесёт новую клятву.
- **Response (EN):** Ink is deadlier than knives. A good choice for the paranoid.
- **Response (RU):** Клятва не всегда верность. Но это начало.
- **Effects:** Army +5, Treasury -3

**Choice 3**
- **Choice (EN):** The door warden and stair servants.
- **Choice (RU):** Оставить всех.
- **Response (EN):** The door is the first line. Who passes controls the whispers.
- **Response (RU):** Машина дворца продолжит работать. Вопрос — на кого.
- **Effects:** Army +3, Loyalty +2

**Choice 4**
- **Choice (EN):** 
- **Choice (RU):** Кто из них опасен?
- **Effects:** Без изменения показателей
- **Next node:** 1

#### Node 1

**Prompt (EN):** 
**Prompt (RU):** Опаснее всех те, кто молчит слишком правильно. Преданный слуга всегда немного человек. Шпион — всегда мебель.

**Choice 1**
- **Choice (EN):** 
- **Choice (RU):** Составить список подозрительных.
- **Response (EN):** 
- **Response (RU):** Список не спасёт вас сам, но подскажет, кому не доверять вино.
- **Effects:** Army +5, Treasury -5

**Choice 2**
- **Choice (EN):** 
- **Choice (RU):** Заменить только ближайших к трону.
- **Response (EN):** 
- **Response (RU):** Мягкая чистка. Иногда мягкий нож режет точнее.
- **Effects:** Army +5, Treasury -5

---

### Encounter #14

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Northern scouts crossed the border. This could be a test. May I strike first?
**Prompt (RU):** Северные разведчики перешли границу. Это может быть проверка. Разрешите ударить первыми?

**Choice 1**
- **Choice (EN):** Strike first.
- **Choice (RU):** Ударить первыми.
- **Response (EN):** So say kings who are never tried twice.
- **Response (RU):** Так говорят короли, которых не пробуют дважды.
- **Effects:** Army +20, Treasury -15, Food -5

**Choice 2**
- **Choice (EN):** Strengthen the border, but do not attack.
- **Choice (RU):** Усилить границу, но не атаковать.
- **Response (EN):** Cautious force. Not the worst language for the border.
- **Response (RU):** Осторожная сила. Не худший язык для границы.
- **Effects:** Army +10, Treasury -8

**Choice 3**
- **Choice (EN):** Send an ambassador.
- **Choice (RU):** Отправить посла.
- **Response (EN):** Words are cheaper than blood. Until the other side decides otherwise.
- **Response (RU):** Слова дешевле крови. Пока другая сторона не решит иначе.
- **Effects:** Army -5, Treasury -5, Food +3

---

### Encounter #15

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** The church asks for the right to judge crimes against the faith. Without it, the temple remains toothless.
**Prompt (RU):** Церковь просит право судить преступления против веры. Без этого храм остаётся без зубов.

**Choice 1**
- **Choice (EN):** Grant the church judicial power.
- **Choice (RU):** Дать церкви право суда.
- **Response (EN):** Faith without judgment is a plea. Faith with judgment is law.
- **Response (RU):** Вера без суда — просьба. Вера с судом — закон.
- **Effects:** Church +20, Army -5, Health -8

**Choice 2**
- **Choice (EN):** Keep judgment under the crown.
- **Choice (RU):** Оставить суд короне.
- **Response (EN):** Then do not be surprised when sinners begin to love royal law.
- **Response (RU):** Тогда не удивляйтесь, если грешники начнут любить королевский закон.
- **Effects:** Church -15, Army +8

---

### Encounter #16

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** People fleeing tax collectors took refuge in a temple. They are hungry and terrified. Will you demand their surrender?
**Prompt (RU):** В храме укрылись люди, бежавшие от сборщиков налогов. Они голодны и напуганы. Вы потребуете их выдачи?

**Choice 1**
- **Choice (EN):** Demand their surrender.
- **Choice (RU):** Потребовать выдачи.
- **Response (EN):** Temple doors will open, but people will remember holiness did not protect them.
- **Response (RU):** Храмовые двери откроются. Но люди запомнят, что святость не защитила их.
- **Effects:** Church -10, Army +5, Treasury +10

**Choice 2**
- **Choice (EN):** Leave them in sanctuary.
- **Choice (RU):** Оставить их в храме.
- **Response (EN):** Thank you. At times, sanctuary matters more than statute.
- **Response (RU):** Спасибо. Иногда убежище важнее закона.
- **Effects:** Church +10, Treasury -10, Health +5

---

### Encounter #17

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Malrik wishes to build a new cathedral. The treasury has a hole, yet the cathedral may calm the people.
**Prompt (RU):** Малрик хочет строить новый собор. В казне дыра, но собор может успокоить народ.

**Choice 1**
- **Choice (EN):** Allocate funds for the cathedral.
- **Choice (RU):** Выделить деньги на собор.
- **Response (EN):** Stone for the temple. Emptiness for the treasury.
- **Response (RU):** Камни для храма. Пустота для казны.
- **Effects:** Church +20, Treasury -25, Health +5

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказать.
- **Response (EN):** The treasury thanks you. The temple will curse you with excellent acoustics.
- **Response (RU):** Казна благодарит. Храм проклянёт с хорошей акустикой.
- **Effects:** Church -15, Treasury +10

---

### Encounter #18

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Priests want to stitch church crosses on military banners. Soldiers serve the king, not the temple.
**Prompt (RU):** Священники хотят вышить церковные кресты на военных знамёнах. Солдаты служат королю, не храму.

**Choice 1**
- **Choice (EN):** Add crosses to the banners.
- **Choice (RU):** Добавить кресты на знамёна.
- **Response (EN):** Now soldiers carry not only your crest. A dangerous symbol.
- **Response (RU):** Теперь солдаты будут нести не только ваш герб. Опасный символ.
- **Effects:** Church +15, Army -8

**Choice 2**
- **Choice (EN):** Forbid church signs on banners.
- **Choice (RU):** Запретить церковные знаки на знамёнах.
- **Response (EN):** Good. In battle a soldier must see orders, not sermons.
- **Response (RU):** Хорошо. В бою солдат должен видеть приказ, а не проповедь.
- **Effects:** Church -12, Army +10

---

### Encounter #19

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** The sick queue for a saint's relics. They stand hours in rain instead of going to the infirmary.
**Prompt (RU):** Больные выстраиваются к мощам святого. Они стоят часами под дождём вместо того, чтобы идти в лазарет.

**Choice 1**
- **Choice (EN):** Forbid the relic queue.
- **Choice (RU):** Запретить очередь к мощам.
- **Response (EN):** You will save bodies. Souls will rage.
- **Response (RU):** Вы спасёте тела. Души будут возмущаться.
- **Effects:** Church -15, Health +15

**Choice 2**
- **Choice (EN):** Place healers beside the relics.
- **Choice (RU):** Поставить лекарей рядом с мощами.
- **Response (EN):** Good. Let miracle work beside bandages.
- **Response (RU):** Хорошо. Пусть чудо работает рядом с бинтами.
- **Effects:** Church +5, Treasury -8, Health +15

---

### Encounter #20

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Temples want the best flour for holy bread. I could feed orphans with that flour.
**Prompt (RU):** Храмы просят лучшую муку для священного хлеба. А я этой мукой могу накормить сирот.

**Choice 1**
- **Choice (EN):** Give the best flour to temples.
- **Choice (RU):** Отдать лучшую муку храмам.
- **Response (EN):** Holy bread will be soft. Orphans' porridge thin.
- **Response (RU):** Святой хлеб выйдет мягким. Детские каши — жидкими.
- **Effects:** Church +12, Food -10

**Choice 2**
- **Choice (EN):** Give the flour to orphans.
- **Choice (RU):** Отдать муку сиротам.
- **Response (EN):** Children will thank you. Priests will complain longer.
- **Response (RU):** Дети скажут спасибо. Священники будут жаловаться дольше.
- **Effects:** Church -8, Health +12, Food -8

---

### Encounter #21

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** A priest refused temple gates to guards. Inside is church land, not royal.
**Prompt (RU):** Священник отказался открыть ворота храма стражникам. Говорит, внутри церковная земля, а не королевская.

**Choice 1**
- **Choice (EN):** Break in by force.
- **Choice (RU):** Вломиться силой.
- **Response (EN):** The door falls. And something greater with it.
- **Response (RU):** Дверь падёт. А вместе с ней что-то большее.
- **Effects:** Church -20, Army +12, Health -5

**Choice 2**
- **Choice (EN):** Withdraw.
- **Choice (RU):** Отступить.
- **Response (EN):** The guard will remember. Priests too.
- **Response (RU):** Стража это запомнит. Священники тоже.
- **Effects:** Church +10, Army -10

---

### Encounter #22

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** The church's opening brought not peace but a new center of power. Every order is compared to a sermon.
**Prompt (RU):** Открытие церкви принесло не мир, а новый центр власти. Теперь каждый ваш приказ будут сравнивать с проповедью.

**Choice 1**
- **Choice (EN):** Make the church the throne's official support.
- **Choice (RU):** Сделать церковь официальной опорой трона.
- **Response (EN):** You gained a holy shield. And a holy chain.
- **Response (RU):** Вы получили святой щит. И святую цепь.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2**
- **Choice (EN):** Keep the church at distance.
- **Choice (RU):** Удерживать церковь на расстоянии.
- **Response (EN):** Safer for the throne. Riskier for the people's soul.
- **Response (RU):** Безопаснее для трона. Опаснее для души народа.
- **Effects:** Church -10, Army +5, Treasury +5

---

### Encounter #23

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Some priests want to preach about the blood of the coup this Sunday. I can forbid them. But forbidding in the temple comes at a price.
**Prompt (RU):** Некоторые священники хотят в воскресенье говорить о крови переворота. Я могу запретить им. Но запреты в храме стоят дорого.

**Choice 1**
- **Choice (EN):** Forbid preaching about the coup.
- **Choice (RU):** Запретить проповедь о перевороте.
- **Response (EN):** Silence is bought. But it does not always keep long.
- **Response (RU):** Молчание куплено. Но оно не всегда хранится долго.
- **Effects:** Church +8, Treasury -10, Health +5

**Choice 2**
- **Choice (EN):** Let them speak the truth.
- **Choice (RU):** Пусть говорят правду.
- **Response (EN):** Truth in the temple rings louder than in the square.
- **Response (RU):** Правда в храме звучит громче, чем на площади.
- **Effects:** Church +5, Army -8, Health -5

---

### Encounter #24

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** I wish to open a shelter at the monastery. Orphans will live, learn, and work. But we need bread and a little gold.
**Prompt (RU):** Я хочу открыть приют при монастыре. Сироты будут жить, учиться и работать. Но нам нужен хлеб и немного золота.

**Choice 1**
- **Choice (EN):** Support the shelter.
- **Choice (RU):** Поддержать приют.
- **Response (EN):** You gave the children not only a roof, but a tomorrow.
- **Response (RU):** Вы дали детям не только крышу, но и завтра.
- **Effects:** Church +8, Treasury -12, Health +20, Food -8

**Choice 2**
- **Choice (EN):** Give grain only.
- **Choice (RU):** Дать только зерно.
- **Response (EN):** They will eat. For now that is already a miracle.
- **Response (RU):** Они будут есть. Пока это уже чудо.
- **Effects:** Church +3, Health +10, Food -10

---

### Encounter #25

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** The church sells letters of absolution. Tax them and the treasury will revive.
**Prompt (RU):** Церковь продаёт грамоты отпущения грехов. Если взять с этого налог, казна оживёт.

**Choice 1**
- **Choice (EN):** Tax the letters.
- **Choice (RU):** Обложить грамоты налогом.
- **Response (EN):** Sin will finally work for the treasury.
- **Response (RU):** Грех наконец начнёт работать на казну.
- **Effects:** Church -10, Treasury +20

**Choice 2**
- **Choice (EN):** Ban the sale of letters.
- **Choice (RU):** Запретить продажу грамот.
- **Response (EN):** Moral. But morality does not jingle.
- **Response (RU):** Морально. Но мораль не звенит.
- **Effects:** Church -15, Health +8

---

### Encounter #26

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Priests say the northerners are godless. If they continue, soldiers will start waiting for war.
**Prompt (RU):** Священники говорят, что северяне — безбожники. Если они продолжат, солдаты сами начнут ждать войны.

**Choice 1**
- **Choice (EN):** Allow such sermons.
- **Choice (RU):** Разрешить такие проповеди.
- **Response (EN):** Soldiers love an enemy they were blessed to hate.
- **Response (RU):** Солдаты любят врага, которого им благословили ненавидеть.
- **Effects:** Church +15, Army +10, Treasury -5

**Choice 2**
- **Choice (EN):** Forbid war sermons.
- **Choice (RU):** Запретить военные проповеди.
- **Response (EN):** Sensible. There is war enough without holy cries.
- **Response (RU):** Разумно. Войны хватает и без святых криков.
- **Effects:** Church -12, Army -5, Treasury +5

---

### Encounter #27

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Monks heal with herbs but keep no records of doses. Today a child nearly died from too strong a brew.
**Prompt (RU):** Монахи лечат травами, но не записывают дозы. Сегодня один ребёнок чуть не умер от слишком крепкого отвара.

**Choice 1**
- **Choice (EN):** Require monastery healers to keep records.
- **Choice (RU):** Обязать монастырских лекарей вести записи.
- **Response (EN):** Ink will save what blind prayer cannot.
- **Response (RU):** Чернила спасут тех, кого молитвы лечат вслепую.
- **Effects:** Church -5, Treasury -3, Health +15

**Choice 2**
- **Choice (EN):** Ban monastery healing.
- **Choice (RU):** Запретить монастырское лечение.
- **Response (EN):** It will stop mistakes. And some help too.
- **Response (RU):** Это остановит ошибки. И часть помощи тоже.
- **Effects:** Church -15, Health +10

---

### Encounter #28

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Pilgrims are coming to the capital. If unfed they collapse at the gates. If fed, our stores collapse.
**Prompt (RU):** К столице идут странники. Если их не накормить, они рухнут у ворот. Если накормить — рухнут наши запасы.

**Choice 1**
- **Choice (EN):** Feed the pilgrims.
- **Choice (RU):** Накормить странников.
- **Response (EN):** Holy folk eat like anyone else. Sometimes even more.
- **Response (RU):** Святые люди едят как обычные. Иногда даже больше.
- **Effects:** Church +15, Health +10, Food -20

**Choice 2**
- **Choice (EN):** Admit only those who bring their own food.
- **Choice (RU):** Пустить только тех, кто несёт еду с собой.
- **Response (EN):** The city keeps grain. Pilgrims keep resentment.
- **Response (RU):** Город сохранит зерно. Странники сохранят обиду.
- **Effects:** Church -8, Health -3, Food +5

---

### Encounter #29

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Pilgrims enter the city. Among them one can hide spies, killers, and deserters.
**Prompt (RU):** В город идут странники. Среди них легко спрятать шпионов, убийц и беглых солдат.

**Choice 1**
- **Choice (EN):** Search all pilgrims.
- **Choice (RU):** Обыскивать всех странников.
- **Response (EN):** Safer. But holiness will wait in line for inspection.
- **Response (RU):** Безопаснее. Но святость будет стоять в очереди на досмотр.
- **Effects:** Church -8, Army +10, Health -3

**Choice 2**
- **Choice (EN):** Let all pass unchecked.
- **Choice (RU):** Пускать всех без проверки.
- **Response (EN):** Open gates are loved by more than the faithful.
- **Response (RU):** Открытые ворота любят не только верующие.
- **Effects:** Church +10, Army -10

---

## Mid Pool

### Encounter #30

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Temples demand return of lands seized by the former king. Land gives bread. Bread gives power.
**Prompt (RU):** Храмы требуют вернуть земли, конфискованные прежним королём. Земли дают хлеб. Хлеб даёт власть.

**Choice 1**
- **Choice (EN):** Return the lands to the church.
- **Choice (RU):** Вернуть земли церкви.
- **Response (EN):** The altar grows richer. The throne — more grateful or weaker.
- **Response (RU):** Алтарь станет богаче. Трон — благодарнее или слабее.
- **Effects:** Church +20, Treasury -10, Food -15

**Choice 2**
- **Choice (EN):** Keep the lands for the crown.
- **Choice (RU):** Оставить земли короне.
- **Response (EN):** The land stays yours. So do the curses.
- **Response (RU):** Земля останется у вас. Проклятия тоже.
- **Effects:** Church -20, Treasury +10, Food +10

---

### Encounter #31

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Pilgrims buy everything: bread, candles, water, rags, hope. Permit a temporary market by the temple.
**Prompt (RU):** Странники покупают всё: хлеб, свечи, воду, тряпки, надежду. Разрешите временный рынок у храма.

**Choice 1**
- **Choice (EN):** Allow the market and take a toll.
- **Choice (RU):** Разрешить рынок и взять пошлину.
- **Response (EN):** Faith brings buyers. The crown takes the coins.
- **Response (RU):** Вера приведёт покупателей. Корона заберёт монеты.
- **Effects:** Church -5, Treasury +20, Food -5

**Choice 2**
- **Choice (EN):** Allow the market without toll.
- **Choice (RU):** Разрешить рынок без пошлины.
- **Response (EN):** Rare generosity. Merchants will pray for you.
- **Response (RU):** Редкая щедрость. Купцы будут молиться за вас.
- **Effects:** Church +8, Treasury -5, Health +3

---

### Encounter #32

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** Some prisoners suddenly grew very pious. They ask to replace execution with monastery penance.
**Prompt (RU):** Некоторые заключённые вдруг стали очень набожными. Просят заменить казнь монастырским покаянием.

**Choice 1**
- **Choice (EN):** Allow penance instead of execution.
- **Choice (RU):** Разрешить покаяние вместо казни.
- **Response (EN):** The monastery gets sinners. I get a free day.
- **Response (RU):** Монастырь получит грешников. Я — свободный день.
- **Effects:** Church +12, Army -8, Health +8

**Choice 2**
- **Choice (EN):** Execute as sentenced.
- **Choice (RU):** Казнить по приговору.
- **Response (EN):** Faith came late. The axe — on time.
- **Response (RU):** Вера пришла поздно. Топор — вовремя.
- **Effects:** Church -5, Army +10, Health -5

---

### Encounter #33

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** My prince congratulates you on your crown. He asks only for a small thing: to reduce the duty on northern furs.
**Prompt (RU):** Мой князь поздравляет вас с короной. Он просит лишь малого: снизить пошлину на северные меха.

**Choice 1**
- **Choice (EN):** Reduce the duty.
- **Choice (RU):** Снизить пошлину.
- **Response (EN):** The North will appreciate your wisdom. And your need for friends.
- **Response (RU):** Север оценит вашу мудрость. И вашу нужду в друзьях.
- **Effects:** Treasury -10, Food +5

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказать.
- **Response (EN):** Solid answer. I hope your borders are just as strong.
- **Response (RU):** Твёрдый ответ. Надеюсь, ваши границы так же твёрды.
- **Effects:** Army -5, Treasury +10

**Choice 3**
- **Choice (EN):** Increase the duty.
- **Choice (RU):** Повысить пошлину.
- **Response (EN):** Boldly. My prince loves the brave almost as much as he loves testing them.
- **Response (RU):** Смело. Мой князь любит смелых почти так же, как любит проверять их.
- **Effects:** Army -10, Treasury +20

**Choice 4**
- **Choice (EN):** Why is your prince asking now?
- **Choice (RU):** Почему ваш князь просит именно сейчас?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because the new king is either looking for friends or showing his teeth. My prince wants to understand who he sees.
**Prompt (RU):** Потому что новый король либо ищет друзей, либо показывает зубы. Мой князь хочет понять, кого он видит.

**Choice 1**
- **Choice (EN):** Tell him: I'm looking for friends.
- **Choice (RU):** Передай: я ищу друзей.
- **Response (EN):** Then the North will extend its hand. Cold, but open.
- **Response (RU):** Тогда север протянет руку. Холодную, но открытую.
- **Effects:** Army -3, Treasury -8, Food +10

**Choice 2**
- **Choice (EN):** Tell him: I'm showing my teeth.
- **Choice (RU):** Передай: я показываю зубы.
- **Response (EN):** I'll pass. And I'll make sure he doesn't laugh too loudly.
- **Response (RU):** Я передам. И прослежу, чтобы он не рассмеялся слишком громко.
- **Effects:** Army +10, Treasury +5, Food -5

---

### Encounter #34

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** The temple sells holy salve for sores. It holds fat, wax, and lies. My salves at least smell honest.
**Prompt (RU):** Храм продаёт святую мазь от язв. В ней жир, воск и ложь. Мои мази хотя бы честно воняют.

**Choice 1**
- **Choice (EN):** Ban holy salve.
- **Choice (RU):** Запретить святую мазь.
- **Response (EN):** Good sense beat fragrant lies.
- **Response (RU):** Здравый смысл победил ароматную ложь.
- **Effects:** Church -12, Health +12

**Choice 2**
- **Choice (EN):** Allow both salves.
- **Choice (RU):** Разрешить обе мази.
- **Response (EN):** Let people choose between faith and stink. Amusing.
- **Response (RU):** Пусть люди выбирают между верой и запахом. Забавно.
- **Effects:** Church +5, Treasury +5, Health -5

---

### Encounter #35

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Northerners in the capital ask to open their own temple. Your priests call it heresy.
**Prompt (RU):** Северяне в столице просят открыть свой храм. Ваши священники называют это ересью.

**Choice 1**
- **Choice (EN):** Allow a northern temple.
- **Choice (RU):** Разрешить северный храм.
- **Response (EN):** The north will approve. Your priests will not.
- **Response (RU):** Север оценит. Ваши священники — нет.
- **Effects:** Church -20, Treasury +5, Health +5

**Choice 2**
- **Choice (EN):** Forbid it.
- **Choice (RU):** Запретить.
- **Response (EN):** Then northerners will see your faith outweighs hospitality.
- **Response (RU):** Тогда северяне поймут, что ваша вера сильнее гостеприимства.
- **Effects:** Church +15, Army +3, Treasury -5

---

### Encounter #36

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Soldiers who shed blood on the night of the coup must confess. Otherwise sin stays on your army.
**Prompt (RU):** Солдаты, пролившие кровь в ночь переворота, должны исповедаться. Иначе грех останется на вашем войске.

**Choice 1**
- **Choice (EN):** Require soldiers to confess.
- **Choice (RU):** Обязать солдат к исповеди.
- **Response (EN):** Sin is named. Now it can be leashed.
- **Response (RU):** Грех назван. Теперь его можно держать на поводке.
- **Effects:** Church +15, Army -10, Health +5

**Choice 2**
- **Choice (EN):** Make confession voluntary only.
- **Choice (RU):** Сделать исповедь только добровольной.
- **Response (EN):** Voluntary cleansing is slower, but cleaner.
- **Response (RU):** Добровольное очищение медленнее, но чище.
- **Effects:** Church +5, Army +3

---

### Encounter #37

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Pilgrims sell their belongings for bread. Some already fall on the road to the temple.
**Prompt (RU):** Странники продают свои вещи за кусок хлеба. Некоторые уже падают на дороге к храму.

**Choice 1**
- **Choice (EN):** Open a free kitchen.
- **Choice (RU):** Открыть бесплатную кухню.
- **Response (EN):** The road to the temple will be less deadly today.
- **Response (RU):** Дорога к храму сегодня станет менее смертельной.
- **Effects:** Church +10, Health +18, Food -18

**Choice 2**
- **Choice (EN):** Sell them cheap bread.
- **Choice (RU):** Продавать им дешёвый хлеб.
- **Response (EN):** Not mercy, but help. Sometimes that is all there is.
- **Response (RU):** Не милость, но помощь. Иногда это всё, что есть.
- **Effects:** Treasury +5, Health +8, Food -8

---

### Encounter #38

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** If the church declares giving to the crown a holy deed, people will bring coins themselves.
**Prompt (RU):** Если церковь объявит пожертвование короне святым делом, люди сами принесут монеты.

**Choice 1**
- **Choice (EN):** Ask the church to declare a collection.
- **Choice (RU):** Попросить церковь объявить сбор.
- **Response (EN):** When greed is blessed, it is called service.
- **Response (RU):** Когда жадность благословлена, её называют служением.
- **Effects:** Church +8, Treasury +20, Health -5

**Choice 2**
- **Choice (EN):** Collect donations without the church.
- **Choice (RU):** Собирать пожертвования без церкви.
- **Response (EN):** People give less when heaven does not frighten them.
- **Response (RU):** Люди дают меньше, когда их не пугают небесами.
- **Effects:** Treasury +8, Health -3

---

### Encounter #39

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Priests want prayer before every parade. It turns the army into a church procession.
**Prompt (RU):** Священники хотят читать молитву перед каждым строевым смотром. Это превращает армию в церковную процессию.

**Choice 1**
- **Choice (EN):** Allow prayers before inspection.
- **Choice (RU):** Разрешить молитвы перед смотром.
- **Response (EN):** Soldiers will stand longer. I hope enemies wait too.
- **Response (RU):** Солдаты будут стоять дольше. Надеюсь, враги тоже подождут.
- **Effects:** Church +12, Army -5

**Choice 2**
- **Choice (EN):** Forbid it.
- **Choice (RU):** Запретить.
- **Response (EN):** Good. Inspection should sound of steps, not psalms.
- **Response (RU):** Хорошо. Смотр должен звучать шагами, не псалмами.
- **Effects:** Church -10, Army +10

---

### Encounter #40

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** The church forbids autopsies of those who died of disease. Without them we cannot learn what kills.
**Prompt (RU):** Церковь запрещает вскрывать умерших от болезни. Без этого мы не поймём, что убивает людей.

**Choice 1**
- **Choice (EN):** Allow secret autopsies.
- **Choice (RU):** Разрешить вскрытия тайно.
- **Response (EN):** Secret truth still heals better than open lies.
- **Response (RU):** Тайная правда всё равно лечит лучше открытой лжи.
- **Effects:** Church -8, Health +15

**Choice 2**
- **Choice (EN):** Forbid autopsies.
- **Choice (RU):** Запретить вскрытия.
- **Response (EN):** Then disease keeps its secrets.
- **Response (RU):** Тогда болезнь сохранит свои секреты.
- **Effects:** Church +10, Health -15

---

### Encounter #41

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** In three days is the saint's feast. The temple asks a feast for the poor. The poor ask for feasts every day.
**Prompt (RU):** Через три дня праздник святого. Храм просит пир для бедных. Бедные просят пир каждый день.

**Choice 1**
- **Choice (EN):** Allocate food for the feast.
- **Choice (RU):** Выделить еду на праздник.
- **Response (EN):** The feast will be hearty. The next day will be ordinary.
- **Response (RU):** Праздник будет сытным. Следующий день — обычным.
- **Effects:** Church +12, Health +8, Food -15

**Choice 2**
- **Choice (EN):** Allocate half.
- **Choice (RU):** Выделить половину.
- **Response (EN):** Half a miracle. Not bad for the kitchen.
- **Response (RU):** Половина чуда. Для кухни это уже неплохо.
- **Effects:** Church +5, Health +3, Food -8

---

### Encounter #42

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Salt preserves meat and fish. Give me security and I will bring it to the city.
**Prompt (RU):** Соль сохраняет мясо и рыбу. Дайте мне охрану, и я привезу её в город.

**Choice 1**
- **Choice (EN):** Provide military protection.
- **Choice (RU):** Дать военную охрану.
- **Response (EN):** The salt will come quickly. The soldiers will also finally do something useful for trade.
- **Response (RU):** Соль придёт быстро. Солдаты тоже наконец сделают что-то полезное для торговли.
- **Effects:** Army -5, Treasury -5, Food +15

**Choice 2**
- **Choice (EN):** Pay the mercenaries.
- **Choice (RU):** Заплатить наёмникам.
- **Response (EN):** Expensive, but convenient. Mercenaries ask fewer questions.
- **Response (RU):** Дорого, но удобно. Наёмники задают меньше вопросов.
- **Effects:** Treasury -15, Food +15

**Choice 3**
- **Choice (EN):** Let the caravan go on its own.
- **Choice (RU):** Пусть караван идёт сам.
- **Response (EN):** Then pray that thieves do not like salt.
- **Response (RU):** Тогда молитесь, чтобы разбойники не любили соль.
- **Effects:** Treasury +5, Food -10

**Choice 4**
- **Choice (EN):** Why do you need royal security?
- **Choice (RU):** Почему вам нужна именно королевская охрана?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because the robbers fear the banner more than my people. And the royal guard also makes the goods royally expensive.
**Prompt (RU):** Потому что разбойники боятся знамени больше, чем моих людей. А ещё королевская охрана делает товар королевски дорогим.

**Choice 1**
- **Choice (EN):** Give protection, but take away some of the salt.
- **Choice (RU):** Дать охрану, но забрать часть соли.
- **Response (EN):** Fair. Unpleasant, but fair.
- **Response (RU):** Справедливо. Неприятно, но справедливо.
- **Effects:** Army -5, Food +18

**Choice 2**
- **Choice (EN):** Provide security for a fee.
- **Choice (RU):** Дать охрану за плату.
- **Response (EN):** You are learning to trade. It's scary.
- **Response (RU):** Вы учитесь торговать. Это пугает.
- **Effects:** Army -5, Treasury +5, Food +15

---

### Encounter #43

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Malrik is forming a temple guard. For now sticks and robes. Later, swords.
**Prompt (RU):** Малрик собирает собственную храмовую стражу. Пока это палки и рясы. Потом будут мечи.

**Choice 1**
- **Choice (EN):** Forbid the temple guard.
- **Choice (RU):** Запретить храмовую стражу.
- **Response (EN):** Good. One law and one guard in the city.
- **Response (RU):** Хорошо. В городе должен быть один закон и одна стража.
- **Effects:** Church -15, Army +12

**Choice 2**
- **Choice (EN):** Allow the temple guard.
- **Choice (RU):** Разрешить храмовую стражу.
- **Response (EN):** Then the temple grows teeth. Do not be surprised if it bites.
- **Response (RU):** Тогда у храма появятся зубы. Не удивляйтесь, если он начнёт кусаться.
- **Effects:** Church +15, Army -10

---

### Encounter #44

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** The people hear you in the square and Malrik in the temple. In the temple they weep. In the square they fear.
**Prompt (RU):** Народ слушает вас на площади и Малрика в храме. Но в храме люди плачут. На площади они боятся.

**Choice 1**
- **Choice (EN):** Speak to the people more often.
- **Choice (RU):** Говорить с народом чаще.
- **Response (EN):** The throne must have a voice, or others speak for it.
- **Response (RU):** Трон должен иметь голос, иначе за него будут говорить другие.
- **Effects:** Church -3, Treasury -5, Health +10

**Choice 2**
- **Choice (EN):** Let the church speak for the crown.
- **Choice (RU):** Пусть церковь говорит за корону.
- **Response (EN):** Convenient. But one day you will hear your orders in a stranger's voice.
- **Response (RU):** Удобно. Но однажды вы услышите свои приказы чужим голосом.
- **Effects:** Church +15, Army -5

---

### Encounter #45

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** The church wants a book of faithful subjects. Those listed receive help first.
**Prompt (RU):** Церковь хочет вести книгу верных подданных. Кто записан, тот получает помощь первым.

**Choice 1**
- **Choice (EN):** Allow the book of the faithful.
- **Choice (RU):** Разрешить книгу верных.
- **Response (EN):** Ordered mercy beats chaotic mercy.
- **Response (RU):** Порядок милосердия лучше хаоса милосердия.
- **Effects:** Church +15, Health -8

**Choice 2**
- **Choice (EN):** Forbid dividing people by faith.
- **Choice (RU):** Запретить делить людей по вере.
- **Response (EN):** You want equality where people seek chosenness.
- **Response (RU):** Вы хотите равенства там, где люди ищут избранность.
- **Effects:** Church -15, Health +10

---

### Encounter #46

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Those who argued with priests were barred from the monastery kitchen. They are hungry.
**Prompt (RU):** Людей, которые спорили со священниками, перестали пускать к монастырской кухне. Они голодны.

**Choice 1**
- **Choice (EN):** Feed all regardless of faith.
- **Choice (RU):** Кормить всех, независимо от веры.
- **Response (EN):** This is the mercy I hoped to hear.
- **Response (RU):** Это милость, которую я хотел услышать.
- **Effects:** Church -8, Health +15, Food -10

**Choice 2**
- **Choice (EN):** Feed only the faithful.
- **Choice (RU):** Кормить только верных.
- **Response (EN):** Then soup becomes a test, not salvation.
- **Response (RU):** Тогда суп станет испытанием, а не спасением.
- **Effects:** Church +12, Health -10, Food -5

---

### Encounter #47

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Some monasteries owe the treasury for old supplies. Malrik asks to forgive the debts in faith's name.
**Prompt (RU):** Некоторые монастыри должны казне за старые поставки. Малрик просит простить долги во имя веры.

**Choice 1**
- **Choice (EN):** Forgive the debts.
- **Choice (RU):** Простить долги.
- **Response (EN):** Faith loves forgiveness. The treasury does not.
- **Response (RU):** Вера любит прощение. Казна — нет.
- **Effects:** Church +15, Treasury -15

**Choice 2**
- **Choice (EN):** Demand payment.
- **Choice (RU):** Потребовать оплату.
- **Response (EN):** Debt is holier than prayer if recorded well.
- **Response (RU):** Долг святее молитвы, если записан правильно.
- **Effects:** Church -12, Treasury +15

---

### Encounter #48

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Priests ask to stop executing deserters. Every soldier can repent, they say.
**Prompt (RU):** Священники просят остановить казни дезертиров. Говорят, каждый солдат может покаяться.

**Choice 1**
- **Choice (EN):** Stop executing deserters.
- **Choice (RU):** Остановить казни дезертиров.
- **Response (EN):** Mercy in the barracks smells of mutiny.
- **Response (RU):** Милость в казармах пахнет мятежом.
- **Effects:** Church +10, Army -15, Health +5

**Choice 2**
- **Choice (EN):** Continue executions.
- **Choice (RU):** Продолжать казни.
- **Response (EN):** Order holds. Souls can catch up later.
- **Response (RU):** Порядок сохранится. Души пусть догоняют позже.
- **Effects:** Church -10, Army +12, Health -5

---

### Encounter #49

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** The sick sleep inside the temple hoping for miracles. Warm air and crowding spread disease.
**Prompt (RU):** Больные ночуют внутри храма, надеясь на чудо. Тёплый воздух и теснота разносят болезнь.

**Choice 1**
- **Choice (EN):** Move the sick to infirmaries.
- **Choice (RU):** Вывести больных в лазареты.
- **Response (EN):** They will rage. But survive more often.
- **Response (RU):** Они будут злиться. Но выживут чаще.
- **Effects:** Church -10, Health +18

**Choice 2**
- **Choice (EN):** Open temple infirmaries.
- **Choice (RU):** Открыть храмовые лазареты.
- **Response (EN):** If the temple heals, let it learn to scrub floors.
- **Response (RU):** Если храм хочет лечить, пусть учится мыть полы.
- **Effects:** Church +8, Treasury -10, Health +15

---

### Encounter #50

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** During the fast fish costs more than meat. Merchants pray to the fast louder than priests.
**Prompt (RU):** Во время поста рыба стала дороже мяса. Купцы молятся на пост громче священников.

**Choice 1**
- **Choice (EN):** Cap fish prices.
- **Choice (RU):** Ограничить цену на рыбу.
- **Response (EN):** The fast grows less luxurious for traders.
- **Response (RU):** Пост станет чуть менее роскошным для торговцев.
- **Effects:** Church +5, Treasury -5, Health +8

**Choice 2**
- **Choice (EN):** Do not interfere.
- **Choice (RU):** Не вмешиваться.
- **Response (EN):** Merchants stay fed. People fast holily.
- **Response (RU):** Купцы будут сыты. Люди будут свято голодать.
- **Effects:** Treasury +10, Health -8

---

### Encounter #51

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Signs on the walls: 'A king without blessing is no king.' This is no longer a whisper.
**Prompt (RU):** На стенах появились знаки: 'Король без благословения — не король'. Это уже не шёпот.

**Choice 1**
- **Choice (EN):** Erase signs and arrest the writers.
- **Choice (RU):** Стереть знаки и арестовать писцов.
- **Response (EN):** Walls grow clean. People grow careful.
- **Response (RU):** Стены станут чистыми. Люди — осторожнее.
- **Effects:** Church -8, Army +10, Health -5

**Choice 2**
- **Choice (EN):** Answer with a public speech.
- **Choice (RU):** Ответить публичной речью.
- **Response (EN):** Words against graffiti. Sometimes it works.
- **Response (RU):** Слова против надписей. Иногда работает.
- **Effects:** Treasury -5, Health +8

---

### Encounter #52

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** They say the former king cursed the throne before death. The church can dispel the rumor. Or confirm it.
**Prompt (RU):** Говорят, что прежний король проклял трон перед смертью. Церковь может развеять слух. Или подтвердить его.

**Choice 1**
- **Choice (EN):** Ask the church to dispel the rumor.
- **Choice (RU):** Попросить церковь развеять слух.
- **Response (EN):** Curses fear candles, especially paid ones.
- **Response (RU):** Проклятия боятся свечей, особенно оплаченных.
- **Effects:** Church +10, Treasury -8, Health +8

**Choice 2**
- **Choice (EN):** Forbid talk of the curse.
- **Choice (RU):** Запретить говорить о проклятии.
- **Response (EN):** A ban is a poor lid on a boiling pot.
- **Response (RU):** Запрет — плохая крышка для кипящего котла.
- **Effects:** Army +8, Health -8

---

### Encounter #53

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Temples demand thousands of candles. Give me a wax monopoly and half the profit is yours.
**Prompt (RU):** Храмы требуют тысячи свечей. Дайте мне единоличную власть над рынком на воск, и половина прибыли ваша.

**Choice 1**
- **Choice (EN):** Grant the monopoly.
- **Choice (RU):** Дать единоличную власть над рынком.
- **Response (EN):** Candles will burn. So will coins.
- **Response (RU):** Свечи будут гореть. Монеты тоже.
- **Effects:** Church +5, Treasury +20, Health -5

**Choice 2**
- **Choice (EN):** Forbid the monopoly.
- **Choice (RU):** Запретить единоличную власть над рынком.
- **Response (EN):** A free market in candles. How nobly dull.
- **Response (RU):** Свободный рынок свечей. Как возвышенно скучно.
- **Effects:** Treasury -5, Health +5

---

### Encounter #54

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** I received a list of suspected heretics. Half the names in another's hand, half in a trembling one.
**Prompt (RU):** Мне передали список подозреваемых в ереси. Половина имён написана чужой рукой, половина — дрожащей.

**Choice 1**
- **Choice (EN):** Begin arrests.
- **Choice (RU):** Начать аресты.
- **Response (EN):** The list grows shorter. Fear grows longer.
- **Response (RU):** Список станет короче. Страх — длиннее.
- **Effects:** Church +15, Army +8, Health -15

**Choice 2**
- **Choice (EN):** Verify the list.
- **Choice (RU):** Проверить список.
- **Response (EN):** A rare night when paper outlives the axe.
- **Response (RU):** Редкий случай, когда бумага переживёт ночь.
- **Effects:** Church -5, Treasury -5, Health +8

---

### Encounter #55

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** Some sick stopped buying remedies. A priest told them to pray and endure.
**Prompt (RU):** Некоторые больные перестали покупать лекарства. Говорят, священник велел им молиться и терпеть.

**Choice 1**
- **Choice (EN):** Order temples not to hinder healing.
- **Choice (RU):** Приказать храмам не мешать лечению.
- **Response (EN):** Thank you. The sick are glad when you treat them instead of telling them to endure.
- **Response (RU):** Спасибо. Болезни терпение не раздражает, а радует.
- **Effects:** Church -10, Health +15

**Choice 2**
- **Choice (EN):** Support the church.
- **Choice (RU):** Поддержать церковь.
- **Response (EN):** Then let prayers break the fever. I will watch.
- **Response (RU):** Тогда пусть молитвы сбивают жар. Я посмотрю.
- **Effects:** Church +12, Health -15

---

### Encounter #56

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Your priests want to ride north to preach. My prince will call it meddling.
**Prompt (RU):** Ваши священники хотят ехать на север проповедовать. Мой князь сочтёт это вмешательством.

**Choice 1**
- **Choice (EN):** Allow the mission.
- **Choice (RU):** Разрешить миссию.
- **Response (EN):** The north does not love foreign prayers. Especially from the south.
- **Response (RU):** Север не любит чужие молитвы. Особенно с юга.
- **Effects:** Church +15, Army -10

**Choice 2**
- **Choice (EN):** Forbid the mission.
- **Choice (RU):** Запретить миссию.
- **Response (EN):** My prince will value your caution.
- **Response (RU):** Мой князь оценит вашу осторожность.
- **Effects:** Church -10, Army +5, Treasury +5

---

### Encounter #57

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** In the north they say that you are busy with the sick and with bread, not with the sword. I, of course, don't believe this.
**Prompt (RU):** На севере говорят, что вы заняты больными и хлебом, а не мечом. Я, конечно, этому не верю.

**Choice 1**
- **Choice (EN):** Show a military parade.
- **Choice (RU):** Показать военный парад.
- **Response (EN):** Beautiful rows. The North loves to count spears.
- **Response (RU):** Красивые ряды. Север любит считать копья.
- **Effects:** Army +15, Treasury -10

**Choice 2**
- **Choice (EN):** Show full barns.
- **Choice (RU):** Показать полные амбары.
- **Response (EN):** Bread is also a weapon. Especially in winter.
- **Response (RU):** Хлеб тоже оружие. Особенно зимой.
- **Effects:** Treasury -3, Food -5

**Choice 3**
- **Choice (EN):** Give gold and send it home.
- **Choice (RU):** Подарить золото и отправить домой.
- **Response (EN):** A generous gesture. Or a dear request to remain silent.
- **Response (RU):** Щедрый жест. Или дорогая просьба молчать.
- **Effects:** Treasury -15

**Choice 4**
- **Choice (EN):** What else do they say in the north?
- **Choice (RU):** Что ещё говорят на севере?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** They say that the new king puts out fires inside the palace and therefore does not see the smoke on the border.
**Prompt (RU):** Говорят, что новый король тушит пожары внутри дворца и потому не видит дыма на границе.

**Choice 1**
- **Choice (EN):** Strengthen the northern fortresses.
- **Choice (RU):** Укрепить северные крепости.
- **Response (EN):** The north will see the stone. Stone is always clearer than words.
- **Response (RU):** Север увидит камень. Камень всегда понятнее слов.
- **Effects:** Army +20, Treasury -20

**Choice 2**
- **Choice (EN):** Send scouts.
- **Choice (RU):** Отправить разведчиков.
- **Response (EN):** Fine. Eyes are cheaper than war.
- **Response (RU):** Хорошо. Глаза дешевле войны.
- **Effects:** Army +8, Treasury -5

---

### Encounter #58

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** A new coronation is needed. Not in the palace but in the temple. Then the people will see power was given not only by the sword.
**Prompt (RU):** Нужна новая коронация. Не во дворце, а в храме. Тогда народ увидит, что власть дана не только мечом.

**Choice 1**
- **Choice (EN):** Agree to a temple coronation.
- **Choice (RU):** Согласиться на храмовую коронацию.
- **Response (EN):** Now your crown will shine with gold and godly fear.
- **Response (RU):** Теперь ваша корона будет сиять не только золотом, но и страхом Божьим.
- **Effects:** Church +25, Army -5, Treasury -20

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказаться.
- **Response (EN):** Then the temple will be silent. But silence in the temple carries far.
- **Response (RU):** Тогда храм будет молчать. Но молчание в храме слышно далеко.
- **Effects:** Church -25, Army +10

---

### Encounter #59

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** City poor are angry: pilgrims are fed while locals starve. Mercy became envy.
**Prompt (RU):** Городские бедняки злятся: странников кормят, а местные голодают. Милость стала поводом для зависти.

**Choice 1**
- **Choice (EN):** Feed city dwellers first.
- **Choice (RU):** Кормить сначала жителей города.
- **Response (EN):** Save the house before the guests. That is clear.
- **Response (RU):** Дом нужно спасать до гостей. Это понятно.
- **Effects:** Church -5, Health +12, Food -10

**Choice 2**
- **Choice (EN):** Feed all equally.
- **Choice (RU):** Кормить всех поровну.
- **Response (EN):** Hard, costly, right.
- **Response (RU):** Трудно, дорого, правильно.
- **Effects:** Church +8, Health +15, Food -18

---

### Encounter #60

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Temple shops pay no trade tax. Merchants demand fairness. I demand revenue.
**Prompt (RU):** Храмовые лавки не платят торговый налог. Купцы требуют справедливости. Я требую дохода.

**Choice 1**
- **Choice (EN):** Tax the shops.
- **Choice (RU):** Обложить лавки налогом.
- **Response (EN):** Fairness finally brought coins.
- **Response (RU):** Справедливость наконец-то принесла монеты.
- **Effects:** Church -12, Treasury +15

**Choice 2**
- **Choice (EN):** Leave shops tax-free.
- **Choice (RU):** Оставить лавки свободными от налогов.
- **Response (EN):** Holiness is cheaper for the temple than the treasury again.
- **Response (RU):** Святость снова оказалась дешевле для храма, чем для казны.
- **Effects:** Church +10, Treasury -10

---

### Encounter #61

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Young fanatics want to join the army. They are brave but ignore orders when they hear 'heresy'.
**Prompt (RU):** Молодые фанатики просятся в армию. Они храбры, но не слушают приказов, когда слышат слово 'ересь'.

**Choice 1**
- **Choice (EN):** Accept them.
- **Choice (RU):** Принять их в армию.
- **Response (EN):** Bravery gained. Discipline in question.
- **Response (RU):** Храбрость получена. Дисциплина под вопросом.
- **Effects:** Church +8, Army +15, Health -8

**Choice 2**
- **Choice (EN):** Refuse the fanatics.
- **Choice (RU):** Отказать фанатикам.
- **Response (EN):** Better fewer soldiers than a crowd with swords and songs.
- **Response (RU):** Лучше меньше солдат, чем толпа с мечами и песнями.
- **Effects:** Church -10, Army -5, Health +5

---

### Encounter #62

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Some priests say women must not treat men. Today three refused my help.
**Prompt (RU):** Некоторые священники говорят, что женщины не должны лечить мужчин. Сегодня трое отказались от моей помощи.

**Choice 1**
- **Choice (EN):** Forbid such preaching.
- **Choice (RU):** Запретить такие проповеди.
- **Response (EN):** Thank you. Disease does not choose healers by sex.
- **Response (RU):** Спасибо. Болезнь не выбирает лекаря по полу.
- **Effects:** Church -12, Health +15

**Choice 2**
- **Choice (EN):** Do not interfere.
- **Choice (RU):** Не вмешиваться.
- **Response (EN):** Let pride bandage their wounds.
- **Response (RU):** Тогда пусть гордость перевязывает им раны.
- **Effects:** Church +8, Health -12

---

### Encounter #63

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** The monastery brews beer and sells it untaxed. Soldiers are pleased, the treasurer is not.
**Prompt (RU):** Монастырь варит пиво и продаёт его без налога. Солдаты довольны, казначей нет.

**Choice 1**
- **Choice (EN):** Tax monastery beer.
- **Choice (RU):** Обложить монастырское пиво налогом.
- **Response (EN):** Beer grows costly. Prayers grow irritable.
- **Response (RU):** Пиво станет дороже. Молитвы — раздражённее.
- **Effects:** Church -8, Army -3, Treasury +12

**Choice 2**
- **Choice (EN):** Leave it untaxed.
- **Choice (RU):** Оставить без налога.
- **Response (EN):** Soldiers will drink to the church's health.
- **Response (RU):** Солдаты будут пить за здоровье церкви.
- **Effects:** Church +8, Army +5, Treasury -8

---

### Encounter #64

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** A young priest says the king must listen only to the church. The crowd applauds.
**Prompt (RU):** Один молодой священник говорит, что король должен слушать только церковь. Толпа хлопает.

**Choice 1**
- **Choice (EN):** Arrest the priest.
- **Choice (RU):** Арестовать священника.
- **Response (EN):** The crowd sees force. And remembers the arrested face.
- **Response (RU):** Толпа увидит силу. И запомнит лицо арестованного.
- **Effects:** Church -15, Army +10, Health -5

**Choice 2**
- **Choice (EN):** Summon him to talk.
- **Choice (RU):** Вызвать его на разговор.
- **Response (EN):** Softer. But he may take softness for weakness.
- **Response (RU):** Мягче. Но он может принять мягкость за слабость.
- **Effects:** Church +3, Army +3, Treasury -3

---

### Encounter #65

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Malrik proposes a church council at court. Robed advisers will speak for people and gods.
**Prompt (RU):** Малрик предлагает создать церковный совет при троне. Советники в рясах будут говорить от имени народа и богов.

**Choice 1**
- **Choice (EN):** Create the church council.
- **Choice (RU):** Создать церковный совет.
- **Response (EN):** You let the altar into the throne room. Harder to remove.
- **Response (RU):** Вы впустили алтарь в тронный зал. Вывести будет сложнее.
- **Effects:** Church +20, Army -5, Treasury -8

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказать.
- **Response (EN):** Priests stay outside. And speak louder.
- **Response (RU):** Священники останутся снаружи. И начнут говорить громче.
- **Effects:** Church -15, Army +5

---

### Encounter #66

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** The church proposes a luxury tax. Money for the poor — through temple hands, of course.
**Prompt (RU):** Церковь предлагает налог на роскошь. Деньги пойдут бедным. И, разумеется, через храмовые руки.

**Choice 1**
- **Choice (EN):** Levy through the church.
- **Choice (RU):** Ввести налог через церковь.
- **Response (EN):** The rich will hate us both. The poor will eat.
- **Response (RU):** Богатые возненавидят нас обоих. Бедные будут есть.
- **Effects:** Church +15, Treasury +5, Health +8

**Choice 2**
- **Choice (EN):** Levy through the crown.
- **Choice (RU):** Ввести налог через корону.
- **Response (EN):** You took mercy from church hands. Bold.
- **Response (RU):** Вы забрали милосердие из рук церкви. Смело.
- **Effects:** Church -5, Treasury +15, Health +5

---

### Encounter #67

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Beggars reach out at the altar during service. Rich parishioners complain they disturb prayer.
**Prompt (RU):** Во время службы нищие протягивают руки прямо у алтаря. Богатые прихожане жалуются, что им мешают молиться.

**Choice 1**
- **Choice (EN):** Leave beggars at the altar.
- **Choice (RU):** Оставить нищих у алтаря.
- **Response (EN):** Prayer beside poverty is honester.
- **Response (RU):** Молитва рядом с бедностью честнее.
- **Effects:** Church -3, Health +10

**Choice 2**
- **Choice (EN):** Move beggars outside.
- **Choice (RU):** Вывести нищих наружу.
- **Response (EN):** The temple grows prettier. And colder.
- **Response (RU):** Храм станет красивее. И холоднее.
- **Effects:** Church +8, Health -8

---

### Encounter #68

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** The temple wants silver for a new bell. They say its ring will guard the city. I would prefer walls.
**Prompt (RU):** Храм просит серебро на новый колокол. Говорят, его звон будет защищать город. Я бы предпочёл защитные стены.

**Choice 1**
- **Choice (EN):** Fund the bell.
- **Choice (RU):** Дать серебро на колокол.
- **Response (EN):** The bell will ring. The treasury will empty.
- **Response (RU):** Колокол будет звонить. Казна — пустеть.
- **Effects:** Church +15, Treasury -15, Health +5

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказать.
- **Response (EN):** Silence is cheaper than silver.
- **Response (RU):** Тишина дешевле серебра.
- **Effects:** Church -10, Treasury +5

---

### Encounter #69

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** My prince has sent you barrels of salted fish. For free. Almost free. He asks to accept his friendship.
**Prompt (RU):** Мой князь прислал вам бочки солёной рыбы. Бесплатно. Почти бесплатно. Он просит принять его дружбу.

**Choice 1**
- **Choice (EN):** Accept the gift.
- **Choice (RU):** Принять подарок.
- **Response (EN):** Wise. Fish doesn't like to wait, and neither does friendship.
- **Response (RU):** Мудро. Рыба не любит ждать, как и дружба.
- **Effects:** Treasury +3, Food +15

**Choice 2**
- **Choice (EN):** Accept and send gold in return.
- **Choice (RU):** Принять и отправить золото в ответ.
- **Response (EN):** Generous answer. The North loves equal gestures.
- **Response (RU):** Щедрый ответ. Север любит равные жесты.
- **Effects:** Treasury -10, Food +15

**Choice 3**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказаться.
- **Response (EN):** Caution deserves respect. Hunger - no.
- **Response (RU):** Осторожность достойна уважения. Голод — нет.
- **Effects:** Treasury +3, Food -5

**Choice 4**
- **Choice (EN):** What does 'almost free' mean?
- **Choice (RU):** Что значит ‘почти бесплатно’?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** This means that today you accept fish, and tomorrow my prince will remind you that friends do not close bridges and ports.
**Prompt (RU):** Это значит, что сегодня вы принимаете рыбу, а завтра мой князь напомнит, что друзья не закрывают мосты и порты.

**Choice 1**
- **Choice (EN):** Accept fish and friendship.
- **Choice (RU):** Принять рыбу и дружбу.
- **Response (EN):** Then the north will remember the open doors.
- **Response (RU):** Тогда север запомнит открытые двери.
- **Effects:** Army -3, Treasury +3, Food +15

**Choice 2**
- **Choice (EN):** Pay for fish as if it were a commodity.
- **Choice (RU):** Заплатить за рыбу как за товар.
- **Response (EN):** This is how a gift becomes a transaction. Clean but cold.
- **Response (RU):** Так подарок становится сделкой. Чисто, но холодно.
- **Effects:** Treasury -8, Food +15

---

### Encounter #70

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Malrik wants the army to fast before a campaign. A hungry soldier prays and fights worse.
**Prompt (RU):** Малрик хочет, чтобы армия постилась перед походом. Голодный солдат хуже молится и хуже бьёт.

**Choice 1**
- **Choice (EN):** Order the army to fast.
- **Choice (RU):** Приказать армии поститься.
- **Response (EN):** If the enemy strikes, we will throw prayers.
- **Response (RU):** Если враг нападёт, будем бросать в него молитвы.
- **Effects:** Church +15, Army -15, Food +10

**Choice 2**
- **Choice (EN):** Exempt the army from fasting.
- **Choice (RU):** Освободить армию от поста.
- **Response (EN):** Thank you. A soldier with meat in his belly beats a holy skeleton.
- **Response (RU):** Спасибо. Солдат с мясом в животе полезнее святого скелета.
- **Effects:** Church -10, Army +12, Food -5

---

### Encounter #71

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** If the army itself runs the kitchens, the soldiers will not go hungry.
**Prompt (RU):** Если армия сама будет управлять кухнями, солдаты не останутся голодными.

**Choice 1**
- **Choice (EN):** Transfer the kitchens to the military.
- **Choice (RU):** Передать кухни военным.
- **Response (EN):** The soldiers will feed the soldiers. It's more reliable this way.
- **Response (RU):** Солдаты будут кормить солдат. Так надёжнее.
- **Effects:** Army +15, Food -10

**Choice 2**
- **Choice (EN):** Leave the kitchens to the chefs.
- **Choice (RU):** Оставить кухни поварам.
- **Response (EN):** Then let the cooks remember: a hungry soldier is a bad guest.
- **Response (RU):** Тогда пусть повара помнят: голодный солдат — плохой гость.
- **Effects:** Army -5, Food +5

**Choice 3**
- **Choice (EN):** Share control.
- **Choice (RU):** Разделить контроль.
- **Response (EN):** Compromise. I don't like them, but at least this one is edible.
- **Response (RU):** Компромисс. Я не люблю их, но этот хотя бы съедобен.
- **Effects:** Army +5, Treasury -3, Food +5

**Choice 4**
- **Choice (EN):** Do you want to control the bread?
- **Choice (RU):** Вы хотите контролировать хлеб?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** I want to control what, without which a soldier ceases to be a soldier and becomes a hungry man with a spear.
**Prompt (RU):** Я хочу контролировать то, без чего солдат перестаёт быть солдатом и становится голодным мужиком с копьём.

**Choice 1**
- **Choice (EN):** Give the army separate warehouses.
- **Choice (RU):** Дать армии отдельные склады.
- **Response (EN):** That's enough. Until the warehouses are empty.
- **Response (RU):** Этого хватит. Пока склады не опустеют.
- **Effects:** Army +10, Food -8

**Choice 2**
- **Choice (EN):** Appoint a general caretaker.
- **Choice (RU):** Назначить общего смотрителя.
- **Response (EN):** If he's honest, it will work. If not, I'll find out.
- **Response (RU):** Если он будет честен, это сработает. Если нет — я узнаю.
- **Effects:** Army +5, Treasury -3, Food +5

---

### Encounter #72

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Pilgrims brought a new disease. Priests call it a trial. I call it plague.
**Prompt (RU):** Странники принесли новую болезнь. Священники называют её испытанием. Я называю её заразой.

**Choice 1**
- **Choice (EN):** Close the city to pilgrims.
- **Choice (RU):** Закрыть город для странников.
- **Response (EN):** It saves the city. And angers those bound for the shrine.
- **Response (RU):** Это спасёт город. И разозлит тех, кто идёт к святыне.
- **Effects:** Church -15, Health +20, Food +5

**Choice 2**
- **Choice (EN):** Screen pilgrims at the gates.
- **Choice (RU):** Проверять странников у ворот.
- **Response (EN):** Slow, but better than letting sickness in with hymns.
- **Response (RU):** Медленно, но лучше, чем пускать болезнь с песнями.
- **Effects:** Church -3, Treasury -8, Health +12

---

### Encounter #73

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Fish for the fast is sold by the temple. Half already smells like a sermon after rain.
**Prompt (RU):** У храма продают рыбу для поста. Половина уже пахнет как проповедь после дождя.

**Choice 1**
- **Choice (EN):** Seize spoiled fish.
- **Choice (RU):** Конфисковать испорченную рыбу.
- **Response (EN):** People lose supper but keep their guts.
- **Response (RU):** Люди потеряют ужин, но сохранят животы.
- **Effects:** Church -3, Health +12, Food -5

**Choice 2**
- **Choice (EN):** Allow sale after salting.
- **Choice (RU):** Разрешить продавать после засолки.
- **Response (EN):** Salt is not magic. Though merchants believe otherwise.
- **Response (RU):** Соль — не магия. Хотя купцы верят обратному.
- **Effects:** Health -8, Food +8

---

### Encounter #74

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** After the sermon a crowd marches on the palace. They carry candles, not weapons. But candles can burn doors.
**Prompt (RU):** После проповеди толпа идёт к дворцу. Они несут свечи, не оружие. Но свечой тоже можно поджечь дверь.

**Choice 1**
- **Choice (EN):** Meet them with guards.
- **Choice (RU):** Встретить толпу стражей.
- **Response (EN):** Candles die fast. Anger does not.
- **Response (RU):** Свечи погаснут быстро. Гнев — нет.
- **Effects:** Church -5, Army +10, Health -5

**Choice 2**
- **Choice (EN):** Go out to them yourself.
- **Choice (RU):** Выйти к ним лично.
- **Response (EN):** I will be near. If candles turn to torches, run first.
- **Response (RU):** Я буду рядом. Если свечи станут факелами, бегите первым.
- **Effects:** Church +3, Army -5, Health +10

---

### Encounter #75

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** If the church names you pious, many will forget the coup. But the church gives no such gifts for free.
**Prompt (RU):** Если церковь назовёт вас благочестивым, многие забудут переворот. Но церковь не делает таких подарков бесплатно.

**Choice 1**
- **Choice (EN):** Buy a pious reputation.
- **Choice (RU):** Купить благочестивую репутацию.
- **Response (EN):** Reputation bought. Now hide the receipt.
- **Response (RU):** Репутация куплена. Теперь важно, чтобы чек не нашли.
- **Effects:** Church +20, Treasury -20, Health +5

**Choice 2**
- **Choice (EN):** Earn it by deeds.
- **Choice (RU):** Заслужить её делами.
- **Response (EN):** Slower. But stronger.
- **Response (RU):** Медленнее. Но крепче.
- **Effects:** Church +5, Treasury -10, Health +10

---

### Encounter #76

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Bakers sell 'holy bread' triple the price. People buy from fear of disease.
**Prompt (RU):** Пекари продают 'святой хлеб' втрое дороже обычного. Народ покупает, потому что боится болезни.

**Choice 1**
- **Choice (EN):** Ban holy bread.
- **Choice (RU):** Запретить святой хлеб.
- **Response (EN):** You forbade fear as merchandise. Bold.
- **Response (RU):** Вы запретили страху быть товаром. Смело.
- **Effects:** Church -8, Treasury -5, Health +10

**Choice 2**
- **Choice (EN):** Tax holy bread.
- **Choice (RU):** Обложить святой хлеб налогом.
- **Response (EN):** If people pay for fear, the crown gets a share.
- **Response (RU):** Если люди платят за страх, корона хотя бы получит долю.
- **Effects:** Church -3, Treasury +15, Health -5

---

### Encounter #77

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** The church demands burning books found with a scholar. They corrupt souls, they say.
**Prompt (RU):** Церковь требует сжечь книги, найденные у учёного. Говорят, они портят души.

**Choice 1**
- **Choice (EN):** Burn the books.
- **Choice (RU):** Сжечь книги.
- **Response (EN):** Paper burns fast. Ideas burn differently.
- **Response (RU):** Бумага горит быстро. Идеи горят иначе.
- **Effects:** Church +15, Health -5

**Choice 2**
- **Choice (EN):** Hide books in the royal archive.
- **Choice (RU):** Спрятать книги в королевском архиве.
- **Response (EN):** Secret fire can be deadlier than open flame.
- **Response (RU):** Тайный огонь иногда опаснее открытого.
- **Effects:** Church -10, Treasury -3, Health +3

---

### Encounter #78

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** Priests call my herbs witchcraft. Funny that their monks buy the same herbs at the back door.
**Prompt (RU):** Священники называют мои травы ведьмовством. Забавно, что их монахи покупают те же травы через заднюю дверь.

**Choice 1**
- **Choice (EN):** Protect Sivil.
- **Choice (RU):** Защитить Сивил.
- **Response (EN):** Thank you. I am almost moved. Almost.
- **Response (RU):** Спасибо. Я почти тронута. Почти.
- **Effects:** Church -12, Health +15

**Choice 2**
- **Choice (EN):** Ban her herbs.
- **Choice (RU):** Запретить её травы.
- **Response (EN):** Let monks cure coughs with psalms.
- **Response (RU):** Тогда пусть монахи лечат кашель псалмами.
- **Effects:** Church +12, Health -15

---

### Encounter #79

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Families from the north came to your gates. They flee war but pray to other gods.
**Prompt (RU):** К вашим воротам пришли семьи с севера. Они бегут от войны, но молятся не вашим богам.

**Choice 1**
- **Choice (EN):** Accept the refugees.
- **Choice (RU):** Принять беженцев.
- **Response (EN):** The north will remember your mercy. Your priests too.
- **Response (RU):** Север запомнит вашу милость. Ваши священники — тоже.
- **Effects:** Church -15, Health +8, Food -15

**Choice 2**
- **Choice (EN):** Refuse them.
- **Choice (RU):** Отказать им.
- **Response (EN):** Cold mercy. Almost northern.
- **Response (RU):** Холодная милость. Почти северная.
- **Effects:** Church +10, Health -8, Food +5

---

## Late Pool A

### Encounter #80

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик
**Note (EN):** Pool slot on day 30 (Church unlock). **At runtime replaced by** [Crown Forfeit & church tax War — Beat 1](#beat-1--day-30--the-verdict). Legacy one-node text preserved in encounters_en.das until `church_crown_arc.das` ships.
**Note (RU):** Фиксированная поздняя встреча в день 30 (разблокировка Церкви). Варианты 0 и 2 дают прозвище «Святой»; вариант 1 — «Требователь».

#### Node 0

**Prompt (EN):** Your Majesty, the people know your crown, but do not know whether it is blessed. Today the church must decide whether to name you king or one who took the throne.
**Prompt (RU):** Ваше Величество, народ знает вашу корону, но не знает, благословлена ли она. Сегодня церковь должна решить, как называть вас: королём или тем, кто взял трон.

**Choice 1**
- **Choice (EN):** Ask the church for a blessing.
- **Choice (RU):** Попросить церковь о благословении.
- **Response (EN):** Humility is a fitting beginning for one who reached the throne through blood.
- **Response (RU):** Смирение — хорошее начало для того, кто пришёл к трону через кровь.
- **Effects:** Church +20, Treasury -10

**Choice 2**
- **Choice (EN):** Demand recognition of my authority.
- **Choice (RU):** Потребовать признания моей власти.
- **Response (EN):** Orders reach soldiers. They rise to heaven far less well.
- **Response (RU):** Приказы доходят до солдат. До небес они поднимаются хуже.
- **Effects:** Church -15, Army +8

---

### Encounter #81

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** After the sermon, more hungry folk came to the monastery than usual. They believe the temple will feed them if the king cannot.
**Prompt (RU):** После проповеди к монастырю пришло больше голодных, чем обычно. Они верят, что храм накормит их, если король не может.

**Choice 1**
- **Choice (EN):** Send grain to the monastery.
- **Choice (RU):** Передать монастырю зерно.
- **Response (EN):** Today faith will smell of bread.
- **Response (RU):** Сегодня вера будет пахнуть хлебом.
- **Effects:** Church +8, Health +15, Food -15

**Choice 2**
- **Choice (EN):** Let the monastery feed them on its own.
- **Choice (RU):** Пусть монастырь сам кормит людей.
- **Response (EN):** We will try. But an empty pot does not become holy through prayer.
- **Response (RU):** Мы попробуем. Но пустой котёл не становится святым от молитвы.
- **Effects:** Church -5, Health -8, Food +5

---

### Encounter #82

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Temples collect church tax. The treasury collects taxes. Soon the people will see they pay twice.
**Prompt (RU):** Храмы собирают церковный налог. Казна собирает налоги. Народ скоро поймёт, что платит дважды.

**Choice 1**
- **Choice (EN):** Limit the church tax.
- **Choice (RU):** Ограничить церковный налог.
- **Response (EN):** The treasury is grateful. The altar will hiss.
- **Response (RU):** Казна благодарна. Алтарь будет шипеть.
- **Effects:** Church -20, Treasury +15, Health +5

**Choice 2**
- **Choice (EN):** Leave the church tax to the church.
- **Choice (RU):** Оставить церковный налог церкви.
- **Response (EN):** Priests love it when their gold is called faith.
- **Response (RU):** Священники любят, когда их золото называют верой.
- **Effects:** Church +10, Treasury -10

---

### Encounter #83

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Malrik wants priests in the barracks. He says soldiers need souls. Soldiers need bread and steel.
**Prompt (RU):** Малрик хочет отправить священников в казармы. Говорит, солдатам нужна душа. Солдатам нужен хлеб и сталь.

**Choice 1**
- **Choice (EN):** Allow priests in the barracks.
- **Choice (RU):** Разрешить священников в казармах.
- **Response (EN):** If they start teaching mercy to soldiers, I will throw them out myself.
- **Response (RU):** Если они начнут учить солдат милосердию, я выставлю их сам.
- **Effects:** Church +12, Army -5

**Choice 2**
- **Choice (EN):** Forbid them entry.
- **Choice (RU):** Запретить им вход.
- **Response (EN):** The barracks will remain barracks, not a hall of prayer.
- **Response (RU):** Казармы останутся казармами, а не молитвенным залом.
- **Effects:** Church -12, Army +10

---

### Encounter #84

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** People refuse to drink boiled water. They buy holy water instead. It comes from the same filthy well.
**Prompt (RU):** Люди отказываются пить кипячённую воду. Они покупают святую. Она из того же грязного колодца.

**Choice 1**
- **Choice (EN):** Ban the sale of holy water.
- **Choice (RU):** Запретить продажу святой воды.
- **Response (EN):** Thank you. Disease does not vanish when filth is blessed.
- **Response (RU):** Спасибо. Болезнь не исчезнет от молитвы над грязью.
- **Effects:** Church -15, Health +15

**Choice 2**
- **Choice (EN):** Order temples to boil water before consecration.
- **Choice (RU):** Приказать храмам кипятить воду перед освящением.
- **Response (EN):** Good. Let faith at least stop carrying infection.
- **Response (RU):** Хорошо. Пусть вера хотя бы не переносит заразу.
- **Effects:** Church +5, Treasury -3, Health +12

---

### Encounter #85

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** The church has declared a fast. There will be less meat, which is fine. Yet soldiers already ask why the gods need their stew.
**Prompt (RU):** Церковь объявила пост. Мяса будет меньше, это хорошо. Но солдаты уже спрашивают, почему богам нужна их похлёбка.

**Choice 1**
- **Choice (EN):** Fast for all, army included.
- **Choice (RU):** Пост для всех, включая армию.
- **Response (EN):** Turnips will be holy. Soldiers will be furious.
- **Response (RU):** Репа станет святой. Солдаты — злые.
- **Effects:** Church +10, Army -15, Food +20

**Choice 2**
- **Choice (EN):** Fast only for the palace.
- **Choice (RU):** Пост только для дворца.
- **Response (EN):** Now that is a sight: courtiers suffering almost like common folk.
- **Response (RU):** Вот это зрелище: придворные страдают почти как люди.
- **Effects:** Church +5, Health +5, Food +5

---

### Encounter #86

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** A crowd gathers by the main temple. They demand that the church declare whether you are a lawful king.
**Prompt (RU):** У главного храма собралась толпа. Они требуют, чтобы церковь сказала, законный ли вы король.

**Choice 1**
- **Choice (EN):** Post guards at the temple.
- **Choice (RU):** Поставить стражу у храма.
- **Response (EN):** Spears may hold doors. Not questions.
- **Response (RU):** Копья удержат двери. Не вопросы.
- **Effects:** Church -5, Army +8, Health -5

**Choice 2**
- **Choice (EN):** Let the crowd hear the sermon.
- **Choice (RU):** Позволить толпе слушать проповедь.
- **Response (EN):** Very well. But if words turn to sparks, I warned you.
- **Response (RU):** Хорошо. Но если слова станут искрами, я предупреждал.
- **Effects:** Church +8, Health +5

---

### Encounter #87

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** A king who quarrels with the church gains an enemy in every temple. A king who submits to it loses his throne without battle.
**Prompt (RU):** Король, который спорит с церковью, получает врага в каждом храме. Король, который ей подчиняется, теряет трон без боя.

**Choice 1**
- **Choice (EN):** Grant the church broader rights.
- **Choice (RU):** Дать церкви больше прав.
- **Response (EN):** The altar will smile. The throne will stand a little lower.
- **Response (RU):** Алтарь улыбнётся. Трон станет чуть ниже.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2**
- **Choice (EN):** Bind the church by law.
- **Choice (RU):** Ограничить церковь законом.
- **Response (EN):** A bold move. Such footsteps are often heard near a scaffold.
- **Response (RU):** Смелый шаг. Такие шаги часто слышны у эшафота.
- **Effects:** Church -20, Army +5, Treasury +10

---

### Encounter #88

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Since the church reopened, people buy candles, icons, and amulets. I can organize the trade and pay you a share.
**Prompt (RU):** После открытия церкви люди покупают свечи, иконы, амулеты. Я могу наладить торговлю. И отдать вам долю.

**Choice 1**
- **Choice (EN):** Permit trade in holy wares.
- **Choice (RU):** Разрешить торговлю святынями.
- **Response (EN):** Faith sells better than bread, and keeps longer.
- **Response (RU):** Вера продаётся лучше хлеба. И хранится дольше.
- **Effects:** Church -8, Treasury +20

**Choice 2**
- **Choice (EN):** Forbid profit from faith.
- **Choice (RU):** Запретить наживаться на вере.
- **Response (EN):** Noble. Very unprofitable.
- **Response (RU):** Благородно. Очень невыгодно.
- **Effects:** Church +10, Treasury -10, Health +5

---

### Encounter #89

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** Priests brought a man who spat upon temple doors. They demand a public execution.
**Prompt (RU):** Священники привели человека, который плевал на храмовые двери. Они требуют публичной казни.

**Choice 1**
- **Choice (EN):** Execute him.
- **Choice (RU):** Казнить его.
- **Response (EN):** The square will receive its lesson again. I hope it is worth the blood.
- **Response (RU):** Площадь снова получит урок. Надеюсь, он будет стоить этой крови.
- **Effects:** Church +15, Army +5, Health -10

**Choice 2**
- **Choice (EN):** Throw him in the dungeon.
- **Choice (RU):** Посадить в темницу.
- **Response (EN):** A dungeon is quieter than a gallows, but priests prefer loud answers.
- **Response (RU):** Тюрьма тише виселицы. Но священники любят громкие ответы.
- **Effects:** Church -5, Army +5

---

### Encounter #90

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** Temples burn incense against pestilence. It smells lovely. It heals nothing. I have better herbs.
**Prompt (RU):** Храмы жгут ладан против заразы. Красиво пахнет. Бесполезно лечит. У меня есть травы получше.

**Choice 1**
- **Choice (EN):** Buy herbs from Sivil.
- **Choice (RU):** Купить травы у Сивил.
- **Response (EN):** Herbs are rougher than prayers, yet they work more often.
- **Response (RU):** Травы грубее молитв, зато чаще работают.
- **Effects:** Church -5, Treasury -12, Health +15

**Choice 2**
- **Choice (EN):** Support the temple incense.
- **Choice (RU):** Поддержать храмовый ладан.
- **Response (EN):** Then let disease choke on fragrance, if it can.
- **Response (RU):** Тогда пусть болезнь задохнётся от аромата. Если сможет.
- **Effects:** Church +10, Treasury -5, Health -8

---

### Encounter #91

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** My prince asks whether your church now rules beside you. In the north, such kings are called soft.
**Prompt (RU):** Мой князь спрашивает, правда ли ваша церковь теперь правит вместе с вами. На севере таких королей называют мягкими.

**Choice 1**
- **Choice (EN):** Say the church is my ally.
- **Choice (RU):** Сказать, что церковь — мой союзник.
- **Response (EN):** The north will hear and decide you share your sword with prayer.
- **Response (RU):** Север услышит. И решит, что вы делите меч с молитвой.
- **Effects:** Church +10, Army -5

**Choice 2**
- **Choice (EN):** Say the church bends to the throne.
- **Choice (RU):** Сказать, что церковь подчиняется трону.
- **Response (EN):** Good. The north respects those who keep the altar by the throat.
- **Response (RU):** Хорошо. Север уважает тех, кто держит алтарь за горло.
- **Effects:** Church -10, Army +10

---

### Encounter #92

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** The church asks for the right to judge crimes against the faith. Without it, the temple remains toothless.
**Prompt (RU):** Церковь просит право судить преступления против веры. Без этого храм остаётся без зубов.

**Choice 1**
- **Choice (EN):** Grant the church judicial power.
- **Choice (RU):** Дать церкви право суда.
- **Response (EN):** Faith without judgment is a plea. Faith with judgment is law.
- **Response (RU):** Вера без суда — просьба. Вера с судом — закон.
- **Effects:** Church +20, Army -5, Health -8

**Choice 2**
- **Choice (EN):** Keep judgment under the crown.
- **Choice (RU):** Оставить суд короне.
- **Response (EN):** Then do not be surprised when sinners begin to love royal law.
- **Response (RU):** Тогда не удивляйтесь, если грешники начнут любить королевский закон.
- **Effects:** Church -15, Army +8

---

### Encounter #93

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** People fleeing tax collectors took refuge in a temple. They are hungry and terrified. Will you demand their surrender?
**Prompt (RU):** В храме укрылись люди, бежавшие от сборщиков налогов. Они голодны и напуганы. Вы потребуете их выдачи?

**Choice 1**
- **Choice (EN):** Demand their surrender.
- **Choice (RU):** Потребовать выдачи.
- **Response (EN):** Temple doors will open, but people will remember holiness did not protect them.
- **Response (RU):** Храмовые двери откроются. Но люди запомнят, что святость не защитила их.
- **Effects:** Church -10, Army +5, Treasury +10

**Choice 2**
- **Choice (EN):** Leave them in sanctuary.
- **Choice (RU):** Оставить их в храме.
- **Response (EN):** Thank you. At times, sanctuary matters more than statute.
- **Response (RU):** Спасибо. Иногда убежище важнее закона.
- **Effects:** Church +10, Treasury -10, Health +5

---

### Encounter #94

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Malrik wishes to build a new cathedral. The treasury has a hole, yet the cathedral may calm the people.
**Prompt (RU):** Малрик хочет строить новый собор. В казне дыра, но собор может успокоить народ.

**Choice 1**
- **Choice (EN):** Allocate funds for the cathedral.
- **Choice (RU):** Выделить деньги на собор.
- **Response (EN):** Stone for the temple. Emptiness for the treasury.
- **Response (RU):** Камни для храма. Пустота для казны.
- **Effects:** Church +20, Treasury -25, Health +5

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказать.
- **Response (EN):** The treasury thanks you. The temple will curse you with excellent acoustics.
- **Response (RU):** Казна благодарит. Храм проклянёт с хорошей акустикой.
- **Effects:** Church -15, Treasury +10

---

### Encounter #95

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Priests want to stitch church crosses on military banners. Soldiers serve the king, not the temple.
**Prompt (RU):** Священники хотят вышить церковные кресты на военных знамёнах. Солдаты служат королю, не храму.

**Choice 1**
- **Choice (EN):** Add crosses to the banners.
- **Choice (RU):** Добавить кресты на знамёна.
- **Response (EN):** Now soldiers carry not only your crest. A dangerous symbol.
- **Response (RU):** Теперь солдаты будут нести не только ваш герб. Опасный символ.
- **Effects:** Church +15, Army -8

**Choice 2**
- **Choice (EN):** Forbid church signs on banners.
- **Choice (RU):** Запретить церковные знаки на знамёнах.
- **Response (EN):** Good. In battle a soldier must see orders, not sermons.
- **Response (RU):** Хорошо. В бою солдат должен видеть приказ, а не проповедь.
- **Effects:** Church -12, Army +10

---

### Encounter #96

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** The sick queue for a saint's relics. They stand hours in rain instead of going to the infirmary.
**Prompt (RU):** Больные выстраиваются к мощам святого. Они стоят часами под дождём вместо того, чтобы идти в лазарет.

**Choice 1**
- **Choice (EN):** Forbid the relic queue.
- **Choice (RU):** Запретить очередь к мощам.
- **Response (EN):** You will save bodies. Souls will rage.
- **Response (RU):** Вы спасёте тела. Души будут возмущаться.
- **Effects:** Church -15, Health +15

**Choice 2**
- **Choice (EN):** Place healers beside the relics.
- **Choice (RU):** Поставить лекарей рядом с мощами.
- **Response (EN):** Good. Let miracle work beside bandages.
- **Response (RU):** Хорошо. Пусть чудо работает рядом с бинтами.
- **Effects:** Church +5, Treasury -8, Health +15

---

### Encounter #97

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Temples want the best flour for holy bread. I could feed orphans with that flour.
**Prompt (RU):** Храмы просят лучшую муку для священного хлеба. А я этой мукой могу накормить сирот.

**Choice 1**
- **Choice (EN):** Give the best flour to temples.
- **Choice (RU):** Отдать лучшую муку храмам.
- **Response (EN):** Holy bread will be soft. Orphans' porridge thin.
- **Response (RU):** Святой хлеб выйдет мягким. Детские каши — жидкими.
- **Effects:** Church +12, Food -10

**Choice 2**
- **Choice (EN):** Give the flour to orphans.
- **Choice (RU):** Отдать муку сиротам.
- **Response (EN):** Children will thank you. Priests will complain longer.
- **Response (RU):** Дети скажут спасибо. Священники будут жаловаться дольше.
- **Effects:** Church -8, Health +12, Food -8

---

### Encounter #98

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** A priest refused temple gates to guards. Inside is church land, not royal.
**Prompt (RU):** Священник отказался открыть ворота храма стражникам. Говорит, внутри церковная земля, а не королевская.

**Choice 1**
- **Choice (EN):** Break in by force.
- **Choice (RU):** Вломиться силой.
- **Response (EN):** The door falls. And something greater with it.
- **Response (RU):** Дверь падёт. А вместе с ней что-то большее.
- **Effects:** Church -20, Army +12, Health -5

**Choice 2**
- **Choice (EN):** Withdraw.
- **Choice (RU):** Отступить.
- **Response (EN):** The guard will remember. Priests too.
- **Response (RU):** Стража это запомнит. Священники тоже.
- **Effects:** Church +10, Army -10

---

### Encounter #99

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** The church's opening brought not peace but a new center of power. Every order is compared to a sermon.
**Prompt (RU):** Открытие церкви принесло не мир, а новый центр власти. Теперь каждый ваш приказ будут сравнивать с проповедью.

**Choice 1**
- **Choice (EN):** Make the church official support of the throne.
- **Choice (RU):** Сделать церковь официальной опорой трона.
- **Response (EN):** You gained a holy shield. And a holy chain.
- **Response (RU):** Вы получили святой щит. И святую цепь.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2**
- **Choice (EN):** Keep the church at distance.
- **Choice (RU):** Удерживать церковь на расстоянии.
- **Response (EN):** Safer for the throne. Riskier for the people's soul.
- **Response (RU):** Безопаснее для трона. Опаснее для души народа.
- **Effects:** Church -10, Army +5, Treasury +5

---

### Encounter #100

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Some priests want to preach about the blood of the coup this Sunday. I can forbid them. But forbidding in the temple comes at a price.
**Prompt (RU):** Некоторые священники хотят в воскресенье говорить о крови переворота. Я могу запретить им. Но запреты в храме стоят дорого.

**Choice 1**
- **Choice (EN):** Forbid preaching about the coup.
- **Choice (RU):** Запретить проповедь о перевороте.
- **Response (EN):** Silence is bought. But it does not always keep long.
- **Response (RU):** Молчание куплено. Но оно не всегда хранится долго.
- **Effects:** Church +8, Treasury -10, Health +5

**Choice 2**
- **Choice (EN):** Let them speak the truth.
- **Choice (RU):** Пусть говорят правду.
- **Response (EN):** Truth in the temple rings louder than in the square.
- **Response (RU):** Правда в храме звучит громче, чем на площади.
- **Effects:** Church +5, Army -8, Health -5

---

### Encounter #101

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** I wish to open a shelter at the monastery. Orphans will live, learn, and work. But we need bread and a little gold.
**Prompt (RU):** Я хочу открыть приют при монастыре. Сироты будут жить, учиться и работать. Но нам нужен хлеб и немного золота.

**Choice 1**
- **Choice (EN):** Support the shelter.
- **Choice (RU):** Поддержать приют.
- **Response (EN):** You gave the children not only a roof, but a tomorrow.
- **Response (RU):** Вы дали детям не только крышу, но и завтра.
- **Effects:** Church +8, Treasury -12, Health +20, Food -8

**Choice 2**
- **Choice (EN):** Give grain only.
- **Choice (RU):** Дать только зерно.
- **Response (EN):** They will eat. For now that is already a miracle.
- **Response (RU):** Они будут есть. Пока это уже чудо.
- **Effects:** Church +3, Health +10, Food -10

---

### Encounter #102

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** The church sells letters of absolution. Tax them and the treasury will revive.
**Prompt (RU):** Церковь продаёт грамоты отпущения грехов. Если взять с этого налог, казна оживёт.

**Choice 1**
- **Choice (EN):** Tax the letters.
- **Choice (RU):** Обложить грамоты налогом.
- **Response (EN):** Sin will finally work for the treasury.
- **Response (RU):** Грех наконец начнёт работать на казну.
- **Effects:** Church -10, Treasury +20

**Choice 2**
- **Choice (EN):** Ban the sale of letters.
- **Choice (RU):** Запретить продажу грамот.
- **Response (EN):** Moral. But morality does not jingle.
- **Response (RU):** Морально. Но мораль не звенит.
- **Effects:** Church -15, Health +8

---

### Encounter #103

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Priests say the northerners are godless. If they continue, soldiers will start waiting for war.
**Prompt (RU):** Священники говорят, что северяне — безбожники. Если они продолжат, солдаты сами начнут ждать войны.

**Choice 1**
- **Choice (EN):** Allow such sermons.
- **Choice (RU):** Разрешить такие проповеди.
- **Response (EN):** Soldiers love an enemy they were blessed to hate.
- **Response (RU):** Солдаты любят врага, которого им благословили ненавидеть.
- **Effects:** Church +15, Army +10, Treasury -5

**Choice 2**
- **Choice (EN):** Forbid war sermons.
- **Choice (RU):** Запретить военные проповеди.
- **Response (EN):** Sensible. There is war enough without holy cries.
- **Response (RU):** Разумно. Войны хватает и без святых криков.
- **Effects:** Church -12, Army -5, Treasury +5

---

### Encounter #104

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Monks heal with herbs but keep no records of doses. Today a child nearly died from too strong a brew.
**Prompt (RU):** Монахи лечат травами, но не записывают дозы. Сегодня один ребёнок чуть не умер от слишком крепкого отвара.

**Choice 1**
- **Choice (EN):** Require monastery healers to keep records.
- **Choice (RU):** Обязать монастырских лекарей вести записи.
- **Response (EN):** Ink will save those prayers heal blindly.
- **Response (RU):** Чернила спасут тех, кого молитвы лечат вслепую.
- **Effects:** Church -5, Treasury -3, Health +15

**Choice 2**
- **Choice (EN):** Ban monastery healing.
- **Choice (RU):** Запретить монастырское лечение.
- **Response (EN):** It will stop mistakes. And some help too.
- **Response (RU):** Это остановит ошибки. И часть помощи тоже.
- **Effects:** Church -15, Health +10

---

### Encounter #105

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Pilgrims are coming to the capital. If unfed they collapse at the gates. If fed, our stores collapse.
**Prompt (RU):** К столице идут странники. Если их не накормить, они рухнут у ворот. Если накормить — рухнут наши запасы.

**Choice 1**
- **Choice (EN):** Feed the pilgrims.
- **Choice (RU):** Накормить странников.
- **Response (EN):** Holy folk eat like anyone else. Sometimes even more.
- **Response (RU):** Святые люди едят как обычные. Иногда даже больше.
- **Effects:** Church +15, Health +10, Food -20

**Choice 2**
- **Choice (EN):** Admit only those who bring their own food.
- **Choice (RU):** Пустить только тех, кто несёт еду с собой.
- **Response (EN):** The city keeps grain. Pilgrims keep resentment.
- **Response (RU):** Город сохранит зерно. Странники сохранят обиду.
- **Effects:** Church -8, Health -3, Food +5

---

### Encounter #106

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Pilgrims enter the city. Among them one can hide spies, killers, and deserters.
**Prompt (RU):** В город идут странники. Среди них легко спрятать шпионов, убийц и беглых солдат.

**Choice 1**
- **Choice (EN):** Search all pilgrims.
- **Choice (RU):** Обыскивать всех странников.
- **Response (EN):** Safer. But holiness will wait in line for inspection.
- **Response (RU):** Безопаснее. Но святость будет стоять в очереди на досмотр.
- **Effects:** Church -8, Army +10, Health -3

**Choice 2**
- **Choice (EN):** Let all pass unchecked.
- **Choice (RU):** Пускать всех без проверки.
- **Response (EN):** Open gates are loved by more than the faithful.
- **Response (RU):** Открытые ворота любят не только верующие.
- **Effects:** Church +10, Army -10

---

### Encounter #107

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Temples demand return of lands seized by the former king. Land gives bread. Bread gives power.
**Prompt (RU):** Храмы требуют вернуть земли, конфискованные прежним королём. Земли дают хлеб. Хлеб даёт власть.

**Choice 1**
- **Choice (EN):** Return the lands to the church.
- **Choice (RU):** Вернуть земли церкви.
- **Response (EN):** The altar grows richer. The throne — more grateful or weaker.
- **Response (RU):** Алтарь станет богаче. Трон — благодарнее или слабее.
- **Effects:** Church +20, Treasury -10, Food -15

**Choice 2**
- **Choice (EN):** Keep the lands for the crown.
- **Choice (RU):** Оставить земли короне.
- **Response (EN):** The land stays yours. So do the curses.
- **Response (RU):** Земля останется у вас. Проклятия тоже.
- **Effects:** Church -20, Treasury +10, Food +10

---

### Encounter #108

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Pilgrims buy everything: bread, candles, water, rags, hope. Permit a temporary market by the temple.
**Prompt (RU):** Странники покупают всё: хлеб, свечи, воду, тряпки, надежду. Разрешите временный рынок у храма.

**Choice 1**
- **Choice (EN):** Allow the market and take a toll.
- **Choice (RU):** Разрешить рынок и взять пошлину.
- **Response (EN):** Faith brings buyers. The crown takes the coins.
- **Response (RU):** Вера приведёт покупателей. Корона заберёт монеты.
- **Effects:** Church -5, Treasury +20, Food -5

**Choice 2**
- **Choice (EN):** Allow the market without toll.
- **Choice (RU):** Разрешить рынок без пошлины.
- **Response (EN):** Rare generosity. Merchants will pray for you.
- **Response (RU):** Редкая щедрость. Купцы будут молиться за вас.
- **Effects:** Church +8, Treasury -5, Health +3

---

### Encounter #109

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** Some prisoners suddenly grew very pious. They ask to replace execution with monastery penance.
**Prompt (RU):** Некоторые заключённые вдруг стали очень набожными. Просят заменить казнь монастырским покаянием.

**Choice 1**
- **Choice (EN):** Allow penance instead of execution.
- **Choice (RU):** Разрешить покаяние вместо казни.
- **Response (EN):** The monastery gets sinners. I get a free day.
- **Response (RU):** Монастырь получит грешников. Я — свободный день.
- **Effects:** Church +12, Army -8, Health +8

**Choice 2**
- **Choice (EN):** Execute as sentenced.
- **Choice (RU):** Казнить по приговору.
- **Response (EN):** Faith came late. The axe — on time.
- **Response (RU):** Вера пришла поздно. Топор — вовремя.
- **Effects:** Church -5, Army +10, Health -5

---

### Encounter #110

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** The temple sells holy salve for sores. It holds fat, wax, and lies. My salves at least smell honest.
**Prompt (RU):** Храм продаёт святую мазь от язв. В ней жир, воск и ложь. Мои мази хотя бы честно воняют.

**Choice 1**
- **Choice (EN):** Ban holy salve.
- **Choice (RU):** Запретить святую мазь.
- **Response (EN):** Good sense beat fragrant lies.
- **Response (RU):** Здравый смысл победил ароматную ложь.
- **Effects:** Church -12, Health +12

**Choice 2**
- **Choice (EN):** Allow both salves.
- **Choice (RU):** Разрешить обе мази.
- **Response (EN):** Let people choose between faith and stink. Amusing.
- **Response (RU):** Пусть люди выбирают между верой и запахом. Забавно.
- **Effects:** Church +5, Treasury +5, Health -5

---

### Encounter #111

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Northerners in the capital ask to open their own temple. Your priests call it heresy.
**Prompt (RU):** Северяне в столице просят открыть свой храм. Ваши священники называют это ересью.

**Choice 1**
- **Choice (EN):** Allow a northern temple.
- **Choice (RU):** Разрешить северный храм.
- **Response (EN):** The north will approve. Your priests will not.
- **Response (RU):** Север оценит. Ваши священники — нет.
- **Effects:** Church -20, Treasury +5, Health +5

**Choice 2**
- **Choice (EN):** Forbid it.
- **Choice (RU):** Запретить.
- **Response (EN):** Then northerners will see your faith outweighs hospitality.
- **Response (RU):** Тогда северяне поймут, что ваша вера сильнее гостеприимства.
- **Effects:** Church +15, Army +3, Treasury -5

---

### Encounter #112

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Soldiers who shed blood on the night of the coup must confess. Otherwise sin stays on your army.
**Prompt (RU):** Солдаты, пролившие кровь в ночь переворота, должны исповедаться. Иначе грех останется на вашем войске.

**Choice 1**
- **Choice (EN):** Require soldiers to confess.
- **Choice (RU):** Обязать солдат к исповеди.
- **Response (EN):** Sin is named. Now it can be leashed.
- **Response (RU):** Грех назван. Теперь его можно держать на поводке.
- **Effects:** Church +15, Army -10, Health +5

**Choice 2**
- **Choice (EN):** Make confession voluntary only.
- **Choice (RU):** Сделать исповедь только добровольной.
- **Response (EN):** Voluntary cleansing is slower, but cleaner.
- **Response (RU):** Добровольное очищение медленнее, но чище.
- **Effects:** Church +5, Army +3

---

### Encounter #113

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Pilgrims sell their belongings for bread. Some already fall on the road to the temple.
**Prompt (RU):** Странники продают свои вещи за кусок хлеба. Некоторые уже падают на дороге к храму.

**Choice 1**
- **Choice (EN):** Open a free kitchen.
- **Choice (RU):** Открыть бесплатную кухню.
- **Response (EN):** The road to the temple will be less deadly today.
- **Response (RU):** Дорога к храму сегодня станет менее смертельной.
- **Effects:** Church +10, Health +18, Food -18

**Choice 2**
- **Choice (EN):** Sell them cheap bread.
- **Choice (RU):** Продавать им дешёвый хлеб.
- **Response (EN):** Not mercy, but help. Sometimes that is all there is.
- **Response (RU):** Не милость, но помощь. Иногда это всё, что есть.
- **Effects:** Treasury +5, Health +8, Food -8

---

### Encounter #114

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** If the church declares giving to the crown a holy deed, people will bring coins themselves.
**Prompt (RU):** Если церковь объявит пожертвование короне святым делом, люди сами принесут монеты.

**Choice 1**
- **Choice (EN):** Ask the church to declare a collection.
- **Choice (RU):** Попросить церковь объявить сбор.
- **Response (EN):** When greed is blessed, it is called service.
- **Response (RU):** Когда жадность благословлена, её называют служением.
- **Effects:** Church +8, Treasury +20, Health -5

**Choice 2**
- **Choice (EN):** Collect donations without the church.
- **Choice (RU):** Собирать пожертвования без церкви.
- **Response (EN):** People give less when heaven does not frighten them.
- **Response (RU):** Люди дают меньше, когда их не пугают небесами.
- **Effects:** Treasury +8, Health -3

---

### Encounter #115

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Priests want prayer before every parade. It turns the army into a church procession.
**Prompt (RU):** Священники хотят читать молитву перед каждым строевым смотром. Это превращает армию в церковную процессию.

**Choice 1**
- **Choice (EN):** Allow prayers before inspection.
- **Choice (RU):** Разрешить молитвы перед смотром.
- **Response (EN):** Soldiers will stand longer. I hope enemies wait too.
- **Response (RU):** Солдаты будут стоять дольше. Надеюсь, враги тоже подождут.
- **Effects:** Church +12, Army -5

**Choice 2**
- **Choice (EN):** Forbid it.
- **Choice (RU):** Запретить.
- **Response (EN):** Good. Inspection should sound of steps, not psalms.
- **Response (RU):** Хорошо. Смотр должен звучать шагами, не псалмами.
- **Effects:** Church -10, Army +10

---

### Encounter #116

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** The church forbids autopsies of those who died of disease. Without them we cannot learn what kills.
**Prompt (RU):** Церковь запрещает вскрывать умерших от болезни. Без этого мы не поймём, что убивает людей.

**Choice 1**
- **Choice (EN):** Allow secret autopsies.
- **Choice (RU):** Разрешить вскрытия тайно.
- **Response (EN):** Secret truth still heals better than open lies.
- **Response (RU):** Тайная правда всё равно лечит лучше открытой лжи.
- **Effects:** Church -8, Health +15

**Choice 2**
- **Choice (EN):** Forbid autopsies.
- **Choice (RU):** Запретить вскрытия.
- **Response (EN):** Then disease keeps its secrets.
- **Response (RU):** Тогда болезнь сохранит свои секреты.
- **Effects:** Church +10, Health -15

---

### Encounter #117

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** In three days is the saint's feast. The temple asks a feast for the poor. The poor ask for feasts every day.
**Prompt (RU):** Через три дня праздник святого. Храм просит пир для бедных. Бедные просят пир каждый день.

**Choice 1**
- **Choice (EN):** Allocate food for the feast.
- **Choice (RU):** Выделить еду на праздник.
- **Response (EN):** The feast will be hearty. The next day will be ordinary.
- **Response (RU):** Праздник будет сытным. Следующий день — обычным.
- **Effects:** Church +12, Health +8, Food -15

**Choice 2**
- **Choice (EN):** Allocate half.
- **Choice (RU):** Выделить половину.
- **Response (EN):** Half a miracle. Not bad for the kitchen.
- **Response (RU):** Половина чуда. Для кухни это уже неплохо.
- **Effects:** Church +5, Health +3, Food -8

---

### Encounter #118

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Malrik is forming a temple guard. For now sticks and robes. Later, swords.
**Prompt (RU):** Малрик собирает собственную храмовую стражу. Пока это палки и рясы. Потом будут мечи.

**Choice 1**
- **Choice (EN):** Forbid the temple guard.
- **Choice (RU):** Запретить храмовую стражу.
- **Response (EN):** Good. One law and one guard in the city.
- **Response (RU):** Хорошо. В городе должен быть один закон и одна стража.
- **Effects:** Church -15, Army +12

**Choice 2**
- **Choice (EN):** Allow the temple guard.
- **Choice (RU):** Разрешить храмовую стражу.
- **Response (EN):** Then the temple grows teeth. Do not be surprised if it bites.
- **Response (RU):** Тогда у храма появятся зубы. Не удивляйтесь, если он начнёт кусаться.
- **Effects:** Church +15, Army -10

---

### Encounter #119

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** The people hear you in the square and Malrik in the temple. In the temple they weep. In the square they fear.
**Prompt (RU):** Народ слушает вас на площади и Малрика в храме. Но в храме люди плачут. На площади они боятся.

**Choice 1**
- **Choice (EN):** Speak to the people more often.
- **Choice (RU):** Говорить с народом чаще.
- **Response (EN):** The throne must have a voice, or others speak for it.
- **Response (RU):** Трон должен иметь голос, иначе за него будут говорить другие.
- **Effects:** Church -3, Treasury -5, Health +10

**Choice 2**
- **Choice (EN):** Let the church speak for the crown.
- **Choice (RU):** Пусть церковь говорит за корону.
- **Response (EN):** Convenient. But one day you will hear your orders in a stranger's voice.
- **Response (RU):** Удобно. Но однажды вы услышите свои приказы чужим голосом.
- **Effects:** Church +15, Army -5

---

### Encounter #120

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** The church wants a book of faithful subjects. Those listed receive help first.
**Prompt (RU):** Церковь хочет вести книгу верных подданных. Кто записан, тот получает помощь первым.

**Choice 1**
- **Choice (EN):** Allow the book of the faithful.
- **Choice (RU):** Разрешить книгу верных.
- **Response (EN):** Ordered mercy beats chaotic mercy.
- **Response (RU):** Порядок милосердия лучше хаоса милосердия.
- **Effects:** Church +15, Health -8

**Choice 2**
- **Choice (EN):** Forbid dividing people by faith.
- **Choice (RU):** Запретить делить людей по вере.
- **Response (EN):** You want equality where people seek chosenness.
- **Response (RU):** Вы хотите равенства там, где люди ищут избранность.
- **Effects:** Church -15, Health +10

---

### Encounter #121

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Those who argued with priests were barred from the monastery kitchen. They are hungry.
**Prompt (RU):** Людей, которые спорили со священниками, перестали пускать к монастырской кухне. Они голодны.

**Choice 1**
- **Choice (EN):** Feed all regardless of faith.
- **Choice (RU):** Кормить всех, независимо от веры.
- **Response (EN):** This is the mercy I hoped to hear.
- **Response (RU):** Это милость, которую я хотел услышать.
- **Effects:** Church -8, Health +15, Food -10

**Choice 2**
- **Choice (EN):** Feed only the faithful.
- **Choice (RU):** Кормить только верных.
- **Response (EN):** Then soup becomes a test, not salvation.
- **Response (RU):** Тогда суп станет испытанием, а не спасением.
- **Effects:** Church +12, Health -10, Food -5

---

### Encounter #122

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Some monasteries owe the treasury for old supplies. Malrik asks to forgive the debts in faith's name.
**Prompt (RU):** Некоторые монастыри должны казне за старые поставки. Малрик просит простить долги во имя веры.

**Choice 1**
- **Choice (EN):** Forgive the debts.
- **Choice (RU):** Простить долги.
- **Response (EN):** Faith loves forgiveness. The treasury does not.
- **Response (RU):** Вера любит прощение. Казна — нет.
- **Effects:** Church +15, Treasury -15

**Choice 2**
- **Choice (EN):** Demand payment.
- **Choice (RU):** Потребовать оплату.
- **Response (EN):** Debt is holier than prayer if recorded well.
- **Response (RU):** Долг святее молитвы, если записан правильно.
- **Effects:** Church -12, Treasury +15

---

### Encounter #123

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Priests ask to stop executing deserters. Every soldier can repent, they say.
**Prompt (RU):** Священники просят остановить казни дезертиров. Говорят, каждый солдат может покаяться.

**Choice 1**
- **Choice (EN):** Stop executing deserters.
- **Choice (RU):** Остановить казни дезертиров.
- **Response (EN):** Mercy in the barracks smells of mutiny.
- **Response (RU):** Милость в казармах пахнет мятежом.
- **Effects:** Church +10, Army -15, Health +5

**Choice 2**
- **Choice (EN):** Continue executions.
- **Choice (RU):** Продолжать казни.
- **Response (EN):** Order holds. Souls can catch up later.
- **Response (RU):** Порядок сохранится. Души пусть догоняют позже.
- **Effects:** Church -10, Army +12, Health -5

---

### Encounter #124

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** The sick sleep inside the temple hoping for miracles. Warm air and crowding spread disease.
**Prompt (RU):** Больные ночуют внутри храма, надеясь на чудо. Тёплый воздух и теснота разносят болезнь.

**Choice 1**
- **Choice (EN):** Move the sick to infirmaries.
- **Choice (RU):** Вывести больных в лазареты.
- **Response (EN):** They will rage. But survive more often.
- **Response (RU):** Они будут злиться. Но выживут чаще.
- **Effects:** Church -10, Health +18

**Choice 2**
- **Choice (EN):** Open temple infirmaries.
- **Choice (RU):** Открыть храмовые лазареты.
- **Response (EN):** If the temple heals, let it learn to scrub floors.
- **Response (RU):** Если храм хочет лечить, пусть учится мыть полы.
- **Effects:** Church +8, Treasury -10, Health +15

---

### Encounter #125

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** During the fast fish costs more than meat. Merchants pray to the fast louder than priests.
**Prompt (RU):** Во время поста рыба стала дороже мяса. Купцы молятся на пост громче священников.

**Choice 1**
- **Choice (EN):** Cap fish prices.
- **Choice (RU):** Ограничить цену на рыбу.
- **Response (EN):** The fast grows less luxurious for traders.
- **Response (RU):** Пост станет чуть менее роскошным для торговцев.
- **Effects:** Church +5, Treasury -5, Health +8

**Choice 2**
- **Choice (EN):** Do not interfere.
- **Choice (RU):** Не вмешиваться.
- **Response (EN):** Merchants stay fed. People fast holily.
- **Response (RU):** Купцы будут сыты. Люди будут свято голодать.
- **Effects:** Treasury +10, Health -8

---

### Encounter #126

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Signs on the walls: 'A king without blessing is no king.' This is no longer a whisper.
**Prompt (RU):** На стенах появились знаки: 'Король без благословения — не король'. Это уже не шёпот.

**Choice 1**
- **Choice (EN):** Erase signs and arrest the writers.
- **Choice (RU):** Стереть знаки и арестовать писцов.
- **Response (EN):** Walls grow clean. People grow careful.
- **Response (RU):** Стены станут чистыми. Люди — осторожнее.
- **Effects:** Church -8, Army +10, Health -5

**Choice 2**
- **Choice (EN):** Answer with a public speech.
- **Choice (RU):** Ответить публичной речью.
- **Response (EN):** Words against graffiti. Sometimes it works.
- **Response (RU):** Слова против надписей. Иногда работает.
- **Effects:** Treasury -5, Health +8

---

### Encounter #127

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** They say the former king cursed the throne before death. The church can dispel the rumor. Or confirm it.
**Prompt (RU):** Говорят, что прежний король проклял трон перед смертью. Церковь может развеять слух. Или подтвердить его.

**Choice 1**
- **Choice (EN):** Ask the church to dispel the rumor.
- **Choice (RU):** Попросить церковь развеять слух.
- **Response (EN):** Curses fear candles, especially paid ones.
- **Response (RU):** Проклятия боятся свечей, особенно оплаченных.
- **Effects:** Church +10, Treasury -8, Health +8

**Choice 2**
- **Choice (EN):** Forbid talk of the curse.
- **Choice (RU):** Запретить говорить о проклятии.
- **Response (EN):** A ban is a poor lid on a boiling pot.
- **Response (RU):** Запрет — плохая крышка для кипящего котла.
- **Effects:** Army +8, Health -8

---

### Encounter #128

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Temples demand thousands of candles. Give me a wax monopoly and half the profit is yours.
**Prompt (RU):** Храмы требуют тысячи свечей. Дайте мне единоличную власть над рынком на воск, и половина прибыли ваша.

**Choice 1**
- **Choice (EN):** Grant the monopoly.
- **Choice (RU):** Дать единоличную власть над рынком.
- **Response (EN):** Candles will burn. So will coins.
- **Response (RU):** Свечи будут гореть. Монеты тоже.
- **Effects:** Church +5, Treasury +20, Health -5

**Choice 2**
- **Choice (EN):** Forbid the monopoly.
- **Choice (RU):** Запретить единоличную власть над рынком.
- **Response (EN):** A free market in candles. How nobly dull.
- **Response (RU):** Свободный рынок свечей. Как возвышенно скучно.
- **Effects:** Treasury -5, Health +5

---

### Encounter #129

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** I received a list of suspected heretics. Half the names in another's hand, half in a trembling one.
**Prompt (RU):** Мне передали список подозреваемых в ереси. Половина имён написана чужой рукой, половина — дрожащей.

**Choice 1**
- **Choice (EN):** Begin arrests.
- **Choice (RU):** Начать аресты.
- **Response (EN):** The list grows shorter. Fear grows longer.
- **Response (RU):** Список станет короче. Страх — длиннее.
- **Effects:** Church +15, Army +8, Health -15

**Choice 2**
- **Choice (EN):** Verify the list.
- **Choice (RU):** Проверить список.
- **Response (EN):** A rare night when paper outlives the axe.
- **Response (RU):** Редкий случай, когда бумага переживёт ночь.
- **Effects:** Church -5, Treasury -5, Health +8

---

### Encounter #130

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** Some sick stopped buying remedies. A priest told them to pray and endure.
**Prompt (RU):** Некоторые больные перестали покупать лекарства. Говорят, священник велел им молиться и терпеть.

**Choice 1**
- **Choice (EN):** Order temples not to hinder healing.
- **Choice (RU):** Приказать храмам не мешать лечению.
- **Response (EN):** Thank you. Disease is glad when you treat it instead of telling patients to endure.
- **Response (RU):** Спасибо. Болезни терпение не раздражает, а радует.
- **Effects:** Church -10, Health +15

**Choice 2**
- **Choice (EN):** Support the church.
- **Choice (RU):** Поддержать церковь.
- **Response (EN):** Then let prayers break the fever. I will watch.
- **Response (RU):** Тогда пусть молитвы сбивают жар. Я посмотрю.
- **Effects:** Church +12, Health -15

---

### Encounter #131

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Your priests want to ride north to preach. My prince will call it meddling.
**Prompt (RU):** Ваши священники хотят ехать на север проповедовать. Мой князь сочтёт это вмешательством.

**Choice 1**
- **Choice (EN):** Allow the mission.
- **Choice (RU):** Разрешить миссию.
- **Response (EN):** The north does not love foreign prayers. Especially from the south.
- **Response (RU):** Север не любит чужие молитвы. Особенно с юга.
- **Effects:** Church +15, Army -10

**Choice 2**
- **Choice (EN):** Forbid the mission.
- **Choice (RU):** Запретить миссию.
- **Response (EN):** My prince will value your caution.
- **Response (RU):** Мой князь оценит вашу осторожность.
- **Effects:** Church -10, Army +5, Treasury +5

---

### Encounter #132

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** A new coronation is needed. Not in the palace but in the temple. Then the people will see power was given not only by the sword.
**Prompt (RU):** Нужна новая коронация. Не во дворце, а в храме. Тогда народ увидит, что власть дана не только мечом.

**Choice 1**
- **Choice (EN):** Agree to a temple coronation.
- **Choice (RU):** Согласиться на храмовую коронацию.
- **Response (EN):** Now your crown will shine with gold and godly fear.
- **Response (RU):** Теперь ваша корона будет сиять не только золотом, но и страхом Божьим.
- **Effects:** Church +25, Army -5, Treasury -20

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказаться.
- **Response (EN):** Then the temple will be silent. But silence in the temple carries far.
- **Response (RU):** Тогда храм будет молчать. Но молчание в храме слышно далеко.
- **Effects:** Church -25, Army +10

---

### Encounter #133

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** City poor are angry: pilgrims are fed while locals starve. Mercy became envy.
**Prompt (RU):** Городские бедняки злятся: странников кормят, а местные голодают. Милость стала поводом для зависти.

**Choice 1**
- **Choice (EN):** Feed city dwellers first.
- **Choice (RU):** Кормить сначала жителей города.
- **Response (EN):** Save the house before the guests. That is clear.
- **Response (RU):** Дом нужно спасать до гостей. Это понятно.
- **Effects:** Church -5, Health +12, Food -10

**Choice 2**
- **Choice (EN):** Feed all equally.
- **Choice (RU):** Кормить всех поровну.
- **Response (EN):** Hard, costly, right.
- **Response (RU):** Трудно, дорого, правильно.
- **Effects:** Church +8, Health +15, Food -18

---

### Encounter #134

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Temple shops pay no trade tax. Merchants demand fairness. I demand revenue.
**Prompt (RU):** Храмовые лавки не платят торговый налог. Купцы требуют справедливости. Я требую дохода.

**Choice 1**
- **Choice (EN):** Tax the shops.
- **Choice (RU):** Обложить лавки налогом.
- **Response (EN):** Fairness finally brought coins.
- **Response (RU):** Справедливость наконец-то принесла монеты.
- **Effects:** Church -12, Treasury +15

**Choice 2**
- **Choice (EN):** Leave shops tax-free.
- **Choice (RU):** Оставить лавки свободными от налогов.
- **Response (EN):** Holiness is cheaper for the temple than the treasury again.
- **Response (RU):** Святость снова оказалась дешевле для храма, чем для казны.
- **Effects:** Church +10, Treasury -10

---

### Encounter #135

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Young fanatics want to join the army. They are brave but ignore orders when they hear 'heresy'.
**Prompt (RU):** Молодые фанатики просятся в армию. Они храбры, но не слушают приказов, когда слышат слово 'ересь'.

**Choice 1**
- **Choice (EN):** Accept them.
- **Choice (RU):** Принять их в армию.
- **Response (EN):** Bravery gained. Discipline in question.
- **Response (RU):** Храбрость получена. Дисциплина под вопросом.
- **Effects:** Church +8, Army +15, Health -8

**Choice 2**
- **Choice (EN):** Refuse the fanatics.
- **Choice (RU):** Отказать фанатикам.
- **Response (EN):** Better fewer soldiers than a crowd with swords and songs.
- **Response (RU):** Лучше меньше солдат, чем толпа с мечами и песнями.
- **Effects:** Church -10, Army -5, Health +5

---

### Encounter #136

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Some priests say women must not treat men. Today three refused my help.
**Prompt (RU):** Некоторые священники говорят, что женщины не должны лечить мужчин. Сегодня трое отказались от моей помощи.

**Choice 1**
- **Choice (EN):** Forbid such preaching.
- **Choice (RU):** Запретить такие проповеди.
- **Response (EN):** Thank you. Disease does not choose healers by sex.
- **Response (RU):** Спасибо. Болезнь не выбирает лекаря по полу.
- **Effects:** Church -12, Health +15

**Choice 2**
- **Choice (EN):** Do not interfere.
- **Choice (RU):** Не вмешиваться.
- **Response (EN):** Let pride bandage their wounds.
- **Response (RU):** Тогда пусть гордость перевязывает им раны.
- **Effects:** Church +8, Health -12

---

### Encounter #137

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** The monastery brews beer and sells it untaxed. Soldiers are pleased, the treasurer is not.
**Prompt (RU):** Монастырь варит пиво и продаёт его без налога. Солдаты довольны, казначей нет.

**Choice 1**
- **Choice (EN):** Tax monastery beer.
- **Choice (RU):** Обложить монастырское пиво налогом.
- **Response (EN):** Beer grows costly. Prayers grow irritable.
- **Response (RU):** Пиво станет дороже. Молитвы — раздражённее.
- **Effects:** Church -8, Army -3, Treasury +12

**Choice 2**
- **Choice (EN):** Leave it untaxed.
- **Choice (RU):** Оставить без налога.
- **Response (EN):** Soldiers will drink to the church's health.
- **Response (RU):** Солдаты будут пить за здоровье церкви.
- **Effects:** Church +8, Army +5, Treasury -8

---

### Encounter #138

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** A young priest says the king must listen only to the church. The crowd applauds.
**Prompt (RU):** Один молодой священник говорит, что король должен слушать только церковь. Толпа хлопает.

**Choice 1**
- **Choice (EN):** Arrest the priest.
- **Choice (RU):** Арестовать священника.
- **Response (EN):** The crowd sees force. And remembers the arrested face.
- **Response (RU):** Толпа увидит силу. И запомнит лицо арестованного.
- **Effects:** Church -15, Army +10, Health -5

**Choice 2**
- **Choice (EN):** Summon him to talk.
- **Choice (RU):** Вызвать его на разговор.
- **Response (EN):** Softer. But he may take softness for weakness.
- **Response (RU):** Мягче. Но он может принять мягкость за слабость.
- **Effects:** Church +3, Army +3, Treasury -3

---

### Encounter #139

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Malrik proposes a church council at court. Robed advisers will speak for people and gods.
**Prompt (RU):** Малрик предлагает создать церковный совет при троне. Советники в рясах будут говорить от имени народа и богов.

**Choice 1**
- **Choice (EN):** Create the church council.
- **Choice (RU):** Создать церковный совет.
- **Response (EN):** You let the altar into the throne room. Harder to remove.
- **Response (RU):** Вы впустили алтарь в тронный зал. Вывести будет сложнее.
- **Effects:** Church +20, Army -5, Treasury -8

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказать.
- **Response (EN):** Priests stay outside. And speak louder.
- **Response (RU):** Священники останутся снаружи. И начнут говорить громче.
- **Effects:** Church -15, Army +5

---

### Encounter #140

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** The church proposes a luxury tax. Money for the poor — through temple hands, of course.
**Prompt (RU):** Церковь предлагает налог на роскошь. Деньги пойдут бедным. И, разумеется, через храмовые руки.

**Choice 1**
- **Choice (EN):** Levy through the church.
- **Choice (RU):** Ввести налог через церковь.
- **Response (EN):** The rich will hate us both. The poor will eat.
- **Response (RU):** Богатые возненавидят нас обоих. Бедные будут есть.
- **Effects:** Church +15, Treasury +5, Health +8

**Choice 2**
- **Choice (EN):** Levy through the crown.
- **Choice (RU):** Ввести налог через корону.
- **Response (EN):** You took mercy from church hands. Bold.
- **Response (RU):** Вы забрали милосердие из рук церкви. Смело.
- **Effects:** Church -5, Treasury +15, Health +5

---

### Encounter #141

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Beggars reach out at the altar during service. Rich parishioners complain they disturb prayer.
**Prompt (RU):** Во время службы нищие протягивают руки прямо у алтаря. Богатые прихожане жалуются, что им мешают молиться.

**Choice 1**
- **Choice (EN):** Leave beggars at the altar.
- **Choice (RU):** Оставить нищих у алтаря.
- **Response (EN):** Prayer beside poverty is honester.
- **Response (RU):** Молитва рядом с бедностью честнее.
- **Effects:** Church -3, Health +10

**Choice 2**
- **Choice (EN):** Move beggars outside.
- **Choice (RU):** Вывести нищих наружу.
- **Response (EN):** The temple grows prettier. And colder.
- **Response (RU):** Храм станет красивее. И холоднее.
- **Effects:** Church +8, Health -8

---

### Encounter #142

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** The temple wants silver for a new bell. They say its ring will guard the city. I would prefer walls.
**Prompt (RU):** Храм просит серебро на новый колокол. Говорят, его звон будет защищать город. Я бы предпочёл защитные стены.

**Choice 1**
- **Choice (EN):** Fund the bell.
- **Choice (RU):** Дать серебро на колокол.
- **Response (EN):** The bell will ring. The treasury will empty.
- **Response (RU):** Колокол будет звонить. Казна — пустеть.
- **Effects:** Church +15, Treasury -15, Health +5

**Choice 2**
- **Choice (EN):** Refuse.
- **Choice (RU):** Отказать.
- **Response (EN):** Silence is cheaper than silver.
- **Response (RU):** Тишина дешевле серебра.
- **Effects:** Church -10, Treasury +5

---

### Encounter #143

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Malrik wants the army to fast before a campaign. A hungry soldier prays and fights worse.
**Prompt (RU):** Малрик хочет, чтобы армия постилась перед походом. Голодный солдат хуже молится и хуже бьёт.

**Choice 1**
- **Choice (EN):** Order the army to fast.
- **Choice (RU):** Приказать армии поститься.
- **Response (EN):** If the enemy strikes, we will throw prayers.
- **Response (RU):** Если враг нападёт, будем бросать в него молитвы.
- **Effects:** Church +15, Army -15, Food +10

**Choice 2**
- **Choice (EN):** Exempt the army from fasting.
- **Choice (RU):** Освободить армию от поста.
- **Response (EN):** Thank you. A soldier with meat in his belly beats a holy skeleton.
- **Response (RU):** Спасибо. Солдат с мясом в животе полезнее святого скелета.
- **Effects:** Church -10, Army +12, Food -5

---

### Encounter #144

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Pilgrims brought a new disease. Priests call it a trial. I call it plague.
**Prompt (RU):** Странники принесли новую болезнь. Священники называют её испытанием. Я называю её заразой.

**Choice 1**
- **Choice (EN):** Close the city to pilgrims.
- **Choice (RU):** Закрыть город для странников.
- **Response (EN):** It saves the city. And angers those bound for the shrine.
- **Response (RU):** Это спасёт город. И разозлит тех, кто идёт к святыне.
- **Effects:** Church -15, Health +20, Food +5

**Choice 2**
- **Choice (EN):** Screen pilgrims at the gates.
- **Choice (RU):** Проверять странников у ворот.
- **Response (EN):** Slow, but better than letting sickness in with hymns.
- **Response (RU):** Медленно, но лучше, чем пускать болезнь с песнями.
- **Effects:** Church -3, Treasury -8, Health +12

---

### Encounter #145

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Fish for the fast is sold by the temple. Half already smells like a sermon after rain.
**Prompt (RU):** У храма продают рыбу для поста. Половина уже пахнет как проповедь после дождя.

**Choice 1**
- **Choice (EN):** Seize spoiled fish.
- **Choice (RU):** Конфисковать испорченную рыбу.
- **Response (EN):** People lose supper but keep their guts.
- **Response (RU):** Люди потеряют ужин, но сохранят животы.
- **Effects:** Church -3, Health +12, Food -5

**Choice 2**
- **Choice (EN):** Allow sale after salting.
- **Choice (RU):** Разрешить продавать после засолки.
- **Response (EN):** Salt is not magic. Though merchants believe otherwise.
- **Response (RU):** Соль — не магия. Хотя купцы верят обратному.
- **Effects:** Health -8, Food +8

---

### Encounter #146

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** After the sermon a crowd marches on the palace. They carry candles, not weapons. But candles can burn doors.
**Prompt (RU):** После проповеди толпа идёт к дворцу. Они несут свечи, не оружие. Но свечой тоже можно поджечь дверь.

**Choice 1**
- **Choice (EN):** Meet them with guards.
- **Choice (RU):** Встретить толпу стражей.
- **Response (EN):** Candles die fast. Anger does not.
- **Response (RU):** Свечи погаснут быстро. Гнев — нет.
- **Effects:** Church -5, Army +10, Health -5

**Choice 2**
- **Choice (EN):** Go out to them yourself.
- **Choice (RU):** Выйти к ним лично.
- **Response (EN):** I will be near. If candles turn to torches, run first.
- **Response (RU):** Я буду рядом. Если свечи станут факелами, бегите первым.
- **Effects:** Church +3, Army -5, Health +10

---

### Encounter #147

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** If the church names you pious, many will forget the coup. But the church gives no such gifts for free.
**Prompt (RU):** Если церковь назовёт вас благочестивым, многие забудут переворот. Но церковь не делает таких подарков бесплатно.

**Choice 1**
- **Choice (EN):** Buy a pious reputation.
- **Choice (RU):** Купить благочестивую репутацию.
- **Response (EN):** Reputation bought. Now hide the receipt.
- **Response (RU):** Репутация куплена. Теперь важно, чтобы чек не нашли.
- **Effects:** Church +20, Treasury -20, Health +5

**Choice 2**
- **Choice (EN):** Earn it by deeds.
- **Choice (RU):** Заслужить её делами.
- **Response (EN):** Slower. But stronger.
- **Response (RU):** Медленнее. Но крепче.
- **Effects:** Church +5, Treasury -10, Health +10

---

### Encounter #148

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Bakers sell 'holy bread' triple the price. People buy from fear of disease.
**Prompt (RU):** Пекари продают 'святой хлеб' втрое дороже обычного. Народ покупает, потому что боится болезни.

**Choice 1**
- **Choice (EN):** Ban holy bread.
- **Choice (RU):** Запретить святой хлеб.
- **Response (EN):** You forbade fear as merchandise. Bold.
- **Response (RU):** Вы запретили страху быть товаром. Смело.
- **Effects:** Church -8, Treasury -5, Health +10

**Choice 2**
- **Choice (EN):** Tax holy bread.
- **Choice (RU):** Обложить святой хлеб налогом.
- **Response (EN):** If people pay for fear, the crown gets a share.
- **Response (RU):** Если люди платят за страх, корона хотя бы получит долю.
- **Effects:** Church -3, Treasury +15, Health -5

---

### Encounter #149

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** The church demands burning books found with a scholar. They corrupt souls, they say.
**Prompt (RU):** Церковь требует сжечь книги, найденные у учёного. Говорят, они портят души.

**Choice 1**
- **Choice (EN):** Burn the books.
- **Choice (RU):** Сжечь книги.
- **Response (EN):** Paper burns fast. Ideas burn differently.
- **Response (RU):** Бумага горит быстро. Идеи горят иначе.
- **Effects:** Church +15, Health -5

**Choice 2**
- **Choice (EN):** Hide books in the royal archive.
- **Choice (RU):** Спрятать книги в королевском архиве.
- **Response (EN):** Secret fire can be deadlier than open flame.
- **Response (RU):** Тайный огонь иногда опаснее открытого.
- **Effects:** Church -10, Treasury -3, Health +3

---

### Encounter #150

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** Priests call my herbs witchcraft. Funny that their monks buy the same herbs at the back door.
**Prompt (RU):** Священники называют мои травы ведьмовством. Забавно, что их монахи покупают те же травы через заднюю дверь.

**Choice 1**
- **Choice (EN):** Protect Sivil.
- **Choice (RU):** Защитить Сивил.
- **Response (EN):** Thank you. I am almost moved. Almost.
- **Response (RU):** Спасибо. Я почти тронута. Почти.
- **Effects:** Church -12, Health +15

**Choice 2**
- **Choice (EN):** Ban her herbs.
- **Choice (RU):** Запретить её травы.
- **Response (EN):** Let monks cure coughs with psalms.
- **Response (RU):** Тогда пусть монахи лечат кашель псалмами.
- **Effects:** Church +12, Health -15

---

### Encounter #151

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Families from the north came to your gates. They flee war but pray to other gods.
**Prompt (RU):** К вашим воротам пришли семьи с севера. Они бегут от войны, но молятся не вашим богам.

**Choice 1**
- **Choice (EN):** Accept the refugees.
- **Choice (RU):** Принять беженцев.
- **Response (EN):** The north will remember your mercy. Your priests too.
- **Response (RU):** Север запомнит вашу милость. Ваши священники — тоже.
- **Effects:** Church -15, Health +8, Food -15

**Choice 2**
- **Choice (EN):** Refuse them.
- **Choice (RU):** Отказать им.
- **Response (EN):** Cold mercy. Almost northern.
- **Response (RU):** Холодная милость. Почти северная.
- **Effects:** Church +10, Health -8, Food +5

---

### Encounter #152

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Foreign gods are worshipped in the city. Allow it and heresy moves from cellars to the market.
**Prompt (RU):** В городе молятся чужим богам. Если это разрешить, завтра ересь будет не в подвалах, а на рынке.

**Choice 1**
- **Choice (EN):** Forbid foreign rites.
- **Choice (RU):** Запретить чужие обряды.
- **Response (EN):** Purity of faith needs a firm hand.
- **Response (RU):** Чистота веры требует твёрдой руки.
- **Effects:** Church +20, Army +5, Health -10

**Choice 2**
- **Choice (EN):** Allow private rites.
- **Choice (RU):** Разрешить частные обряды.
- **Response (EN):** Quiet heresy is still heresy. But quiet.
- **Response (RU):** Тихая ересь всё равно ересь. Но хотя бы тихая.
- **Effects:** Church -8, Health +8

---

### Encounter #153

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** A village accused a woman of witchcraft. Her house burned without trial. Children sleep on ash.
**Prompt (RU):** В деревне обвинили женщину в колдовстве. Её дом сожгли без суда. Теперь дети спят на пепле.

**Choice 1**
- **Choice (EN):** Punish the guilty.
- **Choice (RU):** Наказать виновных.
- **Response (EN):** Justice was late, but came.
- **Response (RU):** Справедливость запоздала, но хотя бы пришла.
- **Effects:** Church -10, Army +5, Health +10

**Choice 2**
- **Choice (EN):** Help the children and leave the village.
- **Choice (RU):** Помочь детям и не трогать деревню.
- **Response (EN):** Softly. Sometimes softness saves more than punishment.
- **Response (RU):** Мягко. Иногда мягкость спасает больше, чем наказание.
- **Effects:** Treasury -8, Health +12, Food -5

---

### Encounter #154

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Print simple prayer books cheaply and the people stay busy with faith and the treasury with income.
**Prompt (RU):** Если печатать простые молитвенники и продавать их дёшево, народ будет занят верой, а казна — доходом.

**Choice 1**
- **Choice (EN):** Print prayer books.
- **Choice (RU):** Печатать молитвенники.
- **Response (EN):** Fine. Paper that brings faith and coins.
- **Response (RU):** Прекрасно. Бумага, которая приносит и веру, и монеты.
- **Effects:** Church +10, Treasury +12, Health +3

**Choice 2**
- **Choice (EN):** Give them free.
- **Choice (RU):** Раздавать бесплатно.
- **Response (EN):** Free faith. A costly idea.
- **Response (RU):** Бесплатная вера. Очень дорогая идея.
- **Effects:** Church +12, Treasury -10, Health +5

---

### Encounter #155

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** A priest told soldiers not to touch fugitives in sanctuary. It undermines command.
**Prompt (RU):** Один священник велел солдатам не трогать беглецов, если те укрылись в храме. Это подрывает командование.

**Choice 1**
- **Choice (EN):** Support the priest.
- **Choice (RU):** Поддержать священника.
- **Response (EN):** Then soldiers will look to the altar before every order.
- **Response (RU):** Тогда солдаты начнут смотреть на алтарь перед каждым приказом.
- **Effects:** Church +12, Army -12

**Choice 2**
- **Choice (EN):** Support the army.
- **Choice (RU):** Поддержать армию.
- **Response (EN):** Good. Orders from above, not from the side.
- **Response (RU):** Хорошо. Приказ должен идти сверху, не сбоку.
- **Effects:** Church -12, Army +12

---

### Encounter #156

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Priests oppose new graves outside the walls. The ground is unconsecrated. The old cemetery is full.
**Prompt (RU):** Священники против новых могильных ям за городом. Говорят, земля там не освящена. А старое кладбище переполнено.

**Choice 1**
- **Choice (EN):** Consecrate new ground and bury there.
- **Choice (RU):** Освятить новую землю и хоронить там.
- **Response (EN):** At last sense and faith do not fight.
- **Response (RU):** Наконец-то решение, где здравый смысл и вера не дерутся.
- **Effects:** Church +5, Treasury -5, Health +15

**Choice 2**
- **Choice (EN):** Bury outside without consecration.
- **Choice (RU):** Хоронить за городом без освящения.
- **Response (EN):** The dead need earth. The living need safety.
- **Response (RU):** Мёртвым нужна земля. Живым — безопасность.
- **Effects:** Church -12, Health +12

---

### Encounter #157

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Temples open kitchens but cook poorly. If people poison themselves on holy stew, they will blame you.
**Prompt (RU):** Храмы открывают кухни, но готовят плохо. Если люди начнут травиться святой похлёбкой, винить будут вас.

**Choice 1**
- **Choice (EN):** Send palace cooks to train temples.
- **Choice (RU):** Отправить дворцовых поваров обучать храмы.
- **Response (EN):** I will teach them not to kill with soup.
- **Response (RU):** Научу их хотя бы не убивать супом.
- **Effects:** Church +5, Treasury -8, Health +12

**Choice 2**
- **Choice (EN):** Close temple kitchens.
- **Choice (RU):** Закрыть храмовые кухни.
- **Response (EN):** People hunger more but visit healers less.
- **Response (RU):** Люди будут голоднее, но меньше бегать к лекарям.
- **Effects:** Church -12, Health +8, Food +5

---

### Encounter #158

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** The temple bell rings at night. People wake, soldiers fret, the sick cannot sleep.
**Prompt (RU):** Храмовый колокол звонит ночью. Люди просыпаются, солдаты нервничают, больные не спят.

**Choice 1**
- **Choice (EN):** Forbid night ringing.
- **Choice (RU):** Запретить ночной звон.
- **Response (EN):** Night grows quiet. Priests louder by day.
- **Response (RU):** Ночь станет тише. Священники — громче днём.
- **Effects:** Church -10, Army +3, Health +10

**Choice 2**
- **Choice (EN):** Keep the ringing.
- **Choice (RU):** Оставить звон.
- **Response (EN):** The city will pray instead of sleep.
- **Response (RU):** Тогда город будет молиться вместо сна.
- **Effects:** Church +10, Army -3, Health -8

---

### Encounter #159

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** If you stand too often beside Malrik, people stop seeing the king. They see a man in the priest's shadow.
**Prompt (RU):** Если вы слишком часто стоите рядом с Малриком, народ перестанет видеть короля. Он увидит человека в тени жреца.

**Choice 1**
- **Choice (EN):** Appear with Malrik more often.
- **Choice (RU):** Появляться с Малриком чаще.
- **Response (EN):** Holiness will cover you. And hide you too.
- **Response (RU):** Святость укроет вас. И скроет тоже.
- **Effects:** Church +15, Army -5, Treasury -5

**Choice 2**
- **Choice (EN):** Appear apart from the church.
- **Choice (RU):** Появляться отдельно от церкви.
- **Response (EN):** The throne needs its own silhouette.
- **Response (RU):** Трону нужен собственный силуэт.
- **Effects:** Church -8, Army +5, Health +3

---

## Late Pool B

### Encounter #160

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** I propose every official swear loyalty not only to the crown but to the true faith.
**Prompt (RU):** Я предлагаю, чтобы каждый чиновник принёс клятву верности не только короне, но и истинной вере.

**Choice 1**
- **Choice (EN):** Institute the oath of faith.
- **Choice (RU):** Ввести клятву веры.
- **Response (EN):** Power will kneel twice: before throne and altar.
- **Response (RU):** Теперь власть будет стоять на двух коленях: перед троном и алтарём.
- **Effects:** Church +20, Army -5, Treasury -5

**Choice 2**
- **Choice (EN):** Oath to crown alone.
- **Choice (RU):** Клятва только короне.
- **Response (EN):** The throne wants loyalty without soul. Dangerous thrift.
- **Response (RU):** Трон хочет верность без души. Опасная экономия.
- **Effects:** Church -15, Army +8

---

### Encounter #161

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** People confess petty thefts of food. Priests want to give names to guards.
**Prompt (RU):** Люди приходят исповедоваться и признаются в мелких кражах еды. Священники хотят передавать имена стражникам.

**Choice 1**
- **Choice (EN):** Forbid passing names.
- **Choice (RU):** Запретить передавать имена.
- **Response (EN):** Confession stays refuge, not trap.
- **Response (RU):** Исповедь останется убежищем, не ловушкой.
- **Effects:** Church +5, Army -5, Health +12

**Choice 2**
- **Choice (EN):** Give thieves' names.
- **Choice (RU):** Передавать имена воров.
- **Response (EN):** Then people stop confessing. And start staying silent.
- **Response (RU):** Тогда люди перестанут каяться. И начнут молчать.
- **Effects:** Church -8, Army +8, Food +5

---

### Encounter #162

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Old temples need repair. If roofs fall, priests blame the crown. If you pay, the treasury falls.
**Prompt (RU):** Старые храмы требуют ремонта. Если крыши рухнут, священники обвинят корону. Если платить, рухнет казна.

**Choice 1**
- **Choice (EN):** Pay for repairs.
- **Choice (RU):** Оплатить ремонт.
- **Response (EN):** Roofs saved. My soul — not.
- **Response (RU):** Крыши спасены. Моя душа — нет.
- **Effects:** Church +15, Treasury -18, Health +5

**Choice 2**
- **Choice (EN):** Repair only main temples.
- **Choice (RU):** Ремонтировать только главные храмы.
- **Response (EN):** Selective holiness. Cheaper than full.
- **Response (RU):** Выборочная святость. Дешевле полной.
- **Effects:** Church +8, Treasury -8

---

### Encounter #163

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Malrik wants relics with the army. If the enemy takes the caravan, it is disgrace.
**Prompt (RU):** Малрик хочет везти реликвии вместе с армией. Если враг захватит обоз, это станет позором.

**Choice 1**
- **Choice (EN):** Take relics with the army.
- **Choice (RU):** Взять реликвии с армией.
- **Response (EN):** Soldiers march bolder. The train becomes a target.
- **Response (RU):** Солдаты пойдут смелее. Обоз станет целью.
- **Effects:** Church +15, Army +5, Treasury -8

**Choice 2**
- **Choice (EN):** Leave relics in the capital.
- **Choice (RU):** Оставить реликвии в столице.
- **Response (EN):** Right. War hauls enough already.
- **Response (RU):** Правильно. Война и так тащит достаточно лишнего.
- **Effects:** Church -10, Army +5

---

### Encounter #164

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Priests say quarantine denies prayer. They demand quarantine houses opened.
**Prompt (RU):** Священники говорят, что закрывать больных — значит лишать их молитвы. Они требуют открыть карантинные дома.

**Choice 1**
- **Choice (EN):** Keep quarantine.
- **Choice (RU):** Оставить карантин.
- **Response (EN):** Thank you. Disease hates closed doors.
- **Response (RU):** Спасибо. Болезнь ненавидит закрытые двери.
- **Effects:** Church -15, Health +20

**Choice 2**
- **Choice (EN):** Let priests into quarantine.
- **Choice (RU):** Пустить священников внутрь карантина.
- **Response (EN):** They enter to the sick. I hope they leave without plague.
- **Response (RU):** Они войдут к больным. Надеюсь, не выйдут к здоровым с заразой.
- **Effects:** Church +8, Health -5

---

### Encounter #165

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** If the church declares a winter fast, we need more fish and turnip. Less meat, but people will hate the cold more.
**Prompt (RU):** Если церковь объявит зимний пост, нам нужно больше рыбы и репы. Мяса будет меньше, но люди возненавидят холод сильнее.

**Choice 1**
- **Choice (EN):** Stock for the fast.
- **Choice (RU):** Готовить запасы для поста.
- **Response (EN):** Winter will be holy and smell of turnip.
- **Response (RU):** Зима будет святой и пахнуть репой.
- **Effects:** Church +8, Treasury -12, Food +10

**Choice 2**
- **Choice (EN):** Do not support the winter fast.
- **Choice (RU):** Не поддерживать зимний пост.
- **Response (EN):** People eat better. Priests preach worse.
- **Response (RU):** Люди будут есть лучше. Священники — говорить хуже.
- **Effects:** Church -10, Health +5, Food -5

---

### Encounter #166

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** A guard confessed bribes to a priest. The priest will not give his name.
**Prompt (RU):** Один стражник признался священнику, что брал взятки. Священник не хочет выдавать его имя.

**Choice 1**
- **Choice (EN):** Respect confession secrecy.
- **Choice (RU):** Уважать тайну исповеди.
- **Response (EN):** Guards learn the temple is above law. A dangerous lesson.
- **Response (RU):** Стража поймёт, что храм над законом. Опасный урок.
- **Effects:** Church +12, Army -8

**Choice 2**
- **Choice (EN):** Demand the name.
- **Choice (RU):** Потребовать имя.
- **Response (EN):** Good. Bribes hide poorly when confession is no shield.
- **Response (RU):** Хорошо. Взятки прячутся хуже, когда исповедь не щит.
- **Effects:** Church -12, Army +10

---

### Encounter #167

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** The church feeds the poor, heals the sick, judges sinners, and says who deserves the throne. What remains for the king?
**Prompt (RU):** Церковь уже кормит бедных, лечит больных, судит грешников и говорит, кто достоин трона. Что остаётся королю?

**Choice 1**
- **Choice (EN):** Return some duties to the crown.
- **Choice (RU):** Вернуть часть функций короне.
- **Response (EN):** The throne visible again. The temple offended.
- **Response (RU):** Трон снова станет видимым. Храм — обиженным.
- **Effects:** Church -15, Army +8, Treasury -10

**Choice 2**
- **Choice (EN):** Leave the church strong.
- **Choice (RU):** Оставить церковь сильной.
- **Response (EN):** Rule is easy — while the church wants what you want.
- **Response (RU):** Тогда править будет легко. Пока церковь хочет того же, что и вы.
- **Effects:** Church +20, Army -10, Treasury +5

---

### Encounter #168

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, some priests think you a temporary punishment of the gods. I can silence them.
**Prompt (RU):** Ваше Величество, среди священников есть те, кто считает вас временным наказанием богов. Я могу заставить их молчать.

**Choice 1**
- **Choice (EN):** Make them silent.
- **Choice (RU):** Заставь их молчать.
- **Response (EN):** Silence bought with fear. Fear serves too.
- **Response (RU):** Молчание будет куплено страхом. Но страх тоже служит.
- **Effects:** Church +10, Treasury -10, Health +5

**Choice 2**
- **Choice (EN):** Let them speak.
- **Choice (RU):** Пусть говорят.
- **Response (EN):** The temple becomes a market of opinions. Dangerous.
- **Response (RU):** Тогда храм станет рынком мнений. Опасное зрелище.
- **Effects:** Church -5, Health -10

---

### Encounter #169

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** People ask a service for the former king's soul. Forbid it — cruel. Allow it — dangerous.
**Prompt (RU):** Люди просят провести службу за душу прежнего короля. Запретить — жестоко. Разрешить — опасно.

**Choice 1**
- **Choice (EN):** Allow the service.
- **Choice (RU):** Разрешить службу.
- **Response (EN):** The dead sometimes calm the living.
- **Response (RU):** Мёртвые иногда успокаивают живых.
- **Effects:** Church +8, Army -5, Health +8

**Choice 2**
- **Choice (EN):** Forbid the service.
- **Choice (RU):** Запретить службу.
- **Response (EN):** Memory will not vanish. It goes to the cellar.
- **Response (RU):** Память не исчезнет. Она просто уйдёт в подвал.
- **Effects:** Church -8, Army +8, Health -10

---

### Encounter #170

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** New coin may bear your profile or a church symbol. One strengthens the throne, the other people's trust.
**Prompt (RU):** Новая монета может нести ваш профиль или церковный символ. Первый вариант укрепит трон, второй — доверие народа.

**Choice 1**
- **Choice (EN):** The king's profile.
- **Choice (RU):** Профиль короля.
- **Response (EN):** The coin will look at the people with your face.
- **Response (RU):** Монета будет смотреть на народ вашим лицом.
- **Effects:** Church -8, Army +5, Treasury +5

**Choice 2**
- **Choice (EN):** A church symbol.
- **Choice (RU):** Церковный символ.
- **Response (EN):** Holy coin spends as fast, but argued over less.
- **Response (RU):** Святая монета тратится так же быстро, но спорят с ней меньше.
- **Effects:** Church +12, Army -5, Treasury +5

---

### Encounter #171

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Malrik wants a priest on the war council. I do not discuss flanks with a man who believes in miracles.
**Prompt (RU):** Малрик хочет прислать священника на военный совет. Я не обсуждаю фланги с человеком, который верит в чудеса.

**Choice 1**
- **Choice (EN):** Allow the priest on council.
- **Choice (RU):** Пустить священника на совет.
- **Response (EN):** Then let him pray not to interfere.
- **Response (RU):** Тогда пусть он молится, чтобы не мешал.
- **Effects:** Church +12, Army -10

**Choice 2**
- **Choice (EN):** Forbid it.
- **Choice (RU):** Запретить.
- **Response (EN):** Good. The map stays a map, not an icon.
- **Response (RU):** Хорошо. Карта останется картой, не иконой.
- **Effects:** Church -10, Army +10

---

### Encounter #172

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Women go to the temple to give birth for promised blessing. There are no clean linens.
**Prompt (RU):** Женщины идут рожать в храм, потому что им обещают благословение. Но там нет чистых простыней.

**Choice 1**
- **Choice (EN):** Forbid births in the temple.
- **Choice (RU):** Запретить роды в храме.
- **Response (EN):** Children will be born in cleanliness, not candle smoke.
- **Response (RU):** Дети будут рождаться в чистоте, а не в дыму свечей.
- **Effects:** Church -10, Health +15

**Choice 2**
- **Choice (EN):** Equip a temple birthing room.
- **Choice (RU):** Оборудовать храмовую комнату для родов.
- **Response (EN):** If they go to the temple, let it wash its hands.
- **Response (RU):** Если уж они идут к храму, пусть храм хотя бы моет руки.
- **Effects:** Church +8, Treasury -10, Health +15

---

### Encounter #173

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** The temple wants the best wine for service. Soldiers want the same without service.
**Prompt (RU):** Храм просит лучшее вино для службы. Солдаты просят то же самое без службы.

**Choice 1**
- **Choice (EN):** Give wine to the temple.
- **Choice (RU):** Отдать вино храму.
- **Response (EN):** The holy cup full. Soldiers' mugs empty.
- **Response (RU):** Святая чаша будет полной. Солдатские кружки — пустыми.
- **Effects:** Church +10, Army -5, Treasury -5

**Choice 2**
- **Choice (EN):** Give wine to the army.
- **Choice (RU):** Отдать вино армии.
- **Response (EN):** Soldiers drink to your health. The temple against it.
- **Response (RU):** Солдаты выпьют за ваше здоровье. Храм — против него.
- **Effects:** Church -8, Army +10

---

### Encounter #174

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** During service by the temple a man with a knife was caught. He says he meant to kill not you but Malrik.
**Prompt (RU):** Во время службы у храма поймали человека с ножом. Он говорит, что хотел убить не вас, а Малрика.

**Choice 1**
- **Choice (EN):** Hand him to the church.
- **Choice (RU):** Отдать его церкви.
- **Response (EN):** The temple tries an attack on the temple. Convenient for them.
- **Response (RU):** Храм будет судить нападение на храм. Удобно для них.
- **Effects:** Church +12, Army -5

**Choice 2**
- **Choice (EN):** Try him in royal court.
- **Choice (RU):** Судить королевским судом.
- **Response (EN):** Good. A knife in the capital is the crown's business.
- **Response (RU):** Хорошо. Нож в столице — дело короны.
- **Effects:** Church -8, Army +10

---

### Encounter #175

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** People now fear the royal sword and church curse. Together they hold order. Together they can break the realm.
**Prompt (RU):** Народ теперь боится двух вещей: королевского меча и церковного проклятия. Вместе они держат порядок. Вместе они могут сломать страну.

**Choice 1**
- **Choice (EN):** Use both fears.
- **Choice (RU):** Использовать оба страха.
- **Response (EN):** Order strong as a cage.
- **Response (RU):** Порядок будет крепким. Как клетка.
- **Effects:** Church +10, Army +10, Health -15

**Choice 2**
- **Choice (EN):** Soften royal punishments.
- **Choice (RU):** Смягчить королевские наказания.
- **Response (EN):** The throne less fearsome. Risk and hope.
- **Response (RU):** Трон станет менее страшным. Это риск и надежда.
- **Effects:** Church +3, Army -8, Health +10

---

### Encounter #176

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** If you keep quarreling with the temple, some priests may refuse you prayers. The people will hear that as verdict.
**Prompt (RU):** Если вы продолжите спорить с храмом, некоторые священники могут отказать вам в молитвах. Народ услышит это как приговор.

**Choice 1**
- **Choice (EN):** Yield to the temple.
- **Choice (RU):** Уступить храму.
- **Response (EN):** Prayers continue. Peace costs less than church split.
- **Response (RU):** Молитвы продолжатся. Цена мира всегда ниже цены раскола.
- **Effects:** Church +20, Army -5, Treasury -10

**Choice 2**
- **Choice (EN):** Threaten the temple.
- **Choice (RU):** Пригрозить храму.
- **Response (EN):** You may frighten a priest. Not the faith behind him.
- **Response (RU):** Вы можете напугать священника. Но не веру, которая стоит за ним.
- **Effects:** Church -20, Army +12

---

### Encounter #177

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** I opened monastery stores without Malrik's leave. People ate. Now I may be punished.
**Prompt (RU):** Я открыл монастырские склады без разрешения Малрика. Люди ели. Теперь меня могут наказать.

**Choice 1**
- **Choice (EN):** Protect Arvel.
- **Choice (RU):** Защитить Арвела.
- **Response (EN):** Thank you. I feared not punishment but your order to close the doors.
- **Response (RU):** Спасибо. Я боялся не наказания, а того, что вы велите закрыть двери.
- **Effects:** Church -12, Health +15, Food +5

**Choice 2**
- **Choice (EN):** Return him to church judgment.
- **Choice (RU):** Вернуть его под суд церкви.
- **Response (EN):** I accept judgment. But the hungry will wait again.
- **Response (RU):** Я приму суд. Но голодные снова будут ждать.
- **Effects:** Church +12, Health -8

---

### Encounter #178

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Malrik hints a large gift will speed the church's official recognition of your rule.
**Prompt (RU):** Малрик намекает, что большое пожертвование ускорит официальное признание вашей власти церковью.

**Choice 1**
- **Choice (EN):** Pay.
- **Choice (RU):** Заплатить.
- **Response (EN):** Congratulations. Blessing is a premium product.
- **Response (RU):** Поздравляю. Благословение оказалось товаром премиального качества.
- **Effects:** Church +25, Treasury -25

**Choice 2**
- **Choice (EN):** Refuse to pay.
- **Choice (RU):** Отказаться платить.
- **Response (EN):** Treasury saved. Heaven can wait.
- **Response (RU):** Казна сохранена. Небеса, похоже, подождут.
- **Effects:** Church -15, Treasury +10

---

### Encounter #179

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** The church no longer merely prays. It feeds, judges, heals, collects gold, and says who deserves the throne. Little remains before the ninetieth day. You must decide what it becomes.
**Prompt (RU):** Церковь больше не просто молится. Она кормит, судит, лечит, собирает золото и говорит, кто достоин трона. До девяностого дня осталось немного. Нужно решить, кем она станет.

**Choice 1**
- **Choice (EN):** The church will be the throne's pillar.
- **Choice (RU):** Церковь станет опорой трона.
- **Response (EN):** The throne gains a holy pillar. And holy dependence.
- **Response (RU):** Трон обретёт святую опору. И святую зависимость.
- **Effects:** Church +25, Army -10, Treasury -10, Health +5

**Choice 2**
- **Choice (EN):** The church will be subject to the crown.
- **Choice (RU):** Церковь будет подчинена короне.
- **Response (EN):** You chose force. Now the temple may choose resistance.
- **Response (RU):** Вы выбрали силу. Теперь храм может выбрать сопротивление.
- **Effects:** Church -25, Army +15, Treasury +10

**Choice 3**
- **Choice (EN):** Church and crown will share power.
- **Choice (RU):** Церковь и корона разделят власть.
- **Response (EN):** Balance is reached. Who breaks it first remains to be seen.
- **Response (RU):** Равновесие достигнуто. Осталось понять, кто первым его нарушит.
- **Effects:** Church +10, Army +5, Treasury -5, Health +5

---

## People Pool

### Encounter #180

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** The people whisper the word 'king who took the throne'. But if the church performs a rite of purification of the crown, the whisper will become a prayer.
**Prompt (RU):** Народ шепчет слово ‘тот, кто взял трон’. Но если церковь проведёт обряд очищения короны, шёпот станет молитвой.

**Choice 1**
- **Choice (EN):** Carry out an expensive ritual.
- **Choice (RU):** Провести дорогой обряд.
- **Response (EN):** The gods love humility. And the people love to see the king bow his head.
- **Response (RU):** Боги любят смирение. А народ любит видеть, что король склоняет голову.
- **Effects:** People +5, Treasury -15

**Choice 2**
- **Choice (EN):** Perform a modest ceremony.
- **Choice (RU):** Провести скромный обряд.
- **Response (EN):** Modesty is also a virtue. Although gold shines more convincingly.
- **Response (RU):** Скромность тоже добродетель. Хотя золото сияет убедительнее.
- **Effects:** People +2, Treasury -5

**Choice 3**
- **Choice (EN):** The crown doesn't need prayers.
- **Choice (RU):** Короне не нужны молитвы.
- **Response (EN):** The throne without blessing stands high, but sways more.
- **Response (RU):** Трон без благословения стоит высоко, но качается сильнее.
- **Effects:** People -5, Treasury +5

**Choice 4**
- **Choice (EN):** What does the church want in return?
- **Choice (RU):** Чего церковь хочет взамен?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Little. Return the grain warehouses to the temple. We will feed souls and bodies, and you will get silence on the streets.
**Prompt (RU):** Немногое. Верните храму зерновые склады. Мы накормим души и тела, а вы получите тишину на улицах.

**Choice 1**
- **Choice (EN):** Return the warehouses to the temple.
- **Choice (RU):** Вернуть склады храму.
- **Response (EN):** Wise. Bread given to the temple is returned through prayer.
- **Response (RU):** Мудро. Хлеб, отданный храму, возвращается молитвой.
- **Effects:** People +10, Food -15

**Choice 2**
- **Choice (EN):** Give away only part of the grain.
- **Choice (RU):** Отдать только часть зерна.
- **Response (EN):** Half mercy is still better than complete pride.
- **Response (RU):** Половина милости всё же лучше полной гордыни.
- **Effects:** People +5, Food -7

---

### Encounter #181

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, there are more cobwebs in the treasury than gold. A temporary tax on city gates can be introduced.
**Prompt (RU):** Ваше Величество, в казне больше паутины, чем золота. Можно ввести временный налог на городские ворота.

**Choice 1**
- **Choice (EN):** Implement the tax immediately.
- **Choice (RU):** Ввести налог немедленно.
- **Response (EN):** Wonderful. The gate will finally begin to bring in more than a draft.
- **Response (RU):** Прекрасно. Ворота наконец начнут приносить больше, чем сквозняк.
- **Effects:** People -5, Treasury +20

**Choice 2**
- **Choice (EN):** Introduce a tax only for merchants.
- **Choice (RU):** Ввести налог только для купцов.
- **Response (EN):** Merchants will complain. But they even complain about the sun if it shines freely.
- **Response (RU):** Купцы будут жаловаться. Но они жалуются даже на солнце, если оно светит бесплатно.
- **Effects:** Treasury +10, Food -5

**Choice 3**
- **Choice (EN):** Don't touch the gate.
- **Choice (RU):** Не трогать ворота.
- **Response (EN):** Free trade is a noble idea. It’s a pity that it doesn’t give out coins right away.
- **Response (RU):** Свободная торговля — благородная мысль. Жаль, что монет она даёт не сразу.
- **Effects:** Treasury -5, Food +10

**Choice 4**
- **Choice (EN):** Find another source of income.
- **Choice (RU):** Найти другой источник дохода.
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** You can sell some of the royal jewelry. Jewels are beautiful, but dead. At least the treasury is breathing.
**Prompt (RU):** Можно продать часть королевских украшений. Драгоценности красивы, но мёртвы. Казна хотя бы дышит.

**Choice 1**
- **Choice (EN):** Sell secretly.
- **Choice (RU):** Продать тайно.
- **Response (EN):** No one will notice. Except for those who counted the stones on the crown.
- **Response (RU):** Никто не заметит. Кроме тех, кто считал камни на короне.
- **Effects:** Treasury +15

**Choice 2**
- **Choice (EN):** Sell publicly, as a sacrifice for the sake of the people.
- **Choice (RU):** Продать публично, как жертву ради народа.
- **Response (EN):** Good move. Poverty looks better when it is called a virtue.
- **Response (RU):** Хороший ход. Бедность выглядит лучше, когда её называют добродетелью.
- **Effects:** People +3, Treasury +12

---

### Encounter #182

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** In the lower city there is fever and cough. It could be a cold, or it could be the beginning of a pestilence. We need to act now.
**Prompt (RU):** В нижнем городе жар и кашель. Это может быть простуда, а может быть начало чумы. Нужно действовать сейчас.

**Choice 1**
- **Choice (EN):** Close the block for quarantine.
- **Choice (RU):** Закрыть квартал на карантин.
- **Response (EN):** Cruel, but reasonable. Sometimes a door saves more lives than a sword.
- **Response (RU):** Жестоко, но разумно. Иногда дверь спасает больше жизней, чем меч.
- **Effects:** People +20, Treasury -10, Food -5

**Choice 2**
- **Choice (EN):** Send healers and leave the gates open.
- **Choice (RU):** Отправить лекарей и оставить ворота открытыми.
- **Response (EN):** We'll do what we can. But disease loves the open road.
- **Response (RU):** Мы сделаем, что сможем. Но болезнь любит открытые дороги.
- **Effects:** People +8, Treasury -8

**Choice 3**
- **Choice (EN):** Don't cause panic.
- **Choice (RU):** Не сеять панику.
- **Response (EN):** Panic kills quickly. Illness is more patient.
- **Response (RU):** Паника убивает быстро. Болезнь — терпеливее.
- **Effects:** People -20, Treasury +5

**Choice 4**
- **Choice (EN):** How serious is it?
- **Choice (RU):** Насколько всё серьёзно?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** So far three have died. If this is what I fear, in a week we will not be counting people, but streets.
**Prompt (RU):** Пока умерли трое. Если это то, чего я боюсь, через неделю мы будем считать не людей, а улицы.

**Choice 1**
- **Choice (EN):** Quarantine only infected streets.
- **Choice (RU):** Карантин только заражённых улиц.
- **Response (EN):** This will give us time. And time is the best medicine after clean water.
- **Response (RU):** Это даст нам время. А время — лучшее лекарство после чистой воды.
- **Effects:** People +12, Treasury -5

**Choice 2**
- **Choice (EN):** Burn down infected houses.
- **Choice (RU):** Сжечь заражённые дома.
- **Response (EN):** Fire will stop the disease. But people will remember the smoke.
- **Response (RU):** Огонь остановит болезнь. Но люди запомнят дым.
- **Effects:** People +20, Treasury -5, Food -5

---

### Encounter #183

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** The nobles are waiting for the first royal feast. But if I set the table properly, the city barns will lose weight.
**Prompt (RU):** Знать ждёт первого королевского пира. Но если я накрою стол как положено, городские амбары похудеют.

**Choice 1**
- **Choice (EN):** Have a luxurious feast.
- **Choice (RU):** Устроить роскошный пир.
- **Response (EN):** The feast will be such that the guests will forget hunger. True, the city is not.
- **Response (RU):** Пир будет таким, что гости забудут голод. Правда, город — нет.
- **Effects:** Army +5, Treasury -10, Food -20

**Choice 2**
- **Choice (EN):** Have a modest feast.
- **Choice (RU):** Устроить скромный пир.
- **Response (EN):** A modest feast is when the nobles still eat, but complain more quietly.
- **Response (RU):** Скромный пир — это когда дворяне всё равно едят, но жалуются тише.
- **Effects:** Treasury -4, Food -8

**Choice 3**
- **Choice (EN):** Call off the feast and give the food to the poor.
- **Choice (RU):** Отменить пир и раздать еду бедным.
- **Response (EN):** The bread below will be more appreciated than the peacock above.
- **Response (RU):** Хлеб внизу оценят больше, чем павлина наверху.
- **Effects:** People +15, Food -10

**Choice 4**
- **Choice (EN):** Is it possible to deceive guests?
- **Choice (RU):** Можно обмануть гостей?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Yes. Cheap meat, expensive sauce, a lot of candles - and half of the guests will decide that they ate something rare.
**Prompt (RU):** Да, можно. Дешёвое мясо, дорогой соус, много свечей — и половина гостей решит, что ели редкость.

**Choice 1**
- **Choice (EN):** Make a cheap feast disguised as a luxurious one.
- **Choice (RU):** Сделать дешёвый пир под видом роскошного.
- **Response (EN):** I love it when royal wisdom smells of garlic and deceit.
- **Response (RU):** Люблю, когда королевская мудрость пахнет чесноком и обманом.
- **Effects:** Treasury -3, Food -5

**Choice 2**
- **Choice (EN):** No, the feast must be real.
- **Choice (RU):** Нет, пир должен быть настоящим.
- **Response (EN):** It will be real. And hunger after it too.
- **Response (RU):** Будет настоящий. И голод после него тоже.
- **Effects:** Treasury -10, Food -20

---

### Encounter #184

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Months after the coup, the palace still holds strangers at the gates. I ask that the night watch be doubled. It's expensive, but you'll sleep longer.
**Prompt (RU):** После переворота дворец полон чужих лиц. Я прошу удвоить ночную стражу. Это дорого, но вы будете спать дольше.

**Choice 1**
- **Choice (EN):** Double the guards.
- **Choice (RU):** Удвоить стражу.
- **Response (EN):** Fine. The night will become more expensive, but safer.
- **Response (RU):** Хорошо. Ночь станет дороже, но безопаснее.
- **Effects:** Army +10, Treasury -10

**Choice 2**
- **Choice (EN):** Supply only proven soldiers.
- **Choice (RU):** Поставить только проверенных солдат.
- **Response (EN):** Fewer people, more trust. I can work with this.
- **Response (RU):** Меньше людей, больше доверия. Я смогу с этим работать.
- **Effects:** Army +5, Treasury -5

**Choice 3**
- **Choice (EN):** Don't waste money on fears.
- **Choice (RU):** Не тратить деньги на страхи.
- **Response (EN):** Then let's hope that fears don't waste their knives either.
- **Response (RU):** Тогда будем надеяться, что страхи тоже не тратят ножи.
- **Effects:** People -2, Army -5, Treasury +5

**Choice 4**
- **Choice (EN):** Who do you suspect?
- **Choice (RU):** Кого вы подозреваете?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Servants of the former king. Not everyone. But one with a key is enough for the door to become a grave.
**Prompt (RU):** Слуг прежнего короля. Не всех. Но достаточно одного с ключом, чтобы дверь стала могилой.

**Choice 1**
- **Choice (EN):** Replace servants with soldiers.
- **Choice (RU):** Заменить слуг солдатами.
- **Response (EN):** The palace will become rougher, but the doors will obey.
- **Response (RU):** Дворец станет грубее, зато двери будут слушаться.
- **Effects:** Army +10, Treasury -10, Food -5

**Choice 2**
- **Choice (EN):** Check on the servants secretly.
- **Choice (RU):** Проверить слуг тайно.
- **Response (EN):** A quiet check catches more truth than a loud order.
- **Response (RU):** Тихая проверка ловит больше правды, чем громкий приказ.
- **Effects:** Army +3, Treasury -5

---

### Encounter #185

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your next decree will be remembered by the realm. It should be simple. Grace, tax or sword?
**Prompt (RU):** Первый указ нового короля запомнят все. Он должен быть простым. Милость, налог или меч?

**Choice 1**
- **Choice (EN):** Reduce the price of bread.
- **Choice (RU):** Снизить цену на хлеб.
- **Response (EN):** Bread is the quietest way to tell the people that the king still needs it.
- **Response (RU):** Хлеб — самый тихий способ сказать народу, что он ещё нужен королю.
- **Effects:** People +15, Treasury -5, Food -10

**Choice 2**
- **Choice (EN):** Increase tax collection.
- **Choice (RU):** Увеличить сбор налогов.
- **Response (EN):** The treasury will come to life. People may be the opposite.
- **Response (RU):** Казна оживёт. Народ, возможно, наоборот.
- **Effects:** People -10, Treasury +20

**Choice 3**
- **Choice (EN):** Announce recruitment into the army.
- **Choice (RU):** Объявить набор в армию.
- **Response (EN):** There will be more swords. There are fewer hands in the fields.
- **Response (RU):** Мечей станет больше. Рук в полях — меньше.
- **Effects:** Army +15, Treasury -5, Food -5

---

### Encounter #186

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Six deserters were captured. They say that they fled not from fear, but from hunger. The army is watching what you do.
**Prompt (RU):** Пойманы шесть дезертиров. Они говорят, что бежали не от страха, а от голода. Армия смотрит, как вы поступите.

**Choice 1**
- **Choice (EN):** Execute them publicly.
- **Choice (RU):** Казнить их публично.
- **Response (EN):** Cruel. But tomorrow no one will run first.
- **Response (RU):** Жестоко. Зато завтра никто не побежит первым.
- **Effects:** People -5, Army +15

**Choice 2**
- **Choice (EN):** Return them to duty after punishment.
- **Choice (RU):** Вернуть их в строй после наказания.
- **Response (EN):** They will limp, but serve. It's better than hanging.
- **Response (RU):** Они будут хромать, но служить. Это лучше, чем висеть.
- **Effects:** People -2, Army +5

**Choice 3**
- **Choice (EN):** Have mercy and feed.
- **Choice (RU):** Помиловать и накормить.
- **Response (EN):** Mercy is good at the hearth. In the barracks she smells of weakness.
- **Response (RU):** Милость хороша у очага. В казарме она пахнет слабостью.
- **Effects:** People +5, Army -10, Food -5

**Choice 4**
- **Choice (EN):** Why are soldiers starving?
- **Choice (RU):** Почему солдаты голодают?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because quartermasters steal. War always feeds rats - in barns and in uniforms.
**Prompt (RU):** Потому что интенданты воруют. Война всегда кормит крыс — в амбарах и в мундирах.

**Choice 1**
- **Choice (EN):** Hang the quartermasters.
- **Choice (RU):** Повесить интендантов.
- **Response (EN):** After this, grain will begin to be counted more honestly.
- **Response (RU):** После этого зерно начнут считать честнее.
- **Effects:** Army +10, Food +5

**Choice 2**
- **Choice (EN):** Force them to return what they stole.
- **Choice (RU):** Заставить вернуть украденное.
- **Response (EN):** Fine. Let their greed at least feed the soldiers.
- **Response (RU):** Хорошо. Пусть их жадность хотя бы накормит солдат.
- **Effects:** Treasury +5, Food +10

---

### Encounter #187

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** People suffer not only in body, but also in fear. Allow churches to hold night services. Crowds will come to pray.
**Prompt (RU):** Люди болеют не только телом, но и страхом. Позвольте храмам провести ночные службы. Толпы придут молиться.

**Choice 1**
- **Choice (EN):** Allow services.
- **Choice (RU):** Разрешить службы.
- **Response (EN):** People will leave with a prayer on their lips. Sometimes that's enough to get you through the night.
- **Response (RU):** Люди уйдут с молитвой на губах. Иногда этого достаточно, чтобы пережить ночь.
- **Effects:** People +5, Food -3

**Choice 2**
- **Choice (EN):** Ban large gatherings.
- **Choice (RU):** Запретить большие собрания.
- **Response (EN):** You save bodies. I hope the souls will wait.
- **Response (RU):** Вы спасаете тела. Надеюсь, души подождут.
- **Effects:** People +10, Treasury -3

**Choice 3**
- **Choice (EN):** Services are only in open areas.
- **Choice (RU):** Службы только на открытых площадях.
- **Response (EN):** The sky is also the vault of the temple. The gods will hear.
- **Response (RU):** Небо тоже свод храма. Боги услышат.
- **Effects:** People +8, Treasury -5

---

### Encounter #188

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** You can issue a new coin with your face on it. If you add less silver, the treasury will benefit. People won't notice right away.
**Prompt (RU):** Можно выпустить новую монету с вашим лицом. Если добавить меньше серебра, казна выиграет. Народ заметит не сразу.

**Choice 1**
- **Choice (EN):** Mint an honest coin.
- **Choice (RU):** Чеканить честную монету.
- **Response (EN):** Expensive, but beautiful. Honesty always costs more than copper.
- **Response (RU):** Дорого, но красиво. Честность всегда обходится дороже меди.
- **Effects:** People +5, Treasury -10

**Choice 2**
- **Choice (EN):** Dilute silver with copper.
- **Choice (RU):** Разбавить серебро медью.
- **Response (EN):** The coin will become lighter. As does the conscience of those who spend it.
- **Response (RU):** Монета станет легче. Как и совесть тех, кто её тратит.
- **Effects:** People -8, Treasury +20

**Choice 3**
- **Choice (EN):** Set aside minting.
- **Choice (RU):** Отложить чеканку.
- **Response (EN):** The old coins will continue to circulate. Along with the old memory.
- **Response (RU):** Старые монеты продолжат ходить. Вместе со старой памятью.
- **Effects:** No stat change

**Choice 4**
- **Choice (EN):** Who will know about the fake?
- **Choice (RU):** Кто узнает о подделке?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Masters of the Mint. But silence is worth less than silver.
**Prompt (RU):** Мастера монетного двора. Но молчание стоит дешевле серебра.

**Choice 1**
- **Choice (EN):** Pay the masters and dilute the coin.
- **Choice (RU):** Заплатить мастерам и разбавить монету.
- **Response (EN):** Good deal. Bad coin. Great policy.
- **Response (RU):** Хорошая сделка. Плохая монета. Прекрасная политика.
- **Effects:** People -8, Treasury +15

**Choice 2**
- **Choice (EN):** Don't take risks.
- **Choice (RU):** Не рисковать.
- **Response (EN):** Caution rarely fills chests, but sometimes saves heads.
- **Response (RU):** Осторожность редко наполняет сундуки, но иногда сохраняет головы.
- **Effects:** Treasury -5

---

### Encounter #189

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** You haven't slept for three nights. If you collapse, the palace will begin to share power without you. You need rest.
**Prompt (RU):** Вы не спали три ночи. Если вы рухнете, дворец начнёт делить власть без вас. Вам нужен отдых.

**Choice 1**
- **Choice (EN):** Cancel appointments for the day.
- **Choice (RU):** Отменить приёмы на день.
- **Response (EN):** A living king is better than a busy dead one.
- **Response (RU):** Живой король лучше занятого мертвеца.
- **Effects:** People +3, Army -3

**Choice 2**
- **Choice (EN):** Continue working.
- **Choice (RU):** Продолжить работать.
- **Response (EN):** Then at least fall next to the chair to make it easier to lift you up.
- **Response (RU):** Тогда хотя бы падайте рядом с креслом, чтобы вас легче было поднять.
- **Effects:** People -5, Treasury +5

**Choice 3**
- **Choice (EN):** Take a strengthening potion.
- **Choice (RU):** Принять укрепляющее зелье.
- **Response (EN):** It will help. But don't confuse cheerfulness with healing.
- **Response (RU):** Оно поможет. Но не путайте бодрость с исцелением.
- **Effects:** People +5, Treasury -5

**Choice 4**
- **Choice (EN):** What's in the potion?
- **Choice (RU):** Что в зелье?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Herbs, honey and a little something to get your heart pumping. After it comes weakness.
**Prompt (RU):** Травы, мёд и немного того, что заставит сердце биться быстрее. После него придёт слабость.

**Choice 1**
- **Choice (EN):** Drink anyway.
- **Choice (RU):** Выпить всё равно.
- **Response (EN):** You bought a day of strength at the price of tomorrow's trembling.
- **Response (RU):** Вы купили день силы ценой завтрашней дрожи.
- **Effects:** People -8, Treasury +5

**Choice 2**
- **Choice (EN):** Give up and go to bed.
- **Choice (RU):** Отказаться и лечь спать.
- **Response (EN):** Finally an order that doesn't harm the body.
- **Response (RU):** Наконец-то приказ, который не вредит телу.
- **Effects:** People +5, Treasury -3

---

### Encounter #190

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Some of the grain in the western barn was covered with gray mold. If we throw it away, there will be less food. If we cook it stronger, maybe no one will die.
**Prompt (RU):** Часть зерна в западном амбаре покрылась серой плесенью. Если выбросим — еды станет меньше. Если сварим крепче — может, никто не умрёт.

**Choice 1**
- **Choice (EN):** Throw away spoiled grain.
- **Choice (RU):** Выбросить испорченное зерно.
- **Response (EN):** Sorry for the grain. But the dead eat even less.
- **Response (RU):** Жаль зерно. Но мёртвые едят ещё меньше.
- **Effects:** People +10, Food -15

**Choice 2**
- **Choice (EN):** Use it for soldiers' porridge.
- **Choice (RU):** Использовать для солдатской каши.
- **Response (EN):** The soldiers will notice. Especially those who run to the bucket.
- **Response (RU):** Солдаты заметят. Особенно те, кто добежит до ведра.
- **Effects:** People -10, Army -5, Food +5

**Choice 3**
- **Choice (EN):** Mix with good things and give to the poor.
- **Choice (RU):** Смешать с хорошим и раздать бедным.
- **Response (EN):** The poor are accustomed to the worst. But this does not mean that their stomachs are iron.
- **Response (RU):** Бедняки привыкли к худшему. Но это не значит, что их желудки железные.
- **Effects:** People -15, Food +8

**Choice 4**
- **Choice (EN):** Can some be saved?
- **Choice (RU):** Можно спасти часть?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** A third can be dried. The rest is only suitable for rats, and even evil ones.
**Prompt (RU):** Треть можно просушить. Остальное уже годится только для крыс, и то злых.

**Choice 1**
- **Choice (EN):** Save a third, throw the rest away.
- **Choice (RU):** Спасти треть, остальное выбросить.
- **Response (EN):** Reasonable. Not generous, not stupid. Rare recipe.
- **Response (RU):** Разумно. Не щедро, не глупо. Редкий рецепт.
- **Effects:** People +7, Food -8

**Choice 2**
- **Choice (EN):** Save everything and take risks.
- **Choice (RU):** Спасти всё и рискнуть.
- **Response (EN):** Then I'll have it prepared next to the infirmary.
- **Response (RU):** Тогда я велю готовить рядом с лазаретом.
- **Effects:** People -10, Food +5

---

### Encounter #191

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** A crowd gathered at the palace gates. They are not armed, but they demand bread and an answer: whether you still rule them, or the church does.
**Prompt (RU):** У дворцовых ворот собралась толпа. Они не вооружены, но требуют хлеба и ответа: кто теперь правит ими?

**Choice 1**
- **Choice (EN):** Go out to them in person.
- **Choice (RU):** Выйти к ним лично.
- **Response (EN):** A bold move. I'll post guards close, but not too noticeably.
- **Response (RU):** Смелый ход. Я поставлю людей близко, но не слишком заметно.
- **Effects:** People +10, Army -5

**Choice 2**
- **Choice (EN):** Distribute bread through the guards.
- **Choice (RU):** Раздать хлеб через стражу.
- **Response (EN):** Bread speaks more simply than a king. Sometimes even more convincing.
- **Response (RU):** Хлеб говорит проще короля. Иногда даже убедительнее.
- **Effects:** People +8, Food -10

**Choice 3**
- **Choice (EN):** Disperse the crowd.
- **Choice (RU):** Разогнать толпу.
- **Response (EN):** It will be done. But bruises can also remember.
- **Response (RU):** Будет сделано. Но синяки тоже умеют помнить.
- **Effects:** People -15, Army +10

---

### Encounter #192

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** The church can open its barns to the poor. But the decree should say that this was done out of our mercy.
**Prompt (RU):** Церковь может открыть свои амбары для бедных. Но в указе должно быть сказано, что это сделано по нашему милосердию.

**Choice 1**
- **Choice (EN):** Agree and praise the church.
- **Choice (RU):** Согласиться и похвалить церковь.
- **Response (EN):** Mercy loves witnesses. Today the whole city will become them.
- **Response (RU):** Милосердие любит свидетелей. Сегодня ими станет весь город.
- **Effects:** People +10, Food +10

**Choice 2**
- **Choice (EN):** Help must come in the name of the king.
- **Choice (RU):** Помощь должна идти от имени короля.
- **Response (EN):** The crown wants glory even for someone else's bread. Well, this is also hunger.
- **Response (RU):** Корона хочет славы даже за чужой хлеб. Что ж, это тоже голод.
- **Effects:** People +5, Treasury -5, Food +5

**Choice 3**
- **Choice (EN):** Refuse church help.
- **Choice (RU):** Отказаться от церковной помощи.
- **Response (EN):** Pride is rarely satisfying.
- **Response (RU):** Гордость редко бывает сытной.
- **Effects:** People -10, Treasury +3, Food -5

---

### Encounter #193

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** In the houses of executed supporters of the past king, silver, paintings, and horses remained. By law, everything can be taken away.
**Prompt (RU):** В домах казнённых сторонников прошлого короля осталось серебро, картины, лошади. По закону всё можно забрать.

**Choice 1**
- **Choice (EN):** Take everything to the treasury.
- **Choice (RU):** Забрать всё в казну.
- **Response (EN):** The dead don't need luxury. Very lively treasury.
- **Response (RU):** Мёртвым роскошь не нужна. Живой казне — очень.
- **Effects:** People -5, Treasury +25

**Choice 2**
- **Choice (EN):** Take only weapons and coins.
- **Choice (RU):** Забрать только оружие и монеты.
- **Response (EN):** Moderately. I'm almost upset at your decency.
- **Response (RU):** Умеренно. Я почти расстроен вашей порядочностью.
- **Effects:** Army +5, Treasury +15

**Choice 3**
- **Choice (EN):** Leave some property to families.
- **Choice (RU):** Оставить семьям часть имущества.
- **Response (EN):** Mercy is dear. But sometimes revenge is cheaper.
- **Response (RU):** Милосердие дорого. Но иногда дешевле мести.
- **Effects:** People +8, Treasury +5

---

### Encounter #194

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** In the city they drink from a canal where waste is dumped. If the water is not purified, the disease will return stronger.
**Prompt (RU):** В городе пьют из канала, куда сбрасывают отходы. Если не очистить воду, болезнь вернётся сильнее.

**Choice 1**
- **Choice (EN):** Allocate money to clean wells.
- **Choice (RU):** Выделить деньги на очистку колодцев.
- **Response (EN):** Clean water will save more people than a dozen sermons and a hundred executions.
- **Response (RU):** Чистая вода спасёт больше людей, чем десяток проповедей и сотня казней.
- **Effects:** People +25, Treasury -15

**Choice 2**
- **Choice (EN):** Make residents clean for free.
- **Choice (RU):** Заставить жителей чистить бесплатно.
- **Response (EN):** They will be angry. But at least they'll be angry while alive.
- **Response (RU):** Они будут злиться. Но хотя бы злиться живыми.
- **Effects:** People +10, Army +3, Treasury -3

**Choice 3**
- **Choice (EN):** Don't spend any money yet.
- **Choice (RU):** Пока не тратить деньги.
- **Response (EN):** Then the disease has already received your first gift.
- **Response (RU):** Тогда болезнь уже получила ваш первый подарок.
- **Effects:** People -20, Treasury +8

---

### Encounter #195

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** The army eats better than city children. I can dilute the soldiers' stew and send the grain to shelters.
**Prompt (RU):** Армия ест лучше, чем городские дети. Я могу разбавить солдатскую похлёбку и направить крупу в приюты.

**Choice 1**
- **Choice (EN):** Thin the stew.
- **Choice (RU):** Разбавить похлёбку.
- **Response (EN):** The children will eat. The soldiers curse. A typical day in the kitchen.
- **Response (RU):** Дети поедят. Солдаты выругаются. Обычный день кухни.
- **Effects:** People +10, Army -10, Food +8

**Choice 2**
- **Choice (EN):** Don't touch the soldiers' rations.
- **Choice (RU):** Не трогать солдатские пайки.
- **Response (EN):** The soldiers will be well fed. Shelters will smell like empty bowls.
- **Response (RU):** Солдаты будут сыты. Приюты будут пахнуть пустыми мисками.
- **Effects:** People -5, Army +8

**Choice 3**
- **Choice (EN):** Only dilute the officers' rations.
- **Choice (RU):** Разбавить только офицерскую кухню.
- **Response (EN):** The officers will notice first. They always notice when they suffer, almost like humans.
- **Response (RU):** Офицеры заметят первыми. Они всегда замечают, когда страдают почти как люди.
- **Effects:** People +5, Army -3, Food +5

**Choice 4**
- **Choice (EN):** Will the soldiers notice?
- **Choice (RU):** Солдаты заметят?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Privates - not right away. Officers - after the first spoon. Their tongue is more spoiled than their conscience.
**Prompt (RU):** Рядовые — не сразу. Офицеры — после первой ложки. У них язык избалованнее совести.

**Choice 1**
- **Choice (EN):** Take some of the officers' supplies.
- **Choice (RU):** Забрать часть офицерских припасов.
- **Response (EN):** Finally a dish that I enjoy cooking.
- **Response (RU):** Наконец-то блюдо, которое я готовлю с удовольствием.
- **Effects:** People +5, Army -5, Food +8

**Choice 2**
- **Choice (EN):** Take from everyone equally.
- **Choice (RU):** Забрать у всех поровну.
- **Response (EN):** Fair. This means that everyone will be unhappy.
- **Response (RU):** Справедливо. Значит, недовольны будут все.
- **Effects:** People +8, Army -10, Food +10

---

### Encounter #196

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Weapons still circulate in the lower districts months after the coup. If you collect them, it will become calmer. If not, every basement can become a fortress.
**Prompt (RU):** После переворота у жителей осталось много оружия. Если собрать его, станет спокойнее. Если нет — каждый подвал может стать крепостью.

**Choice 1**
- **Choice (EN):** Collect all weapons.
- **Choice (RU):** Собрать всё оружие.
- **Response (EN):** The city will become quieter. Not necessarily calmer.
- **Response (RU):** Город станет тише. Не обязательно спокойнее.
- **Effects:** People -10, Army +15

**Choice 2**
- **Choice (EN):** Allow weapons only to guilds and guards.
- **Choice (RU):** Разрешить оружие только гильдиям и стражникам.
- **Response (EN):** Compromise. Firm enough not to fall apart right away.
- **Response (RU):** Компромисс. Достаточно твёрдый, чтобы не развалиться сразу.
- **Effects:** Army +8, Treasury +3

**Choice 3**
- **Choice (EN):** Don't touch people.
- **Choice (RU):** Не трогать людей.
- **Response (EN):** They will appreciate the trust. Or they will use it.
- **Response (RU):** Они оценят доверие. Или воспользуются им.
- **Effects:** People +8, Army -10

---

### Encounter #197

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Some old ministers are ready to serve you. They are experienced, but their hands smell of the past throne.
**Prompt (RU):** Некоторые старые министры готовы служить вам. Они опытны, но их руки пахнут прошлым троном.

**Choice 1**
- **Choice (EN):** Bring them back to the council.
- **Choice (RU):** Вернуть их в совет.
- **Response (EN):** The experience will return. Along with old habits.
- **Response (RU):** Опыт вернётся. Вместе со старыми привычками.
- **Effects:** Army -5, Treasury +10

**Choice 2**
- **Choice (EN):** Leave only the most useful ones.
- **Choice (RU):** Оставить только самых полезных.
- **Response (EN):** Fine. Old knives can be used if you hold them by the handle.
- **Response (RU):** Хорошо. Старые ножи можно использовать, если держать их за рукоять.
- **Effects:** Treasury +5

**Choice 3**
- **Choice (EN):** Expel everyone.
- **Choice (RU):** Изгнать всех.
- **Response (EN):** Clean table. Empty table. The difference will be noticeable tomorrow.
- **Response (RU):** Чистый стол. Пустой стол. Разница станет заметна завтра.
- **Effects:** Army +5, Treasury -10

---

### Encounter #198

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** We need new people. The villages are full of tough guys. The fields will wait if the throne falls.
**Prompt (RU):** Нам нужны новые люди. Деревни полны крепких парней. Поля подождут, если трон рухнет.

**Choice 1**
- **Choice (EN):** Take recruits by force.
- **Choice (RU):** Забрать рекрутов силой.
- **Response (EN):** The army will grow quickly. Fields will miss the hands.
- **Response (RU):** Армия вырастет быстро. Поля будут скучать по рукам.
- **Effects:** People -10, Army +25, Food -20

**Choice 2**
- **Choice (EN):** Take volunteers for a fee.
- **Choice (RU):** Взять добровольцев за плату.
- **Response (EN):** Slower, but cleaner. The volunteer looks back less.
- **Response (RU):** Медленнее, но чище. Доброволец меньше смотрит назад.
- **Effects:** Army +10, Treasury -10

**Choice 3**
- **Choice (EN):** Do not touch the villages until the harvest.
- **Choice (RU):** Не трогать деревни до урожая.
- **Response (EN):** Bread defeated the sword. I hope the enemy likes to wait too.
- **Response (RU):** Хлеб победил меч. Надеюсь, враг тоже любит ждать.
- **Effects:** Army -10, Food +15

---

### Encounter #199

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** People will forgive a lot if the king bows his head to the gods. Not in front of people. Before the gods.
**Prompt (RU):** Люди простят многое, если король склонит голову перед богами. Не перед людьми. Перед богами.

**Choice 1**
- **Choice (EN):** Repent for the blood of the coup.
- **Choice (RU):** Покаяться за кровь переворота.
- **Response (EN):** Humility strengthens the soul. Although the soldiers love it less.
- **Response (RU):** Смирение укрепляет душу. Хотя солдаты любят его меньше.
- **Effects:** People +10, Army -10

**Choice 2**
- **Choice (EN):** Say that blood was needed.
- **Choice (RU):** Сказать, что кровь была необходима.
- **Response (EN):** The sword will like your words. The altar will remain silent.
- **Response (RU):** Мечу понравятся ваши слова. Алтарь промолчит.
- **Effects:** People -8, Army +10

**Choice 3**
- **Choice (EN):** Let the temple make a speech on my behalf.
- **Choice (RU):** Пусть храм произнесёт речь от моего имени.
- **Response (EN):** The Church knows how to speak where it is dangerous for the king.
- **Response (RU):** Церковь умеет говорить там, где королю опасно.
- **Effects:** People +5, Treasury -5

---

### Encounter #200

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Doctors demand payment for work in the lower city. If we don't pay, they will leave to treat the rich.
**Prompt (RU):** Лекари требуют оплату за работу в нижнем городе. Если мы не заплатим, они уйдут лечить богатых.

**Choice 1**
- **Choice (EN):** Pay doctors in full.
- **Choice (RU):** Заплатить лекарям полностью.
- **Response (EN):** Costly mercy. But living taxpayers are more useful than dead ones.
- **Response (RU):** Дорогое милосердие. Но живые налогоплательщики полезнее мёртвых.
- **Effects:** People +20, Treasury -15

**Choice 2**
- **Choice (EN):** Pay half.
- **Choice (RU):** Заплатить половину.
- **Response (EN):** Half the pay is half the effort. Sometimes this is enough.
- **Response (RU):** Половина платы — половина усердия. Иногда этого хватает.
- **Effects:** People +8, Treasury -7

**Choice 3**
- **Choice (EN):** Order treatment for free.
- **Choice (RU):** Приказать лечить бесплатно.
- **Response (EN):** Great for the treasury. Dangerous for patients.
- **Response (RU):** Прекрасно для казны. Опасно для больных.
- **Effects:** People -5, Army +5, Treasury +5

---

### Encounter #201

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Unburied bodies are still turning up in the lower streets. If they are not buried quickly, the city will become sick.
**Prompt (RU):** На улицах ещё находят тела после ночи переворота. Если их не похоронить быстро, город заболеет.

**Choice 1**
- **Choice (EN):** Organize a general funeral.
- **Choice (RU):** Организовать общие похороны.
- **Response (EN):** The dead don't care anymore. Alive - no.
- **Response (RU):** Мёртвым уже всё равно. Живым — нет.
- **Effects:** People +20, Treasury -10

**Choice 2**
- **Choice (EN):** Burn the bodies outside the city.
- **Choice (RU):** Сжечь тела за городом.
- **Response (EN):** Fast and safe. But they will remember the smell.
- **Response (RU):** Быстро и безопасно. Но запах запомнят.
- **Effects:** People +15, Army +3, Treasury -5

**Choice 3**
- **Choice (EN):** Let the families pick up the bodies themselves.
- **Choice (RU):** Пусть семьи сами забирают тела.
- **Response (EN):** Families will suffer. The city is an infection.
- **Response (RU):** Семьи получат горе. Город — заразу.
- **Effects:** People -10, Treasury +5

---

### Encounter #202

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** If you distribute a little bread at the gate every day in the name of the king, people will begin to speak more softly. But bread doesn't appear out of thin air.
**Prompt (RU):** Если каждый день раздавать у ворот немного хлеба от имени короля, люди начнут говорить мягче. Но хлеб не появляется из воздуха.

**Choice 1**
- **Choice (EN):** Distribute bread daily.
- **Choice (RU):** Раздавать хлеб ежедневно.
- **Response (EN):** People will wait for you not with stones, but with bowls. This is better.
- **Response (RU):** Люди будут ждать вас не с камнями, а с мисками. Это лучше.
- **Effects:** People +20, Food -20

**Choice 2**
- **Choice (EN):** Distribute only to children and the sick.
- **Choice (RU):** Раздавать только детям и больным.
- **Response (EN):** Less bread, more meaning. Good order.
- **Response (RU):** Меньше хлеба, больше смысла. Хороший приказ.
- **Effects:** People +15, Food -10

**Choice 3**
- **Choice (EN):** Distribute once, for show.
- **Choice (RU):** Раздать один раз, для вида.
- **Response (EN):** Enough for appearance. For hunger - no.
- **Response (RU):** Для вида хватит. Для голода — нет.
- **Effects:** People +5, Food -5

---

### Encounter #203

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** We caught a messenger with a letter to the north. The letter is encrypted. He says he is bringing family news.
**Prompt (RU):** Мы поймали гонца с письмом на север. Письмо зашифровано. Он говорит, что несёт семейные новости.

**Choice 1**
- **Choice (EN):** Torture the messenger.
- **Choice (RU):** Пытать гонца.
- **Response (EN):** He will speak. The only question is whether it will be true.
- **Response (RU):** Он заговорит. Вопрос только в том, будет ли это правда.
- **Effects:** People -5, Army +8

**Choice 2**
- **Choice (EN):** Pay the clerks to do the decoding.
- **Choice (RU):** Заплатить писарям за расшифровку.
- **Response (EN):** Ink is sometimes more honest than blood.
- **Response (RU):** Чернила иногда честнее крови.
- **Effects:** Treasury -5

**Choice 3**
- **Choice (EN):** Let go, but follow up.
- **Choice (RU):** Отпустить, но проследить.
- **Response (EN):** Fine. Sometimes it is better to follow the thread than to break it.
- **Response (RU):** Хорошо. Иногда лучше идти за нитью, чем рвать её.
- **Effects:** Army +3, Treasury -3

**Choice 4**
- **Choice (EN):** What do you think of the letter?
- **Choice (RU):** Что вы думаете о письме?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Family news is not encrypted with military code. If this letter is about an aunt, the aunt commands the fortress.
**Prompt (RU):** Семейные новости не шифруют военным кодом. Если это письмо о тёте, тётя командует крепостью.

**Choice 1**
- **Choice (EN):** Decipher the letter.
- **Choice (RU):** Расшифровать письмо.
- **Response (EN):** Reasonable. A dead messenger will not lead us to the sender.
- **Response (RU):** Разумно. Мёртвый гонец не приведёт нас к отправителю.
- **Effects:** Army +5, Treasury -5

**Choice 2**
- **Choice (EN):** Execute the messenger and burn the letter.
- **Choice (RU):** Казнить гонца и сжечь письмо.
- **Response (EN):** The trail will disappear. Perhaps along with the answer.
- **Response (RU):** След исчезнет. Возможно, вместе с ответом.
- **Effects:** People -8, Army +10

---

### Encounter #204

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** The city says you only rule because the general holds a sword at your back. We need to show who is the king here.
**Prompt (RU):** Город говорит, что вы правите только потому, что генерал держит меч у вашей спины. Надо показать, кто здесь король.

**Choice 1**
- **Choice (EN):** Review the army.
- **Choice (RU):** Провести смотр армии.
- **Response (EN):** The swords shine convincingly. But they cast long shadows.
- **Response (RU):** Мечи блестят убедительно. Но они бросают длинные тени.
- **Effects:** Army +10, Treasury -5

**Choice 2**
- **Choice (EN):** Put a corrupt official on trial.
- **Choice (RU):** Судить коррумпированного чиновника.
- **Response (EN):** Fine. Justice is louder than a parade if you choose the right square.
- **Response (RU):** Хорошо. Справедливость громче парада, если выбрать правильную площадь.
- **Effects:** People +8, Treasury +5

**Choice 3**
- **Choice (EN):** Enter the market without armor.
- **Choice (RU):** Выйти на рынок без доспехов.
- **Response (EN):** Courage or recklessness. Sometimes people can't tell the difference.
- **Response (RU):** Смелость или безрассудство. Иногда народ не отличит одно от другого.
- **Effects:** People +12, Army -5

---

### Encounter #205

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** The banners of the former king still hang in the barracks. The soldiers say it's a memory. I say it's doubt.
**Prompt (RU):** В казармах ещё висят знамёна прежнего короля. Солдаты говорят, что это память. Я говорю — это сомнение.

**Choice 1**
- **Choice (EN):** Burn the old banners.
- **Choice (RU):** Сжечь старые знамёна.
- **Response (EN):** The flame quickly teaches which color is now the main one.
- **Response (RU):** Пламя быстро учит, какой цвет теперь главный.
- **Effects:** People -5, Army +15

**Choice 2**
- **Choice (EN):** Put them in the archive.
- **Choice (RU):** Сложить их в архив.
- **Response (EN):** Soft. But at least they won't look at the soldiers anymore.
- **Response (RU):** Мягко. Но хотя бы они больше не будут смотреть на солдат.
- **Effects:** People +5, Treasury -3

**Choice 3**
- **Choice (EN):** Leave them, but add my coat of arms.
- **Choice (RU):** Оставить, но добавить мой герб.
- **Response (EN):** Compromise. Soldiers like clarity more.
- **Response (RU):** Компромисс. Солдаты любят ясность больше.
- **Effects:** Army +5, Treasury -5

---

### Encounter #206

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, the kingdom cannot be saved by everyone at once. At this stage of your reign you must choose what matters most: bread, sword, treasury, or people's lives.
**Prompt (RU):** Ваше Величество, королевство нельзя спасти всем сразу. В первый месяц нужно выбрать, что важнее: хлеб, меч, казна или жизнь людей.

**Choice 1**
- **Choice (EN):** First feed the city.
- **Choice (RU):** Сначала накормить город.
- **Response (EN):** Bread is a silent ally. As long as it exists, people are still listening.
- **Response (RU):** Хлеб — тихий союзник. Пока он есть, люди ещё слушают.
- **Effects:** People +10, Treasury -15, Food +20

**Choice 2**
- **Choice (EN):** First strengthen the army.
- **Choice (RU):** Сначала укрепить армию.
- **Response (EN):** The sword will protect the throne. But it won't feed the city.
- **Response (RU):** Меч защитит трон. Но не накормит город.
- **Effects:** Army +25, Treasury -15, Food -5

**Choice 3**
- **Choice (EN):** First fill the treasury.
- **Choice (RU):** Сначала наполнить казну.
- **Response (EN):** Gold will give time. The question is who will survive this time.
- **Response (RU):** Золото даст время. Вопрос — кто переживёт это время.
- **Effects:** People -10, Treasury +25, Food -5

**Choice 4**
- **Choice (EN):** Stop the disease first.
- **Choice (RU):** Сначала остановить болезни.
- **Response (EN):** Living subjects can still forgive. The dead only pursue the name.
- **Response (RU):** Живые подданные ещё могут простить. Мёртвые — только преследовать имя.
- **Effects:** People +25, Treasury -15

**Choice 5**
- **Choice (EN):** Can you hold everything at once?
- **Choice (RU):** Можно удержать всё сразу?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** You can try. But balance is not a gentle path. This is a rope over an abyss.
**Prompt (RU):** Можно попытаться. Но равновесие — это не мягкий путь. Это канат над пропастью.

**Choice 1**
- **Choice (EN):** Distribute forces equally.
- **Choice (RU):** Распределить силы поровну.
- **Response (EN):** Careful choice. Not great, not disgraceful. Sometimes these are the ones who survive the winter.
- **Response (RU):** Осторожный выбор. Не великий, не позорный. Иногда именно такие переживают зиму.
- **Effects:** People +7, Army +7, Treasury +7, Food +7

**Choice 2**
- **Choice (EN):** No, first the army.
- **Choice (RU):** Нет, сначала армия.
- **Response (EN):** Then let the soldiers remember that they are protecting the kingdom, not just your door.
- **Response (RU):** Тогда пусть солдаты помнят, что защищают королевство, а не только вашу дверь.
- **Effects:** Army +20, Treasury -10, Food -5

---

### Encounter #207

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** My caravans can bring grain in just three days. But I want the exclusive right to sell bread in the capital.
**Prompt (RU):** Мои караваны могут привезти зерно уже через три дня. Но я хочу исключительное право продавать хлеб в столице.

**Choice 1**
- **Choice (EN):** Grant her a monopoly.
- **Choice (RU):** Дать ей единоличную власть над рынком.
- **Response (EN):** Wise. The people will receive bread, and I will receive gratitude in coins.
- **Response (RU):** Мудро. Народ получит хлеб, а я — благодарность в монетах.
- **Effects:** People -8, Treasury +10, Food +25

**Choice 2**
- **Choice (EN):** Buy grain without a monopoly.
- **Choice (RU):** Купить зерно без единоличной власти над рынком.
- **Response (EN):** You buy food, but not friendship. It's more expensive in the future.
- **Response (RU):** Вы покупаете еду, но не дружбу. Это дороже в будущем.
- **Effects:** Treasury -15, Food +15

**Choice 3**
- **Choice (EN):** The crown will not depend on merchants.
- **Choice (RU):** Корона не будет зависеть от купцов.
- **Response (EN):** Proud crown. Let's see how proud hunger can be.
- **Response (RU):** Гордая корона. Посмотрим, насколько гордым бывает голод.
- **Effects:** Treasury +5, Food -15

**Choice 4**
- **Choice (EN):** Why do you already have so much grain?
- **Choice (RU):** Почему у вас уже есть столько зерна?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because I buy when others are praying. Villages were sold cheaply, Your Majesty. I was simply faster than your officials.
**Prompt (RU):** Потому что я покупаю, когда другие молятся. Деревни продавали дёшево, Ваше Величество. Я просто была быстрее ваших чиновников.

**Choice 1**
- **Choice (EN):** Buy back the grain at your price.
- **Choice (RU):** Выкупить зерно по вашей цене.
- **Response (EN):** It's nice to deal with a crown that understands the market.
- **Response (RU):** Приятно иметь дело с короной, которая понимает рынок.
- **Effects:** Treasury -20, Food +20

**Choice 2**
- **Choice (EN):** Sell it cheaper.
- **Choice (RU):** Продашь дешевле.
- **Response (EN):** Ah, royal trade: first the order, then the price.
- **Response (RU):** Ах, королевская торговля: сначала приказ, потом цена.
- **Effects:** Army +3, Treasury -8, Food +18

---

### Encounter #208

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** The prisons are full of supporters of the former king. If everyone is executed, the square will not have time to be cleaned.
**Prompt (RU):** Тюрьмы полны сторонников прежнего короля. Если казнить всех, площадь не успеют отмыть.

**Choice 1**
- **Choice (EN):** Execute the main ones.
- **Choice (RU):** Казнить главных.
- **Response (EN):** Measured horror. It's easier to bear than slaughter.
- **Response (RU):** Смеренный ужас. Его легче вынести, чем бойню.
- **Effects:** People -5, Army +10

**Choice 2**
- **Choice (EN):** Execute everyone.
- **Choice (RU):** Казнить всех.
- **Response (EN):** Then send more executioners. Or less conscience.
- **Response (RU):** Тогда пришлите больше палачей. Или меньше совести.
- **Effects:** People -20, Army +20

**Choice 3**
- **Choice (EN):** Send them to work.
- **Choice (RU):** Отправить их на работы.
- **Response (EN):** Living traitors are more useful than dead ones if you keep them in chains.
- **Response (RU):** Живые предатели полезнее мёртвых, если держать их под цепью.
- **Effects:** People -5, Army -5, Treasury +10

**Choice 4**
- **Choice (EN):** How many of them are real conspirators?
- **Choice (RU):** Сколько среди них настоящих заговорщиков?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Less than half. But fear does not ask for proof. It works without them.
**Prompt (RU):** Меньше половины. Но страх не спрашивает доказательств. Он работает и без них.

**Choice 1**
- **Choice (EN):** Execute only those proven.
- **Choice (RU):** Казнить только доказанных.
- **Response (EN):** A rare case: justice and order did not fight to the death.
- **Response (RU):** Редкий случай: правосудие и порядок не подрались насмерть.
- **Effects:** People +3, Army +5

**Choice 2**
- **Choice (EN):** Fear is more useful than truth.
- **Choice (RU):** Страх полезнее правды.
- **Response (EN):** Fear will serve you. Until it finds a new owner.
- **Response (RU):** Страх будет служить вам. Пока не найдёт нового хозяина.
- **Effects:** People -15, Army +15

---

### Encounter #209

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Children are sleeping at the monastery gates. They ask not for gold, but for stew. May I open the royal reserves?
**Prompt (RU):** У ворот монастыря спят дети. Они просят не золота, а похлёбки. Разрешите открыть королевские запасы?

**Choice 1**
- **Choice (EN):** Distribute the stew to the children.
- **Choice (RU):** Раздать похлёбку детям.
- **Response (EN):** Today they will fall asleep not from weakness, but from warmth. Thank you.
- **Response (RU):** Сегодня они уснут не от слабости, а от тепла. Благодарю вас.
- **Effects:** People +15, Food -10

**Choice 2**
- **Choice (EN):** Give to all the poor.
- **Choice (RU):** Раздать всем бедным.
- **Response (EN):** This is a favor that the city will remember with its stomach.
- **Response (RU):** Это милость, которую город запомнит желудком.
- **Effects:** People +25, Food -25

**Choice 3**
- **Choice (EN):** Let the monastery feed them itself.
- **Choice (RU):** Пусть монастырь кормит их сам.
- **Response (EN):** We'll try. But an empty bowl does not become full from prayer.
- **Response (RU):** Мы попробуем. Но пустая миска не становится полной от молитвы.
- **Effects:** People -8, Food +5

**Choice 4**
- **Choice (EN):** Why did they come to the monastery and not to the palace?
- **Choice (RU):** Почему они пришли к монастырю, а не к дворцу?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because the palace gates are guarded by spears, and the monastery gates are guarded only by old hinges. Hungry people go where they are not beaten.
**Prompt (RU):** Потому что дворцовые ворота охраняют копья, а монастырские — только старые петли. Голодные идут туда, где их не бьют.

**Choice 1**
- **Choice (EN):** Open the royal kitchen near the palace.
- **Choice (RU):** Открыть королевскую кухню у дворца.
- **Response (EN):** Then people will see not the walls of the palace, but the hand of the king.
- **Response (RU):** Тогда люди увидят не стены дворца, а руку короля.
- **Effects:** People +20, Treasury -5, Food -20

**Choice 2**
- **Choice (EN):** Donate the grain to the monastery.
- **Choice (RU):** Передать зерно монастырю.
- **Response (EN):** We will feed them without question. This is sometimes the best justice.
- **Response (RU):** Мы накормим их без вопросов. Это иногда лучшее правосудие.
- **Effects:** People +18, Food -15

---

### Encounter #210

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** I can prepare medicine for the lower city. It is bitter and smells like a swamp, but many will survive.
**Prompt (RU):** Я могу приготовить лекарство для нижнего города. Оно горькое, пахнет болотом, но многие выживут.

**Choice 1**
- **Choice (EN):** Buy medicine for all patients.
- **Choice (RU):** Купить лекарство для всех больных.
- **Response (EN):** Generous order. The swamp will be enough, and the sick - even more so.
- **Response (RU):** Щедрый приказ. Болото будет довольно, а больные — тем более.
- **Effects:** People +25, Treasury -20

**Choice 2**
- **Choice (EN):** Buy for children only.
- **Choice (RU):** Купить только для детей.
- **Response (EN):** The children will survive. Their parents might be grateful enough not to curse you out loud.
- **Response (RU):** Дети выживут. Их родители, возможно, будут достаточно благодарны, чтобы не проклинать вас вслух.
- **Effects:** People +12, Treasury -8

**Choice 3**
- **Choice (EN):** Let the patients pay themselves.
- **Choice (RU):** Пусть больные платят сами.
- **Response (EN):** As you wish. The disease rarely asks if a person has coins.
- **Response (RU):** Как пожелаете. Болезнь редко спрашивает, есть ли у человека монеты.
- **Effects:** People -15, Treasury +5

**Choice 4**
- **Choice (EN):** Why is it so expensive?
- **Choice (RU):** Почему оно такое дорогое?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because the swamp lily blooms three nights a year. And also because I’m not going to die poor saving your poor.
**Prompt (RU):** Потому что болотная лилия цветёт три ночи в году. А ещё потому что я не собираюсь умирать бедной, спасая ваших бедняков.

**Choice 1**
- **Choice (EN):** Pay your price.
- **Choice (RU):** Заплатить вашу цену.
- **Response (EN):** Wise. Sometimes life is cheaper to buy than to mourn later.
- **Response (RU):** Мудро. Иногда жизнь дешевле купить, чем потом оплакивать.
- **Effects:** People +25, Treasury -20

**Choice 2**
- **Choice (EN):** Reduce the price or I'll take the recipe by force.
- **Choice (RU):** Снизь цену, или я заберу рецепт силой.
- **Response (EN):** Ah, royal medicine. First the threat, then the treatment.
- **Response (RU):** Ах, королевская медицина. Сначала угроза, потом лечение.
- **Effects:** People +20, Army +3, Treasury -8

---

### Encounter #211

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** The army holds the throne, but the throne feeds the army poorly. Introduce a military levy.
**Prompt (RU):** Армия держит трон, но трон кормит армию плохо. Введите военный сбор.

**Choice 1**
- **Choice (EN):** Introduce a fee for everyone.
- **Choice (RU):** Ввести сбор со всех.
- **Response (EN):** The soldiers will be well fed. The rest are careful.
- **Response (RU):** Солдаты будут сыты. Остальные — осторожны.
- **Effects:** People -15, Army +15, Treasury +25

**Choice 2**
- **Choice (EN):** Introduce a tax only from the rich.
- **Choice (RU):** Ввести сбор только с богатых.
- **Response (EN):** Less gold, less anger. Acceptable.
- **Response (RU):** Меньше золота, меньше злости. Приемлемо.
- **Effects:** Army +8, Treasury +15

**Choice 3**
- **Choice (EN):** Refuse the army's demand.
- **Choice (RU):** Отказать армии.
- **Response (EN):** The army knows how to wait. But it is bad at forgiving.
- **Response (RU):** Армия умеет ждать. Но плохо умеет прощать.
- **Effects:** Army -15, Treasury +5

**Choice 4**
- **Choice (EN):** How long will the army last without gathering?
- **Choice (RU):** Сколько армия продержится без сбора?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Three weeks - with discipline. Five - with thefts. Seven - with rebellion. I'd rather not check the eighth.
**Prompt (RU):** Три недели — с дисциплиной. Пять — с кражами. Семь — с мятежом. Я предпочёл бы не проверять восьмую.

**Choice 1**
- **Choice (EN):** Introduce a temporary fee for a month.
- **Choice (RU):** Ввести временный сбор на месяц.
- **Response (EN):** Temporary orders often outlast kings. But now it is needed.
- **Response (RU):** Временный приказ часто живёт дольше королей. Но сейчас он нужен.
- **Effects:** People -8, Army +10, Treasury +15

**Choice 2**
- **Choice (EN):** Give the army grain instead of gold.
- **Choice (RU):** Выдать армии зерно вместо золота.
- **Response (EN):** Soldiers can be calmed down with bread. But not for long.
- **Response (RU):** Солдат можно успокоить хлебом. Но ненадолго.
- **Effects:** Army +10, Food -15

---

### Encounter #212

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** If you bring the holy relics to the capital, people will forget their fear. But the road and security will be expensive.
**Prompt (RU):** Если привезти святые мощи в столицу, люди забудут страх. Но дорога и охрана обойдутся дорого.

**Choice 1**
- **Choice (EN):** Organize a procession.
- **Choice (RU):** Организовать процессию.
- **Response (EN):** The city will see that the heavens are still looking in its direction.
- **Response (RU):** Город увидит, что небеса ещё смотрят в его сторону.
- **Effects:** People +15, Treasury -15

**Choice 2**
- **Choice (EN):** Bring the relics without a holiday.
- **Choice (RU):** Привезти мощи без праздника.
- **Response (EN):** The quiet shrine is less comforting, but also comforting.
- **Response (RU):** Тихая святыня утешает меньше, но тоже утешает.
- **Effects:** People +5, Treasury -5

**Choice 3**
- **Choice (EN):** Don't waste money on relics.
- **Choice (RU):** Не тратить деньги на реликвии.
- **Response (EN):** Not all bones are dead to the people, Your Majesty.
- **Response (RU):** Не все реликвии мёртвы для народа, Ваше Величество.
- **Effects:** People -5, Treasury +8

**Choice 4**
- **Choice (EN):** Do people really believe in these powers?
- **Choice (RU):** Люди действительно верят в эти мощи?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** People don't believe in relics. They believe that someone above them has not yet turned their back.
**Prompt (RU):** Люди верят не в реликвии. Они верят, что кто-то над ними ещё не отвернулся.

**Choice 1**
- **Choice (EN):** May the relics arrive with honor.
- **Choice (RU):** Пусть мощи прибудут с почестями.
- **Response (EN):** Hope will enter the city before the relic.
- **Response (RU):** Надежда войдёт в город раньше реликвии.
- **Effects:** People +15, Treasury -15

**Choice 2**
- **Choice (EN):** The church will pay half.
- **Choice (RU):** Церковь оплатит половину.
- **Response (EN):** The altar will split the price. And it will remember that the throne knows how to bargain.
- **Response (RU):** Алтарь разделит цену. И запомнит, что трон умеет торговаться.
- **Effects:** People +10, Treasury -7

---

### Encounter #213

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** There are merchants ready to buy official positions. They will steal, of course. But first they will pay us.
**Prompt (RU):** Есть купцы, готовые купить чиновничьи места. Они будут воровать, конечно. Но сначала заплатят нам.

**Choice 1**
- **Choice (EN):** Sell positions.
- **Choice (RU):** Продать должности.
- **Response (EN):** The treasury will come to life. Let your conscience breathe later.
- **Response (RU):** Казна оживёт. Совесть пусть подышит позже.
- **Effects:** People -15, Treasury +30

**Choice 2**
- **Choice (EN):** Sell only small positions.
- **Choice (RU):** Продать только мелкие должности.
- **Response (EN):** Petty theft is almost a tradition.
- **Response (RU):** Мелкое воровство — почти традиция.
- **Effects:** People -5, Treasury +12

**Choice 3**
- **Choice (EN):** Prohibit the sale of positions.
- **Choice (RU):** Запретить продажу должностей.
- **Response (EN):** Commendable. Unprofitable, but commendable.
- **Response (RU):** Похвально. Убыточно, но похвально.
- **Effects:** People +5, Treasury -5

**Choice 4**
- **Choice (EN):** How much will they steal?
- **Choice (RU):** Насколько сильно они будут воровать?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** As much as they are allowed to. That is, a lot if we look the other way. And moderately, if we take a share.
**Prompt (RU):** Настолько, насколько им позволят. То есть много, если мы будем смотреть в другую сторону. И умеренно, если будем брать долю.

**Choice 1**
- **Choice (EN):** Sell and take a share.
- **Choice (RU):** Продать и брать долю.
- **Response (EN):** Dirty income is still income.
- **Response (RU):** Грязный доход всё ещё доход.
- **Effects:** People -20, Treasury +35

**Choice 2**
- **Choice (EN):** Sell, but appoint inspectors.
- **Choice (RU):** Продать, но назначить проверяющих.
- **Response (EN):** Thieves steal more slowly under supervision. Usually.
- **Response (RU):** Воры под присмотром воруют медленнее. Обычно.
- **Effects:** People -5, Treasury +15

---

### Encounter #214

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** After the public punishment there was a stampede in the square. There are more wounded than criminals. This is not justice, this is carnage.
**Prompt (RU):** После публичных наказаний на площади давка. Раненых больше, чем преступников. Это не правосудие, это бойня.

**Choice 1**
- **Choice (EN):** Ban public executions.
- **Choice (RU):** Запретить публичные казни.
- **Response (EN):** Today the square will become less bloody. This is already a victory.
- **Response (RU):** Сегодня площадь станет менее кровавой. Это уже победа.
- **Effects:** People +15, Army -8

**Choice 2**
- **Choice (EN):** Leave only closed executions.
- **Choice (RU):** Оставить только закрытые казни.
- **Response (EN):** Death behind a wall is still death. But at least without the crush.
- **Response (RU):** Смерть за стеной всё ещё смерть. Но хотя бы без давки.
- **Effects:** People +8, Army -3

**Choice 3**
- **Choice (EN):** The square must see the strength.
- **Choice (RU):** Площадь должна видеть силу.
- **Response (EN):** Then the square will also see broken ribs.
- **Response (RU):** Тогда площадь увидит ещё и сломанные рёбра.
- **Effects:** People -15, Army +10

**Choice 4**
- **Choice (EN):** Is it the crowd's fault?
- **Choice (RU):** Толпа сама виновата?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** The crowd's only fault is that it is afraid. And fear pushes, falls, breaks ribs and crushes children.
**Prompt (RU):** Толпа виновата только в том, что боится. А страх толкается, падает, ломает рёбра и давит детей.

**Choice 1**
- **Choice (EN):** Place healers in the square.
- **Choice (RU):** Ставить лекарей на площади.
- **Response (EN):** If you are showing death, let there be at least someone nearby for life.
- **Response (RU):** Если уж вы показываете смерть, пусть рядом будет хоть кто-то за жизнь.
- **Effects:** People +8, Army +3, Treasury -5

**Choice 2**
- **Choice (EN):** Move executions outside the city.
- **Choice (RU):** Перенести казни за город.
- **Response (EN):** The executioner will move on. People will breathe closer.
- **Response (RU):** Палач уйдёт дальше. Люди вздохнут ближе.
- **Effects:** People +10, Army -5

---

### Encounter #215

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Rats eat better than some soldiers. If you don't clean out the barn, in a week they will be fatter than the treasurer.
**Prompt (RU):** Крысы жрут лучше некоторых солдат. Если не очистить амбар, через неделю они станут жирнее казначея.

**Choice 1**
- **Choice (EN):** Hire rat catchers.
- **Choice (RU):** Нанять крысоловов.
- **Response (EN):** Finally a war where I root for the killers.
- **Response (RU):** Наконец-то война, где я болею за убийц.
- **Effects:** People +5, Treasury -8, Food +15

**Choice 2**
- **Choice (EN):** Let the cats into the barn.
- **Choice (RU):** Пустить кошек в амбар.
- **Response (EN):** The cats will be happy. Rats are surprised.
- **Response (RU):** Кошки будут довольны. Крысы — удивлены.
- **Effects:** Food +8

**Choice 3**
- **Choice (EN):** Use poison.
- **Choice (RU):** Использовать отраву.
- **Response (EN):** The food will be saved—if people don't then save themselves from the food.
- **Response (RU):** Еда спасётся. Если люди потом не спасутся от еды.
- **Effects:** People -8, Food +15

**Choice 4**
- **Choice (EN):** How bad is it?
- **Choice (RU):** Насколько всё плохо?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** One rat stole a piece of cheese yesterday and looked at me as if I owed her taxes.
**Prompt (RU):** Одна крыса вчера утащила кусок сыра и посмотрела на меня так, будто я ей должен налоги.

**Choice 1**
- **Choice (EN):** Hire the best rat catchers.
- **Choice (RU):** Нанять лучших крысоловов.
- **Response (EN):** Fine. Let at least someone in this palace honestly catch thieves.
- **Response (RU):** Хорошо. Пусть хоть кто-то в этом дворце честно ловит воров.
- **Effects:** People +8, Treasury -12, Food +20

**Choice 2**
- **Choice (EN):** Give poison, but close the barn.
- **Choice (RU):** Дать отраву, но закрыть амбар.
- **Response (EN):** There is a risk. But the rats will not leave on their own out of politeness.
- **Response (RU):** Риск есть. Но крысы не уйдут сами из вежливости.
- **Effects:** People -3, Treasury -3, Food +15

---

### Encounter #216

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** The soldiers say that you listen to merchants more often than to generals. This is a dangerous whisper.
**Prompt (RU):** Солдаты говорят, что вы слушаете купцов чаще, чем генералов. Это опасный шёпот.

**Choice 1**
- **Choice (EN):** Arrange an army review.
- **Choice (RU):** Устроить смотр армии.
- **Response (EN):** The parade will drown out the whispers. For a while.
- **Response (RU):** Парад заглушит шёпот. На время.
- **Effects:** Army +15, Treasury -8

**Choice 2**
- **Choice (EN):** Distribute bread and beer to the soldiers.
- **Choice (RU):** Раздать солдатам хлеб и пиво.
- **Response (EN):** A well-fed soldier argues more softly.
- **Response (RU):** Сытый солдат спорит мягче.
- **Effects:** Army +10, Treasury -5, Food -10

**Choice 3**
- **Choice (EN):** Arrest the instigators.
- **Choice (RU):** Арестовать зачинщиков.
- **Response (EN):** Some whispers end in the basement.
- **Response (RU):** Некоторые шёпоты заканчиваются в подвале.
- **Effects:** People -5, Army +5

**Choice 4**
- **Choice (EN):** Who started this whispering?
- **Choice (RU):** Кто начал этот шёпот?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Not just one person. Several fires, several mugs, one phrase: ‘merchants eat, soldiers wait’.
**Prompt (RU):** Не один человек. Несколько костров, несколько кружек, одна фраза: ‘купцы едят, солдаты ждут’.

**Choice 1**
- **Choice (EN):** Feed the barracks today.
- **Choice (RU):** Накормить казармы сегодня.
- **Response (EN):** Bread will shut their mouths better than an order.
- **Response (RU):** Хлеб закроет им рты лучше приказа.
- **Effects:** Army +12, Food -12

**Choice 2**
- **Choice (EN):** Find the talkers and punish them.
- **Choice (RU):** Найти говорунов и наказать.
- **Response (EN):** They will shut up. The rest will think more quietly.
- **Response (RU):** Они замолчат. Остальные будут думать тише.
- **Effects:** People -5, Army +8

---

### Encounter #217

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Creditors demand payment of the former king's debts. Formally, these are not your debts. But the throne is the same.
**Prompt (RU):** Кредиторы требуют выплаты долгов прежнего короля. Формально это не ваши долги. Но трон тот же.

**Choice 1**
- **Choice (EN):** Pay off some of your debts.
- **Choice (RU):** Заплатить часть долгов.
- **Response (EN):** You buy trust at a high price. But trust is rarely sold cheap.
- **Response (RU):** Вы покупаете доверие дорого. Но доверие редко продают дёшево.
- **Effects:** People +5, Treasury -20

**Choice 2**
- **Choice (EN):** Refuse to pay.
- **Choice (RU):** Отказаться платить.
- **Response (EN):** The treasury will smile. Merchants - no.
- **Response (RU):** Казна улыбнётся. Торговцы — нет.
- **Effects:** Treasury +10, Food -5

**Choice 3**
- **Choice (EN):** Pay in grain.
- **Choice (RU):** Заплатить зерном.
- **Response (EN):** The debt will go away. Stocks too.
- **Response (RU):** Долг уйдёт. Запасы тоже.
- **Effects:** Treasury -5, Food -15

**Choice 4**
- **Choice (EN):** Are these papers real?
- **Choice (RU):** Эти бумаги настоящие?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Some are real. Some are written in ink too fresh for an old debt. Dead people, as a rule, do not borrow money yesterday.
**Prompt (RU):** Часть — настоящие. Часть — написаны слишком свежими чернилами для старого долга. Покойники, как правило, не занимают деньги вчера.

**Choice 1**
- **Choice (EN):** Pay only proven debts.
- **Choice (RU):** Оплатить только доказанные долги.
- **Response (EN):** The fair way. Not the fastest, but strong.
- **Response (RU):** Справедливый путь. Не самый быстрый, но крепкий.
- **Effects:** People +5, Treasury -10

**Choice 2**
- **Choice (EN):** Declare fake coins treason.
- **Choice (RU):** Объявить фальшивые монеты изменой.
- **Response (EN):** Lenders will become more careful. And angrier.
- **Response (RU):** Кредиторы станут осторожнее. И злее.
- **Effects:** Army +5, Treasury +8

---

### Encounter #218

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** The boy's father raised his sword against you. The boy himself is too small for the sword, but old enough to remember.
**Prompt (RU):** Отец мальчика поднял меч против вас. Сам мальчик слишком мал для меча, но достаточно взрослый, чтобы помнить.

**Choice 1**
- **Choice (EN):** Send the boy to a monastery.
- **Choice (RU):** Отправить мальчика в монастырь.
- **Response (EN):** Monastery walls are better than prison walls. For children - definitely.
- **Response (RU):** Монастырские стены лучше тюремных. Для детей — точно.
- **Effects:** People +5, Treasury -5

**Choice 2**
- **Choice (EN):** Send him to the army as a servant.
- **Choice (RU):** Отправить его в армию слугой.
- **Response (EN):** He will grow up next to the swords. It's either medicine or poison.
- **Response (RU):** Он вырастет рядом с мечами. Это либо лекарство, либо яд.
- **Effects:** People -3, Army +3

**Choice 3**
- **Choice (EN):** Execute as a warning.
- **Choice (RU):** Казнить как предупреждение.
- **Response (EN):** The square will understand. Whether they will forgive is another question.
- **Response (RU):** Площадь поймёт. Простит ли — другой вопрос.
- **Effects:** People -20, Army +10

**Choice 4**
- **Choice (EN):** Is he dangerous?
- **Choice (RU):** Он опасен?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Today - no. Tomorrow - who knows. Children have a good memory, especially if the king left him an orphan.
**Prompt (RU):** Сегодня — нет. Завтра — кто знает. У детей хорошая память, особенно если король оставил его сиротой.

**Choice 1**
- **Choice (EN):** Let him live under supervision.
- **Choice (RU):** Пусть живёт под надзором.
- **Response (EN):** Soft collar. Sometimes it holds better than iron.
- **Response (RU):** Мягкий ошейник. Иногда он держит лучше железного.
- **Effects:** People +5, Treasury -5

**Choice 2**
- **Choice (EN):** Give him to the monastery.
- **Choice (RU):** Отдать его монастырю.
- **Response (EN):** Prayer can dull vengeance. Sometimes.
- **Response (RU):** Молитва может притупить месть. Иногда.
- **Effects:** People +8, Treasury -5

---

### Encounter #219

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** The bells ring every hour. People count the dead and lose their will. Maybe we should ban ringing?
**Prompt (RU):** Колокола звонят каждый час. Люди считают мёртвых и теряют волю. Может, стоит запретить звон?

**Choice 1**
- **Choice (EN):** Ban the death knell.
- **Choice (RU):** Запретить похоронный звон.
- **Response (EN):** The city will become quieter. I hope it's not more insensitive.
- **Response (RU):** Город станет тише. Надеюсь, не бесчувственнее.
- **Effects:** People +5, Army +3

**Choice 2**
- **Choice (EN):** Allow ringing only in the morning.
- **Choice (RU):** Разрешить звон только утром.
- **Response (EN):** One ringing for memory. The rest of the day is for the living.
- **Response (RU):** Один звон для памяти. Остальной день — для живых.
- **Effects:** People +8

**Choice 3**
- **Choice (EN):** Let them call.
- **Choice (RU):** Пусть звонят.
- **Response (EN):** The dead deserve to be remembered. The living deserve a break.
- **Response (RU):** Мёртвые заслужили память. Живые заслужили передышку.
- **Effects:** People -3

**Choice 4**
- **Choice (EN):** Will silence comfort the living?
- **Choice (RU):** Разве молчание утешит живых?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** No. But the constant ringing turns the city into a grave, where the living already consider themselves next.
**Prompt (RU):** Нет. Но постоянный звон превращает город в могилу, где живые уже считают себя следующими.

**Choice 1**
- **Choice (EN):** Call only at dawn.
- **Choice (RU):** Звонить только на рассвете.
- **Response (EN):** Let the day begin with memory and not end with fear.
- **Response (RU):** Пусть день начинается с памяти, а не заканчивается страхом.
- **Effects:** People +8

**Choice 2**
- **Choice (EN):** Replace the ringing with common prayer.
- **Choice (RU):** Заменить звон общей молитвой.
- **Response (EN):** Prayer brings people together more gently than a bell.
- **Response (RU):** Молитва собирает людей мягче, чем колокол.
- **Effects:** People +5, Treasury -3

---

### Encounter #220

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** We have doctors who know cold diseases. They can help your city. For a reasonable price.
**Prompt (RU):** У нас есть лекари, знающие холодные болезни. Они могут помочь вашему городу. За разумную цену.

**Choice 1**
- **Choice (EN):** Hire doctors.
- **Choice (RU):** Нанять лекарей.
- **Response (EN):** Northern hands are cold but helpful.
- **Response (RU):** Северные руки холодные, но полезные.
- **Effects:** People +20, Treasury -15

**Choice 2**
- **Choice (EN):** Exchange services for reduced duties.
- **Choice (RU):** Обменять услуги на снижение пошлин.
- **Response (EN):** Mutual benefit. The most honest form of friendship.
- **Response (RU):** Взаимная выгода. Самая честная форма дружбы.
- **Effects:** People +15, Treasury -5, Food +3

**Choice 3**
- **Choice (EN):** Refuse strangers.
- **Choice (RU):** Отказать чужеземцам.
- **Response (EN):** Your city is sick, but your pride is healthy.
- **Response (RU):** Ваш город болеет, но ваша гордость здорова.
- **Effects:** People -8, Treasury +5

**Choice 4**
- **Choice (EN):** Why do you offer help so readily?
- **Choice (RU):** Почему вы предлагаете помощь так охотно?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because a sick neighbor is a bad trader and a good source of infection. The North knows how to calculate benefits.
**Prompt (RU):** Потому что больной сосед — плохой торговец и хороший источник заразы. Север умеет считать выгоду.

**Choice 1**
- **Choice (EN):** Hire all healers.
- **Choice (RU):** Нанять всех лекарей.
- **Response (EN):** They will arrive before sunset. It’s better not to give the disease a head start.
- **Response (RU):** Они прибудут до заката. Болезни лучше не давать фору.
- **Effects:** People +20, Treasury -15

**Choice 2**
- **Choice (EN):** Hire two people to check.
- **Choice (RU):** Нанять двоих для проверки.
- **Response (EN):** Carefully. The North respects the cautious almost as much as the strong.
- **Response (RU):** Осторожно. Север уважает осторожных почти так же, как сильных.
- **Effects:** People +10, Treasury -6

---

### Encounter #221

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** I have powder for restful sleep. It can be given to patients. Or soldiers who argue too loudly.
**Prompt (RU):** У меня есть порошок для спокойного сна. Его можно дать больным. Или солдатам, которые слишком громко спорят.

**Choice 1**
- **Choice (EN):** Give to the sick.
- **Choice (RU):** Дать больным.
- **Response (EN):** Sleep is a cheap healer. My powder just charges for entry.
- **Response (RU):** Сон — дешёвый лекарь. Мой порошок просто берёт за вход.
- **Effects:** People +10, Treasury -8

**Choice 2**
- **Choice (EN):** Give to restless soldiers.
- **Choice (RU):** Дать беспокойным солдатам.
- **Response (EN):** A quiet barracks is a rare miracle. Don't ask how natural.
- **Response (RU):** Тихая казарма — редкое чудо. Не спрашивайте, насколько естественное.
- **Effects:** People +3, Army -5

**Choice 3**
- **Choice (EN):** Buy stock for the palace.
- **Choice (RU):** Купить запас для дворца.
- **Response (EN):** Palaces sleep worse than slums. There are more pillows and more fears.
- **Response (RU):** Дворцы спят хуже трущоб. Там больше подушек и больше страхов.
- **Effects:** Treasury -10

**Choice 4**
- **Choice (EN):** How safe is it?
- **Choice (RU):** Насколько он безопасен?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** In a small dose, a person sleeps. In the big one, he also sleeps, just longer than his relatives would like.
**Prompt (RU):** В малой дозе человек спит. В большой — тоже спит, просто дольше, чем его родственникам хотелось бы.

**Choice 1**
- **Choice (EN):** Buy a small batch for the sick.
- **Choice (RU):** Купить малую партию для больных.
- **Response (EN):** Carefully. Almost boring. But the patients will like it.
- **Response (RU):** Осторожно. Почти скучно. Но больным понравится.
- **Effects:** People +8, Treasury -5

**Choice 2**
- **Choice (EN):** Buy a lot. Entrust the dosage to me.
- **Choice (RU):** Купить много. Дозировку доверить мне.
- **Response (EN):** Finally a king who respects dangerous talent.
- **Response (RU):** Наконец-то король, который уважает опасные таланты.
- **Effects:** People +12, Treasury -12

---

### Encounter #222

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** In the markets they fight for bread. Give me soldiers, and in an hour there will be order there.
**Prompt (RU):** На рынках дерутся за хлеб. Дайте мне солдат, и через час там будет порядок.

**Choice 1**
- **Choice (EN):** Send armed soldiers.
- **Choice (RU):** Отправить вооружённых солдат.
- **Response (EN):** Order will come quickly. With shouts, but quickly.
- **Response (RU):** Порядок придёт быстро. С криками, но быстро.
- **Effects:** People -10, Army +5, Food +5

**Choice 2**
- **Choice (EN):** Send soldiers without weapons.
- **Choice (RU):** Отправить солдат без оружия.
- **Response (EN):** Soldiers without weapons is almost a request. But let's try.
- **Response (RU):** Солдаты без оружия — это почти просьба. Но попробуем.
- **Effects:** People +5, Army -3

**Choice 3**
- **Choice (EN):** Entrust markets to elders.
- **Choice (RU):** Поручить рынки старостам.
- **Response (EN):** Elders are good for arguing about price. Not for a fight.
- **Response (RU):** Старосты хороши для споров о цене. Не для драки.
- **Effects:** People +5, Food -5

**Choice 4**
- **Choice (EN):** Do you call it order or fear?
- **Choice (RU):** Вы называете это порядком или страхом?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** At the market, a hungry person does not distinguish between these words. He sees a spear and remembers that it has legs.
**Prompt (RU):** На рынке голодный человек не различает эти слова. Он видит копьё и вспоминает, что у него есть ноги.

**Choice 1**
- **Choice (EN):** Let the soldiers restore order.
- **Choice (RU):** Пусть солдаты наведут порядок.
- **Response (EN):** There will be order. Even with bruises.
- **Response (RU):** Будет порядок. Пусть даже с синяками.
- **Effects:** People -10, Army +8, Food +5

**Choice 2**
- **Choice (EN):** The soldiers guard the bread, but do not touch the people.
- **Choice (RU):** Солдаты охраняют хлеб, но не трогают людей.
- **Response (EN):** A fine line. I'll make sure it's not stepped over too often.
- **Response (RU):** Тонкая грань. Я прослежу, чтобы её не перешагнули слишком часто.
- **Effects:** People +5, Army +3

---

### Encounter #223

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** One healer says that diseases are born in dirty water, not in sins. People listen to him too closely.
**Prompt (RU):** Один лекарь говорит, что болезни рождаются в грязной воде, а не в грехах. Народ слушает его слишком внимательно.

**Choice 1**
- **Choice (EN):** Protect the healer.
- **Choice (RU):** Защитить лекаря.
- **Response (EN):** You are choosing water over preaching. The temple will notice this.
- **Response (RU):** Вы выбираете воду против проповеди. Храм это заметит.
- **Effects:** People +15, Treasury -3

**Choice 2**
- **Choice (EN):** Make the healer apologize.
- **Choice (RU):** Заставить лекаря извиниться.
- **Response (EN):** Humility is beneficial even to those who wash their hands more often than their souls.
- **Response (RU):** Смирение полезно даже тем, кто моет руки чаще души.
- **Effects:** People -3, Treasury +3

**Choice 3**
- **Choice (EN):** Give the doctor to the church court.
- **Choice (RU):** Отдать лекаря церковному суду.
- **Response (EN):** The altar will sort itself out. Quick or edifying.
- **Response (RU):** Алтарь разберётся. Быстро или назидательно.
- **Effects:** People -15, Army +5

**Choice 4**
- **Choice (EN):** Does clean water contradict faith?
- **Choice (RU):** Чистая вода противоречит вере?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** No. But when people believe only in water, they cease to be afraid of sin. And without fear the temple is empty.
**Prompt (RU):** Нет. Но когда люди верят только воде, они перестают бояться греха. А без страха храм пустеет.

**Choice 1**
- **Choice (EN):** The healer speaks about water, the temple speaks about the soul.
- **Choice (RU):** Лекарь говорит о воде, храм — о душе.
- **Response (EN):** The division is wise. If both sides remember their place.
- **Response (RU):** Разделение мудрое. Если обе стороны помнят своё место.
- **Effects:** People +10, Treasury -3

**Choice 2**
- **Choice (EN):** The healer must speak more carefully.
- **Choice (RU):** Лекарь должен говорить осторожнее.
- **Response (EN):** Careful words rarely burn bridges.
- **Response (RU):** Осторожные слова редко жгут мосты.
- **Effects:** People +3

---

### Encounter #224

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** There is a lot of silver in the temples. If you borrow part of it, the treasury will come to life.
**Prompt (RU):** В храмах много серебра. Если взять часть ‘в долг’, казна оживёт.

**Choice 1**
- **Choice (EN):** Take the temple silver.
- **Choice (RU):** Взять храмовое серебро.
- **Response (EN):** The treasury will come to life. The temples will start screaming, but not right away.
- **Response (RU):** Казна оживёт. Храмы начнут кричать, но не сразу.
- **Effects:** People -10, Treasury +25

**Choice 2**
- **Choice (EN):** Ask for a donation.
- **Choice (RU):** Попросить пожертвование.
- **Response (EN):** Asking brings less, but less often leads to stones.
- **Response (RU):** Просьба приносит меньше, зато реже приводит к камням.
- **Effects:** Treasury +10

**Choice 3**
- **Choice (EN):** Don't touch the temples.
- **Choice (RU):** Не трогать храмы.
- **Response (EN):** Sanctity preserved. Emptiness too.
- **Response (RU):** Святость сохранена. Пустота тоже.
- **Effects:** People +5, Treasury -5

**Choice 4**
- **Choice (EN):** Will this cause a riot?
- **Choice (RU):** Это вызовет бунт?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Not right away. First there will be sermons. Then the crying old women. Then stones hit the tax collectors. But we will already have the silver.
**Prompt (RU):** Не сразу. Сначала будут проповеди. Потом плачущие старухи. Потом камни в сборщиков налогов. Но серебро будет уже у нас.

**Choice 1**
- **Choice (EN):** Take it quickly and secretly.
- **Choice (RU):** Взять быстро и тайно.
- **Response (EN):** Secret is cheaper than war. As long as it remains a mystery.
- **Response (RU):** Тайна дешевле войны. До тех пор, пока остаётся тайной.
- **Effects:** People -8, Treasury +20

**Choice 2**
- **Choice (EN):** Take only from rich monasteries.
- **Choice (RU):** Взять только у богатых монастырей.
- **Response (EN):** Moderate insult to the sacred. Almost financial reform.
- **Response (RU):** Умеренное оскорбление святого. Почти финансовая реформа.
- **Effects:** People -5, Treasury +15

---

### Encounter #225

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Women give birth in dirt and cold. Give me an old warehouse, I will turn it into a home for women in labor.
**Prompt (RU):** Женщины рожают в грязи и холоде. Дайте мне старый склад, я сделаю из него дом для рожениц.

**Choice 1**
- **Choice (EN):** Provide a warehouse and funding.
- **Choice (RU):** Выделить склад и средства.
- **Response (EN):** You save those who have not yet even had time to be afraid of your rule.
- **Response (RU):** Вы спасаете тех, кто ещё даже не успел испугаться вашего правления.
- **Effects:** People +25, Treasury -15, Food -5

**Choice 2**
- **Choice (EN):** Give a warehouse without money.
- **Choice (RU):** Выделить склад без финансирования.
- **Response (EN):** Walls are better than streets. But walls without healers do not save everyone.
- **Response (RU):** Стены лучше улицы. Но стены без лекарей спасают не всех.
- **Effects:** People +10, Food -3

**Choice 3**
- **Choice (EN):** A warehouse is needed for grain.
- **Choice (RU):** Склад нужен для зерна.
- **Response (EN):** Bread is important. But dead babies don't eat it.
- **Response (RU):** Хлеб важен. Но мёртвые младенцы его не едят.
- **Effects:** People -10, Food +10

**Choice 4**
- **Choice (EN):** How many lives will this save?
- **Choice (RU):** Сколько жизней это спасёт?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** I'm not a goddess to count in advance. But a dirty floor takes away babies more often than swords take away soldiers.
**Prompt (RU):** Я не богиня, чтобы считать заранее. Но грязный пол забирает младенцев чаще, чем мечи забирают солдат.

**Choice 1**
- **Choice (EN):** Provide a warehouse and funding.
- **Choice (RU):** Выделить склад и средства.
- **Response (EN):** Then today the crown did something truly lively.
- **Response (RU):** Тогда сегодня корона сделала что-то по-настоящему живое.
- **Effects:** People +25, Treasury -15, Food -5

**Choice 2**
- **Choice (EN):** Provide a small room at the infirmary.
- **Choice (RU):** Дать маленькое помещение при лазарете.
- **Response (EN):** Few. But it’s better than nothing, and sometimes salvation begins with this.
- **Response (RU):** Мало. Но лучше, чем ничего, а с этого иногда начинается спасение.
- **Effects:** People +12, Treasury -5

---

### Encounter #226

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** The meat came from the south. Cheap. Too cheap. It smells like a victory over common sense.
**Prompt (RU):** Пришло мясо с юга. Дёшево. Слишком дёшево. Оно пахнет победой над здравым смыслом.

**Choice 1**
- **Choice (EN):** Buy and feed the poor.
- **Choice (RU):** Купить и накормить бедных.
- **Response (EN):** The poor will eat. Then, perhaps, they will regret it.
- **Response (RU):** Бедные поедят. Потом, возможно, пожалеют.
- **Effects:** People -15, Treasury -5, Food +15

**Choice 2**
- **Choice (EN):** Buy only for dogs and army.
- **Choice (RU):** Купить только для собак и армии.
- **Response (EN):** Dogs will forgive. Soldiers are not a fact.
- **Response (RU):** Собаки простят. Солдаты — не факт.
- **Effects:** People -5, Army -3, Food +8

**Choice 3**
- **Choice (EN):** Avoid meat.
- **Choice (RU):** Отказаться от мяса.
- **Response (EN):** Fine. Sometimes the best food is the one you don't eat.
- **Response (RU):** Хорошо. Иногда лучшая еда — та, которую не съели.
- **Effects:** People +5, Treasury +3

**Choice 4**
- **Choice (EN):** Do you think it's ruined?
- **Choice (RU):** Вы думаете, оно испорчено?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** If the meat smells like it has already met death, I prefer not to introduce it to the stomachs.
**Prompt (RU):** Если мясо пахнет так, будто уже познакомилось со смертью, я предпочитаю не знакомить его с желудками.

**Choice 1**
- **Choice (EN):** Burn the meat.
- **Choice (RU):** Сжечь мясо.
- **Response (EN):** Smoke is better than a funeral song.
- **Response (RU):** Дым лучше похоронной песни.
- **Effects:** People +10, Treasury -5

**Choice 2**
- **Choice (EN):** Pickle and take your chances.
- **Choice (RU):** Засолить и рискнуть.
- **Response (EN):** Salt hides a lot. But not everything forgives.
- **Response (RU):** Соль многое скрывает. Но не всё прощает.
- **Effects:** People -8, Food +8

---

### Encounter #227

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Some of the king's grain disappears and appears on the black market at night. Someone inside the palace is feeding the thieves.
**Prompt (RU):** Часть королевского зерна исчезает и появляется ночью на чёрном рынке. Кто-то внутри дворца кормит воров.

**Choice 1**
- **Choice (EN):** Organize a raid.
- **Choice (RU):** Устроить облаву.
- **Response (EN):** We'll catch someone for sure. The question is - a thief or a convenient victim.
- **Response (RU):** Поймаем кого-то точно. Вопрос — вора или удобную жертву.
- **Effects:** People -5, Army +5, Food +10

**Choice 2**
- **Choice (EN):** Set up secret surveillance.
- **Choice (RU):** Поставить тайную слежку.
- **Response (EN):** Silent hunt. I like it.
- **Response (RU):** Тихая охота. Мне это нравится.
- **Effects:** Treasury -5, Food +8

**Choice 3**
- **Choice (EN):** Increase penalties for grain theft.
- **Choice (RU):** Повысить наказания за кражу зерна.
- **Response (EN):** Fear will reduce theft. Or it will make thieves more careful.
- **Response (RU):** Страх уменьшит кражи. Или сделает воров осторожнее.
- **Effects:** People -8, Army +5, Food +5

**Choice 4**
- **Choice (EN):** Do you know who helps the thieves?
- **Choice (RU):** Вы знаете, кто помогает ворам?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** I know where the smell comes from. From warehouse keys and people who got rich too quickly after the coup.
**Prompt (RU):** Знаю, откуда пахнет. От складских ключей и людей, которые слишком быстро разбогатели после переворота.

**Choice 1**
- **Choice (EN):** Arrest the warehouse supervisors.
- **Choice (RU):** Арестовать складских смотрителей.
- **Response (EN):** Hard. But keys love strict hands.
- **Response (RU):** Жёстко. Но ключи любят строгие руки.
- **Effects:** People -3, Army +5, Food +10

**Choice 2**
- **Choice (EN):** Replace bags and trace the path.
- **Choice (RU):** Подменить мешки и проследить путь.
- **Response (EN):** Fine. Let the thieves lead us home themselves.
- **Response (RU):** Хорошо. Пусть воры сами приведут нас домой.
- **Effects:** Treasury -5, Food +12

---

### Encounter #228

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** There is a statue of the former king in the main square. Some put flowers on it, others spit on it. What to do?
**Prompt (RU):** На главной площади стоит статуя прежнего короля. Одни кладут к ней цветы, другие плюют. Что делать?

**Choice 1**
- **Choice (EN):** Demolish the statue.
- **Choice (RU):** Снести статую.
- **Response (EN):** You will remove the stone. It will take longer to clear the memory.
- **Response (RU):** Вы уберёте камень. Память придётся убирать дольше.
- **Effects:** People -8, Army +8

**Choice 2**
- **Choice (EN):** Leave the statue.
- **Choice (RU):** Оставить статую.
- **Response (EN):** A gentle gesture. Proponents of strength will call it weakness.
- **Response (RU):** Мягкий жест. Сторонники силы назовут его слабостью.
- **Effects:** People +5, Army -5

**Choice 3**
- **Choice (EN):** Melt it down into coins.
- **Choice (RU):** Переплавить её на монеты.
- **Response (EN):** History will become small coin. Symbolic, but dangerous.
- **Response (RU):** История станет мелкой монетой. Символично, но опасно.
- **Effects:** People -5, Treasury +15

**Choice 4**
- **Choice (EN):** What would a wise king do?
- **Choice (RU):** Что бы сделал мудрый король?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** A wise king does not argue with a stone. He takes it to a place where memory ceases to be a banner.
**Prompt (RU):** Мудрый король не спорит с камнем. Он переносит его туда, где память перестаёт быть знаменем.

**Choice 1**
- **Choice (EN):** Move the statue to the old garden.
- **Choice (RU):** Перенести статую в старый сад.
- **Response (EN):** The memory will remain, but will no longer command the area.
- **Response (RU):** Память останется, но перестанет командовать площадью.
- **Effects:** People +5, Treasury -5

**Choice 2**
- **Choice (EN):** Place a new coat of arms next to it.
- **Choice (RU):** Поставить рядом новый герб.
- **Response (EN):** You don't erase the past. You put your stamp on it.
- **Response (RU):** Вы не стираете прошлое. Вы ставите над ним свою печать.
- **Effects:** Army +3, Treasury -5

---

### Encounter #229

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** If you cap the price of bread, bakers will hide the flour. If you don't limit it, the poor will start eating bark.
**Prompt (RU):** Если вы ограничите цену на хлеб, пекари спрячут муку. Если не ограничите, бедные начнут есть кору.

**Choice 1**
- **Choice (EN):** Limit the price.
- **Choice (RU):** Ограничить цену.
- **Response (EN):** The poor will be grateful. The bakers will start counting the caches.
- **Response (RU):** Бедные будут благодарны. Пекари начнут считать тайники.
- **Effects:** People +15, Food -10

**Choice 2**
- **Choice (EN):** Do not interfere with the market.
- **Choice (RU):** Не вмешиваться в рынок.
- **Response (EN):** The market will survive. Not all people - but the market certainly is.
- **Response (RU):** Рынок выживет. Не все люди — но рынок точно.
- **Effects:** People -15, Treasury +10

**Choice 3**
- **Choice (EN):** Compensate bakers for the difference.
- **Choice (RU):** Компенсировать пекарям разницу.
- **Response (EN):** This is the language of trade. Finally.
- **Response (RU):** Вот это язык торговли. Наконец-то.
- **Effects:** People +15, Treasury -15

**Choice 4**
- **Choice (EN):** How to keep the price and not lose flour?
- **Choice (RU):** Как удержать цену и не потерять муку?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** It’s very simple: you pay the bakers, the bakers smile at the people, the people thank you, and the treasurer cries into his pillow.
**Prompt (RU):** Очень просто: вы платите пекарям, пекари улыбаются народу, народ благодарит вас, а казначей плачет в подушку.

**Choice 1**
- **Choice (EN):** Compensate bakers.
- **Choice (RU):** Компенсировать пекарям.
- **Response (EN):** Expensive, beautiful, almost reasonable.
- **Response (RU):** Дорого, красиво, почти разумно.
- **Effects:** People +15, Treasury -15

**Choice 2**
- **Choice (EN):** Give bakers grain instead of gold.
- **Choice (RU):** Дать пекарям зерно вместо золота.
- **Response (EN):** Bread for bread. A simple transaction, rare for the palace.
- **Response (RU):** Хлеб за хлеб. Простая сделка, редкость для дворца.
- **Effects:** People +12, Food -10

---

### Encounter #230

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** One condemned man asks not to hang him in the square, but to kill him quickly and quietly. He says he has children.
**Prompt (RU):** Один приговорённый просит не вешать его на площади, а убить быстро и тихо. Он говорит, что у него дети.

**Choice 1**
- **Choice (EN):** Allow silent execution.
- **Choice (RU):** Разрешить тихую казнь.
- **Response (EN):** Less spectacle. More human.
- **Response (RU):** Меньше зрелища. Больше человеческого.
- **Effects:** People +3, Army -3

**Choice 2**
- **Choice (EN):** Public execution is necessary for order.
- **Choice (RU):** Публичная казнь нужна порядку.
- **Response (EN):** The square will receive a lesson. Children are memories.
- **Response (RU):** Площадь получит урок. Дети — память.
- **Effects:** People -8, Army +8

**Choice 3**
- **Choice (EN):** Replace execution with hard labor.
- **Choice (RU):** Заменить казнь каторгой.
- **Response (EN):** A living criminal can still be useful.
- **Response (RU):** Живой преступник ещё может приносить пользу.
- **Effects:** Army -5, Treasury +8

**Choice 4**
- **Choice (EN):** Is he really guilty?
- **Choice (RU):** Он действительно виновен?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Guilty enough to die as ordered. But not enough for me to remember his name.
**Prompt (RU):** Виновен достаточно, чтобы умереть по приказу. Но недостаточно, чтобы я запомнил его имя.

**Choice 1**
- **Choice (EN):** Reconsider the case.
- **Choice (RU):** Пересмотреть дело.
- **Response (EN):** Rarely does an ax wait for paper. But today it will wait.
- **Response (RU):** Редко топор ждёт бумаги. Но сегодня подождёт.
- **Effects:** People +8, Treasury -5

**Choice 2**
- **Choice (EN):** Execute quietly.
- **Choice (RU):** Казнить тихо.
- **Response (EN):** A silent death is still death. But no crowd.
- **Response (RU):** Тихая смерть всё равно смерть. Но без толпы.
- **Effects:** People +3, Army -3

---

### Encounter #231

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** A hungry man does not hear prayer. Give us grain and we will feed people before services.
**Prompt (RU):** Голодный человек не слышит молитвы. Дайте нам зерно, и мы будем кормить людей перед службами.

**Choice 1**
- **Choice (EN):** Give grain to the monastery.
- **Choice (RU):** Дать зерно монастырю.
- **Response (EN):** Thank you. Today the sermon will begin with a spoonful of soup.
- **Response (RU):** Спасибо. Сегодня проповедь начнётся с ложки супа.
- **Effects:** People +20, Food -15

**Choice 2**
- **Choice (EN):** Give some grain.
- **Choice (RU):** Дать немного зерна.
- **Response (EN):** A little warmth is better than complete cold.
- **Response (RU):** Немного тепла лучше полного холода.
- **Effects:** People +8, Food -7

**Choice 3**
- **Choice (EN):** Let them pray first, then eat.
- **Choice (RU):** Пусть сначала молятся, потом едят.
- **Response (EN):** An empty stomach does not hold prayer well.
- **Response (RU):** Пустой желудок плохо держит молитву.
- **Effects:** People -10, Food +5

**Choice 4**
- **Choice (EN):** Do you want to feed or convert?
- **Choice (RU):** Вы хотите кормить или обращать?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** I want them to live until tomorrow. If they pray tomorrow, good. If they just breathe, it’s already a miracle.
**Prompt (RU):** Я хочу, чтобы они дожили до завтра. Если завтра они будут молиться — хорошо. Если просто будут дышать — уже чудо.

**Choice 1**
- **Choice (EN):** Give grain without conditions.
- **Choice (RU):** Дать зерно без условий.
- **Response (EN):** This is mercy. No hook. A rare thing at court.
- **Response (RU):** Это милосердие. Без крючка. Редкая вещь при дворе.
- **Effects:** People +20, Food -15

**Choice 2**
- **Choice (EN):** Give grain only to children and the sick.
- **Choice (RU):** Дать зерно только детям и больным.
- **Response (EN):** I'll accept. Although hungry adults are people too.
- **Response (RU):** Я приму. Хотя голодные взрослые тоже люди.
- **Effects:** People +12, Food -8

---

### Encounter #232

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** I have a strong poison. For rats, of course. Although rats are different.
**Prompt (RU):** У меня есть сильная отрава. Для крыс, разумеется. Хотя крысы бывают разными.

**Choice 1**
- **Choice (EN):** Buy for barns.
- **Choice (RU):** Купить для амбаров.
- **Response (EN):** The rats will die. I hope the chefs know how to read the warnings.
- **Response (RU):** Крысы умрут. Надеюсь, повара умеют читать предупреждения.
- **Effects:** People -3, Treasury -5, Food +10

**Choice 2**
- **Choice (EN):** Buy secretly for the palace.
- **Choice (RU):** Купить тайно для дворца.
- **Response (EN):** Palace rats walk on two legs. You understand.
- **Response (RU):** Дворцовые крысы ходят на двух ногах. Понимаю.
- **Effects:** Treasury -10

**Choice 3**
- **Choice (EN):** Ban the sale of poison.
- **Choice (RU):** Запретить продажу отравы.
- **Response (EN):** Forbid it. Rats, however, do not read decrees.
- **Response (RU):** Запретите. Крысы, правда, указов не читают.
- **Effects:** People +5, Food -5

**Choice 4**
- **Choice (EN):** Are you offering me poison?
- **Choice (RU):** Вы предлагаете мне яд?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** I offer a remedy. Poison is when the remedy ends up in the wrong cup.
**Prompt (RU):** Я предлагаю средство. Яд — это когда средство попадает не в ту чашу.

**Choice 1**
- **Choice (EN):** Buy for barns only.
- **Choice (RU):** Купить только для амбаров.
- **Response (EN):** How boring. How prudent.
- **Response (RU):** Как скучно. Как благоразумно.
- **Effects:** People -3, Treasury -5, Food +10

**Choice 2**
- **Choice (EN):** Buy and keep in the palace.
- **Choice (RU):** Купить и держать во дворце.
- **Response (EN):** Let your enemies hope that you do not know how to choose cups.
- **Response (RU):** Пусть ваши враги надеются, что вы не умеете выбирать чаши.
- **Effects:** Army +3, Treasury -10

---

### Encounter #233

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** The infirmaries are filled with civilians. Wounded soldiers have nowhere to go. Who is more important for the throne?
**Prompt (RU):** Лазареты забиты гражданскими. Раненым солдатам некуда лечь. Кто важнее для трона?

**Choice 1**
- **Choice (EN):** Make room for soldiers.
- **Choice (RU):** Освободить места для солдат.
- **Response (EN):** The soldiers will remember. Civilians too.
- **Response (RU):** Солдаты будут помнить. Гражданские тоже.
- **Effects:** People -15, Army +15

**Choice 2**
- **Choice (EN):** Leave the civilians.
- **Choice (RU):** Оставить гражданских.
- **Response (EN):** Mercy for the city. Bitterness in the barracks.
- **Response (RU):** Милосердие к городу. Горечь в казармах.
- **Effects:** People +15, Army -10

**Choice 3**
- **Choice (EN):** Expand the infirmary.
- **Choice (RU):** Расширить лазарет.
- **Response (EN):** Expensive. But at least no one can say that you chose the dead.
- **Response (RU):** Дорого. Но хотя бы никто не сможет сказать, что вы выбрали мёртвых.
- **Effects:** People +10, Army +5, Treasury -15

**Choice 4**
- **Choice (EN):** Do you want me to choose between the sword and the people?
- **Choice (RU):** Вы хотите, чтобы я выбрал между мечом и народом?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** No. I want you to understand: a sword that bleeds on the floor will not protect the people tomorrow.
**Prompt (RU):** Нет. Я хочу, чтобы вы поняли: меч, который истекает кровью на полу, завтра не защитит народ.

**Choice 1**
- **Choice (EN):** Expand the infirmary.
- **Choice (RU):** Расширить лазарет.
- **Response (EN):** Good order. Even I won't argue.
- **Response (RU):** Хороший приказ. Даже я не стану спорить.
- **Effects:** People +10, Army +5, Treasury -15

**Choice 2**
- **Choice (EN):** Half the places are for soldiers.
- **Choice (RU):** Половину мест солдатам.
- **Response (EN):** Half justice is better than a complete quarrel.
- **Response (RU):** Половина справедливости лучше полной ссоры.
- **Effects:** People -5, Army +8

---

### Encounter #234

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Even a traitor has a soul. Let the priest speak to everyone before they die.
**Prompt (RU):** Даже предатель имеет душу. Пусть священник говорит с каждым перед смертью.

**Choice 1**
- **Choice (EN):** Allow.
- **Choice (RU):** Разрешить.
- **Response (EN):** Mercy before death is still mercy.
- **Response (RU):** Милость перед смертью — всё ещё милость.
- **Effects:** People +5, Treasury -3

**Choice 2**
- **Choice (EN):** Only important prisoners.
- **Choice (RU):** Только важным заключённым.
- **Response (EN):** Souls, it turns out, are also divided by rank.
- **Response (RU):** Души, выходит, тоже делятся по рангу.
- **Effects:** People +2

**Choice 3**
- **Choice (EN):** No. A quick execution is cheaper.
- **Choice (RU):** Нет. Быстрая казнь дешевле.
- **Response (EN):** A cheap death often comes at a high cost to the living.
- **Response (RU):** Дешёвая смерть часто дорого обходится живым.
- **Effects:** People -5, Army +3, Treasury +5

**Choice 4**
- **Choice (EN):** Why console traitors?
- **Choice (RU):** Зачем утешать предателей?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** We do not console traitors. We console those who look and think, ‘If I am accused, will I die like an animal?’
**Prompt (RU):** Мы утешаем не предателей. Мы утешаем тех, кто смотрит и думает: ‘если меня обвинят, умру ли я как зверь?’

**Choice 1**
- **Choice (EN):** Allow everyone to pray.
- **Choice (RU):** Разрешить молитву всем.
- **Response (EN):** Today fear will become a little less animalistic.
- **Response (RU):** Сегодня страх станет чуть менее звериным.
- **Effects:** People +6, Treasury -3

**Choice 2**
- **Choice (EN):** Only to those who admit guilt.
- **Choice (RU):** Только тем, кто признаёт вину.
- **Response (EN):** Confession in exchange for mercy. Strict, but understandable.
- **Response (RU):** Исповедь в обмен на милость. Строго, но понятно.
- **Effects:** People +3, Army +2

---

### Encounter #235

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** I found the old hiding place of the former king. There is gold there, but it is marked with the seals of the old dynasty.
**Prompt (RU):** Я нашёл старый тайник прежнего короля. Там золото, но оно отмечено печатями старой династии.

**Choice 1**
- **Choice (EN):** Melt down the gold.
- **Choice (RU):** Переплавить золото.
- **Response (EN):** The old king will become the new coin. Ironic and useful.
- **Response (RU):** Старый король станет новой монетой. Иронично и полезно.
- **Effects:** Treasury +25

**Choice 2**
- **Choice (EN):** Use it secretly.
- **Choice (RU):** Использовать его тайно.
- **Response (EN):** Secret money is the best money. Until it is found.
- **Response (RU):** Тайные деньги — лучшие деньги. Пока их не найдут.
- **Effects:** Treasury +15

**Choice 3**
- **Choice (EN):** Show it to the people and call it a trophy.
- **Choice (RU):** Показать народу и назвать трофеем.
- **Response (EN):** Boldly. But some people still love old seals.
- **Response (RU):** Смело. Но некоторые всё ещё любят старые печати.
- **Effects:** People -5, Army +5, Treasury +20

**Choice 4**
- **Choice (EN):** Why did the former king hide it?
- **Choice (RU):** Почему прежний король его спрятал?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Kings hide gold for two reasons: to survive trouble or to escape from it. The deceased did not manage to do either of these things.
**Prompt (RU):** Короли прячут золото по двум причинам: чтобы пережить беду или чтобы сбежать от неё. Покойный не успел ни того, ни другого.

**Choice 1**
- **Choice (EN):** Melt everything down.
- **Choice (RU):** Переплавить всё.
- **Response (EN):** Wonderful. Gold has no memory after the smelter.
- **Response (RU):** Прекрасно. У золота нет памяти после плавильни.
- **Effects:** Treasury +25

**Choice 2**
- **Choice (EN):** Leave some as a reserve.
- **Choice (RU):** Оставить часть как резерв.
- **Response (EN):** Wise. A secret chest is sometimes better than advice.
- **Response (RU):** Мудро. Тайный сундук иногда вернее совета.
- **Effects:** Treasury +15

---

### Encounter #236

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** People eat whatever is given to them. Yesterday's free stew was too rich for hungry stomachs. Now half the street is sick.
**Prompt (RU):** Люди едят всё, что им дают. Вчерашняя бесплатная похлёбка была слишком жирной для голодных желудков. Теперь половина улицы болеет.

**Choice 1**
- **Choice (EN):** Organize proper kitchens.
- **Choice (RU):** Организовать правильные кухни.
- **Response (EN):** Feeding is not enough. You still need to not kill with kindness.
- **Response (RU):** Накормить — мало. Нужно ещё не убить добротой.
- **Effects:** People +20, Treasury -10, Food -5

**Choice 2**
- **Choice (EN):** Stop food distribution.
- **Choice (RU):** Прекратить раздачи еды.
- **Response (EN):** You will stop stomach pain. And you will bring back hunger.
- **Response (RU):** Вы остановите боль в животах. И вернёте голод.
- **Effects:** People -10, Food +10

**Choice 3**
- **Choice (EN):** Entrust recipes to chefs.
- **Choice (RU):** Поручить рецепты поварам.
- **Response (EN):** Let them cook for the sick, not for a feast.
- **Response (RU):** Пусть готовят для больных, а не для пира.
- **Effects:** People +12, Food -5

**Choice 4**
- **Choice (EN):** Can food harm the hungry?
- **Choice (RU):** Еда может вредить голодным?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** After a long hunger, the stomach looks like a wounded one. If you throw a feast at him, he doesn’t thank you - he gives up.
**Prompt (RU):** После долгого голода желудок похож на раненого. Если бросить в него пир, он не благодарит — он сдаётся.

**Choice 1**
- **Choice (EN):** Create healing kitchens.
- **Choice (RU):** Создать лечебные кухни.
- **Response (EN):** This will save more than it seems. Quietly, without fanfare.
- **Response (RU):** Это спасёт больше, чем кажется. Тихо, без фанфар.
- **Effects:** People +22, Treasury -10, Food -8

**Choice 2**
- **Choice (EN):** Distribute only liquid stew.
- **Choice (RU):** Раздавать только жидкую похлёбку.
- **Response (EN):** Fine. Simple food is the best medicine for an empty belly.
- **Response (RU):** Хорошо. Простая еда — лучшее лекарство для пустого живота.
- **Effects:** People +12, Food -5

---

### Encounter #237

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** If you replace meat with turnips, the city will last longer. But the soldiers are already calling it ‘the slop of the world’.
**Prompt (RU):** Если заменить мясо репой, город протянет дольше. Но солдаты уже называют это ‘помоями мира’.

**Choice 1**
- **Choice (EN):** Transfer everyone to turnip.
- **Choice (RU):** Перевести всех на репу.
- **Response (EN):** Everyone will be equally unhappy. There is almost justice in this.
- **Response (RU):** Все будут недовольны одинаково. В этом есть почти справедливость.
- **Effects:** People +5, Army -10, Food +20

**Choice 2**
- **Choice (EN):** Only feed the poor turnips.
- **Choice (RU):** Только бедных кормить репой.
- **Response (EN):** The poor will again receive the cheapest share of mercy.
- **Response (RU):** Бедные снова получат самую дешёвую часть милости.
- **Effects:** People -5, Food +10

**Choice 3**
- **Choice (EN):** The palace also eats turnips.
- **Choice (RU):** Дворец тоже ест репу.
- **Response (EN):** This is what I want to see: courtiers versus root crops.
- **Response (RU):** Вот это я хочу увидеть: придворные против корнеплода.
- **Effects:** People +8, Food +8

**Choice 4**
- **Choice (EN):** Is it possible to make turnips tasty?
- **Choice (RU):** Можно сделать репу вкусной?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** You can if you add oil, salt and hope. Oil is scarce, salt is expensive, let the throne provide hope.
**Prompt (RU):** Можно, если добавить масло, соль и надежду. Масла мало, соль дорогая, надежду пусть поставляет трон.

**Choice 1**
- **Choice (EN):** Add salt from stock.
- **Choice (RU):** Добавить соль из запасов.
- **Response (EN):** Salt will save the taste. A little honor too.
- **Response (RU):** Соль спасёт вкус. Немного честь тоже.
- **Effects:** People +5, Treasury -5, Food +10

**Choice 2**
- **Choice (EN):** Make turnips a common food.
- **Choice (RU):** Сделать репу общей пищей.
- **Response (EN):** Then no one will say that hunger has a class.
- **Response (RU):** Тогда никто не скажет, что голод имеет сословие.
- **Effects:** People +5, Army -10, Food +20

---

### Encounter #238

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** One guard let a merchant's cart through at night without inspection. He says he only took two coins.
**Prompt (RU):** Один стражник пропустил ночью купеческую телегу без досмотра. Говорит, что взял только две монеты.

**Choice 1**
- **Choice (EN):** Execute the guard.
- **Choice (RU):** Казнить стражника.
- **Response (EN):** The guards will understand the value of two coins.
- **Response (RU):** Стража поймёт цену двух монет.
- **Effects:** People -8, Army +8

**Choice 2**
- **Choice (EN):** Brand and leave to serve.
- **Choice (RU):** Клеймить и оставить на службе.
- **Response (EN):** Pain teaches faster than command.
- **Response (RU):** Боль учит быстрее приказа.
- **Effects:** Army +5

**Choice 3**
- **Choice (EN):** Fire and fine.
- **Choice (RU):** Уволить и оштрафовать.
- **Response (EN):** Soft. But it's not pointless.
- **Response (RU):** Мягко. Но не бессмысленно.
- **Effects:** Army -3, Treasury +5

**Choice 4**
- **Choice (EN):** What was in the cart?
- **Choice (RU):** Что было в телеге?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** He swears he doesn't know. And I don’t like the oaths of people who sell their eyes for two coins.
**Prompt (RU):** Он клянётся, что не знает. А я не люблю клятвы людей, которые продают глаза за две монеты.

**Choice 1**
- **Choice (EN):** Find the cart and seize the cargo.
- **Choice (RU):** Найти телегу и конфисковать груз.
- **Response (EN):** Let's catch the trail while the wheels are still fresh.
- **Response (RU):** Поймаем след, пока колёса ещё свежие.
- **Effects:** Army +3, Treasury -3, Food +10

**Choice 2**
- **Choice (EN):** Interrogate the guard harshly.
- **Choice (RU):** Допросить стражника жёстко.
- **Response (EN):** He will remember. Or he'll come up with an idea. We'll have to decide.
- **Response (RU):** Он вспомнит. Или придумает. Придётся решать.
- **Effects:** People -5, Army +8

---

### Encounter #239

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** People are not afraid of punishment, but of punishment without trial. Even a king who took the throne needs a law.
**Prompt (RU):** Люди боятся не наказаний, а наказаний без суда. Даже тому, кто взял трон нужен закон.

**Choice 1**
- **Choice (EN):** Create a temporary court.
- **Choice (RU):** Создать временный суд.
- **Response (EN):** Law is a slow shield. But still a shield.
- **Response (RU):** Закон — медленный щит. Но щит всё же.
- **Effects:** People +15, Treasury -10

**Choice 2**
- **Choice (EN):** Try only important defendants.
- **Choice (RU):** Судить только важных обвиняемых.
- **Response (EN):** Not justice, but its shadow. Sometimes shade is better than darkness.
- **Response (RU):** Не справедливость, но её тень. Иногда тень лучше темноты.
- **Effects:** People +5, Treasury -5

**Choice 3**
- **Choice (EN):** The royal command is superior to the court.
- **Choice (RU):** Королевский приказ выше суда.
- **Response (EN):** This is what strong kings say. And those who don’t remain kings for long.
- **Response (RU):** Так говорят сильные короли. И те, кто недолго остаётся королями.
- **Effects:** People -15, Army +10

**Choice 4**
- **Choice (EN):** Will the law help maintain the throne?
- **Choice (RU):** Закон поможет удержать трон?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** The sword will hold the door today. The law will convince people tomorrow not to look for another door.
**Prompt (RU):** Меч удержит дверь сегодня. Закон убедит людей завтра не искать другую дверь.

**Choice 1**
- **Choice (EN):** Create a temporary court.
- **Choice (RU):** Создать временный суд.
- **Response (EN):** Wise. Fear subdues, law binds.
- **Response (RU):** Мудро. Страх подчиняет, закон привязывает.
- **Effects:** People +15, Treasury -10

**Choice 2**
- **Choice (EN):** Appoint speedy military courts.
- **Choice (RU):** Назначить быстрые военные суды.
- **Response (EN):** Fast. Dangerous. But at least not completely without form.
- **Response (RU):** Быстро. Опасно. Но хотя бы не совсем без формы.
- **Effects:** People -8, Army +10

---

### Encounter #240

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** My warehouses are full. But the road to them is dangerous. Give me soldiers and you will get bread.
**Prompt (RU):** Мои склады полны. Но дорога к ним опасна. Дайте мне солдат — получите хлеб.

**Choice 1**
- **Choice (EN):** Give soldiers.
- **Choice (RU):** Дать солдат.
- **Response (EN):** Wonderful. Your swords will bring my bread to your hungry.
- **Response (RU):** Прекрасно. Ваши мечи приведут мой хлеб к вашим голодным.
- **Effects:** Army -8, Food +20

**Choice 2**
- **Choice (EN):** Pay private security.
- **Choice (RU):** Заплатить частной охране.
- **Response (EN):** Expensive, but without an extra military boot on the trade road.
- **Response (RU):** Дорого, но без лишнего военного сапога на торговой дороге.
- **Effects:** Treasury -12, Food +15

**Choice 3**
- **Choice (EN):** Take warehouses by force.
- **Choice (RU):** Забрать склады силой.
- **Response (EN):** You will receive grain. And merchants who will learn to hide better.
- **Response (RU):** Вы получите зерно. И купцов, которые научатся прятать лучше.
- **Effects:** People -10, Army +5, Food +25

**Choice 4**
- **Choice (EN):** Are you threatening the crown with famine?
- **Choice (RU):** Вы угрожаете короне голодом?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** I? Never. Hunger threatens itself. I'm just standing next to the barn key.
**Prompt (RU):** Я? Никогда. Голод угрожает сам. Я лишь стою рядом с ключом от амбара.

**Choice 1**
- **Choice (EN):** Give soldiers and tax some of the grain.
- **Choice (RU):** Дать солдат и забрать часть зерна налогом.
- **Response (EN):** Tough, but smart. This is unpleasant for me, so you are learning.
- **Response (RU):** Жёстко, но умно. Мне это неприятно, значит, вы учитесь.
- **Effects:** Army -8, Treasury +3, Food +22

**Choice 2**
- **Choice (EN):** Buy grain honestly.
- **Choice (RU):** Купить зерно честно.
- **Response (EN):** Honesty feels good. Especially when it's paid in full.
- **Response (RU):** Честность приятна. Особенно когда оплачена полностью.
- **Effects:** Treasury -15, Food +15

---

### Encounter #241

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** After each execution the crowd becomes quieter. Do you want to make executions weekly?
**Prompt (RU):** После каждой казни толпа становится тише. Хотите сделать казни еженедельными?

**Choice 1**
- **Choice (EN):** Yes, fear is needed.
- **Choice (RU):** Да, страх нужен.
- **Response (EN):** Then I will prepare the area. And people who will then wash it.
- **Response (RU):** Тогда я подготовлю площадь. И людей, которые потом её отмоют.
- **Effects:** People -20, Army +15

**Choice 2**
- **Choice (EN):** Only for proven traitors.
- **Choice (RU):** Только для доказанных предателей.
- **Response (EN):** Moderate horror. It's easier to swallow.
- **Response (RU):** Умеренный ужас. Его легче проглотить.
- **Effects:** People -5, Army +5

**Choice 3**
- **Choice (EN):** No. Fear quickly rots.
- **Choice (RU):** Нет. Страх быстро гниёт.
- **Response (EN):** A rare order that reduces my work.
- **Response (RU):** Редкий приказ, от которого моя работа уменьшается.
- **Effects:** People +10, Army -5

**Choice 4**
- **Choice (EN):** Is the crowd really getting quieter?
- **Choice (RU):** Толпа правда становится тише?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Quiet - yes. Or rather, no. Silence is not always true. Sometimes it's just clenched teeth.
**Prompt (RU):** Тише — да. Вернее — нет. Молчание не всегда верность. Иногда это просто стиснутые зубы.

**Choice 1**
- **Choice (EN):** Executions are only carried out in major cases.
- **Choice (RU):** Казни только по большим делам.
- **Response (EN):** The ax will be rare. That's why it's probably scarier.
- **Response (RU):** Топор будет редким. Оттого, возможно, страшнее.
- **Effects:** People -5, Army +5

**Choice 2**
- **Choice (EN):** Replace some executions with hard labor.
- **Choice (RU):** Заменить часть казней каторгой.
- **Response (EN):** A pick instead of a loop. It also has an educational sound.
- **Response (RU):** Кирка вместо петли. У неё тоже есть воспитательный звук.
- **Effects:** Army -5, Treasury +10

---

### Encounter #242

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** The soldiers were brought to the monastery with fever. If we accept them, the poor will get sick. If not, the defenders of the throne will die.
**Prompt (RU):** В монастырь принесли солдат с жаром. Если мы примем их, заболеют бедные. Если нет — умрут защитники трона.

**Choice 1**
- **Choice (EN):** Receive soldiers.
- **Choice (RU):** Принять солдат.
- **Response (EN):** We will accept them. And we will pray that the disease does not go further.
- **Response (RU):** Мы примем их. И будем молиться, чтобы болезнь не пошла дальше.
- **Effects:** People -8, Army +10

**Choice 2**
- **Choice (EN):** Leave places for the poor.
- **Choice (RU):** Оставить места для бедных.
- **Response (EN):** The poor will survive. The soldiers may not forgive.
- **Response (RU):** Бедные выживут. Солдаты, возможно, не простят.
- **Effects:** People +10, Army -8

**Choice 3**
- **Choice (EN):** Divide the monastery with partitions.
- **Choice (RU):** Разделить монастырь перегородками.
- **Response (EN):** A wooden wall is better than a stone heart.
- **Response (RU):** Деревянная стена лучше каменного сердца.
- **Effects:** People +3, Army +3, Treasury -5

**Choice 4**
- **Choice (EN):** What does your conscience say?
- **Choice (RU):** Что говорит ваша совесть?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** She says that a soldier and a beggar have the same fever. But we have one bed.
**Prompt (RU):** Она говорит, что у солдата и нищего жар одинаковый. Но койка у нас одна.

**Choice 1**
- **Choice (EN):** Accept the heaviest, regardless of rank.
- **Choice (RU):** Принимать самых тяжёлых, независимо от звания.
- **Response (EN):** This seems like justice. It's rarely convenient.
- **Response (RU):** Это похоже на справедливость. Она редко удобна.
- **Effects:** People +8, Army +3

**Choice 2**
- **Choice (EN):** Soldiers are more important.
- **Choice (RU):** Солдаты важнее.
- **Response (EN):** I will obey. But illness does not respect uniforms.
- **Response (RU):** Я подчинюсь. Но болезнь не уважает мундиры.
- **Effects:** People -8, Army +10

---

### Encounter #243

**Character (EN):** Apothecary Sivil
**Character (RU):** Аптекарь Сивил

#### Node 0

**Prompt (EN):** There have been strange poisonings in the city. I can make an antidote. But rare herbs are expensive.
**Prompt (RU):** В городе пошли странные отравления. Я могу сделать противоядие. Но редкие травы стоят дорого.

**Choice 1**
- **Choice (EN):** Buy herbs.
- **Choice (RU):** Купить травы.
- **Response (EN):** Life has defeated the wallet again. What a rarity.
- **Response (RU):** Жизнь снова победила кошелёк. Какая редкость.
- **Effects:** People +20, Treasury -15

**Choice 2**
- **Choice (EN):** Buy small stock.
- **Choice (RU):** Купить малый запас.
- **Response (EN):** A small reserve saves a small part of the trouble.
- **Response (RU):** Малый запас спасает малую часть беды.
- **Effects:** People +8, Treasury -6

**Choice 3**
- **Choice (EN):** Accuse Sivil of creating poison.
- **Choice (RU):** Обвинить Сивила в создании яда.
- **Response (EN):** Comfortable. When you don’t know who is to blame, grab someone who knows herbs.
- **Response (RU):** Удобно. Когда не знаешь, кто виноват, хватай того, кто знает травы.
- **Effects:** People -5, Army +5

**Choice 4**
- **Choice (EN):** How do you know it's poison?
- **Choice (RU):** Откуда вы знаете, что это яд?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because people don't turn blue from bad thoughts. Although, I admit, your subjects are trying.
**Prompt (RU):** Потому что люди не синеют от плохих мыслей. Хотя, признаю, ваши подданные стараются.

**Choice 1**
- **Choice (EN):** Buy full stock.
- **Choice (RU):** Купить полный запас.
- **Response (EN):** Fine. Death will earn less today.
- **Response (RU):** Хорошо. Смерть сегодня заработает меньше.
- **Effects:** People +20, Treasury -15

**Choice 2**
- **Choice (EN):** Buy a small supply and look for a source.
- **Choice (RU):** Купить малый запас и искать источник.
- **Response (EN):** Reasonable. Treating water without finding a well is stupid.
- **Response (RU):** Разумно. Лечить воду, не найдя колодец, глупо.
- **Effects:** People +12, Treasury -8

---

### Encounter #244

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Announce a day of fasting. People will eat less and think about their souls.
**Prompt (RU):** Объявите день поста. Люди будут есть меньше и думать о душе.

**Choice 1**
- **Choice (EN):** Announce a general fast.
- **Choice (RU):** Объявить общий пост.
- **Response (EN):** The city will come to terms. Although the hungry humble themselves worse than the well-fed.
- **Response (RU):** Город смирится. Хотя голодные смиряются хуже сытых.
- **Effects:** People -5, Food +15

**Choice 2**
- **Choice (EN):** This fast is for the palace only.
- **Choice (RU):** Пост только для дворца.
- **Response (EN):** Good example from above. People love it when the palace tolerates it too.
- **Response (RU):** Хороший пример сверху. Народ любит, когда дворец тоже терпит.
- **Effects:** People +5, Food +5

**Choice 3**
- **Choice (EN):** A fast for the army too.
- **Choice (RU):** Пост для армии тоже.
- **Response (EN):** Strong humility. The soldiers will call it differently.
- **Response (RU):** Сильное смирение. Солдаты назовут его иначе.
- **Effects:** Army -15, Food +20

**Choice 4**
- **Choice (EN):** The hungry are already fasting.
- **Choice (RU):** Голодные и так постятся.
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** That is why the palace should begin the fast. When a well-fed person refuses meat, a hungry person at least sees that his suffering has been noticed.
**Prompt (RU):** Именно поэтому пост должен начать дворец. Когда сытый отказывается от мяса, голодный хотя бы видит, что его страдание заметили.

**Choice 1**
- **Choice (EN):** This fast is for the palace only.
- **Choice (RU):** Пост только для дворца.
- **Response (EN):** Humility above sometimes cures anger below.
- **Response (RU):** Смирение наверху иногда лечит злость внизу.
- **Effects:** People +8, Food +5

**Choice 2**
- **Choice (EN):** A general fast with the distribution of stew to the poor.
- **Choice (RU):** Общий пост с раздачей похлёбки бедным.
- **Response (EN):** Wise. An empty stomach doesn't have to be a death sentence.
- **Response (RU):** Мудро. Пустота в желудке не должна быть смертным приговором.
- **Effects:** People +10, Food +5

---

### Encounter #245

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Citizens are willing to pay for patrols in their areas. Essentially, security will become a service.
**Prompt (RU):** Горожане готовы платить за патрули в своих районах. По сути, безопасность станет услугой.

**Choice 1**
- **Choice (EN):** Introduce paid patrols.
- **Choice (RU):** Ввести платные патрули.
- **Response (EN):** Security will finally start to pay off.
- **Response (RU):** Безопасность наконец начнёт окупаться.
- **Effects:** People -10, Army +8, Treasury +20

**Choice 2**
- **Choice (EN):** Patrols are free.
- **Choice (RU):** Патрули бесплатны.
- **Response (EN):** Noble. Unprofitable. Very royal.
- **Response (RU):** Благородно. Убыточно. Очень по-королевски.
- **Effects:** People +10, Army +5, Treasury -10

**Choice 3**
- **Choice (EN):** Patrols only in dangerous areas.
- **Choice (RU):** Патрули только в опасных районах.
- **Response (EN):** Reasonable expense. I'm almost satisfied.
- **Response (RU):** Разумный расход. Я почти доволен.
- **Effects:** People +5, Army +5, Treasury -5

**Choice 4**
- **Choice (EN):** What about poor areas?
- **Choice (RU):** А бедные районы?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Poor areas will pay less. Or they won't pay at all. Then they will have less security. Mathematics is cruel, but fair.
**Prompt (RU):** Бедные районы заплатят меньше. Или не заплатят вовсе. Тогда они получат меньше безопасности. Математика жестока, но честна.

**Choice 1**
- **Choice (EN):** The rich pay for themselves and the poor.
- **Choice (RU):** Богатые платят за себя и бедных.
- **Response (EN):** Wonderful. A tax that can be called mercy.
- **Response (RU):** Прекрасно. Налог, который можно назвать милосердием.
- **Effects:** People +8, Army +8, Treasury +10

**Choice 2**
- **Choice (EN):** Whoever pays gets the patrol.
- **Choice (RU):** Кто платит, тот получает патруль.
- **Response (EN):** Clean system. Dirty consequences.
- **Response (RU):** Чистая система. Грязные последствия.
- **Effects:** People -10, Army +8, Treasury +20

---

### Encounter #246

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** The pharmacy burned down at night. People say it's a punishment from the gods, but I see traces of oil.
**Prompt (RU):** Ночью сгорела аптека. Люди говорят, что это кара богов, но я вижу следы масла.

**Choice 1**
- **Choice (EN):** Investigate arson.
- **Choice (RU):** Расследовать поджог.
- **Response (EN):** Thank you. Fire rarely lights itself where there is benefit.
- **Response (RU):** Спасибо. Огонь редко загорается сам там, где есть выгода.
- **Effects:** People +5, Treasury -5

**Choice 2**
- **Choice (EN):** Restore the pharmacy at the expense of the treasury.
- **Choice (RU):** Восстановить аптеку за счёт казны.
- **Response (EN):** People will get medicine before rumors become poison.
- **Response (RU):** Люди получат лекарства раньше, чем слухи станут ядом.
- **Effects:** People +20, Treasury -15

**Choice 3**
- **Choice (EN):** Hand over the matter to the guards.
- **Choice (RU):** Передать дело страже.
- **Response (EN):** Let them search. If only they wouldn’t find a convenient poor man.
- **Response (RU):** Пусть ищут. Только бы не нашли удобного бедняка.
- **Effects:** Army +5, Treasury -3

**Choice 4**
- **Choice (EN):** Who benefits from arson?
- **Choice (RU):** Кому выгоден поджог?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** To the one who sells medicines at a higher price. Or to someone who wants the sick to go not to the doctor, but to the altar.
**Prompt (RU):** Тому, кто продаёт лекарства дороже. Или тому, кто хочет, чтобы больные шли не к лекарю, а к алтарю.

**Choice 1**
- **Choice (EN):** Investigate drug dealers.
- **Choice (RU):** Расследовать торговцев лекарствами.
- **Response (EN):** Look for money. They often stand next to fire.
- **Response (RU):** Ищите деньги. Они часто стоят рядом с огнём.
- **Effects:** People +8, Treasury -5

**Choice 2**
- **Choice (EN):** Restore the pharmacy and provide security.
- **Choice (RU):** Восстановить аптеку и поставить охрану.
- **Response (EN):** Now patients will receive a door that will not burn without witnesses.
- **Response (RU):** Теперь больные получат дверь, которая не сгорит без свидетелей.
- **Effects:** People +22, Army +3, Treasury -18

---

### Encounter #247

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Prisoners are hardly fed. If they die in the cells, Morwen will have less work to do, but the stench will reach the throne room.
**Prompt (RU):** Заключённых почти не кормят. Если они умрут в камерах, Морвену работы меньше, но вонь дойдёт до тронного зала.

**Choice 1**
- **Choice (EN):** Feed the prisoners properly.
- **Choice (RU):** Кормить заключённых нормально.
- **Response (EN):** It's not mercy, it's sanitation. Sometimes they are similar.
- **Response (RU):** Не милость, так санитария. Иногда они похожи.
- **Effects:** People +10, Food -10

**Choice 2**
- **Choice (EN):** Feed only those who work.
- **Choice (RU):** Кормить только тех, кто работает.
- **Response (EN):** Food for work. Prison justice.
- **Response (RU):** Пища за труд. Тюремная справедливость.
- **Effects:** Treasury +5, Food -5

**Choice 3**
- **Choice (EN):** Don't waste food on traitors.
- **Choice (RU):** Не тратить еду на предателей.
- **Response (EN):** Then the cells will soon begin to prepare their own scent.
- **Response (RU):** Тогда из камер скоро пойдёт свой собственный запах.
- **Effects:** People -15, Food +10

**Choice 4**
- **Choice (EN):** Are they really dying of hunger?
- **Choice (RU):** Они правда умирают от голода?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Not yet. For now they only gnaw at crusts, walls and each other with their eyes. But a couple more days and it will start to smell like a problem.
**Prompt (RU):** Пока нет. Пока они только грызут корки, стены и друг друга глазами. Но ещё пару дней — и начнут пахнуть как проблема.

**Choice 1**
- **Choice (EN):** Feed all prisoners.
- **Choice (RU):** Кормить всех заключённых.
- **Response (EN):** Fine. Dead enemies are less dangerous, but smell worse.
- **Response (RU):** Хорошо. Мёртвые враги опасны меньше, но пахнут хуже.
- **Effects:** People +10, Food -10

**Choice 2**
- **Choice (EN):** Send prisoners to work for food.
- **Choice (RU):** Отправить заключённых на работы за еду.
- **Response (EN):** At least let them dig their own graves.
- **Response (RU):** Пусть хотя бы роют не себе могилы.
- **Effects:** People -3, Treasury +10, Food -5

---

### Encounter #248

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Carts without seals go through the night gate. If you close the gates, the city will be safer, but the food will be delayed.
**Prompt (RU):** Через ночные ворота идут телеги без печатей. Если закрыть ворота, город станет безопаснее, но еда задержится.

**Choice 1**
- **Choice (EN):** Close the gate at night.
- **Choice (RU):** Закрыть ворота ночью.
- **Response (EN):** Safer. But the morning will greet us with a line of hungry carts.
- **Response (RU):** Безопаснее. Но утро встретит нас с очередью голодных телег.
- **Effects:** People +3, Army +8, Food -10

**Choice 2**
- **Choice (EN):** Leave the gate open.
- **Choice (RU):** Оставить ворота открытыми.
- **Response (EN):** Food will come in. Hopefully not with knives.
- **Response (RU):** Еда войдёт. Надеюсь, не вместе с ножами.
- **Effects:** Army -8, Food +10

**Choice 3**
- **Choice (EN):** Check every cart.
- **Choice (RU):** Проверять каждую телегу.
- **Response (EN):** Slow but sure. The gates will become eyes.
- **Response (RU):** Медленно, но надёжно. Ворота станут глазами.
- **Effects:** Army +5, Treasury -5, Food +3

**Choice 4**
- **Choice (EN):** What is more often carried at night - food or danger?
- **Choice (RU):** Что чаще везут ночью — еду или опасность?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Both. The trouble is that sacks of grain and sacks of daggers look the same until they are untied.
**Prompt (RU):** И то, и другое. Беда в том, что мешки с зерном и мешки с кинжалами выглядят одинаково, пока их не развязать.

**Choice 1**
- **Choice (EN):** Check every cart.
- **Choice (RU):** Проверять каждую телегу.
- **Response (EN):** Then we will be slow, but not blind.
- **Response (RU):** Тогда мы будем медленными, но не слепыми.
- **Effects:** Army +5, Treasury -5, Food +3

**Choice 2**
- **Choice (EN):** Introduce night duty and inspection.
- **Choice (RU):** Ввести ночную пошлину и досмотр.
- **Response (EN):** Fine. Even danger will pay an entrance fee.
- **Response (RU):** Хорошо. Даже опасность будет платить за вход.
- **Effects:** Army +3, Treasury +8, Food -3

---

### Encounter #249

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** After blood and fear, people need a holiday. But the holiday is worth gold, food and peace of mind.
**Prompt (RU):** После крови и страха люди нуждаются в празднике. Но праздник стоит золота, еды и спокойствия.

**Choice 1**
- **Choice (EN):** Have a big celebration.
- **Choice (RU):** Устроить большой праздник.
- **Response (EN):** The city will smile. Even with empty barns.
- **Response (RU):** Город улыбнётся. Пусть даже с пустеющими амбарами.
- **Effects:** People +20, Treasury -20, Food -15

**Choice 2**
- **Choice (EN):** Have a modest celebration.
- **Choice (RU):** Устроить скромный праздник.
- **Response (EN):** Modest joy is sometimes stronger than luxurious joy.
- **Response (RU):** Скромная радость иногда крепче роскошной.
- **Effects:** People +10, Treasury -8, Food -5

**Choice 3**
- **Choice (EN):** Ban holidays until stability.
- **Choice (RU):** Запретить праздники до стабильности.
- **Response (EN):** The order has been preserved. Mood - no.
- **Response (RU):** Порядок сохранён. Настроение — нет.
- **Effects:** People -10, Army +5, Treasury +5

**Choice 4**
- **Choice (EN):** Is now the time to celebrate?
- **Choice (RU):** Разве сейчас время для праздника?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Right now. When people hear only orders and funeral bells for a long time, they begin to wait not for the king, but for the end.
**Prompt (RU):** Именно сейчас. Когда люди долго слышат только приказы и похоронные колокола, они начинают ждать не короля, а конца.

**Choice 1**
- **Choice (EN):** A modest holiday for the whole city.
- **Choice (RU):** Скромный праздник для всего города.
- **Response (EN):** Fine. Enough light so that the night doesn't seem forever.
- **Response (RU):** Хорошо. Достаточно света, чтобы ночь не казалась вечной.
- **Effects:** People +10, Treasury -8, Food -5

**Choice 2**
- **Choice (EN):** A holiday with the distribution of bread.
- **Choice (RU):** Праздник с раздачей хлеба.
- **Response (EN):** Expensive. But people will remember the taste of this day.
- **Response (RU):** Дорого. Но народ запомнит вкус этого дня.
- **Effects:** People +25, Treasury -20, Food -20

---

### Encounter #250

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** I can give the treasury gold. In exchange, I want the right to collect tolls on the south bridge. This benefits you now and always benefits me.
**Prompt (RU):** Я могу дать казне золото. Взамен хочу право собирать пошлины на южном мосту. Это выгодно вам сейчас и мне всегда.

**Choice 1**
- **Choice (EN):** Give the bridge away for a month.
- **Choice (RU):** Отдать мост на месяц.
- **Response (EN):** Wonderful. A bridge is not a stone. This is a river of coins.
- **Response (RU):** Прекрасно. Мост — это не камень. Это река монет.
- **Effects:** People -8, Treasury +25, Food +5

**Choice 2**
- **Choice (EN):** Give the bridge away for a week.
- **Choice (RU):** Отдать мост на неделю.
- **Response (EN):** A week is a short excuse to become rich. I can handle it.
- **Response (RU):** Неделя — короткий повод стать богатой. Я справлюсь.
- **Effects:** Treasury +10

**Choice 3**
- **Choice (EN):** Don't give the bridge to merchants.
- **Choice (RU):** Не отдавать мост купцам.
- **Response (EN):** The crown keeps the stones. I'll find another way to gold.
- **Response (RU):** Корона оставляет себе камни. Я найду другой путь к золоту.
- **Effects:** People +5, Treasury -5

**Choice 4**
- **Choice (EN):** Why do you need a bridge?
- **Choice (RU):** Почему вам нужен именно мост?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** Because everything passes through the bridge: grain, salt, rumors, debtors and people who think they know how to hide money.
**Prompt (RU):** Потому что через мост проходит всё: зерно, соль, слухи, должники и люди, которые думают, что умеют прятать деньги.

**Choice 1**
- **Choice (EN):** Give the bridge away for a week and install a caretaker.
- **Choice (RU):** Отдать мост на неделю и поставить смотрителя.
- **Response (EN):** You give me the door, but leave your eye on the lock. Not bad.
- **Response (RU):** Вы даёте мне дверь, но оставляете глаз у замка. Неплохо.
- **Effects:** People -3, Treasury +12

**Choice 2**
- **Choice (EN):** Demand grain instead of gold.
- **Choice (RU):** Потребовать зерно вместо золота.
- **Response (EN):** Bread instead of coins. During the fasting month it is almost the same thing.
- **Response (RU):** Хлеб вместо монет. В голодный месяц это почти одно и то же.
- **Effects:** Treasury +5, Food +20

---

### Encounter #251

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your first decisions are already costing the kingdom blood, gold, bread and trust. Now we need to choose what price we are willing to pay next.
**Prompt (RU):** Ваши первые решения уже стоят королевству крови, золота, хлеба и доверия. Теперь нужно выбрать, какую цену мы готовы платить дальше.

**Choice 1**
- **Choice (EN):** Power rests on the army.
- **Choice (RU):** Власть держится на армии.
- **Response (EN):** The sword will hold the throne. But the sword does not know how to sow grain.
- **Response (RU):** Меч удержит трон. Но меч не умеет сеять хлеб.
- **Effects:** People -10, Army +25, Treasury -10

**Choice 2**
- **Choice (EN):** Power rests on bread.
- **Choice (RU):** Власть держится на хлебе.
- **Response (EN):** Hungry people are dangerous. Well-fed people at least listen.
- **Response (RU):** Голодный народ опасен. Сытый народ хотя бы слушает.
- **Effects:** People +5, Treasury -15, Food +25

**Choice 3**
- **Choice (EN):** Power rests on the treasury.
- **Choice (RU):** Власть держится на казне.
- **Response (EN):** Gold will give us time. But time bought by suffering often ends in screaming.
- **Response (RU):** Золото даст нам время. Но время, купленное страданием, часто заканчивается криком.
- **Effects:** People -10, Treasury +25, Food -10

**Choice 4**
- **Choice (EN):** Power rests on living people.
- **Choice (RU):** Власть держится на живых людях.
- **Response (EN):** Living subjects can still forgive the king. The dead only pursue his name.
- **Response (RU):** Живые подданные ещё могут простить короля. Мёртвые — только преследовать его имя.
- **Effects:** People +25, Treasury -15, Food -5

**Choice 5**
- **Choice (EN):** What if you try to hold on to everything?
- **Choice (RU):** А если попытаться удержать всё?
- **Effects:** No stat change
- **Next node:** 1

#### Node 1

**Prompt (EN):** You can. But kingdoms perish not only from bad decisions. Sometimes they die from good decisions made too late.
**Prompt (RU):** Можно попробовать. Но королевства гибнут не только от плохих решений. Иногда они гибнут от хороших решений, принятых слишком поздно.

**Choice 1**
- **Choice (EN):** Distribute forces equally.
- **Choice (RU):** Распределить силы поровну.
- **Response (EN):** Careful choice. Not great, not disgraceful. Sometimes these are the ones who survive the winter.
- **Response (RU):** Осторожный выбор. Не великий, не позорный. Иногда именно такие переживают зиму.
- **Effects:** People +7, Army +7, Treasury +7, Food +7

**Choice 2**
- **Choice (EN):** No, first the army.
- **Choice (RU):** Нет, сначала армию.
- **Response (EN):** Then let the soldiers remember that they are protecting the kingdom, not just your door.
- **Response (RU):** Тогда пусть солдаты помнят, что защищают королевство, а не только вашу дверь.
- **Effects:** Army +20, Treasury -10, Food -5

**Choice 3**
- **Choice (EN):** No, first the bread.
- **Choice (RU):** Нет, сначала хлеб.
- **Response (EN):** Bread is the king's quietest ally. While it is there.
- **Response (RU):** Хлеб — самый тихий союзник короля. Пока он есть.
- **Effects:** People +5, Treasury -12, Food +20

---

## Nobility Pool
## Пул Знати

### Encounter #252

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, the eastern lords want a seat on the king's council before winter — or they will call your reign a coup of merchants.
**Prompt (RU):** Ваше Величество, восточные лорды требуют места в тайном совете до зимы — иначе назовут ваше правление купеческим переворотом.

**Choice 1**
- **Choice (EN):** Grant Ashford's cousin a seat.
- **Choice (RU):** Дать кузену Эшфорда место в совете.
- **Response (EN):** Then blood buys silence. Efficient, if you can stomach the receipt.
- **Response (RU):** Тогда кровь покупает молчание. Эффективно — если вы готовы принять счёт.
- **Effects:** Treasury -12, Nobility +15

**Choice 2**
- **Choice (EN):** Offer a lesser title without council voice.
- **Choice (RU):** Предложить менее значимый титул без права голоса в совете.
- **Response (EN):** Half a crown for half a loyalty. They will negotiate louder tomorrow.
- **Response (RU):** Полкороны за полверности. Завтра они станут торговаться громче.
- **Effects:** Treasury -5, Nobility +8

---

### Encounter #253

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Your Majesty, a marriage proposal arrived from the Dell house — land for your lawful rule, and your lawful name for the king who took the throne.
**Prompt (RU):** Ваше Величество, из дома Делл прибыло предложение руки — земля в обмен на законность, и законность в обмен на ваше имя того, кто взял трон.

**Choice 1**
- **Choice (EN):** Accept the match.
- **Choice (RU):** Принять союз.
- **Response (EN):** Then ink binds blood. The realm sees a dynasty forming, not a blade.
- **Response (RU):** Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.
- **Effects:** People +5, Treasury -8, Nobility +18

**Choice 2**
- **Choice (EN):** Counter with a trade charter instead.
- **Choice (RU):** Ответить торговой грамотой вместо свадьбы.
- **Response (EN):** Commerce instead of cousins. Cold, but cheaper.
- **Response (RU):** Торговля вместо кузенов. Холодно, но дешевле.
- **Effects:** Treasury +10, Nobility +6, Food -3

---

### Encounter #254

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.
**Prompt (RU):** Ваше Величество, геральдическая канцелярия требует золота за регистрацию вашего герба — иначе на каждых воротах останется герб прежнего короля.

**Choice 1**
- **Choice (EN):** Pay for new heraldry.
- **Choice (RU):** Заплатить за новый герб.
- **Response (EN):** Then your sigil flies before your name is safe. Vanity with purpose.
- **Response (RU):** Тогда ваша эмблема взовьётся раньше, чем имя станет безопасным. Тщеславие с умыслом.
- **Effects:** Treasury -15, Nobility +12

**Choice 2**
- **Choice (EN):** Keep Edwin's crest and claim continuity.
- **Choice (RU):** Оставить герб Эдвина и объявить преемственность.
- **Response (EN):** Dangerous symbolism. The loyalists cheer; the coup soldiers frown.
- **Response (RU):** Опасная символика. Лоялисты ликуют; солдаты переворота хмурятся.
- **Effects:** People -5, Church +5, Army -5, Nobility -8

---

### Encounter #255

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, landless lords camp outside the walls. They want estates from Edwin's seized holdings — or they will fund your enemies.
**Prompt (RU):** Ваше Величество, безземельные лорды разбили лагерь у стен. Они хотят поместья из конфискованных владений Эдвина — иначе будут финансировать ваших врагов.

**Choice 1**
- **Choice (EN):** Grant eastern manors to loyal lords.
- **Choice (RU):** Передать восточные поместья верным лордам.
- **Response (EN):** Land buys swords. The peasants on those manors will scream.
- **Response (RU):** Земля покупает мечи. Крестьяне в тех поместьях завоют.
- **Effects:** People -10, Army +8, Treasury -10, Nobility +15, Food -5

**Choice 2**
- **Choice (EN):** Sell the estates at auction.
- **Choice (RU):** Продать усадьбы с аукциона.
- **Response (EN):** Gold now, grudges later. The treasury breathes.
- **Response (RU):** Золото сейчас, обиды потом. Казна вздохнёт.
- **Effects:** Treasury +20, Nobility -5

---

### Encounter #256

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.
**Prompt (RU):** Ваше Величество, цеховые мастера говорят, что дворянские пошлины душат торговлю. Знать говорит, что богатство цехов душит родословные. Обе стороны ждут вашей подписи.

**Choice 1**
- **Choice (EN):** Side with the guilds — cut noble tariffs.
- **Choice (RU):** Встать на сторону цехов — снизить дворянские пошлины.
- **Response (EN):** Merchants cheer. Great houses plot. Gold flows faster.
- **Response (RU):** Купцы торжествуют. Великие дома плетут заговоры. Золото течёт быстрее.
- **Effects:** People +8, Treasury +12, Nobility -12, Food +5

**Choice 2**
- **Choice (EN):** Side with the nobles — tax the guild halls.
- **Choice (RU):** Встать на сторону знати — обложить цеховые залы налогом.
- **Response (EN):** Blood applauds. Caravans detour. The purse swells.
- **Response (RU):** Знатная кровь аплодирует. Обозы объезжают стороной. Казна пухнет.
- **Effects:** People -5, Treasury +15, Nobility +12, Food -8

---

### Encounter #257

**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд

#### Node 0

**Prompt (EN):** Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.
**Prompt (RU):** Ваше Величество, по дворцу ходит скандальное письмо — ваше имя рядом с именем баронессы. Барон требует удовлетворения или тишины.

**Choice 1**
- **Choice (EN):** Pay for silence.
- **Choice (RU):** Купить молчание.
- **Response (EN):** Gold oils gossip. The story sleeps until someone hungrier wakes it.
- **Response (RU):** Золото смазывает сплетни. История спит, пока кто-то поголоднее её не разбудит.
- **Effects:** Treasury -18, Nobility +8

**Choice 2**
- **Choice (EN):** Publicly deny and punish the scribe.
- **Choice (RU):** Публично опровергнуть и наказать писца.
- **Response (EN):** Hard denial. The court believes you or pretends to.
- **Response (RU):** Жёсткое опровержение. Двор вам верит или делает вид.
- **Effects:** Church -5, Army +5, Nobility +5

---

### Encounter #258

**Character (EN):** Lord Kaspar Vayne
**Character (RU):** Лорд Каспар Вейн

#### Node 0

**Prompt (EN):** Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.
**Prompt (RU):** Ваше Величество, хронист спрашивает, как записать ваше правление в летописях родословных — «восстановление» или «узурпация».

**Choice 1**
- **Choice (EN):** Restoration — Edwin's line failed the realm.
- **Choice (RU):** Восстановление — династия Эдвина предала королевство.
- **Response (EN):** History becomes ally. Living Edwin loyalists become enemies.
- **Response (RU):** История становится союзником. Живые приверженцы Эдвина становятся врагами.
- **Effects:** People -8, Nobility +10

**Choice 2**
- **Choice (EN):** Usurpation — honest ink.
- **Choice (RU):** Узурпация — честные чернила.
- **Response (EN):** Honest and humiliating. Future generations will judge plainly.
- **Response (RU):** Честно и унизительно. Потомки будут судить без прикрас.
- **Effects:** People +5, Nobility -8

---

### Encounter #259

**Character (EN):** Baroness Yvette Crow
**Character (RU):** Баронесса Ивет Кроу

#### Node 0

**Prompt (EN):** Your Majesty, eastern bankers offer a loan against next year's grain tax — if great houses co-sign. They want your word first.
**Prompt (RU):** Ваше Величество, восточные банкиры предлагают ссуду под налог на зерно следующего года — если великие дома поставят поручительство. Сначала они хотят вашего слова.

**Choice 1**
- **Choice (EN):** Sign — let nobles co-sign after.
- **Choice (RU):** Подписать — пусть дворяне поручаются после.
- **Response (EN):** Debt chains crown to elite. Fast gold, slow leash.
- **Response (RU):** Долг привязывает корону к элите. Быстрое золото, медленный поводок.
- **Effects:** Treasury +25, Nobility +8, Food -5

**Choice 2**
- **Choice (EN):** Refuse foreign paper.
- **Choice (RU):** Отказаться от иностранных бумаг.
- **Response (EN):** Independence tastes poor. The army may notice empty coffers.
- **Response (RU):** Независимость имеет горький вкус. Армия может заметить пустую казну.
- **Effects:** Army -5, Treasury -5, Nobility +5

---

### Encounter #260

**Character (EN):** Countess Marianna Dell
**Character (RU):** Графиня Марианна Делл

#### Node 0

**Prompt (EN):** Your Majesty, a young lord challenges your knight to a duel over an insult at feast. The court watches whether law or blood rules.
**Prompt (RU):** Ваше Величество, молодой лорд вызвал вашего рыцаря на поединок за оскорбление на пиру. Двор наблюдает — закон правит или кровь.

**Choice 1**
- **Choice (EN):** Allow the duel — noble custom stands.
- **Choice (RU):** Позволить дуэль — дворянский обычай в силе.
- **Response (EN):** Steel settles what words broke. The commons call it justice.
- **Response (RU):** Сталь решает то, что сломали слова. Простолюдины зовут это правосудием.
- **Effects:** People -5, Army +5, Nobility +10

**Choice 2**
- **Choice (EN):** Forbid duels — crown law above honor.
- **Choice (RU):** Запретить дуэли — закон короны выше чести.
- **Response (EN):** Order wins. Nobles whisper you fear their blades.
- **Response (RU):** Порядок побеждает. Знать шепчет, что вы боитесь их клинков.
- **Effects:** People +5, Army -3, Nobility -8

---

### Encounter #261

**Character (EN):** Chronicler Ilana
**Character (RU):** Хронистка Илана

#### Node 0

**Prompt (EN):** Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.
**Prompt (RU):** Ваше Величество, посол говорит, что северные принцы признают вашу корону, если вы пожалуете пограничное баронство их двоюродному брату.

**Choice 1**
- **Choice (EN):** Grant the barony — buy recognition.
- **Choice (RU):** Пожаловать баронство — купить признание.
- **Response (EN):** Land for a legal claim abroad. The eastern lords will riot.
- **Response (RU):** Земля в обмен на законность за рубежом. Восточные лорды взбунтуются.
- **Effects:** People -8, Army +5, Nobility +12

**Choice 2**
- **Choice (EN):** Refuse — recognition is not for sale.
- **Choice (RU):** Отказать — признание не продаётся.
- **Response (EN):** Pride intact. Diplomacy colder. Soldiers may benefit.
- **Response (RU):** Гордость цела. Дипломатия холоднее. Солдаты, возможно, выиграют.
- **Effects:** Army +8, Nobility -6

---

### Encounter #262

**Character (EN):** Banker Dominic Salt
**Character (RU):** Банкир Доминик Солт

#### Node 0

**Prompt (EN):** Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.
**Prompt (RU):** Ваше Величество, пир повара для великих домов превысил бюджет. Казначей винит дворецкого; дворецкий винит вашу щедрость.

**Choice 1**
- **Choice (EN):** Pay the feast — nobles must see splendor.
- **Choice (RU):** Оплатить пир — знать должна видеть великолепие.
- **Response (EN):** Full tables, empty purse. They toast your name tonight.
- **Response (RU):** Полные столы, пустая казна. Этой ночью они пьют за ваше имя.
- **Effects:** Treasury -20, Nobility +15, Food -5

**Choice 2**
- **Choice (EN):** Serve a modest meal and explain austerity.
- **Choice (RU):** Подать скромную трапезу и объяснить жёсткую экономию.
- **Response (EN):** Thin soup, thick pride. Some lords will respect it.
- **Response (RU):** Жидкий суп, густая гордость. Некоторые лорды это оценят.
- **Effects:** People +5, Treasury +5, Nobility -5, Food +5

---

### Encounter #263

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.
**Prompt (RU):** Ваше Величество, дом Вейн предлагает мечи, если вы лишите Кроу охотничьих прав в королевском лесу.

**Choice 1**
- **Choice (EN):** Revoke Crow's rights.
- **Choice (RU):** Лишить Кроу прав.
- **Response (EN):** One house fed, one house furious. Forests do not vote.
- **Response (RU):** Один дом доволен, другой в ярости. Леса не голосуют.
- **Effects:** People -5, Army +10, Nobility +8

**Choice 2**
- **Choice (EN):** Uphold Crow's ancient charter.
- **Choice (RU):** Отстоять старинную грамоту Кроу.
- **Response (EN):** Tradition wins. Vayne's mercenaries look elsewhere.
- **Response (RU):** Традиция побеждает. Наёмники Вейна ищут другого нанимателя.
- **Effects:** Army -5, Nobility +10

---

### Encounter #264

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.
**Prompt (RU):** Ваше Величество, незаконный сын кузена Эдвина просит о малом титуле — доказательство того, что старая кровь ещё дышит.

**Choice 1**
- **Choice (EN):** Grant a title — buy quiet loyalty.
- **Choice (RU):** Пожаловать титул — купить тихую лояльность.
- **Response (EN):** Cheap nobility. True claimants will notice.
- **Response (RU):** Дешёвое дворянство. Истинные претенденты заметят.
- **Effects:** People -3, Treasury -8, Nobility +12

**Choice 2**
- **Choice (EN):** Refuse — only crown creates peers now.
- **Choice (RU):** Отказать — только корона теперь создаёт пэров.
- **Response (EN):** Hard line. The petitioner's friends become whisperers.
- **Response (RU):** Жёсткая позиция. Друзья просителя превращаются в шептунов.
- **Effects:** Army +3, Nobility -6

---

### Encounter #265

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, the mint master says fake noble seals flood the markets — your face on false decrees.
**Prompt (RU):** Ваше Величество, монетный мастер говорит, что рынки наводнены поддельными дворянскими печатями — ваш лик на фальшивых указах.

**Choice 1**
- **Choice (EN):** Hang the forgers publicly.
- **Choice (RU):** Публично повесить фальшивомонетчиков.
- **Response (EN):** Fear refreshes respect. Merchants tremble honestly.
- **Response (RU):** Страх освежает уважение. Купцы трепещут по-честному.
- **Effects:** People -5, Army +5, Nobility +8

**Choice 2**
- **Choice (EN):** Recall all seals and reissue.
- **Choice (RU):** Отозвать все печати и перевыпустить.
- **Response (EN):** Expensive order. fake seal dies slowly, dies nonetheless.
- **Response (RU):** Дорогостоящий порядок. Фальшивые монеты умирают медленно — но умирают.
- **Effects:** Treasury -15, Nobility +10

---

### Encounter #266

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Your Majesty, Ashford's envoy asks whether you will attend the eastern hunt — or be called too common for noble sport.
**Prompt (RU):** Ваше Величество, посланник Эшфорда спрашивает, прибудете ли вы на восточную охоту — или вас назовут слишком простым для благородной потехи.

**Choice 1**
- **Choice (EN):** Attend the hunt — pay for the honor.
- **Choice (RU):** Принять участие в охоте — заплатить за честь.
- **Response (EN):** Sport buys gossip. You will hear useful things between boars.
- **Response (RU):** Потеха покупает сплетни. Между кабанами вы услышите полезное.
- **Effects:** Treasury -12, Nobility +18

**Choice 2**
- **Choice (EN):** Send a proxy — keep the crown at court.
- **Choice (RU):** Послать доверенное лицо — держать корону при дворе.
- **Response (EN):** Practical snub. They will measure the proxy's rank.
- **Response (RU):** Практичная пощёчина. Они измерят ранг посланника.
- **Effects:** Treasury -5, Nobility +5

---

### Encounter #267

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, two houses dispute a bride's dowry after the groom died in your levy. Both want the crown to judge.
**Prompt (RU):** Ваше Величество, два дома оспаривают приданое невесты — жених погиб в вашем призыве. Оба хотят, чтобы корона рассудила.

**Choice 1**
- **Choice (EN):** Rule for the bride's house.
- **Choice (RU):** Решить в пользу дома невесты.
- **Response (EN):** Mercy seen as weakness or justice, depending on the hall.
- **Response (RU):** Милосердие, которое воспринимают как слабость или правосудие — зависит от зала.
- **Effects:** People +5, Nobility +8

**Choice 2**
- **Choice (EN):** Rule for the groom's house — levy debt owed.
- **Choice (RU):** Решить в пользу дома жениха — долг призыва должен быть уплачен.
- **Response (EN):** Hard law. Soldiers' families cheer.
- **Response (RU):** Жёсткий закон. Семьи солдат ликуют.
- **Effects:** People -5, Army +5, Treasury +8, Nobility +5

---

### Encounter #268

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Your Majesty, the eastern lords want a seat on the king's council before winter — or they will call your reign a coup of merchants.
**Prompt (RU):** Ваше Величество, восточные лорды требуют места в тайном совете до зимы — иначе назовут ваше правление купеческим переворотом.

**Choice 1**
- **Choice (EN):** Grant Ashford's cousin a seat.
- **Choice (RU):** Дать кузену Эшфорда место в совете.
- **Response (EN):** Then blood buys silence. Efficient, if you can stomach the receipt.
- **Response (RU):** Тогда кровь покупает молчание. Эффективно — если вы готовы принять счёт.
- **Effects:** Treasury -12, Nobility +15

**Choice 2**
- **Choice (EN):** Offer a lesser title without council voice.
- **Choice (RU):** Предложить менее значимый титул без права голоса в совете.
- **Response (EN):** Half a crown for half a loyalty. They will negotiate louder tomorrow.
- **Response (RU):** Полкороны за полверности. Завтра они станут торговаться громче.
- **Effects:** Treasury -5, Nobility +8

---

### Encounter #269

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, a marriage proposal arrived from the Dell house — land for your lawful rule, and your lawful name for the king who took the throne.
**Prompt (RU):** Ваше Величество, из дома Делл прибыло предложение руки — земля в обмен на законность, и законность в обмен на ваше имя того, кто взял трон.

**Choice 1**
- **Choice (EN):** Accept the match.
- **Choice (RU):** Принять союз.
- **Response (EN):** Then ink binds blood. The realm sees a dynasty forming, not a blade.
- **Response (RU):** Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.
- **Effects:** People +5, Treasury -8, Nobility +18

**Choice 2**
- **Choice (EN):** Counter with a trade charter instead.
- **Choice (RU):** Ответить торговой грамотой вместо свадьбы.
- **Response (EN):** Commerce instead of cousins. Cold, but cheaper.
- **Response (RU):** Торговля вместо кузенов. Холодно, но дешевле.
- **Effects:** Treasury +10, Nobility +6, Food -3

---

### Encounter #270

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.
**Prompt (RU):** Ваше Величество, геральдическая канцелярия требует золота за регистрацию вашего герба — иначе на каждых воротах останется герб прежнего короля.

**Choice 1**
- **Choice (EN):** Pay for new heraldry.
- **Choice (RU):** Заплатить за новый герб.
- **Response (EN):** Then your sigil flies before your name is safe. Vanity with purpose.
- **Response (RU):** Тогда ваша эмблема взовьётся раньше, чем имя станет безопасным. Тщеславие с умыслом.
- **Effects:** Treasury -15, Nobility +12

**Choice 2**
- **Choice (EN):** Keep Edwin's crest and claim continuity.
- **Choice (RU):** Оставить герб Эдвина и объявить преемственность.
- **Response (EN):** Dangerous symbolism. The loyalists cheer; the coup soldiers frown.
- **Response (RU):** Опасная символика. Лоялисты ликуют; солдаты переворота хмурятся.
- **Effects:** People -5, Church +5, Army -5, Nobility -8

---

### Encounter #271

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, landless lords camp outside the walls. They want estates from Edwin's seized holdings — or they will fund your enemies.
**Prompt (RU):** Ваше Величество, безземельные лорды разбили лагерь у стен. Они хотят поместья из конфискованных владений Эдвина — иначе будут финансировать ваших врагов.

**Choice 1**
- **Choice (EN):** Grant eastern manors to loyal lords.
- **Choice (RU):** Передать восточные поместья верным лордам.
- **Response (EN):** Land buys swords. The peasants on those manors will scream.
- **Response (RU):** Земля покупает мечи. Крестьяне в тех поместьях завоют.
- **Effects:** People -10, Army +8, Treasury -10, Nobility +15, Food -5

**Choice 2**
- **Choice (EN):** Sell the estates at auction.
- **Choice (RU):** Продать усадьбы с аукциона.
- **Response (EN):** Gold now, grudges later. The treasury breathes.
- **Response (RU):** Золото сейчас, обиды потом. Казна вздохнёт.
- **Effects:** Treasury +20, Nobility -5

---

### Encounter #272

**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд

#### Node 0

**Prompt (EN):** Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.
**Prompt (RU):** Ваше Величество, цеховые мастера говорят, что дворянские пошлины душат торговлю. Знать говорит, что богатство цехов душит родословные. Обе стороны ждут вашей подписи.

**Choice 1**
- **Choice (EN):** Side with the guilds — cut noble tariffs.
- **Choice (RU):** Встать на сторону цехов — снизить дворянские пошлины.
- **Response (EN):** Merchants cheer. Great houses plot. Gold flows faster.
- **Response (RU):** Купцы торжествуют. Великие дома плетут заговоры. Золото течёт быстрее.
- **Effects:** People +8, Treasury +12, Nobility -12, Food +5

**Choice 2**
- **Choice (EN):** Side with the nobles — tax the guild halls.
- **Choice (RU):** Встать на сторону знати — обложить цеховые залы налогом.
- **Response (EN):** Blood applauds. Caravans detour. The purse swells.
- **Response (RU):** Знатная кровь аплодирует. Обозы объезжают стороной. Казна пухнет.
- **Effects:** People -5, Treasury +15, Nobility +12, Food -8

---

### Encounter #273

**Character (EN):** Lord Kaspar Vayne
**Character (RU):** Лорд Каспар Вейн

#### Node 0

**Prompt (EN):** Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.
**Prompt (RU):** Ваше Величество, по дворцу ходит скандальное письмо — ваше имя рядом с именем баронессы. Барон требует удовлетворения или тишины.

**Choice 1**
- **Choice (EN):** Pay for silence.
- **Choice (RU):** Купить молчание.
- **Response (EN):** Gold oils gossip. The story sleeps until someone hungrier wakes it.
- **Response (RU):** Золото смазывает сплетни. История спит, пока кто-то поголоднее её не разбудит.
- **Effects:** Treasury -18, Nobility +8

**Choice 2**
- **Choice (EN):** Publicly deny and punish the scribe.
- **Choice (RU):** Публично опровергнуть и наказать писца.
- **Response (EN):** Hard denial. The court believes you or pretends to.
- **Response (RU):** Жёсткое опровержение. Двор вам верит или делает вид.
- **Effects:** Church -5, Army +5, Nobility +5

---

### Encounter #274

**Character (EN):** Baroness Yvette Crow
**Character (RU):** Баронесса Ивет Кроу

#### Node 0

**Prompt (EN):** Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.
**Prompt (RU):** Ваше Величество, хронист спрашивает, как записать ваше правление в летописях родословных — «восстановление» или «узурпация».

**Choice 1**
- **Choice (EN):** Restoration — Edwin's line failed the realm.
- **Choice (RU):** Восстановление — династия Эдвина предала королевство.
- **Response (EN):** History becomes ally. Living Edwin loyalists become enemies.
- **Response (RU):** История становится союзником. Живые приверженцы Эдвина становятся врагами.
- **Effects:** People -8, Nobility +10

**Choice 2**
- **Choice (EN):** Usurpation — honest ink.
- **Choice (RU):** Узурпация — честные чернила.
- **Response (EN):** Honest and humiliating. Future generations will judge plainly.
- **Response (RU):** Честно и унизительно. Потомки будут судить без прикрас.
- **Effects:** People +5, Nobility -8

---

### Encounter #275

**Character (EN):** Countess Marianna Dell
**Character (RU):** Графиня Марианна Делл

#### Node 0

**Prompt (EN):** Your Majesty, eastern bankers offer a loan against next year's grain tax — if great houses co-sign. They want your word first.
**Prompt (RU):** Ваше Величество, восточные банкиры предлагают ссуду под налог на зерно следующего года — если великие дома поставят поручительство. Сначала они хотят вашего слова.

**Choice 1**
- **Choice (EN):** Sign — let nobles co-sign after.
- **Choice (RU):** Подписать — пусть дворяне поручаются после.
- **Response (EN):** Debt chains crown to elite. Fast gold, slow leash.
- **Response (RU):** Долг привязывает корону к элите. Быстрое золото, медленный поводок.
- **Effects:** Treasury +25, Nobility +8, Food -5

**Choice 2**
- **Choice (EN):** Refuse foreign paper.
- **Choice (RU):** Отказаться от иностранных бумаг.
- **Response (EN):** Independence tastes poor. The army may notice empty coffers.
- **Response (RU):** Независимость имеет горький вкус. Армия может заметить пустую казну.
- **Effects:** Army -5, Treasury -5, Nobility +5

---

### Encounter #276

**Character (EN):** Chronicler Ilana
**Character (RU):** Хронистка Илана

#### Node 0

**Prompt (EN):** Your Majesty, a young lord challenges your knight to a duel over an insult at feast. The court watches whether law or blood rules.
**Prompt (RU):** Ваше Величество, молодой лорд вызвал вашего рыцаря на поединок за оскорбление на пиру. Двор наблюдает — закон правит или кровь.

**Choice 1**
- **Choice (EN):** Allow the duel — noble custom stands.
- **Choice (RU):** Позволить дуэль — дворянский обычай в силе.
- **Response (EN):** Steel settles what words broke. The commons call it justice.
- **Response (RU):** Сталь решает то, что сломали слова. Простолюдины зовут это правосудием.
- **Effects:** People -5, Army +5, Nobility +10

**Choice 2**
- **Choice (EN):** Forbid duels — crown law above honor.
- **Choice (RU):** Запретить дуэли — закон короны выше чести.
- **Response (EN):** Order wins. Nobles whisper you fear their blades.
- **Response (RU):** Порядок побеждает. Знать шепчет, что вы боитесь их клинков.
- **Effects:** People +5, Army -3, Nobility -8

---

### Encounter #277

**Character (EN):** Banker Dominic Salt
**Character (RU):** Банкир Доминик Солт

#### Node 0

**Prompt (EN):** Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.
**Prompt (RU):** Ваше Величество, посол говорит, что северные принцы признают вашу корону, если вы пожалуете пограничное баронство их двоюродному брату.

**Choice 1**
- **Choice (EN):** Grant the barony — buy recognition.
- **Choice (RU):** Пожаловать баронство — купить признание.
- **Response (EN):** Land for a legal claim abroad. The eastern lords will riot.
- **Response (RU):** Земля в обмен на законность за рубежом. Восточные лорды взбунтуются.
- **Effects:** People -8, Army +5, Nobility +12

**Choice 2**
- **Choice (EN):** Refuse — recognition is not for sale.
- **Choice (RU):** Отказать — признание не продаётся.
- **Response (EN):** Pride intact. Diplomacy colder. Soldiers may benefit.
- **Response (RU):** Гордость цела. Дипломатия холоднее. Солдаты, возможно, выиграют.
- **Effects:** Army +8, Nobility -6

---

### Encounter #278

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.
**Prompt (RU):** Ваше Величество, пир повара для великих домов превысил бюджет. Казначей винит дворецкого; дворецкий винит вашу щедрость.

**Choice 1**
- **Choice (EN):** Pay the feast — nobles must see splendor.
- **Choice (RU):** Оплатить пир — знать должна видеть великолепие.
- **Response (EN):** Full tables, empty purse. They toast your name tonight.
- **Response (RU):** Полные столы, пустая казна. Этой ночью они пьют за ваше имя.
- **Effects:** Treasury -20, Nobility +15, Food -5

**Choice 2**
- **Choice (EN):** Serve a modest meal and explain austerity.
- **Choice (RU):** Подать скромную трапезу и объяснить жёсткую экономию.
- **Response (EN):** Thin soup, thick pride. Some lords will respect it.
- **Response (RU):** Жидкий суп, густая гордость. Некоторые лорды это оценят.
- **Effects:** People +5, Treasury +5, Nobility -5, Food +5

---

### Encounter #279

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.
**Prompt (RU):** Ваше Величество, дом Вейн предлагает мечи, если вы лишите Кроу охотничьих прав в королевском лесу.

**Choice 1**
- **Choice (EN):** Revoke Crow's rights.
- **Choice (RU):** Лишить Кроу прав.
- **Response (EN):** One house fed, one house furious. Forests do not vote.
- **Response (RU):** Один дом доволен, другой в ярости. Леса не голосуют.
- **Effects:** People -5, Army +10, Nobility +8

**Choice 2**
- **Choice (EN):** Uphold Crow's ancient charter.
- **Choice (RU):** Отстоять старинную грамоту Кроу.
- **Response (EN):** Tradition wins. Vayne's mercenaries look elsewhere.
- **Response (RU):** Традиция побеждает. Наёмники Вейна ищут другого нанимателя.
- **Effects:** Army -5, Nobility +10

---

### Encounter #280

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.
**Prompt (RU):** Ваше Величество, незаконный сын кузена Эдвина просит о малом титуле — доказательство того, что старая кровь ещё дышит.

**Choice 1**
- **Choice (EN):** Grant a title — buy quiet loyalty.
- **Choice (RU):** Пожаловать титул — купить тихую лояльность.
- **Response (EN):** Cheap nobility. True claimants will notice.
- **Response (RU):** Дешёвое дворянство. Истинные претенденты заметят.
- **Effects:** People -3, Treasury -8, Nobility +12

**Choice 2**
- **Choice (EN):** Refuse — only crown creates peers now.
- **Choice (RU):** Отказать — только корона теперь создаёт пэров.
- **Response (EN):** Hard line. The petitioner's friends become whisperers.
- **Response (RU):** Жёсткая позиция. Друзья просителя превращаются в шептунов.
- **Effects:** Army +3, Nobility -6

---

### Encounter #281

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Your Majesty, the mint master says fake noble seals flood the markets — your face on false decrees.
**Prompt (RU):** Ваше Величество, монетный мастер говорит, что рынки наводнены поддельными дворянскими печатями — ваш лик на фальшивых указах.

**Choice 1**
- **Choice (EN):** Hang the forgers publicly.
- **Choice (RU):** Публично повесить фальшивомонетчиков.
- **Response (EN):** Fear refreshes respect. Merchants tremble honestly.
- **Response (RU):** Страх освежает уважение. Купцы трепещут по-честному.
- **Effects:** People -5, Army +5, Nobility +8

**Choice 2**
- **Choice (EN):** Recall all seals and reissue.
- **Choice (RU):** Отозвать все печати и перевыпустить.
- **Response (EN):** Expensive order. fake seal dies slowly, dies nonetheless.
- **Response (RU):** Дорогостоящий порядок. Фальшивые монеты умирают медленно — но умирают.
- **Effects:** Treasury -15, Nobility +10

---

### Encounter #282

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, Ashford's envoy asks whether you will attend the eastern hunt — or be called too common for noble sport.
**Prompt (RU):** Ваше Величество, посланник Эшфорда спрашивает, прибудете ли вы на восточную охоту — или вас назовут слишком простым для благородной потехи.

**Choice 1**
- **Choice (EN):** Attend the hunt — pay for the honor.
- **Choice (RU):** Принять участие в охоте — заплатить за честь.
- **Response (EN):** Sport buys gossip. You will hear useful things between boars.
- **Response (RU):** Потеха покупает сплетни. Между кабанами вы услышите полезное.
- **Effects:** Treasury -12, Nobility +18

**Choice 2**
- **Choice (EN):** Send a proxy — keep the crown at court.
- **Choice (RU):** Послать доверенное лицо — держать корону при дворе.
- **Response (EN):** Practical snub. They will measure the proxy's rank.
- **Response (RU):** Практичная пощёчина. Они измерят ранг посланника.
- **Effects:** Treasury -5, Nobility +5

---

### Encounter #283

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Your Majesty, two houses dispute a bride's dowry after the groom died in your levy. Both want the crown to judge.
**Prompt (RU):** Ваше Величество, два дома оспаривают приданое невесты — жених погиб в вашем призыве. Оба хотят, чтобы корона рассудила.

**Choice 1**
- **Choice (EN):** Rule for the bride's house.
- **Choice (RU):** Решить в пользу дома невесты.
- **Response (EN):** Mercy seen as weakness or justice, depending on the hall.
- **Response (RU):** Милосердие, которое воспринимают как слабость или правосудие — зависит от зала.
- **Effects:** People +5, Nobility +8

**Choice 2**
- **Choice (EN):** Rule for the groom's house — levy debt owed.
- **Choice (RU):** Решить в пользу дома жениха — долг призыва должен быть уплачен.
- **Response (EN):** Hard law. Soldiers' families cheer.
- **Response (RU):** Жёсткий закон. Семьи солдат ликуют.
- **Effects:** People -5, Army +5, Treasury +8, Nobility +5

---

### Encounter #284

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, the eastern lords want a seat on the king's council before winter — or they will call your reign a coup of merchants.
**Prompt (RU):** Ваше Величество, восточные лорды требуют места в тайном совете до зимы — иначе назовут ваше правление купеческим переворотом.

**Choice 1**
- **Choice (EN):** Grant Ashford's cousin a seat.
- **Choice (RU):** Дать кузену Эшфорда место в совете.
- **Response (EN):** Then blood buys silence. Efficient, if you can stomach the receipt.
- **Response (RU):** Тогда кровь покупает молчание. Эффективно — если вы готовы принять счёт.
- **Effects:** Treasury -12, Nobility +15

**Choice 2**
- **Choice (EN):** Offer a lesser title without council voice.
- **Choice (RU):** Предложить менее значимый титул без права голоса в совете.
- **Response (EN):** Half a crown for half a loyalty. They will negotiate louder tomorrow.
- **Response (RU):** Полкороны за полверности. Завтра они станут торговаться громче.
- **Effects:** Treasury -5, Nobility +8

---

### Encounter #285

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, a marriage proposal arrived from the Dell house — land for your lawful rule, and your lawful name for the king who took the throne.
**Prompt (RU):** Ваше Величество, из дома Делл прибыло предложение руки — земля в обмен на законность, и законность в обмен на ваше имя того, кто взял трон.

**Choice 1**
- **Choice (EN):** Accept the match.
- **Choice (RU):** Принять союз.
- **Response (EN):** Then ink binds blood. The realm sees a dynasty forming, not a blade.
- **Response (RU):** Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.
- **Effects:** People +5, Treasury -8, Nobility +18

**Choice 2**
- **Choice (EN):** Counter with a trade charter instead.
- **Choice (RU):** Ответить торговой грамотой вместо свадьбы.
- **Response (EN):** Commerce instead of cousins. Cold, but cheaper.
- **Response (RU):** Торговля вместо кузенов. Холодно, но дешевле.
- **Effects:** Treasury +10, Nobility +6, Food -3

---

### Encounter #286

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.
**Prompt (RU):** Ваше Величество, геральдическая канцелярия требует золота за регистрацию вашего герба — иначе на каждых воротах останется герб прежнего короля.

**Choice 1**
- **Choice (EN):** Pay for new heraldry.
- **Choice (RU):** Заплатить за новый герб.
- **Response (EN):** Then your sigil flies before your name is safe. Vanity with purpose.
- **Response (RU):** Тогда ваша эмблема взовьётся раньше, чем имя станет безопасным. Тщеславие с умыслом.
- **Effects:** Treasury -15, Nobility +12

**Choice 2**
- **Choice (EN):** Keep Edwin's crest and claim continuity.
- **Choice (RU):** Оставить герб Эдвина и объявить преемственность.
- **Response (EN):** Dangerous symbolism. The loyalists cheer; the coup soldiers frown.
- **Response (RU):** Опасная символика. Лоялисты ликуют; солдаты переворота хмурятся.
- **Effects:** People -5, Church +5, Army -5, Nobility -8

---

### Encounter #287

**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд

#### Node 0

**Prompt (EN):** Your Majesty, landless lords camp outside the walls. They want estates from Edwin's seized holdings — or they will fund your enemies.
**Prompt (RU):** Ваше Величество, безземельные лорды разбили лагерь у стен. Они хотят поместья из конфискованных владений Эдвина — иначе будут финансировать ваших врагов.

**Choice 1**
- **Choice (EN):** Grant eastern manors to loyal lords.
- **Choice (RU):** Передать восточные поместья верным лордам.
- **Response (EN):** Land buys swords. The peasants on those manors will scream.
- **Response (RU):** Земля покупает мечи. Крестьяне в тех поместьях завоют.
- **Effects:** People -10, Army +8, Treasury -10, Nobility +15, Food -5

**Choice 2**
- **Choice (EN):** Sell the estates at auction.
- **Choice (RU):** Продать усадьбы с аукциона.
- **Response (EN):** Gold now, grudges later. The treasury breathes.
- **Response (RU):** Золото сейчас, обиды потом. Казна вздохнёт.
- **Effects:** Treasury +20, Nobility -5

---

### Encounter #288

**Character (EN):** Lord Kaspar Vayne
**Character (RU):** Лорд Каспар Вейн

#### Node 0

**Prompt (EN):** Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.
**Prompt (RU):** Ваше Величество, цеховые мастера говорят, что дворянские пошлины душат торговлю. Знать говорит, что богатство цехов душит родословные. Обе стороны ждут вашей подписи.

**Choice 1**
- **Choice (EN):** Side with the guilds — cut noble tariffs.
- **Choice (RU):** Встать на сторону цехов — снизить дворянские пошлины.
- **Response (EN):** Merchants cheer. Great houses plot. Gold flows faster.
- **Response (RU):** Купцы торжествуют. Великие дома плетут заговоры. Золото течёт быстрее.
- **Effects:** People +8, Treasury +12, Nobility -12, Food +5

**Choice 2**
- **Choice (EN):** Side with the nobles — tax the guild halls.
- **Choice (RU):** Встать на сторону знати — обложить цеховые залы налогом.
- **Response (EN):** Blood applauds. Caravans detour. The purse swells.
- **Response (RU):** Знатная кровь аплодирует. Обозы объезжают стороной. Казна пухнет.
- **Effects:** People -5, Treasury +15, Nobility +12, Food -8

---

### Encounter #289

**Character (EN):** Baroness Yvette Crow
**Character (RU):** Баронесса Ивет Кроу

#### Node 0

**Prompt (EN):** Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.
**Prompt (RU):** Ваше Величество, по дворцу ходит скандальное письмо — ваше имя рядом с именем баронессы. Барон требует удовлетворения или тишины.

**Choice 1**
- **Choice (EN):** Pay for silence.
- **Choice (RU):** Купить молчание.
- **Response (EN):** Gold oils gossip. The story sleeps until someone hungrier wakes it.
- **Response (RU):** Золото смазывает сплетни. История спит, пока кто-то поголоднее её не разбудит.
- **Effects:** Treasury -18, Nobility +8

**Choice 2**
- **Choice (EN):** Publicly deny and punish the scribe.
- **Choice (RU):** Публично опровергнуть и наказать писца.
- **Response (EN):** Hard denial. The court believes you or pretends to.
- **Response (RU):** Жёсткое опровержение. Двор вам верит или делает вид.
- **Effects:** Church -5, Army +5, Nobility +5

---

### Encounter #290

**Character (EN):** Countess Marianna Dell
**Character (RU):** Графиня Марианна Делл

#### Node 0

**Prompt (EN):** Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.
**Prompt (RU):** Ваше Величество, хронист спрашивает, как записать ваше правление в летописях родословных — «восстановление» или «узурпация».

**Choice 1**
- **Choice (EN):** Restoration — Edwin's line failed the realm.
- **Choice (RU):** Восстановление — династия Эдвина предала королевство.
- **Response (EN):** History becomes ally. Living Edwin loyalists become enemies.
- **Response (RU):** История становится союзником. Живые приверженцы Эдвина становятся врагами.
- **Effects:** People -8, Nobility +10

**Choice 2**
- **Choice (EN):** Usurpation — honest ink.
- **Choice (RU):** Узурпация — честные чернила.
- **Response (EN):** Honest and humiliating. Future generations will judge plainly.
- **Response (RU):** Честно и унизительно. Потомки будут судить без прикрас.
- **Effects:** People +5, Nobility -8

---

### Encounter #291

**Character (EN):** Chronicler Ilana
**Character (RU):** Хронистка Илана

#### Node 0

**Prompt (EN):** Your Majesty, eastern bankers offer a loan against next year's grain tax — if great houses co-sign. They want your word first.
**Prompt (RU):** Ваше Величество, восточные банкиры предлагают ссуду под налог на зерно следующего года — если великие дома поставят поручительство. Сначала они хотят вашего слова.

**Choice 1**
- **Choice (EN):** Sign — let nobles co-sign after.
- **Choice (RU):** Подписать — пусть дворяне поручаются после.
- **Response (EN):** Debt chains crown to elite. Fast gold, slow leash.
- **Response (RU):** Долг привязывает корону к элите. Быстрое золото, медленный поводок.
- **Effects:** Treasury +25, Nobility +8, Food -5

**Choice 2**
- **Choice (EN):** Refuse foreign paper.
- **Choice (RU):** Отказаться от иностранных бумаг.
- **Response (EN):** Independence tastes poor. The army may notice empty coffers.
- **Response (RU):** Независимость имеет горький вкус. Армия может заметить пустую казну.
- **Effects:** Army -5, Treasury -5, Nobility +5

---

### Encounter #292

**Character (EN):** Banker Dominic Salt
**Character (RU):** Банкир Доминик Солт

#### Node 0

**Prompt (EN):** Your Majesty, a young lord challenges your knight to a duel over an insult at feast. The court watches whether law or blood rules.
**Prompt (RU):** Ваше Величество, молодой лорд вызвал вашего рыцаря на поединок за оскорбление на пиру. Двор наблюдает — закон правит или кровь.

**Choice 1**
- **Choice (EN):** Allow the duel — noble custom stands.
- **Choice (RU):** Позволить дуэль — дворянский обычай в силе.
- **Response (EN):** Steel settles what words broke. The commons call it justice.
- **Response (RU):** Сталь решает то, что сломали слова. Простолюдины зовут это правосудием.
- **Effects:** People -5, Army +5, Nobility +10

**Choice 2**
- **Choice (EN):** Forbid duels — crown law above honor.
- **Choice (RU):** Запретить дуэли — закон короны выше чести.
- **Response (EN):** Order wins. Nobles whisper you fear their blades.
- **Response (RU):** Порядок побеждает. Знать шепчет, что вы боитесь их клинков.
- **Effects:** People +5, Army -3, Nobility -8

---

### Encounter #293

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.
**Prompt (RU):** Ваше Величество, посол говорит, что северные принцы признают вашу корону, если вы пожалуете пограничное баронство их двоюродному брату.

**Choice 1**
- **Choice (EN):** Grant the barony — buy recognition.
- **Choice (RU):** Пожаловать баронство — купить признание.
- **Response (EN):** Land for a legal claim abroad. The eastern lords will riot.
- **Response (RU):** Земля в обмен на законность за рубежом. Восточные лорды взбунтуются.
- **Effects:** People -8, Army +5, Nobility +12

**Choice 2**
- **Choice (EN):** Refuse — recognition is not for sale.
- **Choice (RU):** Отказать — признание не продаётся.
- **Response (EN):** Pride intact. Diplomacy colder. Soldiers may benefit.
- **Response (RU):** Гордость цела. Дипломатия холоднее. Солдаты, возможно, выиграют.
- **Effects:** Army +8, Nobility -6

---

### Encounter #294

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.
**Prompt (RU):** Ваше Величество, пир повара для великих домов превысил бюджет. Казначей винит дворецкого; дворецкий винит вашу щедрость.

**Choice 1**
- **Choice (EN):** Pay the feast — nobles must see splendor.
- **Choice (RU):** Оплатить пир — знать должна видеть великолепие.
- **Response (EN):** Full tables, empty purse. They toast your name tonight.
- **Response (RU):** Полные столы, пустая казна. Этой ночью они пьют за ваше имя.
- **Effects:** Treasury -20, Nobility +15, Food -5

**Choice 2**
- **Choice (EN):** Serve a modest meal and explain austerity.
- **Choice (RU):** Подать скромную трапезу и объяснить жёсткую экономию.
- **Response (EN):** Thin soup, thick pride. Some lords will respect it.
- **Response (RU):** Жидкий суп, густая гордость. Некоторые лорды это оценят.
- **Effects:** People +5, Treasury +5, Nobility -5, Food +5

---

### Encounter #295

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.
**Prompt (RU):** Ваше Величество, дом Вейн предлагает мечи, если вы лишите Кроу охотничьих прав в королевском лесу.

**Choice 1**
- **Choice (EN):** Revoke Crow's rights.
- **Choice (RU):** Лишить Кроу прав.
- **Response (EN):** One house fed, one house furious. Forests do not vote.
- **Response (RU):** Один дом доволен, другой в ярости. Леса не голосуют.
- **Effects:** People -5, Army +10, Nobility +8

**Choice 2**
- **Choice (EN):** Uphold Crow's ancient charter.
- **Choice (RU):** Отстоять старинную грамоту Кроу.
- **Response (EN):** Tradition wins. Vayne's mercenaries look elsewhere.
- **Response (RU):** Традиция побеждает. Наёмники Вейна ищут другого нанимателя.
- **Effects:** Army -5, Nobility +10

---

### Encounter #296

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.
**Prompt (RU):** Ваше Величество, незаконный сын кузена Эдвина просит о малом титуле — доказательство того, что старая кровь ещё дышит.

**Choice 1**
- **Choice (EN):** Grant a title — buy quiet loyalty.
- **Choice (RU):** Пожаловать титул — купить тихую лояльность.
- **Response (EN):** Cheap nobility. True claimants will notice.
- **Response (RU):** Дешёвое дворянство. Истинные претенденты заметят.
- **Effects:** People -3, Treasury -8, Nobility +12

**Choice 2**
- **Choice (EN):** Refuse — only crown creates peers now.
- **Choice (RU):** Отказать — только корона теперь создаёт пэров.
- **Response (EN):** Hard line. The petitioner's friends become whisperers.
- **Response (RU):** Жёсткая позиция. Друзья просителя превращаются в шептунов.
- **Effects:** Army +3, Nobility -6

---

### Encounter #297

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, the mint master says fake noble seals flood the markets — your face on false decrees.
**Prompt (RU):** Ваше Величество, монетный мастер говорит, что рынки наводнены поддельными дворянскими печатями — ваш лик на фальшивых указах.

**Choice 1**
- **Choice (EN):** Hang the forgers publicly.
- **Choice (RU):** Публично повесить фальшивомонетчиков.
- **Response (EN):** Fear refreshes respect. Merchants tremble honestly.
- **Response (RU):** Страх освежает уважение. Купцы трепещут по-честному.
- **Effects:** People -5, Army +5, Nobility +8

**Choice 2**
- **Choice (EN):** Recall all seals and reissue.
- **Choice (RU):** Отозвать все печати и перевыпустить.
- **Response (EN):** Expensive order. fake seal dies slowly, dies nonetheless.
- **Response (RU):** Дорогостоящий порядок. Фальшивые монеты умирают медленно — но умирают.
- **Effects:** Treasury -15, Nobility +10

---

### Encounter #298

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Your Majesty, Ashford's envoy asks whether you will attend the eastern hunt — or be called too common for noble sport.
**Prompt (RU):** Ваше Величество, посланник Эшфорда спрашивает, прибудете ли вы на восточную охоту — или вас назовут слишком простым для благородной потехи.

**Choice 1**
- **Choice (EN):** Attend the hunt — pay for the honor.
- **Choice (RU):** Принять участие в охоте — заплатить за честь.
- **Response (EN):** Sport buys gossip. You will hear useful things between boars.
- **Response (RU):** Потеха покупает сплетни. Между кабанами вы услышите полезное.
- **Effects:** Treasury -12, Nobility +18

**Choice 2**
- **Choice (EN):** Send a proxy — keep the crown at court.
- **Choice (RU):** Послать доверенное лицо — держать корону при дворе.
- **Response (EN):** Practical snub. They will measure the proxy's rank.
- **Response (RU):** Практичная пощёчина. Они измерят ранг посланника.
- **Effects:** Treasury -5, Nobility +5

---

### Encounter #299

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, two houses dispute a bride's dowry after the groom died in your levy. Both want the crown to judge.
**Prompt (RU):** Ваше Величество, два дома оспаривают приданое невесты — жених погиб в вашем призыве. Оба хотят, чтобы корона рассудила.

**Choice 1**
- **Choice (EN):** Rule for the bride's house.
- **Choice (RU):** Решить в пользу дома невесты.
- **Response (EN):** Mercy seen as weakness or justice, depending on the hall.
- **Response (RU):** Милосердие, которое воспринимают как слабость или правосудие — зависит от зала.
- **Effects:** People +5, Nobility +8

**Choice 2**
- **Choice (EN):** Rule for the groom's house — levy debt owed.
- **Choice (RU):** Решить в пользу дома жениха — долг призыва должен быть уплачен.
- **Response (EN):** Hard law. Soldiers' families cheer.
- **Response (RU):** Жёсткий закон. Семьи солдат ликуют.
- **Effects:** People -5, Army +5, Treasury +8, Nobility +5

---

### Encounter #300

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, the eastern lords want a seat on the king's council before winter — or they will call your reign a coup of merchants.
**Prompt (RU):** Ваше Величество, восточные лорды требуют места в тайном совете до зимы — иначе назовут ваше правление купеческим переворотом.

**Choice 1**
- **Choice (EN):** Grant Ashford's cousin a seat.
- **Choice (RU):** Дать кузену Эшфорда место в совете.
- **Response (EN):** Then blood buys silence. Efficient, if you can stomach the receipt.
- **Response (RU):** Тогда кровь покупает молчание. Эффективно — если вы готовы принять счёт.
- **Effects:** Treasury -12, Nobility +15

**Choice 2**
- **Choice (EN):** Offer a lesser title without council voice.
- **Choice (RU):** Предложить менее значимый титул без права голоса в совете.
- **Response (EN):** Half a crown for half a loyalty. They will negotiate louder tomorrow.
- **Response (RU):** Полкороны за полверности. Завтра они станут торговаться громче.
- **Effects:** Treasury -5, Nobility +8

---

### Encounter #301

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, a marriage proposal arrived from the Dell house — land for your lawful rule, and your lawful name for the king who took the throne.
**Prompt (RU):** Ваше Величество, из дома Делл прибыло предложение руки — земля в обмен на законность, и законность в обмен на ваше имя того, кто взял трон.

**Choice 1**
- **Choice (EN):** Accept the match.
- **Choice (RU):** Принять союз.
- **Response (EN):** Then ink binds blood. The realm sees a dynasty forming, not a blade.
- **Response (RU):** Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.
- **Effects:** People +5, Treasury -8, Nobility +18

**Choice 2**
- **Choice (EN):** Counter with a trade charter instead.
- **Choice (RU):** Ответить торговой грамотой вместо свадьбы.
- **Response (EN):** Commerce instead of cousins. Cold, but cheaper.
- **Response (RU):** Торговля вместо кузенов. Холодно, но дешевле.
- **Effects:** Treasury +10, Nobility +6, Food -3

---

### Encounter #302

**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд

#### Node 0

**Prompt (EN):** Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.
**Prompt (RU):** Ваше Величество, геральдическая канцелярия требует золота за регистрацию вашего герба — иначе на каждых воротах останется герб прежнего короля.

**Choice 1**
- **Choice (EN):** Pay for new heraldry.
- **Choice (RU):** Заплатить за новый герб.
- **Response (EN):** Then your sigil flies before your name is safe. Vanity with purpose.
- **Response (RU):** Тогда ваша эмблема взовьётся раньше, чем имя станет безопасным. Тщеславие с умыслом.
- **Effects:** Treasury -15, Nobility +12

**Choice 2**
- **Choice (EN):** Keep Edwin's crest and claim continuity.
- **Choice (RU):** Оставить герб Эдвина и объявить преемственность.
- **Response (EN):** Dangerous symbolism. The loyalists cheer; the coup soldiers frown.
- **Response (RU):** Опасная символика. Лоялисты ликуют; солдаты переворота хмурятся.
- **Effects:** People -5, Church +5, Army -5, Nobility -8

---

### Encounter #303

**Character (EN):** Lord Kaspar Vayne
**Character (RU):** Лорд Каспар Вейн

#### Node 0

**Prompt (EN):** Your Majesty, landless lords camp outside the walls. They want estates from Edwin's seized holdings — or they will fund your enemies.
**Prompt (RU):** Ваше Величество, безземельные лорды разбили лагерь у стен. Они хотят поместья из конфискованных владений Эдвина — иначе будут финансировать ваших врагов.

**Choice 1**
- **Choice (EN):** Grant eastern manors to loyal lords.
- **Choice (RU):** Передать восточные поместья верным лордам.
- **Response (EN):** Land buys swords. The peasants on those manors will scream.
- **Response (RU):** Земля покупает мечи. Крестьяне в тех поместьях завоют.
- **Effects:** People -10, Army +8, Treasury -10, Nobility +15, Food -5

**Choice 2**
- **Choice (EN):** Sell the estates at auction.
- **Choice (RU):** Продать усадьбы с аукциона.
- **Response (EN):** Gold now, grudges later. The treasury breathes.
- **Response (RU):** Золото сейчас, обиды потом. Казна вздохнёт.
- **Effects:** Treasury +20, Nobility -5

---

### Encounter #304

**Character (EN):** Baroness Yvette Crow
**Character (RU):** Баронесса Ивет Кроу

#### Node 0

**Prompt (EN):** Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.
**Prompt (RU):** Ваше Величество, цеховые мастера говорят, что дворянские пошлины душат торговлю. Знать говорит, что богатство цехов душит родословные. Обе стороны ждут вашей подписи.

**Choice 1**
- **Choice (EN):** Side with the guilds — cut noble tariffs.
- **Choice (RU):** Встать на сторону цехов — снизить дворянские пошлины.
- **Response (EN):** Merchants cheer. Great houses plot. Gold flows faster.
- **Response (RU):** Купцы торжествуют. Великие дома плетут заговоры. Золото течёт быстрее.
- **Effects:** People +8, Treasury +12, Nobility -12, Food +5

**Choice 2**
- **Choice (EN):** Side with the nobles — tax the guild halls.
- **Choice (RU):** Встать на сторону знати — обложить цеховые залы налогом.
- **Response (EN):** Blood applauds. Caravans detour. The purse swells.
- **Response (RU):** Знатная кровь аплодирует. Обозы объезжают стороной. Казна пухнет.
- **Effects:** People -5, Treasury +15, Nobility +12, Food -8

---

### Encounter #305

**Character (EN):** Countess Marianna Dell
**Character (RU):** Графиня Марианна Делл

#### Node 0

**Prompt (EN):** Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.
**Prompt (RU):** Ваше Величество, по дворцу ходит скандальное письмо — ваше имя рядом с именем баронессы. Барон требует удовлетворения или тишины.

**Choice 1**
- **Choice (EN):** Pay for silence.
- **Choice (RU):** Купить молчание.
- **Response (EN):** Gold oils gossip. The story sleeps until someone hungrier wakes it.
- **Response (RU):** Золото смазывает сплетни. История спит, пока кто-то поголоднее её не разбудит.
- **Effects:** Treasury -18, Nobility +8

**Choice 2**
- **Choice (EN):** Publicly deny and punish the scribe.
- **Choice (RU):** Публично опровергнуть и наказать писца.
- **Response (EN):** Hard denial. The court believes you or pretends to.
- **Response (RU):** Жёсткое опровержение. Двор вам верит или делает вид.
- **Effects:** Church -5, Army +5, Nobility +5

---

### Encounter #306

**Character (EN):** Chronicler Ilana
**Character (RU):** Хронистка Илана

#### Node 0

**Prompt (EN):** Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.
**Prompt (RU):** Ваше Величество, хронист спрашивает, как записать ваше правление в летописях родословных — «восстановление» или «узурпация».

**Choice 1**
- **Choice (EN):** Restoration — Edwin's line failed the realm.
- **Choice (RU):** Восстановление — династия Эдвина предала королевство.
- **Response (EN):** History becomes ally. Living Edwin loyalists become enemies.
- **Response (RU):** История становится союзником. Живые приверженцы Эдвина становятся врагами.
- **Effects:** People -8, Nobility +10

**Choice 2**
- **Choice (EN):** Usurpation — honest ink.
- **Choice (RU):** Узурпация — честные чернила.
- **Response (EN):** Honest and humiliating. Future generations will judge plainly.
- **Response (RU):** Честно и унизительно. Потомки будут судить без прикрас.
- **Effects:** People +5, Nobility -8

---

## Loyalty Pool
## Пул Верности

### Encounter #307

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.
**Prompt (RU):** Ваше Величество, начальник стражи сообщает о шёпоте в казармах — солдаты гадают, кто им платит, если казна снова опустеет.

**Choice 1**
- **Choice (EN):** Double the loyalty oath at muster.
- **Choice (RU):** Удвоить клятву верности на смотре.
- **Response (EN):** Words bind some. Others count coins.
- **Response (RU):** Слова связывают некоторых. Другие считают монеты.
- **Effects:** Army +12, Treasury -8, Loyalty +10

**Choice 2**
- **Choice (EN):** Pay a bonus from the king's private money.
- **Choice (RU):** Выплатить премию из тайной казны.
- **Response (EN):** Gold buys silence in steel. Brief silence.
- **Response (RU):** Золото покупает молчание в стали. Ненадолго.
- **Effects:** Army +15, Treasury -15, Loyalty +8

---

### Encounter #308

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.
**Prompt (RU):** Ваше Величество, кухарская служанка слышала, как двое придворных называли цену за вашу смерть. Она хочет защиты — или золота.

**Choice 1**
- **Choice (EN):** Protect her and investigate quietly.
- **Choice (RU):** Защитить её и тихо расследовать.
- **Response (EN):** Patience catches rats. The court sweats politely.
- **Response (RU):** Терпение ловит крыс. Двор учтиво потеет.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2**
- **Choice (EN):** Pay her and forget the names.
- **Choice (RU):** Заплатить ей и забыть имена.
- **Response (EN):** Cheap insurance. Dangerous if she talks twice.
- **Response (RU):** Дешёвая страховка. Опасно, если она заговорит снова.
- **Effects:** Treasury -10, Loyalty +5

---

### Encounter #309

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.
**Prompt (RU):** Ваше Величество, иностранный шпион предлагает список нелояльных писарей — за монеты и безопасный выход.

**Choice 1**
- **Choice (EN):** Buy the list and purge the clerks.
- **Choice (RU):** Купить список и очистить ряды писарей.
- **Response (EN):** Efficient treachery. The court learns you purchase truth.
- **Response (RU):** Эффективное предательство. Двор узнаёт, что вы покупаете правду.
- **Effects:** Treasury -12, Loyalty +15

**Choice 2**
- **Choice (EN):** Arrest the spy and ignore the list.
- **Choice (RU):** Арестовать шпиона и игнорировать список.
- **Response (EN):** Principle over intelligence. Loyal fools remain hidden.
- **Response (RU):** Принцип против разведки. Скрытые лжецы остаются на месте.
- **Effects:** Army +5, Loyalty +5

---

### Encounter #310

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.
**Prompt (RU):** Ваше Величество, палач говорит, что тюрьмы переполнены людьми, клявшимися именем Эдвина. Ему нужно указание — клинок или помилование.

**Choice 1**
- **Choice (EN):** Execute the ringleaders only.
- **Choice (RU):** Казнить только зачинщиков.
- **Response (EN):** Surgical fear. Mercy seen in the survivors.
- **Response (RU):** Хирургический страх. Выжившие видят милость.
- **Effects:** People -5, Army +5, Loyalty +8

**Choice 2**
- **Choice (EN):** Mass pardon for oaths, not for treason.
- **Choice (RU):** Массовое помилование за клятвы, но не за измену.
- **Response (EN):** Generous line-drawing. Purists will call it chaos.
- **Response (RU):** Великодушная черта. Пуристы назовут это хаосом.
- **Effects:** People +8, Army -5, Loyalty +10

---

### Encounter #311

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.
**Prompt (RU):** Ваше Величество, телохранительница просит отпуск, чтобы навестить деревню — единственный меч между вами и залом спит в стороне.

**Choice 1**
- **Choice (EN):** Grant leave — trust the guard rotation.
- **Choice (RU):** Дать отпуск — доверить ротацию стражи.
- **Response (EN):** Humanity costs risk. The court notes your nerve.
- **Response (RU):** Человечность стоит риска. Двор отмечает вашу выдержку.
- **Effects:** Army -3, Loyalty +8

**Choice 2**
- **Choice (EN):** Refuse — the crown's safety first.
- **Choice (RU):** Отказать — безопасность короны прежде всего.
- **Response (EN):** Safe and cruel. She will remember.
- **Response (RU):** Надёжно и жестоко. Она запомнит.
- **Effects:** Army +5, Loyalty -8

---

### Encounter #312

**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс

#### Node 0

**Prompt (EN):** Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.
**Prompt (RU):** Ваше Величество, монах кормит семьи лоялистов у своих ворот. Стража хочет арестовать их; народ хочет благословить вас за дозволение.

**Choice 1**
- **Choice (EN):** Let the monk feed who he chooses.
- **Choice (RU):** Позволить монаху кормить кого пожелает.
- **Response (EN):** Charity buys whispers of mercy. Malrik frowns.
- **Response (RU):** Милосердие покупает шёпот о снисхождении. Малрик хмурится.
- **Effects:** People +10, Church -5, Health +5, Loyalty +8, Food -5

**Choice 2**
- **Choice (EN):** Arrest Edwin's sympathizers.
- **Choice (RU):** Арестовать сочувствующих Эдвину.
- **Response (EN):** Hard crown. Safer throne. Hungrier streets.
- **Response (RU):** Жёсткая корона. Надёжный трон. Голодные улицы.
- **Effects:** People -12, Church +5, Army +5, Loyalty +5

---

### Encounter #313

**Character (EN):** Bodyguard Raena
**Character (RU):** Телохранитель Раэна

#### Node 0

**Prompt (EN):** Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.
**Prompt (RU):** Ваше Величество, писари казначея продавали слоты аудиенций. Он клянётся в неведении; стражники клянутся обратным.

**Choice 1**
- **Choice (EN):** Hang the clerks, spare the treasurer.
- **Choice (RU):** Повесить писарей, пощадить казначея.
- **Response (EN):** Scapegoats die. The court learns the price of theft.
- **Response (RU):** Козлы отпущения умирают. Двор узнаёт цену воровства.
- **Effects:** Treasury +5, Loyalty +10

**Choice 2**
- **Choice (EN):** Dismiss the treasurer and reform the office.
- **Choice (RU):** Уволить казначея и реформировать службу.
- **Response (EN):** Clean house. Expensive honesty.
- **Response (RU):** Навести порядок. Дорогостоящая честность.
- **Effects:** Treasury -10, Loyalty +12

---

### Encounter #314

**Character (EN):** Sir Otto the Silent
**Character (RU):** Сэр Отто Молчаливый

#### Node 0

**Prompt (EN):** Your Majesty, the silent knight has not spoken in years — today he writes that your chamberlain plots with Ingvar's clerks.
**Prompt (RU):** Ваше Величество, молчаливый рыцарь не говорил годами — сегодня он написал, что ваш камергер плетёт заговор с писарями Ингвара.

**Choice 1**
- **Choice (EN):** Arrest the chamberlain immediately.
- **Choice (RU):** Немедленно арестовать камергера.
- **Response (EN):** Swift stroke. If wrong, you have made a martyr.
- **Response (RU):** Стремительный удар. Если ошибётесь, создадите мученика.
- **Effects:** Army +5, Loyalty +8

**Choice 2**
- **Choice (EN):** Watch quietly for proof.
- **Choice (RU):** Тихо наблюдать в ожидании доказательств.
- **Response (EN):** Patience. The plot may deepen into visibility.
- **Response (RU):** Терпение. Заговор может созреть до видимости.
- **Effects:** Treasury -5, Loyalty +10

---

### Encounter #315

**Character (EN):** Maid Lissa
**Character (RU):** Служанка Лисса

#### Node 0

**Prompt (EN):** Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.
**Prompt (RU):** Ваше Величество, писец обнаружил два варианта вашего последнего указа — один подписанный, один поддельный. Кто-то в скриптории играет на обе стороны.

**Choice 1**
- **Choice (EN):** Seal every scriptorium door and investigate.
- **Choice (RU):** Опечатать все двери скриптория и провести расследование.
- **Response (EN):** Paranoia with cause. Work slows; traitors sweat.
- **Response (RU):** Паранойя с основаниями. Работа замедляется; изменники потеют.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2**
- **Choice (EN):** Execute the junior scribe as warning.
- **Choice (RU):** Казнить младшего писца для острастки.
- **Response (EN):** Fast justice. The guilty may remain.
- **Response (RU):** Быстрое правосудие. Виновный может остаться.
- **Effects:** People -5, Army +3, Loyalty +5

---

### Encounter #316

**Character (EN):** Royal Scribe Osric
**Character (RU):** Королевский писец Осрик

#### Node 0

**Prompt (EN):** Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.
**Prompt (RU):** Ваше Величество, повар поймал пажа, тайно несущего хлеб скрытому узнику в западном крыле. Он хочет знать — ещё есть место милосердию в меню.

**Choice 1**
- **Choice (EN):** Free the prisoner — reward the cook's honesty.
- **Choice (RU):** Освободить узника — вознаградить честность повара.
- **Response (EN):** Mercy visible. Plotters may test your softness.
- **Response (RU):** Милосердие на виду. Заговорщики могут проверить вашу мягкость.
- **Effects:** People +5, Loyalty +10, Food +3

**Choice 2**
- **Choice (EN):** Interrogate the prisoner privately.
- **Choice (RU):** Допросить узника втайне.
- **Response (EN):** Information first. Justice later, maybe.
- **Response (RU):** Сначала информация. Правосудие — потом, может быть.
- **Effects:** Treasury -3, Loyalty +8

---

### Encounter #317

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.
**Prompt (RU):** Ваше Величество, купец предлагает профинансировать тайную личную стражу — верную только вам, а не офицерам Рудольфа.

**Choice 1**
- **Choice (EN):** Accept — a second blade in the shadows.
- **Choice (RU):** Принять — второй клинок в тени.
- **Response (EN):** Personal power grows. The army notices.
- **Response (RU):** Личная власть растёт. Армия замечает.
- **Effects:** Army -8, Treasury -10, Loyalty +15

**Choice 2**
- **Choice (EN):** Refuse — one army, one loyalty.
- **Choice (RU):** Отказать — одна армия, одна верность.
- **Response (EN):** Unity preserved. Personal risk remains.
- **Response (RU):** Единство сохранено. Личный риск остаётся.
- **Effects:** Army +8, Loyalty +5

---

### Encounter #318

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.
**Prompt (RU):** Ваше Величество, лекарь лечит стражника, взявшего взятку, чтобы отвести взгляд во время кражи. Она спрашивает — что заслуживает постели: верность или голод.

**Choice 1**
- **Choice (EN):** Treat him — hunger explains, not excuses.
- **Choice (RU):** Лечить его — голод объясняет, но не оправдывает.
- **Response (EN):** Mercy noted. Guards debate your softness.
- **Response (RU):** Милость замечена. Стража обсуждает вашу мягкость.
- **Effects:** People +5, Army +5, Health +8, Loyalty +8

**Choice 2**
- **Choice (EN):** Turn him over to Varn for discipline.
- **Choice (RU):** Передать его Варну для дисциплины.
- **Response (EN):** Order restored. Fear refreshed.
- **Response (RU):** Порядок восстановлен. Страх освежён.
- **Effects:** People -3, Army +8, Loyalty +10

---

### Encounter #319

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.
**Prompt (RU):** Ваше Величество, Малрик говорит, что исповедальни переполнены грехами придворных против вашей короны. Он предлагает сводки — за защиту церкви.

**Choice 1**
- **Choice (EN):** Accept church reports on disloyalty.
- **Choice (RU):** Принять церковные донесения о нелояльности.
- **Response (EN):** Faith becomes spy. Loyalty measurable, humiliating.
- **Response (RU):** Вера становится шпионом. Верность измерима, унизительна.
- **Effects:** Church +12, Loyalty +10

**Choice 2**
- **Choice (EN):** Refuse — crown does not buy souls' ledgers.
- **Choice (RU):** Отказать — корона не покупает реестры душ.
- **Response (EN):** Independence declared. Blind spots remain.
- **Response (RU):** Независимость объявлена. Слепые пятна остаются.
- **Effects:** Church -8, Loyalty +5

---

### Encounter #320

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?
**Prompt (RU):** Ваше Величество, генерал докладывает, что офицеры пьют за здоровье Эдвина в нижних кабаках. Арестовать, игнорировать или присоединиться с тостом за живого короля?

**Choice 1**
- **Choice (EN):** Arrest the officers.
- **Choice (RU):** Арестовать офицеров.
- **Response (EN):** Discipline restored. Resentment bottled.
- **Response (RU):** Дисциплина восстановлена. Обиды в бутылке.
- **Effects:** People -5, Army +10, Loyalty +8

**Choice 2**
- **Choice (EN):** Ignore — drunk nostalgia is not rebellion.
- **Choice (RU):** Игнорировать — пьяная ностальгия не есть мятеж.
- **Response (EN):** Risk accepted. Cheap peace tonight.
- **Response (RU):** Риск принят. Дешёвый мир этой ночью.
- **Effects:** Army -3, Loyalty +5

---

### Encounter #321

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Your Majesty, a chambermaid refuses to change the sheets in the guest wing — she says the lord there plotted against you at feast.
**Prompt (RU):** Ваше Величество, горничная отказывается менять простыни в гостевом крыле — она говорит, что лорд там плёл заговор против вас на пиру.

**Choice 1**
- **Choice (EN):** Reward her refusal — investigate the lord.
- **Choice (RU):** Вознаградить её отказ — расследовать лорда.
- **Response (EN):** Servants as eyes. Nobles as enemies.
- **Response (RU):** Слуги как глаза. Знать — как враги.
- **Effects:** Treasury -5, Loyalty +10, Nobility +5

**Choice 2**
- **Choice (EN):** Order her to obey or leave service.
- **Choice (RU):** Приказать ей подчиниться или уйти со службы.
- **Response (EN):** Hierarchy enforced. Useful warning silenced.
- **Response (RU):** Иерархия соблюдена. Полезное предупреждение заглушено.
- **Effects:** Army +3, Loyalty -5

---

### Encounter #322

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.
**Prompt (RU):** Ваше Величество, начальник стражи сообщает о шёпоте в казармах — солдаты гадают, кто им платит, если казна снова опустеет.

**Choice 1**
- **Choice (EN):** Double the loyalty oath at muster.
- **Choice (RU):** Удвоить клятву верности на смотре.
- **Response (EN):** Words bind some. Others count coins.
- **Response (RU):** Слова связывают некоторых. Другие считают монеты.
- **Effects:** Army +12, Treasury -8, Loyalty +10

**Choice 2**
- **Choice (EN):** Pay a bonus from the king's private money.
- **Choice (RU):** Выплатить премию из тайной казны.
- **Response (EN):** Gold buys silence in steel. Brief silence.
- **Response (RU):** Золото покупает молчание в стали. Ненадолго.
- **Effects:** Army +15, Treasury -15, Loyalty +8

---

### Encounter #323

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.
**Prompt (RU):** Ваше Величество, кухарская служанка слышала, как двое придворных называли цену за вашу смерть. Она хочет защиты — или золота.

**Choice 1**
- **Choice (EN):** Protect her and investigate quietly.
- **Choice (RU):** Защитить её и тихо расследовать.
- **Response (EN):** Patience catches rats. The court sweats politely.
- **Response (RU):** Терпение ловит крыс. Двор учтиво потеет.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2**
- **Choice (EN):** Pay her and forget the names.
- **Choice (RU):** Заплатить ей и забыть имена.
- **Response (EN):** Cheap insurance. Dangerous if she talks twice.
- **Response (RU):** Дешёвая страховка. Опасно, если она заговорит снова.
- **Effects:** Treasury -10, Loyalty +5

---

### Encounter #324

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.
**Prompt (RU):** Ваше Величество, иностранный шпион предлагает список нелояльных писарей — за монеты и безопасный выход.

**Choice 1**
- **Choice (EN):** Buy the list and purge the clerks.
- **Choice (RU):** Купить список и очистить ряды писарей.
- **Response (EN):** Efficient treachery. The court learns you purchase truth.
- **Response (RU):** Эффективное предательство. Двор узнаёт, что вы покупаете правду.
- **Effects:** Treasury -12, Loyalty +15

**Choice 2**
- **Choice (EN):** Arrest the spy and ignore the list.
- **Choice (RU):** Арестовать шпиона и игнорировать список.
- **Response (EN):** Principle over intelligence. Loyal fools remain hidden.
- **Response (RU):** Принцип против разведки. Скрытые лжецы остаются на месте.
- **Effects:** Army +5, Loyalty +5

---

### Encounter #325

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.
**Prompt (RU):** Ваше Величество, палач говорит, что тюрьмы переполнены людьми, клявшимися именем Эдвина. Ему нужно указание — клинок или помилование.

**Choice 1**
- **Choice (EN):** Execute the ringleaders only.
- **Choice (RU):** Казнить только зачинщиков.
- **Response (EN):** Surgical fear. Mercy seen in the survivors.
- **Response (RU):** Хирургический страх. Выжившие видят милость.
- **Effects:** People -5, Army +5, Loyalty +8

**Choice 2**
- **Choice (EN):** Mass pardon for oaths, not for treason.
- **Choice (RU):** Массовое помилование за клятвы, но не за измену.
- **Response (EN):** Generous line-drawing. Purists will call it chaos.
- **Response (RU):** Великодушная черта. Пуристы назовут это хаосом.
- **Effects:** People +8, Army -5, Loyalty +10

---

### Encounter #326

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.
**Prompt (RU):** Ваше Величество, телохранительница просит отпуск, чтобы навестить деревню — единственный меч между вами и залом спит в стороне.

**Choice 1**
- **Choice (EN):** Grant leave — trust the guard rotation.
- **Choice (RU):** Дать отпуск — доверить ротацию стражи.
- **Response (EN):** Humanity costs risk. The court notes your nerve.
- **Response (RU):** Человечность стоит риска. Двор отмечает вашу выдержку.
- **Effects:** Army -3, Loyalty +8

**Choice 2**
- **Choice (EN):** Refuse — the crown's safety first.
- **Choice (RU):** Отказать — безопасность короны прежде всего.
- **Response (EN):** Safe and cruel. She will remember.
- **Response (RU):** Надёжно и жестоко. Она запомнит.
- **Effects:** Army +5, Loyalty -8

---

### Encounter #327

**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс

#### Node 0

**Prompt (EN):** Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.
**Prompt (RU):** Ваше Величество, монах кормит семьи лоялистов у своих ворот. Стража хочет арестовать их; народ хочет благословить вас за дозволение.

**Choice 1**
- **Choice (EN):** Let the monk feed who he chooses.
- **Choice (RU):** Позволить монаху кормить кого пожелает.
- **Response (EN):** Charity buys whispers of mercy. Malrik frowns.
- **Response (RU):** Милосердие покупает шёпот о снисхождении. Малрик хмурится.
- **Effects:** People +10, Church -5, Health +5, Loyalty +8, Food -5

**Choice 2**
- **Choice (EN):** Arrest Edwin's sympathizers.
- **Choice (RU):** Арестовать сочувствующих Эдвину.
- **Response (EN):** Hard crown. Safer throne. Hungrier streets.
- **Response (RU):** Жёсткая корона. Надёжный трон. Голодные улицы.
- **Effects:** People -12, Church +5, Army +5, Loyalty +5

---

### Encounter #328

**Character (EN):** Bodyguard Raena
**Character (RU):** Телохранитель Раэна

#### Node 0

**Prompt (EN):** Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.
**Prompt (RU):** Ваше Величество, писари казначея продавали слоты аудиенций. Он клянётся в неведении; стражники клянутся обратным.

**Choice 1**
- **Choice (EN):** Hang the clerks, spare the treasurer.
- **Choice (RU):** Повесить писарей, пощадить казначея.
- **Response (EN):** Scapegoats die. The court learns the price of theft.
- **Response (RU):** Козлы отпущения умирают. Двор узнаёт цену воровства.
- **Effects:** Treasury +5, Loyalty +10

**Choice 2**
- **Choice (EN):** Dismiss the treasurer and reform the office.
- **Choice (RU):** Уволить казначея и реформировать службу.
- **Response (EN):** Clean house. Expensive honesty.
- **Response (RU):** Навести порядок. Дорогостоящая честность.
- **Effects:** Treasury -10, Loyalty +12

---

### Encounter #329

**Character (EN):** Sir Otto the Silent
**Character (RU):** Сэр Отто Молчаливый

#### Node 0

**Prompt (EN):** Your Majesty, the silent knight has not spoken in years — today he writes that your chamberlain plots with Ingvar's clerks.
**Prompt (RU):** Ваше Величество, молчаливый рыцарь не говорил годами — сегодня он написал, что ваш камергер плетёт заговор с писарями Ингвара.

**Choice 1**
- **Choice (EN):** Arrest the chamberlain immediately.
- **Choice (RU):** Немедленно арестовать камергера.
- **Response (EN):** Swift stroke. If wrong, you have made a martyr.
- **Response (RU):** Стремительный удар. Если ошибётесь, создадите мученика.
- **Effects:** Army +5, Loyalty +8

**Choice 2**
- **Choice (EN):** Watch quietly for proof.
- **Choice (RU):** Тихо наблюдать в ожидании доказательств.
- **Response (EN):** Patience. The plot may deepen into visibility.
- **Response (RU):** Терпение. Заговор может созреть до видимости.
- **Effects:** Treasury -5, Loyalty +10

---

### Encounter #330

**Character (EN):** Maid Lissa
**Character (RU):** Служанка Лисса

#### Node 0

**Prompt (EN):** Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.
**Prompt (RU):** Ваше Величество, писец обнаружил два варианта вашего последнего указа — один подписанный, один поддельный. Кто-то в скриптории играет на обе стороны.

**Choice 1**
- **Choice (EN):** Seal every scriptorium door and investigate.
- **Choice (RU):** Опечатать все двери скриптория и провести расследование.
- **Response (EN):** Paranoia with cause. Work slows; traitors sweat.
- **Response (RU):** Паранойя с основаниями. Работа замедляется; изменники потеют.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2**
- **Choice (EN):** Execute the junior scribe as warning.
- **Choice (RU):** Казнить младшего писца для острастки.
- **Response (EN):** Fast justice. The guilty may remain.
- **Response (RU):** Быстрое правосудие. Виновный может остаться.
- **Effects:** People -5, Army +3, Loyalty +5

---

### Encounter #331

**Character (EN):** Royal Scribe Osric
**Character (RU):** Королевский писец Осрик

#### Node 0

**Prompt (EN):** Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.
**Prompt (RU):** Ваше Величество, повар поймал пажа, тайно несущего хлеб скрытому узнику в западном крыле. Он хочет знать — ещё есть место милосердию в меню.

**Choice 1**
- **Choice (EN):** Free the prisoner — reward the cook's honesty.
- **Choice (RU):** Освободить узника — вознаградить честность повара.
- **Response (EN):** Mercy visible. Plotters may test your softness.
- **Response (RU):** Милосердие на виду. Заговорщики могут проверить вашу мягкость.
- **Effects:** People +5, Loyalty +10, Food +3

**Choice 2**
- **Choice (EN):** Interrogate the prisoner privately.
- **Choice (RU):** Допросить узника втайне.
- **Response (EN):** Information first. Justice later, maybe.
- **Response (RU):** Сначала информация. Правосудие — потом, может быть.
- **Effects:** Treasury -3, Loyalty +8

---

### Encounter #332

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.
**Prompt (RU):** Ваше Величество, купец предлагает профинансировать тайную личную стражу — верную только вам, а не офицерам Рудольфа.

**Choice 1**
- **Choice (EN):** Accept — a second blade in the shadows.
- **Choice (RU):** Принять — второй клинок в тени.
- **Response (EN):** Personal power grows. The army notices.
- **Response (RU):** Личная власть растёт. Армия замечает.
- **Effects:** Army -8, Treasury -10, Loyalty +15

**Choice 2**
- **Choice (EN):** Refuse — one army, one loyalty.
- **Choice (RU):** Отказать — одна армия, одна верность.
- **Response (EN):** Unity preserved. Personal risk remains.
- **Response (RU):** Единство сохранено. Личный риск остаётся.
- **Effects:** Army +8, Loyalty +5

---

### Encounter #333

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.
**Prompt (RU):** Ваше Величество, лекарь лечит стражника, взявшего взятку, чтобы отвести взгляд во время кражи. Она спрашивает — что заслуживает постели: верность или голод.

**Choice 1**
- **Choice (EN):** Treat him — hunger explains, not excuses.
- **Choice (RU):** Лечить его — голод объясняет, но не оправдывает.
- **Response (EN):** Mercy noted. Guards debate your softness.
- **Response (RU):** Милость замечена. Стража обсуждает вашу мягкость.
- **Effects:** People +5, Army +5, Health +8, Loyalty +8

**Choice 2**
- **Choice (EN):** Turn him over to Varn for discipline.
- **Choice (RU):** Передать его Варну для дисциплины.
- **Response (EN):** Order restored. Fear refreshed.
- **Response (RU):** Порядок восстановлен. Страх освежён.
- **Effects:** People -3, Army +8, Loyalty +10

---

### Encounter #334

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.
**Prompt (RU):** Ваше Величество, Малрик говорит, что исповедальни переполнены грехами придворных против вашей короны. Он предлагает сводки — за защиту церкви.

**Choice 1**
- **Choice (EN):** Accept church reports on disloyalty.
- **Choice (RU):** Принять церковные донесения о нелояльности.
- **Response (EN):** Faith becomes spy. Loyalty measurable, humiliating.
- **Response (RU):** Вера становится шпионом. Верность измерима, унизительна.
- **Effects:** Church +12, Loyalty +10

**Choice 2**
- **Choice (EN):** Refuse — crown does not buy souls' ledgers.
- **Choice (RU):** Отказать — корона не покупает реестры душ.
- **Response (EN):** Independence declared. Blind spots remain.
- **Response (RU):** Независимость объявлена. Слепые пятна остаются.
- **Effects:** Church -8, Loyalty +5

---

### Encounter #335

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?
**Prompt (RU):** Ваше Величество, генерал докладывает, что офицеры пьют за здоровье Эдвина в нижних кабаках. Арестовать, игнорировать или присоединиться с тостом за живого короля?

**Choice 1**
- **Choice (EN):** Arrest the officers.
- **Choice (RU):** Арестовать офицеров.
- **Response (EN):** Discipline restored. Resentment bottled.
- **Response (RU):** Дисциплина восстановлена. Обиды в бутылке.
- **Effects:** People -5, Army +10, Loyalty +8

**Choice 2**
- **Choice (EN):** Ignore — drunk nostalgia is not rebellion.
- **Choice (RU):** Игнорировать — пьяная ностальгия не есть мятеж.
- **Response (EN):** Risk accepted. Cheap peace tonight.
- **Response (RU):** Риск принят. Дешёвый мир этой ночью.
- **Effects:** Army -3, Loyalty +5

---

### Encounter #336

**Character (EN):** Merchant Selena
**Character (RU):** Купчиха Селена

#### Node 0

**Prompt (EN):** Your Majesty, a chambermaid refuses to change the sheets in the guest wing — she says the lord there plotted against you at feast.
**Prompt (RU):** Ваше Величество, горничная отказывается менять простыни в гостевом крыле — она говорит, что лорд там плёл заговор против вас на пиру.

**Choice 1**
- **Choice (EN):** Reward her refusal — investigate the lord.
- **Choice (RU):** Вознаградить её отказ — расследовать лорда.
- **Response (EN):** Servants as eyes. Nobles as enemies.
- **Response (RU):** Слуги как глаза. Знать — как враги.
- **Effects:** Treasury -5, Loyalty +10, Nobility +5

**Choice 2**
- **Choice (EN):** Order her to obey or leave service.
- **Choice (RU):** Приказать ей подчиниться или уйти со службы.
- **Response (EN):** Hierarchy enforced. Useful warning silenced.
- **Response (RU):** Иерархия соблюдена. Полезное предупреждение заглушено.
- **Effects:** Army +3, Loyalty -5

---

### Encounter #337

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.
**Prompt (RU):** Ваше Величество, начальник стражи сообщает о шёпоте в казармах — солдаты гадают, кто им платит, если казна снова опустеет.

**Choice 1**
- **Choice (EN):** Double the loyalty oath at muster.
- **Choice (RU):** Удвоить клятву верности на смотре.
- **Response (EN):** Words bind some. Others count coins.
- **Response (RU):** Слова связывают некоторых. Другие считают монеты.
- **Effects:** Army +12, Treasury -8, Loyalty +10

**Choice 2**
- **Choice (EN):** Pay a bonus from the king's private money.
- **Choice (RU):** Выплатить премию из тайной казны.
- **Response (EN):** Gold buys silence in steel. Brief silence.
- **Response (RU):** Золото покупает молчание в стали. Ненадолго.
- **Effects:** Army +15, Treasury -15, Loyalty +8

---

### Encounter #338

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.
**Prompt (RU):** Ваше Величество, кухарская служанка слышала, как двое придворных называли цену за вашу смерть. Она хочет защиты — или золота.

**Choice 1**
- **Choice (EN):** Protect her and investigate quietly.
- **Choice (RU):** Защитить её и тихо расследовать.
- **Response (EN):** Patience catches rats. The court sweats politely.
- **Response (RU):** Терпение ловит крыс. Двор учтиво потеет.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2**
- **Choice (EN):** Pay her and forget the names.
- **Choice (RU):** Заплатить ей и забыть имена.
- **Response (EN):** Cheap insurance. Dangerous if she talks twice.
- **Response (RU):** Дешёвая страховка. Опасно, если она заговорит снова.
- **Effects:** Treasury -10, Loyalty +5

---

### Encounter #339

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.
**Prompt (RU):** Ваше Величество, иностранный шпион предлагает список нелояльных писарей — за монеты и безопасный выход.

**Choice 1**
- **Choice (EN):** Buy the list and purge the clerks.
- **Choice (RU):** Купить список и очистить ряды писарей.
- **Response (EN):** Efficient treachery. The court learns you purchase truth.
- **Response (RU):** Эффективное предательство. Двор узнаёт, что вы покупаете правду.
- **Effects:** Treasury -12, Loyalty +15

**Choice 2**
- **Choice (EN):** Arrest the spy and ignore the list.
- **Choice (RU):** Арестовать шпиона и игнорировать список.
- **Response (EN):** Principle over intelligence. Loyal fools remain hidden.
- **Response (RU):** Принцип против разведки. Скрытые лжецы остаются на месте.
- **Effects:** Army +5, Loyalty +5

---

### Encounter #340

**Character (EN):** Executioner Morwen
**Character (RU):** Палач Морвен

#### Node 0

**Prompt (EN):** Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.
**Prompt (RU):** Ваше Величество, палач говорит, что тюрьмы переполнены людьми, клявшимися именем Эдвина. Ему нужно указание — клинок или помилование.

**Choice 1**
- **Choice (EN):** Execute the ringleaders only.
- **Choice (RU):** Казнить только зачинщиков.
- **Response (EN):** Surgical fear. Mercy seen in the survivors.
- **Response (RU):** Хирургический страх. Выжившие видят милость.
- **Effects:** People -5, Army +5, Loyalty +8

**Choice 2**
- **Choice (EN):** Mass pardon for oaths, not for treason.
- **Choice (RU):** Массовое помилование за клятвы, но не за измену.
- **Response (EN):** Generous line-drawing. Purists will call it chaos.
- **Response (RU):** Великодушная черта. Пуристы назовут это хаосом.
- **Effects:** People +8, Army -5, Loyalty +10

---

### Encounter #341

**Character (EN):** Cook Gromm
**Character (RU):** Повар Громм

#### Node 0

**Prompt (EN):** Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.
**Prompt (RU):** Ваше Величество, телохранительница просит отпуск, чтобы навестить деревню — единственный меч между вами и залом спит в стороне.

**Choice 1**
- **Choice (EN):** Grant leave — trust the guard rotation.
- **Choice (RU):** Дать отпуск — доверить ротацию стражи.
- **Response (EN):** Humanity costs risk. The court notes your nerve.
- **Response (RU):** Человечность стоит риска. Двор отмечает вашу выдержку.
- **Effects:** Army -3, Loyalty +8

**Choice 2**
- **Choice (EN):** Refuse — the crown's safety first.
- **Choice (RU):** Отказать — безопасность короны прежде всего.
- **Response (EN):** Safe and cruel. She will remember.
- **Response (RU):** Надёжно и жестоко. Она запомнит.
- **Effects:** Army +5, Loyalty -8

---

### Encounter #342

**Character (EN):** Spy Knox
**Character (RU):** Шпион Нокс

#### Node 0

**Prompt (EN):** Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.
**Prompt (RU):** Ваше Величество, монах кормит семьи лоялистов у своих ворот. Стража хочет арестовать их; народ хочет благословить вас за дозволение.

**Choice 1**
- **Choice (EN):** Let the monk feed who he chooses.
- **Choice (RU):** Позволить монаху кормить кого пожелает.
- **Response (EN):** Charity buys whispers of mercy. Malrik frowns.
- **Response (RU):** Милосердие покупает шёпот о снисхождении. Малрик хмурится.
- **Effects:** People +10, Church -5, Health +5, Loyalty +8, Food -5

**Choice 2**
- **Choice (EN):** Arrest Edwin's sympathizers.
- **Choice (RU):** Арестовать сочувствующих Эдвину.
- **Response (EN):** Hard crown. Safer throne. Hungrier streets.
- **Response (RU):** Жёсткая корона. Надёжный трон. Голодные улицы.
- **Effects:** People -12, Church +5, Army +5, Loyalty +5

---

### Encounter #343

**Character (EN):** Bodyguard Raena
**Character (RU):** Телохранитель Раэна

#### Node 0

**Prompt (EN):** Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.
**Prompt (RU):** Ваше Величество, писари казначея продавали слоты аудиенций. Он клянётся в неведении; стражники клянутся обратным.

**Choice 1**
- **Choice (EN):** Hang the clerks, spare the treasurer.
- **Choice (RU):** Повесить писарей, пощадить казначея.
- **Response (EN):** Scapegoats die. The court learns the price of theft.
- **Response (RU):** Козлы отпущения умирают. Двор узнаёт цену воровства.
- **Effects:** Treasury +5, Loyalty +10

**Choice 2**
- **Choice (EN):** Dismiss the treasurer and reform the office.
- **Choice (RU):** Уволить казначея и реформировать службу.
- **Response (EN):** Clean house. Expensive honesty.
- **Response (RU):** Навести порядок. Дорогостоящая честность.
- **Effects:** Treasury -10, Loyalty +12

---

### Encounter #344

**Character (EN):** Sir Otto the Silent
**Character (RU):** Сэр Отто Молчаливый

#### Node 0

**Prompt (EN):** Your Majesty, the silent knight has not spoken in years — today he writes that your chamberlain plots with Ingvar's clerks.
**Prompt (RU):** Ваше Величество, молчаливый рыцарь не говорил годами — сегодня он написал, что ваш камергер плетёт заговор с писарями Ингвара.

**Choice 1**
- **Choice (EN):** Arrest the chamberlain immediately.
- **Choice (RU):** Немедленно арестовать камергера.
- **Response (EN):** Swift stroke. If wrong, you have made a martyr.
- **Response (RU):** Стремительный удар. Если ошибётесь, создадите мученика.
- **Effects:** Army +5, Loyalty +8

**Choice 2**
- **Choice (EN):** Watch quietly for proof.
- **Choice (RU):** Тихо наблюдать в ожидании доказательств.
- **Response (EN):** Patience. The plot may deepen into visibility.
- **Response (RU):** Терпение. Заговор может созреть до видимости.
- **Effects:** Treasury -5, Loyalty +10

---

### Encounter #345

**Character (EN):** Maid Lissa
**Character (RU):** Служанка Лисса

#### Node 0

**Prompt (EN):** Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.
**Prompt (RU):** Ваше Величество, писец обнаружил два варианта вашего последнего указа — один подписанный, один поддельный. Кто-то в скриптории играет на обе стороны.

**Choice 1**
- **Choice (EN):** Seal every scriptorium door and investigate.
- **Choice (RU):** Опечатать все двери скриптория и провести расследование.
- **Response (EN):** Paranoia with cause. Work slows; traitors sweat.
- **Response (RU):** Паранойя с основаниями. Работа замедляется; изменники потеют.
- **Effects:** Treasury -5, Loyalty +12

**Choice 2**
- **Choice (EN):** Execute the junior scribe as warning.
- **Choice (RU):** Казнить младшего писца для острастки.
- **Response (EN):** Fast justice. The guilty may remain.
- **Response (RU):** Быстрое правосудие. Виновный может остаться.
- **Effects:** People -5, Army +3, Loyalty +5

---

### Encounter #346

**Character (EN):** Royal Scribe Osric
**Character (RU):** Королевский писец Осрик

#### Node 0

**Prompt (EN):** Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.
**Prompt (RU):** Ваше Величество, повар поймал пажа, тайно несущего хлеб скрытому узнику в западном крыле. Он хочет знать — ещё есть место милосердию в меню.

**Choice 1**
- **Choice (EN):** Free the prisoner — reward the cook's honesty.
- **Choice (RU):** Освободить узника — вознаградить честность повара.
- **Response (EN):** Mercy visible. Plotters may test your softness.
- **Response (RU):** Милосердие на виду. Заговорщики могут проверить вашу мягкость.
- **Effects:** People +5, Loyalty +10, Food +3

**Choice 2**
- **Choice (EN):** Interrogate the prisoner privately.
- **Choice (RU):** Допросить узника втайне.
- **Response (EN):** Information first. Justice later, maybe.
- **Response (RU):** Сначала информация. Правосудие — потом, может быть.
- **Effects:** Treasury -3, Loyalty +8

---

### Encounter #347

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.
**Prompt (RU):** Ваше Величество, купец предлагает профинансировать тайную личную стражу — верную только вам, а не офицерам Рудольфа.

**Choice 1**
- **Choice (EN):** Accept — a second blade in the shadows.
- **Choice (RU):** Принять — второй клинок в тени.
- **Response (EN):** Personal power grows. The army notices.
- **Response (RU):** Личная власть растёт. Армия замечает.
- **Effects:** Army -8, Treasury -10, Loyalty +15

**Choice 2**
- **Choice (EN):** Refuse — one army, one loyalty.
- **Choice (RU):** Отказать — одна армия, одна верность.
- **Response (EN):** Unity preserved. Personal risk remains.
- **Response (RU):** Единство сохранено. Личный риск остаётся.
- **Effects:** Army +8, Loyalty +5

---

### Encounter #348

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.
**Prompt (RU):** Ваше Величество, лекарь лечит стражника, взявшего взятку, чтобы отвести взгляд во время кражи. Она спрашивает — что заслуживает постели: верность или голод.

**Choice 1**
- **Choice (EN):** Treat him — hunger explains, not excuses.
- **Choice (RU):** Лечить его — голод объясняет, но не оправдывает.
- **Response (EN):** Mercy noted. Guards debate your softness.
- **Response (RU):** Милость замечена. Стража обсуждает вашу мягкость.
- **Effects:** People +5, Army +5, Health +8, Loyalty +8

**Choice 2**
- **Choice (EN):** Turn him over to Varn for discipline.
- **Choice (RU):** Передать его Варну для дисциплины.
- **Response (EN):** Order restored. Fear refreshed.
- **Response (RU):** Порядок восстановлен. Страх освежён.
- **Effects:** People -3, Army +8, Loyalty +10

---

### Encounter #349

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.
**Prompt (RU):** Ваше Величество, Малрик говорит, что исповедальни переполнены грехами придворных против вашей короны. Он предлагает сводки — за защиту церкви.

**Choice 1**
- **Choice (EN):** Accept church reports on disloyalty.
- **Choice (RU):** Принять церковные донесения о нелояльности.
- **Response (EN):** Faith becomes spy. Loyalty measurable, humiliating.
- **Response (RU):** Вера становится шпионом. Верность измерима, унизительна.
- **Effects:** Church +12, Loyalty +10

**Choice 2**
- **Choice (EN):** Refuse — crown does not buy souls' ledgers.
- **Choice (RU):** Отказать — корона не покупает реестры душ.
- **Response (EN):** Independence declared. Blind spots remain.
- **Response (RU):** Независимость объявлена. Слепые пятна остаются.
- **Effects:** Church -8, Loyalty +5

---

### Encounter #350

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?
**Prompt (RU):** Ваше Величество, генерал докладывает, что офицеры пьют за здоровье Эдвина в нижних кабаках. Арестовать, игнорировать или присоединиться с тостом за живого короля?

**Choice 1**
- **Choice (EN):** Arrest the officers.
- **Choice (RU):** Арестовать офицеров.
- **Response (EN):** Discipline restored. Resentment bottled.
- **Response (RU):** Дисциплина восстановлена. Обиды в бутылке.
- **Effects:** People -5, Army +10, Loyalty +8

**Choice 2**
- **Choice (EN):** Ignore — drunk nostalgia is not rebellion.
- **Choice (RU):** Игнорировать — пьяная ностальгия не есть мятеж.
- **Response (EN):** Risk accepted. Cheap peace tonight.
- **Response (RU):** Риск принят. Дешёвый мир этой ночью.
- **Effects:** Army -3, Loyalty +5

---

## Succession Pool
## Пул Преемственности

### Encounter #351

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.
**Prompt (RU):** Ваше Величество, церковь требует обряда преемственности — назовите наследника, иначе они объявят ваше правление временным в литургии.

**Choice 1**
- **Choice (EN):** Name a loyal general as heir.
- **Choice (RU):** Назвать верного генерала наследником.
- **Response (EN):** Steel inherits. Bloodlines scream heresy.
- **Response (RU):** Сталь наследует. Родословные кричат ересь.
- **Effects:** People -8, Church +10, Army +15, Loyalty +5, Nobility -10, Succession +12

**Choice 2**
- **Choice (EN):** Refuse — the living king needs no shadow.
- **Choice (RU):** Отказать — живому королю не нужна тень.
- **Response (EN):** Defiance. Succession whispers grow teeth.
- **Response (RU):** Вызов. Шёпот о преемственности обрастает зубами.
- **Effects:** Church -8, Army +5, Nobility +5, Succession +15

---

### Encounter #352

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.
**Prompt (RU):** Ваше Величество, северные принцы спрашивают, кто унаследует, если вы погибнете в весеннем походе. Им нужен ответ — прежде чем они решат, кто им друг, а кто враг.

**Choice 1**
- **Choice (EN):** Promise the throne passes by council vote.
- **Choice (RU):** Обещать, что трон перейдёт по голосованию совета.
- **Response (EN):** Institutional answer. Weak kings like it.
- **Response (RU):** Институциональный ответ. Слабые короли его любят.
- **Effects:** Army +5, Loyalty +5, Nobility +8, Succession +10

**Choice 2**
- **Choice (EN):** Declare no heir — only conquest decides.
- **Choice (RU):** Объявить отсутствие наследника — только завоевание решает.
- **Response (EN):** Blunt threat. War more likely.
- **Response (RU):** Прямая угроза. Война становится вероятнее.
- **Effects:** People -5, Army +12, Loyalty -5, Nobility -8, Succession +18

---

### Encounter #353

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.
**Prompt (RU):** Ваше Величество, Эдрик говорит, что в законниках описаны три пути преемственности — кровь, выборы и завоевание. Вы воспользовались лишь третьим.

**Choice 1**
- **Choice (EN):** Pursue election by great houses.
- **Choice (RU):** Добиться выборов великими домами.
- **Response (EN):** Lawful rule bought with votes. Ashford smiles.
- **Response (RU):** Право править куплено голосами. Эшфорд улыбается.
- **Effects:** Treasury -10, Loyalty +5, Nobility +15, Succession +10

**Choice 2**
- **Choice (EN):** Pursue blood — find any kin.
- **Choice (RU):** Добиваться крови — найти любого родственника.
- **Response (EN):** Desperate heraldry. Succession stabilizes, maybe.
- **Response (RU):** Отчаянная геральдика. Преемственность, возможно, стабилизируется.
- **Effects:** Treasury -8, Nobility +8, Succession +12

---

### Encounter #354

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, the prophet speaks without being asked: 'When the king who took the throne names no heir, the realm names three.'
**Prompt (RU):** Ваше Величество, пророк говорит без приглашения: «Когда тот, кто взял трон, не называет наследника, королевство называет троих».

**Choice 1**
- **Choice (EN):** Hear him in private.
- **Choice (RU):** Выслушать его наедине.
- **Response (EN):** Omen noted. Court nervous.
- **Response (RU):** Предзнаменование принято. Двор нервничает.
- **Effects:** Church -5, Loyalty +5, Succession +8

**Choice 2**
- **Choice (EN):** Arrest him for threatening succession.
- **Choice (RU):** Арестовать его за угрозу преемственности.
- **Response (EN):** Silence purchased. Rumors cheaper.
- **Response (RU):** Молчание куплено. Слухи дешевле.
- **Effects:** People -5, Church +8, Army +5, Loyalty -5, Succession +12

---

### Encounter #355

**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк

#### Node 0

**Prompt (EN):** Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.
**Prompt (RU):** Ваше Величество, астролог находит пустоту в доме преемственности — он предлагает заполнить её ребёнком, рождённым под счастливой звездой, из провинций.

**Choice 1**
- **Choice (EN):** Adopt the star-named child.
- **Choice (RU):** Усыновить ребёнка звезды.
- **Response (EN):** Myth becomes policy. Peasants cheer.
- **Response (RU):** Миф становится политикой. Крестьяне ликуют.
- **Effects:** People +10, Church +5, Treasury -12, Loyalty +5, Nobility +5, Succession +10

**Choice 2**
- **Choice (EN):** Dismiss astrology from state business.
- **Choice (RU):** Изгнать астрологию из государственных дел.
- **Response (EN):** Rational crown. Superstitious unrest.
- **Response (RU):** Рациональная корона. Суеверные волнения.
- **Effects:** Church -5, Succession +8

---

### Encounter #356

**Character (EN):** Talen
**Character (RU):** Тален

#### Node 0

**Prompt (EN):** Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.
**Prompt (RU):** Ваше Величество, таинственный незнакомец возвращается — не за советом, а чтобы спросить, что вы оставите, когда туман рассеется над вашим правлением.

**Choice 1**
- **Choice (EN):** Promise reform — succession by law.
- **Choice (RU):** Обещать реформы — преемственность по закону.
- **Response (EN):** Hope sold. Enemies price it.
- **Response (RU):** Надежда продана. Враги устанавливают цену.
- **Effects:** People +8, Loyalty +8, Nobility +5, Succession +12

**Choice 2**
- **Choice (EN):** Promise blood — my line or none.
- **Choice (RU):** Обещать кровь — мой род или никакого.
- **Response (EN):** Hard answer. Stability through fear.
- **Response (RU):** Жёсткий ответ. Стабильность через страх.
- **Effects:** People -5, Army +10, Loyalty -5, Succession +15

---

### Encounter #357

**Character (EN):** The Masked One
**Character (RU):** Таинственный в маске

#### Node 0

**Prompt (EN):** Your Majesty, the duke who calls himself a goose demands succession rights because his house 'laid the golden egg of the treasury.'
**Prompt (RU):** Ваше Величество, герцог, именующий себя гусем, требует прав преемственности, ибо его дом «снёс золотое яйцо казны».

**Choice 1**
- **Choice (EN):** Grant a ceremonial title — quiet him.
- **Choice (RU):** Пожаловать церемониальный титул — успокоить его.
- **Response (EN):** Absurdity buys peace. Chroniclers weep.
- **Response (RU):** Абсурд покупает мир. Хронисты плачут.
- **Effects:** Treasury -5, Loyalty +5, Nobility +8, Succession +5

**Choice 2**
- **Choice (EN):** Throw him from court.
- **Choice (RU):** Выставить его из двора.
- **Response (EN):** Laughter and danger. He may return meaner.
- **Response (RU):** Смех и опасность. Он может вернуться злее.
- **Effects:** Army +3, Loyalty -3, Nobility -5, Succession +8

---

### Encounter #358

**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд

#### Node 0

**Prompt (EN):** Your Majesty, Ilana will publish your succession table unless you approve the chapter. She has three drafts — blood, blade, and bargain.
**Prompt (RU):** Ваше Величество, Илана опубликует вашу таблицу преемственности, если вы не одобрите главу. У неё три черновика — кровь, клинок и сделка.

**Choice 1**
- **Choice (EN):** Approve blood chapter.
- **Choice (RU):** Одобрить главу о крови.
- **Response (EN):** Dynasty narrative. Rivals mobilize.
- **Response (RU):** Нарратив династии. Соперники мобилизуются.
- **Effects:** Loyalty +5, Nobility +10, Succession +12

**Choice 2**
- **Choice (EN):** Approve blade chapter.
- **Choice (RU):** Одобрить главу о клинке.
- **Response (EN):** Honest king who took the throne myth. Honest unrest.
- **Response (RU):** Честный миф того, кто взял трон. Честные волнения.
- **Effects:** People -5, Army +8, Nobility -5, Succession +15

---

### Encounter #359

**Character (EN):** Duke the Goose
**Character (RU):** Герцог Гусь

#### Node 0

**Prompt (EN):** Your Majesty, Talen sells a rumor that you have named a secret heir. Buy the rumor, spread it, or let it run?
**Prompt (RU):** Ваше Величество, Тален продаёт слух, что вы назвали тайного наследника. Выкупить слух, распустить его или дать идти своим путём?

**Choice 1**
- **Choice (EN):** Buy and bury the rumor.
- **Choice (RU):** Выкупить и заглушить слух.
- **Response (EN):** Quiet coin. Loud questions remain.
- **Response (RU):** Тихие монеты. Громкие вопросы остаются.
- **Effects:** Treasury -15, Loyalty +5, Succession +8

**Choice 2**
- **Choice (EN):** Spread the rumor — stability through lie.
- **Choice (RU):** Распустить слух — стабильность через ложь.
- **Response (EN):** False heir protects true throne. Fragile trick.
- **Response (RU):** Ложный наследник защищает истинный трон. Хрупкая уловка.
- **Effects:** Treasury -8, Loyalty +8, Nobility +5, Succession +10

---

### Encounter #360

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, Ingvar offers to recognize your heir if you recognize his prince's claim to a border duchy after your death.
**Prompt (RU):** Ваше Величество, Ингвар предлагает признать вашего наследника, если вы признаете притязания его принца на пограничное герцогство после вашей смерти.

**Choice 1**
- **Choice (EN):** Accept — succession peace abroad.
- **Choice (RU):** Принять — мир по преемственности за рубежом.
- **Response (EN):** Future sold for present calm.
- **Response (RU):** Будущее продано ради нынешнего покоя.
- **Effects:** Army +5, Nobility +5, Succession -8

**Choice 2**
- **Choice (EN):** Refuse — Loria is not mortgaged.
- **Choice (RU):** Отказать — Лория не заложена.
- **Response (EN):** Pride intact. Northern knives sharpen.
- **Response (RU):** Гордость цела. Северные ножи точатся.
- **Effects:** Army +10, Loyalty +5, Succession +15

---

### Encounter #361

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, Malrik says the cathedral vault holds Edwin's will — unread since the coup. Open it or burn it?
**Prompt (RU):** Ваше Величество, Малрик говорит, что в соборном хранилище лежит завещание Эдвина — непрочитанное со времён переворота. Вскрыть его или сжечь?

**Choice 1**
- **Choice (EN):** Open the will publicly.
- **Choice (RU):** Вскрыть завещание публично.
- **Response (EN):** Truth ritual. Succession chaos possible.
- **Response (RU):** Ритуал истины. Возможен хаос преемственности.
- **Effects:** Church +12, Nobility -8, Succession +15

**Choice 2**
- **Choice (EN):** Read privately then decide.
- **Choice (RU):** Прочитать в тайне, затем решать.
- **Response (EN):** Knowledge is leverage. Suspicion grows.
- **Response (RU):** Знание — рычаг. Подозрения растут.
- **Effects:** Church +5, Loyalty +5, Succession +8

---

### Encounter #362

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Your Majesty, Arvel says the poor pray for 'a name after the king who took the throne.' Give them a name or give them bread?
**Prompt (RU):** Ваше Величество, Арвел говорит, что бедные молятся о «имени после того, кто взял трон». Дать им имя или дать им хлеб?

**Choice 1**
- **Choice (EN):** Announce a public heir.
- **Choice (RU):** Объявить наследника публично.
- **Response (EN):** Name given. Target acquired.
- **Response (RU):** Имя дано. Цель обозначена.
- **Effects:** People +8, Church +5, Loyalty +8, Food -5, Succession +10

**Choice 2**
- **Choice (EN):** Announce grain instead of heirs.
- **Choice (RU):** Объявить о зерне вместо наследников.
- **Response (EN):** Bread now. Succession later.
- **Response (RU):** Хлеб сейчас. Преемственность потом.
- **Effects:** People +12, Treasury -12, Loyalty +5, Food +15, Succession +5

---

### Encounter #363

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, Rudolf wants the succession law to favor generals. The nobles want blood. The church wants rites. You want sleep.
**Prompt (RU):** Ваше Величество, Рудольф хочет, чтобы закон о преемственности благоприятствовал генералам. Знать хочет крови. Церковь хочет обрядов. Вы хотите спать.

**Choice 1**
- **Choice (EN):** Military succession clause.
- **Choice (RU):** Военная статья о преемственности.
- **Response (EN):** Army content. Elite furious.
- **Response (RU):** Армия довольна. Элита в ярости.
- **Effects:** People -5, Army +15, Loyalty +5, Nobility -12, Succession +12

**Choice 2**
- **Choice (EN):** Noble blood clause.
- **Choice (RU):** Статья о дворянской крови.
- **Response (EN):** Houses content. Soldiers wary.
- **Response (RU):** Дома довольны. Солдаты насторожены.
- **Effects:** Army -5, Nobility +15, Succession +10

---

### Encounter #364

**Character (EN):** Chronicler Ilana
**Character (RU):** Хронистка Илана

#### Node 0

**Prompt (EN):** Your Majesty, Borvin proposes taxing empty succession titles — lords pay to keep hypothetical heirs on paper.
**Prompt (RU):** Ваше Величество, Борвин предлагает обложить налогом пустые наследственные титулы — лорды платят за то, чтобы держать гипотетических наследников на бумаге.

**Choice 1**
- **Choice (EN):** Enact the tax.
- **Choice (RU):** Принять налог.
- **Response (EN):** Treasury laughs. Nobility plots.
- **Response (RU):** Казна смеётся. Знать замышляет.
- **Effects:** Treasury +20, Nobility -10, Succession +8

**Choice 2**
- **Choice (EN):** Reject — do not mock blood.
- **Choice (RU):** Отклонить — не глумиться над кровью.
- **Response (EN):** Respect bought. Gold lost.
- **Response (RU):** Уважение куплено. Золото потеряно.
- **Effects:** Treasury -5, Loyalty +5, Nobility +8, Succession +5

---

### Encounter #365

**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд

#### Node 0

**Prompt (EN):** Your Majesty, Mira tends a feverish lord who mutters Edwin's nephew's name. Save him and hear prophecy, or let fever finish the sentence?
**Prompt (RU):** Ваше Величество, Мира лечит лихорадящего лорда, который бормочет имя племянника Эдвина. Спасти его и услышать пророчество — или позволить лихорадке закончить фразу?

**Choice 1**
- **Choice (EN):** Save him — hear what he says.
- **Choice (RU):** Спасти его — услышать, что он говорит.
- **Response (EN):** Life bought. Succession rumor strengthened.
- **Response (RU):** Жизнь куплена. Слух о преемственности окреп.
- **Effects:** Treasury -5, Health +10, Loyalty +5, Succession +12

**Choice 2**
- **Choice (EN):** Let nature finish — fewer claimants.
- **Choice (RU):** Позволить природе закончить — претендентов меньше.
- **Response (EN):** Hard choice. Whispers call it murder.
- **Response (RU):** Жёсткий выбор. Шёпот зовёт это убийством.
- **Effects:** People -8, Loyalty -5, Succession +8

---

### Encounter #366

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, Varn found succession pamphlets in the barracks. Hang the printers, burn the pamphlets, or rewrite them with your heir?
**Prompt (RU):** Ваше Величество, Варн нашёл памфлеты о преемственности в казармах. Повесить печатников, сжечь памфлеты или переписать их с вашим наследником?

**Choice 1**
- **Choice (EN):** Hang the printers.
- **Choice (RU):** Повесить печатников.
- **Response (EN):** Fear stills presses. Martyrs possible.
- **Response (RU):** Страх останавливает прессы. Возможны мученики.
- **Effects:** People -8, Army +8, Loyalty +8, Succession +10

**Choice 2**
- **Choice (EN):** Burn pamphlets only.
- **Choice (RU):** Сжечь только памфлеты.
- **Response (EN):** Softer censorship. Ideas smolder.
- **Response (RU):** Мягкая цензура. Идеи тлеют.
- **Effects:** Army +3, Loyalty +5, Succession +8

---

### Encounter #367

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, Ashford offers to make lawful your line through her house's blood — if succession names her nephew as regent.
**Prompt (RU):** Ваше Величество, Эшфорд предлагает узаконить вашу линию через кровь своего дома — если преемственность назовёт её племянника регентом.

**Choice 1**
- **Choice (EN):** Accept regency bargain.
- **Choice (RU):** Принять регентский торг.
- **Response (EN):** Succession tethered to Ashford. Peace costly.
- **Response (RU):** Преемственность привязана к Эшфорду. Мир дорого стоит.
- **Effects:** Treasury -10, Nobility +18, Succession -5

**Choice 2**
- **Choice (EN):** Refuse — Ashford is not dynasty.
- **Choice (RU):** Отказать — Эшфорд не династия.
- **Response (EN):** Independence kept. Eastern threat returns.
- **Response (RU):** Независимость сохранена. Восточная угроза возвращается.
- **Effects:** Army +8, Loyalty +5, Nobility -10, Succession +15

---

### Encounter #368

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.
**Prompt (RU):** Ваше Величество, церковь требует обряда преемственности — назовите наследника, иначе они объявят ваше правление временным в литургии.

**Choice 1**
- **Choice (EN):** Name a loyal general as heir.
- **Choice (RU):** Назвать верного генерала наследником.
- **Response (EN):** Steel inherits. Bloodlines scream heresy.
- **Response (RU):** Сталь наследует. Родословные кричат ересь.
- **Effects:** People -8, Church +10, Army +15, Loyalty +5, Nobility -10, Succession +12

**Choice 2**
- **Choice (EN):** Refuse — the living king needs no shadow.
- **Choice (RU):** Отказать — живому королю не нужна тень.
- **Response (EN):** Defiance. Succession whispers grow teeth.
- **Response (RU):** Вызов. Шёпот о преемственности обрастает зубами.
- **Effects:** Church -8, Army +5, Nobility +5, Succession +15

---

### Encounter #369

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.
**Prompt (RU):** Ваше Величество, северные принцы спрашивают, кто унаследует, если вы погибнете в весеннем походе. Им нужен ответ — прежде чем они решат, кто им друг, а кто враг.

**Choice 1**
- **Choice (EN):** Promise the throne passes by council vote.
- **Choice (RU):** Обещать, что трон перейдёт по голосованию совета.
- **Response (EN):** Institutional answer. Weak kings like it.
- **Response (RU):** Институциональный ответ. Слабые короли его любят.
- **Effects:** Army +5, Loyalty +5, Nobility +8, Succession +10

**Choice 2**
- **Choice (EN):** Declare no heir — only conquest decides.
- **Choice (RU):** Объявить отсутствие наследника — только завоевание решает.
- **Response (EN):** Blunt threat. War more likely.
- **Response (RU):** Прямая угроза. Война становится вероятнее.
- **Effects:** People -5, Army +12, Loyalty -5, Nobility -8, Succession +18

---

### Encounter #370

**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк

#### Node 0

**Prompt (EN):** Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.
**Prompt (RU):** Ваше Величество, Эдрик говорит, что в законниках описаны три пути преемственности — кровь, выборы и завоевание. Вы воспользовались лишь третьим.

**Choice 1**
- **Choice (EN):** Pursue election by great houses.
- **Choice (RU):** Добиться выборов великими домами.
- **Response (EN):** Lawful rule bought with votes. Ashford smiles.
- **Response (RU):** Право править куплено голосами. Эшфорд улыбается.
- **Effects:** Treasury -10, Loyalty +5, Nobility +15, Succession +10

**Choice 2**
- **Choice (EN):** Pursue blood — find any kin.
- **Choice (RU):** Добиваться крови — найти любого родственника.
- **Response (EN):** Desperate heraldry. Succession stabilizes, maybe.
- **Response (RU):** Отчаянная геральдика. Преемственность, возможно, стабилизируется.
- **Effects:** Treasury -8, Nobility +8, Succession +12

---

### Encounter #371

**Character (EN):** Talen
**Character (RU):** Тален

#### Node 0

**Prompt (EN):** Your Majesty, the prophet speaks without being asked: 'When the king who took the throne names no heir, the realm names three.'
**Prompt (RU):** Ваше Величество, пророк говорит без приглашения: «Когда тот, кто взял трон, не называет наследника, королевство называет троих».

**Choice 1**
- **Choice (EN):** Hear him in private.
- **Choice (RU):** Выслушать его наедине.
- **Response (EN):** Omen noted. Court nervous.
- **Response (RU):** Предзнаменование принято. Двор нервничает.
- **Effects:** Church -5, Loyalty +5, Succession +8

**Choice 2**
- **Choice (EN):** Arrest him for threatening succession.
- **Choice (RU):** Арестовать его за угрозу преемственности.
- **Response (EN):** Silence purchased. Rumors cheaper.
- **Response (RU):** Молчание куплено. Слухи дешевле.
- **Effects:** People -5, Church +8, Army +5, Loyalty -5, Succession +12

---

### Encounter #372

**Character (EN):** The Masked One
**Character (RU):** Таинственный в маске

#### Node 0

**Prompt (EN):** Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.
**Prompt (RU):** Ваше Величество, астролог находит пустоту в доме преемственности — он предлагает заполнить её ребёнком, рождённым под счастливой звездой, из провинций.

**Choice 1**
- **Choice (EN):** Adopt the star-named child.
- **Choice (RU):** Усыновить ребёнка звезды.
- **Response (EN):** Myth becomes policy. Peasants cheer.
- **Response (RU):** Миф становится политикой. Крестьяне ликуют.
- **Effects:** People +10, Church +5, Treasury -12, Loyalty +5, Nobility +5, Succession +10

**Choice 2**
- **Choice (EN):** Dismiss astrology from state business.
- **Choice (RU):** Изгнать астрологию из государственных дел.
- **Response (EN):** Rational crown. Superstitious unrest.
- **Response (RU):** Рациональная корона. Суеверные волнения.
- **Effects:** Church -5, Succession +8

---

### Encounter #373

**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд

#### Node 0

**Prompt (EN):** Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.
**Prompt (RU):** Ваше Величество, таинственный незнакомец возвращается — не за советом, а чтобы спросить, что вы оставите, когда туман рассеется над вашим правлением.

**Choice 1**
- **Choice (EN):** Promise reform — succession by law.
- **Choice (RU):** Обещать реформы — преемственность по закону.
- **Response (EN):** Hope sold. Enemies price it.
- **Response (RU):** Надежда продана. Враги устанавливают цену.
- **Effects:** People +8, Loyalty +8, Nobility +5, Succession +12

**Choice 2**
- **Choice (EN):** Promise blood — my line or none.
- **Choice (RU):** Обещать кровь — мой род или никакого.
- **Response (EN):** Hard answer. Stability through fear.
- **Response (RU):** Жёсткий ответ. Стабильность через страх.
- **Effects:** People -5, Army +10, Loyalty -5, Succession +15

---

### Encounter #374

**Character (EN):** Duke the Goose
**Character (RU):** Герцог Гусь

#### Node 0

**Prompt (EN):** Your Majesty, the duke who calls himself a goose demands succession rights because his house 'laid the golden egg of the treasury.'
**Prompt (RU):** Ваше Величество, герцог, именующий себя гусем, требует прав преемственности, ибо его дом «снёс золотое яйцо казны».

**Choice 1**
- **Choice (EN):** Grant a ceremonial title — quiet him.
- **Choice (RU):** Пожаловать церемониальный титул — успокоить его.
- **Response (EN):** Absurdity buys peace. Chroniclers weep.
- **Response (RU):** Абсурд покупает мир. Хронисты плачут.
- **Effects:** Treasury -5, Loyalty +5, Nobility +8, Succession +5

**Choice 2**
- **Choice (EN):** Throw him from court.
- **Choice (RU):** Выставить его из двора.
- **Response (EN):** Laughter and danger. He may return meaner.
- **Response (RU):** Смех и опасность. Он может вернуться злее.
- **Effects:** Army +3, Loyalty -3, Nobility -5, Succession +8

---

### Encounter #375

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, Ilana will publish your succession table unless you approve the chapter. She has three drafts — blood, blade, and bargain.
**Prompt (RU):** Ваше Величество, Илана опубликует вашу таблицу преемственности, если вы не одобрите главу. У неё три черновика — кровь, клинок и сделка.

**Choice 1**
- **Choice (EN):** Approve blood chapter.
- **Choice (RU):** Одобрить главу о крови.
- **Response (EN):** Dynasty narrative. Rivals mobilize.
- **Response (RU):** Нарратив династии. Соперники мобилизуются.
- **Effects:** Loyalty +5, Nobility +10, Succession +12

**Choice 2**
- **Choice (EN):** Approve blade chapter.
- **Choice (RU):** Одобрить главу о клинке.
- **Response (EN):** Honest king who took the throne myth. Honest unrest.
- **Response (RU):** Честный миф того, кто взял трон. Честные волнения.
- **Effects:** People -5, Army +8, Nobility -5, Succession +15

---

### Encounter #376

**Character (EN):** Treasurer Borvin
**Character (RU):** Казначей Борвин

#### Node 0

**Prompt (EN):** Your Majesty, Talen sells a rumor that you have named a secret heir. Buy the rumor, spread it, or let it run?
**Prompt (RU):** Ваше Величество, Тален продаёт слух, что вы назвали тайного наследника. Выкупить слух, распустить его или дать идти своим путём?

**Choice 1**
- **Choice (EN):** Buy and bury the rumor.
- **Choice (RU):** Выкупить и заглушить слух.
- **Response (EN):** Quiet coin. Loud questions remain.
- **Response (RU):** Тихие монеты. Громкие вопросы остаются.
- **Effects:** Treasury -15, Loyalty +5, Succession +8

**Choice 2**
- **Choice (EN):** Spread the rumor — stability through lie.
- **Choice (RU):** Распустить слух — стабильность через ложь.
- **Response (EN):** False heir protects true throne. Fragile trick.
- **Response (RU):** Ложный наследник защищает истинный трон. Хрупкая уловка.
- **Effects:** Treasury -8, Loyalty +8, Nobility +5, Succession +10

---

### Encounter #377

**Character (EN):** Healer Mira
**Character (RU):** Лекарь Мира

#### Node 0

**Prompt (EN):** Your Majesty, Ingvar offers to recognize your heir if you recognize his prince's claim to a border duchy after your death.
**Prompt (RU):** Ваше Величество, Ингвар предлагает признать вашего наследника, если вы признаете притязания его принца на пограничное герцогство после вашей смерти.

**Choice 1**
- **Choice (EN):** Accept — succession peace abroad.
- **Choice (RU):** Принять — мир по преемственности за рубежом.
- **Response (EN):** Future sold for present calm.
- **Response (RU):** Будущее продано ради нынешнего покоя.
- **Effects:** Army +5, Nobility +5, Succession -8

**Choice 2**
- **Choice (EN):** Refuse — Loria is not mortgaged.
- **Choice (RU):** Отказать — Лория не заложена.
- **Response (EN):** Pride intact. Northern knives sharpen.
- **Response (RU):** Гордость цела. Северные ножи точатся.
- **Effects:** Army +10, Loyalty +5, Succession +15

---

### Encounter #378

**Character (EN):** Captain Varn
**Character (RU):** Капитан Варн

#### Node 0

**Prompt (EN):** Your Majesty, Malrik says the cathedral vault holds Edwin's will — unread since the coup. Open it or burn it?
**Prompt (RU):** Ваше Величество, Малрик говорит, что в соборном хранилище лежит завещание Эдвина — непрочитанное со времён переворота. Вскрыть его или сжечь?

**Choice 1**
- **Choice (EN):** Open the will publicly.
- **Choice (RU):** Вскрыть завещание публично.
- **Response (EN):** Truth ritual. Succession chaos possible.
- **Response (RU):** Ритуал истины. Возможен хаос преемственности.
- **Effects:** Church +12, Nobility -8, Succession +15

**Choice 2**
- **Choice (EN):** Read privately then decide.
- **Choice (RU):** Прочитать в тайне, затем решать.
- **Response (EN):** Knowledge is leverage. Suspicion grows.
- **Response (RU):** Знание — рычаг. Подозрения растут.
- **Effects:** Church +5, Loyalty +5, Succession +8

---

### Encounter #379

**Character (EN):** Chronicler Ilana
**Character (RU):** Хронистка Илана

#### Node 0

**Prompt (EN):** Your Majesty, Arvel says the poor pray for 'a name after the king who took the throne.' Give them a name or give them bread?
**Prompt (RU):** Ваше Величество, Арвел говорит, что бедные молятся о «имени после того, кто взял трон». Дать им имя или дать им хлеб?

**Choice 1**
- **Choice (EN):** Announce a public heir.
- **Choice (RU):** Объявить наследника публично.
- **Response (EN):** Name given. Target acquired.
- **Response (RU):** Имя дано. Цель обозначена.
- **Effects:** People +8, Church +5, Loyalty +8, Food -5, Succession +10

**Choice 2**
- **Choice (EN):** Announce grain instead of heirs.
- **Choice (RU):** Объявить о зерне вместо наследников.
- **Response (EN):** Bread now. Succession later.
- **Response (RU):** Хлеб сейчас. Преемственность потом.
- **Effects:** People +12, Treasury -12, Loyalty +5, Food +15, Succession +5

---

### Encounter #380

**Character (EN):** Lady Ashford
**Character (RU):** Леди Эшфорд

#### Node 0

**Prompt (EN):** Your Majesty, Rudolf wants the succession law to favor generals. The nobles want blood. The church wants rites. You want sleep.
**Prompt (RU):** Ваше Величество, Рудольф хочет, чтобы закон о преемственности благоприятствовал генералам. Знать хочет крови. Церковь хочет обрядов. Вы хотите спать.

**Choice 1**
- **Choice (EN):** Military succession clause.
- **Choice (RU):** Военная статья о преемственности.
- **Response (EN):** Army content. Elite furious.
- **Response (RU):** Армия довольна. Элита в ярости.
- **Effects:** People -5, Army +15, Loyalty +5, Nobility -12, Succession +12

**Choice 2**
- **Choice (EN):** Noble blood clause.
- **Choice (RU):** Статья о дворянской крови.
- **Response (EN):** Houses content. Soldiers wary.
- **Response (RU):** Дома довольны. Солдаты насторожены.
- **Effects:** Army -5, Nobility +15, Succession +10

---

### Encounter #381

**Character (EN):** Old Advisor Edric
**Character (RU):** Старый советник Эдрик

#### Node 0

**Prompt (EN):** Your Majesty, Borvin proposes taxing empty succession titles — lords pay to keep hypothetical heirs on paper.
**Prompt (RU):** Ваше Величество, Борвин предлагает обложить налогом пустые наследственные титулы — лорды платят за то, чтобы держать гипотетических наследников на бумаге.

**Choice 1**
- **Choice (EN):** Enact the tax.
- **Choice (RU):** Принять налог.
- **Response (EN):** Treasury laughs. Nobility plots.
- **Response (RU):** Казна смеётся. Знать замышляет.
- **Effects:** Treasury +20, Nobility -10, Succession +8

**Choice 2**
- **Choice (EN):** Reject — do not mock blood.
- **Choice (RU):** Отклонить — не глумиться над кровью.
- **Response (EN):** Respect bought. Gold lost.
- **Response (RU):** Уважение куплено. Золото потеряно.
- **Effects:** Treasury -5, Loyalty +5, Nobility +8, Succession +5

---

### Encounter #382

**Character (EN):** High Priest Malrik
**Character (RU):** Верховный жрец Малрик

#### Node 0

**Prompt (EN):** Your Majesty, Mira tends a feverish lord who mutters Edwin's nephew's name. Save him and hear prophecy, or let fever finish the sentence?
**Prompt (RU):** Ваше Величество, Мира лечит лихорадящего лорда, который бормочет имя племянника Эдвина. Спасти его и услышать пророчество — или позволить лихорадке закончить фразу?

**Choice 1**
- **Choice (EN):** Save him — hear what he says.
- **Choice (RU):** Спасти его — услышать, что он говорит.
- **Response (EN):** Life bought. Succession rumor strengthened.
- **Response (RU):** Жизнь куплена. Слух о преемственности окреп.
- **Effects:** Treasury -5, Health +10, Loyalty +5, Succession +12

**Choice 2**
- **Choice (EN):** Let nature finish — fewer claimants.
- **Choice (RU):** Позволить природе закончить — претендентов меньше.
- **Response (EN):** Hard choice. Whispers call it murder.
- **Response (RU):** Жёсткий выбор. Шёпот зовёт это убийством.
- **Effects:** People -8, Loyalty -5, Succession +8

---

### Encounter #383

**Character (EN):** Ambassador Ingvar
**Character (RU):** Посол Ингвар

#### Node 0

**Prompt (EN):** Your Majesty, Varn found succession pamphlets in the barracks. Hang the printers, burn the pamphlets, or rewrite them with your heir?
**Prompt (RU):** Ваше Величество, Варн нашёл памфлеты о преемственности в казармах. Повесить печатников, сжечь памфлеты или переписать их с вашим наследником?

**Choice 1**
- **Choice (EN):** Hang the printers.
- **Choice (RU):** Повесить печатников.
- **Response (EN):** Fear stills presses. Martyrs possible.
- **Response (RU):** Страх останавливает прессы. Возможны мученики.
- **Effects:** People -8, Army +8, Loyalty +8, Succession +10

**Choice 2**
- **Choice (EN):** Burn pamphlets only.
- **Choice (RU):** Сжечь только памфлеты.
- **Response (EN):** Softer censorship. Ideas smolder.
- **Response (RU):** Мягкая цензура. Идеи тлеют.
- **Effects:** Army +3, Loyalty +5, Succession +8

---

### Encounter #384

**Character (EN):** Monk Arvel
**Character (RU):** Монах Арвел

#### Node 0

**Prompt (EN):** Your Majesty, Ashford offers to make lawful your line through her house's blood — if succession names her nephew as regent.
**Prompt (RU):** Ваше Величество, Эшфорд предлагает узаконить вашу линию через кровь своего дома — если преемственность назовёт её племянника регентом.

**Choice 1**
- **Choice (EN):** Accept regency bargain.
- **Choice (RU):** Принять регентский торг.
- **Response (EN):** Succession tethered to Ashford. Peace costly.
- **Response (RU):** Преемственность привязана к Эшфорду. Мир дорого стоит.
- **Effects:** Treasury -10, Nobility +18, Succession -5

**Choice 2**
- **Choice (EN):** Refuse — Ashford is not dynasty.
- **Choice (RU):** Отказать — Эшфорд не династия.
- **Response (EN):** Independence kept. Eastern threat returns.
- **Response (RU):** Независимость сохранена. Восточная угроза возвращается.
- **Effects:** Army +8, Loyalty +5, Nobility -10, Succession +15

---

### Encounter #385

**Character (EN):** Nameless Prophet
**Character (RU):** Безымянный пророк

#### Node 0

**Prompt (EN):** Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.
**Prompt (RU):** Ваше Величество, церковь требует обряда преемственности — назовите наследника, иначе они объявят ваше правление временным в литургии.

**Choice 1**
- **Choice (EN):** Name a loyal general as heir.
- **Choice (RU):** Назвать верного генерала наследником.
- **Response (EN):** Steel inherits. Bloodlines scream heresy.
- **Response (RU):** Сталь наследует. Родословные кричат ересь.
- **Effects:** People -8, Church +10, Army +15, Loyalty +5, Nobility -10, Succession +12

**Choice 2**
- **Choice (EN):** Refuse — the living king needs no shadow.
- **Choice (RU):** Отказать — живому королю не нужна тень.
- **Response (EN):** Defiance. Succession whispers grow teeth.
- **Response (RU):** Вызов. Шёпот о преемственности обрастает зубами.
- **Effects:** Church -8, Army +5, Nobility +5, Succession +15

---

### Encounter #386

**Character (EN):** Talen
**Character (RU):** Тален

#### Node 0

**Prompt (EN):** Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.
**Prompt (RU):** Ваше Величество, северные принцы спрашивают, кто унаследует, если вы погибнете в весеннем походе. Им нужен ответ — прежде чем они решат, кто им друг, а кто враг.

**Choice 1**
- **Choice (EN):** Promise the throne passes by council vote.
- **Choice (RU):** Обещать, что трон перейдёт по голосованию совета.
- **Response (EN):** Institutional answer. Weak kings like it.
- **Response (RU):** Институциональный ответ. Слабые короли его любят.
- **Effects:** Army +5, Loyalty +5, Nobility +8, Succession +10

**Choice 2**
- **Choice (EN):** Declare no heir — only conquest decides.
- **Choice (RU):** Объявить отсутствие наследника — только завоевание решает.
- **Response (EN):** Blunt threat. War more likely.
- **Response (RU):** Прямая угроза. Война становится вероятнее.
- **Effects:** People -5, Army +12, Loyalty -5, Nobility -8, Succession +18

---

### Encounter #387

**Character (EN):** The Masked One
**Character (RU):** Таинственный в маске

#### Node 0

**Prompt (EN):** Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.
**Prompt (RU):** Ваше Величество, Эдрик говорит, что в законниках описаны три пути преемственности — кровь, выборы и завоевание. Вы воспользовались лишь третьим.

**Choice 1**
- **Choice (EN):** Pursue election by great houses.
- **Choice (RU):** Добиться выборов великими домами.
- **Response (EN):** Lawful rule bought with votes. Ashford smiles.
- **Response (RU):** Право править куплено голосами. Эшфорд улыбается.
- **Effects:** Treasury -10, Loyalty +5, Nobility +15, Succession +10

**Choice 2**
- **Choice (EN):** Pursue blood — find any kin.
- **Choice (RU):** Добиваться крови — найти любого родственника.
- **Response (EN):** Desperate heraldry. Succession stabilizes, maybe.
- **Response (RU):** Отчаянная геральдика. Преемственность, возможно, стабилизируется.
- **Effects:** Treasury -8, Nobility +8, Succession +12

---

### Encounter #388

**Character (EN):** Astrologer Meribald
**Character (RU):** Астролог Мерибальд

#### Node 0

**Prompt (EN):** Your Majesty, the prophet speaks without being asked: 'When the king who took the throne names no heir, the realm names three.'
**Prompt (RU):** Ваше Величество, пророк говорит без приглашения: «Когда тот, кто взял трон, не называет наследника, королевство называет троих».

**Choice 1**
- **Choice (EN):** Hear him in private.
- **Choice (RU):** Выслушать его наедине.
- **Response (EN):** Omen noted. Court nervous.
- **Response (RU):** Предзнаменование принято. Двор нервничает.
- **Effects:** Church -5, Loyalty +5, Succession +8

**Choice 2**
- **Choice (EN):** Arrest him for threatening succession.
- **Choice (RU):** Арестовать его за угрозу преемственности.
- **Response (EN):** Silence purchased. Rumors cheaper.
- **Response (RU):** Молчание куплено. Слухи дешевле.
- **Effects:** People -5, Church +8, Army +5, Loyalty -5, Succession +12

---

### Encounter #389

**Character (EN):** Duke the Goose
**Character (RU):** Герцог Гусь

#### Node 0

**Prompt (EN):** Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.
**Prompt (RU):** Ваше Величество, астролог находит пустоту в доме преемственности — он предлагает заполнить её ребёнком, рождённым под счастливой звездой, из провинций.

**Choice 1**
- **Choice (EN):** Adopt the star-named child.
- **Choice (RU):** Усыновить ребёнка звезды.
- **Response (EN):** Myth becomes policy. Peasants cheer.
- **Response (RU):** Миф становится политикой. Крестьяне ликуют.
- **Effects:** People +10, Church +5, Treasury -12, Loyalty +5, Nobility +5, Succession +10

**Choice 2**
- **Choice (EN):** Dismiss astrology from state business.
- **Choice (RU):** Изгнать астрологию из государственных дел.
- **Response (EN):** Rational crown. Superstitious unrest.
- **Response (RU):** Рациональная корона. Суеверные волнения.
- **Effects:** Church -5, Succession +8

---

### Encounter #390

**Character (EN):** General Rudolf
**Character (RU):** Генерал Рудольф

#### Node 0

**Prompt (EN):** Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.
**Prompt (RU):** Ваше Величество, таинственный незнакомец возвращается — не за советом, а чтобы спросить, что вы оставите, когда туман рассеется над вашим правлением.

**Choice 1**
- **Choice (EN):** Promise reform — succession by law.
- **Choice (RU):** Обещать реформы — преемственность по закону.
- **Response (EN):** Hope sold. Enemies price it.
- **Response (RU):** Надежда продана. Враги устанавливают цену.
- **Effects:** People +8, Loyalty +8, Nobility +5, Succession +12

**Choice 2**
- **Choice (EN):** Promise blood — my line or none.
- **Choice (RU):** Обещать кровь — мой род или никакого.
- **Response (EN):** Hard answer. Stability through fear.
- **Response (RU):** Жёсткий ответ. Стабильность через страх.
- **Effects:** People -5, Army +10, Loyalty -5, Succession +15

---
