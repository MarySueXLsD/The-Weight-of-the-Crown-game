require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
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
                    prompt = "Ваше Величество, я Лисса. Я меняю простыни и делаю вид, что не считаю пятна. В ночь переворота в трёх спальнях горели свечи после полуночи. Слуги знают, кто где спал — и кто не спал вовсе. Сплетню можно повесить, купить или выслушать.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Выслушать её приватно", response = "Тогда я говорю тихо и беру дорого. Правда — это работа, а не верность.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Заткнуть её", response = "Тогда шёпоты уходят под землю. Подземные шёпоты плесневеют. Вы выбрали молчание.", statDeltas = fixed_array(0, 0, 3, 0, -3, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Заплатить за молчание", response = "Золото закрывает губы. Но не открывает сердца. Монету я всё равно возьму.", statDeltas = fixed_array(0, 0, 0, -10, 0, 3, 0, 0, 0)),
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
                    prompt = "Ваше Величество, меня зовут Герцог Гусь — я придворный шут с грамотой. Двор хочет смеяться, пока амбары не опустели. Я могу высмеять двор, высмеять вас — или молчать, и пусть напряжение гниёт. Малрик ненавидит мой клюв. Казармы его обожают. Выбирайте мишень.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Осмеять двор", response = "Тогда знать краснеет, чернь ликует. Опасная комедия. Восхитительная комедия.", statDeltas = fixed_array(0, 0, 4, 0, 0, 8, -6, 0, 0)),
                        DialogueChoice(choiceText = "Высмеять меня — я выдержу", response = "Смело. Двор расслабляется, потому что вы не дрогнули. Кое-кто может забыть, что вас надо бояться.", statDeltas = fixed_array(0, 0, 0, 0, 5, 5, 0, 0, -4)),
                        DialogueChoice(choiceText = "Заставить шута замолчать", response = "Тогда зал учится шептать вместо смеха. Шёпоты менее смешны и более остры.", statDeltas = fixed_array(0, 4, 0, 0, 0, -5, 0, 0, 0)),
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
                    prompt = "Ваше Величество, кухня слышит клятвы, которых не слышит часовня. Слуги шепчутся о рассказах Лиссы и шутках шута и спрашивают одно: будет ли новый король кормить тех, кто ему готовит? Сначала накормить слуг, проверить кухни — или делать вид, что кухня не политика.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Сначала пайки для персонала", response = "Тогда горшки благословят ваше имя раньше глашатаев. Дорого — но лестница согревается.", statDeltas = fixed_array(0, 0, 0, 0, 4, 10, 0, -6, 0)),
                        DialogueChoice(choiceText = "Проверить кухни", response = "Тогда ложки прячутся, а шёпоты заостряются. Порядок без любви. Знакомая дворцовая музыка.", statDeltas = fixed_array(0, 0, 0, 8, 0, -6, 0, 3, 0)),
                        DialogueChoice(choiceText = "Один котёл для всех", response = "Опасная солидарность. Называть её благородной не стану, пока не сработает.", statDeltas = fixed_array(4, 0, 0, 0, 0, 6, 0, -4, 0)),
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
                    prompt = "Ваше Величество, Лисса продаёт истории. Я продаю молчание. Мой меч охраняет вашу дверь, а не вашу репутацию. Позвольте удвоить пост и припугнуть болтунов, позвольте лестнице говорить свободно и докажите, что переживёте это, — или не доверяйте ни мне, ни ей.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Доверять Раэне", response = "Тогда Лисса усвоит страх. Я усвою сверхурочные. Дверь остаётся вашей.", statDeltas = fixed_array(-4, 0, 5, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Доверять лестнице", response = "Тогда я слышу всё и не повторяю ничего — если вы не спросите. Работа труднее. Двор лучше.", statDeltas = fixed_array(0, 0, 0, 0, 3, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Не доверять никому", response = "Тогда мы обе будем на вас в обиде поровну. Подозрительность любит компанию. Нокс — тоже.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 4)),
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
                    prompt = "Ваше Величество, в спальне Эдвина до сих пор зажигают свечи — не из веры, по привычке. Запечатайте комнату — и призраки останутся. Займите её сами — и знать назовёт это оскорблением. Отдайте верным слугам — и поэты заплачут. Лестница смотрит, каким королём вы бываете ночью.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Запечатать покои", response = "Тогда поэты скорбят, а слуги дышат свободнее. Оба имеют значение — на разных этажах.", statDeltas = fixed_array(0, 5, 0, 0, 3, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Открыто занять покои", response = "Смелое оскорбление памяти. Одни назовут это силой, другие — кощунством: смотря кто потерял родных.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -8, 0, 8)),
                        DialogueChoice(choiceText = "Подарить покои преданному персоналу", response = "Громм то ли плачет, то ли ругается — не разберу. Вы купили тепло символом.", statDeltas = fixed_array(0, 0, 0, 0, 0, 12, -4, -3, 0)),
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
                    prompt = "Ваше Величество, площадь хочет хлеба, но сначала возьмёт шутку. Я могу подколоть корону перед голодной толпой — или подколоть Малрика и посмотреть, умеет ли Церковь смеяться. Публичная насмешка рождает доверие — или толпу с вилами. Выбирайте жертву или отмените представление.",
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
                    prompt = "Ваше Величество, я купил память горничной и расписание поварёнка. История Лиссы о ночи переворота уже записана в трёх книгах — у Солта, у меня и скоро у Эшфорд. Вычистите слуг, которые продают, перекупите покупателей — или дайте истории утечь и посмотрите, кто всё ещё мечтает о кресле Эдвина.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Казнить продавцов", response = "Тогда лестница замирает. Страх работает. Верность притворяется, что работает. Оба выставляют вам счёт.", statDeltas = fixed_array(-8, 0, 6, 0, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Перебить Нокса ценой", response = "Тогда вы арендуете молчание еженедельно. Я ценю постоянных клиентов.", statDeltas = fixed_array(0, 0, 0, -15, 0, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пустить историю переворота в утечку", response = "Тогда двор ничего не контролирует — зато вы узнаете, кто зашевелится. Опасный урок.", statDeltas = fixed_array(4, 0, 0, 0, 0, -4, 0, 0, 6)),
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
                    prompt = "Ваше Величество, сорок дней прошло с тех пор, как Лисса считала ночные свечи переворота, — и лестница произносит ваше имя, не сплёвывая. Я слышал: кухни накормлены, двери охраняются, шутки направлены на двор, а не корону, Нокс перебит ценой. Преданный персонал. Редкость под узурпатором. Берегите это, пока Эшфорд не начнёт мерить верхние залы.",
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
                    prompt = "Ваше Величество, я Рута с западных мельниц. Амбары кашляют пылью там, где раньше лежало зерно. Церковные сборщики Малрика добираются до деревень раньше ваших. Я приехала не за стихами. Голодные мельники помнят, кто забрал урожай, — и винят не всегда погоду.",
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
                    prompt = "Ваше Величество, двор ждёт жаркого по праздникам, а когда лорды нервничают, праздник каждый день. Рута говорит, западные мельницы шлют пыль вместо муки. Мои печи могут печь для города или держать полным стол двора — но не всё сразу. Какие разжигать?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Печь хлеб для города", response = "Тогда простой народ почует хлеб из дворца и поверит вам. Казна почует только дым — и заплачет.", statDeltas = fixed_array(4, 0, 0, -8, 0, 8, 0, -6, 0)),
                        DialogueChoice(choiceText = "Держать стол двора полным", response = "Лицемерие со специями. Слуги болтают. Они всегда болтают.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 4, -5, 0)),
                        DialogueChoice(choiceText = "Поститься вместе с городом", response = "Жидкий суп для скудных времён. Малрик назовёт это благочестием. Я называю это политикой, которая хоть немного наполняет животы.", statDeltas = fixed_array(2, 5, 0, 0, 0, 4, -3, 4, 0)),
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
                    prompt = "Ваше Величество, моя очередь за похлёбкой огибает нижний квартал и растёт с каждым рассветом. Малрик готов их кормить — если сперва встанут на колени. Бедным всё равно, чья проповедь победит. Им важно, чей котёл кипит. Оплатите мою очередь, отдайте их епископу — или закройте очереди, пока они не стали толпой.",
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
                    prompt = "Ваше Величество, я говорю за девять деревень, которые всё ещё зовут вас королём, взявшим трон силой, — и всё ещё просят у вас хлеба. Рута рассказала вам о мельницах, Арвель — о похлёбке. Нам не нужна ваша душа. Нам нужно право хранить своё зерно. Дайте деревням хлебные грамоты — или пошлите солдат сторожить пустые закрома.",
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
                    prompt = "Ваше Величество, гора ест людей и выплёвывает руду. Мои шахтёры едят камни, а кузни тем временем платят за вашу армию. Платите нам хлебом вместо монет, подавите забастовку или дайте гильдии Фары назначить цену — но решайте, пока горны не остыли.",
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
                    prompt = "Ваше Величество, я говорю от имени хлебной гильдии — не Церкви, не армии и не мечтательных мельников. Обозы пойдут, если корона гарантирует цены. И встанут, если вы начнёте отбирать повозки. Голод — это рынок, и его цены я знаю лучше всех.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Договор корона–гильдия", response = "Тогда королевство ест равномерно, а я богатею равномерно. Справедливо — если вы контролируете слово *справедливо*.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 0, 12, 0)),
                        DialogueChoice(choiceText = "Захватить гильдейские житницы", response = "Тогда гильдия назовёт вас тираном, а народ — кормильцем. На какое-то время.", statDeltas = fixed_array(0, 0, 0, 10, 0, -12, 0, 15, 0)),
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
                    prompt = "Ваше Величество, я пою за монеты и за правду. Моя новая песня — о вас, и у неё два конца: щедрый король или голодный. Заплатите за добрый конец, запретите голодные песни — или дайте мне петь то, что видит город.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Спонсировать щедрую балладу", response = "Лестные слова. Дорогой припев. Чернь напевает ваше имя до следующего голода.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 3, 0)),
                        DialogueChoice(choiceText = "Запретить голодные баллады", response = "Запрещённые песни поют громче всего. Я буду шептать там, куда вы не можете повесить.", statDeltas = fixed_array(0, 0, 3, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть поёт, что видит", response = "Смело или глупо. Толпа решит. Я всё равно буду сыта.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -4, 0, 0)),
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
                    prompt = "Ваше Величество, мои обозы ещё ходят — если платить втрое. Сторонники Эдвина прячут зерно во имя Эдвина, крестьяне — во имя Божье. Я могу возить зерно под королевским конвоем, продать его вам с моей наценкой — или оставить скупщиков задыхаться на своих запасах.",
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
                    prompt = "Ваше Величество, я вернулась с мельниц — и с брода, где северные беженцы стоят лагерем рядом с нашими голодными. У народа теперь есть голос при вашем дворе. Вы накормите сначала своих, разделите паёк с бродом — или отдадите чужаков Церкви?",
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
                    prompt = "Ваше Величество, девяносто девять дней с вашего удара, а город всё ещё спрашивает, не морит ли его новый король голодом нарочно. Мои кухни протянут ещё месяц. Урежьте порции двора, удвойте их ради довольства лордов — или отправьте дворцовые запасы в провинции.",
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
                    prompt = "Ваше Величество, армия должна поесть, прежде чем сможет вас любить. Я могу забрать зерно у деревень, где оно ещё есть, — законный грабёж под знамёнами, — посадить людей на половинный паёк или купить зерно по рыночной цене, от которой Борвин заплачет.",
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
                        DialogueChoice(choiceText = "Я выслушал провинции", response = "Тогда я пишу *хлеб* прежде *клинка*. Редкость для узурпатора. Не расточайте это.", statDeltas = fixed_array(10, 0, 0, 0, 0, 8, 0, 8, 0)),
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
                    prompt = "Ваше Величество, хлебная гильдия помнит каждое обещание и каждое нарушенное слово. Кредит короне заморожен, пока она не докажет, что может платить чем-то, кроме проповедей. Откройте торговлю на условиях гильдии — или смотрите, как обозы объезжают вашу столицу.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять условия гильдии", response = "Тогда мои книги владеют вашими утрами, пока вы не заплатите. Казна дышит — по моему расписанию.", statDeltas = fixed_array(0, 0, 0, 20, 0, -4, 0, 0, -8)),
                        DialogueChoice(choiceText = "Отказать", response = "Бумага — не монета. Вы узнаете это за свой счёт.", statDeltas = fixed_array(0, 0, 0, 8, 0, -6, -5, 0, 0)),
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
                    prompt = "Ваше Величество, люди, оплатившие ваш переворот, хотят вернуть деньги — с процентами. Фара заморозила ваш кредит, так что мой дом держит короткий поводок. Заплатите Солту сполна, попросите новых условий — или откажитесь и узнайте, кто быстрее заберёт ваше имущество.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заплатить Солту полностью", response = "Тогда мое перо снимает ваше имя — временно. Гильдия возненавидит ваш приоритет. Армия полюбит.", statDeltas = fixed_array(0, 0, 5, -25, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Попросить у Солта новых условий", response = "Время — монета. Я продаю обе. Вы купите снова.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, 0, -6)),
                        DialogueChoice(choiceText = "Отказаться платить долг за переворот", response = "Тогда я продам ваши долги по неуплате тому, кто ненавидит вас больше всех. Ингвар тоже читает книги.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, -10)),
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
                    prompt = "Ваше Величество, по рынкам ходят фальшивые кроны — с лицом короля Эдвина. Мой монетный двор может выловить подделки, а казна может сделать вид, что их нет. Фальшивая монета — это налог на королей, которые не умеют считать.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Финансировать зачистку монетного двора", response = "Дорогая честность. Рынки замирают, затем возвращается доверие — если вы доведёте дело до конца.", statDeltas = fixed_array(0, 0, 0, -18, 0, 8, 0, 0, 6)),
                        DialogueChoice(choiceText = "Не замечать подделок", response = "Тогда цены лгут — и налоги лгут вместе с ними. Борвин закричит. Воры обрадуются.", statDeltas = fixed_array(0, 0, 0, 10, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Обвинить Нерия", response = "Удобный козёл отпущения. Подделки продолжат ходить — просто винить будет некого.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 4)),
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
                    prompt = "Ваше Величество, церковный налог Малрика, проценты Солта и сборы Фары едят из одного сундука — а Рудольф всё ещё требует пайков. В этом месяце кто-то из кредиторов останется голодным: купцы, Церковь или армия.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Платить купцам первым", response = "Тогда Малрик назовёт вас ростовщиком. Армия назовёт вас благоразумным. Обе могут быть правы.", statDeltas = fixed_array(0, -5, 0, -15, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Платить Церкви первой", response = "Тогда Фара ужесточит запрет на торговлю. Малрик улыбнётся. Арифметика заплачет.", statDeltas = fixed_array(0, 10, 0, -12, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Платить армии", response = "Солдаты едят. Купцы помнят. Классический треугольник узурпатора.", statDeltas = fixed_array(0, 0, 8, -10, 0, 5, 0, 0, 0)),
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
                    prompt = "Ваше Величество, Фара заморозила кредит короны, а Солт потребовал оплаты — я узнала об этом раньше, чем мои обозы выехали со двора. Я вожу зерно и золото, а не верность. Дайте мне королевский конвой и надбавку — или я продам вашу нехватку вашим врагам.",
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
                    prompt = "Ваше Величество, через шесть дней леди Эшфорд приедет посмотреть, правитель вы или должник в горностае. Великие дома дают в долг королям, которые могут платить, а не тем, кто должен купцам больше, чем епископам. Как мы её встретим?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Показать ей настоящие деньги", response = "Театр с квитанциями. Дорого. Эшфорд уважает дорогую правду.", statDeltas = fixed_array(0, 0, 0, -15, 0, 4, 5, 0, 0)),
                        DialogueChoice(choiceText = "Блефовать взятым в долг серебром", response = "Уверенность с лаком. Эшфорд снимает краску для развлечения.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -3, 0, 6)),
                        DialogueChoice(choiceText = "Сначала захватить склад гильдии", response = "Смелое пиратство. Фара закричит. Эшфорд может аплодировать — если вы победите.", statDeltas = fixed_array(0, 0, 5, 15, 0, -8, 0, 0, 0)),
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
                    prompt = "Ваше Величество, Эшфорд предлагает вам законную власть за свою цену. Я предлагаю деньги в казне — за цену острее. Подпишите Гильдейский договор: пошлины назначают гильдии, частный кредит открыт, церковный налог ограничивают купцы, а не Малрик, — или до заката мы потребуем оплаты всех ваших расписок.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Подписать компакт", response = "Тогда мы партнёры, пока вы не попытаетесь нас сломать. Прочитайте чернила дважды.", statDeltas = fixed_array(0, -8, 0, 15, 0, 0, -6, 0, -5)),
                        DialogueChoice(choiceText = "Отказать", response = "Тогда Солт закончит этот разговор. Я сделала своё любезное.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Контрпредложение", response = "Половина компакта. Половина войны. Солт оценит разницу.", statDeltas = fixed_array(0, 5, 0, -8, 0, 0, 0, 0, 4)),
                        DialogueChoice(choiceText = "Оплатить расписки полностью", response = "Тогда вы бедны и живы. Уважаемая комбинация.", statDeltas = fixed_array(0, 0, 0, -40, 0, 6, 0, 0, 5)),
                        DialogueChoice(choiceText = "Заложить приданое Эшфорд", response = "Тогда вы закладываете родословные ради монеты. Эшфорд заметит. История тоже.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 8)),
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
                    prompt = "Ваше Величество, фальшивая монета добралась до армейской казны — точнее, добралась бы, не будь Рудольф так подозрителен. Мой монетный двор просит права изымать каждую плохую монету в столице. Дайте его — и доверие медленно вернётся. Откажите — и оно не вернётся никогда.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Разрешить изъятие", response = "Тогда монета честна ценой бунтов. Честность не бесплатна.", statDeltas = fixed_array(0, 0, 6, -10, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Поручить изъятие гильдии", response = "Общая вина. Общая слава. Фара владеет мускулами. Вы — заголовком.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, -4, 0, 0)),
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
                    prompt = "Ваше Величество, срок настал. Люди Солта стоят лагерем у нижних ворот, клерки Фары пересчитывают ваши погреба, а Рудольф просит военных денег, которых у нас нет. Заплатить одну последнюю большую сумму, признать, что платить нечем, — или продать коронные драгоценности Эдвина купцам, которые выставят их в витринах.",
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
                    prompt = "Ваше Величество, я продал копию настоящей книги Борвина — не придворной — тому, кто заплатил больше всех на этой неделе. У Фары, Солта, Ингвара и Эшфорд теперь есть страницы, которые вы хотели скрыть. Я могу продать их обратно, помочь скормить им ложные цифры — или просто исчезнуть.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Выкупить счёт", response = "Тогда вы берёте тишину в аренду. Я продам снова, если цена улучшится.", statDeltas = fixed_array(0, 0, 0, -18, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Скормить покупателям ложные цифры", response = "Умно — до тех пор, пока двое лжецов не сравнят записи. Всё же — выиграть время.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
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
                    prompt = "Ваше Величество, я пишу главу о вашей казне — не о том, кто кланялся, а о том, кому принадлежат ваши утра. Проценты Солта, договор Фары, фальшивая монета, украденные Ноксом цифры — всё это в моих записях. Как должна звучать глава?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "«Король, который платит»", response = "Лестно, если правда. Опасно, если нет. Я проверю, прежде чем печатать.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 4, 0, 0)),
                        DialogueChoice(choiceText = "«Долговая корона» — правду", response = "Честная проза. Кредиторы её ненавидят. Простолюдины любят. Вы выбрали правду, а не тон.", statDeltas = fixed_array(0, 0, 0, 5, 0, 8, -8, 0, 0)),
                        DialogueChoice(choiceText = "Заплатить, чтобы смягчить главу", response = "Дорогостоящий вымысел. Нокс всё равно продаст сноски.", statDeltas = fixed_array(0, 0, 0, -12, 0, -6, 0, 0, 0)),
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
                    prompt = "Ваше Величество, народ знает вашу корону, но не знает — благословлена ли она. Сегодня Церковь обязана решить, называть вас королём или узурпатором. Я явился не за вашей душой — я явился за вашим именем на площади.",
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
                    prompt = "Ваше Величество, народ знает вашу корону, но не знает — благословлена ли она. Сегодня Церковь обязана решить, называть вас королём или узурпатором. Я явился не за вашей душой — я явился за вашим именем на площади.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Просить Церковь о благословении", response = "Смирение — подходящая маска для того, кто достиг трона через кровь. Верующие это услышат.", statDeltas = fixed_array(0, 15, 0, -8, 0, 3, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Потребовать признания", response = "Приказы находят солдат. До неба они доходят значительно хуже. Вы скоро это узнаете.", statDeltas = fixed_array(0, -12, 8, 0, 0, -4, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Предложить союз", response = "Союз короны и посоха может спасти Эстедор. Или задушить его. Посмотрим, кто голоднее.", statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, 0, 3), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Встать на сторону бедных монахов Арвеля", response = "Тогда вы встаёте на сторону бормочущих монахов Арвела и против моего хора. Опасно. Пожалуй, популярно среди голодных.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice()
                    )
                ),
                DialogueNode(
                    prompt = "Ваше Величество, благословение — не подарок, а поводок. Я могу провозгласить вас королём, и толпа встанет на колени. Могу назвать узурпатором — и толпа начнёт точить ножи. А могу промолчать, и пусть каждый лорд сам решает, правите ли вы завтра. Тон вы уже выбрали. Теперь выберите, что Церковь получит взамен.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять церковный надзор над законностью", response = "Тогда преклоняйте колено на площади, когда я попрошу. Корона будет благословлена — и под присмотром.", statDeltas = fixed_array(0, 12, -3, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Отказать — корона признаёт саму себя", response = "Тогда готовьтесь к проповеди, где вас назовут цареубийцей. Верующие услышали вызов.", statDeltas = fixed_array(0, -10, 5, 0, 0, -6, 0, 0, 0)),
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
                    prompt = "Ваше Величество, Малрик судит вас на площади. Я сужу вас в Божьей книге. Говорят, старый духовник Эдвина, брат Альдо, всё ещё прячется в обители Арвеля. Моё дело — дознание, а не проповедь. Дайте мне имена, дайте мне Альдо — или испытайте моё терпение.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Сотрудничать", response = "Полезно. Малрик назовёт это королевским правосудием. Арвел назовёт трусостью. Оба могут быть правы.", statDeltas = fixed_array(0, 8, 0, 0, 0, -6, 0, 0, 6)),
                        DialogueChoice(choiceText = "Отказать от расследования", response = "Тогда я запишу рядом с вашим именем «препятствует следствию» и буду спать спокойно. А вы — вряд ли.", statDeltas = fixed_array(0, -12, 5, 0, 0, 4, 0, 0, 0)),
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
                    prompt = "Ваше Величество, на этой неделе в церковный налог Малрика ушло больше монет, чем в казну короны. Верующие теперь сначала платят Богу. Если я урежу долю Церкви, он назовёт это оскорблением неба. Если вместо этого заплачу солдатам, алтарь назовёт это кражей. Чей кошель останется голодным — ваш или небесный?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Ограничить церковный налог", response = "Алтарь зашипит. Казна вздохнёт. К закату Малрик назовёт это гонением.", statDeltas = fixed_array(0, -18, 0, 15, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Платить церковный налог из казны", response = "Дорогая святость. Солдаты спросят, почему Бог ест раньше них.", statDeltas = fixed_array(0, 10, -6, -20, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Проверить обе казны", response = "Тогда пойдём по следу чернил и ладана. Имена всплывут. Спасибо никто не скажет.", statDeltas = fixed_array(0, -5, 0, -8, 0, 6, 0, 0, 4)),
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
                    prompt = "Ваше Величество, я служил трём королям и двоих похоронил. Малрику не нужен клинок, чтобы покончить с вами. У него есть книга, кафедра и одно слово: «отречение». Дальше — интердикт: ни обрядов, ни благословений, ни стражи, которая боится ада. Готовим законы, которые устоят без него, договариваемся о границах — или пусть пробует?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Готовить светские законы", response = "Смело. Верующие назовут это ересью. Солдаты — ясностью. Напишите их до воскресенья.", statDeltas = fixed_array(0, -8, 6, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Договориться с Малриком о границах", response = "Договор с посредником неба. Он держится, пока не кончится золото.", statDeltas = fixed_array(0, 5, 0, -6, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть попробует интердикт", response = "Тогда вы ставите сталь против писания. Я видел, как писание побеждает на площади и проигрывает в казармах.", statDeltas = fixed_array(0, -12, 10, 0, 0, -8, 0, 0, 0)),
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
                    prompt = "Ваше Величество, на церковный налог Малрик скупает зерно по ценам, с которыми мои обозы не могут спорить. Храмы кормят голодных и проповедуют, кто их спас. Ваша корона кормит солдат и говорит, кто им платит. Какая проповедь быстрее наполняет живот?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Перекупить зерно у Церкви", response = "Благодарные животы стоят дорого. Это того стоит — до следующего пустого кошеля.", statDeltas = fixed_array(0, -6, 0, -18, 0, 8, 0, 12, 0)),
                        DialogueChoice(choiceText = "Забрать храмовые амбары", response = "Тогда к рассвету ждите слова «отречение». У вас будет хлеб — и проповеди о вашей чёрной душе.", statDeltas = fixed_array(0, -20, 5, 0, 0, -5, 0, 15, 0)),
                        DialogueChoice(choiceText = "Пусть Селена торгует с обеими сторонами", response = "Я продам вам зерно, а Малрику — вашу осторожность. Помните: я торгую в обе стороны.", statDeltas = fixed_array(0, 3, 0, -10, 0, 0, 0, 8, 0)),
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
                    prompt = "Ваше Величество, на этой неделе Малрик объявил мясо нечистым — это, по его словам, покаяние за то, как вы взяли корону. Мои сёстры всё ещё варят бульон для лихорадочных палат, пока верующие постятся на площади. Солдаты спрашивают, почему Бог ненавидит их ужин. А я спрашиваю, почему небо морит больных голодом ради проповеди.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Не исполнять указ", response = "Тогда верующие назовут вас обжорой и грешником. Солдаты — королём. Мои больные — разумным человеком.", statDeltas = fixed_array(0, -15, 8, 0, 3, -4, 0, 5, 0)),
                        DialogueChoice(choiceText = "Соблюдать пост", response = "Смирение на людях, обида в палатах. Малрик назовёт это обращением. Я называю это спектаклем, который медленно убивает.", statDeltas = fixed_array(0, 12, -6, 0, -5, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Тайно кормить казармы и палаты", response = "Лицемерие кормит армии. Старый рецепт. Только чтобы Малрик не учуял жаркое — и мой бульон.", statDeltas = fixed_array(0, -5, 10, -8, 2, 0, 0, 0, 0)),
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
                    prompt = "Ваше Величество, у нижних ворот стоят лагерем три тысячи паломников. Малрик клянётся, что не звал их. Они скандируют то «отречение», то «благословение» — что громче в этот час. Мои стражники не станут разгонять святую толпу без вашего слова о крови.",
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
                    prompt = "Ваше Величество, две роты перекрестились вместо того, чтобы выступить, когда я приказал очистить ворота. Борвин говорит, что их жалованье съел церковный налог. Малрик говорит, что небо выше вас по званию. Скажите: наказать их, заплатить им — или позволить Церкви кормить их семьи и красть их присягу?",
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
                    prompt = "Ваше Величество, я приостановил таинства в столице: ни крещений, ни последнего причастия, ни спокойной совести для вашей стражи. Мне не нужен клинок. Либо вы отдаёте корону под Божью книгу, либо правите городом, который боится ада больше, чем вас.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Преклониться", response = "Тогда отречение умирает на площади и живёт в капитуле. Вы выживаете. Вы служите.", statDeltas = fixed_array(0, 20, -8, 0, 0, 5, 0, 0, 10)),
                        DialogueChoice(choiceText = "Бросить вызов интердикту", response = "Тогда каждая кафедра назовёт вас проклятым. Сталь должна закончить начатое.", statDeltas = fixed_array(0, -20, 12, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Поднять против него церковь Арвеля", response = "Две церкви, один кровоточащий город. Вы выбрали трещину. Пусть она не расколет вас.", statDeltas = fixed_array(0, -5, 0, 0, 0, 10, 0, -10, 0)),
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
                        DialogueChoice(choiceText = "Отказать", response = "Одиночество — частый финал узурпаторов. Вы выбрали его с открытыми глазами.", statDeltas = fixed_array(0, 0, 5, 0, 0, -4, 0, 0, 0)),
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
                    prompt = "Ваше Величество, кровь у Серого Перевала — наши или их, смотря кто лжёт. Я слышал — вы подписали хартию Ингвара — или плюнули в его условия. Север проверяет, настоящая ли армия узурпатора. Удерживать, преследовать или просить перемирия, пока снег ещё владеет высотами?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Преследовать в перевал", response = "Победа принесёт песни. Поражение — северные проповеди о цене украденной короны.", statDeltas = fixed_array(0, 0, -8, -12, 0, 5, 0, 0, 0)),
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
                    prompt = "Ваше Величество, две тысячи северных беженцев теснят брод — голод в княжеских холмах или поводок, чтобы вас опозорить. Я слышал — вы союзники с нами — или объявили врагами. Простолюдины уже смотрят, кормит ли узурпатор чужаков, пока вдовы Эдвина просят. Малрик предлагает крещения. Я — политику.",
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
                    prompt = "Ваше Величество, северные покупатели хотят арбалеты. Рудольф хочет их первым. Я продаю тому, кто платит и помнит. Сделайте мои болты королевской монополией, пусть решает рынок — или продавайте только северу и надейтесь, что они будут целиться не в вас.",
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
                    prompt = "Ваше Величество, через три дня великие дома перестанут смотреть из своих поместий и начнут мерить ваше горло. Эшфорд спросит, можете ли вы выиграть войну за границей и свести счёт дома. Попросите у домов ополчение для перевала — или оставите север делом короны, которое их не касается?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Созвать дворянские ополчения", response = "Тогда они истекают кровью с вами — или строят заговоры, пока вы истекаете. Эшфорд запишет, кто пришёл.", statDeltas = fixed_array(0, 0, 12, 0, 0, 0, -8, 0, 5)),
                        DialogueChoice(choiceText = "Оставить войну делом короны", response = "Тайна сохраняет варианты. И их ножи — до поры.", statDeltas = fixed_array(0, 0, -3, 0, 0, 0, 5, 0, 0)),
                        DialogueChoice(choiceText = "Предложить домам долю в северной торговле", response = "Дипломатия счёта. Эшфорд уважает книги. Уважает ли она вас — её хобби.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 8, 0, 0)),
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
                    prompt = "Ваше Величество, за перевалом собираются северные войска — так клянутся мои разведчики. Ингвар говорит, что это учения. Я говорю, что это часы. Полная мобилизация, которая опустошит казну, парад в надежде, что нам поверят, — или удар первыми, и пусть север попробует ответить.",
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
                    prompt = "Ваше Величество, не стану притворяться: мои князья уже оценили нескольких ваших советников. Я пришёл не каяться, а торговаться. Перебейте северное золото, разоблачите покупателей — или заключите со мной тихую сделку, и пусть рынок решит, кому принадлежит ваше завтра.",
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
                    prompt = "Ваше Величество, дворцовая стража продала северянам карты патрулей — золото Ингвара упало в очень знакомые карманы. Верность — это арифметика, а ваши стражники умеют считать. Вычистить стражу, удвоить жалованье и начать расследование — или скормить Ингвару ложные карты и надеяться, что он их купит.",
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
                    prompt = "Ваше Величество, триста пятьдесят дней с тех пор, как клинок дал вам корону, которую север не даровал. Я слышал — дань отвергнута, хартия подписана, беженцы укрыты, карты охранены. Князья завершают год, называя вас союзником — не другом, не вассалом, но узурпатором, достойным связи. Ваши наследники и наши будут спорить вместе. Лучше, чем в одиночку.",
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
                    prompt = "Ваше Величество, через семнадцать дней из восточных марок приедет леди Эшфорд. Я еду с востока рядом с ней — а не позади. Вы взяли трон без наших мечей. Справедливо. Но и мы не встали на колени. Посадите в совет один восточный дом и назовёте это миром — или два, и назовёте это равновесием?",
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
                    prompt = "Ваше Величество, Делл предложила вам брак и расчёт. Я предлагаю расчёт получше: вдвое больше приданого, вдвое меньше проповедей и никакой Эшфорд в вашем совете. Породнитесь с Кроу — и южные дороги оплатят ваш трон. Женитесь на Делл — и женитесь на её долгах.",
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
                    prompt = "Ваше Величество, Эшфорд, Каспар, Делл и Кроу мерят ваше горло бархатом. Я меряю его людьми, у которых нет ничего, кроме голода. Дайте безземельным титулы из отобранных поместий Эдвина — или мы сами возьмём поля, пока лорды спорят о приданом.",
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
                    prompt = "Ваше Величество, через три дня леди Эшфорд войдёт в ваш зал, и знать наконец пересчитают. Каспар следит за востоком, Делл и Кроу торгуются за вашу руку, а Раймонд собирает людей, которым нечего терять. Вы можете встретить их дружелюбным, расчётливым или вооружённым. Но не застигнутым врасплох.",
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
                    prompt = "Ваше Величество, расписки о приданом графини Делл поддельные — или Эшфорд подделала их так, чтобы подумали на меня. Я обвиняю Делл раньше, чем она обвинит меня. Вы рассудите, встанете на её сторону — или отложите и позволите нам разобраться самим?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Встать на сторону Каспара", response = "Тогда Делл закричит о краже. Кроу прошепчет союз. Эшфорд назовет слабым королевством. Наслаждайтесь шумом.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, -6, 0, 8)),
                        DialogueChoice(choiceText = "Встать на сторону Делл", response = "Тогда сегодня же я покину ваш зал. Изгнание — тоже смерть, но я могу вернуться с друзьями.", statDeltas = fixed_array(0, 0, -4, 0, 0, 4, -8, 0, 0)),
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
                    prompt = "Ваше Величество, я Герцог Гусь — по крещению, по ремеслу и по родословной, которую мой стряпчий клянётся считать древнее вашей. Великие дома мерят ваше горло. Я меряю ваше чувство юмора. Поддержите моё притязание — и народ вас полюбит. Арестуйте — и он полюбит меня издалека.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Покровительствовать претензии", response = "Гогот и политика. Эшфорд подавится. Народ зааплодирует. Принимаю вашу опасность.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -12, 0, -5)),
                        DialogueChoice(choiceText = "Арестовать шута", response = "Тогда камеры узнают комедию. Мои сторонники — ножи. Выберите, что вас беспокоит больше.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 6, 0, 0)),
                        DialogueChoice(choiceText = "Решить турниром", response = "Сталь против птицы. Принимаю. Приведите лучшего рыцаря — или худшего, для истории.", statDeltas = fixed_array(0, 0, 4, 0, 0, 6, 0, 0, 0)),
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
                    prompt = "Ваше Величество, ваш совет — клетка с восточными тиграми, и один гусь за решёткой. Я не сяду за один стол с Каспаром, если вы не намерены расколоть восток. Решите, кто сидит, кто стоит, а кто уходит в цепях.",
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
                    prompt = "Ваше Величество, баронесса Кроу заявила на весь зал, что моё приданое — чугунные чушки, а мои кузены — свинопасы. И никто её не остановил. Я требую удовлетворения: публичных извинений — или поединка бойцов, пока королевство не выбрало сторону.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заставить Кроу извиниться", response = "Тогда Кроу — враг. Делл — не друг. У вас на два союза меньше и на одну проблему меньше — на неделю.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -8, 0, 0)),
                        DialogueChoice(choiceText = "Заставить обеих подписать один договор", response = "Один договор, две подписи, две обиды. Тихо — но кто-то за это заплатил.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, 4, 0, 6)),
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
                    prompt = "Ваше Величество, триста человек без земли стоят лагерем на восточной границе. Великие дома враждуют, пока простой народ голодает. Завтра я выступаю — если вы не дадите нам титулы сейчас, не пошлёте рыцарей Эшфорд остановить меня или не оставите домам разбираться со мной самим.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отнять титул у мелкого лорда и отдать Раймонду", response = "Тогда дворянство закричит. Реймонд преклонится — сегодня. Вы купили опасного друга.", statDeltas = fixed_array(0, 0, 8, 0, 0, 10, -15, 0, 0)),
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
                    prompt = "Ваше Величество, на севере всё ещё дым. Эшфорд не даст ополчения, если не будет им командовать. Я не дам, если окажусь у неё в подчинении. Делл и Кроу хотят сначала подписанный брак. Выберите, чьё ополчение взять — и за чью гордость платить.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Собрать поборы с Эшфорд первой", response = "Тогда она пойдёт с ненавистью и знамёнами. Полезно — если вернётся.", statDeltas = fixed_array(0, 0, 10, -8, 0, 0, -8, 0, 0)),
                        DialogueChoice(choiceText = "Собрать поборы с Каспара", response = "Тогда восток раскалывается открыто. Война может прийти с ваших же марок.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
                        DialogueChoice(choiceText = "Нанять вместо них наёмников", response = "Тогда дома назовут вас банкротом и правыми. Кара полюбит. Рудольф — нет.", statDeltas = fixed_array(0, 0, 6, -15, 0, 0, -5, 0, 0)),
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
                    prompt = "Ваше Величество, этой ночью в ход пойдут ножи: Каспара — против Делл, Кроу — против Эшфорд, Эшфорд — против Раймонда. Я могу продать вам карту, остановить один клинок или дать ночи самой рассортировать знать. Кто умрёт в темноте, решаете вы — если действуете. Если спите — решают они.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Остановить покушение на Эшфорд", response = "Тогда Эшфорд проснётся живой и в долгу перед вами. Вместо неё истечёт кровью кто-то помельче.", statDeltas = fixed_array(0, 0, 0, -8, 0, -4, 8, 0, 0)),
                        DialogueChoice(choiceText = "Допустить смерть Эшфорд", response = "Тогда восток принадлежит тому, кто переживёт рассвет. Вы выбрали скорость вместо милосердия.", statDeltas = fixed_array(0, 0, -8, 0, 0, 0, -15, 0, 12)),
                        DialogueChoice(choiceText = "Остановить кровь Делл-Кроу", response = "На юге мир. Делл и Кроу обе проснутся — и ни одна не узнает, кто её спас.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 4, 0, 0)),
                        DialogueChoice(choiceText = "Пусть ножи падают", response = "Тогда к утру Делл и Кроу будут мертвы, а в зале — два пустых кресла.", statDeltas = fixed_array(0, 0, 0, 0, 0, -12, 0, 0, 10)),
                        DialogueChoice(choiceText = "Заплатить Ноксу, чтобы убрал Каспара", response = "Чисто. Преступно. И на вашей совести. Каспар больше не увидит востока.", statDeltas = fixed_array(0, 0, 0, -12, 0, -8, 0, 0, 8)),
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
                    prompt = "Ваше Величество, я пишу первую главу о ваших делах с великими домами, пока кровь ещё не высохла. Как её назвать?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "«Примирение»", response = "Льстиво. Хрупко. Напишу, что нужно — не то, что заслужено.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 6, 0, 0)),
                        DialogueChoice(choiceText = "«Устрашение»", response = "Честно. Жестоко. Будущие лорды прочтут, прежде чем строить заговоры.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -6, 0, 6)),
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
                    prompt = "Ваше Величество, я Морвен — та, что превращает политику в верёвку. В камерах Эдвина всё ещё сидят люди, присягнувшие его призраку, и нижняя темница переполнена. Повесьте зачинщиков, продавайте помилования за монету — или откройте камеры и посмотрите, кто осмелится вас проверить.",
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
                    prompt = "Ваше Величество, Малрик присылает имена: еретики, уличные проповедники, люди, что в стихах называют вашу корону отрешённой. Небо хочет еретиков. Корона — изменников. На моём эшафоте хватит места обоим, если его расширить. Повесить список Церкви, только своих изменников — или заменить приговоры штрафами?",
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
                    prompt = "Ваше Величество, шахтёры Ярека и мельники Руты вломились в амбар с инструментами, которые не для помола. Голодные не читают законов — они читают пустые миски. Повесить бунтовщиков, повесить только офицера, который выстрелил первым, а остальных помиловать — или помиловать всех?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Массовое повешение", response = "Тогда провинции узнают страх. Они могут не узнать верности. Оба держат троны — ненадолго.", statDeltas = fixed_array(-12, 0, 8, 0, 0, 0, 0, -3, 0)),
                        DialogueChoice(choiceText = "Повесить офицера, помиловать шахтёров", response = "Хирургическая петля. Простолюдины могут назвать это справедливостью. Офицеры назовут предательством. Оба могут быть правы.", statDeltas = fixed_array(4, 0, -4, 0, 0, 5, 0, 0, 0)),
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
                    prompt = "Ваше Величество, из лихорадочных палат мне прислали троих, которые проснулись с криком и так и не замолчали. Безумие — не измена, но толпе измену объяснить проще. Повесить безумных, чтобы площадь успокоилась, оплатить уход у Миры — или спрятать их в моих тихих камерах?",
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
                    prompt = "Ваше Величество, великие дома уже присылают списки — имена тех, кого хотят убрать, прежде чем поклониться. Скоро приедет Эшфорд. Отклонить все списки знати до её приезда, повесить двух простолюдинов в назидание лордам — или продавать быстрые суды тому, кто больше заплатит?",
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
                    prompt = "Ваше Величество, леди Эшфорд будет мерить ваш эшафот, как портной мерит спину. Повесьте последнего капитана стражи Эдвина, чтобы её впечатлить, опустошите двор, чтобы её обезоружить, — или позвольте ей назвать первого узника и посмотрите, послушаетесь ли вы.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Повесить последнего капитана Эдвина", response = "Тогда восточные глаза видят петлю. Западные призраки видят предупреждение. Оба смотрят на вас.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 4, 0, 0)),
                        DialogueChoice(choiceText = "Опустошить двор", response = "Смелое милосердие перед приездом знати. Она назовёт это подкупом совести.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -6, 0, 5)),
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
                    prompt = "Ваше Величество, я Тален. Я решаю задачи, которым эшафот не может назначить цену. За сундук серебра я потеряю имя одного знатного до рассвета. Чуть дороже — и я буду вершить за вас всё правосудие: тихо и с прибылью. Что купите?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Заплатить Талену за одно имя", response = "Тогда одна глотка дышит, хотя не должна. Вы забудете, какая. Я — нет.", statDeltas = fixed_array(0, 0, 0, -18, 0, -8, 6, 0, 0)),
                        DialogueChoice(choiceText = "Отказать и разоблачить", response = "Тогда я исчезну, прежде чем проснётся Морвен. Вы получите проповедь и потеряете удобство.", statDeltas = fixed_array(0, 0, 3, 0, 0, 8, -4, 0, 0)),
                        DialogueChoice(choiceText = "Нанять Талена вершить правосудие", response = "Правосудие с прейскурантом. Морвен меня возненавидит. А вам понравится, как тихо станет в списках.", statDeltas = fixed_array(0, 0, 0, -25, 0, -12, 0, 0, -8)),
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
                    prompt = "Ваше Величество, камеры снова полны: бунтовщики, еретики, безумцы, имена, которые потерял Тален, и имена, за которые заплатили лорды. Объявите массовое помилование и опустошите мой двор, массовую казнь, чтобы научить королевство молчать, — или продолжайте судить каждого по делу.",
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
            characterIdx = CHAR_WIZARD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я Мерибальд — я читаю то, что небо пишет числами, а не стихами. В ту самую ночь, когда вы заняли кресло Эдвина, комета пересекла его созвездие. Её видит каждый, кто поднимет голову. Вы можете объявить комету своим знамением, выслушать меня наедине — или отдать меня инквизитору.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Объявить комету моим знамением", response = "Тогда знать смотрит вверх, прежде чем на вас. Опасно — если небо передумает.", statDeltas = fixed_array(0, -10, 0, 0, 0, 0, 8, 0, 6)),
                        DialogueChoice(choiceText = "Выслушать наедине", response = "Благоразумно. Скучно. Толпа всё равно смотрит вверх без вашего разрешения.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Отдать инквизитору Кирусу", response = "Инквизиторы любят кометы — ненадолго. Вы не услышите мою башню снова — пока не услышите.", statDeltas = fixed_array(0, 12, 0, 0, 0, -6, 0, 0, 0)),
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
            characterIdx = CHAR_WIZARD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, леди Эшфорд родилась под восточной четвертью неба: честолюбива, хрупка, любит племянников и верёвку. Моя карта говорит, что она будет судить ваше правление в день приезда. Обнародуете её знамение — она вас возненавидит. Покажете ей одной — будет вам обязана. Сожжёте — она привезёт свои знамения. И солдат.",
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
            characterIdx = CHAR_WIZARD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, рыночная площадь собирается на две проповеди: мои расчёты затмения и зимние стихи Безымянного пророка. Толпа хочет одной правды. Небо предлагает две. Сделайте звездочётство королевской должностью, выдайте грамоты нам обоим — или пусть выбирает толпа.",
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
                    prompt = "Ваше Величество, Мерибальд считает огни, а я — вдохи. Толпа спрашивает, какому королю служит зима. Я говорю: тому, кто кормит лёгкие и уши. Он говорит: тому, кто читает карты. Поддержите меня, поддержите его — или заставьте замолчать обоих, и пусть вера бьётся с верой без вашего знака.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Поддержать Пророка", response = "Тогда башня Мерибальда темнеет. Малрик рычит. Бедные напевают ваше имя. Опасная музыка.", statDeltas = fixed_array(12, -12, 0, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Поддержать Мерибальда", response = "Тогда мой рынок сжимается. Его башня светлеет. Знать улыбается. Крестьяне считают.", statDeltas = fixed_array(-8, 4, 0, 0, 0, 0, 8, 0, 0)),
                        DialogueChoice(choiceText = "Заставить замолчать обоих", response = "Сталь прекращает проповеди, пока сама не станет следующей. Мы оба это запомним.", statDeltas = fixed_array(-6, 0, 8, 0, 0, -10, 0, 0, 0)),
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
            characterIdx = CHAR_WIZARD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, на моих картах мерцает дом наследования: линия Эдвина, ваша линия, никакой линии. Звёзды показывают пустоту размером с ребёнка ещё до конца зимы. Обнародуете — соперники зашевелятся. Скроете — будут гадать. Подделаете знамение получше — будут смеяться, пока не перестанут.",
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
            characterIdx = CHAR_WIZARD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, Нокс продал час вашего рождения Ингвару, Эшфорд и пророку, который делает вид, что ничего не покупает. Звёзды сложились для утечки — не воды, а тайн. Обнародуйте имена покупателей, купите моё молчание — или повесьте Нокса.",
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
            characterIdx = CHAR_WIZARD,
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
                    prompt = "Ваше Величество, у меня нет имени: имена — для тех, кто умирает однажды. У меня есть зима: три мороза, три короля, один трон. Рынок ждёт знака, а Малрик всё ещё не решил, знает ли небо ваше лицо. Вы выслушаете меня, отдадите Церкви — или не заметите?",
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
                    prompt = "Ваше Величество, в палатах кашляют, звонят колокола. Я проповедую то, чему учит лихорадка: трон — это лёгкое, а король — тот, кто последним перестанет дышать. Позвольте мне проповедовать в палатах, запретите уличные проповеди на время болезни — или заставьте меня говорить от имени короны.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Пусть проповедует в лазаретах", response = "Тогда больные слышат два лечения. Одно может спасти вас. Одно — меня. Ни одно не гарантировано.", statDeltas = fixed_array(0, -10, 0, 0, 5, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Запретить уличные проповеди во время чумы", response = "Запреты кормят мучеников. Кашель не читает указы. Помните, я предупреждал.", statDeltas = fixed_array(0, 6, 4, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Пусть проповедует от имени короны", response = "Тогда я говорю вашу зиму вашим акцентом. Полезно. Ложно. Достаточно популярно.", statDeltas = fixed_array(0, 3, 0, -8, 0, 5, 0, 0, 0)),
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
                    prompt = "Ваше Величество, на нижний рынок пришёл лис на трёх лапах — а ушёл на четырёх. Вчера хромая женщина пошла, коснувшись его норы. Малрик называет это насмешкой над Богом. Народ — надеждой с хвостом. Коронуйте лиса, сожгите его святилище — или ищите обманщика за этим.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять культ лиса", response = "Тогда на ваших знамёнах появятся усы. Малрик попробует отлучить от церкви зверя. Вы будете смеяться — пока ополчение не откажется выступать.", statDeltas = fixed_array(0, -18, 0, 0, 0, 12, 0, -5, 0)),
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
                    prompt = "Ваше Величество, великие дома приехали мерить ваше горло, а у меня для них есть знамение: дом, который кланяется на людях и плетёт заговоры в постели. Используйте моё пророчество против дома-соперника, отрекитесь от пророчеств в зале — или посадите меня за стол Эшфорд и дайте сказать.",
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
                    prompt = "Ваше Величество, верность больше не проповедь, а арифметика. Золото Ингвара и сети Нокса — в каждом коридоре. Я пророчу нож, что купит вам рассвет, и поцелуй, что продаст ваши карты. Позвольте мне назвать изменников на площади, арестуйте меня — или выслушайте имена наедине.",
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
                    prompt = "Ваше Величество, Ингвар в этом месяце не единственный мой покупатель. Один иноземный дом предлагает деньги за список вашего совета: кто спит у вашей двери, кто подписывает указы, кто всё ещё шепчет имя Эдвина. Откажитесь и охотьтесь на покупателей, возьмите их деньги и продайте — или наймите меня только для себя и молитесь, чтобы я оставался голодным.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отказать и вычистить покупателей", response = "Тогда я исчезну до заката — или продам кому-то злее. Вы выбрали сталь вместо торговли.", statDeltas = fixed_array(0, 0, 8, -8, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Продать им список совета", response = "Тогда у вашего двора есть хозяин за морем. Эффективно. Изменнически. Часто оба.", statDeltas = fixed_array(0, 0, 0, 20, 0, -15, 0, 0, -10)),
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
                    prompt = "Ваше Величество, скоро королевство начнёт вслух мерить верность вашего двора. У Нокса иноземные покупатели, лестница протекает, северные карты продали дважды. Подозрительность сохраняет троны, порядок — королевства. Выберите путь: чистка двора, учёт шпионов, как в казне, — или доверие своим людям наперекор цифрам.",
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
                    prompt = "Ваше Величество, по рукам ходят указы почерком Эдвина — моим почерком — вашим почерком, и подделка печати безупречна. Проверьте каждую печать, как бы долго и мучительно это ни было, используйте ложные указы, чтобы поймать ложных покупателей, — или повесьте меня и назовите дело закрытым.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Удостоверить все печати", response = "Тогда политика ползёт, а доверие растёт сантиметрами. Редко. Скучно. Полезно.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 6)),
                        DialogueChoice(choiceText = "Кормить фальшивая монетами покупателей Нокса", response = "Тогда лжецы едят лжецов. Если сравнят записи — вы сгорите. Пока — узнаете.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Повесить Осрика", response = "Удобно. Поддельные печати будут ходить и дальше — просто винить станет некого.", statDeltas = fixed_array(0, 0, 0, 0, 0, -12, 0, 0, 5)),
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
                    prompt = "Ваше Величество, человек в маске просит аудиенции. Он говорит, что имена — это договоры, а он ещё не решил, кому служит. Двор гудит. Принять его публично, встретиться наедине — или отказать, и пусть слухи называют его племянником, призраком или купеческим принцем.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Публичная аудиенция", response = "Тогда слух станет зрелищем. Зрелище дешевле правды и вдвое громче.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -8, 0, 10)),
                        DialogueChoice(choiceText = "Частный совет", response = "Тогда вы правите шёпотом. Он будет шептать в ответ. А Нокс попробует подслушать.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, 8)),
                        DialogueChoice(choiceText = "Отказать в аудиенции", response = "Тогда он исчезнет, а появится десять масок. Тайна размножается.", statDeltas = fixed_array(0, 0, 4, 0, 0, -4, 0, 0, 0)),
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
                    prompt = "Ваше Величество, на мой пост метят трое: наёмник, ветеран Эдвина и иноземный меч. Королевство смотрит, кому вы доверяете у собственной двери. Оставьте меня, меняйте стражу каждую ночь — или наймите чужеземца и платите, сколько попросит.",
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
                    prompt = "Ваше Величество, я пишу первую редакцию вашего правления, пока ножи продают вторые за границей. Купите мою летопись, чтобы первым её читали вы, позвольте главам утекать и узнайте, кто их читает, — или сожгите черновики и правьте без летописи: вслепую, зато без цитат.",
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
                    prompt = "Ваше Величество, настоящие книги уходят из дворца, а придворные лгут. Нокс продал страницы, Илана — главы, иноземные дома купили и то, и другое. Обнародуйте настоящие счета, скормите шпионам ложные цифры — или повесьте писцов и сделайте вид, что арифметика — преступление.",
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
                    prompt = "Ваше Величество, я Тален — посредник, шептун, счёт, который приходит после ущерба. Нокс работает на три короны: вашу, Ингварову и третью — в маске, что платит слухами о вашем наследнике. Разоблачите Нокса, вступите в торг за его верность — или наймите меня лгать всем троим.",
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
                    prompt = "Ваше Величество, во дворе стражи ведут списки изменников — или верных, смотря кто пишет. Вычистите стражу и научите страху, обновите присягу и научите терпению — или не замечайте двора и научите презрению. Королевство прочтёт ваш ответ.",
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
                    prompt = "Ваше Величество, вчера ночью человек в маске вернулся и назвал имя, которое вы надеялись считать туманом: племянник Эдвина — изгнанный, голодный и уставший от вашего кресла. Он ждёт ответа. Отрицать, что мальчик существует, послать людей на поиски — или напугать этим притязанием Эшфорд, пока она снова не выехала?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отвергнуть племянника", response = "Тогда туман сгустится. Кто-нибудь всё равно поверит. Лжи нужно лишь терпение.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 6, 0, 8)),
                        DialogueChoice(choiceText = "Искать племянника", response = "Тогда охотников станет больше. Одни продают дорогу. Другие — ловушки.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, -6)),
                        DialogueChoice(choiceText = "Использовать претензию как оружие", response = "Опасный спектакль. Эшфорд назовёт это клеветой. Рынок — политикой.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -8, 0, 5)),
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
                    prompt = "Ваше Величество, много лет назад был устроен брак, чтобы племянник Эдвина молчал, — страховка моей семьи, а не ваш роман. Теперь маска произносит его имя в вашей столице. Породнитесь с моим домом и закройте вопрос, откажитесь — или позвольте Эшфорд держать мальчика в уютной клетке. Я не делю власть с туманом.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять брак Эшфорд", response = "Тогда мой дом владеет восточным миром и вашей историей престолонаследия. Вы получаете поводок. Я — будущее рядом с короной.", statDeltas = fixed_array(0, 0, 4, 0, 0, -8, 12, 0, 10)),
                        DialogueChoice(choiceText = "Отказать в браке", response = "Тогда мы соперники, не родня. Я запомню, кто отказался от страховки.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -10, 0, -5)),
                        DialogueChoice(choiceText = "Пусть мальчик будет у Эшфорд", response = "Совместная королевская опека. Унизительно. Эффективно. Очень по-восточному.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 6, 0, 6)),
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
                    prompt = "Ваше Величество, местонахождение мальчика хотят купить трое: Эшфорд, Ингвар и посредник в маске, который платит слухами. Я продам тому, кто даст больше, — если только вы не перебьёте всех и не купите туман сами.",
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
                    prompt = "Ваше Величество, писцы Ингвара предлагают деньги за мальчика, похожего на племянника, — живого, мёртвого или убедительно мёртвого. Отказать им, продать местонахождение — или инсценировать его смерть с телом и записью и продать подделку дважды.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отказать", response = "Тогда Ингвар оценит ваше упрямство в стали. Внутренние проблемы лучше иностранных корон — обычно.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, -4)),
                        DialogueChoice(choiceText = "Продать местонахождение на север", response = "Тогда вы снимаете мир кровью, которую можете никогда не увидеть. Эффективно. Чудовищно. Знакомо.", statDeltas = fixed_array(0, 0, 0, 15, 0, -12, 0, 0, -15)),
                        DialogueChoice(choiceText = "Инсценировать его смерть", response = "Тогда три книги владеют мёртвым мальчиком, который, может, ещё дышит. Восхищаюсь бухгалтерией.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, -6, 0, 5)),
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
                    prompt = "Ваше Величество, записи о рождении расходятся: племянник родился весной, летом или не рождался вовсе. Я могу подделать записи, доказывающие, что он бастард, восстановить подлинные записи Эдвина — или сжечь архив, и пусть побеждает туман.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Подделать незаконнорождённость", response = "Тогда чернила убивают мальчиков, которых сталь не находит. Эшфорд назовёт грубостью. Может сработать.", statDeltas = fixed_array(0, 4, 0, 0, 0, -8, 0, 0, 12)),
                        DialogueChoice(choiceText = "Восстановить записи Эдвина", response = "Честные бумаги. Опасная честность. Теперь притязание мальчика подтверждено на бумаге.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -6, 0, -10)),
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
                    prompt = "Ваше Величество, я пишу две главы о наследовании: вашу — по праву клинка, его — по праву крови. Опубликую главу племянника — расколю королевство. Только вашу — назову его мифом. Обе — и пусть королевство само выбирает себе головную боль.",
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
                    prompt = "Ваше Величество, северные князья хотят племянника Эдвина — заложником, наследником или святым. Откажите им и воюйте весной, отдайте мальчика за союз — или предложите им собственную грамоту о наследовании и посмотрите, осмелятся ли они назвать её ложью.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Отвергнуть север", response = "Тогда мы оценим ваш отказ в стали следующей весной. Последовательная дипломатия.", statDeltas = fixed_array(0, 0, 8, 0, 0, 4, 0, 0, 6)),
                        DialogueChoice(choiceText = "Отдать племянника северу", response = "Тогда вы покупаете мир кровной линией Эдвина. Унизительно. Иногда прочно.", statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, -12)),
                        DialogueChoice(choiceText = "Предложить свою грамоту о наследовании", response = "Смелое притязание против крови. Я отвезу его на север. Там посмеются — а потом начнут считать.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -8, 0, 15)),
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
                    prompt = "Ваше Величество, человек в маске говорит, что маску пора снять: истории должны заканчиваться — или взрываться. Он может быть племянником Эдвина, пешкой Эшфорд, купеческим сыном или переодетым Ноксом. Потребуйте правды при всех, примите ответ наедине — или откажитесь от разоблачения, и пусть туман сохранит лицо.",
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
                    prompt = "Ваше Величество, девяносто четыре дня с тех пор, как человек в маске назвал имя племянника. Охотники, подделыватели и покупатели — все сделали свой ход. Кем бы ни был мальчик теперь — заложником, слухом или именем на могиле, — ваша линия должна стоять сама. Берегите её. У тумана есть родня.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я её сберегу", response = "Тогда я закрываю книгу о племяннике — пока кто-нибудь не откроет её снова.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 15)),
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
                    prompt = "Ваше Величество, зима кончается, и истинная линия спит в земле или в чернилах. Моё последнее знамение коротко: трон ест имена.",
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
                        DialogueChoice(choiceText = "Обойтись тем, что есть", response = "Терпение — добродетель здоровых. Я растяну то, что есть, и буду молиться, чтобы хватило до палат вовремя.", statDeltas = fixed_array(0, 0, 0, 0, 2, 0, 0, 0, 0)),
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
                        DialogueChoice(choiceText = "Ты была права", response = "Поздняя монета всё ещё покупает дыхание. Я не буду стыдить вас за перемену ума — только за то, сколько умерло, пока вы менялись.", statDeltas = fixed_array(0, 0, 0, -25, 10, 5, 0, 0, 0)),
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
                    prompt = "Ваше Величество, вы просили две недели. Я их дала. Двадцать семь умерших в нижних палатах, пока ваш казначей считал монеты. Я вернулась — не умолять, а узнать, может ли король, взявший трон силой, позволить себе спасти королевство, которое взял, или Эстедору суждено сгореть дважды.",
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
                        DialogueChoice(choiceText = "Само пройдёт", response = "Тогда напишите мой отчёт для летописей: узурпатор смотрел, как Эстедор кашляет дотла, и назвал это терпением.", statDeltas = fixed_array(0, 0, 0, 0, -20, -10, 0, 0, 0)),
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
                    prompt = "Ваше Величество, кашель сломлен. В нижних кварталах кричат ваше имя, не плюясь — я не думала, что доживу до этого при правлении узурпатора. Формула держится. Летописи назовут вас королём, спасшим дыхание. Я назову королём, заплатившим за бутыли, когда другие платили за молитвы.",
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
                    prompt = "Ваше Величество, лихорадка угасает — но не прежде, чем оставила шрам на трёх провинциях. Мы спасли многих. Мы похоронили больше. Я не буду лгать и звать это триумфом. Королевство назовёт вас Израненным королём — или узурпатором, сделавшим достаточно. Оба правдивы. Ни одно не утешает.",
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
                    prompt = "Ваше Величество, Бог исцелил королевство. Лихорадка отступила там, где падала святая вода и не смолкала молитва, — так говорят верующие, и говорят громко. Народ преклоняет колени не перед клинком, взявшим трон, а перед рукой, державшей чашу. Собор назовёт вас помазанником Церкви. Мира назовёт это театром. Верующие — спасением.",
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
                    prompt = "Ваше Величество, я говорил, что восточная настойка Миры — не единственный отвар, но никогда не говорил, что мой самый безопасный. Все палаты получили мой состав с уксусом. Кашель отступил быстрее, чем кто-либо мечтал, но люди просыпались с криком и больше не спали. Семьи стучат в двери камнями. Летописи назовут вас лекарем безумного короля. Я зову вас королём, который выбрал спешку.",
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
                    prompt = "Ваше Величество, нижние кварталы хотят статую — не святого, не солдата, а короля, финансировавшего бутыли. Вульгарно, льстит и политически полезно. Борвин говорит, это стоит золота. Я говорю, покупает нечто реже: узурпатора, которого помнят за дыхание, а не за кровь.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Финансировать статую", response = "Тогда стойте неподвижно достаточно долго, чтобы вас вырезали. Даже узурпатор может иметь один честный портрет.", statDeltas = fixed_array(5, 0, 0, -10, 0, 10, 0, 0, 0)),
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
                    prompt = "Ваше Величество, северные князья закрыли горные перевалы для караванов Эстедора. Зовут осторожностью. Я зову запахом костров на ветру. Соседи больше не боятся клинка узурпатора. Они боятся вашего кашля.",
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
                    prompt = "Ваше Величество, пришло письмо от Святого Престола. Они хотят объявить исцеление Эстедора чудом и назвать вас его орудием на земле. Корона, взятая мечом, благословлённая высшей властью неба. Мира называет это кражей. Верующие — судьбой. Что мне ответить?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Принять чудо", response = "Тогда преклонитесь ещё раз. Трон становится алтарём. Враги теряют лучший аргумент.", statDeltas = fixed_array(0, 18, 0, 0, 0, 5, 0, 0, 10)),
                        DialogueChoice(choiceText = "Вежливо отказаться", response = "Гордо. Престол не забудет. Крестьяне, видевшие работу святой воды, тоже.", statDeltas = fixed_array(0, -8, 3, 0, 0, 5, 0, 0, 0)),
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
                    prompt = "Ваше Величество, я кормлю бедных у ворот моего монастыря. В последнее время они говорят о Сером кашле больше, чем о хлебе. Лихорадка угасла, но скорбь — нет. Они спрашивают, финансирует ли узурпатор оплативший бутыли, имя для их мёртвых — или выживание — единственное милосердие, которое они увидят.",
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
                    prompt = "Ваше Величество, год закрывается, а историей по-прежнему владеет небо. Народ зовёт вас королём, которого спасли святые. Солдаты — марионеткой священника. Знать — полезным. Святой Престол напишет, что вас помазала Церковь. Мира — не напишет. История редко угождает всем.",
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
            characterIdx = CHAR_ODO,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Ваше Величество, я Одо, чумной лекарь. Настойка Миры медленная и дорогая. Мой состав — уксус, дым из маски и кое-что, чего я не назову, — ломает кашель за три дня и стоит вдесятеро дешевле. Не стану лгать: некоторым больным потом чудится всякое. У большинства это проходит. Попробуйте — или продолжайте ждать ивовую кору.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Прогнать Одо", response = "Тогда ждите бутылок Миры. Я буду в нижнем городе, если ваше терпение кончится раньше, чем больные.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Испытать в двух палатах", response = "Осторожный король. Две палаты покажут, гений я или отравитель.", statDeltas = fixed_array(0, 0, 0, -3, 5, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Давать во всех палатах — важна скорость", response = "Быстро и дёшево. Если люди закричат, помните: вы выбрали спешку, а не осторожность.", statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Оплатить оба лекарства сразу", response = "Наука через соперничество. Мне нравится. Мире — нет. Больные выиграют — или заплатят.", statDeltas = fixed_array(0, 0, 0, -12, 6, 0, 0, 0, 0)),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

