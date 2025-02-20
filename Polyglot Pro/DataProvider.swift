//
//  Data.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-17.
//

enum QuestionCategory: String, CaseIterable {
    case weekdays = "Veckodagar"
    case months = "Månader"
    case verbs = "Verbs"
    case adjectives = "Adjectives"
    case nouns = "Nouns"
    case bodyParts = "Kroppsdelar"
    case colors = "Färger"
    case weekdays2 = "Veckodagar2"
    case months2 = "Månader2"
    case verbs2 = "Verbs2"
    case adjectives2 = "Adjectives2"
    case nouns2 = "Nouns2"
    case bodyParts2 = "Kroppsdelar2"
    case colors2 = "Färger2"
    case colors3 = "Färger3"
    
}


struct DataProvider {
    static let data: [QuestionCategory: [Question]] = [
        .weekdays: [
            Question(expression: "понеділок", translation: "måndag", examples: [
                ("Måndag är veckans första dag", "Понеділок - це перший день тижня"),
                ("Vi börjar jobba på måndag", "Ми починаємо працювати в понеділок"),
                ("Skolan börjar på måndag", "Школа починається в понеділок"),
                ("Jag går till gymmet på måndag", "Я йду до спортзалу в понеділок")
            ]),
            Question(expression: "вівторок", translation: "tisdag", examples: [
                ("Tisdag är veckans andra dag", "Вівторок - це другий день тижня"),
                ("Vi har möte på tisdag", "Ми маємо зустріч у вівторок"),
                ("Jag ska laga middag på tisdag", "Я готуватиму вечерю у вівторок"),
                ("På tisdag går jag till biblioteket", "У вівторок я йду до бібліотеки")
            ]),
            Question(expression: "середа", translation: "onsdag", examples: [
                ("Onsdag är veckans tredje dag", "Середа - це третій день тижня"),
                ("Jag har simning på onsdag", "У мене плавання у середу"),
                ("Vi träffas på onsdag", "Ми зустрічаємось у середу"),
                ("Onsdag är en bra dag", "Середа - гарний день")
            ]),
            Question(expression: "четвер", translation: "torsdag", examples: [
                ("Torsdag är veckans fjärde dag", "Четвер - це четвертий день тижня"),
                ("Jag går till tandläkaren på torsdag", "Я йду до стоматолога у четвер"),
                ("Vi har fotbollsträning på torsdag", "У нас тренування з футболу у четвер"),
                ("Torsdag brukar vara lugn", "Четвер зазвичай спокійний")
            ]),
            Question(expression: "п'ятниця", translation: "fredag", examples: [
                ("Fredag är veckans femte dag", "П'ятниця - це п'ятий день тижня"),
                ("Jag ser fram emot fredag", "Я з нетерпінням чекаю п'ятниці"),
                ("På fredag äter vi pizza", "У п'ятницю ми їмо піцу"),
                ("Fredag är min favoritdag", "П'ятниця - мій улюблений день")
            ]),
            Question(expression: "субота", translation: "lördag", examples: [
                ("Lördag är veckans sjätte dag", "Субота - це шостий день тижня"),
                ("Jag vilar på lördag", "Я відпочиваю у суботу"),
                ("Vi går på bio på lördag", "Ми йдемо в кіно у суботу"),
                ("Lördagar är lediga dagar", "Суботи - це вихідні дні")
            ]),
            Question(expression: "неділя", translation: "söndag", examples: [
                ("Söndag är veckans sista dag", "Неділя - це останній день тижня"),
                ("Vi besöker familjen på söndag", "Ми відвідуємо родину у неділю"),
                ("Jag läser en bok på söndag", "Я читаю книгу у неділю"),
                ("Söndag är en lugn dag", "Неділя - це спокійний день")
            ])
        ],
        
            .months: [
                Question(expression: "січень", translation: "januari", examples: [
                    ("Januari är den första månaden på året", "Січень - це перший місяць року"),
                    ("Vi firar nyår i januari", "Ми святкуємо Новий рік у січні"),
                    ("Det är kallt i januari", "У січні холодно"),
                    ("Skolan börjar efter jul i januari", "Школа починається після Різдва у січні")
                ]),
                Question(expression: "лютий", translation: "februari", examples: [
                    ("Februari är den kortaste månaden", "Лютий - найкоротший місяць"),
                    ("Alla hjärtans dag är i februari", "День святого Валентина у лютому"),
                    ("I februari är det ofta snö", "У лютому часто лежить сніг"),
                    ("Vi åker skidor i februari", "Ми катаємося на лижах у лютому")
                ]),
                Question(expression: "березень", translation: "mars", examples: [
                    ("Mars är den första vårmånaden", "Березень - це перший весняний місяць"),
                    ("Dagarna blir längre i mars", "Дні стають довшими у березні"),
                    ("Vi firar kvinnodagen i mars", "Ми святкуємо День жінок у березні"),
                    ("Snön börjar smälta i mars", "Сніг починає танути у березні")
                ]),
                Question(expression: "квітень", translation: "april", examples: [
                    ("April har ofta mycket regn", "У квітні часто йдуть дощі"),
                    ("April är en vårmånad", "Квітень - це весняний місяць"),
                    ("Påsken firas ibland i april", "Великдень іноді святкується у квітні"),
                    ("Träden får nya blad i april", "Дерева отримують нове листя у квітні")
                ]),
                Question(expression: "травень", translation: "maj", examples: [
                    ("Maj är en vacker månad", "Травень - це гарний місяць"),
                    ("Blommorna blommar i maj", "Квіти цвітуть у травні"),
                    ("Vi firar första maj", "Ми святкуємо перше травня"),
                    ("Solen skiner ofta i maj", "Сонце часто світить у травні")
                ]),
                Question(expression: "червень", translation: "juni", examples: [
                    ("Juni är den första sommarmånaden", "Червень - це перший літній місяць"),
                    ("Vi har skolavslutning i juni", "У червні в нас закінчується навчальний рік"),
                    ("Midsommar firas i juni", "Свято середини літа відзначається у червні"),
                    ("Det är varmt i juni", "У червні тепло")
                ]),
                Question(expression: "липень", translation: "juli", examples: [
                    ("Juli är den varmaste månaden", "Липень - найтепліший місяць"),
                    ("Många har semester i juli", "Багато людей мають відпустку у липні"),
                    ("Vi badar i havet i juli", "Ми купаємося у морі в липні"),
                    ("Blåbären mognar i juli", "Чорниця дозріває у липні")
                ]),
                Question(expression: "серпень", translation: "augusti", examples: [
                    ("Augusti är den sista sommarmånaden", "Серпень - останній літній місяць"),
                    ("Skolan börjar i augusti", "Школа починається у серпні"),
                    ("Vi plockar svamp i augusti", "Ми збираємо гриби у серпні"),
                    ("Dagarna blir kortare i augusti", "Дні стають коротшими у серпні")
                ]),
                Question(expression: "вересень", translation: "september", examples: [
                    ("September är den första höstmånaden", "Вересень - це перший осінній місяць"),
                    ("Löven börjar falla i september", "Листя починає опадати у вересні"),
                    ("Vi börjar skolan i september", "Ми починаємо навчання у вересні"),
                    ("Äpplen mognar i september", "Яблука дозрівають у вересні")
                ]),
                Question(expression: "жовтень", translation: "oktober", examples: [
                    ("Oktober har vackra höstfärger", "У жовтні красиві осінні кольори"),
                    ("Halloween firas i oktober", "Гелловін святкується у жовтні"),
                    ("Det blir kallare i oktober", "У жовтні стає холодніше"),
                    ("Vi tänder ljus i oktober", "Ми запалюємо свічки у жовтні")
                ]),
                Question(expression: "листопад", translation: "november", examples: [
                    ("November är en mörk månad", "Листопад - це темний місяць"),
                    ("Det regnar ofta i november", "У листопаді часто йдуть дощі"),
                    ("Vi firar Alla helgons dag i november", "Ми святкуємо День усіх святих у листопаді"),
                    ("Snön kan komma i november", "Сніг може випасти у листопаді")
                ]),
                Question(expression: "грудень", translation: "december", examples: [
                    ("December är den sista månaden", "Грудень - це останній місяць"),
                    ("Vi firar jul i december", "Ми святкуємо Різдво у грудні"),
                    ("Det är kallt och mörkt i december", "У грудні холодно і темно"),
                    ("Nyårsafton är i december", "Новий рік святкується у грудні")
                ])
            ],
        
            .bodyParts: [
                Question(expression: "тіло", translation: "kropp", examples: [
                    ("Människokroppen är fascinerande", "Людське тіло є захоплюючим"),
                    ("Jag tar hand om min kropp", "Я дбаю про своє тіло"),
                    ("Kroppen behöver vila", "Тіло потребує відпочинку"),
                    ("Vi lär oss om kroppen i skolan", "Ми вивчаємо тіло в школі")
                ]),
                Question(expression: "частина тіла", translation: "kroppsdel", examples: [
                    ("Huvudet är en kroppsdel", "Голова - це частина тіла"),
                    ("Jag skadade en kroppsdel", "Я пошкодив частину тіла"),
                    ("Olika kroppsdelar har olika funktioner", "Різні частини тіла мають різні функції"),
                    ("Doktorn undersökte min kroppsdel", "Лікар обстежив мою частину тіла")
                ]),
                Question(expression: "голова", translation: "huvud", examples: [
                    ("Jag har ont i huvudet", "У мене болить голова"),
                    ("Han skyddade sitt huvud", "Він захищав свою голову"),
                    ("Barnet har en liten huvud", "У дитини маленька голова"),
                    ("Hon har ett runt huvud", "Вона має круглу голову")
                ]),
                Question(expression: "око", translation: "öga", examples: [
                    ("Mina ögon är blå", "Мої очі сині"),
                    ("Jag ser med mina ögon", "Я бачу своїми очима"),
                    ("Hon har vackra ögon", "Вона має гарні очі"),
                    ("Barnet blinkade med ena ögat", "Дитина підморгнула одним оком")
                ]),
                Question(expression: "вухо", translation: "öra", examples: [
                    ("Mitt öra gör ont", "Моє вухо болить"),
                    ("Jag hör med mina öron", "Я чую своїми вухами"),
                    ("Barnet har små öron", "У дитини маленькі вуха"),
                    ("Läkaren undersökte mitt öra", "Лікар оглянув моє вухо")
                ]),
                Question(expression: "ніс", translation: "näsa", examples: [
                    ("Min näsa är täppt", "Мій ніс закладений"),
                    ("Jag luktar med näsan", "Я нюхаю носом"),
                    ("Barnet har en liten näsa", "У дитини маленький ніс"),
                    ("Jag snyter min näsa", "Я сякаю ніс")
                ]),
                Question(expression: "рот", translation: "mun", examples: [
                    ("Jag äter med munnen", "Я їм ротом"),
                    ("Munnen är en viktig kroppsdel", "Рот - важлива частина тіла"),
                    ("Hon har ett vackert leende", "Вона має гарну усмішку"),
                    ("Barnet öppnade sin mun", "Дитина відкрила рот")
                ]),
                Question(expression: "рука", translation: "arm", examples: [
                    ("Min arm gör ont", "У мене болить рука"),
                    ("Han lyfte sin arm", "Він підняв свою руку"),
                    ("Jag tränar mina armar", "Я треную свої руки"),
                    ("Hon har en stark arm", "Вона має сильну руку")
                ]),
                Question(expression: "долоня", translation: "handflata", examples: [
                    ("Jag klappade med handflatan", "Я плескав долонею"),
                    ("Barnet har mjuka handflator", "У дитини м'які долоні"),
                    ("Jag känner med handflatan", "Я відчуваю долонею"),
                    ("Handflatan svettas ibland", "Долоня іноді пітніє")
                ]),
                Question(expression: "палець", translation: "finger", examples: [
                    ("Jag bröt ett finger", "Я зламав палець"),
                    ("Barnet suger på sitt finger", "Дитина смокче палець"),
                    ("Jag pekar med fingret", "Я вказую пальцем"),
                    ("Hon har långa fingrar", "Вона має довгі пальці")
                ])
            ],
        
            .colors: [
                Question(expression: "червоний", translation: "röd", examples: [
                    ("Huset är rött", "Будинок червоний"),
                    ("Jag köpte en röd bil", "Я купив червону машину"),
                    ("Rosen är röd", "Троянда червона"),
                    ("Tomater är röda", "Помідори червоні")
                ]),
                Question(expression: "синій", translation: "blå", examples: [
                    ("Himlen är blå", "Небо синє"),
                    ("Jag har en blå tröja", "У мене є синя кофта"),
                    ("Havet är blått", "Море синє"),
                    ("Min favoritfärg är blå", "Мій улюблений колір - синій")
                ]),
                Question(expression: "жовтий", translation: "gul", examples: [
                    ("Solen är gul", "Сонце жовте"),
                    ("Jag har en gul bok", "У мене є жовта книга"),
                    ("Bananer är gula", "Банани жовті"),
                    ("Huset har gula väggar", "Будинок має жовті стіни")
                ]),
                Question(expression: "зелений", translation: "grön", examples: [
                    ("Gräset är grönt", "Трава зелена"),
                    ("Jag älskar gröna äpplen", "Я люблю зелені яблука"),
                    ("Bilen är grön", "Автомобіль зелений"),
                    ("Skogen är grön på sommaren", "Ліс зелений влітку")
                ]),
                Question(expression: "чорний", translation: "svart", examples: [
                    ("Min katt är svart", "Мій кіт чорний"),
                    ("Jag bär svarta byxor", "Я ношу чорні штани"),
                    ("Natten är svart", "Ніч чорна"),
                    ("Svarta skor är klassiska", "Чорні туфлі класичні")
                ]),
                Question(expression: "білий", translation: "vit", examples: [
                    ("Snön är vit", "Сніг білий"),
                    ("Jag har en vit skjorta", "У мене є біла сорочка"),
                    ("Hunden är vit", "Собака білий"),
                    ("Mjölk är vit", "Молоко біле")
                ]),
                Question(expression: "коричневий", translation: "brun", examples: [
                    ("Björnen är brun", "Ведмідь коричневий"),
                    ("Jag har bruna ögon", "У мене карі очі"),
                    ("Kaffet är brunt", "Кава коричнева"),
                    ("Skorna är bruna", "Черевики коричневі")
                ]),
                Question(expression: "фіолетовий", translation: "lila", examples: [
                    ("Blomman är lila", "Квітка фіолетова"),
                    ("Min tröja är lila", "Моя кофта фіолетова"),
                    ("Vissa druvor är lila", "Деякі виногради фіолетові"),
                    ("Jag målade väggen lila", "Я пофарбував стіну у фіолетовий")
                ]),
                Question(expression: "рожевий", translation: "rosa", examples: [
                    ("Hennes klänning är rosa", "Її сукня рожева"),
                    ("Jag gillar rosa blommor", "Мені подобаються рожеві квіти"),
                    ("Himlen blir rosa på kvällen", "Небо стає рожевим увечері"),
                    ("Min dotter älskar rosa", "Моя донька любить рожевий")
                ]),
                Question(expression: "помаранчевий", translation: "orange", examples: [
                    ("Apelsiner är orange", "Апельсини помаранчеві"),
                    ("Jag har en orange jacka", "У мене є помаранчева куртка"),
                    ("Solnedgången är orange", "Захід сонця помаранчевий"),
                    ("Pumpor är orange på hösten", "Гарбузи восени помаранчеві")
                ]),
                Question(expression: "сірий", translation: "grå", examples: [
                    ("Himlen är grå idag", "Сьогодні небо сіре"),
                    ("Jag har en grå tröja", "У мене є сіра кофта"),
                    ("Vargen har grå päls", "Вовк має сіру шерсть"),
                    ("Gamla byggnader är ofta grå", "Старі будівлі часто сірі")
                ]),
                Question(expression: "бежевий", translation: "beige", examples: [
                    ("Mina skor är beige", "Мої туфлі бежеві"),
                    ("Väggarna är målade i beige", "Стіни пофарбовані в бежевий"),
                    ("Jag har en beige jacka", "У мене є бежева куртка"),
                    ("Mattan är beige", "Килим бежевий")
                ]),
                Question(expression: "золотий", translation: "guld", examples: [
                    ("Ringen är av guld", "Кільце із золота"),
                    ("Guld är en dyr metall", "Золото – дорога металева"),
                    ("Himlen blev gyllene", "Небо стало золотавим"),
                    ("Hon har guldörhängen", "Вона має золоті сережки")
                ]),
                Question(expression: "срібний", translation: "silver", examples: [
                    ("Besticken är av silver", "Столові прибори зі срібла"),
                    ("Hennes hår är silvergrått", "Її волосся сріблясто-сіре"),
                    ("Månen lyser som silver", "Місяць світить як срібло"),
                    ("Jag har en silverring", "У мене є срібна каблучка")
                ])
            ],
        
            .verbs: [
                Question(expression: "бути", translation: "vara", examples: [
                    ("Jag vill vara här", "Я хочу бути тут"),
                    ("Han vill vara en lärare", "Він хоче бути вчителем"),
                    ("Det är svårt att vara ärlig", "Важко бути чесним"),
                    ("Jag försöker vara positiv", "Я намагаюся бути позитивним")
                ]),
                Question(expression: "мати", translation: "ha", examples: [
                    ("Jag har en katt", "Я маю кота"),
                    ("Hon vill ha en bok", "Вона хоче мати книгу"),
                    ("Vi måste ha tålamod", "Ми повинні мати терпіння"),
                    ("Kan jag ha en kopp kaffe?", "Чи можу я мати чашку кави?")
                ]),
                Question(expression: "йти", translation: "gå", examples: [
                    ("Jag går till jobbet varje dag", "Я ходжу на роботу щодня"),
                    ("Vi ska gå till parken", "Ми підемо до парку"),
                    ("Hon gick hem tidigt", "Вона пішла додому рано"),
                    ("Vill du gå med mig?", "Ти хочеш піти зі мною?")
                ]),
                Question(expression: "бачити", translation: "se", examples: [
                    ("Jag ser en fågel", "Я бачу птаха"),
                    ("Kan du se bilen?", "Ти бачиш машину?"),
                    ("Vi såg en film igår", "Ми дивилися фільм вчора"),
                    ("Jag vill se havet", "Я хочу побачити море")
                ]),
                Question(expression: "говорити", translation: "tala", examples: [
                    ("Han talar svenska", "Він говорить шведською"),
                    ("Kan du tala långsammare?", "Можеш говорити повільніше?"),
                    ("Vi talar ofta i telefon", "Ми часто розмовляємо по телефону"),
                    ("Hon talar tre språk", "Вона говорить трьома мовами")
                ]),
                Question(expression: "працювати", translation: "arbeta", examples: [
                    ("Jag arbetar på en fabrik", "Я працюю на заводі"),
                    ("Hon arbetar som läkare", "Вона працює лікарем"),
                    ("Vi arbetar tillsammans", "Ми працюємо разом"),
                    ("Jag älskar att arbeta", "Я люблю працювати")
                ]),
                Question(expression: "давати", translation: "ge", examples: [
                    ("Kan du ge mig boken?", "Можеш дати мені книгу?"),
                    ("Hon gav honom en present", "Вона дала йому подарунок"),
                    ("Jag ska ge dig ett råd", "Я дам тобі пораду"),
                    ("Vi ger alltid vårt bästa", "Ми завжди віддаємо найкраще")
                ]),
                Question(expression: "любити", translation: "älska", examples: [
                    ("Jag älskar dig", "Я люблю тебе"),
                    ("Hon älskar att dansa", "Вона любить танцювати"),
                    ("Vi älskar att resa", "Ми любимо подорожувати"),
                    ("Han älskar choklad", "Він любить шоколад")
                ]),
                Question(expression: "жити", translation: "bo", examples: [
                    ("Jag bor i Sverige", "Я живу у Швеції"),
                    ("Hon bor i en liten stad", "Вона живе в маленькому місті"),
                    ("Vi bor nära havet", "Ми живемо біля моря"),
                    ("De bor tillsammans", "Вони живуть разом")
                ]),
                Question(expression: "писати", translation: "skriva", examples: [
                    ("Jag skriver ett brev", "Я пишу листа"),
                    ("Hon skriver en bok", "Вона пише книгу"),
                    ("Vi skriver ofta e-post", "Ми часто пишемо електронні листи"),
                    ("Han skriver i sin dagbok", "Він пише у своєму щоденнику")
                ])],
        
            .adjectives: [
                Question(expression: "бути", translation: "vara", examples: [
                    ("Jag vill vara här", "Я хочу бути тут"),
                    ("Han vill vara en lärare", "Він хоче бути вчителем"),
                    ("Det är svårt att vara ärlig", "Важко бути чесним"),
                    ("Jag försöker vara positiv", "Я намагаюся бути позитивним")
                ]),
                Question(expression: "мати", translation: "ha", examples: [
                    ("Jag har en katt", "Я маю кота"),
                    ("Hon vill ha en bok", "Вона хоче мати книгу"),
                    ("Vi måste ha tålamod", "Ми повинні мати терпіння"),
                    ("Kan jag ha en kopp kaffe?", "Чи можу я мати чашку кави?")
                ]),
                Question(expression: "йти", translation: "gå", examples: [
                    ("Jag går till jobbet varje dag", "Я ходжу на роботу щодня"),
                    ("Vi ska gå till parken", "Ми підемо до парку"),
                    ("Hon gick hem tidigt", "Вона пішла додому рано"),
                    ("Vill du gå med mig?", "Ти хочеш піти зі мною?")
                ]),
                Question(expression: "бачити", translation: "se", examples: [
                    ("Jag ser en fågel", "Я бачу птаха"),
                    ("Kan du se bilen?", "Ти бачиш машину?"),
                    ("Vi såg en film igår", "Ми дивилися фільм вчора"),
                    ("Jag vill se havet", "Я хочу побачити море")
                ]),
                Question(expression: "говорити", translation: "tala", examples: [
                    ("Han talar svenska", "Він говорить шведською"),
                    ("Kan du tala långsammare?", "Можеш говорити повільніше?"),
                    ("Vi talar ofta i telefon", "Ми часто розмовляємо по телефону"),
                    ("Hon talar tre språk", "Вона говорить трьома мовами")
                ]),
                Question(expression: "працювати", translation: "arbeta", examples: [
                    ("Jag arbetar på en fabrik", "Я працюю на заводі"),
                    ("Hon arbetar som läkare", "Вона працює лікарем"),
                    ("Vi arbetar tillsammans", "Ми працюємо разом"),
                    ("Jag älskar att arbeta", "Я люблю працювати")
                ]),
                Question(expression: "давати", translation: "ge", examples: [
                    ("Kan du ge mig boken?", "Можеш дати мені книгу?"),
                    ("Hon gav honom en present", "Вона дала йому подарунок"),
                    ("Jag ska ge dig ett råd", "Я дам тобі пораду"),
                    ("Vi ger alltid vårt bästa", "Ми завжди віддаємо найкраще")
                ]),
                Question(expression: "любити", translation: "älska", examples: [
                    ("Jag älskar dig", "Я люблю тебе"),
                    ("Hon älskar att dansa", "Вона любить танцювати"),
                    ("Vi älskar att resa", "Ми любимо подорожувати"),
                    ("Han älskar choklad", "Він любить шоколад")
                ]),
                Question(expression: "жити", translation: "bo", examples: [
                    ("Jag bor i Sverige", "Я живу у Швеції"),
                    ("Hon bor i en liten stad", "Вона живе в маленькому місті"),
                    ("Vi bor nära havet", "Ми живемо біля моря"),
                    ("De bor tillsammans", "Вони живуть разом")
                ]),
                Question(expression: "писати", translation: "skriva", examples: [
                    ("Jag skriver ett brev", "Я пишу листа"),
                    ("Hon skriver en bok", "Вона пише книгу"),
                    ("Vi skriver ofta e-post", "Ми часто пишемо електронні листи"),
                    ("Han skriver i sin dagbok", "Він пише у своєму щоденнику")
                ])],
        
            .nouns: [
                Question(expression: "бути", translation: "vara", examples: [
                    ("Jag vill vara här", "Я хочу бути тут"),
                    ("Han vill vara en lärare", "Він хоче бути вчителем"),
                    ("Det är svårt att vara ärlig", "Важко бути чесним"),
                    ("Jag försöker vara positiv", "Я намагаюся бути позитивним")
                ]),
                Question(expression: "мати", translation: "ha", examples: [
                    ("Jag har en katt", "Я маю кота"),
                    ("Hon vill ha en bok", "Вона хоче мати книгу"),
                    ("Vi måste ha tålamod", "Ми повинні мати терпіння"),
                    ("Kan jag ha en kopp kaffe?", "Чи можу я мати чашку кави?")
                ]),
                Question(expression: "йти", translation: "gå", examples: [
                    ("Jag går till jobbet varje dag", "Я ходжу на роботу щодня"),
                    ("Vi ska gå till parken", "Ми підемо до парку"),
                    ("Hon gick hem tidigt", "Вона пішла додому рано"),
                    ("Vill du gå med mig?", "Ти хочеш піти зі мною?")
                ]),
                Question(expression: "бачити", translation: "se", examples: [
                    ("Jag ser en fågel", "Я бачу птаха"),
                    ("Kan du se bilen?", "Ти бачиш машину?"),
                    ("Vi såg en film igår", "Ми дивилися фільм вчора"),
                    ("Jag vill se havet", "Я хочу побачити море")
                ]),
                Question(expression: "говорити", translation: "tala", examples: [
                    ("Han talar svenska", "Він говорить шведською"),
                    ("Kan du tala långsammare?", "Можеш говорити повільніше?"),
                    ("Vi talar ofta i telefon", "Ми часто розмовляємо по телефону"),
                    ("Hon talar tre språk", "Вона говорить трьома мовами")
                ]),
                Question(expression: "працювати", translation: "arbeta", examples: [
                    ("Jag arbetar på en fabrik", "Я працюю на заводі"),
                    ("Hon arbetar som läkare", "Вона працює лікарем"),
                    ("Vi arbetar tillsammans", "Ми працюємо разом"),
                    ("Jag älskar att arbeta", "Я люблю працювати")
                ]),
                Question(expression: "давати", translation: "ge", examples: [
                    ("Kan du ge mig boken?", "Можеш дати мені книгу?"),
                    ("Hon gav honom en present", "Вона дала йому подарунок"),
                    ("Jag ska ge dig ett råd", "Я дам тобі пораду"),
                    ("Vi ger alltid vårt bästa", "Ми завжди віддаємо найкраще")
                ]),
                Question(expression: "любити", translation: "älska", examples: [
                    ("Jag älskar dig", "Я люблю тебе"),
                    ("Hon älskar att dansa", "Вона любить танцювати"),
                    ("Vi älskar att resa", "Ми любимо подорожувати"),
                    ("Han älskar choklad", "Він любить шоколад")
                ]),
                Question(expression: "жити", translation: "bo", examples: [
                    ("Jag bor i Sverige", "Я живу у Швеції"),
                    ("Hon bor i en liten stad", "Вона живе в маленькому місті"),
                    ("Vi bor nära havet", "Ми живемо біля моря"),
                    ("De bor tillsammans", "Вони живуть разом")
                ]),
                Question(expression: "писати", translation: "skriva", examples: [
                    ("Jag skriver ett brev", "Я пишу листа"),
                    ("Hon skriver en bok", "Вона пише книгу"),
                    ("Vi skriver ofta e-post", "Ми часто пишемо електронні листи"),
                    ("Han skriver i sin dagbok", "Він пише у своєму щоденнику")
                ])],
        .adjectives2: [],
        .months2: [],
        .verbs2: [],
        .adjectives2: [],
        .nouns2: [],
        .bodyParts2: [],
        .colors2: [],
        .colors3: [],
    ]
    
    
    /// Get questions by category
    static func questions(for category: QuestionCategory) -> [Question] {
        return data[category] ?? []
    }
}
//TextField("Ange översättning", text: $viewModel.userInput, onCommit: {
//    if viewModel.isCorrect == nil || viewModel.isCorrect == false {
//        viewModel.checkAnswer()
//    } else {
//        viewModel.nextQuestion()
//    }
//})
//    .font(.system(size: 40, weight: .bold, design: .rounded)) // Kid-friendly font
//    .padding()
//    .background(Color.white.opacity(0.8)) // Soft background
//    .cornerRadius(20) // Rounded corners
//    .overlay(
//        RoundedRectangle(cornerRadius: 20)
//            .stroke(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 5) // Fun gradient border
//            .shadow(color: .purple.opacity(0.5), radius: 10) // Glow effect
//    )
//    .foregroundColor(.black) // Easy-to-read text
//    .multilineTextAlignment(.center) // Centered text
//    .animation(.spring(response: 0.5, dampingFraction: 0.6), value: viewModel.userInput)

//.border(viewModel.isCorrect == nil ? Color.white : (viewModel.isCorrect! ? Color.green : Color.red))
