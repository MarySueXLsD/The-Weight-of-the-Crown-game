require engine.core
require constants
require dialogue_types

module arc_encounters_ru public

let public arc0BeatsRu : Encounter[8] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 2,
            characterIdx = CHAR_GROMM,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, знать ждёт первого королевского пира. Но если я накрою стол как положено, городские амбары похудеют.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Устроить роскошный пир", response = "Пир будет таким, что гости забудут голод. Правда, город — нет.", statDeltas = fixed_array(0, 0, 5, -10, 0, 0, 0, -20, 0)),
                        DialogueChoice(choiceText = "Устроить скромный пир", response = "Скромный пир — это когда дворяне всё равно едят, но жалуются тише.", statDeltas = fixed_array(0, 0, 0, -4, 0, 0, 0, -8, 0)),
                        DialogueChoice(choiceText = "Отменить пир и раздать еду бедным", response = "Хлеб внизу оценят больше, чем павлина наверху.", statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)),
                        DialogueChoice(choiceText = "Можно обмануть гостей?", response = "", statDeltas = NO_STAT_CHANGE, nextNodeIdx = 1),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(
                    prompt = "Можно. Дешёвое мясо, дорогой соус, много свечей — и половина гостей решит, что ела редкость.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Сделать дешёвый пир под видом роскошного", response = "Люблю, когда королевская мудрость пахнет чесноком и обманом.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, -5, 0)),
                        DialogueChoice(choiceText = "Нет — пир должен быть настоящим", response = "Будет настоящий. И голод после него тоже.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, -20, 0)),
                        DialogueChoice(choiceText = "Вообще отменить пир", response = "Тогда я приберегу мясо. В наше время это почти государственная измена.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, 5, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_VARN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, двенадцать из моих дворцовых стражников по-прежнему носят знак Эдвина под нагрудником. Я слышал, вы оставили Громма на кухне — мои люди хотят знать, распространяется ли такое же милосердие на старые мечи, или только на старые ложки. Дайте мне приказ, пока они сами себе его не дали.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заменить их", response = "К утру всё будет сделано. Старые станут вас ненавидеть. Новые будут вам обязаны. Такова цена.", statDeltas = fixed_array(0, 0, 10, -5, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Привести их к присяге мне", response = "Я заставлю их присягнуть до рассвета. Если кто откажется — вы услышите об этом от меня первым.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 0, 0, -3)),
                        DialogueChoice(choiceText = "Арестовать зачинщиков", response = "Избирательная сталь. Казармы назовут это справедливостью или злобой — в зависимости от завтрашних пайков.", statDeltas = fixed_array(0, 2, 3, 0, 0, -2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_OSRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, одиннадцать лет я копировал почерк короля Эдвина — и его печать до сих пор отдаёт приказы о зерне, помилованиях и жалованье с моего стола. Я слышал, вы оставили Громма, а Варн сменил стражу. Но грамоты, подписанные именем мёртвого короля, всё ещё покидают эту комнату. Какой из подлогов ваш: печать, писарь или молчание?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Сжечь печать Эдвина", response = "Архивы взбунтуются пергаментом прежде стали. Но трон будет подписывать только вашим именем.", statDeltas = fixed_array(0, 0, 0, 12, 0, -8, 0, 0, 4)),
                        DialogueChoice(choiceText = "Выплатить один сезон", response = "Мягкая посадка. Дорогостоящая. Переписчики используют этот сезон, чтобы плести заговоры или молиться.", statDeltas = fixed_array(0, 0, 0, -10, 0, 3, 0, 0, 2)),
                        DialogueChoice(choiceText = "Расследовать", response = "Тогда мы следуем за воском. Имена всплывут. Некоторые окажутся невиновны. Ни одно не будет дёшево.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ARVEL,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, брат Альдо исповедовал короля Эдвина каждые семь дней — и по-прежнему исповедует, только пустой трон. Я слышал, вы сожгли печать Эдвина или упразднили его призрачные ведомства на прошлой неделе. Трое из них бежали к моим воротам с чернилами Осрика на пальцах. Альдо спрашивает, укрывает ли новый король священников, или только жаждет имён.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Укрыть Альдо", response = "Тогда он останется под моей кровлей и вашим риском. Малрик узнает до заката.", statDeltas = fixed_array(0, 8, 0, 0, 0, 4, 0, 0, -5)),
                        DialogueChoice(choiceText = "Выдать его короне для допроса", response = "Он придёт тихо. То, что он знает о лордах и грехах, могло бы заполнить список для виселицы.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -8, 0, 8)),
                        DialogueChoice(choiceText = "Выслать его", response = "Золото покупает молчание и расстояние. Хватит ли того и другого — зависит от того, как громко он молится в дороге.", statDeltas = fixed_array(0, 3, 0, -8, 0, 0, 0, 0, 3)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_SELENA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, лоялистские дома по-прежнему закупают зерно через мои обозы — платят записками с печатью Эдвина и проклинают ваше имя между кусками. Я слышала, капитан Варн затянул петлю на воротах после того, как вы вычистили его старую стражу. Это сжимает мои маршруты и их кошельки. Желаете вы, чтобы лоялисты голодали, были под наблюдением или были вам проданы?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Захватить лоялистские склады", response = "Голодные враги медлительны. Голодные подданные голосисты. Выбирайте, какой шум вам предпочтительнее.", statDeltas = fixed_array(0, 0, 0, 8, 0, -10, 0, 15, 0)),
                        DialogueChoice(choiceText = "Вести слежку через маршруты Селены", response = "Я продам вам имена, не честь. Помните: я могу продать и ваши, если цена изменится.", statDeltas = fixed_array(0, 0, 0, -6, 0, -3, 0, 0, 10)),
                        DialogueChoice(choiceText = "Игнорировать торговлю лоялистов", response = "Тогда они едят в тени и благодарят Эдвина при свечах. Цену вы не увидите, пока провинция не перестанет платить налоги.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 0, -5, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ORM,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я носил накидку Эдвина у Серого Перевала и ношу вашу теперь — но три роты всё ещё поднимают тост за мёртвого короля в казармах. Я слышал, вы оставили его повара, перековали стражу, урезали писарей и купили имена у Селены — каждую неделю разные посылы. Солдаты следуют за ясностью. Скажите мне: мы чистим братьев, платим им или устраиваем им смотр перед теми, кто их заменил.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Вычистить ветеранские роты", response = "Тогда кровь в казармах до весны. Остальные будут клоняться усерднее — если вы им платите.", statDeltas = fixed_array(0, 0, 12, 0, 0, -12, 0, 0, 6)),
                        DialogueChoice(choiceText = "Откупиться", response = "Дорогостоящий мир. Дешевле мятежа — до следующего пустого кошелька.", statDeltas = fixed_array(0, 0, 8, -18, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Парад помилования", response = "Театр с мечами. Сработает — получите песню. Не сработает — получите бунт.", statDeltas = fixed_array(0, 0, 5, 0, 0, 6, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RAENA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, мой пост — ваша дверь, не двор внизу. Однако Варн присылал сюда узников, аудит Осрика называл имена писарей, и ворота Арвела по-прежнему укрывают шёпоты — если вы не запретили. Я слышала о милосердии на кухнях, стали в казармах, золоте на рынке и молитвах в монастыре. Лестница задаёт более простой вопрос: кого мне не пускать, когда дворец полон именами Эдвина?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Амнистия", response = "Лестница замолкает. Шёпоты — нет. Вы выбрали милосердие дважды — молите, чтобы оно рифмовалось.", statDeltas = fixed_array(0, 0, -6, 0, 0, 12, 0, 0, -8)),
                        DialogueChoice(choiceText = "Отправить зачинщиков к Морвен", response = "Несколько взмахов внизу — много вздохов наверху. Средний путь — до следующего кризиса.", statDeltas = fixed_array(0, 0, 6, 0, 0, -4, 0, 0, 5)),
                        DialogueChoice(choiceText = "Закрыть дверь", response = "Тогда я держу лестницу, и королевство учится холодности, стуча в дверь. Недругов у вас к рассвету не убавится.", statDeltas = fixed_array(0, 5, 8, 0, 0, -15, 0, 0, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, восемьдесят шесть дней с тех пор, как вы сказали мне, как намерены обращаться с двором Эдвина, — и двор получил свой ответ. Я слышал: Громм уволен или изгнан, Варн заменён, призраки Осрика заперты. Кухни тихи. Казармы называют вас железом. Вы очистили двор. История поспорит о справедливости. О нерешительности — нет.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Хватит", response = "Тогда я пишу *железо* один раз и закрываю главу. Вы купили ясность ценой тепла.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, 0, 0, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc1BeatsRu : Encounter[8] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_LISSA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — Лисса. Меняю простыни и делаю вид, что не считаю пятна. В ночь переворота три покоя зажгли свечи после полуночи. Я слышала, что вы вычистили двор Эдвина, обратили его или позволили призракам оставаться на своих местах. Слуги знают, кто где спал. Вешайте сплетни, платите за них или учитесь у них.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Выслушать её приватно", response = "Тогда я говорю тихо и беру дорого. Правда — это работа, а не верность.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Заткнуть её", response = "Тогда шёпоты уходят под землю. Подземные шёпоты плесневеют. Вы выбрали молчание.", statDeltas = fixed_array(0, 0, 3, 0, -3, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Наградить её молчание", response = "Золото закрывает губы. Но не открывает сердца. Монету я всё равно возьму.", statDeltas = fixed_array(0, 0, 0, -10, 0, 3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_GOOSE,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — Тиль. Официальный дурак и неофициальное зеркало. Двор хочет смеха, пока житницы не опустели. Я могу осмеять того, кто взял трон, осмеять двор, который ему служит, или не осмеять никого — и пустить напряжение гнить. Малрик ненавидит мой рот. Казармы его любят. Вы нанимаете шутку — выбирайте мишень.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Осмеять двор", response = "Тогда знать краснеет, чернь ликует. Опасная комедия. Восхитительная комедия.", statDeltas = fixed_array(0, 0, 4, 0, 0, 8, -6, 0, 0)),
                        DialogueChoice(choiceText = "Осмеять того, кто взял трон", response = "Смело. Редко. Двор расслабляется, потому что вы не вздрагиваете. Они могут забыть бояться вас.", statDeltas = fixed_array(0, 0, 0, 0, 5, 5, 0, 0, -4)),
                        DialogueChoice(choiceText = "Заткнуть Тиля", response = "Тогда зал учится шептать вместо смеха. Шёпоты менее смешны и более остры.", statDeltas = fixed_array(0, 4, 0, 0, 0, -5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_GROMM,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, кухня слышит клятвы, которых не слышит часовня. Я слышал сплетни Лиссы, рифмы Тиля и знаю, кормит ли повар Эдвина того, кто взял трон до сих пор. Борвин считает зерно, Рута считает пыль. Скажите мне: корона кормит персонал первым, проверяет персонал или делает вид, что кухни — не политика.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Сначала пайки для персонала", response = "Тогда горшки благословят ваше имя раньше глашатаев. Дорого — но лестница согревается.", statDeltas = fixed_array(0, 0, 0, 0, 4, 10, 0, -6, 0)),
                        DialogueChoice(choiceText = "Проверить кухни", response = "Тогда ложки прячутся, а шёпоты заостряются. Порядок без любви. Знакомая дворцовая музыка.", statDeltas = fixed_array(0, 0, 0, 8, 0, -6, 0, 3, 0)),
                        DialogueChoice(choiceText = "Общие лишения", response = "Опасная солидарность. Называть её благородной не стану, пока не сработает.", statDeltas = fixed_array(4, 0, 0, 0, 0, 6, 0, -4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RAENA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Лисса торгует историями. Я торгую молчанием. Я слышала: вы открыли лестницу, заткнули её или купили. Мой меч охраняет вашу дверь — не вашу репутацию. Удвойте мой пост, заткните служанок или пустите сплетни течь и докажите, что вы переживёте их.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Доверять Раэне", response = "Тогда Лисса усвоит страх. Я усвою сверхурочные. Дверь остаётся вашей.", statDeltas = fixed_array(-4, 0, 5, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Доверять лестнице", response = "Тогда я слышу всё и не повторяю ничего — если вы не спросите. Работа труднее. Двор лучше.", statDeltas = fixed_array(0, 0, 0, 0, 3, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Не доверять никому", response = "Тогда обе одинаково вас ненавидят. Паранойя любит ротацию. Нокс, кажется, тоже.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_LISSA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, покои Эдвина до сих пор получают свечи — не из благочестия, а из привычки. Я слышала, что вы населяете дворец призраками, очищаете его или судите каждый случай по отдельности. Заприте комнату — разгневайте призраков; займите её — разгневайте знать; переделайте в служивые покои — разгневайте поэтов. Лестница наблюдает, каким королём вы становитесь по ночам.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Запечатать покои", response = "Тогда поэты скорбят, а слуги дышат свободнее. Оба имеют значение — на разных этажах.", statDeltas = fixed_array(0, 5, 0, 0, 3, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Открыто занять покои", response = "Дерзкое оскорбление памяти. Двор называет это силой или оскорблением святого — в зависимости от того, кто потерял родственников.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -8, 0, 8)),
                        DialogueChoice(choiceText = "Подарить покои преданному персоналу", response = "Тогда Громм заплачет или выругается. Не могу разобрать, что именно. Вы купили тепло символом.", statDeltas = fixed_array(0, 0, 0, 0, 0, 12, -4, -3, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_GOOSE,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, площадь хочет хлеба — но сначала возьмёт шутку. Я могу осмеять того, кто взял трон перед голодным финалом, осмеять Эшфорд до того, как она выедет, или осмеять Малрика и испытать, умеет ли Церковь смеяться. Публичное осмеяние строит доверие или строит толпы. Выбирайте жертву — или отменяйте представление.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Осмеять корону", response = "Тогда они полюбят вас на день. День в этом году — валюта.", statDeltas = fixed_array(10, 0, 0, 0, 0, 8, 0, 0, -6)),
                        DialogueChoice(choiceText = "Осмеять Церковь", response = "Малрик назовёт это изменой. Рынок — давно назревшим. Я — работой.", statDeltas = fixed_array(8, -12, 0, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Отменить осмеяние", response = "Тогда площадь расходится злой и без финала. Голод остаётся. Вы выбрали осторожность.", statDeltas = fixed_array(0, 0, 4, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KNOX,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я купил память служанки и расписание поварёнка. История Лиссы о ночи переворота уже ходит в трёх книгах — у Солта, у будущей Эшфорд и у меня. Я слышал об открытой лестнице, заткнутой лестнице и преданной лестнице. Казните продавцов, перебейте покупателей ценой или пустите утечку учить вас, кто ещё хочет кресло Эдвина.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Казнить продавцов", response = "Тогда лестница замирает. Страх работает. Верность притворяется, что работает. Оба выставляют вам счёт.", statDeltas = fixed_array(-8, 0, 6, 0, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Перебить Нокса ценой", response = "Тогда вы арендуете молчание еженедельно. Я ценю постоянных клиентов.", statDeltas = fixed_array(0, 0, 0, -15, 0, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пустить историю переворота в утечку", response = "Тогда двор ничем не управляет — но учится, кто двигается. Опасная педагогика.", statDeltas = fixed_array(4, 0, 0, 0, 0, -4, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, сорок дней прошло с тех пор, как Лисса считала ночные свечи переворота, — и лестница произносит ваше имя, не сплёвывая. Я слышал: кухни накормлены, двери охраняются, шутки направлены на двор, а не корону, Нокс перебит ценой. Преданный персонал. Редкость под тем, кто взял трон. Берегите это, пока Эшфорд не начнёт мерить верхние залы.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я выслушал лестницу", response = "Тогда я пишу *тёплая лестница*. Верхние залы скоро испытают это.", statDeltas = fixed_array(6, 0, 0, 0, 6, 12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc2BeatsRu : Encounter[8] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, на рассвете состоялся первый смотр вашей армии — жалование из казны так и не пришло. Казначей молчит. Эдрик предупреждал, что одними мечами корону не удержать, но не сказал, что мечи ждут монету не меньше, чем кровь. Заплатите сейчас, дайте обещание с датой — или скажите солдатам, что честь кормит лучше хлеба.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Выплатить половину жалования", response = "Половина кошелька покупает половину терпения. На сегодня, возможно, хватит. Не делайте из этого привычку.", statDeltas = fixed_array(0, 0, 10, -15, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Выплатить всё сейчас", response = "Щедро. Запомнят — до следующего смотра.", statDeltas = fixed_array(0, 0, 18, -25, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Сказать, что честь — их плата", response = "Тогда молитесь, чтобы ваши стены крепче терпения моих капитанов.", statDeltas = fixed_array(0, 0, -12, 5, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_DOMINIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, мой дом оплатил переворот — капитанов у ворот и клинки, что вас короновали. Долг пора вернуть. Не заплатите — и армия узнает, кому на самом деле служит её капитан.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Взять заём у Солта на жёстких условиях", response = "Тогда мои чернила владеют вашими утрами, пока долг не уснёт. Армия не узнает — пока.", statDeltas = fixed_array(0, 0, 5, 20, 0, -4, 0, 0, -8)),
                        DialogueChoice(choiceText = "Изъять книги его конкурентов", response = "Мои книги вы найдёте чистыми, а книги моих врагов — грязными. Полезно — пока каждый купец не начнёт вас бояться.", statDeltas = fixed_array(0, 0, 8, 12, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Перезаключить договор", response = "Время — тоже валюта. Я подожду — и возьму за ожидание.", statDeltas = fixed_array(0, 0, 0, -5, 0, 4, 0, 0, -3)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_FINN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я дезертировал из третьей роты Эдвина за неделю до вашего переворота — и не вернулся ради вашего. Сорок человек прячутся в южных холмах, потому что казначей забыл о них дважды. Я слышал, что вы оставили или вычистили Громма, платили Рудольфу или читали проповеди. Мы задаём более простые вопросы: амнистия, монета или верёвка?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Амнистия и зачисление", response = "Тогда мы маршируем за вас, пока кто-то не заплатит лучше. Сегодня это вы.", statDeltas = fixed_array(0, 0, 12, -10, 0, -3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Откупиться", response = "Дешёвый мир. Пропьют вашу монету и вспомнят ваше имя в песнях, которые вам не понравятся.", statDeltas = fixed_array(0, 0, 3, -15, 0, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Охотиться на них", response = "Тогда пошлите людей, которым платят. Неоплаченные охотники к ужину сами становятся дезертирами.", statDeltas = fixed_array(0, 0, -8, 0, 0, -6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BORVIN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, на казну давят сразу три долга: Солту за переворот, Рудольфу за смотр и расходы ведомств Эдвина — Осрик до сих пор расписывается за покойного. Я слышал, что вы платили солдатам, торговались с банкирами или кормили их честью. Церковный налог Малрика ещё не собран — а зима близко. Откуда платить в первую очередь: из армейского жалования, с двора или из королевских резервов?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Сначала армия", response = "Голодные писари заговоры плетут медленнее, чем голодные солдаты маршируют. Арифметика, не милосердие.", statDeltas = fixed_array(0, 0, 12, -8, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Сбалансировать все три", response = "Все ненавидят вас одинаково. Политически эффективно.", statDeltas = fixed_array(0, 0, 5, -5, 0, -2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Держать резервы", response = "Обещания — монеты собственной чеканки. Тратьте осторожно.", statDeltas = fixed_array(0, 0, -6, 8, 0, -4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, две роты складывают телеги у нижних ворот — не уходить, клянутся они, но напомнить, что могли бы. Я слышал, что вы выбирали, какая книга истекает кровью, укрывали дезертиров или охотились на них, преклонили ли колено перед Малриком или бросили ему вызов — и всё это за одну неделю. Солдаты слушают священников, когда жалованье — молчание. Платите, наказывайте или устраивайте смотр.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Экстренная выплата из резервов", response = "Купленное время. Не купленная верность. Знайте разницу.", statDeltas = fixed_array(0, 0, 15, -20, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Повесить капитанов телег", response = "Сталь решает вопрос с одной ротой. Остальные высчитывают, лучше ли верёвка, чем золото.", statDeltas = fixed_array(0, 3, 6, 0, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Смотр и обещание после переговоров о церковному налогу", response = "Театр. Если Малрик возьмёт ваш кошелёк в воскресенье — отменяйте спектакль с процентами.", statDeltas = fixed_array(0, 5, -4, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KARA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, моя рота сопровождает зерно — когда зерно платит. Рудольф хочет контракт с короной. Солт хочет залог. Я слышала, что ваш кошелёк каждую неделю пустеет чуть больше. Наймите нас на счёт трона, позвольте нам продаться тому, кто платит сегодня, или захватите наши телеги и молитесь, чтобы неоплаченные люди воевали задаром.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Контракт с короной", response = "Тогда мои болты направлены туда, куда укажете вы, — пока ваш кошелёк поёт.", statDeltas = fixed_array(0, 0, 14, -18, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Вольная рота", response = "Золото течёт. Лояльности размываются. Война дешевеет для всех — кроме вас.", statDeltas = fixed_array(0, 0, -5, 8, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Захватить телеги", response = "Тогда вы приобретаете болты и теряете репутацию. Наёмники помнят забор имущества дольше, чем короли помнят выплаты.", statDeltas = fixed_array(0, 0, 10, 0, 0, -10, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_OTTO,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я клялся Эдвину как рыцарь его двора — а вы сидите в кресле Эдвина. Я не произносил речей при дворе с ночи переворота, потому что речи стоят монеты, которой мне не платили. Я слышал, что ваша армия ворчит, ваш банкир считает, ваш наёмник торгуется. Моё молчание — не верность. Это арифметика. Обещайте мне жалованье или дайте отставку.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Рыцарское содержание", response = "Тогда я обнажаю меч по вашему слову. Говорить по-прежнему предпочитаю меньше. Нам обоим спокойнее.", statDeltas = fixed_array(0, 0, 8, -12, 0, 6, 4, 0, 0)),
                        DialogueChoice(choiceText = "Отставка с честью", response = "Чистый выход. Двор теряет меч. Вы приобретаете свидетеля, который может дать показания в другом месте.", statDeltas = fixed_array(0, 0, -3, 0, 0, 3, 0, 0, -4)),
                        DialogueChoice(choiceText = "Служба без жалованья", response = "Тогда моё молчание означает презрение, а не преданность. Помните: я вас предупреждал.", statDeltas = fixed_array(0, 0, -5, 0, 0, -6, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, пятьдесят четыре дня прошло со смотра без монеты — и люди по-прежнему откликаются на ваш зов. Я слышал: Солт выплачен, Отто присягнул, телеги профинансированы, дезертиры осуждены. Казармы называют вас королём, который платит, когда это больно. Это редкость — редкость большая, чем храбрость. Берегите её.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я выслушал казармы", response = "Тогда маршируйте, когда я скажу. Монета купила эту верность. Тратьте её мудро.", statDeltas = fixed_array(0, 0, 12, -5, 0, 10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc3BeatsRu : Encounter[12] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUTA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — Рута с западных мельниц. Житницы кашляют пылью там, где прежде кашляли зерном. Я слышала, что сборщики церковного налога Малрика добираются до деревень раньше ваших налоговых чиновников. Я приехала сюда не за поэзией — я приехала потому, что голодные мельники помнят, кто украл урожай, и не всегда имеют в виду погоду.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Открыть резервы короны", response = "Тогда мельницы будут благословлять вас до следующей телеги. Дорого. Но это запомнится.", statDeltas = fixed_array(0, 0, 0, -15, 0, 8, 0, 12, 0)),
                        DialogueChoice(choiceText = "Расследовать мародёров", response = "Верёвка пугает купцов быстрее проповедей. Можете повесить не того. Мельницам будет всё равно, если правый завопит.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 0, 5, 4)),
                        DialogueChoice(choiceText = "Провинции должны вытерпеть", response = "Тогда я вернусь с большим числом женщин и меньшим числом манер. Помните: я предупреждала вас, пока не начались баллады.", statDeltas = fixed_array(0, 0, 0, 8, 0, -10, 0, -8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_GROMM,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, двор ждёт жаркого в праздничные дни, а каждый день — праздничный, когда короли нервничают. Я слышал, что западные мельницы присылают пыль вместо муки. Мои печи могут печь для дворца или для города — не для обоих без монеты или лжи. Мне варить в кухнях молчание или подавать к вашему столу честность?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Публичный пир", response = "Тогда чернь видит дым и верит вам. Казначейство видит дым и плачет.", statDeltas = fixed_array(0, 0, 0, -12, 0, 10, 0, 10, 0)),
                        DialogueChoice(choiceText = "Закрытый пир двора", response = "Лицемерие со специями. Слуги болтают. Они всегда болтают.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 4, -5, 0)),
                        DialogueChoice(choiceText = "Поститься вместе с городом", response = "Жидкий суп для жидких времён. Малрик назовёт это благочестием. Я называю это политикой, которая немного наполняет желудки.", statDeltas = fixed_array(0, 5, 0, 0, 0, 4, 0, 6, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ARVEL,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, моя очередь за похлёбкой огибает нижний двор — и каждый рассвет становится длиннее. Я слышал, что Малрик объявил мясо нечистым или зерно — собственностью Господа. Я слышал, что вы кормили солдат втайне или морили верующих голодом. Бедным нет дела до того, чья проповедь победит. Им важно, какой котёл кипит.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Финансировать линии Арвела", response = "Тогда бедные благословляют ваше имя прежде имени Малрика. Он назовёт это кражей святости. Я называю это обедом.", statDeltas = fixed_array(0, -6, 0, -10, 0, 8, 0, 8, 0)),
                        DialogueChoice(choiceText = "Пусть Малрик кормит их", response = "Тогда он владеет их коленями. Вы владеете стенами. Стандартная сделка.", statDeltas = fixed_array(0, 10, 0, 0, 0, -4, 0, -5, 0)),
                        DialogueChoice(choiceText = "Закрыть очереди", response = "Тогда бунт становится теологией. Вы выбрали ясность. Ясность — не всегда милосердие.", statDeltas = fixed_array(0, 0, 6, 0, 0, -12, 0, -6, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BRAN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я говорю от имени девяти деревень, которые по-прежнему называют вас тем, кто взял трон — и по-прежнему просят у вас хлеба. Я слышал о Руте с мельниц и Арвеле из очередей за похлёбкой. Мы не хотим вашей души. Мы хотим ключи от ваших житниц. Выдайте местные права на хранение зерна или пошлите солдат охранять пустые закрома.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Выдать провинциальные зерновые права", response = "Тогда деревни охраняют свою зиму. Вы охраняете свою репутацию. Оба занятия требуют усилий.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 10, -5)),
                        DialogueChoice(choiceText = "Отказать", response = "Тогда мы хороним мертвецов и запоминаем ваш ответ. Рута сложит это в стихи.", statDeltas = fixed_array(0, 0, 4, 0, 0, -10, 0, -6, 0)),
                        DialogueChoice(choiceText = "Нанять милицию Брана", response = "Опасные крестьяне с копьями. Дешевле рыцарей — до поры.", statDeltas = fixed_array(0, 0, 8, -8, 0, -3, 0, 4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_YAREK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, гора пожирает людей и выплёвывает руду. Я слышал, что деревни хранят зерно, пока шахтёры едят камни. Мы можем остановить кузни, которые платят вашей армии, или вы можете установить цену хлеба в железе, а не в золоте. Корона покупает наш пот — купит ли она и наш ужин?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Хлеб за руду", response = "Тогда кузни дышат, а горы шепчут ваше имя. Пока цена не изменится.", statDeltas = fixed_array(0, 0, 5, -10, 0, 6, 0, 8, 0)),
                        DialogueChoice(choiceText = "Подавить забастовку", response = "Сталь против голодных людей. Руда течёт. История распространяется.", statDeltas = fixed_array(0, 0, 8, 0, 0, -14, 0, -4, 0)),
                        DialogueChoice(choiceText = "Пусть гильдия Фары посредничает", response = "Купцы в прибыли. Кузни работают. Вы должны Фаре услугу — она её потребует.", statDeltas = fixed_array(0, 0, 0, 6, 0, -5, 0, 4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_FARA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я говорю от имени зерновой гильдии — не Церкви, не армии, не романтичных мельников. Я слышала, что вы открывали резервы, финансировали очереди за похлёбкой или угрожали бастующим. Обозы тронутся, если корона гарантирует цены. Они остановятся, если вы захватите телеги. Голод — рынок. Я — его жрица.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Договор корона–гильдия", response = "Тогда королевство ест равномерно, а я богатею равномерно. Справедливо — если вы контролируете слово *справедливо*.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 0, 12, 0)),
                        DialogueChoice(choiceText = "Захватить гильдейские житницы", response = "Тогда гильдия называет вас тираном. Народ называет вас кормильцем — ненадолго.", statDeltas = fixed_array(0, 0, 0, 10, 0, -12, 0, 15, 0)),
                        DialogueChoice(choiceText = "Свободный рынок", response = "Золото течёт наверх. Желудки пустеют внизу. Экономика как теология.", statDeltas = fixed_array(0, 0, 0, 12, 0, -8, 0, -10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ELINA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я пою за монеты и за дела. Я слышала: мельницы пустеют, очереди за похлёбкой растут, шахтёры бастуют, купцы подсчитывают. Мой новый стих называет того, кто взял трон — голодным или щедрым, в зависимости от того, чем вы кормили город на этой неделе. Спонсируйте песню, заглушите её или пусть рынок выбирает вашу репутацию.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Спонсировать щедрую балладу", response = "Лестные слова. Дорогой припев. Чернь напевает ваше имя до следующего голода.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 3, 0)),
                        DialogueChoice(choiceText = "Запретить голодные баллады", response = "Запрещённые песни поют громче всего. Я буду шептать там, куда вы не можете повесить.", statDeltas = fixed_array(0, 0, 3, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть высмеивает", response = "Смело или глупо. Толпа решит. Я всё равно буду сыта.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -4, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_SELENA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, мои обозы по-прежнему идут — когда им платят втройне. Я слышала: резервы короны открыты, с гильдиями заключены договоры или рынки предоставлены гнить. Лоялисты делают запасы под именем Эдвина. Ваши крестьяне — под именем Господа. Я могу продать вам маршруты, продать имена или продать вашим врагам зерно, которое вы не хотите оценивать.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Конвой короны", response = "Тогда люди Рудольфа охраняют пшеницу. Купцы охраняют обиды. Еда движется.", statDeltas = fixed_array(0, 0, -4, -10, 0, 5, 0, 12, 0)),
                        DialogueChoice(choiceText = "Заплатить по ценам Селены", response = "Я доставлю. И запомню, что вы не умели торговаться. Инфляция — это мемуары.", statDeltas = fixed_array(0, 0, 0, -18, 0, 2, 0, 10, 0)),
                        DialogueChoice(choiceText = "Пусть мародёры сами голодают", response = "Тогда маршруты умирают и разбойники пируют. Арифметика жестокости.", statDeltas = fixed_array(0, 0, 0, 8, 0, -10, 0, -12, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUTA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я возвращаюсь с мельниц — и с брода, где северные беженцы разбили лагерь рядом с нашими голодающими. Я слышала, что вы укрыли чужестранцев, выдворили их или позволили Арвелу варить похлёбку ради политики Ингвара. У Крестьянства теперь есть имя в вашем дворе. Вы кормите своих первыми, делитесь у брода или говорите всем молиться?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Кормить своих первыми", response = "Тогда брод проклинает вас. Мельницы благословляют. Политика как контроль порций.", statDeltas = fixed_array(8, 0, 0, 0, 0, 4, 0, 8, 0)),
                        DialogueChoice(choiceText = "Общий паёк", response = "Дорогостоящая справедливость. Единственный её вид, который иногда заставляет замолчать и песню, и меч.", statDeltas = fixed_array(12, 0, 0, -15, 0, 6, 0, 6, 0)),
                        DialogueChoice(choiceText = "Церковь кормит брод", response = "Раздельное милосердие. Малрик приобретает прихожан. Вы приобретаете арифметику. Рута приобретает обиды.", statDeltas = fixed_array(4, 8, 0, 0, 0, 0, 0, -6, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_GROMM,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, девяносто девять дней прошло с вашего удара, и город по-прежнему спрашивает, морит ли тот, кто взял трон их голодом намеренно. Я слышал о беженцах, гильдиях, шахтёрах и постах Малрика. Мои кухни могут продержаться ещё месяц — или признать, что мы уже ставим двор прежде черни. Говорите правду за столом или рассказывайте ложь получше.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Урезать пайки двора наполовину", response = "Скудные тарелки для скудных времён. Знать дуется. Слуги запоминают.", statDeltas = fixed_array(8, 0, 0, 0, 0, 6, -5, 10, 0)),
                        DialogueChoice(choiceText = "Удвоить пайки двора", response = "Тогда рынок чует жаркое, пока дети лижут котлы. Элина сложит это в стихи.", statDeltas = fixed_array(-10, 0, 0, 0, 0, -8, 6, -10, 0)),
                        DialogueChoice(choiceText = "Отправить дворцовые запасы в провинции", response = "Опасный символизм. Я приготовлю ячмень и назову это политикой.", statDeltas = fixed_array(12, 0, 0, -5, 0, 10, 0, 15, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, армия должна есть прежде, чем любить вас. Я слышал: гильдии компакт, крестьяне права, Элина поёт ваши грехи. Я могу реквизировать зерно из деревень, у которых оно ещё есть, — законная кража под знамёнами, — или маршировать на пустой желудок и называть это добродетелью. Солдаты — не баллады. Они — аппетиты.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Разрешить реквизицию", response = "Тогда деревни ненавидят вас эффективно. Армия марширует на сытый желудок. Выбирайте врага.", statDeltas = fixed_array(-10, 0, 12, 0, 0, -8, 0, -12, 0)),
                        DialogueChoice(choiceText = "Половинные пайки для солдат", response = "Дисциплина с голодом. Мятеж с честью. Знакомый рецепт.", statDeltas = fixed_array(4, 0, -6, 0, 0, 6, 0, 6, 0)),
                        DialogueChoice(choiceText = "Закупить зерно по рыночным ценам", response = "Дорогостоящий мир. Дешевле бунта — если казна выдержит.", statDeltas = fixed_array(0, 0, 6, -20, 0, 4, 0, 10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, семьдесят семь дней прошло с тех пор, как Рута кашляла пылью у ваших ног — и у провинций ещё есть дыхание, чтобы хвалить вас. Я слышал: очереди за похлёбкой, открытые житницы, гильдейские договоры, согнувшиеся, но не сломавшиеся. Чернь называет вас королём-хлебодаром. Эшфорд будет презирать. Мельницы — нет.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я выслушал провинции", response = "Тогда я пишу *хлеб* прежде *клинка*. Редкость для того, кто взял трон. Не расточайте это.", statDeltas = fixed_array(10, 0, 0, 0, 0, 8, 0, 8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc4BeatsRu : Encounter[13] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_FARA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, зерновая гильдия помнит договоры и предательства. Я слышал, вы кормили провинции, захватывали повозки или позволяли рынкам гнить в голодные месяцы. Кредит короне заморожен, пока узурпатор не докажет, что платят больше, чем проповедями. Откройте торговлю на условиях гильдии — или смотрите, как караваны объезжают вашу столицу.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять условия гильдии", response = "Тогда мои книги владеют вашими утрами, пока вы не заплатите. Казна дышит — по моему расписанию.", statDeltas = fixed_array(0, 0, 0, 20, 0, -4, 0, 0, -8)),
                        DialogueChoice(choiceText = "Отказать", response = "Бумага — не монета. Купцы узнают это вашей ценой.", statDeltas = fixed_array(0, 0, 0, 8, 0, -6, -5, 0, 0)),
                        DialogueChoice(choiceText = "Захватить дом гильдии", response = "Тогда гильдия назовёт вас разбойником — справедливо. Запрет на торговлю ужесточается. Наслаждайтесь одиночеством.", statDeltas = fixed_array(0, 0, 4, 15, 0, -12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_DOMINIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, люди, сдававшие переворот в аренду, хотят отдачи — с процентами, капающими, пока вы кормили крестьян и платили солдатам. Я слышал, Фара заморозила кредит или вы заморозили её. Мой дом держит более короткий поводок. Платите Солту первым, Фаре второй — или никому и узнайте, кто обращается взыскание быстрее.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заплатить Солту полностью", response = "Тогда мое перо снимает ваше имя — временно. Гильдия возненавидит ваш приоритет. Армия полюбит.", statDeltas = fixed_array(0, 0, 5, -25, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пересмотреть долг Солта", response = "Время — монета. Я продаю обе. Вы купите снова.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, 0, -6)),
                        DialogueChoice(choiceText = "Объявить неуплату по долгу переворота", response = "Тогда я продам ваши долги по неуплате тому, кто ненавидит вас больше всех. Ингвар тоже читает книги.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, -10)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_NERIUS,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, по королевству ходят ложные короны — чеканенные с лицом короля Эдвина, тратимые с благословения вашего того, кто взял трон. Я слышал о печатях-призраках Осрика и голодных займах Солта. Мой монетный двор может очистить фальшивые монеты, или ваша казна может притвориться, что это дань. Фальшивая монета — налог на королей, не умеющих считать.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Финансировать зачистку монетного двора", response = "Дорогая честность. Рынки замирают, затем возвращается доверие — если вы доведёте дело до конца.", statDeltas = fixed_array(0, 0, 0, -18, 0, 8, 0, 0, 6)),
                        DialogueChoice(choiceText = "Игнорировать", response = "Тогда цены лгут — и налоги лгут вместе с ними. Борвин закричит. Воры обрадуются.", statDeltas = fixed_array(0, 0, 0, 10, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Обвинить Нерия", response = "Удобная коза отпущения. Фальшивые монеты продолжаются без шеи, на которую можно свалить вину. Вы выбрали театр.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BORVIN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, церковный налог Малрика, проценты Солта и сборы Фары едят один сундук — а Рудольф всё ещё хочет пайки. Я слышал, вы очистили фальшивые монеты или позволили им расползтись. Выберите, какой кредитор голодает в этом месяце: небо, купцы или сталь.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Платить купцам первым", response = "Тогда Малрик назовёт вас ростовщиком. Армия назовёт вас благоразумным. Обе могут быть правы.", statDeltas = fixed_array(0, -5, 0, -15, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Платить Церкви первой", response = "Тогда Фара ужесточит запрет на торговлю. Малрик улыбнётся. Арифметика заплачет.", statDeltas = fixed_array(0, 10, 0, -12, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Платить армии", response = "Солдаты едят. Купцы помнят. Классический треугольник того, кто взял трон.", statDeltas = fixed_array(0, 0, 8, -10, 0, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_SELENA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Фара заморозила королевский кредит, а Солт объявил ваши долговые записки — я слышал оба, прежде чем мои караваны покинули двор. Я вожу зерно и золото, не верность. Дайте мне королевские конвои и премиальную плату — или я продам ваши нехватки врагам с наценкой.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Королевские конвои и премия", response = "Доставлю. И скажу Фаре, что вы заплатили розничную цену за оптовые беды.", statDeltas = fixed_array(0, 0, 0, -20, 0, 4, 0, 8, 0)),
                        DialogueChoice(choiceText = "Национализировать одну караванную линию", response = "Тогда я продам Ингвару. Вы получите повозки и репутацию вора.", statDeltas = fixed_array(0, 0, 4, 12, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пустить маршруты провалиться", response = "Голодные рынки помнят. Баллады тоже. Вы выбрали чистоту вместо пайков.", statDeltas = fixed_array(0, 0, 0, 8, 0, -8, 0, -10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, через шесть дней леди Эшфорд решит, правитель вы или должник в горностае. Я слышал, Фара удержала кредит, Солт начисляет проценты, а Нерий нашёл ложную монету. Великие дома дают взаймы королям, способным платить — не тем, кто взял трон и должен купцам больше, чем епископам.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Готовить деньги в казне", response = "Театр с квитанциями. Дорого. Эшфорд уважает дорогую правду.", statDeltas = fixed_array(0, 0, 0, -15, 0, 4, 5, 0, 0)),
                        DialogueChoice(choiceText = "Готовить блеф", response = "Уверенность с лаком. Эшфорд снимает краску для развлечения.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -3, 0, 6)),
                        DialogueChoice(choiceText = "Готовить захват", response = "Смелое пиратство. Фара закричит. Эшфорд может аплодировать — если вы победите.", statDeltas = fixed_array(0, 0, 5, 15, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 2,
            characterIdx = CHAR_FARA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Эшфорд предлагает законное право править за цену. Я предлагаю деньги в казне — острее. Подпишите Гильдейский компакт — королевские пошлины фиксированы, частный кредит открыт, церковный налог ограничена купцами, а не Малриком — или мы объявим ваши долговые записки к оплате до заката.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Подписать компакт", response = "Тогда мы партнёры, пока вы не попытаетесь нас сломать. Прочитайте чернила дважды.", statDeltas = fixed_array(0, -8, 0, 15, 0, 0, -6, 0, -5), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Отказать", response = "Тогда Солт закончит этот разговор. Я сделала своё любезное.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Контрпредложение", response = "Половина компакта. Половина войны. Солт оценит разницу.", statDeltas = fixed_array(0, 5, 0, -8, 0, 0, 0, 0, 4), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Заплатить", response = "Тогда вы бедны и живы. Уважаемая комбинация.", statDeltas = fixed_array(0, 0, 0, -40, 0, 6, 0, 0, 5)),
                        DialogueChoice(choiceText = "Предложить приданое брака Эшфорд как залог", response = "Тогда вы закладываете родословные ради монеты. Эшфорд заметит. История тоже.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 8)),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_NERIUS,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, ложная монета дошла до солдатской казны — или дошла бы, если бы Рудольф был менее подозрителен. Я слышал, вы объявили неуплату Солту или подписали компакт Фары. Мой монетный двор просит власти изъять каждую плохую монету в столице. Дайте её — и доверие вернётся медленно. Откажите — и доверие не придёт никогда.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Разрешить изъятие", response = "Тогда монета честна ценой бунтов. Честность не бесплатна.", statDeltas = fixed_array(0, 0, 6, -10, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Частное изъятие", response = "Общая вина. Общая слава. Фара владеет мускулами. Вы — заголовком.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, -4, 0, 0)),
                        DialogueChoice(choiceText = "Отказать", response = "Рынки не самоисправляются. Они самопожираются. Вы выбрали веру вместо монетного двора.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BORVIN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, часы неуплаты бьют — агенты Солта стоят у нижних ворот, клерки Фары ревизуют ваши погреба, а Рудольф просит военную монету, которой у вас нет. Я слышал, вы подписали, отказали или блефовали. Заплатите одну итоговую одну общую сумму, объявите открытую нет денег или продайте коронные драгоценности Эдвина купцам, которые выставят их в витринах лавок.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Консолидированный платёж", response = "Дорогая тишина. Редчайшая музыка в финансах.", statDeltas = fixed_array(0, 0, 0, -35, 0, 8, 0, 0, 6)),
                        DialogueChoice(choiceText = "Открытая нет денег", response = "Честная катастрофа. Кредиторы берут куски. Вы сохраняете кресло — возможно.", statDeltas = fixed_array(0, 0, 0, 10, 0, -12, -15, 0, -10)),
                        DialogueChoice(choiceText = "Продать коронные драгоценности", response = "Тогда держава видит рубины вашей матери в гильдейской витрине. Тем не менее вы едите.", statDeltas = fixed_array(0, 0, 0, 25, 0, -10, -12, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KNOX,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я продал копию истинного счёта Борвина — не той версии для двора — тому, кто заплатил больше всего на этой неделе. Фара, Солт, Ингвар и Эшфорд держат по несколько страниц, которые вы желали бы сохранить в тайне. Я могу выкупить страницы обратно, продать вам фальшивые монеты или исчезнуть. Позор вашей казны теперь — товар.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Выкупить счёт", response = "Тогда вы берёте тишину в аренду. Я продам снова, если цена улучшится.", statDeltas = fixed_array(0, 0, 0, -18, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Подбросить фальшивые монеты", response = "Умно — до тех пор, пока двое лжецов не сравнят записи. Всё же — выиграть время.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Арестовать Нокса", response = "Слишком поздно. Копии уже гуляют. Вы выбрали театр вместо арифметики.", statDeltas = fixed_array(0, 0, 2, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ILANA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я пишу второй черновик — не о том, кто поклонился, а о том, кто владеет вашими утрами. Я слышала о компакте Фары, часах Солта, ложной монете Нерия, надбавках Селены и украденных числах Нокса. Озаглавьте эту главу *Король, который может платить*, *Долговая корона* или *Купеческий трон* — держава превращает мои глаголы в закон.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "*Король, который может платить*", response = "Лестно, если правда. Опасно, если нет. Я проверю, прежде чем печатать.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 4, 0, 0)),
                        DialogueChoice(choiceText = "*Долговая корона*", response = "Честная проза. Кредиторы её ненавидят. Простолюдины любят. Вы выбрали правду, а не тон.", statDeltas = fixed_array(0, 0, 0, 5, 0, 8, -8, 0, 0)),
                        DialogueChoice(choiceText = "Подкупить главу", response = "Дорогостоящий вымысел. Нокс всё равно продаст сноски.", statDeltas = fixed_array(0, 0, 0, -12, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, девяносто четыре дня прошло с тех пор, как Фара заморозила ваш кредит, — и торговые дома произносят ваше имя, не сплёвывая. Я слышал: Солту заплатили, фальшивые монеты очищены, записи казны Борвина сведены. Вы купили время за золото. Старейшее из чудес. Корона снова владеет своей казной — пока.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я выслушал кредиторов", response = "Тогда я пишу *кто может платить* прежде *верного*. У зимы есть другие счета — их тоже оплатите.", statDeltas = fixed_array(0, 0, 0, 5, 0, 8, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 2,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, народ знает вашу корону, но не знает — благословлена ли она. Сегодня Церковь обязана решить, называть вас королём или тем, кто взял трон. Я явился не за вашей душой — я явился за вашим именем на площади.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Просить Церковь о благословении", response = "Смирение — подходящая маска для того, кто достиг трона через кровь. Верующие это услышат.", statDeltas = fixed_array(0, 15, 0, -8, 0, 3, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Потребовать признания", response = "Приказы находят солдат. До неба они доходят значительно хуже. Вы скоро это узнаете.", statDeltas = fixed_array(0, -12, 8, 0, 0, -4, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Предложить союз", response = "Союз короны и посоха может спасти Эстедор. Или задушить его. Посмотрим, кто голоднее.", statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, 0, 3), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Назвать раскол", response = "Тогда вы встаёте на сторону бормочущих монахов Арвела и против моего хора. Опасно. Пожалуй, популярно среди голодных.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Принять церковный надзор над законностью", response = "Тогда встаньте на колени на площади по моему слову. Узурпатор станет помазанником — или уроком.", statDeltas = fixed_array(0, 12, -3, 0, 0, 0, 0, 0, 5)),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc5BeatsRu : Encounter[10] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 2,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, народ знает вашу корону, но не знает — благословлена ли она. Сегодня Церковь обязана решить, называть вас королём или тем, кто взял трон. Я явился не за вашей душой — я явился за вашим именем на площади.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Просить Церковь о благословении", response = "Смирение — подходящая маска для того, кто достиг трона через кровь. Верующие это услышат.", statDeltas = fixed_array(0, 15, 0, -8, 0, 3, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Потребовать признания", response = "Приказы находят солдат. До неба они доходят значительно хуже. Вы скоро это узнаете.", statDeltas = fixed_array(0, -12, 8, 0, 0, -4, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Предложить союз", response = "Союз короны и посоха может спасти Эстедор. Или задушить его. Посмотрим, кто голоднее.", statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, 0, 3), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Назвать раскол", response = "Тогда вы встаёте на сторону бормочущих монахов Арвела и против моего хора. Опасно. Пожалуй, популярно среди голодных.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice()
                    )
                ),
                DialogueNode(
                    prompt = "Ваше Величество, благословение — не дар, а поводок. Я могу проповедовать вас королём и заставить толпу пасть на колени. Я могу проповедовать вас тем, кто взял трон и заставить точить ножи. Или я могу проповедовать молчание — и предоставить каждому лорду решать, правите ли вы завтра. Я слышал, что на пороге вы выбрали свой тон. Теперь выберите, что Церковь покупает за него.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять церковный надзор над законностью", response = "Тогда встаньте на колени на площади по моему слову. Узурпатор станет помазанником — или уроком.", statDeltas = fixed_array(0, 12, -3, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Отказать — корона признаёт саму себя", response = "Тогда готовьтесь к проповеди, которая называет вас цареубийцей. Я слышал непокорность. Верующие услышали вызов.", statDeltas = fixed_array(0, -10, 5, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Общий счёт — налог и церковный налог по договорённости", response = "Купеческий мир. Борвин возненавидит. Я стерплю — до поры.", statDeltas = fixed_array(0, 5, -8, 0, 0, 2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice()
                    )
                ),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Малрик называет вас королём или тем, кто взял трон на площади. Я называю вас подозреваемым в Господней книге счёта. Я слышал — вы преклонились, бросили вызов или торговались на тридцатый день, — и слышал, что исповедник Эдвина ещё дышит в обители Арвела, если слухи не лгут. Мои полномочия — расследование, не проповедь. Назовите имена, выдайте Альдо или исчерпайте моё терпение.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Сотрудничать", response = "Полезно. Малрик назовёт это королевским правосудием. Арвел назовёт трусостью. Оба могут быть правы.", statDeltas = fixed_array(0, 8, 0, 0, 0, -6, 0, 0, 6)),
                        DialogueChoice(choiceText = "Отказать от расследования", response = "Тогда я приписываю *помеху* рядом с *тем, кто взял трон* и сплю спокойно. Вы — возможно, нет.", statDeltas = fixed_array(0, -12, 5, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Обменять изгнание Альдо на прекращение расследования", response = "Один жрец за один мир. Малрик получает трофей. Вы получаете неделю. Недели складываются.", statDeltas = fixed_array(0, 5, 0, 0, 0, -4, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BORVIN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, казна платит дважды: раз короне, раз алтарю. Малрик называет церковный налог святым. Я называю его вторым налогом, который не спрашивает разрешения. Я слышал — вы торговались со счётом или бросили вызов его писцам. Сегодня я пришёл узнать, кто получает золото, когда солдаты не получают ни гроша.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Ограничить церковный налог", response = "Малрик назовёт это оскорблением святого. Солдаты назовут это жалованьем. Оба могут быть правы.", statDeltas = fixed_array(0, -10, 5, 8, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Заплатить церковный налог в полном объёме", response = "Мир куплен. Казна опустошена. Малрик улыбается. Я — нет.", statDeltas = fixed_array(0, 12, 0, -15, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Переложить церковный налог на лордов", response = "Лорды возненавидят вас. Церковь получит свою долю. Вы получите врагов с обеих сторон.", statDeltas = fixed_array(0, 5, 0, 5, 0, 0, -10, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Малрик строит машину, которая снимает короны без меча. Проповедь, интердикт, отказ в помазании — всё это винты, которые крутят лордов против вас. Я слышал — вы выбрали тон на тридцатый день. Сегодня я пришёл сказать: машина работает, если вы позволяете ей работать.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Публично отвергнуть право Церкви снимать короны", response = "Смелый ход. Малрик назовёт это ересью. Солдаты назовут это короной. Выберите, кого слушать.", statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Предложить компромисс", response = "Компромисс — это мост, который оба сжигают. Малрик сожжёт с вашей стороны. Посмотрим, кто первый упадёт.", statDeltas = fixed_array(0, 3, 0, -5, 0, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Использовать Эдрика для тайных переговоров с лордами", response = "Старые связи. Старые долги. Малрик не знает всех дверей. Я — знаю.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 5, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_SELENA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Малрик покупает зерно быстрее, чем я могу продать. Он называет это милостыней. Я называю это единоличной властью над рынком. Голодные слушают того, кто кормит. Я слышал — вы ограничили церковный налог или заплатили в полном объёме. Сегодня рынок говорит громче казны.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Запретить церковные закупки зерна", response = "Малрик назовёт это гонением. Голодные назовут это голодом. Выберите, кого бояться больше.", statDeltas = fixed_array(0, -12, 0, 0, 0, -5, 0, -8, 0)),
                        DialogueChoice(choiceText = "Конкурировать", response = "Дорого. Эффективно. Малрик не любит конкуренцию.", statDeltas = fixed_array(0, -5, 0, -12, 0, 6, 0, 10, 0)),
                        DialogueChoice(choiceText = "Позволить единоличную власть над рынком", response = "Казна цела. Репутация — нет. Малрик кормит. Вы считаете.", statDeltas = fixed_array(0, 8, 0, 5, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Малрик объявил пост — не для души, а для желудка. Голодные молятся громче. Я слышал — вы выбрали путь смирения, вызова или раскола. Сегодня пост — это оружие, и оно бьёт по вашим подданным.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Объявить королевский пир", response = "Малрик назовёт это оскорблением святого. Народ назовёт это хлебом. Оба могут быть правы.", statDeltas = fixed_array(0, -15, 0, 0, 0, 5, 0, 8, 0)),
                        DialogueChoice(choiceText = "Поддержать пост", response = "Смирение покупает время. Голод покупает Малрика. Выберите, что дороже.", statDeltas = fixed_array(0, 10, 0, 0, 0, -3, 0, -5, 0)),
                        DialogueChoice(choiceText = "Обойти пост", response = "Тайна не держится в голодном городе. Но народ запомнит, кто кормил.", statDeltas = fixed_array(0, -5, 0, -8, 0, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_VARN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, три тысячи странников разбили лагерь у нижних ворот — дело рук Малрика, хотя он клянётся в невиновности. Они скандируют: отречение или благословение — что наступит раньше. Я слышал — вы бросили вызов посту во дворах или преклонились за столом; шпионы слышали и то, и другое. Мои стражи не разгонят святую толпу без вашего слова о крови.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Разогнать их", response = "Кровь в святой толпе покупает мучеников. Малрик это знает. Надеется, что вы — нет.", statDeltas = fixed_array(0, -18, -10, 0, 0, -12, 0, 0, 6)),
                        DialogueChoice(choiceText = "Обратиться к ним лично", response = "Смело или глупо. Площадь услышит одного короля сегодня. Молитесь, чтобы это были вы.", statDeltas = fixed_array(0, 5, 3, 0, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть Малрик разгоняет своё стадо", response = "Тогда он владеет чудом и бунтом. Вы владеете стенами. Пока что.", statDeltas = fixed_array(0, 12, 0, 0, 0, -8, 0, 0, -5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, две роты перекрестились вместо того, чтобы маршировать, когда я приказал разогнать толпу у ворот. Я слышал — странники разбили лагерь, потому что вы не могли или не хотели их очистить. Борвин говорит: церковный налог съел их жалованье. Малрик говорит: небо выше вас. Я слышал долг переворота Солта и повозки Кары в одном дыхании. Скажите — дисциплинировать солдат, платить им или позволить Церкви кормить их семьи и красть их клятвы.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заплатить армии из королевских резервов", response = "Золото прежде Бога. Солдатская теология. Дорого — пока не дешевле мятежа.", statDeltas = fixed_array(0, -8, 15, -22, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Арестовать зачинщиков", response = "Тогда повесьте людей, перекрестившихся. Казармы запомнят. Капелланы закричат.", statDeltas = fixed_array(0, -15, 8, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть Малрик кормит их семьи", response = "Вы просите алтарь платить, а меч повиноваться. Даю месяц.", statDeltas = fixed_array(0, 10, -6, 5, 0, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я слышал — вы ограничили мой церковный налог, захватили моё зерно, кормили грешников в казармах и позволили странникам назвать вас отречённым у ворот. Мне не нужен клинок. Я приостанавливаю обряды в столице — ни крещений, ни обрядов умирания, ни тихой совести для ваших стражников. Либо вы подчиняете корону Божьей книге счёта, либо правите городом, который боится ада больше, чем вас.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Преклониться", response = "Тогда отречение умирает на площади и живёт в капитуле. Вы выживаете. Вы служите.", statDeltas = fixed_array(0, 20, -8, 0, 0, 5, 0, 0, 10)),
                        DialogueChoice(choiceText = "Бросить вызов интердикту", response = "Тогда каждая кафедра назовёт вас проклятым. Я слышал сталь в вашем голосе на тридцатый день. Сталь должна завершить начатое.", statDeltas = fixed_array(0, -20, 12, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Ответить через Арвела", response = "Две церкви, один кровоточащий город. Вы выбрали трещину. Пусть она не расколет вас.", statDeltas = fixed_array(0, -5, 0, 0, 0, 10, 0, -10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, конклав собрался без вас — и небо проголосовало прагматично. Я слышал — вы преклонились, торговались или согнулись, пока интердикт не стал костром. Отречение умирает на площади и живёт в капитуле. Вы уходите помазанным. Вы уходите на поводке. Толпа падает на колени. Рудольф гримасничает. Вы дышите.",
                    choiceCount = 2,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал конклав", response = "Тогда преклоняйтесь, когда попрошу. Небо теперь владеет частью ваших утр.", statDeltas = fixed_array(0, 15, -5, 0, 0, 8, 0, 0, 12)),
                        DialogueChoice(choiceText = "Я услышал братьев", response = "Тогда у Эстедора две веры. Пусть ни одна не расколет вас до весны.", statDeltas = fixed_array(0, -12, 0, 0, 0, 12, 0, -8, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc6BeatsRu : Encounter[16] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — посол Ингвар северных князей. Вы взяли трон Эдвина мечом, и север ещё не решил: король вы, убийца или временная буря. Я здесь, чтобы узнать, как вы собираетесь удержать захваченное — пока у границы не появятся их знамёна.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять его как равного посла", response = "Назовут вас осторожным. Недолго. Потом уважение оценят в монетах и трупах.", statDeltas = fixed_array(0, 0, 2, 0, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Оскорбить князей — трон наш по праву завоевания", response = "Передам ваши слова на север. Ответят зимой и конницей. Вы хлопнули дверью — ждите ответного стука.", statDeltas = fixed_array(0, 0, 5, 3, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Подкупить золотом — выиграть время", response = "Я не дешёв, но поддаюсь убеждению. Услышат: вы покупаете дни, не союз.", statDeltas = fixed_array(0, 0, 0, -10, 0, 2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, князья требуют грамоту: сколько стоил переворот, кто кому должен, и ваша подпись. Без неё королевскую печать не признают.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Подписать акт признания", response = "Тогда просите волков благословить ягнёнка. Смело. Ответят условиями, не гимнами.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Отказать от любых грамот", response = "Чернила дешевле кавалерии. Узнаете, что кончится раньше.", statDeltas = fixed_array(0, 0, 4, 0, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Обменяться актами взаимного признания", response = "Купеческий мир. Борвин проклянёт вас. Князья прочтут ваши книги раньше титулов.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, всадники докладывают о дыме у Серого Перевала — не костры армии, а горящие деревни. Я слышал — Ингвар покинул ваш зал на пятый день довольным или в ярости. Север испытывает границы, когда слова не срабатывают. Усилить перевал, ответить набегом или послать вас договариваться о том, что сталь не должна?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Усилить Серый Перевал", response = "Тогда казна истекает кровью, а север узнаёт: вы дёргаетесь стенами, не конями.", statDeltas = fixed_array(0, 0, 8, -12, 0, 0, 0, -5, 0)),
                        DialogueChoice(choiceText = "Набег на северных разведчиков", response = "Пограничная война к завтраку. Ингвар назовет разбойничеством. Князья — приглашением.", statDeltas = fixed_array(0, 0, 5, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Послать Ингвара к перевалу", response = "Тогда ставим на дипломатию человека, продающего все стороны. Дешевле могил — если сработает.", statDeltas = fixed_array(0, 0, 0, -6, 0, 4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, через три дня ваши жрецы спросят, благословляет ли небо цареубийство. Я слышал — Рудольф укрепил перевал — или ударил по нему. Князья предлагают светскую сделку прежде святой Малрика: признайте их торговые права — и они признают вашу печать. Бог может подождать. Политика — нет.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заплатить северную дань", response = "Тогда Борвин плачет, а перевал молчит. Малрик назовет это продажей души купцам вместо жрецов.", statDeltas = fixed_array(0, -3, 0, -18, 0, 0, 0, 0, 6)),
                        DialogueChoice(choiceText = "Отказать", response = "Тогда встречаете тридцатый день с двумя врагами и без гроссбука. Смелая арифметика.", statDeltas = fixed_array(0, 2, 3, 0, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Предложить двойную торговлю", response = "Коммерция как дипломатия. Селена разбогатеет. Рудольф насторожится. Полезные напряжения.", statDeltas = fixed_array(0, 0, 0, -5, 0, 3, 0, 5, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BORVIN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, договор Ингвара всё ещё пахнет вашим выбором двадцать седьмого дня — дань уплачена, граница удержана или оскорбление в казне. Князья предлагают заём на форты у Серого Перевала или запрет на торговлю, если мы вооружаемся дальше. Я слышал — Малрик ест наш церковный налог. Север ест нашу торговлю. Какого волка кормим?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Взять северный заём", response = "Золото в сундуке, петля на короне. Обычная дипломатия.", statDeltas = fixed_array(0, 0, 5, 20, 0, 0, 0, 0, -5)),
                        DialogueChoice(choiceText = "Отказаться от чужой монеты", response = "Честно и медленно. Рудольф одобрит. Ингвар улыбнётся где-то ещё.", statDeltas = fixed_array(0, 0, 6, -15, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть Селена финансирует перевал", response = "Купцы владеют бастионами. На время. Потом — разговором.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KNOX,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, мои сети поймали северных агентов в нижнем городе — не солдат, писцов. Я слышал — вы укрывали клерков Эдвина или отсекли их; эти люди несут списки тех, кто ещё скорбит о старом короле. Ингвар зовёт их купцами. Я зову их картой ваших врагов. Пытать, обменять или вернуть с посланием?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Вернуть вежливо", response = "Учтивость в кандалах. Он назовет это доверием. Я — привычкой.", statDeltas = fixed_array(0, 0, -2, 0, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Допросить", response = "Чернила и крики. Полезная смесь. Ингвар услышит до заката.", statDeltas = fixed_array(0, 0, 0, 0, 0, -5, 0, 0, 6)),
                        DialogueChoice(choiceText = "Казнить как шпионов", response = "Тогда война говорит диалектом, который все понимают.", statDeltas = fixed_array(0, -3, 6, 0, 0, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я слышал — вы вернули моих агентов, допросили их или повесили. Князья читают вашу привычку так же ясно, как я. Они предлагают хартию: взаимная оборона, общие пошлины, ваша печать рядом с их на Сером Перевале. Подпишите — и север назовёт вас королём на каждом рынке отсюда до зимы.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Подписать союз", response = "Тогда мы партнёры не только в чернилах. Рудольф ворчит. Малрик кипит. Вы дышите.", statDeltas = fixed_array(0, 0, 8, -10, 0, 0, 0, 0, 10)),
                        DialogueChoice(choiceText = "Подписать только торговлю", response = "Половина дружбы. Дешевле — до первого набега.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 8, 0)),
                        DialogueChoice(choiceText = "Отказать", response = "Одиночество — частый финал тех, кто взял трон. Вы выбрали его с открытыми глазами.", statDeltas = fixed_array(0, 0, 5, 0, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Принять условия", response = "Тогда вы данник, не король. Дешевле могил — пока.", statDeltas = fixed_array(0, 0, -8, -25, 0, 0, 0, 0, -8)),
                        DialogueChoice(choiceText = "Отклонить", response = "Тогда Рудольф оправдает жалованье. Ингвар — комиссию. Зима — репутацию.", statDeltas = fixed_array(0, 0, 12, -10, 0, 0, 0, 0, 0)),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, кровь у Серого Перевала — наши или их, смотря кто лжёт. Я слышал — вы подписали хартию Ингвара — или плюнули в его условия. Север проверяет, настоящая ли армия того, кто взял трон. Удерживать, преследовать или просить перемирия, пока снег ещё владеет высотами?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Преследовать в перевал", response = "Победа даёт песни. Поражение — северные проповеди о цене цареубийства.", statDeltas = fixed_array(0, 0, -8, -12, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Держать линию", response = "Дисциплина прежде славы. Люди назовут осторожностью. Казна — мудростью.", statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 0, -6, 0)),
                        DialogueChoice(choiceText = "Перемирие под белым флагом", response = "Тогда снова ставим на слова. Дешевле, если у вас ещё есть кредит у него.", statDeltas = fixed_array(0, 0, -3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, две тысячи северных беженцев теснят брод — голод в княжеских холмах или поводок, чтобы вас опозорить. Я слышал — вы союзники с нами — или объявили врагами. Простолюдины уже смотрят, кормит ли тот, кто взял трон, чужаков, пока вдовы Эдвина просят. Малрик предлагает крещения. Я — политику.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Укрыть беженцев", response = "Милосердие со счётом. Народ увидят — если им позволят смотреть.", statDeltas = fixed_array(12, 0, 0, -10, 0, 6, 0, -15, 0)),
                        DialogueChoice(choiceText = "Развернуть назад", response = "Холодные границы дают чистую арифметику. Громкие проповеди следуют.", statDeltas = fixed_array(-10, 0, 4, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть Арвел кормит их", response = "Тогда Малрик владеет чудом. Вы — стеной. Обычная сделка.", statDeltas = fixed_array(6, 8, 0, 0, 0, 0, 0, -8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, полгода прошло. Я слышал — вы укрыли наших беженцев — или закрыли брод. Князья спрашивают: Эстедор — союзник, рынок или будущая провинция. Обновить хартию, поделиться лекарством от Серого Кашля, если ваши палаты ещё кашляют, или стоять один перед возвращением зимы.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Обновить союз", response = "Тогда ваша печать и наша делят зиму. Рудольф бормочет. Вы терпите.", statDeltas = fixed_array(0, 0, 6, -8, 0, 0, 0, 0, 8)),
                        DialogueChoice(choiceText = "Предложить формулу от чумы", response = "Тогда вы должны нам дыхание. Опасный долг. Лучше, чем осада.", statDeltas = fixed_array(5, -5, 0, 0, 5, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Расторгнуть союз", response = "Тогда мы чужие, помнящие чужие записи казны. Война снова возможна.", statDeltas = fixed_array(0, 0, 4, 0, 0, -3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Отступить с перевала", response = "Тогда дарите им высоты. Двор назовёт миром. Казармы — иначе.", statDeltas = fixed_array(0, 0, -10, 5, 0, 0, 0, 0, -6)),
                        DialogueChoice(choiceText = "Отказать", response = "Тогда Рудольф перестаёт притворяться, что дипломатия — карьера.", statDeltas = fixed_array(0, 0, 15, -20, 0, 0, 0, -10, 0)),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KARA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я слышал последнее требование Ингвара на сто двадцать второй день — союз, отступление или война. Северные покупатели хотят арбалеты. Рудольф хочет их первым. Продаю тому, кто платит и помнит — я слышал ваш кошелёк на сорок седьмой день. Конфискуете мой караван, сравняетесь с их ценой или пустите сталь на север и надеетесь, что она укажет не на вас?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Единоличная власть короны", response = "Тогда армия сыта, а Кара зла. Знакомый баланс.", statDeltas = fixed_array(0, 0, 10, -12, 0, -3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Свободная торговля", response = "Золото течёт. Верности размываются. Война дешевеет для всех.", statDeltas = fixed_array(0, 0, -5, 15, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Продавать только на север", response = "Тогда Рудольф назовет изменой. Ингвар — дружбой. Вы назовёте вторником.", statDeltas = fixed_array(0, 0, -8, 8, 0, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, через три дня великие дома перестанут смотреть с поместий и начнут мерить ваше горло. Я слышал — вы союзники с севером, или разозлили его, или кормили его беженцев, пока ваши провинции голодали. Эшфорд спросит, можете ли вы выиграть войну за рубежом и счёт дома. Прежде чем она приедет — зовёте ли вы дворянские ополчения на перевал или оставляете это королевской войной, которую дома могут игнорировать?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Созвать дворянские ополчения", response = "Тогда они истекают кровью с вами — или строят заговоры, пока вы истекаете. Эшфорд запишет, кто пришёл.", statDeltas = fixed_array(0, 0, 12, 0, 0, 0, -8, 0, 5)),
                        DialogueChoice(choiceText = "Оставить войну делом короны", response = "Тайна сохраняет варианты. И их ножи — до поры.", statDeltas = fixed_array(0, 0, -3, 0, 0, 0, 5, 0, 0)),
                        DialogueChoice(choiceText = "Связать войну с миром", response = "Дипломатия счёта. Эшфорд уважает книги. Уважает ли она вас — её хобби.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, северные полки собираются за перевалом — или так клянутся мои разведчики. Я слышал — великие дома предлагают ополчения — или удерживают их. Ингвар говорит, это учения. Я говорю — часы. Полная мобилизация и пустая казна. Блеф парадами и надежда. Или удар первым и вызов северу ответить, пока гонцы Эшфорд не разнесут сказание.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Полная мобилизация", response = "Тогда каждая монета кормит сталь, пока сталь не кормит нас — или не хоронит.", statDeltas = fixed_array(0, 0, 18, -25, 0, 5, 0, -12, 0)),
                        DialogueChoice(choiceText = "Блеф парадом", response = "Театр с барабанами. Дешевле — пока кто-то не проверит блеф кавалерией.", statDeltas = fixed_array(0, 0, 5, -8, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Превентивный удар", response = "Агрессия как политика. Ингвар назовет разбойничеством. История может назвать выживанием.", statDeltas = fixed_array(0, 0, -10, -15, 0, 0, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, через восемь дней верность вашего двора станет считаемой величиной. Я слышал шёпот: мои князья уже оценили нескольких ваших советников. Я не для признания — я для торга. Сравняйте северное золото, разоблачите покупателей или пусть рынок решит, кому принадлежит ваш завтра.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заплатить королевским золотом", response = "Дорогой трон. Всё же трон — если платежи держатся.", statDeltas = fixed_array(0, 0, 0, -22, 0, 12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Разоблачить северные взятки", response = "Скандал как гигиена. Кто-то повиснет. Кто-то заговорит. Двор узнает страх.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, -6, 0, 0)),
                        DialogueChoice(choiceText = "Тайная сделка", response = "Тогда вы купец и монарх одновременно. Эдрик назвал бы это привычным. Мудрым — нет.", statDeltas = fixed_array(0, 0, 0, 10, 0, -15, 0, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KNOX,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, дворцовая стража продала карты патрулей северным покупателям — я слышал золото Ингвара со сто пятьдесят второго дня в знакомых карманах. Я также слышал — вы голодили казармы на шестьдесят пятый день. Верность — арифметика. Чистите стражу, кормите лучше или скормите Ингвару ложь и надеетесь, что купит.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Чистка стражи", response = "Сталь решает верность, пока не станет следующей проблемой.", statDeltas = fixed_array(0, 0, 6, -10, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Удвоить плату и расследование", response = "Золото и виселицы. Традиционная пара.", statDeltas = fixed_array(0, 0, 4, -15, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Скормить Ингвару ложные карты", response = "Умно. Если поверит — перевал ваш на месяц. Если нет — вооружили его дважды.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, триста пятьдесят дней с тех пор, как клинок дал вам корону, которую север не даровал. Я слышал — дань отвергнута, хартия подписана, беженцы укрыты, карты охранены. Князья завершают год, называя вас союзником — не другом, не вассалом, но тем, кто взял трон, достойным связи. Ваши наследники и наши будут спорить вместе. Лучше, чем в одиночку.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал князей", response = "Тогда пусть ваши наследники спорят с моими в книгах, не на могилах перевала.", statDeltas = fixed_array(0, 0, 8, -10, 0, 0, 0, 0, 15)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc7BeatsRu : Encounter[14] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KASPAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, леди Эшфорд едет с восточных марок через семнадцать дней. Я еду с востока рядом с ней — не под ней. Я слышал — вы истекали кровью за этот трон без наших мечей. Справедливо. Мы тоже не преклонялись. Посадите один восточный дом и назовёте миром — или двух и назовёте балансом?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Обещать Каспару равный статус с Эшфорд", response = "Тогда запомню вас, когда она попытается владеть тайным советом. Восточные поборы могут последовать — если сначала монета.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 4)),
                        DialogueChoice(choiceText = "Эшфорд ведёт восток", response = "Дутьё дешевле войны. Пока. Найду других союзников — Делл, Кроу или ваши виселицы.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -3, 0, 0)),
                        DialogueChoice(choiceText = "Играть их друг против друга", response = "Честный цинизм. Уважаю. Они — нет. Ждите яда в гостеприимстве.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MARIANNA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Эшфорд предлагает снисходительность и петлю для племянника. Я предлагаю монету, кузенов и брачное ложе, от которого держава может забыть клинок, поставивший вас сюда. Моё приданое настоящее — в отличие от некоторых восточных книг, что я могла бы назвать. Откроете казну Делл — или будете ждать разрешения Эшфорд?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять брачные условия Делл в принципе", response = "Тогда мои гонцы едут, прежде чем знамёна Эшфорд взойдут на холм. Любовь — политика на скорости.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 8, 0, 10)),
                        DialogueChoice(choiceText = "Отказать", response = "Тогда продам кузенов Кроу вместо вас. Не удивляйтесь, когда начнётся торг.", statDeltas = fixed_array(0, 0, 0, 0, 0, 3, -5, 0, 0)),
                        DialogueChoice(choiceText = "Требовать доказательства приданого", response = "Мудро. Оскорбительно. Каспар подделает что-нибудь в любом случае. Принесу квитанции — и стражу.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_YVETTE,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я слышал — Делл предложила брак и арифметику. Я предлагаю больше арифметики. Удвоенное приданое, вдвое меньше проповедей и никакой Эшфорд в тайном совете. Женитесь на Кроу — и южные дороги финансируют ваш трон. Женитесь на Делл — и женитесь на её долге.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отдать предпочтение ставке Кроу", response = "Тогда Делл назовёт меня воровкой. Она не ошибается. Она также не громче моей монеты.", statDeltas = fixed_array(0, 0, 4, 12, 0, 0, 6, 0, 0)),
                        DialogueChoice(choiceText = "Заставить Делл и Кроу делить условия", response = "Делить? Будем улыбаться публично и резать в белье. Полезно вам. Дорого кому-то.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 4, 0, 8)),
                        DialogueChoice(choiceText = "Отклонить обеих", response = "Всё — рынок. Вы просто плохо торгуетесь. Смотрите, по какой цене Эшфорд оценит вас.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, -8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Эшфорд, Каспар, Делл и Кроу меряют ваше горло бархатом. Я меряю людьми, у которых нет ничего, кроме голода. Я слышал — вы платили солдатам, прежде чем платили правде. Дайте безземельным титулы с конфискованных поместий — или мы возьмём поля, пока лорды спорят о приданом.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Обещать Реймонду королевские земли от лоялистов Эдвина", response = "Тогда лорды закричат о краже. Я закричу о голоде. Вы — о порядке. Кого-то услышат.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, -10, 0, 0)),
                        DialogueChoice(choiceText = "Отказать", response = "Тогда мы — буря. Буре не нужны титулы. Помните: я предупреждал до похода.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 5, 0, 0)),
                        DialogueChoice(choiceText = "Использовать Реймонда против великих домов", response = "Опасный наём. Пойду, куда укажете — пока не укажу туда, что вам не понравится.", statDeltas = fixed_array(0, 0, 0, 0, 0, -3, -5, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, через три дня леди Эшфорд войдёт в ваш зал — и дворянство станет метром, который держава может читать. Я слышал — Каспар смотрит на восток, Делл и Кроу торгуются за ваше ложе, Реймонд собирает людей, которым нечего терять. Можете прибыть разделёнными, женатыми или вооружёнными. Удивлёнными — нет.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Готовить примирение", response = "Пиры покупают время. Время — варианты. Не путайте ни то, ни другое с безопасностью.", statDeltas = fixed_array(0, 0, 0, -10, 0, 4, 5, 0, 0)),
                        DialogueChoice(choiceText = "Готовить разделение", response = "Тогда сталь прячется за салфетками. Эффективно — если контролируете столовые приборы.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -3, 0, 5)),
                        DialogueChoice(choiceText = "Готовить террор", response = "Страх открывает советы и закрывает горла. Эшфорд заметит. История — тоже.", statDeltas = fixed_array(0, 0, 6, 0, 0, -5, -8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KASPAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, квитанции приданого графини Делл — восточные фальшивые монеты, или фальшивые монеты Эшфорд, сделанные похожими на мои. Я слышал — вы обещали кому-то брак, кому-то баланс, кому-то террор. Обвиняю Делл, прежде чем она обвинит меня. Судите, отложите или позвольте нам дуэлиться без вас?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Встать на сторону Каспара", response = "Тогда Делл закричит о краже. Кроу прошепчет союз. Эшфорд назовет слабым королевством. Наслаждайтесь шумом.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, -6, 0, 8)),
                        DialogueChoice(choiceText = "Встать на сторону Делл", response = "Изгнание — вид смерти. Может вернуться с армиями, если не осторожны.", statDeltas = fixed_array(0, 0, -4, 0, 0, 4, -8, 0, 0)),
                        DialogueChoice(choiceText = "Отложить суд", response = "Тогда кровь на мраморе до конца ужина. По крайней мере узнаете, кто хочет вас живым.", statDeltas = fixed_array(0, 0, 0, 0, 0, -5, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_GOOSE,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — герцог Гусь: крещением, театром и генеалогией, которую мой шут клянётся правдивее вашей. Я слышал — великие дома меряют ваше горло. Я меряю ваше чувство юмора. Поддержите мою претензию — и простолюдины полюбят вас. Повесьте меня — и простолюдины всё равно полюбят меня. Издалека.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Покровительствовать претензии", response = "Гогот и политика. Эшфорд подавится. Народ зааплодирует. Принимаю вашу опасность.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -12, 0, -5)),
                        DialogueChoice(choiceText = "Арестовать шута", response = "Тогда камеры узнают комедию. Мои сторонники — ножи. Выберите, что вас беспокоит больше.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 6, 0, 0)),
                        DialogueChoice(choiceText = "Турнирное доказательство", response = "Сталь против птицы. Принимаю. Приведите лучшего рыцаря — или худшего, для истории.", statDeltas = fixed_array(0, 0, 4, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ASHFORD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, ваш тайный совет — клетка восточных тигров — и один гусь за решёткой. Я слышал — Каспар обвинил Делл, Кроу перебила Делл, Реймонд собрал безземельную сталь. Не разделю совет с Каспаром, если вы не хотите расколоть восток. Выберите, кто сидит, кто стоит, кто уходит в кандалах.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Эшфорд ведёт совет", response = "Тогда восточные поборы умрут с терпением Каспара. Он обвинит вас — справедливо.", statDeltas = fixed_array(0, 0, -6, 0, 0, 0, 10, 0, 5)),
                        DialogueChoice(choiceText = "Двойные восточные места", response = "Разделённая власть. Разделённые ножи. Буду улыбаться, пока один из нас не перестанет.", statDeltas = fixed_array(0, 0, 4, -8, 0, 0, 5, 0, 0)),
                        DialogueChoice(choiceText = "Исключить Эшфорд", response = "Тогда объявляете войну моему дому во всём, кроме имени. Отвечу во всём, кроме милосердия.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, -12, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MARIANNA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, баронесса Кроу сказала залу, что моё приданое — чугун, а кузены — свинопасы. Я слышал — вы смеялись — или не остановили её. Требую удовлетворения: публичное извинение, частый развод от этой политики или дуэль через посредников, прежде чем держава выберет сторону.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заставить Кроу извиниться", response = "Тогда Кроу — враг. Делл — не друг. У вас на два союза меньше и на одну проблему меньше — на неделю.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -8, 0, 0)),
                        DialogueChoice(choiceText = "Заставить Делл уступить ставку", response = "Делл запомнит. Кроу соберёт. Вы купили тишину чьей-то ценой.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, 4, 0, 6)),
                        DialogueChoice(choiceText = "Пусть сразятся через посредников", response = "Тогда кровь до завтрака. Победитель заберёт вашу благосклонность. Проигравший — обиду.", statDeltas = fixed_array(0, 0, -4, 0, 0, 6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, триста людей без полей разбили лагерь на границе Эшфорд — или Делл — или вашей, смотря, кого вы разозлили меньше. Я слышал — великие дома враждуют, пока простолюдины голодают. Завтра иду походом, если не дарите титулы сейчас, не повесите лорда для забавы или не пошлёте рыцарей Эшфорд остановить меня.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Повесить мелкий лордский титул", response = "Тогда дворянство закричит. Реймонд преклонится — сегодня. Вы купили опасного друга.", statDeltas = fixed_array(0, 0, 8, 0, 0, 10, -15, 0, 0)),
                        DialogueChoice(choiceText = "Послать рыцарей Эшфорд раздавить поход", response = "Сталь по крестьянам. Эшфорд получит славу. Вы — вину. Реймонд — мучеников.", statDeltas = fixed_array(0, 0, 6, 0, 0, -12, 5, 0, 0)),
                        DialogueChoice(choiceText = "Пусть дома сами сражаются с Реймондом", response = "Тогда воюю со всеми. Хаос — тоже политика. Вы выбрали зрительское кресло.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, -8, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KASPAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, северный дым всё ещё поднимается — я слышал, Рудольф мобилизовал, пока вы устраиваете вражду. Эшфорд отказывает восточные поборы, если не ведёт их сама. Я отказываю, если не её подчинённый. Делл и Кроу отказывают, пока брак не подписан. Реймонд отказывает, пока земля не дарована. Гусь отказывает, пока не бросят хлеб. Соберите поборы с домов — или соберите эшафот.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Собрать поборы с Эшфорд первой", response = "Тогда она пойдёт с ненавистью и знамёнами. Полезно — если вернётся.", statDeltas = fixed_array(0, 0, 10, -8, 0, 0, -8, 0, 0)),
                        DialogueChoice(choiceText = "Собрать поборы с Каспара", response = "Тогда восток раскалывается открыто. Война может прийти с ваших же марок.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
                        DialogueChoice(choiceText = "Не собирать никого", response = "Тогда дома назовут вас банкротом и правыми. Кара полюбит. Рудольф — нет.", statDeltas = fixed_array(0, 0, 6, -15, 0, 0, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KNOX,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, сегодня ночью движутся ножи — Каспара на Делл, Кроу на Эшфорд, Эшфорд на Реймонда, Реймонда на всех с полем. Я слышал, кого вы повесили и кого пощадили. Могу продать карту, остановить одно лезвие или пустить зиму рассортировать сословие. Кто умрёт в темноте — ваш, если действуете, — их, если заснёте.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Остановить покушение на Эшфорд", response = "Тогда кто-то другой истечёт кровью. Скажу кто — после.", statDeltas = fixed_array(0, 0, 0, -8, 0, -4, 8, 0, 0)),
                        DialogueChoice(choiceText = "Допустить смерть Эшфорд", response = "Тогда восток принадлежит тому, кто переживёт рассвет. Вы выбрали скорость вместо милосердия.", statDeltas = fixed_array(0, 0, -8, 0, 0, 0, -15, 0, 12)),
                        DialogueChoice(choiceText = "Остановить кровь Делл-Кроу", response = "Мир на юге за цену. Каспар или Реймонд заплатят в темноте.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 4, 0, 0)),
                        DialogueChoice(choiceText = "Пусть ножи падают", response = "Тогда продам мемуары. Вы унаследуете короче совет и длиннее кошмары.", statDeltas = fixed_array(0, 0, 0, 0, 0, -12, 0, 0, 10)),
                        DialogueChoice(choiceText = "Нокс берёт контракт", response = "Чисто. Преступно. Ваше. Назовите и заплатите.", statDeltas = fixed_array(0, 0, 0, -12, 0, -8, 0, 0, 8)),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ILANA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я пишу первый черновик вашего правления, пока кровь сохнет.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Назвать Примирением", response = "Льстиво. Хрупко. Напишу, что нужно — не то, что заслужено.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 6, 0, 0)),
                        DialogueChoice(choiceText = "Назвать Террором", response = "Честно. Жестоко. Будущие лорды прочтут, прежде чем строить заговоры.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -6, 0, 6)),
                        DialogueChoice(choiceText = "Подкупить летопись", response = "Дорогая фикция. Нокс всё равно продаст настоящую главу.", statDeltas = fixed_array(0, 0, 0, -15, 0, -8, 3, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, великие дома вынесли свой вердикт.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал сословие", response = "Тогда правите с тенью Эшфорд на плече. Эффективно — если любите ножи в спину.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 12, 0, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc8BeatsRu : Encounter[9] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — Морвен, палач, который превращает политику в петлю. В камерах Эдвина до сих пор сидят люди, клявшиеся его призраку. Я слышал, вы очистили двор, обратили домашних или позволили шёпоту ходить по залам. Нижний подземелье задыхается от тесноты. Повесьте лоялистов, продайте прощение за монету или опустошите камеры и бросьте вызов королевству.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Повесить зачинщиков", response = "Тогда страх узнает ваш почерк. Лоялисты умрут. Испуганные подчинятся.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 0, 0, 5)),
                        DialogueChoice(choiceText = "Продать прощение", response = "Справедливость как пошлина. Борвин назовёт это грубостью. Я называю это работой.", statDeltas = fixed_array(0, 0, 0, 15, 0, -4, -5, 0, 0)),
                        DialogueChoice(choiceText = "Опустошить камеры", response = "Опасное милосердие. Освобождённые могут полюбить вас — или зарезать. Я точу сталь в любом случае.", statDeltas = fixed_array(0, 0, -5, 0, 0, 10, 0, 0, -6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Малрик присылает имена — раскольников, проповедников супа, людей, называющих вас утратой в рифму. Я слышал, вы преклонились, восстали или раскололи Церковь. Небеса хотят еретиков. Корона хочет предателей. Моя плаха вмещает обоих, если вы её расширите. Сжечь церковные списки, повесить королевские списки или повесить всех и пусть толпа разберётся со священным писанием.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Повесить список Церкви", response = "Тогда Малрик улыбнётся, а улицы прошепчут *марионетка*. Эффективно — если вам нравятся священные ошейники.", statDeltas = fixed_array(-6, 12, 0, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Повесить только королевских предателей", response = "Тогда Малрик назовёт вас светским тираном. Солдаты назовут вас последовательным. Я назову это занятостью.", statDeltas = fixed_array(0, -8, 5, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Заменить штрафами", response = "Золото вместо шей. Священники ненавидят это. Купцы любят. Я смазываю петли.", statDeltas = fixed_array(0, -4, 0, 8, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, шахтёры Ярека и мельники Руты постучали в зернохранилище инструментами, не предназначенными для помола. Я слышал реквизицию, очереди за супом или гниющие запасы. Голодные не читают уставы — они читают пустые миски. Повесьте бунтовщиков, чтобы научить арифметике, помилуйте их, чтобы научить милосердию, или повесьте капитана, стрелявшего первым, и помилуйте остальных.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Массовое повешение", response = "Тогда провинции узнают страх. Они могут не узнать верности. Оба держат троны — ненадолго.", statDeltas = fixed_array(-12, 0, 8, 0, 0, 0, 0, -3, 0)),
                        DialogueChoice(choiceText = "Повесить офицеров, помиловать шахтёров", response = "Хирургическая петля. Простолюдины могут назвать это справедливостью. Офицеры назовут предательством. Оба могут быть правы.", statDeltas = fixed_array(4, 0, -4, 0, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Помиловать всех", response = "Тогда Рудольф ворчит, а Арвел молится. Я без дела. Редко и опасно.", statDeltas = fixed_array(10, 0, 0, 0, 0, 8, 0, -8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, лихорадочные лазареты прислали мне троих, которые проснулись крича и не замолкли. Я слышал бутыли Миры, чудеса Малрика или более дешёвый отвар Одо. Безумие — не измена, но измена легче объяснить толпе. Повесьте безумных, чтобы успокоить площадь, заприте их в тихих камерах Морвен или финансируйте уход Миры и назовите это королевским милосердием.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Повесить безумных", response = "Жестокая ясность. Площадь спит. Лазареты кричат громче там, где никто не слушает.", statDeltas = fixed_array(0, 0, 4, 0, -5, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Королевские лечебницы", response = "Дорогое милосердие. Мира назовёт это запоздалым. Семьи назовут по-своему.", statDeltas = fixed_array(0, 0, 0, -12, 8, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Частные камеры Морвен", response = "Тихий ужас. Лучше громкого. Летописи всё равно могут узнать.", statDeltas = fixed_array(0, 0, 0, 0, 3, -4, 0, 0, 3)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, великие дома присылают предварительные списки — имена, которые они хотят убрать, прежде чем склонить колено. Я слышал Эшфорд, Каспара, Делл и Кроу в одном предложении со словом *измена*. Разблокировка Знать приближается к дню сто семьдесят пятому. Повесьте простолюдинов сейчас, чтобы предупредить знать, откажите всем дворянским спискам, пока не приедет Эшфорд, или продайте ускоренные суды тому, кто больше заплатит.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отказать в дворянских списках", response = "Тогда сверстники возненавидят вас рано. Вы можете возненавидеть их позже. Честная сделка.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, -6, 0, 4)),
                        DialogueChoice(choiceText = "Повесить двух простолюдинов как предупреждение", response = "Театр для скоро прибывающих. Жестоко. Эффективно. Я занята.", statDeltas = fixed_array(-5, 0, 4, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Продать ускоренные суды", response = "Торговля предшествует пиру. Нокс где-то улыбается. Я точу сталь.", statDeltas = fixed_array(0, 0, 0, 12, 0, -5, -8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, леди Эшфорд скоро приедет и измерит вашу плаху, как портной измеряет позвоночник. Я слышал, вы заблокировали дворянские списки, продали суды или заполнили двор бунтовщиками и еретиками. Повесьте предателя из стражи Эдвина, чтобы произвести впечатление, опустошите двор, чтобы лишить её рычага, или позвольте ей прислать первое имя и посмотрите, подчинитесь ли вы.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Повесить последнего капитана Эдвина", response = "Тогда восточные глаза видят петлю. Западные призраки видят предупреждение. Оба смотрят на вас.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 4, 0, 0)),
                        DialogueChoice(choiceText = "Опустошить двор", response = "Смелое милосердие перед разблокировкой знати. Она назовёт это подкупом совести.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -6, 0, 5)),
                        DialogueChoice(choiceText = "Принять первое имя Эшфорд", response = "Тогда вы вешаете, прежде чем она склонит колено. Партнёрство — или подчинение. Она узнает, что из этого.", statDeltas = fixed_array(0, 0, 0, 0, 0, -10, 8, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_TALEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — Тален — я решаю проблемы, которые плаха не может оценить. Я слышал, петля Морвен занята, книги Нокса громче, а списки Эшфорд длиннее. За сундук серебра я могу потерять дворянское имя до рассвета. За секрет — повесить простолюдина вместо него. За ничего — сказать рынку, какой вы король. Что покупаете?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заплатить Талену", response = "Тогда одна глотка дышит, хотя не должна. Вы забудете, какая. Я — нет.", statDeltas = fixed_array(0, 0, 0, -18, 0, -8, 6, 0, 0)),
                        DialogueChoice(choiceText = "Отказать и разоблачить", response = "Тогда я исчезну, прежде чем проснётся Морвен. Вы получите проповедь и потеряете удобство.", statDeltas = fixed_array(0, 0, 3, 0, 0, 8, -4, 0, 0)),
                        DialogueChoice(choiceText = "Нанять его для короны", response = "Республика петли. Морвен возненавидит меня. Вы полюбите тихие списки.", statDeltas = fixed_array(0, 0, 0, -25, 0, -12, 0, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, камеры снова полны — бунтовщики, еретики, безумцы, имена, которые Тален потерял, имена, которые лорды предоплатили. Я слышал, Великие дома точат ножи друг на друга. Объявите массовую прощение и опустошите мой двор, объявите массовое повешение и научите королевство молчанию, или продолжайте по случаю, пока сверстники убивают в переулках без меня.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Массовая амнистия", response = "Тогда я смазываю неиспользуемые петли. Королевство назовёт это слабостью, пока не назовёт мудростью.", statDeltas = fixed_array(8, 0, -6, 0, 0, 15, 0, 0, 0)),
                        DialogueChoice(choiceText = "Массовое повешение", response = "Тогда птицы обходят площадь. Порядок приходит. Милосердие уезжает верхом.", statDeltas = fixed_array(-10, 4, 10, 0, 0, -15, 0, 0, 0)),
                        DialogueChoice(choiceText = "По случаю", response = "Самый тяжёлый трон. Я буду спать меньше. Вы — едва.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 3, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, девяносто три дня с тех пор, как Морвен впервые считал лоялистов Эдвина — и королевство знает вас по петле. Я слышал еретиков, бунтовщиков, безумцев и потерянные имена Талена. Площадь тиха. Сердце — нет. Вы купили кровавый мир. Он держится — пока не перестанет.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал плаху", response = "Тогда я напишу *петля* и надеюсь, что страх переживёт обиду.", statDeltas = fixed_array(0, 0, 10, 0, 0, -10, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc9BeatsRu : Encounter[7] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — Мерибальд — я читаю то, что небо пишет цифрами, а не рифмами. Комета пересекает созвездие Эдвина в ночь, когда вы заняли его стул. Я слышал клинок, вычищенный или одержимый двор и Малрика, всё ещё решающего налоговую категорию вашей души. Комета подтверждает цареубийство каждому, кто смотрит вверх. Заглушите меня, выслушайте или продайте Церкви.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Провозгласить комету", response = "Тогда знать смотрит вверх, прежде чем на вас. Опасно — если небо передумает.", statDeltas = fixed_array(0, -10, 0, 0, 0, 0, 8, 0, 6)),
                        DialogueChoice(choiceText = "Только частная аудиенция", response = "Благоразумно. Скучно. Толпа всё равно смотрит вверх без вашего разрешения.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Отдать его Сайрусу", response = "Инквизиторы любят кометы — ненадолго. Вы не услышите мою башню снова — пока не услышите.", statDeltas = fixed_array(0, 12, 0, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, дом рождения леди Эшфорд сидит в восточном квадранте — амбициозный, хрупкий, любящий племянников и петлю. Я слышал голод, милосердие плахи и механизм утраты короны Церкви. Карта говорит, она измерит ваше правление к дню сто семьдесят пятому. Опубликуйте её знамение — она возненавидит вас. Скройте — она испугается. Продайте — она завладеет вами.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Опубликовать карту Эшфорд", response = "Тогда она приезжает уже оскорблённой. Подготовленной. Опасной. Как восточная погода.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -6, 0, 5)),
                        DialogueChoice(choiceText = "Поделиться картой с Эшфорд лично", response = "Тогда вы покупаете её въезд пророчеством. Она выставит счёт в местах совета.", statDeltas = fixed_array(0, 0, 0, -8, 0, -4, 8, 0, 0)),
                        DialogueChoice(choiceText = "Сжечь карту", response = "Тогда вы правите без небесного предпросмотра. Она принесёт свои знамения — и солдат.", statDeltas = fixed_array(0, 4, 4, 0, 0, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, рыночная площадь наполняется для двух проповедей — моей математики затмения и зимней рифмы Пророка. Я слышал, Делл и Кроу оскорбляют друг друга стихами, пока Нокс продаёт карты. Толпа хочет одну истину. Небо предлагает две. Регулируйте обоих, примите моё или пусть площадь выберет и назовите это политикой.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Королевская астрономия", response = "Тогда рифмы Пророка уходят под землю. Подземные рифмы обрастают зубами.", statDeltas = fixed_array(-10, 6, 0, 0, 0, 0, 0, 0, 8)),
                        DialogueChoice(choiceText = "Лицензировать обоих", response = "Бюрократия чудес. Малрик ненавидит. Борвин любит. Я терплю.", statDeltas = fixed_array(0, -4, 0, 10, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть толпа выберет", response = "Тогда вы не король знаков — вы судья. Судей бьют обе команды.", statDeltas = fixed_array(8, -6, 0, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_PROPHET,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Мерибальд считает огни, пока я считаю вдохи. Я слышал, вы провозгласили его комету, сожгли карту Эшфорд или продали знамения, как соль. Толпа спросила, какому королю служит зима. Я говорю: тому, кто кормит лёгкие и уши. Он говорит: тому, кто читает карты. Выберите победителя, выберите обоих или выберите молчание и пусть вера бьётся с верой без вашего знака.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Поддержать Пророка", response = "Тогда башня Мерибальда темнеет. Малрик рычит. Бедные напевают ваше имя. Опасная музыка.", statDeltas = fixed_array(12, -12, 0, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Поддержать Мерибальда", response = "Тогда мой рынок сжимается. Его башня светлеет. Знать улыбается. Крестьяне считают.", statDeltas = fixed_array(-8, 4, 0, 0, 0, 0, 8, 0, 0)),
                        DialogueChoice(choiceText = "Никого не вешать", response = "Сталь решает проповеди, пока не станет следующей проповедью. Мы оба помним.", statDeltas = fixed_array(-6, 0, 8, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, дом престолонаследия мерцает — линия Эдвина, ваша линия, никакой линии. Я слышал шёпот племянников, Эшфорд, картографирующую свой совет, и Илану, пишущую главы кровью или чернилами. Карта показывает пробел в форме ребёнка до дня триста двадцатого. Опубликуйте — соперники двинутся. Подавите — соперники угадают. Подделайте — соперники засмеются — пока не перестанут.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Опубликовать пробел", response = "Честный ужас. Честная политика. Ингвар прочтёт это раньше Малрика.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 4, 0, -10)),
                        DialogueChoice(choiceText = "Подавить карту", response = "Тогда Нокс продаст фальшивые монеты к пятнице. Вы выбрали тайну. Тайна дорога.", statDeltas = fixed_array(0, 0, 0, -8, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Подделать благоприятное знамение наследника", response = "Красивое мошенничество. Эшфорд проверит небо. Я буду смотреть.", statDeltas = fixed_array(0, -8, 0, 0, 0, -10, 0, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Нокс продал ваш час рождения Ингвару, Эшфорд и пророку, притворяющемуся, что не покупает. Я слышал северную сталь, гильдейские книги и уличные рифмы делят мусор моей башни. Звёзды выравниваются для утечки — не воды, секретов. Повесьте Нокса, купите моё молчание или опубликуйте всё и бросьте вызов королевству переварить правду разом.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Опубликовать покупателей Нокса", response = "Тогда двор паникует равномерно. Редкое достижение. Звёзды иногда одобряют хаос.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -12, 0, 5)),
                        DialogueChoice(choiceText = "Купить молчание Мерибальда", response = "Дорогая астрономия. Нокс ничего не забывает. Я тоже — на время.", statDeltas = fixed_array(0, 0, 0, -20, 0, -4, 0, 0, 6)),
                        DialogueChoice(choiceText = "Повесить Нокса", response = "Слишком поздно для копий. Достаточно рано для проповеди. Мы оба знали это.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, двести тринадцать дней с тех пор, как комета подтвердила то, что начал клинок — и двор смотрит вверх, прежде чем вниз. Я слышал провозглашённые карты, размеченную Эшфорд, разоблачённого Нокса, престолонаследие, взвешенное в углах. Вы правите как король-астролог. Малрик зовёт это ересью. Знать зовёт служением. Башня зовёт это вторником.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал звёзды", response = "Тогда правите по карте и стулу. Пусть оба согласятся о престолонаследии.", statDeltas = fixed_array(0, -10, 0, 0, 0, 0, 10, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc10BeatsRu : Encounter[6] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_PROPHET,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, у меня нет имени, потому что имена для людей, умирающих раз. У меня есть зима — три мороза, три короля, один трон. Я слышал, клинок дал вам стул Эдвина, пока его двор ещё дышал. Я слышал, Малрик всё ещё решает налоговую категорию вашей души. Рынок хочет знак. Заглушите меня, выслушайте или продайте Церкви?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Выслушать публично", response = "Тогда у зимы третий голос — ваш, Малрика и мой. Опасная музыка. Бедные будут напевать.", statDeltas = fixed_array(0, -8, 0, 0, 0, 8, 0, -3, 0)),
                        DialogueChoice(choiceText = "Отдать его Сайрусу", response = "Инквизиторы любят безымянные языки. Вы не услышите мой снова — пока не услышите.", statDeltas = fixed_array(0, 10, 0, 0, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Игнорировать", response = "Мудро. Скучно. Большинство зим таковы. Я вернусь, когда кашель дойдёт до алтаря.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_PROPHET,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, лазареты кашляют, колокола бьют. Я слышал, вы финансировали бутыли Миры — или святую воду Малрика — или ни то ни другое и назвали благоразумием. Я проповедую то, чему учит лихорадка: трон — лёгкое, королевство выдыхает долг, а тот, кто взял трон — тот король, который перестанет дышать последним. Крестите мою проповедь, запретите или пусть больные решают?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Пусть проповедует в лазаретах", response = "Тогда больные слышат два лечения. Одно может спасти вас. Одно — меня. Ни одно не гарантировано.", statDeltas = fixed_array(0, -10, 0, 0, 5, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Запретить уличные проповеди во время чумы", response = "Запреты кормят мучеников. Кашель не читает указы. Помните, я предупреждал.", statDeltas = fixed_array(0, 6, 4, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Присвоить", response = "Тогда я говорю вашу зиму вашим акцентом. Полезно. Ложно. Достаточно популярно.", statDeltas = fixed_array(0, 3, 0, -8, 0, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_GOOSE,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, лис появился на трёх ногах и ушёл на четырёх. Я — голос, который он одолжил — смешной, да. Вчера в нижнем рынке хромые ходили. Малрик зовёт это насмешкой. Народ зовёт надеждой с хвостом. Коронуйте лиса, коронуйте Церковь или коронуйте здравый смысл и отвергните нас всех.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять культ лиса", response = "Тогда знамёна понесут усы. Малрик отвернёт от церкви млекопитающее. Вы будете смеяться, пока повинности не откажутся маршировать.", statDeltas = fixed_array(0, -18, 0, 0, 0, 12, 0, -5, 0)),
                        DialogueChoice(choiceText = "Сжечь святыню", response = "Пепел и визги. Народ запомнит, кто убил чудо. Летописи тоже.", statDeltas = fixed_array(0, 15, 5, 0, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Расследовать мошенничество", response = "Умно. Посредники всегда есть. Верующие тоже. Нельзя посадить обоих.", statDeltas = fixed_array(0, 0, 0, -5, 0, -3, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_PROPHET,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, леди Эшфорд измерила ваше горло, и великие дома делали заметки — я слышал, Каспар обвиняет, Делл визжит, Кроу торгуется, Раймонд марширует, а Гусь кричит, пока плаха даже не прогрелась. Я пророчу дом, склонившийся публично и интригующий в полотне — или интригующий в могиле. Назовите лжеца — или назовите себя — зима вернётся в любом случае.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Использовать пророчество против соперничающего дома", response = "Тогда вы владеете моим языком, как кинжалом. Льстит. Недостойно. Эффективно.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -8, 0, 10)),
                        DialogueChoice(choiceText = "Осудить пророчество в зале", response = "Смелые слова. Эшфорд улыбнётся. Провинции пожмут плечами. Зима держит свой календарь.", statDeltas = fixed_array(0, 4, 0, 0, 0, -4, 6, 0, 0)),
                        DialogueChoice(choiceText = "Пригласить его к столу Эшфорд", response = "Опасный театр. Я буду говорить на языках, которые они понимают: долг, наследники и голод.", statDeltas = fixed_array(0, 0, 0, -6, 0, 8, -4, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_PROPHET,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Верность больше не проповедь — это арифметика. Я слышал золото Ингвара и сети Нокса в одном предложении в прошлом месяце. Я пророчу нож, покупающий вам рассвет, и поцелуй, продающий ваши карты. Повесите пророка, называющего предателей, или повесьте предателей, которых он называет?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Пусть называет имена на площади", response = "Тогда площадь решает раньше ваших судей. Быстро. Грязно. Ваше, если контролируете исход.", statDeltas = fixed_array(0, 0, 6, 0, 0, -10, 0, 0, 8)),
                        DialogueChoice(choiceText = "Арестовать", response = "Тогда я стану мучеником, которого хотел Малрик, а Сайрус не смог сделать. Повесьте голос, не послание.", statDeltas = fixed_array(0, 8, -3, 0, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Частная аудиенция", response = "Тогда мы грешим вместе в тишине. Я укажу на Нокса. Вы укажете на того, кто служит вам меньше всех.", statDeltas = fixed_array(0, 0, 0, -10, 0, 8, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_PROPHET,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, триста двадцать пять дней с тех пор, как клинок сделал вас королём, а зима — моей тенью. Улицы зовут вас Зимним королём — не за жестокость, за слушание. Малрик зовёт ересью. Народ зовёт первым честным правлением. Вы короновали знамение. История рифмует ваше имя.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал последний знак", response = "Тогда правите проповедями и сталью. Малрик отвернёт от церкви год. Народ запомнит рифмы.", statDeltas = fixed_array(12, -20, 0, 0, 0, 15, 0, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc11BeatsRu : Encounter[10] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KNOX,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Ингвар — не мой единственный покупатель в этом месяце. Я слышал северную сталь, гильдейские книги и имена слуг снизу ваших ступеней. Иностранный дом предлагает монету за состав вашего совета — кто спит у двери, кто подписывает указы, кто всё ещё шепчет об Эдвине. Продайте карту двора, откажите и выследите покупателей или наймите меня эксклюзивно и молитесь, чтобы я остался голодным.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отказать и вычистить покупателей", response = "Тогда я исчезну до заката — или продам кому-то злее. Вы выбрали сталь вместо торговли.", statDeltas = fixed_array(0, 0, 8, -8, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Принять иностранный контракт", response = "Тогда у вашего двора есть хозяин за морем. Эффективно. Изменнически. Часто оба.", statDeltas = fixed_array(0, 0, 0, 20, 0, -15, 0, 0, -10)),
                        DialogueChoice(choiceText = "Эксклюзивный контракт короны", response = "Дорогой питомец. Я кусаю чужие руки. Не вашу — пока цена не изменится.", statDeltas = fixed_array(0, 0, 0, -18, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, верность вот-вот станет параметром, который королевство читает вслух. Я слышал иностранное предложение Нокса, утечки слуг со ступеней и северные карты, проданные дважды. Паранойя держит троны — политика держит королевства. Вычистите двор до дня двести шестидесятого, управляйте шпионами, как казной, или доверьтесь кому-то — назовите кого — и бросьте вызов статистике.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Политика чистки", response = "Тогда я напишу *железо* рано. Двор не поблагодарит. Он подчинится — ненадолго.", statDeltas = fixed_array(0, 0, 10, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Политика управляемых шпионов", response = "Умно. Изнурительно. Как править двумя дворами — одним видимым, одним пронумерованным.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Политика доверия", response = "Опасная простота. Если ошибётесь — ошибётесь великолепно.", statDeltas = fixed_array(0, 0, 4, 0, 0, 10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_OSRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, указы ходят рукой Эдвина — моей рукой — вашей рукой — и фальшивая монета изысканна. Я слышал, Нокс продаёт карты, иностранные дома торгуются, а разблокировка Верность приближается. Повесьте подделывателя, удостоверьте каждую печать болью или используйте ложные указы, чтобы кормить ложных покупателей и узнать, кто клюёт.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Удостоверить все печати", response = "Тогда политика ползёт, а доверие растёт сантиметрами. Редко. Скучно. Полезно.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 6)),
                        DialogueChoice(choiceText = "Кормить фальшивая монетами покупателей Нокса", response = "Тогда лжецы едят лжецов. Если сравнят записи — вы сгорите. Пока — узнаете.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Повесить Осрика", response = "Удобно. Фальшивые монеты продолжатся без шеи для обвинения. Вы выбрали театр.", statDeltas = fixed_array(0, 0, 0, 0, 0, -12, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_TALEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я ношу маску, потому что имена — это контракты — и я ещё не решил, кому служу. Двор требует аудиенции. Я слышал поддельные указы, иностранные предложения и споры о покое Эдвина под ступенями. Снимите маску публично, дайте частный совет или откажите в аудиенции и пусть слух назовёт меня племянником, призраком или купеческим принцем.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Публичная аудиенция", response = "Тогда слух становится зрелищем. Зрелище дешевле правды и вдвое громче.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -8, 0, 10)),
                        DialogueChoice(choiceText = "Частный совет", response = "Тогда вы правите шёпотом. Я буду шептать в ответ. Нокс попытается слушать.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, 8)),
                        DialogueChoice(choiceText = "Отказать в аудиенции", response = "Тогда я исчезну, и появятся десять масок. Вы выбрали тайну. Тайна умножается.", statDeltas = fixed_array(0, 0, 4, 0, 0, -4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RAENA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, трое претендуют на мой пост — наёмник, ветеран Эдвина, иностранный меч. Я слышал предложение Нокса, фальшивые монеты Осрика и маску в вашем совете. Параметр Верность говорит, королевство смотрит, кому вы доверяете у двери. Оставьте меня, ротируйте стражу или удвойте посты и обанкротьте доверие.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Оставить Раэну", response = "Тогда я остаюсь. Если подведёте меня — подведёте простоту.", statDeltas = fixed_array(0, 0, 4, -8, 0, 12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Ротировать стражу", response = "Тогда убийцы планируют вокруг смен. Вы тоже.", statDeltas = fixed_array(0, 0, 6, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Нанять иностранный меч", response = "Тогда я уйду до заката. Вы выбрали новизну вместо памяти.", statDeltas = fixed_array(0, 0, 10, -15, 0, -15, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ILANA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я пишу первый черновик вашего правления, пока ножи продают вторые черновики за границу. Я слышал Нокса, иностранные дома и Талена, оценивающего ваши утра. Купите мою главу эксклюзивно, пусть главы утекают и узнайте, кто читает, или сожгите черновики и правите без летописи — слепо, но без цитат.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Эксклюзивная летопись", response = "Тогда вы покупаете предложения. Дорого. Стоит того, если допишете книгу.", statDeltas = fixed_array(0, 0, 0, -12, 0, 8, 0, 0, 8)),
                        DialogueChoice(choiceText = "Пусть главы утекают", response = "Тогда Нокс наживается, а вы узнаёте. Оба могут быть правдой. Оба больно.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -6, 0, 0)),
                        DialogueChoice(choiceText = "Сжечь черновики", response = "Тогда слух владеет вашими глаголами. Солдаты могут предпочесть это.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BORVIN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, истинные книги ходят, пока дворовые лгут. Я слышал, Нокс продал страницы, Илана — главы, иностранные дома купили оба. Числа Борвина говорят, Верность — статья роскоши. Опубликуйте истинные счета, кормите ложные цифры шпионам или повесьте писцов и притворитесь, что арифметика моральна.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Опубликовать истинные счета", response = "Тогда двор паникует равномерно. Честность — вид чистки.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, -8, 0, 0)),
                        DialogueChoice(choiceText = "Кормить ложные книги", response = "Умно, пока два лжеца не сравнят. Всё же — купите время.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Повесить писцов", response = "Театр. Числа продолжаются без шей для обвинения.", statDeltas = fixed_array(0, 0, 0, 8, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_TALEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я — Тален — посредник, шептун, счёт, предъявленный после ущерба. Я слышал, Нокс работает на три короны: вашу, Ингвара и замаскированную третью, платящую слухами о престолонаследии. Разоблачите Нокса, присоединитесь к аукциону или наймите меня лгать всем троим и назовите это политикой.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Разоблачить Нокса публично", response = "Тогда он исчезнет, и появятся десять меньших Ноксов. Вы выбрали проповедь вместо решения.", statDeltas = fixed_array(0, 0, 5, -5, 0, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Присоединиться к аукциону", response = "Тогда вы снимаете верность еженедельно. Я одобряю подписки.", statDeltas = fixed_array(0, 0, 0, -25, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Нанять Талена лгать всем трём коронам", response = "Тогда правда умирает от переработки. Вы выживаете — пока лжи не встретятся.", statDeltas = fixed_array(0, 0, 0, -12, 0, -8, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_VARN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, двор перечисляет предателей — или лоялистов — в зависимости от того, кто пишет списки. Я слышал Нокса, Талена, иностранные мечи и поддельные указы. Вычистите стражу и научите страху, реформируйте клятвы и научите терпению или игнорируйте двор и научите презрению. Параметр Верность прочтёт ваш выбор вслух.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Вычистить стражу", response = "Тогда страх держит порядок, пока страх не найдёт лидера.", statDeltas = fixed_array(0, 0, 10, -10, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Реформировать клятвы", response = "Золото и книги. Традиционная пара. Менее кроваво. Не без крови.", statDeltas = fixed_array(0, 0, 4, -15, 0, 12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Игнорировать двор", response = "Тогда сплетни становятся политикой без вашей подписи.", statDeltas = fixed_array(0, 0, -5, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, шестьдесят семь дней с иностранного предложения Нокса — и двор знает вас по чистке. Я слышал охоту на фальшивые монеты, отказ в масках, замену стражи, козлов отпущения в книгах. Железный канцлер — страх держит совет в узде. Верность выживает. Теплота — нет.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал двор", response = "Тогда я напишу *железо* и надеюсь, что страх переживёт обиду.", statDeltas = fixed_array(0, 0, 12, 0, 0, -6, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc12BeatsRu : Encounter[10] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_TALEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я говорю за мальчика, которого вы надеялись увидеть туманом — племянника Эдвина, изгнанного, голодного и уставшего от вашего стула. Я слышал гильдейских кредиторов, звёздные карты и великие дома, измеряющие ваше правление. Отвергните его и назовите меня лжецом, ищите его и назовите меня проводником или используйте мою претензию, чтобы напугать Эшфорд, прежде чем она снова приедет. Маска остаётся. Вопрос — нет.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отвергнуть племянника", response = "Тогда туман сгущается. Кто-то всё равно поверит. Лжи нужно лишь терпение.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 6, 0, 8)),
                        DialogueChoice(choiceText = "Искать племянника", response = "Тогда охотники умножаются. Я продаю направления. Другие продают ловушки. Вы купили движение.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, -6)),
                        DialogueChoice(choiceText = "Использовать претензию как оружие", response = "Опасный театр. Эшфорд назовёт клеветой. Рынок назовёт политикой.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -8, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ASHFORD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, брак был устроен, чтобы заткнуть племянника Эдвина — страховка моей семьи, не ваша романтика. Я слышала, маска произносит его имя в столице. Заключите тишину браком, выследите мальчика для меня или признайте, что племянник жив, и пусть Эшфорд брокерует его клетку. Я не делю власть с туманом.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять брак Эшфорд", response = "Тогда мой дом владеет восточным миром и вашей историей престолонаследия. Вы получаете поводок. Я — будущее рядом с короной.", statDeltas = fixed_array(0, 0, 4, 0, 0, -8, 12, 0, 10)),
                        DialogueChoice(choiceText = "Отказать в браке", response = "Тогда мы соперники, не родня. Я запомню, кто отказался от страховки.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -10, 0, -5)),
                        DialogueChoice(choiceText = "Брокеровать племянника Эшфорд", response = "Совместная королевская опека. Унизительно. Эффективно. Очень по-восточному.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 6, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_TALEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, три покупателя хотят местонахождение мальчика — Эшфорд, Ингвар и замаскированный посредник, платящий слухами о престолонаследии. Я слышал, вы отвергли, искали или брокеровали племянника. Я продаю координаты высшему ставшему, если вы не перебьёте всех и не купите туман целиком.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Перебить всех покупателей", response = "Тогда туман сдан внаём, не рассеян. Я ценю подписки.", statDeltas = fixed_array(0, 0, 0, -25, 0, 4, 0, 0, 8)),
                        DialogueChoice(choiceText = "Продать Эшфорд", response = "Тогда восточная страховка активируется. Вы купили мир поводком для мальчика.", statDeltas = fixed_array(0, 0, 0, 0, 0, -10, 10, 0, 6)),
                        DialogueChoice(choiceText = "Пустить аукцион", response = "Тогда Нокс наживается, а вы узнаёте. Оба больно. Обычный вторник.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KNOX,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, писцы Ингвара предлагают монету за мальчика, соответствующего описанию племянника — живого, мёртвого или убедительно мёртвого. Я слышал аукцион Талена и брачные интриги Эшфорд. Продайте племянника на север и купите мир, откажите и вооружите легенду или подделайте труп и продайте фальшивую монету дважды.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отказать", response = "Тогда Ингвар оценит ваше упрямство в стали. Внутренние проблемы лучше иностранных корон — обычно.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, -4)),
                        DialogueChoice(choiceText = "Продать местонахождение на север", response = "Тогда вы снимаете мир кровью, которую можете никогда не увидеть. Эффективно. Чудовищно. Знакомо.", statDeltas = fixed_array(0, 0, 0, 15, 0, -12, 0, 0, -15)),
                        DialogueChoice(choiceText = "Подделать смерть", response = "Тогда три книги владеют мёртвым мальчиком, который может ещё дышать. Я восхищаюсь учётом.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, -6, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_OSRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, записи о рождении расходятся — племянник Эдвина рождён весной, летом или вовсе не рождён. Я слышал, Нокс продал на север, Тален — координаты, Эшфорд — брак. Подделайте записи, доказывающие незаконнорождённость племянника, восстановите первоначальную линию Эдвина или сожгите архив и пусть победит туман.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Подделать незаконнорождённость", response = "Тогда чернила убивают мальчиков, которых сталь не находит. Эшфорд назовёт грубостью. Может сработать.", statDeltas = fixed_array(0, 4, 0, 0, 0, -8, 0, 0, 12)),
                        DialogueChoice(choiceText = "Восстановить записи Эдвина", response = "Честная бумажная работа. Опасная честность. Королевство читает книги, как проповеди.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -6, 0, -10)),
                        DialogueChoice(choiceText = "Сжечь архив", response = "Тогда историки возненавидят вас. Историки — не армии. Пока.", statDeltas = fixed_array(0, 0, 6, 0, 0, -6, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ILANA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я пишу две главы престолонаследия — вашу по клинку, его по крови. Я слышала поддельные рождения, северные ставки и маски в совете. Опубликуйте главу племянника и расколите королевство, опубликуйте только вашу и назовите его мифом или опубликуйте обе и пусть королевство выберет свою головную боль.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Опубликовать главу племянника", response = "Тогда королевство прочтёт гражданскую войну до завтрака. Честно — если выживете.", statDeltas = fixed_array(8, 0, 0, 0, 0, 6, 0, 0, -12)),
                        DialogueChoice(choiceText = "Только глава короны", response = "Тогда сноски обрастают зубами в переулочных проповедях. Вы выбрали дисциплину повествования.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 5, 0, 10)),
                        DialogueChoice(choiceText = "Двойная публикация", response = "Демократия катастрофы. Смело. Изнурительно. Очень в этом году.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 0, 0, -6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, северные князья хотят племянника Эдвина — как заложника, наследника или святого. Я слышал, Нокс продал координаты, Илана опубликовала главы, Осрик подделал рождения. Сдайте мальчика за союз, отвергните и сражайтесь весной или предложите свою историю престолонаследия и бросьте вызов, назовут ли это ложью.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отвергнуть север", response = "Тогда мы оценим ваш отказ в стали следующей весной. Последовательная дипломатия.", statDeltas = fixed_array(0, 0, 8, 0, 0, 4, 0, 0, 6)),
                        DialogueChoice(choiceText = "Сдать племянника", response = "Тогда вы покупаете мир кровной линией Эдвина. Унизительно. Иногда прочно.", statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, -12)),
                        DialogueChoice(choiceText = "Предложить хартию того, кто взял трон", response = "Смелое богохульство против крови. Я донесу послание на север. Они засмеются — затем посчитают.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -8, 0, 15)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_TALEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, маска снимается, потому что истории должны кончиться или взорваться. Я слышал главы, фальшивые монеты, северные ставки и ваше правление, измеренное туманом. Я могу быть племянником Эдвина, пешкой Эшфорд, сыном купца или маской, которую носит Нокс ради прибыли. Потребуйте правду публично, примите частный ответ или объявите, что сама маска — единственный наследник, который имеет значение.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Публичное снятие маски", response = "Тогда королевство коллективно ахнет. Полезный звук. Опасный звук.", statDeltas = fixed_array(8, 0, 0, 0, 0, 10, 0, 0, -15)),
                        DialogueChoice(choiceText = "Частный ответ", response = "Тогда вы несёте правду одни какое-то время. Тяжелее корон. Легче толп.", statDeltas = fixed_array(0, 0, 0, -8, 0, 6, 0, 0, 5)),
                        DialogueChoice(choiceText = "Отклонить снятие маски", response = "Тогда туман сохраняется. Туман избирал королей прежде. Может снова.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, девяносто четыре дня с тех пор, как маска назвала племянника Эдвина — и мальчик мёртв на бумаге, на деле или достаточно убедительно. Я слышал охоты, фальшивые монеты, северные ставки и страховку Эшфорд. Племянник мёртв. Ваша линия стоит на клинке и книге. Охраняйте её — у тумана есть двоюродные братья.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал линию", response = "Тогда я напишу *выживший* и закрою книгу племянника.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 15)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_PROPHET,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, зима кончается, и истинная линия спит в земле или чернилах. Я слышал, вы убили мальчика, миф или обоих. Моё последнее знамение престолонаследия коротко: **стул пожирает имена**. Ваше остаётся — пока.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знамение", response = "Тогда туман смыкается. Весна открывает другие книги.", statDeltas = fixed_array(0, -4, 0, 0, 0, 3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc13BeatsRu : Encounter[29] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Серый кашель вернулся в южных портах — та же лихорадка, что опустошила Эстедор при короле Эдвине. У меня есть формула лекаря из восточных дворов: дистиллированная ивовая кора, серный дым и настойка, прерывающая лёгочный кашель. Мои ученики сварят её в течение месяца, но мне нужны золото короны и ваше слово, что ни один священник не сожжёт мои перегонные кубы как колдовство.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Финансировать лечение полностью", response = "Тогда пусть королевство увидит короля, тратящего на дыхание, а не на знамёна. Я начну перегонные кубы сегодня ночью.", statDeltas = fixed_array(0, 0, 0, -22, 8, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Финансировать наполовину", response = "Половина покупает полшанса. Я не позволю больным ждать вашей осторожности, но попробую.", statDeltas = fixed_array(0, 0, 0, -12, 4, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Казна не может позволить", response = "Тогда готовьте казну к похоронным свечам вместо солдат. Я сделаю, что смогу, без вашей монеты.", statDeltas = fixed_array(0, 5, 0, 0, -6, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Вернуться через две недели", response = "Две недели — тысяча кашлей. Я посчитаю их для вас, Величество.", statDeltas = fixed_array(0, 0, 0, 0, 0, -2, 0, 0, 0)),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, настойка работает в тестовых лазаретах — но медленно. Трое пациентов, кашлявших кровью в воскресенье, к четвергу могли говорить полными предложениями. Чтобы сварить достаточно для нижних кварталов, мне нужно либо больше золота от вашего казначея, либо разрешение привлечь рекрутированных работников на перегонные кубы. Я не буду притворяться, что это мягкая просьба.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заплатить за ускоренное производство", response = "Тогда больные получат бутыли до следующей луны. Борвин возненавидит меня, но лазареты благословят вас.", statDeltas = fixed_array(0, 0, 0, -15, 6, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Использовать труд армии на перегонных кубах", response = "Солдаты пахнут смолой и уксусом, но их руки твёрды. Рудольф назовёт это унижением. Я — выживанием.", statDeltas = fixed_array(0, 0, -8, 0, 8, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Формулы достаточно", response = "Терпение — добродетель здоровых. Я растяну то, что есть, и помолюсь, чтобы хватило вовремя.", statDeltas = fixed_array(0, 0, 0, 0, 2, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, лихорадка перешла реку. Я пришла не просить — считать. Сорок мёртвых в нижних кварталах на этой неделе, и священники уже зовут это судом над троном. Вы отказали мне раз. Откажете ли арифметике тоже?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Вы были правы", response = "Поздняя монета всё ещё покупает дыхание. Я не буду стыдить вас за перемену ума — только за то, сколько умерло, пока вы менялись.", statDeltas = fixed_array(0, 0, 0, -25, 10, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Карантин нижних кварталов", response = "Стены держат кашель внутри и ненависть вместе с ним. Может замедлить лихорадку. Не замедлит слухи.", statDeltas = fixed_array(0, 0, -5, 0, 5, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Стоять на отказе", response = "Тогда запишите мои слова, Величество: когда костры дымят, не спрашивайте, почему народ зовёт вас Королём пепла.", statDeltas = fixed_array(0, 8, 0, 0, -12, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, вы просили две недели. Я дала. Двадцать семь мёртвых в нижних кварталах, пока ваш казначей считал монеты. Я вернулась — не умолять, а узнать, может ли тот, кто взял трон позволить себе спасти королевство, которое захватил, или Эстедор должен гореть дважды.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Финансировать лечение полностью", response = "Тогда пусть королевство увидит короля, тратящего на дыхание, а не на знамёна. Я начну перегонные кубы сегодня ночью.", statDeltas = fixed_array(0, 0, 0, -22, 8, 1, 0, 0, 0)),
                        DialogueChoice(choiceText = "Финансировать наполовину", response = "Половина покупает полшанса. По крайней мере, вы не заставили меня ждать третью неделю.", statDeltas = fixed_array(0, 0, 0, -12, 4, -1, 0, 0, 0)),
                        DialogueChoice(choiceText = "Казна всё ещё не может позволить", response = "Тогда готовьте казну к похоронным свечам вместо солдат.", statDeltas = fixed_array(0, 5, 0, 0, -6, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, верующие уже шепчут, что ваша корона отравляет души чужеземным лекарём. Настойка Целительницы Миры может прервать кашель, но не исцелит королевство, думающее, что его король доверяет травам больше небес. Предоставьте Церкви попечение над лечением — и народ поблагодарит Бога, а может, забудет клинок, поставивший вас сюда.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Лекарство остаётся у Миры", response = "Тогда пусть больные благодарят лекаря, а священники учатся смирению. Я не сожгу её кубы — но и не благословлю.", statDeltas = fixed_array(0, -12, 0, 0, 5, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Совместное распределение", response = "Благоразумный компромисс. Верующие видят руку Бога; больные всё ещё глотают настойку. Оба могут назвать милосердием.", statDeltas = fixed_array(0, 8, 0, -5, 3, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть Церковь возьмёт лечение", response = "Тогда чудо принадлежит алтарю, а имя Миры исчезает из книги. Королевство услышит, что небо спасло Эстедор — не вы.", statDeltas = fixed_array(0, 15, 0, 0, -5, -3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, вы отказали лекарю, и лихорадка поднимается. Мои братья предлагают то, чего не может Мира: реликвии, молитву и святую воду из святыни святого Аларика. Народ напуган. Если не купите восточные настойки, позволите ли хотя бы Богу попробовать?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять священные средства", response = "Тогда преклонитесь с подданными и молитесь. Если лихорадка сломается, небо получит славу. Если нет — винить будет некого.", statDeltas = fixed_array(0, 18, 0, 0, -8, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Последнее предложение Миры", response = "Король, ждущий, пока костры дымят, чтобы купить милосердие, заслуживает лекаря, которого отказал. Финансируйте её — или похороните гордость с мёртвыми.", statDeltas = fixed_array(0, -5, 0, -20, 8, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Ни лекаря, ни чудо", response = "Тогда королевство узнает, что его король не доверяет ничему: ни золоту, ни Богу, ни дыханию народа.", statDeltas = fixed_array(0, -8, 0, 0, -10, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, мои люди кашляют перед боем. Бутыли Миры сначала доходят до великих домов, а до казарм — если доходят. Либо лечение идёт с армией, либо армия идёт на ваш трон. Я не угрожаю легкомысленно. Угрожаю, когда солдаты не могут вдохнуть.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Солдаты первыми", response = "Тогда мои люди запомнят, кто сохранил им дыхание. Знать будет кричать. Пусть кричит.", statDeltas = fixed_array(0, 0, 12, 0, 5, 3, -10, 0, 0)),
                        DialogueChoice(choiceText = "Общие лазареты первыми", response = "Хлеб и дыхание выигрывают больше верности, чем знамёна. Мои солдаты проклянут вас — пока тоже не перестанут кашлять.", statDeltas = fixed_array(0, 0, -8, 0, 4, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Продать дозы знати, чтобы пополнить казну", response = "Золото в сундуках, лихорадка в казармах. Надеюсь, ваши стены крепче вашей арифметики.", statDeltas = fixed_array(0, 0, -5, 15, -5, -12, 10, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, кашель в кухнях дворца и казармах стражи. У меня пациенты на соломе в большом зале. Это уже не лазарет нижнего города — это сама столица. Либо вы найдёте золото, которое мне отказали, либо найдёте людей, чтобы оградить половину города, пока двор не подхватит то, что есть у простолюдинов.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Экстренное финансирование", response = "Поздно для элегантности, но не для дыхания. Дайте монету и отойдите от моих столов.", statDeltas = fixed_array(0, 0, 0, -30, 15, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Огненный карантин заражённого квартала", response = "Факелы у ворот и крики за стенами. Может замедлить лихорадку. Не замедлит песни, которые поют о вас.", statDeltas = fixed_array(0, 0, -15, 0, 8, -15, 0, 0, 0)),
                        DialogueChoice(choiceText = "Само пройдёт", response = "Тогда напишите мой отчёт для летописей: тот, кто взял трон смотрел, как Эстедор кашляет дотла, и назвал это терпением.", statDeltas = fixed_array(0, 0, 0, 0, -20, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, священники помазывают больных святой водой и зовут это лечением. В двух лазаретах кашель прекратился. В четырёх ухудшился — потому что дали благословённую воду вместо настойки. Я не стану в вашей часовне называть это мошенничеством, но в вашем дворе скажу: небо не варит ивовую кору. Верните бутыли от Малрика — или хороните больше, чем грешников.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Вернуть лечение лекарю", response = "Тогда пусть священники хранят чудеса, а я — пациентов. Выбирайте, кто живёт по фактам, а не по проповеди.", statDeltas = fixed_array(0, -15, 0, 0, 10, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Удвоить долю Церкви", response = "Вера не останавливает лёгочный кашель. Но может остановить бунты. Я омываю руки — вам понадобится больше святой воды для этого.", statDeltas = fixed_array(0, 12, 0, 0, -8, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Разделить город", response = "Королевство, разделённое бутылями и благословениями. Пусть переживёте эксперимент, Величество.", statDeltas = fixed_array(0, 5, 0, -8, 2, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, кашель сломлен. В нижних кварталах кричат ваше имя, не плюясь — я не думала, что доживу до этого при правлении того, кто взял трон. Формула держится. Летописи назовут вас королём, спасшим дыхание. Я назову королём, заплатившим за бутыли, когда другие платили за молитвы.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал лазареты", response = "Тогда пусть следующая чума найдёт корону, помнящую цену воздуха.", statDeltas = fixed_array(0, 0, 0, -5, 5, 12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, лихорадка угасает — но не прежде, чем оставила шрам на трёх провинциях. Мы спасли многих. Мы похоронили больше. Я не буду лгать и звать это триумфом. Королевство назовёт вас Израненным королём — или тем, кто взял трон, сделавшим достаточно. Оба правдивы. Ни одно не утешает.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал счёт мёртвых", response = "Названная вслух скорбь заживает быстрее отрицаемой. Вы сосчитали мёртвых. Это важно.", statDeltas = fixed_array(0, 0, 0, -10, 3, 10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, костры дымят день и ночь. Эстедор горит дважды — раз при Эдвине, раз при вас. У меня больше нет бутылей и терпения к королям, считающим монеты, пока лёгкие наполняются кровью. Выжившие уже зовут вас Королём пепла. Я с ними не спорю.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал костры", response = "Тогда скажу раз для книги: Король пепла, второй своего имени. Переживите это, если сможете.", statDeltas = fixed_array(0, 10, 0, 0, -5, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Бог исцелил королевство. Лихорадка сломалась там, где падала святая вода и не прекращалась молитва. Народ преклоняется — не перед клинком, взявшим трон, а перед рукой, державшей чашу. Конклав назовёт вас помазанным тем, кто взял трон. Мира назовёт театром. Верующие назовут спасением.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал небесный вердикт", response = "Тогда преклоняйтесь, когда попрошу. Небо теперь владеет частью этой истории.", statDeltas = fixed_array(0, 15, 0, 0, 3, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ODO,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я предупреждал, что восточная настойка Миры — не единственный отвар, ни самый безопасный. Три лазарета приняли мой состав маски и уксуса — кашель прервался быстрее, но двое мужчин проснулись крича и больше не спали. Семьи стучат камнями. Летописи назовут вас лекарем безумного короля. Я зову вас королём, выбравшим спешку.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал кричащие лазареты", response = "Безумие на площади хуже лихорадки в лазарете. Помните, я предупреждал.", statDeltas = fixed_array(0, 0, 0, -15, 5, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, северные князья прислали меня с поздравлениями и острым вопросом. Их порты улавливают ветер из Эстедора и хотят формулу Миры, прежде чем Серый кашель перейдёт горы. Поделитесь свободно и обретите союзников. Продайте — и обретите монету. Откажите — и обретите подозрение в худший возможный сезон.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Поделиться формулой", response = "Щедро. Князья назовут вас государственным деятелем. Борвин назовёт дураком. Оба могут быть правы.", statDeltas = fixed_array(0, 0, 0, -5, 3, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Продать формулу", response = "Торговля, не благотворительность. Они заплатят и возненавидят вас. Знакомая дипломатия.", statDeltas = fixed_array(0, 0, 0, 20, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Отказать", response = "Тогда вооружите границы. Лихорадка путешествует быстрее послов, но подозрение — ещё быстрее.", statDeltas = fixed_array(0, 0, 5, 0, 0, -3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, площадь преклоняется перед Малриком и его святой водой. Мои перегонные кубы всё ещё работают ночью — вы знаете, чьи бутыли прервали кашель. Я не прошу статуй. Я спрашиваю, помнит ли корона, кто варил милосердие, которое Церковь теперь продаёт с ладаном.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Публично отдать должное Мире", response = "Тогда я встану рядом с вами, и пусть священники подавятся гимнами. Опасно. Честно. Как вы.", statDeltas = fixed_array(0, -10, 0, 0, 3, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Частная благодарность", response = "Золото возьму. Славу заслужила бы. Останусь — ради больных, не ради вас.", statDeltas = fixed_array(0, 0, 0, -12, 5, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Церковь выиграла мир", response = "Тогда соберу кубы и покину ваш двор. Лазареты найдут меня. Вы найдёте Малрика.", statDeltas = fixed_array(0, 8, 0, 0, -5, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, выжившие хотят день, чтобы назвать мёртвых, прежде чем глашатаи закричат о победе. Три провинции изранены, и вы ещё не произнесли счёт вслух. Дайте им мемориал — или дайте молчание — но знайте, что молчание тоже путешествует.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Установить общенациональный день траура", response = "Тогда королевство узнает, что его король считает мёртвых так же, как живых. Это реже, чем лечение.", statDeltas = fixed_array(5, 0, 0, -8, 0, 12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Только местные бдения", response = "Холодно. Практично. Народ похоронит своих и запомнит, кто не пришёл.", statDeltas = fixed_array(0, 0, 3, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Превратить траур в налоговые льготы для худших провинций", response = "Хлеб и прощение — древнейшее милосердие. Примут. Но всё равно прошепчут имена.", statDeltas = fixed_array(8, 0, 0, -15, 0, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я служил трём королям и похоронил двоих. Двор шепчет, что Серый кашель закончит то, что начал переворот. Я не несу утешения. Я несу арифметику: бунты прорастают на кладбищах. Скажите, намерены ли вы пережить эту лихорадку — или лишь пережить следующую проверку.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Собрать все ресурсы", response = "Тогда перестаньте считать монеты и начните считать вдохи. Принесу весь совет, что остался.", statDeltas = fixed_array(0, 0, 8, -10, 5, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Искать благословение Церкви", response = "Ладан не опустошит костры. Но испуганные убивают королей раньше лихорадок. Мрачная сделка.", statDeltas = fixed_array(0, 12, 0, 0, -3, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Если королевство хочет нового короля", response = "Смелые слова. Кладбище полно смелых королей. Надеюсь, вы — исключение.", statDeltas = fixed_array(0, 0, 5, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BORVIN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, скандальные лазареты стоили вам больше, чем бутыли настойки. Семьи требуют компенсации, кредиторы Одо — ответов, а мои книги — короля, всё ещё способного считать. Королевство заплатит за безумие одним способом или другим. Как хотите, чтобы кровоточила ваша казна?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Открыть сундуки", response = "Дорого. Честно. Тот выбор, который держит корону на голове — если что-то ещё может.", statDeltas = fixed_array(0, 0, 0, -25, 3, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Оштрафовать имение Одо и конфисковать его запасы", response = "Кровь из камня, но камни трескаются. Семьи назовут справедливостью. Одо — воровством.", statDeltas = fixed_array(0, 0, 0, 12, -3, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Сказать, что корону ввели в заблуждение", response = "Трусость, одетая в политику. Дёшево сегодня. Оплачено кинжалами завтра.", statDeltas = fixed_array(0, 0, 0, 5, 0, -12, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, нижние кварталы хотят статую — не святого, не солдата, а короля, финансировавшего бутыли. Вульгарно, льстит и политически полезно. Борвин говорит, это стоит золота. Я говорю, покупает нечто реже: того, кто взял трон, которого помнят за дыхание, а не за кровь.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Финансировать статую", response = "Тогда стойте неподвижно достаточно долго, чтобы вас вырезали. Даже тот, кто взял трон, может иметь один честный портрет.", statDeltas = fixed_array(5, 0, 0, -10, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Отказать от тщеславия", response = "Мудрее. Камень не кашляет. Живые пациенты — да.", statDeltas = fixed_array(0, 0, 0, -8, 8, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Поставить на постамент Малрика", response = "Вы насмехаетесь над обоими. Я возьму квартал. Пусть священники возьмут камень.", statDeltas = fixed_array(0, 8, 0, 0, 0, -3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, северные князья закрыли горные перевалы для караванов Эстедора. Зовут осторожностью. Я зову запахом костров на ветру. Соседи больше не боятся клинка того, кто взял трон. Они боятся вашего кашля.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Послать лекаря и золото", response = "Слишком поздно для гордости. Если докажете, что лихорадка угасает, они могут открыть ворота. Могут.", statDeltas = fixed_array(0, 0, 0, -18, 5, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Угрожать ответными мерами, если держат перевалы закрытыми", response = "Угрожать королевству, которое хрипит? Их лучники не кашляют. Ваши — могут.", statDeltas = fixed_array(0, 0, 8, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Принять изоляцию", response = "Одиночество — как сжимаются империи. Но так некоторые короли переживают зиму.", statDeltas = fixed_array(0, 0, 0, -5, 3, 0, 0, -8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Святой Престол посылает весть: они канонизировали бы чудо Эстедора и назвали вас его орудием на земле. Помазанный тот, кто взял трон самим Римом. Мира зовёт воровством. Верующие — судьбой. Что отвечу?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять канонизацию", response = "Тогда преклонитесь ещё раз. Трон становится алтарём. Враги теряют лучший аргумент.", statDeltas = fixed_array(0, 18, 0, 0, 0, 5, 0, 0, 10)),
                        DialogueChoice(choiceText = "Отклонить", response = "Гордо. Престол не забудет. Крестьяне, видевшие работу святой воды, тоже.", statDeltas = fixed_array(0, -8, 3, 0, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Предложить Миру как святую", response = "Вы заставите Рим подавиться правдой. Восхищаюсь порывом. Письмо не доставлю.", statDeltas = fixed_array(0, -15, 0, 0, 3, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, безумные лазареты породили троих бунтовщиков, разбивших череп сборщика налогов поддоном. Тюрьмы полны, семьи хотят кровь за кровь. Я могу повесить бунтовщиков и успокоить площадь — или вы найдёте другой способ ответить на безумие, рождённое вашим лечением.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Повесить бунтовщиков", response = "Плаха скрипит. Площадь затихает. Тишина — не то же, что прощение.", statDeltas = fixed_array(-8, 0, 5, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Помиловать", response = "Милосердно. Опасно. Сборщики вооружатся. Народ запомнит.", statDeltas = fixed_array(8, 0, -5, 0, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Финансировать лечебницы", response = "Дорогое милосердие. Бунтовщики живут. Королевство узнает, что вы считаете безумие своим грехом.", statDeltas = fixed_array(0, 0, 0, -20, 5, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ARVEL,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я кормлю бедных у ворот моего монастыря. В последнее время они говорят о Сером кашле больше, чем о хлебе. Лихорадка угасла, но скорбь — нет. Они спрашивают, финансирует ли тот, кто взял трон, оплативший бутыли, имя для их мёртвых — или выживание — единственное милосердие, которое они увидят.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Финансировать провинциальные мемориалы", response = "Тогда я прочту их имена вслух у моих ворот. Это больше, чем предлагают большинство тронов.", statDeltas = fixed_array(5, 0, 0, -12, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Послать церковные молитвы", response = "Молитвы стоят меньше камня. Голодные узнают, что вы выбрали.", statDeltas = fixed_array(0, 8, 0, 0, 0, -3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Выживание", response = "Тогда они двинутся дальше — и запомнят, что вы сказали им это.", statDeltas = fixed_array(0, 0, 3, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, год поворачивается, и кашель — память. Когда летописи напишут о вашем правлении, они начнут с лихорадки — и кончат восстановленным дыханием. Я хоронила пациентов и хвалила вас в одном вдохе. Королевство назовёт вас Королём-целителем. Я не буду спорить.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал наследие", response = "Тогда пусть следующая чума найдёт корону, помнящую цену воздуха.", statDeltas = fixed_array(0, 0, 0, 0, 5, 10, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, год поворачивается, и кашель — память — но шрамы остаются в трёх провинциях. Летописи не назовут это триумфом. Назовут выживанием со счётом. Израненный король. Честно. Непопулярно. Как большинство правд, стоящих сохранения.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал наследие", response = "Выживание — своя гимн. Мёртвые могут не согласиться.", statDeltas = fixed_array(0, 0, 3, 0, 0, 3, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я служил трём королям и похоронил двоих. Год кончается, и костры всё ещё тёплы. Когда королевство назовет ваше правление, оно не начнёт с переворота — оно начнёт с кашля. Уже зовут вас Королём пепла. Я не смягчу.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал наследие", response = "Тогда переживите имя. Имена легче гробов, но длятся дольше.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, год закрывается, и небо всё ещё владеет историей. Народ зовёт вас королём, которого спасли святые. Солдаты зовут марионеткой священника. Знать зовёт полезным. Престол напишет «король, благословлённый Церковью». Мира — нет. История редко угождает всем.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал небесную книгу", response = "Тогда преклоняйтесь, когда попрошу. Небо теперь владеет частью вашей памяти.", statDeltas = fixed_array(0, 12, 0, 0, 0, 5, 0, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, год кончается, и люди всё ещё просыпаются кричать по ночам. Кашель сломался, но с ним сломалось нечто иное. Летописи не будут говорить об ивовой коре — они будут говорить о более дешёвом отваре и короле, выбравшем спешку. Лекарь безумного короля. Я всё ещё ухаживаю за лазаретами. Я всё ещё помню.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал наследие", response = "Слишком поздно для некоторых. Не слишком поздно для следующего лазарета. Останусь — не ради вас, ради них.", statDeltas = fixed_array(0, 0, 0, -10, 8, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Использовать состав Одо в двух тестовых лазаретах", response = "Быстро и опасно. Если мужчины закричат — помните, вы выбрали скидку вместо осторожности.", statDeltas = fixed_array(0, 0, 0, 5, 5, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Придерживаться формулы Миры", response = "Мудро. Скучно. Дорого. Качества короля, который может пережить год.", statDeltas = fixed_array(0, 0, 0, 0, 3, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Финансировать обоих", response = "Наука через соперничество. Мне нравится. Мире — нет. Больные могут выиграть — или заплатить.", statDeltas = fixed_array(0, 0, 0, -10, 6, 0, 0, 0, 0)),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

