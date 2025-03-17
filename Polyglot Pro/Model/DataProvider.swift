//
//  Data.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-17.
//

enum QuestionCategory: String, CaseIterable {
    case homework1 = "1. Lexa"
    case homework2 = "2. Lexa"
    case homework3 = "3. Lexa"
    case homework4 = "4. Lexa"
    case homework5 = "5. Lexa"
    case weekdays = "Veckodagar"
    case months = "Månader"
    case modalVerbs = "Modala verb"
    case verbs = "Verb"
    case time = "Tidsuttryck"
    case vegetables = "Grönsaker"
    case fruits = "Frukter"
    case bodyParts = "Kroppsdelar"
    case colors = "Färger"
    case shoppingNouns = "Shopping"
    case home = "Hem"
    case family = "Familj"
    case professions = "Yrken"
    case animals = "Djur"
    case transport = "Transport"
    case numbers = "Tal"
    case ordinalNumbers = "Ordningstal"
    case interrogativePronouns = "Frågande pronomen"
    case law = "Lag"
    case marketing = "Marknadsföring"
    
    /*case homework12 = "1. Lexa2"
    case homework22 = "2. Lexa2"
    case homework32 = "3. Lexa2"
    case homework42 = "4. Lexa2"
    case homework52 = "5. Lexa2"
    case weekdays2 = "Veckodagar2"
    case months2 = "Månader2"
    case modalVerbs2 = "Modala verb2"
    case verbs2 = "Verb2"
    case time2 = "Tidsuttryck2"
    case vegetables2 = "Grönsaker2"
    case fruits2 = "Frukter2"
    case bodyParts2 = "Kroppsdelar2"
    case colors2 = "Färger2"
    case shoppingNouns2 = "Shopping2"
    case home2 = "Hem2"
    case family2 = "Familj2"
    case professions2 = "Yrken2"
    case animals2 = "Djur2"
    case transport2 = "Transport2"
    case numbers2 = "Tal2"
    case ordinalNumbers2 = "Ordningstal2"
    case interrogativePronouns2 = "Frågande pronomen2"
    case law2 = "Lag2"
    case marketing2 = "Marknadsföring2"*/
}

// röd, blå, gul, grön, orange, lila, svart, bit, brun, rosa, ung, ny, gammal, lång, randig, rutig, prickig, blommig, stor, liten, kort, glad, ledsen
struct DataProvider {
    static let data: [QuestionCategory: [Question]] = [
        .homework1: [
            Question(expression: "ім'я", translation: "ett namn", examples: [
                ("Vad är ditt namn?", "Як тебе звати?"),
                ("Mitt namn är Anna.", "Мене звати Анна."),
                ("Han glömde sitt namn.", "Він забув своє ім'я."),
                ("Namnet på staden är Kyiv.", "Назва міста - Київ.")
            ]),
            Question(expression: "мова", translation: "ett språk", examples: [
                ("Svenska är ett vackert språk.", "Шведська - гарна мова."),
                ("Jag lär mig ett nytt språk.", "Я вивчаю нову мову."),
                ("Vilket språk talar du?", "Якою мовою ти розмовляєш?"),
                ("Språk är viktigt för kommunikation.", "Мова важлива для спілкування.")
            ]),
            Question(expression: "країна", translation: "ett land", examples: [
                ("Sverige är ett vackert land.", "Швеція - гарна країна."),
                ("Jag vill besöka ett nytt land.", "Я хочу відвідати нову країну."),
                ("Vilket land kommer du från?", "З якої країни ти родом?"),
                ("Landet har många berg.", "У цій країні багато гір.")
            ]),
            Question(expression: "місто", translation: "en stad", examples: [
                ("Stockholm är en stor stad.", "Стокгольм - велике місто."),
                ("Jag bor i en liten stad.", "Я живу в маленькому місті."),
                ("Vilken stad vill du besöka?", "Яке місто ти хочеш відвідати?"),
                ("Staden är känd för sin arkitektur.", "Місто відоме своєю архітектурою.")
            ]),
            Question(expression: "район", translation: "en stadsdel", examples: [
                ("Jag bor i en lugn stadsdel.", "Я живу в спокійному районі."),
                ("Denna stadsdel är mycket populär.", "Цей район дуже популярний."),
                ("Vilken stadsdel gillar du mest?", "Який район тобі найбільше подобається?"),
                ("Stadsdelen har många parker.", "У цьому районі багато парків.")
            ]),
            Question(expression: "вулиця", translation: "en gata", examples: [
                ("Gatan är mycket bred.", "Вулиця дуже широка."),
                ("Jag går längs gatan.", "Я йду по вулиці."),
                ("Vilken gata bor du på?", "На якій вулиці ти живеш?"),
                ("Gatan är full av butiker.", "Вулиця повна магазинів.")
            ]),
            Question(expression: "дитина", translation: "ett barn", examples: [
                ("Barnet leker i parken.", "Дитина грається в парку."),
                ("Varje barn är unikt.", "Кожна дитина унікальна."),
                ("Hur många barn har du?", "Скільки у тебе дітей?"),
                ("Barnet läser en bok.", "Дитина читає книгу.")
            ]),
            Question(expression: "дівчинка", translation: "en flicka", examples: [
                ("Flickan dansar balett.", "Дівчинка танцює балет."),
                ("Hon är en snäll flicka.", "Вона добра дівчинка."),
                ("Flickan läser en saga.", "Дівчинка читає казку."),
                ("Flickan har blå ögon.", "У дівчинки блакитні очі.")
            ]),
            Question(expression: "хлопчик", translation: "en pojke", examples: [
                ("Pojken springer snabbt.", "Хлопчик бігає швидко."),
                ("Han är en stark pojke.", "Він сильний хлопчик."),
                ("Pojken leker med bollen.", "Хлопчик грається з м'ячем."),
                ("Pojken gillar att rita.", "Хлопчику подобається малювати.")
            ]),
            Question(expression: "жінка", translation: "en kvinna", examples: [
                ("Kvinnan läser en tidning.", "Жінка читає газету."),
                ("Hon är en smart kvinna.", "Вона розумна жінка."),
                ("Kvinnan arbetar på ett kontor.", "Жінка працює в офісі."),
                ("Kvinnan har långt hår.", "У жінки довге волосся.")
            ]),
            Question(expression: "чоловік", translation: "en man", examples: [
                ("Mannen går till jobbet.", "Чоловік йде на роботу."),
                ("Han är en vänlig man.", "Він добрий чоловік."),
                ("Mannen äter frukost.", "Чоловік снідає."),
                ("Mannen har ett stort leende.", "У чоловіка широка посмішка.")
            ]),
            Question(expression: "дочка", translation: "en dotter", examples: [
                ("Dottern hjälper sin mamma.", "Дочка допомагає своїй мамі."),
                ("Hon är deras enda dotter.", "Вона їх єдина дочка."),
                ("Dottern gillar att sjunga.", "Дочці подобається співати."),
                ("Dottern är mycket duktig i skolan.", "Дочка дуже добре вчиться в школі.")
            ]),
            Question(expression: "син", translation: "en son", examples: [
                ("Sonen spelar fotboll.", "Син грає у футбол."),
                ("Han är deras äldsta son.", "Він їхній старший син."),
                ("Sonen hjälper sin pappa.", "Син допомагає своєму татові."),
                ("Sonen gillar att läsa böcker.", "Сину подобається читати книги.")
            ]),
            Question(expression: "батько/мати", translation: "en förälder", examples: [
                ("Min förälder hjälper mig med läxan.", "Мій батько/мати допомагає мені з домашнім завданням."),
                ("Som förälder har man mycket ansvar.", "Як батько/мати, маєш багато відповідальності."),
                ("Mina föräldrar jobbar på sjukhuset.", "Мої батьки працюють у лікарні."),
                ("En förälder älskar alltid sitt barn.", "Батько/мати завжди любить свою дитину.")
            ]),
            Question(expression: "тато", translation: "en pappa", examples: [
                ("Pappan lagar mat.", "Тато готує їжу."),
                ("Han är en bra pappa.", "Він хороший тато."),
                ("Pappan leker med barnen.", "Тато грається з дітьми."),
                ("Pappan berättar en saga.", "Тато розповідає казку.")
            ]),
            Question(expression: "мама", translation: "en mamma", examples: [
                ("Mamman läser en bok.", "Мама читає книгу."),
                ("Hon är en omtänksam mamma.", "Вона турботлива мама."),
                ("Mamman bakar kakor.", "Мама пече печиво."),
                ("Mamman hjälper barnet med läxorna.", "Мама допомагає дитині з уроками.")
            ]),
            Question(expression: "брат чи сестра", translation: "ett syskon", examples: [
                ("Jag har två syskon.", "У мене двоє братів і сестер."),
                ("Syskonen leker tillsammans.", "Брати і сестри граються разом."),
                ("Syskon är viktiga i livet.", "Брати і сестри важливі в житті."),
                ("Syskonen delar på rummet.", "Брати і сестри ділять кімнату.")
            ]),
            Question(expression: "сестра", translation: "en syster", examples: [
                ("Systern är mycket snäll.", "Сестра дуже добра."),
                ("Hon är min äldsta syster.", "Вона моя старша сестра."),
                ("Systern gillar att måla.", "Сестрі подобається малювати."),
                ("Systern hjälper mig med läxorna.", "Сестра допомагає мені з уроками.")
            ]),
            Question(expression: "брат", translation: "en bror", examples: [
                ("Broren är mycket stark.", "Брат дуже сильний."),
                ("Han är min yngre bror.", "Він мій молодший брат."),
                ("Broren gillar att spela fotboll.", "Братові подобається грати у футбол."),
                ("Broren hjälper mig med bilen.", "Брат допомагає мені з машиною.")
            ]),
            Question(expression: "двоюрідний брат чи сестра", translation: "en kusin", examples: [
                ("Kusinen bor i ett annat land.", "Двоюрідний брат/сестра живе в іншій країні."),
                ("Jag träffar min kusin på sommaren.", "Я зустрічаюся зі своїм двоюрідним братом/сестрою влітку."),
                ("Kusinen är mycket rolig.", "Двоюрідний брат/сестра дуже веселий/весела."),
                ("Kusinen och jag är bra vänner.", "Ми з двоюрідним братом/сестрою хороші друзі.")
            ])
        ],
        .homework2: [
            Question(expression: "день", translation: "en dag", examples: [
                ("Idag är en vacker dag.", "Сьогодні чудовий день."),
                ("Jag har en ledig dag imorgon.", "Завтра у мене вихідний день."),
                ("Varje dag är en ny möjlighet.", "Кожен день - це нова можливість."),
                ("Dagen börjar med solsken.", "День починається з сонячної погоди.")
            ]),
            Question(expression: "ранок", translation: "en morgon", examples: [
                ("På morgonen dricker jag kaffe.", "Вранці я п'ю каву."),
                ("Morgonen är min favorittid på dagen.", "Ранок - моя улюблена пора дня."),
                ("Vi går en promenad på morgonen.", "Ми гуляємо вранці."),
                ("Morgonen är lugn och fridfull.", "Ранок спокійний і мирний.")
            ]),
            Question(expression: "передобіддя", translation: "en förmiddag", examples: [
                ("På förmiddagen har jag möten.", "У передобіддя у мене зустрічі."),
                ("Jag brukar träna på förmiddagen.", "Я зазвичай тренуюся в передобіддя."),
                ("Förmiddagen är produktiv.", "Передобіддя продуктивне."),
                ("Vi äter frukost på förmiddagen.", "Ми снідаємо в передобіддя.")
            ]),
            Question(expression: "післяобіддя", translation: "en eftermiddag", examples: [
                ("På eftermiddagen går jag en promenad.", "У післяобідню пору я гуляю."),
                ("Eftermiddagen är perfekt för att läsa.", "Післяобіддя ідеально підходить для читання."),
                ("Vi träffas på eftermiddagen.", "Ми зустрічаємось у післяобідню пору."),
                ("Eftermiddagen är varm och solig.", "Післяобіддя тепле і сонячне.")
            ]),
            Question(expression: "вечір", translation: "en kväll", examples: [
                ("På kvällen tittar jag på TV.", "Ввечері я дивлюся телевізор."),
                ("Kvällen är lugn och skön.", "Вечір спокійний і приємний."),
                ("Vi äter middag på kvällen.", "Ми вечеряємо ввечері."),
                ("Kvällen är perfekt för att slappna av.", "Вечір ідеально підходить для відпочинку.")
            ]),
            Question(expression: "ніч", translation: "en natt", examples: [
                ("På natten sover jag.", "Вночі я сплю."),
                ("Natten är mörk och tyst.", "Ніч темна і тиха."),
                ("Vi ser stjärnorna på natten.", "Ми бачимо зірки вночі."),
                ("Natten är lång på vintern.", "Ніч довга взимку.")
            ]),
            Question(expression: "тиждень", translation: "en vecka", examples: [
                ("En vecka har sju dagar.", "Тиждень має сім днів."),
                ("Jag åker på semester nästa vecka.", "Я їду у відпустку наступного тижня."),
                ("Veckan börjar på måndag.", "Тиждень починається в понеділок."),
                ("Den här veckan är mycket upptagen.", "Цей тиждень дуже завантажений.")
            ]),
            Question(expression: "місяць", translation: "en månad", examples: [
                ("En månad har 30 eller 31 dagar.", "Місяць має 30 або 31 день."),
                ("Juni är min favoritmånad.", "Червень - мій улюблений місяць."),
                ("Vi reser nästa månad.", "Ми їдемо у подорож наступного місяця."),
                ("Månaden är snart slut.", "Місяць скоро закінчиться.")
            ]),
            Question(expression: "рік", translation: "ett år", examples: [
                ("Ett år har tolv månader.", "Рік має дванадцять місяців."),
                ("Nästa år ska jag resa till Sverige.", "Наступного року я поїду до Швеції."),
                ("Året har gått fort.", "Рік пройшов швидко."),
                ("Varje år firar vi jul.", "Щороку ми святкуємо Різдво.")
            ]),
            Question(expression: "сніданок", translation: "en frukost", examples: [
                ("Frukost är den viktigaste måltiden.", "Сніданок - найважливіший прийом їжі."),
                ("Jag äter frukost varje morgon.", "Я снідаю кожного ранку."),
                ("Frukosten består av bröd och ägg.", "Сніданок складається з хліба та яєць."),
                ("Vi äter frukost tillsammans.", "Ми снідаємо разом.")
            ]),
            Question(expression: "обід", translation: "en lunch", examples: [
                ("Lunchen serveras klockan tolv.", "Обід подають о дванадцятій."),
                ("Jag äter lunch med kollegorna.", "Я обідаю з колегами."),
                ("Lunchen är enkel men god.", "Обід простий, але смачний."),
                ("Vi tar en paus för lunch.", "Ми робимо перерву на обід.")
            ]),
            Question(expression: "вечеря", translation: "en middag", examples: [
                ("Middagen är klar klockan sju.", "Вечеря буде готова о сьомій."),
                ("Vi bjuder på middag ikväll.", "Ми запрошуємо на вечерю сьогодні ввечері."),
                ("Middagen består av fisk och potatis.", "Вечеря складається з риби та картоплі."),
                ("Efter middagen dricker vi kaffe.", "Після вечері ми п'ємо каву.")
            ])
        ],
        .homework3: [
            Question(expression: "слово", translation: "ett ord", examples: [
                ("Ett ord kan betyda mycket.", "Одне слово може багато значити."),
                ("Kan du stava det här ordet?", "Ти можеш продиктувати це слово по літерах?"),
                ("Jag lär mig ett nytt ord varje dag.", "Я вивчаю нове слово кожного дня."),
                ("Det här ordet är svårt att uttala.", "Це слово важко вимовити.")
            ]),
            Question(expression: "речення", translation: "en mening", examples: [
                ("En mening består av flera ord.", "Речення складається з кількох слів."),
                ("Kan du skriva en mening på svenska?", "Ти можеш написати речення шведською?"),
                ("Den här meningen är för lång.", "Це речення занадто довге."),
                ("Jag förstår inte den här meningen.", "Я не розумію цього речення.")
            ]),
            Question(expression: "картинка", translation: "en bild", examples: [
                ("Bilden är mycket vacker.", "Картинка дуже гарна."),
                ("Jag ritar en bild till min vän.", "Я малюю картинку для свого друга."),
                ("Bilden hänger på väggen.", "Картинка висить на стіні."),
                ("Kan du ta en bild av oss?", "Ти можеш зробити фото нас?")
            ]),
            Question(expression: "ручка", translation: "en penna", examples: [
                ("Jag behöver en penna för att skriva.", "Мені потрібна ручка, щоб писати."),
                ("Pennan är blå.", "Ручка синя."),
                ("Kan jag låna din penna?", "Можу я позичити твою ручку?"),
                ("Pennan är slut, jag behöver en ny.", "Ручка закінчилася, мені потрібна нова.")
            ]),
            Question(expression: "книга", translation: "en bok", examples: [
                ("Boken är mycket intressant.", "Книга дуже цікава."),
                ("Jag läser en bok varje kväll.", "Я читаю книгу кожного вечора."),
                ("Kan du rekommendera en bra bok?", "Ти можеш порекомендувати хорошу книгу?"),
                ("Boken ligger på bordet.", "Книга лежить на столі.")
            ]),
            Question(expression: "сторінка", translation: "en sida", examples: [
                ("Varje sida i boken är numrerad.", "Кожна сторінка в книзі пронумерована."),
                ("Jag läser en sida i taget.", "Я читаю по одній сторінці."),
                ("Sidan är full av text.", "Сторінка повна тексту."),
                ("Vänd sidan, tack.", "Перегорніть сторінку, будь ласка.")
            ]),
            Question(expression: "лінійка", translation: "en linjal", examples: [
                ("Jag behöver en linjal för att rita.", "Мені потрібна лінійка, щоб малювати."),
                ("Linjalen är 30 centimeter lång.", "Лінійка завдовжки 30 сантиметрів."),
                ("Kan du låna mig din linjal?", "Ти можеш позичити мені свою лінійку?"),
                ("Linjalen är trasig.", "Лінійка зламана.")
            ]),
            Question(expression: "розклад", translation: "ett schema", examples: [
                ("Schemat visar alla lektioner.", "Розклад показує всі уроки."),
                ("Jag följer ett strikt schema.", "Я дотримуюся строгого розкладу."),
                ("Schemat är uppdaterat.", "Розклад оновлений."),
                ("Kan du skicka mig schemat?", "Ти можеш надіслати мені розклад?")
            ]),
            Question(expression: "точилка", translation: "en pennvässare", examples: [
                ("Jag behöver en pennvässare för min penna.", "Мені потрібна точилка для олівця."),
                ("Pennvässaren är liten och praktisk.", "Точилка маленька і зручна."),
                ("Kan jag använda din pennvässare?", "Можу я скористатися твоєю точилкою?"),
                ("Pennvässaren är trasig.", "Точилка зламана.")
            ]),
            Question(expression: "комп'ютер", translation: "en dator", examples: [
                ("Datorn är mycket snabb.", "Комп'ютер дуже швидкий."),
                ("Jag använder datorn varje dag.", "Я використовую комп'ютер щодня."),
                ("Kan du reparera min dator?", "Ти можеш полагодити мій комп'ютер?"),
                ("Datorn är ny.", "Комп'ютер новий.")
            ]),
            Question(expression: "учень", translation: "en elev", examples: [
                ("Eleven läser en bok.", "Учень читає книгу."),
                ("Varje elev har ett eget skåp.", "Кожен учень має свою шафку."),
                ("Eleven är mycket flitig.", "Учень дуже старанний."),
                ("Eleverna skriver ett prov.", "Учні пишуть контрольну.")
            ]),
            Question(expression: "рюкзак", translation: "en väska", examples: [
                ("Väskan är full av böcker.", "Рюкзак повний книжок."),
                ("Jag glömde min väska i skolan.", "Я забув свій рюкзак у школі."),
                ("Kan du bära min väska?", "Ти можеш понести мій рюкзак?"),
                ("Väskan är för tung.", "Рюкзак занадто важкий.")
            ]),
            Question(expression: "гумка", translation: "ett suddgummi", examples: [
                ("Jag behöver ett suddgummi för att radera.", "Мені потрібна гумка, щоб стерти."),
                ("Suddgummit är litet och rosa.", "Гумка маленька і рожева."),
                ("Kan jag låna ditt suddgummi?", "Можу я позичити твою гумку?"),
                ("Suddgummit är slut.", "Гумка закінчилася.")
            ]),
            Question(expression: "зошит", translation: "ett häfte", examples: [
                ("Häftet är fullt av anteckningar.", "Зошит повний записів."),
                ("Jag köpte ett nytt häfte.", "Я купив новий зошит."),
                ("Kan du ge mig ditt häfte?", "Ти можеш дати мені свій зошит?"),
                ("Häftet ligger i väskan.", "Зошит лежить у рюкзаку.")
            ]),
            Question(expression: "годинник", translation: "en klocka", examples: [
                ("Klockan visar tio över två.", "Годинник показує десять хвилин на третю."),
                ("Jag har en ny klocka.", "У мене новий годинник."),
                ("Klockan är trasig.", "Годинник зламаний."),
                ("Kan du kolla vad klockan är?", "Ти можеш подивитися, котра година?")
            ]),
            Question(expression: "словник", translation: "ett lexikon", examples: [
                ("Lexikonet hjälper mig att lära nya ord.", "Словник допомагає мені вивчати нові слова."),
                ("Jag använder lexikonet varje dag.", "Я використовую словник щодня."),
                ("Lexikonet är tungt.", "Словник важкий."),
                ("Kan jag låna ditt lexikon?", "Можу я позичити твій словник?")
            ])
        ],
        .homework4: [
            Question(expression: "їжа", translation: "en mat", examples: [
                ("Maten är mycket god.", "Їжа дуже смачна."),
                ("Jag lagar mat varje dag.", "Я готую їжу щодня."),
                ("Vilken mat gillar du mest?", "Яка їжа тобі найбільше подобається?"),
                ("Maten är klar att serveras.", "Їжа готова до подачі.")
            ]),
            Question(expression: "рис", translation: "ett ris", examples: [
                ("Riset kokar i tio minuter.", "Рис вариться десять хвилин."),
                ("Jag äter ris till middag.", "Я їм рис на вечерю."),
                ("Riset är en viktig basvara.", "Рис - це важливий основний продукт."),
                ("Kan du koka riset?", "Ти можеш зварити рис?")
            ]),
            Question(expression: "картопля", translation: "en potatis", examples: [
                ("Potatisen är kokt.", "Картопля варена."),
                ("Jag ska laga potatismos.", "Я збираюся приготувати картопляне пюре."),
                ("Potatis är nyttigt.", "Картопля корисна."),
                ("Kan du skära potatisen?", "Ти можеш нарізати картоплю?")
            ]),
            Question(expression: "м'ясо", translation: "ett kött", examples: [
                ("Köttet är färskt.", "М'ясо свіже."),
                ("Jag äter inte kött.", "Я не їм м'ясо."),
                ("Köttet behöver stekas.", "М'ясо потрібно підсмажити."),
                ("Vilket kött föredrar du?", "Яке м'ясо ти віддаєш перевагу?")
            ]),
            Question(expression: "ковбаса", translation: "en korv", examples: [
                ("Korven är grillad.", "Ковбаса грильована."),
                ("Jag äter korv till lunch.", "Я їм ковбасу на обід."),
                ("Korv är populärt i Sverige.", "Ковбаса популярна у Швеції."),
                ("Kan du köpa korv till mig?", "Ти можеш купити мені ковбасу?")
            ]),
            Question(expression: "риба", translation: "en fisk", examples: [
                ("Fisken är fångad i havet.", "Риба виловлена в морі."),
                ("Jag lagar fisk till middag.", "Я готую рибу на вечерю."),
                ("Fisk är nyttigt för hälsan.", "Риба корисна для здоров'я."),
                ("Kan du rengöra fisken?", "Ти можеш почистити рибу?")
            ]),
            Question(expression: "курка", translation: "en kyckling", examples: [
                ("Kycklingen är grillad.", "Курка грильована."),
                ("Jag äter kyckling till middag.", "Я їм курку на вечерю."),
                ("Kyckling är lätt att laga.", "Курку легко готувати."),
                ("Kan du skära kycklingen?", "Ти можеш нарізати курку?")
            ]),
            Question(expression: "фрикаделька", translation: "en köttbulle", examples: [
                ("Köttbullarna är hemlagade.", "Фрикадельки домашні."),
                ("Jag äter köttbullar med potatis.", "Я їм фрикадельки з картоплею."),
                ("Köttbullar är en svensk klassiker.", "Фрикадельки - це шведська класика."),
                ("Kan du laga köttbullar?", "Ти можеш приготувати фрикадельки?")
            ]),
            Question(expression: "помідор", translation: "en tomat", examples: [
                ("Tomaten är röd och saftig.", "Помідор червоний і соковитий."),
                ("Jag lägger tomat på smörgåsen.", "Я кладу помідор на бутерброд."),
                ("Tomater är nyttiga.", "Помідори корисні."),
                ("Kan du skära tomaten?", "Ти можеш нарізати помідор?")
            ]),
            Question(expression: "салат", translation: "en sallad", examples: [
                ("Salladen är färsk och god.", "Салат свіжий і смачний."),
                ("Jag äter sallad till lunch.", "Я їм салат на обід."),
                ("Sallad är nyttigt för hälsan.", "Салат корисний для здоров'я."),
                ("Kan du göra en sallad?", "Ти можеш зробити салат?")
            ]),
            Question(expression: "овоч", translation: "en grönsak", examples: [
                ("Grönsaker är nyttiga.", "Овочі корисні."),
                ("Jag äter många grönsaker.", "Я їм багато овочів."),
                ("Grönsaker är viktiga i kosten.", "Овочі важливі в раціоні."),
                ("Kan du köpa grönsaker?", "Ти можеш купити овочі?")
            ]),
            Question(expression: "суп", translation: "en soppa", examples: [
                ("Soppan är varm och god.", "Суп гарячий і смачний."),
                ("Jag lagar soppa till middag.", "Я готую суп на вечерю."),
                ("Soppa är perfekt på vintern.", "Суп ідеально підходить взимку."),
                ("Kan du smaka på soppan?", "Ти можеш спробувати суп?")
            ]),
            Question(expression: "бутерброд", translation: "en smörgås", examples: [
                ("Smörgåsen är enkel men god.", "Бутерброд простий, але смачний."),
                ("Jag äter en smörgås till frukost.", "Я їм бутерброд на сніданок."),
                ("Smörgåsar är populära i Sverige.", "Бутерброди популярні у Швеції."),
                ("Kan du göra en smörgås till mig?", "Ти можеш зробити мені бутерброд?")
            ]),
            Question(expression: "яблуко", translation: "ett äpple", examples: [
                ("Äpplet är sött och saftigt.", "Яблуко солодке і соковите."),
                ("Jag äter ett äpple varje dag.", "Я їм яблуко щодня."),
                ("Äpplen är nyttiga.", "Яблука корисні."),
                ("Kan du skära äpplet?", "Ти можеш нарізати яблуко?")
            ]),
            Question(expression: "апельсин", translation: "en apelsin", examples: [
                ("Apelsinen är färsk och saftig.", "Апельсин свіжий і соковитий."),
                ("Jag äter en apelsin till frukost.", "Я їм апельсин на сніданок."),
                ("Apelsiner är rika på C-vitamin.", "Апельсини багаті на вітамін С."),
                ("Kan du skala apelsinen?", "Ти можеш почистити апельсин?")
            ]),
            Question(expression: "банан", translation: "en banan", examples: [
                ("Bananen är mogen och god.", "Банан стиглий і смачний."),
                ("Jag äter en banan till mellanmål.", "Я їм банан на перекус."),
                ("Bananer är enkel att äta.", "Банани легко їсти."),
                ("Kan du köpa bananer?", "Ти можеш купити банани?")
            ]),
            Question(expression: "огірок", translation: "en gurka", examples: [
                ("Gurkan är färsk och krispig.", "Огірок свіжий і хрусткий."),
                ("Jag lägger gurka i salladen.", "Я кладу огірок у салат."),
                ("Gurka är nyttigt.", "Огірок корисний."),
                ("Kan du skära gurkan?", "Ти можеш нарізати огірок?")
            ]),
            Question(expression: "цибуля", translation: "en lök", examples: [
                ("Löken är stark och smakrik.", "Цибуля гостря і смачна."),
                ("Jag använder lök i matlagningen.", "Я використовую цибулю при приготуванні їжі."),
                ("Lök är viktigt i många rätter.", "Цибуля важлива у багатьох стравах."),
                ("Kan du hacka löken?", "Ти можеш нарізати цибулю?")
            ]),
            Question(expression: "молоко", translation: "en mjölk", examples: [
                ("Mjölken är färsk.", "Молоко свіже."),
                ("Jag dricker mjölk till frukost.", "Я п'ю молоко на сніданок."),
                ("Mjölk är nyttigt för benen.", "Молоко корисне для кісток."),
                ("Kan du köpa mjölk?", "Ти можеш купити молоко?")
            ]),
            Question(expression: "пиво", translation: "en/ett öl", examples: [
                ("Ölet är kallt och uppfriskande.", "Пиво холодне і освіжаюче."),
                ("Jag tar en öl efter jobbet.", "Я беру пиво після роботи."),  // Zmienione zdanie
                ("Öl är populärt på sommaren.", "Пиво популярне влітку."),
                ("Kan du köpa öl?", "Ти можеш купити пиво?")
            ]),
            Question(expression: "чай", translation: "ett te", examples: [
                ("Teet är varmt och skönt.", "Чай гарячий і затишний."),
                ("Jag dricker te varje morgon.", "Я п'ю чай кожного ранку."),
                ("Te är perfekt på vintern.", "Чай ідеально підходить взимку."),
                ("Kan du koka te?", "Ти можеш заварити чай?")
            ]),
            Question(expression: "кава", translation: "en kaffe", examples: [
                ("Kaffet är starkt och gott.", "Кава міцна і смачна."),
                ("Jag dricker kaffe varje dag.", "Я п'ю каву щодня."),
                ("Kaffe hjälper mig att vakna.", "Кава допомагає мені прокинутися."),
                ("Kan du göra kaffe?", "Ти можеш зробити каву?")
            ])
        ],
        .homework5: [
            Question(expression: "червоний", translation: "röd", examples: [
                ("Den röda bilen är snabb.", "Червона машина швидка."),
                ("Jag har en röd tröja.", "У мене червона светр."),
                ("Röda rosor är vackra.", "Червоні троянди красиві."),
                ("Kan du ge mig den röda boken?", "Ти можеш дати мені червону книгу?")
            ]),
            Question(expression: "синій", translation: "blå", examples: [
                ("Himlen är blå idag.", "Небо сьогодні синє."),
                ("Jag har blå ögon.", "У мене сині очі."),
                ("Den blå väskan är min.", "Синій рюкзак мій."),
                ("Blå är min favoritfärg.", "Синій - мій улюблений колір.")
            ]),
            Question(expression: "жовтий", translation: "gul", examples: [
                ("Solen är gul.", "Сонце жовте."),
                ("Jag har en gul penna.", "У мене жовта ручка."),
                ("Gula bananer är söta.", "Жовті банани солодкі."),
                ("Kan du köpa den gula lampan?", "Ти можеш купити ту жовту лампу?")
            ]),
            Question(expression: "зелений", translation: "grön", examples: [
                ("Gräset är grönt.", "Трава зелена."),
                ("Jag har en grön jacka.", "У мене зелена куртка."),
                ("Gröna äpplen är sura.", "Зелені яблука кислі."),
                ("Grön är färgen på naturen.", "Зелений - це колір природи.")
            ]),
            Question(expression: "помаранчевий", translation: "orange", examples: [
                ("Den orange frukten är saftig.", "Помаранчевий фрукт соковитий."),
                ("Jag har en orange tröja.", "У мене помаранчева светр."),
                ("Orange är en varm färg.", "Помаранчевий - це теплий колір."),
                ("Kan du se den orange bilen?", "Ти бачиш ту помаранчеву машину?")
            ]),
            Question(expression: "фіолетовий", translation: "lila", examples: [
                ("Lila blommor är vackra.", "Фіолетові квіти красиві."),
                ("Jag har en lila klänning.", "У мене фіолетова сукня."),
                ("Lila är en rolig färg.", "Фіолетовий - це веселий колір."),
                ("Kan du köpa det lila täcket?", "Ти можеш купити те фіолетове покривало?")
            ]),
            Question(expression: "чорний", translation: "svart", examples: [
                ("Katten är svart.", "Кіт чорний."),
                ("Jag har svarta skor.", "У мене чорні черевики."),
                ("Svart är en elegant färg.", "Чорний - це елегантний колір."),
                ("Kan du se den svarta bilen?", "Ти бачиш ту чорну машину?")
            ]),
            Question(expression: "білий", translation: "vit", examples: [
                ("Snön är vit.", "Сніг білий."),
                ("Jag har en vit skjorta.", "У мене біла сорочка."),
                ("Vita rosor är vackra.", "Білі троянди красиві."),
                ("Kan du köpa det vita ljuset?", "Ти можеш купити ту білу свічку?")
            ]),
            Question(expression: "коричневий", translation: "brun", examples: [
                ("Trädet är brunt.", "Дерево коричневе."),
                ("Jag har en brun väska.", "У мене коричневий рюкзак."),
                ("Brunt bröd är nyttigt.", "Коричневий хліб корисний."),
                ("Kan du se den bruna stolen?", "Ти бачиш той коричневий стілець?")
            ]),
            Question(expression: "рожевий", translation: "rosa", examples: [
                ("Rosa blommor är vackra.", "Рожеві квіти красиві."),
                ("Jag har en rosa tröja.", "У мене рожева светр."),
                ("Rosa är en glad färg.", "Рожевий - це веселий колір."),
                ("Kan du köpa den rosa lampan?", "Ти можеш купити ту рожеву лампу?")
            ]),
            Question(expression: "молодий", translation: "ung", examples: [
                ("Han är en ung man.", "Він молодий чоловік."),
                ("De unga barnen leker.", "Молоді діти граються."),
                ("Ung är motsatsen till gammal.", "Молодий - це протилежність до старого."),
                ("Kan du se den unga hunden?", "Ти бачиш того молодого собаку?")
            ]),
            Question(expression: "новий", translation: "ny", examples: [
                ("Det är en ny bil.", "Це нова машина."),
                ("Jag har en ny telefon.", "У мене новий телефон."),
                ("Ny är motsatsen till gammal.", "Новий - це протилежність до старого."),
                ("Kan du köpa den nya boken?", "Ти можеш купити ту нову книгу?")
            ]),
            Question(expression: "старий", translation: "gammal", examples: [
                ("Det är en gammal bil.", "Це стара машина."),
                ("Jag har en gammal bok.", "У мене стара книга."),
                ("Gammal är motsatsen till ny.", "Старий - це протилежність до нового."),
                ("Kan du se det gamla huset?", "Ти бачиш той старий будинок?")
            ]),
            Question(expression: "довгий", translation: "lång", examples: [
                ("Det är en lång väg.", "Це довга дорога."),
                ("Jag har långt hår.", "У мене довге волосся."),
                ("Lång är motsatsen till kort.", "Довгий - це протилежність до короткого."),
                ("Kan du se den långa bron?", "Ти бачиш той довгий міст?")
            ]),
            Question(expression: "смугастий", translation: "randig", examples: [
                ("Den randiga tröjan är snygg.", "Смугаста светр стильна."),
                ("Jag har en randig skjorta.", "У мене смугаста сорочка."),
                ("Randigt är populärt i år.", "Смугастий візерунок популярний цього року."),
                ("Kan du köpa den randiga väskan?", "Ти можеш купити той смугастий рюкзак?")
            ]),
            Question(expression: "клітинчастий", translation: "rutig", examples: [
                ("Den rutiga skjortan är klassisk.", "Клітинчаста сорочка класична."),
                ("Jag har en rutig filt.", "У мене клітинчаста ковдра."),
                ("Rutigt är en tidlös stil.", "Клітинчастий візерунок - це безчасний стиль."),
                ("Kan du se den rutiga väskan?", "Ти бачиш той клітинчастий рюкзак?")
            ]),
            Question(expression: "крапчастий", translation: "prickig", examples: [
                ("Den prickiga hunden är söt.", "Крапчастий собака милий."),
                ("Jag har en prickig klänning.", "У мене крапчаста сукня."),
                ("Prickigt är roligt att titta på.", "Крапчастий візерунок весело розглядати."),
                ("Kan du köpa den prickiga tröjan?", "Ти можеш купити ту крапчасту светр?")
            ]),
            Question(expression: "квітчастий", translation: "blommig", examples: [
                ("Den blommiga klänningen är vacker.", "Квітчаста сукня красива."),
                ("Jag har en blommig skjorta.", "У мене квітчаста сорочка."),
                ("Blommigt är perfekt på sommaren.", "Квітчастий візерунок ідеально підходить для літа."),
                ("Kan du se den blommiga väskan?", "Ти бачиш той квітчастий рюкзак?")
            ]),
            Question(expression: "великий", translation: "stor", examples: [
                ("Det är en stor bil.", "Це велика машина."),
                ("Jag har en stor familj.", "У мене велика сім'я."),
                ("Stor är motsatsen till liten.", "Великий - це протилежність до маленького."),
                ("Kan du se det stora huset?", "Ти бачиш той великий будинок?")
            ]),
            Question(expression: "маленький", translation: "liten", examples: [
                ("Det är en liten bil.", "Це маленька машина."),
                ("Jag har en liten hund.", "У мене маленький собака."),
                ("Liten är motsatsen till stor.", "Маленький - це протилежність до великого."),
                ("Kan du se den lilla fågeln?", "Ти бачиш ту маленьку пташку?")
            ]),
            Question(expression: "короткий", translation: "kort", examples: [
                ("Det är en kort film.", "Це короткий фільм."),
                ("Jag har kort hår.", "У мене коротке волосся."),
                ("Kort är motsatsen till lång.", "Короткий - це протилежність до довгого."),
                ("Kan du se den korta vägen?", "Ти бачиш ту коротку дорогу?")
            ]),
            Question(expression: "щасливий", translation: "glad", examples: [
                ("Jag är glad idag.", "Я щасливий сьогодні."),
                ("Hon har ett glatt leende.", "У неї щаслива посмішка."),
                ("Glad är motsatsen till ledsen.", "Щасливий - це протилежність до сумного."),
                ("Kan du se den glada hunden?", "Ти бачиш того щасливого собаку?")
            ]),
            Question(expression: "сумний", translation: "ledsen", examples: [
                ("Jag är ledsen idag.", "Я сумний сьогодні."),
                ("Han ser ledsen ut.", "Він виглядає сумним."),
                ("Ledsen är motsatsen till glad.", "Сумний - це протилежність до щасливого."),
                ("Kan du trösta den ledsna flickan?", "Ти можеш потішити ту сумну дівчинку?")
            ])
        ],
        .weekdays: [
            Question(expression: "понеділок", translation: "en måndag", examples: [
                ("Måndag är veckans första dag.", "Понеділок - це перший день тижня."),
                ("Vi börjar jobba på måndag.", "Ми починаємо працювати в понеділок."),
                ("Skolan börjar på måndag.", "Школа починається в понеділок."),
                ("Jag går till gymmet på måndag.", "Я йду до спортзалу в понеділок.")
            ]),
            Question(expression: "вівторок", translation: "en tisdag", examples: [
                ("Tisdag är veckans andra dag.", "Вівторок - це другий день тижня."),
                ("Vi har möte på tisdag.", "Ми маємо зустріч у вівторок."),
                ("Jag ska laga middag på tisdag.", "Я готуватиму вечерю у вівторок."),
                ("På tisdag går jag till biblioteket.", "У вівторок я йду до бібліотеки.")
            ]),
            Question(expression: "середа", translation: "en onsdag", examples: [
                ("Onsdag är veckans tredje dag.", "Середа - це третій день тижня."),
                ("Jag har simning på onsdag.", "У мене плавання у середу."),
                ("Vi träffas på onsdag.", "Ми зустрічаємось у середу."),
                ("Onsdag är en bra dag.", "Середа - гарний день.")
            ]),
            Question(expression: "четвер", translation: "en torsdag", examples: [
                ("Torsdag är veckans fjärde dag.", "Четвер - це четвертий день тижня."),
                ("Jag går till tandläkaren på torsdag.", "Я йду до стоматолога у четвер."),
                ("Vi har fotbollsträning på torsdag.", "У нас тренування з футболу у четвер."),
                ("Torsdag brukar vara lugn.", "Четвер зазвичай спокійний.")
            ]),
            Question(expression: "п'ятниця", translation: "en fredag", examples: [
                ("Fredag är veckans femte dag.", "П'ятниця - це п'ятий день тижня."),
                ("Jag ser fram emot fredag.", "Я з нетерпінням чекаю п'ятниці."),
                ("På fredag äter vi pizza.", "У п'ятницю ми їмо піцу."),
                ("Fredag är min favoritdag.", "П'ятниця - мій улюблений день.")
            ]),
            Question(expression: "субота", translation: "en lördag", examples: [
                ("Lördag är veckans sjätte dag.", "Субота - це шостий день тижня."),
                ("Jag vilar på lördag.", "Я відпочиваю у суботу."),
                ("Vi går på bio på lördag.", "Ми йдемо в кіно у суботу."),
                ("Lördagar är lediga dagar.", "Суботи - це вихідні дні.")
            ]),
            Question(expression: "неділя", translation: "en söndag", examples: [
                ("Söndag är veckans sista dag.", "Неділя - це останній день тижня."),
                ("Vi besöker familjen på söndag.", "Ми відвідуємо родину у неділю."),
                ("Jag läser en bok på söndag.", "Я читаю книгу у неділю."),
                ("Söndag är en lugn dag.", "Неділя - це спокійний день.")
            ])
        ],
        
            .months: [
                Question(expression: "січень", translation: "en januari", examples: [
                    ("Januari är den första månaden på året.", "Січень - це перший місяць року."),
                    ("Vi firar nyår i januari.", "Ми святкуємо Новий рік у січні."),
                    ("Det är kallt i januari.", "У січні холодно."),
                    ("Skolan börjar efter jul i januari.", "Школа починається після Різдва у січні.")
                ]),
                Question(expression: "лютий", translation: "en februari", examples: [
                    ("Februari är den kortaste månaden.", "Лютий - найкоротший місяць."),
                    ("Alla hjärtans dag är i februari.", "День святого Валентина у лютому."),
                    ("I februari är det ofta snö.", "У лютому часто лежить сніг."),
                    ("Vi åker skidor i februari.", "Ми катаємося на лижах у лютому.")
                ]),
                Question(expression: "березень", translation: "en mars", examples: [
                    ("Mars är den första vårmånaden.", "Березень - це перший весняний місяць."),
                    ("Dagarna blir längre i mars.", "Дні стають довшими у березні."),
                    ("Vi firar kvinnodagen i mars.", "Ми святкуємо День жінок у березні."),
                    ("Snön börjar smälta i mars.", "Сніг починає танути у березні.")
                ]),
                Question(expression: "квітень", translation: "en april", examples: [
                    ("April har ofta mycket regn.", "У квітні часто йдуть дощі."),
                    ("April är en vårmånad.", "Квітень - це весняний місяць."),
                    ("Påsken firas ibland i april.", "Великдень іноді святкується у квітні."),
                    ("Träden får nya blad i april.", "Дерева отримують нове листя у квітні.")
                ]),
                Question(expression: "травень", translation: "en maj", examples: [
                    ("Maj är en vacker månad.", "Травень - це гарний місяць."),
                    ("Blommorna blommar i maj.", "Квіти цвітуть у травні."),
                    ("Vi firar första maj.", "Ми святкуємо перше травня."),
                    ("Solen skiner ofta i maj.", "Сонце часто світить у травні.")
                ]),
                Question(expression: "червень", translation: "en juni", examples: [
                    ("Juni är den första sommarmånaden.", "Червень - це перший літній місяць."),
                    ("Vi har skolavslutning i juni.", "У червні в нас закінчується навчальний рік."),
                    ("Midsommar firas i juni.", "Свято середини літа відзначається у червні."),
                    ("Det är varmt i juni.", "У червні тепло.")
                ]),
                Question(expression: "липень", translation: "en juli", examples: [
                    ("Juli är den varmaste månaden.", "Липень - найтепліший місяць."),
                    ("Många har semester i juli.", "Багато людей мають відпустку у липні."),
                    ("Vi badar i havet i juli.", "Ми купаємося у морі в липні."),
                    ("Blåbären mognar i juli.", "Чорниця дозріває у липні.")
                ]),
                Question(expression: "серпень", translation: "en augusti", examples: [
                    ("Augusti är den sista sommarmånaden.", "Серпень - останній літній місяць."),
                    ("Skolan börjar i augusti.", "Школа починається у серпні."),
                    ("Vi plockar svamp i augusti.", "Ми збираємо гриби у серпні."),
                    ("Dagarna blir kortare i augusti.", "Дні стають коротшими у серпні.")
                ]),
                Question(expression: "вересень", translation: "en september", examples: [
                    ("September är den första höstmånaden.", "Вересень - це перший осінній місяць."),
                    ("Löven börjar falla i september.", "Листя починає опадати у вересні."),
                    ("Vi börjar skolan i september.", "Ми починаємо навчання у вересні."),
                    ("Äpplen mognar i september.", "Яблука дозрівають у вересні.")
                ]),
                Question(expression: "жовтень", translation: "en oktober", examples: [
                    ("Oktober har vackra höstfärger.", "У жовтні красиві осінні кольори."),
                    ("Halloween firas i oktober.", "Гелловін святкується у жовтні."),
                    ("Det blir kallare i oktober.", "У жовтні стає холодніше."),
                    ("Vi tänder ljus i oktober.", "Ми запалюємо свічки у жовтні.")
                ]),
                Question(expression: "листопад", translation: "en november", examples: [
                    ("November är en mörk månad.", "Листопад - це темний місяць."),
                    ("Det regnar ofta i november.", "У листопаді часто йдуть дощі."),
                    ("Vi firar Alla helgons dag i november.", "Ми святкуємо День усіх святих у листопаді."),
                    ("Snön kan komma i november.", "Сніг може випасти у листопаді.")
                ]),
                Question(expression: "грудень", translation: "en december", examples: [
                    ("December är den sista månaden.", "Грудень - це останній місяць."),
                    ("Vi firar jul i december.", "Ми святкуємо Різдво у грудні."),
                    ("Det är kallt och mörkt i december.", "У грудні холодно і темно."),
                    ("Nyårsafton är i december.", "Новий рік святкується у грудні.")
                ]),
            ],
        
            .modalVerbs: [
                Question(expression: "могти", translation: "kunna", examples: [
                    ("Jag kan tala svenska.", "Я можу говорити шведською."), // presens
                    ("Jag kunde tala svenska när jag var barn.", "Я міг говорити шведською, коли був дитиною."), // preteritum
                    ("Jag har kunnat tala svenska länge.", "Я давно міг говорити шведською."), // supinum
                    ("Jag vill kunna tala svenska flytande.", "Я хочу могти говорити шведською вільно.") // infinitiv
                ]),
                Question(expression: "хотіти", translation: "vilja", examples: [
                    ("Jag vill resa till Sverige.", "Я хочу подорожувати до Швеції."), // presens
                    ("Jag ville resa till Sverige förra året.", "Я хотів подорожувати до Швеції минулого року."), // preteritum
                    ("Jag har velat resa till Sverige länge.", "Я давно хотів подорожувати до Швеції."), // supinum
                    ("Jag försöker vilja resa mer.", "Я намагаюся хотіти подорожувати більше.") // infinitiv
                ]),
                Question(expression: "повинен", translation: "måste", examples: [
                    ("Jag måste arbeta idag.", "Я повинен працювати сьогодні."), // presens
                    ("Jag måste arbeta igår också.", "Я повинен був працювати вчора також."), // preteritum (måste ma taką samą formę)
                    ("Jag har måst arbeta hela veckan.", "Я повинен був працювати весь тиждень."), // supinum
                    ("Jag försöker inte måsta arbeta så mycket.", "Я намагаюся не бути змушеним працювати так багато.") // infinitiv
                ]),
                Question(expression: "мати дозвіл", translation: "få", examples: [
                    ("Jag får gå ut nu.", "Я маю дозвіл вийти зараз."), // presens
                    ("Jag fick gå ut igår.", "Я мав дозвіл вийти вчора."), // preteritum
                    ("Jag har fått gå ut varje dag.", "Я мав дозвіл виходити щодня."), // supinum
                    ("Jag vill få gå ut när jag vill.", "Я хочу мати дозвіл виходити, коли хочу.") // infinitiv
                ]),
                Question(expression: "мати намір", translation: "ska", examples: [
                    ("Jag ska resa imorgon.", "Я маю намір подорожувати завтра."), // presens
                    ("Jag skulle resa förra veckan.", "Я мав намір подорожувати минулого тижня."), // preteritum
                    ("Jag har skolat resa flera gånger.", "Я мав намір подорожувати багато разів."), // supinum (rzadko używane)
                    ("Jag försöker skola resa oftare.", "Я намагаюся мати намір подорожувати частіше.") // infinitiv
                ]),
                Question(expression: "слід", translation: "böra", examples: [
                    ("Du bör vila mer.", "Тобі слід більше відпочивати."), // presens
                    ("Du borde vila igår.", "Тобі слід було відпочити вчора."), // preteritum
                    ("Du har bort vila mer.", "Тобі слід було більше відпочивати."), // supinum (rzadko używane)
                    ("Jag försöker böra vila mer.", "Я намагаюся мати звичку відпочивати більше.") // infinitiv
                ])
            ],
        
            .bodyParts: [
                Question(expression: "тіло", translation: "en kropp", examples: [
                    ("Människokroppen är fascinerande.", "Людське тіло є захоплюючим."),
                    ("Jag tar hand om min kropp.", "Я дбаю про своє тіло."),
                    ("Kroppen behöver vila.", "Тіло потребує відпочинку."),
                    ("Vi lär oss om kroppen i skolan.", "Ми вивчаємо тіло в школі.")
                ]),
                Question(expression: "частина тіла", translation: "en kroppsdel", examples: [
                    ("Huvudet är en kroppsdel.", "Голова - це частина тіла."),
                    ("Jag skadade en kroppsdel.", "Я пошкодив частину тіла."),
                    ("Olika kroppsdelar har olika funktioner.", "Різні частини тіла мають різні функції."),
                    ("Doktorn undersökte min kroppsdel.", "Лікар обстежив мою частину тіла.")
                ]),
                Question(expression: "голова", translation: "ett huvud", examples: [
                    ("Jag har ont i huvudet.", "У мене болить голова."),
                    ("Han skyddade sitt huvud.", "Він захищав свою голову."),
                    ("Barnet har en liten huvud.", "У дитини маленька голова."),
                    ("Hon har ett runt huvud.", "Вона має круглу голову.")
                ]),
                Question(expression: "око", translation: "ett öga", examples: [
                    ("Mina ögon är blå.", "Мої очі сині."),
                    ("Jag ser med mina ögon.", "Я бачу своїми очима."),
                    ("Hon har vackra ögon.", "Вона має гарні очі."),
                    ("Barnet blinkade med ena ögat.", "Дитина підморгнула одним оком.")
                ]),
                Question(expression: "вухо", translation: "ett öra", examples: [
                    ("Mitt öra gör ont.", "Моє вухо болить."),
                    ("Jag hör med mina öron.", "Я чую своїми вухами."),
                    ("Barnet har små öron.", "У дитини маленькі вуха."),
                    ("Läkaren undersökte mitt öra.", "Лікар оглянув моє вухо.")
                ]),
                Question(expression: "ніс", translation: "en näsa", examples: [
                    ("Min näsa är täppt.", "Мій ніс закладений."),
                    ("Jag luktar med näsan.", "Я нюхаю носом."),
                    ("Barnet har en liten näsa.", "У дитини маленький ніс."),
                    ("Jag snyter min näsa.", "Я сякаю ніс.")
                ]),
                Question(expression: "рот", translation: "en mun", examples: [
                    ("Jag äter med munnen.", "Я їм ротом."),
                    ("Munnen är en viktig kroppsdel.", "Рот - важлива частина тіла."),
                    ("Hon har ett vackert leende.", "Вона має гарну усмішку."),
                    ("Barnet öppnade sin mun.", "Дитина відкрила рот.")
                ]),
                Question(expression: "рука", translation: "en arm", examples: [
                    ("Min arm gör ont.", "У мене болить рука."),
                    ("Han lyfte sin arm.", "Він підняв свою руку."),
                    ("Jag tränar mina armar.", "Я треную свої руки."),
                    ("Hon har en stark arm.", "Вона має сильну руку.")
                ]),
                Question(expression: "долоня", translation: "en handflata", examples: [
                    ("Jag klappade med handflatan.", "Я плескав долонею."),
                    ("Barnet har mjuka handflator.", "У дитини м'які долоні."),
                    ("Jag känner med handflatan.", "Я відчуваю долонею."),
                    ("Handflatan svettas ibland.", "Долоня іноді пітніє.")
                ]),
                Question(expression: "палець", translation: "ett finger", examples: [
                    ("Jag bröt ett finger.", "Я зламав палець."),
                    ("Barnet suger på sitt finger.", "Дитина смокче палець."),
                    ("Jag pekar med fingret.", "Я вказую пальцем."),
                    ("Hon har långa fingrar.", "Вона має довгі пальці.")
                ])
            ],
        
            .colors: [
                Question(expression: "червоний", translation: "röd", examples: [
                    ("Huset är rött.", "Будинок червоний."),
                    ("Jag köpte en röd bil.", "Я купив червону машину."),
                    ("Rosen är röd.", "Троянда червона."),
                    ("Tomater är röda.", "Помідори червоні.")
                ]),
                Question(expression: "синій", translation: "blå", examples: [
                    ("Himlen är blå.", "Небо синє."),
                    ("Jag har en blå tröja.", "У мене є синя кофта."),
                    ("Havet är blått.", "Море синє."),
                    ("Min favoritfärg är blå.", "Мій улюблений колір - синій.")
                ]),
                Question(expression: "жовтий", translation: "gul", examples: [
                    ("Solen är gul.", "Сонце жовте."),
                    ("Jag har en gul bok.", "У мене є жовта книга."),
                    ("Bananer är gula.", "Банани жовті."),
                    ("Huset har gula väggar.", "Будинок має жовті стіни.")
                ]),
                Question(expression: "зелений", translation: "grön", examples: [
                    ("Gräset är grönt.", "Трава зелена."),
                    ("Jag älskar gröna äpplen.", "Я люблю зелені яблука."),
                    ("Bilen är grön.", "Автомобіль зелений."),
                    ("Skogen är grön på sommaren.", "Ліс зелений влітку.")
                ]),
                Question(expression: "чорний", translation: "svart", examples: [
                    ("Min katt är svart.", "Мій кіт чорний."),
                    ("Jag bär svarta byxor.", "Я ношу чорні штани."),
                    ("Natten är svart.", "Ніч чорна."),
                    ("Svarta skor är klassiska.", "Чорні туфлі класичні.")
                ]),
                Question(expression: "білий", translation: "vit", examples: [
                    ("Snön är vit.", "Сніг білий."),
                    ("Jag har en vit skjorta.", "У мене є біла сорочка."),
                    ("Hunden är vit.", "Собака білий."),
                    ("Mjölk är vit.", "Молоко біле.")
                ]),
                Question(expression: "коричневий", translation: "brun", examples: [
                    ("Björnen är brun.", "Ведмідь коричневий."),
                    ("Jag har bruna ögon.", "У мене карі очі."),
                    ("Kaffet är brunt.", "Кава коричнева."),
                    ("Skorna är bruna.", "Черевики коричневі.")
                ]),
                Question(expression: "фіолетовий", translation: "lila", examples: [
                    ("Blomman är lila.", "Квітка фіолетова."),
                    ("Min tröja är lila.", "Моя кофта фіолетова."),
                    ("Vissa druvor är lila.", "Деякі виногради фіолетові."),
                    ("Jag målade väggen lila.", "Я пофарбував стіну у фіолетовий.")
                ]),
                Question(expression: "рожевий", translation: "rosa", examples: [
                    ("Hennes klänning är rosa.", "Її сукня рожева."),
                    ("Jag gillar rosa blommor.", "Мені подобаються рожеві квіти."),
                    ("Himlen blir rosa på kvällen.", "Небо стає рожевим увечері."),
                    ("Min dotter älskar rosa.", "Моя донька любить рожевий.")
                ]),
                Question(expression: "помаранчевий", translation: "orange", examples: [
                    ("Apelsiner är orange.", "Апельсини помаранчеві."),
                    ("Jag har en orange jacka.", "У мене є помаранчева куртка."),
                    ("Solnedgången är orange.", "Захід сонця помаранчевий."),
                    ("Pumpor är orange på hösten.", "Гарбузи восени помаранчеві.")
                ]),
                Question(expression: "сірий", translation: "grå", examples: [
                    ("Himlen är grå idag.", "Сьогодні небо сіре."),
                    ("Jag har en grå tröja.", "У мене є сіра кофта."),
                    ("Vargen har grå päls.", "Вовк має сіру шерсть."),
                    ("Gamla byggnader är ofta grå.", "Старі будівлі часто сірі.")
                ]),
                Question(expression: "бежевий", translation: "beige", examples: [
                    ("Mina skor är beige.", "Мої туфлі бежеві."),
                    ("Väggarna är målade i beige.", "Стіни пофарбовані в бежевий."),
                    ("Jag har en beige jacka.", "У мене є бежева куртка."),
                    ("Mattan är beige.", "Килим бежевий.")
                ]),
                Question(expression: "золотий", translation: "guld", examples: [
                    ("Ringen är av guld.", "Кільце із золота."),
                    ("Guld är en dyr metall.", "Золото – дорога металева."),
                    ("Himlen blev gyllene.", "Небо стало золотавим."),
                    ("Hon har guldörhängen.", "Вона має золоті сережки.")
                ]),
                Question(expression: "срібний", translation: "silver", examples: [
                    ("Besticken är av silver.", "Столові прибори зі срібла."),
                    ("Hennes hår är silvergrått.", "Її волосся сріблясто-сіре."),
                    ("Månen lyser som silver.", "Місяць світить як срібло."),
                    ("Jag har en silverring.", "У мене є срібна каблучка.")
                ])
            ],
        
            .verbs: [
                Question(expression: "бути", translation: "vara", examples: [
                    ("Jag vill vara här.", "Я хочу бути тут."),
                    ("Han vill vara en lärare.", "Він хоче бути вчителем."),
                    ("Det är svårt att vara ärlig.", "Важко бути чесним."),
                    ("Jag försöker vara positiv.", "Я намагаюся бути позитивним.")
                ]),
                Question(expression: "мати", translation: "ha", examples: [
                    ("Jag har en katt.", "Я маю кота."),
                    ("Hon vill ha en bok.", "Вона хоче мати книгу."),
                    ("Vi måste ha tålamod.", "Ми повинні мати терпіння."),
                    ("Kan jag ha en kopp kaffe?", "Чи можу я мати чашку кави?")
                ]),
                Question(expression: "йти", translation: "gå", examples: [
                    ("Jag går till jobbet varje dag.", "Я ходжу на роботу щодня."),
                    ("Vi ska gå till parken.", "Ми підемо до парку."),
                    ("Hon gick hem tidigt.", "Вона пішла додому рано."),
                    ("Vill du gå med mig?", "Ти хочеш піти зі мною?")
                ]),
                Question(expression: "бачити", translation: "se", examples: [
                    ("Jag ser en fågel.", "Я бачу птаха."),
                    ("Kan du se bilen?", "Ти бачиш машину?"),
                    ("Vi såg en film igår.", "Ми дивилися фільм вчора."),
                    ("Jag vill se havet.", "Я хочу побачити море.")
                ]),
                Question(expression: "говорити", translation: "tala", examples: [
                    ("Han talar svenska.", "Він говорить шведською."),
                    ("Kan du tala långsammare?", "Можеш говорити повільніше?"),
                    ("Vi talar ofta i telefon.", "Ми часто розмовляємо по телефону."),
                    ("Hon talar tre språk.", "Вона говорить трьома мовами.")
                ]),
                Question(expression: "працювати", translation: "arbeta", examples: [
                    ("Jag arbetar på en fabrik.", "Я працюю на заводі."),
                    ("Hon arbetar som läkare.", "Вона працює лікарем."),
                    ("Vi arbetar tillsammans.", "Ми працюємо разом."),
                    ("Jag älskar att arbeta.", "Я люблю працювати.")
                ]),
                Question(expression: "давати", translation: "ge", examples: [
                    ("Kan du ge mig boken?", "Можеш дати мені книгу?"),
                    ("Hon gav honom en present.", "Вона дала йому подарунок."),
                    ("Jag ska ge dig ett råd.", "Я дам тобі пораду."),
                    ("Vi ger alltid vårt bästa.", "Ми завжди віддаємо найкраще.")
                ]),
                Question(expression: "любити", translation: "älska", examples: [
                    ("Jag älskar dig.", "Я люблю тебе."),
                    ("Hon älskar att dansa.", "Вона любить танцювати."),
                    ("Vi älskar att resa.", "Ми любимо подорожувати."),
                    ("Han älskar choklad.", "Він любить шоколад.")
                ]),
                Question(expression: "жити", translation: "bo", examples: [
                    ("Jag bor i Sverige.", "Я живу у Швеції."),
                    ("Hon bor i en liten stad.", "Вона живе в маленькому місті."),
                    ("Vi bor nära havet.", "Ми живемо біля моря."),
                    ("De bor tillsammans.", "Вони живуть разом.")
                ]),
                Question(expression: "писати", translation: "skriva", examples: [
                    ("Jag skriver ett brev.", "Я пишу листа."),
                    ("Hon skriver en bok.", "Вона пише книгу."),
                    ("Vi skriver ofta e-post.", "Ми часто пишемо електронні листи."),
                    ("Han skriver i sin dagbok.", "Він пише у своєму щоденнику.")
                ])],
        
            .vegetables: [
                Question(expression: "морква", translation: "en morot", examples: [
                    ("Jag äter en morot varje dag.", "Я їм моркву кожного дня."),
                    ("Morötter är bra för ögonen.", "Морква корисна для очей."),
                    ("Vi ska laga en morotssoppa.", "Ми будемо варити морквяний суп."),
                    ("Han gillar att riva morötter.", "Він любить терти моркву.")
                ]),
                Question(expression: "капуста", translation: "en kål", examples: [
                    ("Kål är bra för magen.", "Капуста корисна для шлунка."),
                    ("Jag gillar att äta kokt kål.", "Я люблю їсти варену капусту."),
                    ("Kål används i många rätter.", "Капусту використовують у багатьох стравах."),
                    ("Vi odlar kål i trädgården.", "Ми вирощуємо капусту в саду.")
                ]),
                Question(expression: "картопля", translation: "en potatis", examples: [
                    ("Jag kokar potatis till middag.", "Я варю картоплю на вечерю."),
                    ("Potatis är en vanlig maträtt i Sverige.", "Картопля — це поширена страва в Швеції."),
                    ("Vi ska äta potatisgratäng.", "Ми будемо їсти картопляну запіканку."),
                    ("De odlar potatis på gården.", "Вони вирощують картоплю на подвір'ї.")
                ]),
                Question(expression: "помідор", translation: "en tomat", examples: [
                    ("Jag gillar att äta tomater i sallader.", "Мені подобається їсти помідори в салатах."),
                    ("Tomater växer bra i solen.", "Помідори добре ростуть на сонці."),
                    ("Vi har många tomater i trädgården.", "У нас багато помідорів в саду."),
                    ("Hon älskar tomatsås.", "Вона любить томатний соус.")
                ]),
                Question(expression: "броколі", translation: "en broccoli", examples: [
                    ("Broccoli är en hälsosam grönsak.", "Броколі — це корисний овоч."),
                    ("Vi ska äta broccoli till middag.", "Ми будемо їсти броколі на вечерю."),
                    ("Han tycker inte om broccoli.", "Він не любить броколі."),
                    ("Broccoli innehåller mycket vitaminer.", "Броколі містить багато вітамінів.")
                ]),
                Question(expression: "огірок", translation: "en gurka", examples: [
                    ("Jag gillar att äta gurka i sallader.", "Мені подобається їсти огірок у салатах."),
                    ("Gurka är bra för huden.", "Огірок корисний для шкіри."),
                    ("Vi ska skära gurka till mackorna.", "Ми будемо нарізати огірок для бутербродів."),
                    ("Hon odlar gurkor i växthuset.", "Вона вирощує огірки в теплиці.")
                ]),
                Question(expression: "цибуля", translation: "en lök", examples: [
                    ("Jag hackar lök till soppan.", "Я ріжу цибулю для супу."),
                    ("Lök ger en god smak i maten.", "Цибуля надає гарний смак їжі."),
                    ("De säljer lök på torget.", "Вони продають цибулю на ринку."),
                    ("Hon gråter när hon skär lök.", "Вона плаче, коли ріже цибулю.")
                ]),
                Question(expression: "перець", translation: "en paprika", examples: [
                    ("Jag gillar att äta paprika med ost.", "Мені подобається їсти перець з сиром."),
                    ("Paprika finns i många färger.", "Перець буває різних кольорів."),
                    ("Vi ska laga en gryta med paprika.", "Ми будемо готувати рагу з перцем."),
                    ("Paprika är en bra källa till vitamin C.", "Перець — хороший джерело вітаміну C.")
                ]),
                Question(expression: "шпинат", translation: "en spenat", examples: [
                    ("Jag äter spenat för att bli stark.", "Я їм шпинат, щоб стати сильним."),
                    ("Spenat är bra för hälsan.", "Шпинат корисний для здоров'я."),
                    ("Vi lagade en spenatsoppa.", "Ми приготували шпинатний суп."),
                    ("Hon gillar att äta spenat med ägg.", "Вона любить їсти шпинат з яйцями.")
                ]),
                Question(expression: "гарбуз", translation: "en pumpa", examples: [
                    ("Pumpa är en populär ingrediens i höst.", "Гарбуз — популярний інгредієнт восени."),
                    ("Jag ska laga en pumpasoppa.", "Я буду варити гарбузовий суп."),
                    ("Pumpor växer bra på hösten.", "Гарбузи добре ростуть восени."),
                    ("Han dekorerade huset med pumpor.", "Він прикрасив будинок гарбузами.")
                ]),
                Question(expression: "селер", translation: "en selleri", examples: [
                    ("Selleri är en nyttig grönsak.", "Селер — корисний овоч."),
                    ("Jag äter selleri med hummus.", "Я їм селеру з хумусом."),
                    ("Selleri växer snabbt i trädgården.", "Селер швидко росте в саду."),
                    ("Vi använder selleri i soppor.", "Ми використовуємо селеру в супах.")
                ]),
                Question(expression: "цвітна капуста", translation: "en blomkål", examples: [
                    ("Blomkål är en mångsidig grönsak.", "Цвітна капуста — універсальний овоч."),
                    ("Jag kokar blomkål till middagen.", "Я варю цвітну капусту на вечерю."),
                    ("Blomkål kan ersätta ris i rätter.", "Цвітна капуста може замінити рис у стравах."),
                    ("De serverade blomkål som tillbehör.", "Вони подали цвітну капусту як гарнір.")
                ]),
                Question(expression: "буряк", translation: "en rödbeta", examples: [
                    ("Rödbetor är bra för blodet.", "Буряки корисні для крові."),
                    ("Jag gillar att äta rödbetor i sallad.", "Мені подобається їсти буряк у салаті."),
                    ("Vi kokade rödbetor igår.", "Ми варили буряки вчора."),
                    ("Rödbetor växer bra på hösten.", "Буряки добре ростуть восени.")
                ]),
                Question(expression: "порей", translation: "en purjolök", examples: [
                    ("Purjolök används ofta i soppor.", "Порей часто використовують у супах."),
                    ("Jag köpte purjolök på marknaden.", "Я купив порей на ринку."),
                    ("Purjolök växer bra i kallt väder.", "Порей добре росте в холодну погоду."),
                    ("Hon hackade purjolök till grytan.", "Вона нарізала порей для рагу.")
                ]),
                Question(expression: "боби", translation: "en böna", examples: [
                    ("Bönor är rika på protein.", "Боби багаті на білок."),
                    ("Jag ska laga en bönsoppa.", "Я буду варити бобовий суп."),
                    ("Bönor kan ätas både kokta och råa.", "Боби можна їсти як вареними, так і сирими."),
                    ("De planterade bönor i trädgården.", "Вони посадили боби в саду.")
                ]),
                Question(expression: "кукурудза", translation: "en majs", examples: [
                    ("Vi grillade majs på stranden.", "Ми грильували кукурудзу на пляжі."),
                    ("Majs är populärt i Mexiko.", "Кукурудза популярна в Мексиці."),
                    ("Jag gillar att äta majs med smör.", "Мені подобається їсти кукурудзу з маслом."),
                    ("De odlar majs i stora fält.", "Вони вирощують кукурудзу на великих полях.")
                ]),
                Question(expression: "баклажан", translation: "en aubergine", examples: [
                    ("Aubergine kan användas i grytor.", "Баклажан можна використовувати в рагу."),
                    ("Jag stekte aubergine till middag.", "Я смажив баклажан на вечерю."),
                    ("Aubergine är en bra ingrediens i vegetarisk mat.", "Баклажан — гарний інгредієнт для вегетаріанської їжі."),
                    ("Vi odlar aubergine i växthuset.", "Ми вирощуємо баклажан в теплиці.")
                ]),
                Question(expression: "смородина", translation: "ett vinbär", examples: [
                    ("Vinbär är bra för immunförsvaret.", "Смородина корисна для імунної системи."),
                    ("Jag gör sylt av vinbär.", "Я роблю варення зі смородини."),
                    ("Vinbär växer bra i kalla klimat.", "Смородина добре росте в холодному кліматі."),
                    ("De samlade vinbär i trädgården.", "Вони збирали смородину в саду.")
                ]),
                Question(expression: "петрушка", translation: "en persilja", examples: [
                    ("Persilja används som krydda i många rätter.", "Петрушка використовується як приправа в багатьох стравах."),
                    ("Jag strödde persilja över soppan.", "Я посипав петрушку над супом."),
                    ("Persilja är bra för matsmältningen.", "Петрушка корисна для травлення."),
                    ("Vi planterade persilja i trädgården.", "Ми посадили петрушку в саду.")
                ]),
                Question(expression: "спаржа", translation: "en sparris", examples: [
                    ("Sparris är en delikat grönsak.", "Спаржа — делікатний овоч."),
                    ("Jag kokade sparris till middagen.", "Я варив спаржу на вечерю."),
                    ("Sparris är bra för hälsan.", "Спаржа корисна для здоров'я."),
                    ("De serverade sparris med hollandaise-sås.", "Вони подали спаржу з соусом голландез.")
                ])
            ],
        
            .fruits: [
                Question(expression: "банан", translation: "en banan", examples: [
                    ("Jag äter en banan varje dag.", "Я їм банан кожного дня."),
                    ("Banana är rik på kalium.", "Банан багатий на калій."),
                    ("Vi köpte bananer på affären.", "Ми купили банани в магазині."),
                    ("Han gillar att äta bananer med jordnötssmör.", "Він любить їсти банани з арахісовим маслом.")
                ]),
                Question(expression: "чорниця", translation: "ett blåbär", examples: [
                    ("Blåbär är bra för synen.", "Чорниця корисна для зору."),
                    ("Jag älskar att plocka blåbär i skogen.", "Мені подобається збирати чорниці в лісі."),
                    ("Blåbär växer på låga buskar.", "Чорниця росте на низьких кущах."),
                    ("Vi gjorde blåbärspaj.", "Ми зробили пиріг з чорницями.")
                ]),
                Question(expression: "апельсин", translation: "en apelsin", examples: [
                    ("Jag dricker apelsinjuice varje morgon.", "Я п'ю апельсиновий сік щоранку."),
                    ("Apelsiner är bra för immunförsvaret.", "Апельсини корисні для імунної системи."),
                    ("Vi åt apelsiner till frukost.", "Ми їли апельсини на сніданок."),
                    ("Han skalar en apelsin.", "Він чистить апельсин.")
                ]),
                Question(expression: "полуниця", translation: "en jordgubbe", examples: [
                    ("Jag älskar att äta jordgubbar med grädde.", "Я люблю їсти полуницю зі сметаною."),
                    ("Jordgubbar är min favoritfrukt.", "Полуниця — це мій улюблений фрукт."),
                    ("Vi plockade jordgubbar i trädgården.", "Ми збирали полуниці в саду."),
                    ("Han gör jordgubbssylt.", "Він робить варення з полуниць.")
                ]),
                Question(expression: "вишня", translation: "ett körsbär", examples: [
                    ("Körsbär växer på träden.", "Вишні ростуть на деревах."),
                    ("Jag gillar körsbär i bakverk.", "Мені подобаються вишні в випічці."),
                    ("Körsbär är söta och saftiga.", "Вишні солодкі та соковиті."),
                    ("Vi köpte färska körsbär på marknaden.", "Ми купили свіжі вишні на ринку.")
                ]),
                Question(expression: "лимон", translation: "en citron", examples: [
                    ("Citron är sur men nyttig.", "Лимон кислий, але корисний."),
                    ("Jag pressar citron i vattnet.", "Я вичавлюю лимон у воду."),
                    ("Citroner är bra för huden.", "Лимони корисні для шкіри."),
                    ("Vi använder citron i teet.", "Ми використовуємо лимон у чаї.")
                ]),
                Question(expression: "виноград", translation: "en druva", examples: [
                    ("Jag köper druvor varje vecka.", "Я купую виноград кожного тижня."),
                    ("Druvor är både söta och sura.", "Виноград одночасно солодкий і кислий."),
                    ("Vi åt druvor till efterrätt.", "Ми їли виноград на десерт."),
                    ("Druvor växer på vinrankor.", "Виноград росте на виноградниках.")
                ]),
                Question(expression: "персик", translation: "en persika", examples: [
                    ("Persikor är saftiga och söta.", "Персики соковиті та солодкі."),
                    ("Jag gillar att äta persikor på sommaren.", "Мені подобається їсти персики влітку."),
                    ("Vi plockade persikor i trädgården.", "Ми збирали персики в саду."),
                    ("Persikor kan användas i pajer.", "Персики можна використовувати в пирогах.")
                ]),
                Question(expression: "груша", translation: "ett päron", examples: [
                    ("Jag äter ett päron till mellanmål.", "Я їм грушу на перекус."),
                    ("Päron är en mjuk och söt frukt.", "Груша — м'який і солодкий плід."),
                    ("Vi köpte päron på torget.", "Ми купили груші на ринку."),
                    ("Päron växer på träd.", "Груші ростуть на деревах.")
                ]),
                Question(expression: "манго", translation: "en mango", examples: [
                    ("Mango är min favoritfrukt.", "Манго — мій улюблений фрукт."),
                    ("Jag älskar att äta mango med ris.", "Я люблю їсти манго з рисом."),
                    ("Mango är en tropisk frukt.", "Манго — це тропічний плід."),
                    ("Vi åt mango i en fruktsallad.", "Ми їли манго у фруктовому салаті.")
                ]),
                Question(expression: "малина", translation: "ett hallon", examples: [
                    ("Hallon är söta och saftiga.", "Малина солодка і соковита."),
                    ("Vi plockade hallon från buskarna.", "Ми збирали малину з кущів."),
                    ("Jag gillar hallon i smoothies.", "Мені подобається малина в смузі."),
                    ("Hallon växer i trädgården.", "Малина росте в саду.")
                ]),
                Question(expression: "ананас", translation: "en ananas", examples: [
                    ("Ananas är en tropisk frukt.", "Ананас — це тропічний плід."),
                    ("Jag älskar ananas på pizza.", "Мені подобається ананас на піці."),
                    ("Vi köpte en färsk ananas.", "Ми купили свіжий ананас."),
                    ("Ananas är söt och syrlig.", "Ананас солодкий і кислий.")
                ]),
                Question(expression: "гранат", translation: "ett granatäpple", examples: [
                    ("Granatäpple är fullt av små frön.", "Гранат повний маленьких зерняток."),
                    ("Jag gillar granatäpple i sallader.", "Мені подобається гранат у салатах."),
                    ("Granatäpple är bra för hälsan.", "Гранат корисний для здоров'я."),
                    ("Vi skalar ett granatäpple.", "Ми чистимо гранат.")
                ]),
                Question(expression: "слива", translation: "ett plommon", examples: [
                    ("Plommon är söta och saftiga.", "Сливи солодкі та соковиті."),
                    ("Jag äter plommon som mellanmål.", "Я їм сливи як перекус."),
                    ("Plommon växer på träd.", "Сливи ростуть на деревах."),
                    ("Vi plockade plommon i trädgården.", "Ми збирали сливи в саду.")
                ]),
                Question(expression: "ківі", translation: "en kiwi", examples: [
                    ("Kiwi är en liten och hårig frukt.", "Ківі — маленький і волохатий плід."),
                    ("Jag äter kiwi till frukost.", "Я їм ківі на сніданок."),
                    ("Kiwi innehåller mycket C-vitamin.", "Ківі містить багато вітаміну C."),
                    ("Vi skalar kivi och lägger den i fruktsalladen.", "Ми чистимо ківі і додаємо її до фруктового салату.")
                ]),
                Question(expression: "кавун", translation: "en vattenmelon", examples: [
                    ("Vattenmelon är väldigt saftig.", "Кавун дуже соковитий."),
                    ("Vi åt vattenmelon på stranden.", "Ми їли кавун на пляжі."),
                    ("Vattenmelon är populär på sommaren.", "Кавун популярний влітку."),
                    ("Han skär vattenmelon i bitar.", "Він ріже кавун на частини.")
                ]),
                Question(expression: "крижовник", translation: "ett krusbär", examples: [
                    ("Krusbär är små och sura.", "Крижовник маленький і кислий."),
                    ("Vi plockade krusbär i trädgården.", "Ми збирали крижовник в саду."),
                    ("Krusbär används i marmelader.", "Крижовник використовують у вареннях."),
                    ("Jag gillar att äta krusbär med socker.", "Мені подобається їсти крижовник з цукром.")
                ]),
                Question(expression: "грейпфрут", translation: "en grapefrukt", examples: [
                    ("Grapefrukt är syrlig och frisk.", "Грейпфрут кислий і свіжий."),
                    ("Jag dricker grapefruktjuice till frukost.", "Я п'ю грейпфрутовий сік на сніданок."),
                    ("Grapefrukt är bra för viktnedgång.", "Грейпфрут корисний для схуднення."),
                    ("Vi skalar en grapefrukt.", "Ми чистимо грейпфрут.")
                ]),
                Question(expression: "мандарин", translation: "en mandarin", examples: [
                    ("Mandariner är söta och små.", "Мандарини солодкі та маленькі."),
                    ("Jag äter en mandarin varje dag.", "Я їм мандарин кожного дня."),
                    ("Mandariner är populära på vintern.", "Мандарини популярні взимку."),
                    ("Vi delade mandariner med våra vänner.", "Ми поділилися мандаринами з нашими друзями.")
                ]),
                Question(expression: "канталоупа", translation: "en cantaloupe", examples: [
                    ("Cantaloupe är en sorts melon.", "Канталупа — це сорт дині."),
                    ("Jag äter cantaloupe på sommaren.", "Я їм канталупу влітку."),
                    ("Cantaloupe är söt och saftig.", "Канталупа солодка і соковита."),
                    ("Vi köpte cantaloupe på marknaden.", "Ми купили канталупу на ринку.")
                ]),
                Question(expression: "ягода", translation: "ett bär", examples: [
                    ("Bär är fulla av vitaminer.", "Ягоди багаті на вітаміни."),
                    ("Jag plockade bär i skogen.", "Я збирав ягоди в лісі."),
                    ("Bär är bra för hälsan.", "Ягоди корисні для здоров'я."),
                    ("Vi använde bär i pajen.", "Ми використовували ягоди в пирозі.")
                ]),
                Question(expression: "морошка", translation: "ett hjortron", examples: [
                    ("Hjortron växer i myrar.", "Морошка росте на болотах."),
                    ("Hjortron är en delikat bär.", "Морошка — це делікатна ягода."),
                    ("Jag älskar att plocka hjortron på sommaren.", "Мені подобається збирати морошку влітку."),
                    ("Vi gjorde hjortronmarmelad.", "Ми зробили варення з морошки.")
                ]),
            ],
            .time: [
                Question(expression: "сьогодні", translation: "idag", examples: [
                    ("Jag har ett möte idag.", "У мене сьогодні зустріч."),
                    ("Idag är det soligt.", "Сьогодні сонячно."),
                    ("Vi ska träffas idag.", "Ми зустрінемося сьогодні."),
                    ("Idag är en viktig dag.", "Сьогодні важливий день.")
                ]),
                Question(expression: "вчора", translation: "igår", examples: [
                    ("Jag såg honom igår.", "Я бачив його вчора."),
                    ("Igår var det kallt.", "Вчора було холодно."),
                    ("Vi pratade igår kväll.", "Ми говорили вчора ввечері."),
                    ("Igår hade vi en fest.", "Вчора у нас була вечірка.")
                ]),
                Question(expression: "завтра", translation: "imorgon", examples: [
                    ("Vi åker till Stockholm imorgon.", "Ми їдемо до Стокгольма завтра."),
                    ("Imorgon börjar skolan.", "Завтра починається школа."),
                    ("Jag har en tenta imorgon.", "У мене завтра іспит."),
                    ("Vi ses imorgon.", "Побачимося завтра.")
                ]),
                Question(expression: "післязавтра", translation: "i övermorgon", examples: [
                    ("Vi har en konferens i övermorgon.", "У нас конференція післязавтра."),
                    ("I övermorgon reser vi bort.", "Післязавтра ми вирушаємо в подорож."),
                    ("Mötet är i övermorgon.", "Зустріч післязавтра."),
                    ("Han kommer hem i övermorgon.", "Він повернеться додому післязавтра.")
                ]),
                Question(expression: "минулого тижня", translation: "förra veckan", examples: [
                    ("Jag var sjuk förra veckan.", "Я хворів минулого тижня."),
                    ("Förra veckan hade vi prov.", "Минулого тижня у нас був тест."),
                    ("Förra veckan var mycket stressig.", "Минулого тижня було багато стресу."),
                    ("Vi reste till Göteborg förra veckan.", "Ми їздили в Гетеборг минулого тижня.")
                ]),
                Question(expression: "наступного тижня", translation: "nästa vecka", examples: [
                    ("Vi börjar en ny kurs nästa vecka.", "Ми починаємо новий курс наступного тижня."),
                    ("Nästa vecka blir hektisk.", "Наступний тиждень буде насиченим."),
                    ("Jag ska resa bort nästa vecka.", "Я поїду у відрядження наступного тижня."),
                    ("Nästa vecka ska vi ha ett möte.", "Наступного тижня у нас буде зустріч.")
                ]),
                Question(expression: "цього тижня", translation: "den här veckan", examples: [
                    ("Den här veckan har varit stressig.", "Цей тиждень був стресовим."),
                    ("Jag har mycket att göra den här veckan.", "У мене багато справ цього тижня."),
                    ("Vi har ett prov den här veckan.", "У нас іспит цього тижня."),
                    ("Den här veckan är viktig för projektet.", "Цей тиждень важливий для проєкту.")
                ]),
                Question(expression: "минулого місяця", translation: "förra månaden", examples: [
                    ("Jag flyttade hit förra månaden.", "Я переїхав сюди минулого місяця."),
                    ("Förra månaden var kall.", "Минулого місяця було холодно."),
                    ("Han började sitt jobb förra månaden.", "Він почав працювати минулого місяця."),
                    ("Jag reste till Spanien förra månaden.", "Я їздив до Іспанії минулого місяця.")
                ]),
                Question(expression: "наступного місяця", translation: "nästa månad", examples: [
                    ("Nästa månad börjar kursen.", "Наступного місяця починається курс."),
                    ("Vi ska flytta nästa månad.", "Ми переїжджаємо наступного місяця."),
                    ("Jag får min lön nästa månad.", "Я отримаю зарплату наступного місяця."),
                    ("Nästa månad åker vi till fjällen.", "Наступного місяця ми їдемо в гори.")
                ]),
                Question(expression: "минулого року", translation: "förra året", examples: [
                    ("Jag besökte Sverige förra året.", "Я відвідав Швецію минулого року."),
                    ("Förra året var svårt.", "Минулого року було важко."),
                    ("Hon började studera förra året.", "Вона почала навчання минулого року."),
                    ("Förra året reste vi mycket.", "Минулого року ми багато подорожували.")
                ]),
                Question(expression: "наступного року", translation: "nästa år", examples: [
                    ("Jag ska ta examen nästa år.", "Я закінчу навчання наступного року."),
                    ("Nästa år planerar vi en resa.", "Наступного року ми плануємо подорож."),
                    ("Hon börjar sitt nya jobb nästa år.", "Вона починає нову роботу наступного року."),
                    ("Nästa år vill jag köpa en bil.", "Наступного року я хочу купити машину.")
                ]),
                Question(expression: "через годину", translation: "om en timme", examples: [
                    ("Jag kommer tillbaka om en timme.", "Я повернуся через годину."),
                    ("Mötet börjar om en timme.", "Зустріч починається через годину."),
                    ("Han ringer dig om en timme.", "Він зателефонує тобі через годину."),
                    ("Om en timme ska vi äta middag.", "Через годину ми будемо вечеряти.")
                ]),
                Question(expression: "дві години тому", translation: "för två timmar sedan", examples: [
                    ("Jag såg honom för två timmar sedan.", "Я бачив його дві години тому."),
                    ("Mötet slutade för två timmar sedan.", "Зустріч закінчилася дві години тому."),
                    ("För två timmar sedan var det soligt.", "Дві години тому було сонячно."),
                    ("Han kom hem för två timmar sedan.", "Він прийшов додому дві години тому.")
                ]),
                Question(expression: "недавно", translation: "nyligen", examples: [
                    ("Jag har nyligen börjat träna.", "Я нещодавно почав тренуватися."),
                    ("Hon flyttade nyligen hit.", "Вона нещодавно переїхала сюди."),
                    ("Nyligen hade vi en stor fest.", "Нещодавно у нас була велика вечірка."),
                    ("Jag såg den filmen nyligen.", "Я нещодавно бачив цей фільм.")
                ]),
                Question(expression: "скоро", translation: "snart", examples: [
                    ("Vi ses snart.", "Скоро побачимося."),
                    ("Snart börjar semestern.", "Скоро почнуться канікули."),
                    ("Hon kommer snart hem.", "Вона скоро прийде додому."),
                    ("Snart är det sommar.", "Скоро літо.")
                ]),
                Question(expression: "вранці", translation: "på morgonen", examples: [
                    ("Jag tränade på morgonen.", "Я тренувався вранці."),
                    ("På morgonen dricker jag kaffe.", "Вранці я п'ю каву."),
                    ("Vi ska träffas på morgonen.", "Ми зустрінемося вранці."),
                    ("Det var kallt på morgonen.", "Вранці було холодно.")
                ]),
                Question(expression: "вночі", translation: "på natten", examples: [
                    ("Jag jobbar på natten.", "Я працюю вночі."),
                    ("Det var väldigt tyst på natten.", "Вночі було дуже тихо."),
                    ("Vi såg filmen på natten.", "Ми дивилися фільм вночі."),
                    ("Han sover på natten.", "Він спить вночі.")
                ]),
                Question(expression: "сьогодні ввечері", translation: "ikväll", examples: [
                    ("Vi ska gå på bio ikväll.", "Ми підемо в кіно сьогодні ввечері."),
                    ("Ikväll ska vi laga middag tillsammans.", "Сьогодні ввечері ми будемо готувати вечерю разом."),
                    ("Vad gör du ikväll?", "Що ти робиш сьогодні ввечері?"),
                    ("Ikväll ska vi ha en fest.", "Сьогодні ввечері у нас буде вечірка.")
                ]),
                Question(expression: "вчора ввечері", translation: "i går kväll", examples: [
                    ("I går kväll såg jag en bra film.", "Вчора ввечері я подивився хороший фільм."),
                    ("Vi träffades i går kväll.", "Ми зустрілися вчора ввечері."),
                    ("I går kväll var vi ute på restaurang.", "Вчора ввечері ми були в ресторані."),
                    ("I går kväll var det kallt.", "Вчора ввечері було холодно.")
                ]),
                Question(expression: "завтра ввечері", translation: "i morgon kväll", examples: [
                    ("I morgon kväll ska vi gå på konsert.", "Завтра ввечері ми підемо на концерт."),
                    ("Vi ses i morgon kväll.", "Побачимося завтра ввечері."),
                    ("Jag har inga planer i morgon kväll.", "У мене немає планів на завтра ввечері."),
                    ("I morgon kväll kommer han hem.", "Завтра ввечері він повернеться додому.")
                ]),
                Question(expression: "після обіду", translation: "på eftermiddagen", examples: [
                    ("Jag ska träna på eftermiddagen.", "Я буду тренуватися після обіду."),
                    ("På eftermiddagen jobbar jag.", "Я працюю після обіду."),
                    ("Vi träffas på eftermiddagen.", "Ми зустрінемося після обіду."),
                    ("Det var väldigt varmt på eftermiddagen.", "Після обіду було дуже тепло.")
                ]),
                Question(expression: "після вечері", translation: "efter middagen", examples: [
                    ("Vi ska ta en promenad efter middagen.", "Ми підемо на прогулянку після вечері."),
                    ("Jag brukar läsa efter middagen.", "Я зазвичай читаю після вечері."),
                    ("Efter middagen ska vi titta på TV.", "Після вечері ми будемо дивитися телевізор."),
                    ("Vi ska spela kort efter middagen.", "Ми будемо грати в карти після вечері.")
                ]),
                Question(expression: "у неділю", translation: "på söndag", examples: [
                    ("Vi ska åka till landet på söndag.", "Ми поїдемо на дачу в неділю."),
                    ("På söndag är det soligt.", "В неділю буде сонячно."),
                    ("Vi ses på söndag.", "Побачимося в неділю."),
                    ("På söndag har vi en match.", "В неділю у нас матч.")
                ]),
                Question(expression: "у понеділок", translation: "på måndag", examples: [
                    ("På måndag börjar skolan.", "У понеділок починається школа."),
                    ("Jag ska på möte på måndag.", "Я йду на зустріч в понеділок."),
                    ("Vi ses på måndag.", "Побачимося в понеділок."),
                    ("På måndag ska vi träna.", "У понеділок ми будемо тренуватися.")
                ]),
                Question(expression: "через хвилину", translation: "om en minut", examples: [
                    ("Jag kommer om en minut.", "Я прийду через хвилину."),
                    ("Om en minut ska vi gå.", "Через хвилину ми підемо."),
                    ("Det kommer om en minut.", "Він прийде через хвилину."),
                    ("Om en minut börjar filmen.", "Через хвилину почнеться фільм.")
                ]),
                Question(expression: "через день", translation: "om en dag", examples: [
                    ("Jag ska träffa honom om en dag.", "Я зустріну його через день."),
                    ("Vi ska resa om en dag.", "Ми поїдемо через день."),
                    ("Om en dag kommer vi att ha en fest.", "Через день у нас буде вечірка."),
                    ("Jag ska börja jobba om en dag.", "Я почну працювати через день.")
                ]),
                Question(expression: "через тиждень", translation: "om en vecka", examples: [
                    ("Vi åker till Paris om en vecka.", "Ми поїдемо до Парижа через тиждень."),
                    ("Om en vecka börjar min semester.", "Через тиждень почнеться моя відпустка."),
                    ("Vi ska ses om en vecka.", "Ми побачимося через тиждень."),
                    ("Om en vecka ska vi ha ett möte.", "Через тиждень у нас буде зустріч.")
                ]),
                Question(expression: "через місяць", translation: "om en månad", examples: [
                    ("Jag kommer om en månad.", "Я приїду через місяць."),
                    ("Vi ska åka till Spanien om en månad.", "Ми поїдемо до Іспанії через місяць."),
                    ("Om en månad har jag examen.", "Через місяць у мене буде випускний."),
                    ("Jag har semester om en månad.", "У мене буде відпустка через місяць.")
                ]),
                Question(expression: "через рік", translation: "om ett år", examples: [
                    ("Vi ska köpa hus om ett år.", "Ми купимо будинок через рік."),
                    ("Om ett år kommer vi att vara i Australien.", "Через рік ми будемо в Австралії."),
                    ("Jag ska ta körkort om ett år.", "Я отримаю водійське посвідчення через рік."),
                    ("Om ett år kommer vi att vara färdiga.", "Через рік ми закінчимо.")
                ])
            ],
        
        
        
            .shoppingNouns: [
                Question(expression: "магазин", translation: "en butik", examples: [
                    ("Vi gick till butiken för att köpa kläder.", "Ми пішли в магазин купити одяг."),
                    ("Butiken är öppen från 9 till 18.", "Магазин відкритий з 9 до 18."),
                    ("Jag köpte en bok i butiken.", "Я купив книгу в магазині."),
                    ("Det finns många butiker i staden.", "В місті багато магазинів.")
                ]),
                Question(expression: "товар", translation: "en vara", examples: [
                    ("Det här varan är mycket billig.", "Цей товар дуже дешевий."),
                    ("Han köpte en vara på rea.", "Він купив товар на розпродажі."),
                    ("Vi har många olika varor i affären.", "У нас є багато різних товарів у магазині."),
                    ("Det är en kvalitetsvara.", "Це товар високої якості.")
                ]),
                Question(expression: "ціна", translation: "ett pris", examples: [
                    ("Priset på den här jackan är högt.", "Ціна на цю куртку висока."),
                    ("Vi måste kolla priset först.", "Ми спочатку повинні перевірити ціну."),
                    ("Priserna har ökat den senaste tiden.", "Ціни зросли останнім часом."),
                    ("Jag letar efter ett bra pris.", "Я шукаю гарну ціну.")
                ]),
                Question(expression: "каса", translation: "en kassa", examples: [
                    ("Vi står i kassan och betalar.", "Ми стоїмо на касі і платимо."),
                    ("Kassan var full av kunder.", "Каса була переповнена покупцями."),
                    ("Jag behöver gå till kassan.", "Мені потрібно йти на касу."),
                    ("Det finns många kassor i den stora affären.", "Великі магазини мають багато кас.")
                ]),
                Question(expression: "купівля", translation: "ett köp", examples: [
                    ("Jag gjorde en stor köp idag.", "Я зробив велику покупку сьогодні."),
                    ("Det var ett bra köp.", "Це була хороша покупка."),
                    ("Vi planerar att göra flera köp under helgen.", "Ми плануємо зробити кілька покупок на вихідних."),
                    ("Köpet var mycket snabbt och enkelt.", "Покупка була дуже швидкою та простою.")
                ]),
                Question(expression: "замовлення", translation: "en beställning", examples: [
                    ("Jag gjorde en beställning online.", "Я зробив замовлення онлайн."),
                    ("Beställningen levererades igår.", "Замовлення було доставлено вчора."),
                    ("Vi väntar på beställningen.", "Ми чекаємо на замовлення."),
                    ("Du kan göra din beställning här.", "Ти можеш зробити своє замовлення тут.")
                ]),
                Question(expression: "скидка", translation: "en rabatt", examples: [
                    ("Vi fick en rabatt på 20%.", "Ми отримали знижку 20%."),
                    ("Rabatten gäller bara idag.", "Знижка діє тільки сьогодні."),
                    ("De har stora rabatter på vinterkläder.", "У них великі знижки на зимовий одяг."),
                    ("Rabatten var en bra anledning att köpa.", "Знижка була гарною причиною для покупки.")
                ]),
                Question(expression: "чеки", translation: "ett kvitto", examples: [
                    ("Kom ihåg att ta med kvittot.", "Не забудь взяти чек."),
                    ("Jag har tappat mitt kvitto.", "Я втратив свій чек."),
                    ("Kan du ge mig ett kvitto på detta köp?", "Чи можеш дати мені чек на цю покупку?"),
                    ("Det står på kvittot att vi kan byta varan.", "На чеку написано, що ми можемо обміняти товар.")
                ]),
                Question(expression: "покупець", translation: "en kund", examples: [
                    ("Kunden klagar på varans kvalitet.", "Клієнт скаржиться на якість товару."),
                    ("Vi har många kunder i butiken idag.", "У нас багато клієнтів у магазині сьогодні."),
                    ("Kunden ville ha en bättre rabatt.", "Клієнт хотів кращу знижку."),
                    ("Han är en vanlig kund här.", "Він звичайний клієнт тут.")
                ]),
                Question(expression: "продавець", translation: "en försäljare", examples: [
                    ("Försäljaren hjälpte mig att hitta det jag behövde.", "Продавець допоміг мені знайти те, що мені потрібно."),
                    ("Jag pratade med försäljaren om rabatten.", "Я поговорив з продавцем про знижку."),
                    ("Försäljaren var mycket vänlig.", "Продавець був дуже привітний."),
                    ("Försäljaren gav oss bra råd.", "Продавець дав нам хорошу пораду.")
                ]),
                Question(expression: "кошик", translation: "en korg", examples: [
                    ("Jag lade allt i korgen.", "Я поклав все в кошик."),
                    ("Korgen var full av varor.", "Кошик був повний товарів."),
                    ("Vi behöver en större korg.", "Нам потрібна більша кошик."),
                    ("Korgen var på väg att spruta ut.", "Кошик був на межі того, щоб розсипатися.")
                ]),
                Question(expression: "пакет", translation: "en påse", examples: [
                    ("Jag köpte en påse bröd.", "Я купив пакет хліба."),
                    ("Kan du ge mig en påse?", "Можеш дати мені пакет?"),
                    ("Påsen var tung.", "Пакет був важким."),
                    ("Han lade varorna i påsen.", "Він поклав товари в пакет.")
                ]),
                Question(expression: "товари", translation: "produkter", examples: [
                    ("De säljer många olika produkter.", "Вони продають багато різних товарів."),
                    ("Produkter för hudvård finns här.", "Продукти для догляду за шкірою є тут."),
                    ("Vi letar efter nya produkter.", "Ми шукаємо нові продукти."),
                    ("Produkter för barn är populära.", "Продукти для дітей популярні.")
                ]),
                Question(expression: "розпродаж", translation: "en rea", examples: [
                    ("Det är rea på vinterjackor.", "На зимові куртки знижки."),
                    ("Rean börjar nästa vecka.", "Розпродаж починається наступного тижня."),
                    ("Vi köpte mycket under rean.", "Ми купили багато під час розпродажу."),
                    ("Rean är bara för medlemmar.", "Розпродаж лише для учасників.")
                ]),
                Question(expression: "спеціальна пропозиція", translation: "ett specialerbjudande", examples: [
                    ("Vi har ett specialerbjudande på kaffe.", "У нас є спеціальна пропозиція на каву."),
                    ("Specialerbjudandet gäller bara idag.", "Спеціальна пропозиція діє тільки сьогодні."),
                    ("Det är ett bra specialerbjudande.", "Це гарна спеціальна пропозиція."),
                    ("Jag köpte en dator på specialerbjudande.", "Я купив комп'ютер по спеціальній пропозиції.")
                ]),
                Question(expression: "товарний чек", translation: "en faktura", examples: [
                    ("Jag betalade med faktura.", "Я заплатив по фактурі."),
                    ("Fakturan måste betalas inom 30 dagar.", "Фактура повинна бути оплачена протягом 30 днів."),
                    ("Han skickade fakturan via e-post.", "Він надіслав фактуру через електронну пошту."),
                    ("Jag väntar på fakturan.", "Я чекаю на фактуру.")
                ]),
                Question(expression: "система лояльності", translation: "ett lojalitetssystem", examples: [
                    ("Vi har ett lojalitetssystem för våra kunder.", "У нас є система лояльності для наших клієнтів."),
                    ("Du kan tjäna poäng i vårt lojalitetssystem.", "Ви можете заробляти бали в нашій системі лояльності."),
                    ("Loyalitetssystemet ger dig rabatter.", "Система лояльності дає вам знижки."),
                    ("Jag använde mina poäng i lojalitetssystemet.", "Я використав свої бали в системі лояльності.")
                ]),
                Question(expression: "оплата", translation: "en betalning", examples: [
                    ("Betalningen är genomförd.", "Платіж завершено."),
                    ("Jag gjorde en betalning online.", "Я зробив платіж онлайн."),
                    ("Betalning kan göras med kort eller kontanter.", "Платіж можна здійснити карткою або готівкою."),
                    ("Du kan göra betalningen här.", "Ти можеш здійснити платіж тут.")
                ]),
                Question(expression: "підтвердження", translation: "en bekräftelse", examples: [
                    ("Jag har fått bekräftelse på min beställning.", "Я отримав підтвердження на моє замовлення."),
                    ("Bekräftelsen kom via e-post.", "Підтвердження надійшло електронною поштою."),
                    ("Jag väntar på bekräftelse från dem.", "Я чекаю підтвердження від них."),
                    ("Bekräftelsen visade att vi har betalats.", "Підтвердження показало, що ми сплатили.")
                ]),
                Question(expression: "магазин одягу", translation: "en klädbutik", examples: [
                    ("Vi besökte klädbutiken för att köpa nya kläder.", "Ми відвідали магазин одягу, щоб купити новий одяг."),
                    ("Klädbutiken hade mycket fina kläder.", "Магазин одягу мав дуже гарний одяг."),
                    ("Det är en stor klädbutik i köpcentret.", "В торговому центрі є великий магазин одягу."),
                    ("Jag köpte en tröja i klädbutiken.", "Я купив светр в магазині одягу.")
                ]),
                Question(expression: "чек-лист", translation: "en inköpslista", examples: [
                    ("Jag skrev en inköpslista innan vi gick till butiken.", "Я написав список покупок перед тим, як ми пішли до магазину."),
                    ("Inköpslistan innehöll alla nödvändiga varor.", "Список покупок містив всі необхідні товари."),
                    ("Glöm inte att ta med inköpslistan.", "Не забудь взяти список покупок."),
                    ("Vi följde inköpslistan noggrant.", "Ми уважно слідували списку покупок.")
                ]),
                Question(expression: "пакет товарів", translation: "ett varupaket", examples: [
                    ("Vi köpte ett varupaket med olika produkter.", "Ми купили пакет товарів з різними продуктами."),
                    ("Det finns många varupaket att välja mellan.", "Є багато варіантів пакетів товарів."),
                    ("Varupaketet levererades till vårt hem.", "Пакет товарів був доставлений до нашого дому."),
                    ("De erbjuder ett varupaket med bra rabatter.", "Вони пропонують пакет товарів із гарними знижками.")
                ]),
                Question(expression: "подарункова картка", translation: "ett presentkort", examples: [
                    ("Jag gav henne ett presentkort på 500 kronor.", "Я дав їй подарункову картку на 500 крон."),
                    ("Presentkortet kan användas i alla butiker.", "Подарункову картку можна використовувати в усіх магазинах."),
                    ("De sålde presentkort på nätet.", "Вони продавали подарункові картки онлайн."),
                    ("Jag har ett presentkort som jag ska använda.", "У мене є подарункова картка, яку я хочу використати.")
                ]),
                Question(expression: "сертифікат", translation: "ett certifikat", examples: [
                    ("Vi fick ett certifikat som bevis på vårt köp.", "Ми отримали сертифікат як доказ нашої покупки."),
                    ("Certifikatet gav oss rätt till en gratis vara.", "Сертифікат давав нам право на безкоштовний товар."),
                    ("Han visade certifikatet för att få rabatten.", "Він показав сертифікат, щоб отримати знижку."),
                    ("Det är ett certifikat för produkter av hög kvalitet.", "Це сертифікат для продуктів високої якості.")
                ]),
                Question(expression: "ціль покупок", translation: "ett köpmål", examples: [
                    ("Mitt köpmål är att köpa en ny bil.", "Моя мета покупок — купити новий автомобіль."),
                    ("Vi har olika köpmål beroende på veckan.", "Ми маємо різні цілі покупок в залежності від тижня."),
                    ("Köpmålet var att hitta en billig TV.", "Ціллю покупки було знайти дешевий телевізор."),
                    ("Deras köpmål var att köpa elektronik.", "Їхня мета покупок була купити електроніку.")
                ]),
                Question(expression: "магазин електроніки", translation: "en elektronikbutik", examples: [
                    ("Jag gick till elektronikbutiken för att köpa en telefon.", "Я пішов до магазину електроніки купити телефон."),
                    ("Elektronikbutiken hade de senaste modellerna.", "Магазин електроніки мав останні моделі."),
                    ("Vi har många elektronikbutiker i området.", "У нас є багато магазинів електроніки в цьому районі."),
                    ("Elektronikbutiken erbjuder fri frakt.", "Магазин електроніки пропонує безкоштовну доставку.")
                ]),
                Question(expression: "рекламний буклет", translation: "en reklambroschyr", examples: [
                    ("Jag såg erbjudandet i en reklambroschyr.", "Я побачив пропозицію в рекламній брошурі."),
                    ("Reklambroschyren gav oss information om de bästa erbjudandena.", "Рекламна брошура надала нам інформацію про найкращі пропозиції."),
                    ("De skickade en reklambroschyr till oss.", "Вони надіслали нам рекламну брошуру."),
                    ("Reklambroschyren var full av rabatter.", "Рекламна брошура була повна знижок.")
                ]),
                Question(expression: "розпаковка", translation: "en uppackning", examples: [
                    ("Vi gjorde en uppackning av våra nya möbler.", "Ми робили розпакування наших нових меблів."),
                    ("Uppackningen av produkterna var snabb och enkel.", "Розпакування товарів було швидким і простим."),
                    ("De filmade uppackningen av telefonen.", "Вони зняли розпакування телефону."),
                    ("Jag gillar att se uppackningar på YouTube.", "Мені подобається дивитись розпакування на YouTube.")
                ]),
                Question(expression: "касова стрічка", translation: "ett kassaband", examples: [
                    ("Jag fick mitt kvitto på kassabandet.", "Я отримав чек на касовій стрічці."),
                    ("Kassabandet rullade ut kvittot.", "Касова стрічка вивела чек."),
                    ("Han släppte kassabandet och betalade.", "Він зняв товар з касової стрічки і оплатив."),
                    ("Kassabandet var full av produkter.", "Касова стрічка була переповнена товарами.")
                ]),
                Question(expression: "підтримка клієнтів", translation: "en kundsupport", examples: [
                    ("Jag kontaktade kundsupporten för att få hjälp.", "Я звернувся до підтримки клієнтів за допомогою."),
                    ("Kundsupporten var mycket hjälpsam.", "Підтримка клієнтів була дуже корисною."),
                    ("Vi har en 24-timmars kundsupport.", "У нас є підтримка клієнтів 24 години на добу."),
                    ("Jag pratade med kundsupport om min beställning.", "Я поговорив з підтримкою клієнтів щодо мого замовлення.")
                ])
            ],
        
            .home: [
                Question(expression: "будинок", translation: "ett hus", examples: [
                    ("Vi bor i ett stort hus.", "Ми живемо в великому будинку."),
                    ("Huset är gammalt men fint.", "Будинок старий, але гарний."),
                    ("De bygger ett hus på landet.", "Вони будують будинок за містом."),
                    ("Jag älskar mitt hus.", "Я люблю свій будинок.")
                ]),
                Question(expression: "кімната", translation: "ett rum", examples: [
                    ("Jag har ett eget rum.", "У мене є власна кімната."),
                    ("Vi ska måla om rummet.", "Ми будемо фарбувати кімнату."),
                    ("Det finns fyra rum i huset.", "В будинку є чотири кімнати."),
                    ("Rummet är väldigt ljust.", "Кімната дуже світла.")
                ]),
                Question(expression: "ліжко", translation: "en säng", examples: [
                    ("Jag sover i en stor säng.", "Я сплю в великому ліжку."),
                    ("Sängen är väldigt bekväm.", "Ліжко дуже зручне."),
                    ("Vi köpte en ny säng.", "Ми купили нове ліжко."),
                    ("Han låg i sängen hela dagen.", "Він лежав у ліжку весь день.")
                ]),
                Question(expression: "кухня", translation: "ett kök", examples: [
                    ("Jag lagar mat i köket.", "Я готую їжу на кухні."),
                    ("Köket är modernt och stort.", "Кухня сучасна та велика."),
                    ("Vi ska renovera köket.", "Ми будемо ремонтувати кухню."),
                    ("Det finns en stor kyl i köket.", "На кухні є великий холодильник.")
                ]),
                Question(expression: "ванна кімната", translation: "ett badrum", examples: [
                    ("Badrummet är väldigt rent.", "Ванна кімната дуже чиста."),
                    ("Vi ska installera ett nytt badkar i badrummet.", "Ми будемо встановлювати нову ванну у ванній кімнаті."),
                    ("Det finns två badrum i huset.", "У будинку є дві ванні кімнати."),
                    ("Jag spenderar mycket tid i badrummet.", "Я проводжу багато часу у ванній кімнаті.")
                ]),
                Question(expression: "коридор", translation: "en korridor", examples: [
                    ("Vi går genom korridoren.", "Ми йдемо через коридор."),
                    ("Korridoren är lång och smal.", "Коридор довгий і вузький."),
                    ("Det finns dörrar i båda ändarna av korridoren.", "В коридорі є двері з обох кінців."),
                    ("Han sprang nerför korridoren.", "Він побіг по коридору.")
                ]),
                Question(expression: "двері", translation: "en dörr", examples: [
                    ("Stäng dörren.", "Закрий двері."),
                    ("Dörren är gjord av trä.", "Двері зроблені з дерева."),
                    ("Jag glömde att låsa dörren.", "Я забув замкнути двері."),
                    ("Det är en röd dörr.", "Це червоні двері.")
                ]),
                Question(expression: "вікно", translation: "ett fönster", examples: [
                    ("Fönstret är öppet.", "Вікно відкрите."),
                    ("Vi har stora fönster i vardagsrummet.", "У нас є великі вікна у вітальні."),
                    ("Jag stängde fönstret.", "Я закрив вікно."),
                    ("Det kommer mycket ljus genom fönstret.", "Через вікно проникає багато світла.")
                ]),
                Question(expression: "стіл", translation: "ett bord", examples: [
                    ("Jag satte boken på bordet.", "Я поклав книгу на стіл."),
                    ("Bordet är runda.", "Стіл круглий."),
                    ("Vi har ett stort matbord.", "У нас є великий обідній стіл."),
                    ("Han drog bort bordet från väggen.", "Він відсунув стіл від стіни.")
                ]),
                Question(expression: "стілець", translation: "en stol", examples: [
                    ("Jag sitter på en stol.", "Я сижу на стільці."),
                    ("Det finns fem stolar vid bordet.", "За столом п’ять стільців."),
                    ("Stolen är väldigt bekväm.", "Цей стілець дуже зручний."),
                    ("Han satt på en gammal stol.", "Він сидів на старому стільці.")
                ]),
                Question(expression: "телевізор", translation: "en tv", examples: [
                    ("Jag tittar på tv varje kväll.", "Я дивлюсь телевізор кожного вечора."),
                    ("Vi har en ny tv i vardagsrummet.", "У нас є новий телевізор у вітальні."),
                    ("Tv:n är trasig.", "Телевізор зламався."),
                    ("Kan du stänga av tv:n?", "Можеш вимкнути телевізор?")
                ]),
                Question(expression: "холодильник", translation: "ett kylskåp", examples: [
                    ("Det finns mycket mat i kylskåpet.", "У холодильнику багато їжі."),
                    ("Kylskåpet är ganska gammalt.", "Холодильник досить старий."),
                    ("Jag lade mjölken i kylskåpet.", "Я поклав молоко в холодильник."),
                    ("Kylskåpet är fullt av grönsaker.", "Холодильник заповнений овочами.")
                ]),
                Question(expression: "пральна машина", translation: "en tvättmaskin", examples: [
                    ("Jag tvättade kläderna i tvättmaskinen.", "Я прав одяг у пральній машині."),
                    ("Tvättmaskinen är i källaren.", "Пральна машина в підвалі."),
                    ("Den gamla tvättmaskinen gick sönder.", "Стара пральна машина зламалася."),
                    ("Vi ska köpa en ny tvättmaskin.", "Ми будемо купувати нову пральну машину.")
                ]),
                Question(expression: "посудомийна машина", translation: "en diskmaskin", examples: [
                    ("Jag satte tallrikarna i diskmaskinen.", "Я поставив тарілки в посудомийну машину."),
                    ("Diskmaskinen fungerar bra.", "Посудомийна машина працює добре."),
                    ("Vi har ingen diskmaskin hemma.", "У нас немає посудомийної машини вдома."),
                    ("Kan du stänga diskmaskinen?", "Можеш закрити посудомийну машину?")
                ]),
                Question(expression: "ковдра", translation: "ett täcke", examples: [
                    ("Jag sov under ett mjukt täcke.", "Я спав під м'якою ковдрою."),
                    ("Täcket är väldigt varmt.", "Ковдра дуже тепла."),
                    ("Vi köpte nya täcken.", "Ми купили нові ковдри."),
                    ("Det är ett stort täcke på sängen.", "На ліжку велика ковдра.")
                ]),
                Question(expression: "подушка", translation: "en kudde", examples: [
                    ("Jag sover på en mjuk kudde.", "Я сплю на м'якій подушці."),
                    ("Kudden är väldigt bekväm.", "Подушка дуже зручна."),
                    ("Han har en röd kudde på sin säng.", "У нього є червона подушка на ліжку."),
                    ("Vi bytte ut alla kuddar.", "Ми поміняли всі подушки.")
                ]),
                Question(expression: "підлога", translation: "ett golv", examples: [
                    ("Golvet är gjort av trä.", "Підлога з дерева."),
                    ("Vi rengjorde golvet i hela huset.", "Ми прибирали підлогу в усьому будинку."),
                    ("Det finns ett fint mattor på golvet.", "На підлозі лежать гарні килими."),
                    ("Golvet är ganska halt.", "Підлога досить слизька.")
                ]),
                Question(expression: "стіна", translation: "en vägg", examples: [
                    ("Jag målade väggarna i blått.", "Я пофарбував стіни в синій колір."),
                    ("Väggarna var täckta med bilder.", "Стіни були покриті картинами."),
                    ("De hängde en tavla på väggen.", "Вони повісили картину на стіну."),
                    ("Det finns en stor spegel på väggen.", "На стіні велике дзеркало.")
                ]),
                Question(expression: "камін", translation: "en öppen spis", examples: [
                    ("Vi har en öppen spis i vardagsrummet.", "У нас є камін у вітальні."),
                    ("Han tände elden i kaminen.", "Він запалив вогонь у каміні."),
                    ("Kaminen ger mycket värme.", "Камін дає багато тепла."),
                    ("Det var mysigt att sitta vid kaminen.", "Було затишно сидіти біля каміна.")
                ]),
                Question(expression: "світло", translation: "ett ljus", examples: [
                    ("Det är mycket ljus i rummet.", "У кімнаті дуже світло."),
                    ("Ljusen är tända.", "Свічки запалені."),
                    ("Jag släckte ljuset innan jag gick ut.", "Я вимкнув світло перед тим, як вийти."),
                    ("Det är inte tillräckligt ljus här.", "Тут недостатньо світла.")
                ]),
                Question(expression: "камінь", translation: "en sten", examples: [
                    ("Väggen är byggd av sten.", "Стіна побудована з каменю."),
                    ("Han plockade upp en sten.", "Він підібрав камінь."),
                    ("Stenarna var kalla.", "Камені були холодні."),
                    ("Det finns stora stenar i trädgården.", "У саду є великі камені.")
                ]),
                Question(expression: "картинка", translation: "en bild", examples: [
                    ("Jag satte upp en bild på väggen.", "Я повісив картину на стіну."),
                    ("Den här bilden är från min barndom.", "Це фото з мого дитинства."),
                    ("Vi köpte en ny bild till vardagsrummet.", "Ми купили нову картину до вітальні."),
                    ("Bilden är vacker.", "Картинка красива.")
                ]),
                Question(expression: "вішалка", translation: "en klädhängare", examples: [
                    ("Jag hängde upp min jacka på klädhängaren.", "Я повісив свою куртку на вішалку."),
                    ("Det finns en klädhängare vid dörren.", "Є вішалка біля дверей."),
                    ("Klädhängaren är full.", "Вішалка заповнена."),
                    ("Vi köpte en ny klädhängare.", "Ми купили нову вішалку.")
                ]),
                Question(expression: "завіса", translation: "en gardin", examples: [
                    ("Jag drar för gardinerna på kvällen.", "Я закриваю штори ввечері."),
                    ("Gardinerna är blå.", "Штори сині."),
                    ("Vi bytte ut gardinerna i sovrummet.", "Ми змінили штори в спальні."),
                    ("De låter ljuset komma genom gardinerna.", "Вони дозволяють світлу проникати через штори.")
                ]),
                Question(expression: "ковер", translation: "en matta", examples: [
                    ("Jag rullade ut mattan på golvet.", "Я розклав килим на підлозі."),
                    ("Mattan är väldigt mjuk.", "Килим дуже м'який."),
                    ("Vi har en stor matta i vardagsrummet.", "У нас є великий килим у вітальні."),
                    ("Mattan är helt ny.", "Килим зовсім новий.")
                ]),
                Question(expression: "підвіконня", translation: "en fönsterbräda", examples: [
                    ("Blommorna står på fönsterbrädan.", "Квіти стоять на підвіконні."),
                    ("Jag satte vaserna på fönsterbrädan.", "Я поставив вази на підвіконня."),
                    ("Det är dammigt på fönsterbrädan.", "На підвіконні пил."),
                    ("Fönsterbrädan är full av saker.", "Підвіконня заповнене речами.")
                ]),
                Question(expression: "лестниця", translation: "en trappa", examples: [
                    ("Vi gick uppför trappan.", "Ми піднялися по сходах."),
                    ("Trappan är väldigt brant.", "Сходи дуже круті."),
                    ("De har en lång trappa i sitt hus.", "У них довгі сходи в будинку."),
                    ("Jag snubblade på trappan.", "Я спіткнувся на сходах.")
                ]),
                Question(expression: "підвал", translation: "en källare", examples: [
                    ("Vi har en källare där vi förvarar verktyg.", "У нас є підвал, де ми зберігаємо інструменти."),
                    ("Källaren är ganska kall.", "Підвал досить холодний."),
                    ("Det finns många kartonger i källaren.", "У підвалі багато коробок."),
                    ("Jag hörde ljud från källaren.", "Я чув звуки з підвалу.")
                ]),
                Question(expression: "горище", translation: "en vind", examples: [
                    ("Jag letade på vinden efter gamla böcker.", "Я шукав на горищі старі книги."),
                    ("Vinden är fylld med gamla möbler.", "Горище заповнене старими меблями."),
                    ("Det är mycket varmt på vinden.", "На горищі дуже жарко."),
                    ("De förvarade sina julprydnader på vinden.", "Вони зберігали різдвяні прикраси на горищі.")
                ]),
                Question(expression: "освітлення", translation: "en belysning", examples: [
                    ("Belysningen i rummet är svag.", "Освітлення в кімнаті слабке."),
                    ("Jag ändrade belysningen i hallen.", "Я змінив освітлення в коридорі."),
                    ("Den nya belysningen är mycket bättre.", "Нове освітлення набагато краще."),
                    ("Belysningen gör rummet mer intimt.", "Освітлення робить кімнату більш затишною.")
                ])
            ],
        
            .family: [
                Question(expression: "мати", translation: "en mamma", examples: [
                    ("Min mamma är läkare.", "Моя мама - лікар."),
                    ("Hon är en fantastisk mamma.", "Вона чудова мама."),
                    ("Mamma lagade middag.", "Мама приготувала вечерю."),
                    ("Jag älskar min mamma.", "Я люблю свою маму.")
                ]),
                Question(expression: "батько", translation: "en far", examples: [
                    ("Min pappa arbetar på kontor.", "Мій тато працює в офісі."),
                    ("Han är min bästa vän.", "Він мій найкращий друг."),
                    ("Pappa spelar fotboll.", "Тато грає у футбол."),
                    ("Jag vill vara som min pappa.", "Я хочу бути, як мій тато.")
                ]),
                Question(expression: "сестра", translation: "en syster", examples: [
                    ("Min syster är två år äldre än jag.", "Моя сестра на два роки старша за мене."),
                    ("Vi gick tillsammans till skolan.", "Ми разом пішли до школи."),
                    ("Systern min har en hund.", "Моя сестра має собаку."),
                    ("Jag pratar mycket med min syster.", "Я багато говорю зі своєю сестрою.")
                ]),
                Question(expression: "брат", translation: "en bror", examples: [
                    ("Min bror älskar att spela gitarr.", "Мій брат любить грати на гітарі."),
                    ("Han hjälper mig alltid.", "Він завжди мені допомагає."),
                    ("Vi bor tillsammans med min bror.", "Ми живемо разом з моїм братом."),
                    ("Min bror studerar på universitetet.", "Мій брат навчається в університеті.")
                ]),
                Question(expression: "дочка", translation: "en dotter", examples: [
                    ("Min dotter älskar att rita.", "Моя дочка любить малювати."),
                    ("Jag köpte en present till min dotter.", "Я купив подарунок для моєї дочки."),
                    ("Min dotter är väldigt kreativ.", "Моя дочка дуже креативна."),
                    ("Vi har en liten hund som hon älskar.", "У нас є маленька собака, яку вона обожнює.")
                ]),
                Question(expression: "син", translation: "en son", examples: [
                    ("Min son går i skolan.", "Мій син ходить до школи."),
                    ("Jag och min son bygger ett hus av Lego.", "Я і мій син будуємо будинок з Лего."),
                    ("Min son älskar att spela datorspel.", "Мój syn любить грати в комп'ютерні ігри."),
                    ("Vi gick på bio tillsammans.", "Ми разом пішли в кіно.")
                ]),
                Question(expression: "діти", translation: "ett barn", examples: [
                    ("Barnen leker i parken.", "Діти граються в парку."),
                    ("Vi har tre barn.", "У нас троє дітей."),
                    ("Barnen älskar att läsa böcker.", "Діти люблять читати книги."),
                    ("Det är många barn på skolgården.", "На шкільному подвір'ї багато дітей.")
                ]),
                Question(expression: "дідусь", translation: "en farfar", examples: [
                    ("Min farfar är 80 år gammal.", "Моєму дідусеві 80 років."),
                    ("Farfar gillar att fiska.", "Дідусь любить рибалити."),
                    ("Jag träffade min farfar på helgen.", "Я зустрівся з дідусем в вихідні."),
                    ("Farfar berättade många roliga historier.", "Дідусь розповів багато смішних історій.")
                ]),
                Question(expression: "бабуся", translation: "en farmor", examples: [
                    ("Min farmor bor på landet.", "Моя бабуся живе за містом."),
                    ("Farmor min gör alltid god mat.", "Моя бабуся завжди готує смачну їжу."),
                    ("Vi besöker min farmor på helgerna.", "Ми відвідуємо мою бабусю на вихідних."),
                    ("Farmor älskar sina blommor.", "Моя бабуся любить свої квіти.")
                ]),
                Question(expression: "свекор", translation: "en svärfar", examples: [
                    ("Min svärfar är pensionär.", "Мій тесть - пенсіонер."),
                    ("Svärfar hjälpte oss att bygga huset.", "Тесть допоміг нам побудувати будинок."),
                    ("Han älskar att laga mat.", "Він любить готувати."),
                    ("Min svärfar är väldigt vänlig.", "Мій тесть дуже привітний.")
                ]),
                Question(expression: "свекруха", translation: "en svärmor", examples: [
                    ("Svärmor kommer på besök nästa vecka.", "Теща приїде в гості на наступному тижні."),
                    ("Min svärmor är en bra kock.", "Моя теща - чудова кухарка."),
                    ("Vi firade jul med min svärmor.", "Ми святкували Різдво з моєю тещею."),
                    ("Svärmor älskar att läsa böcker.", "Теща любить читати книги.")
                ]),
                Question(expression: "своячка", translation: "en svägerska", examples: [
                    ("Min svägerska är väldigt snäll.", "Моя своячка дуже добра."),
                    ("Vi träffade min svägerska på helgen.", "Ми зустрілися з моєю своячкою на вихідних."),
                    ("Svägerska min gillar att baka.", "Моя своячка любить пекти."),
                    ("Jag gillar att spendera tid med min svägerska.", "Я люблю проводити час зі своєю своячкою.")
                ]),
                Question(expression: "свояк", translation: "en svåger", examples: [
                    ("Min svåger är en duktig kock.", "Мій свояк хороший кухар."),
                    ("Jag spelar fotboll med min svåger.", "Я граю у футбол з моїм свояком."),
                    ("Svåger min älskar att resa.", "Мій свояк любить подорожувати."),
                    ("Vi träffade min svåger igår.", "Ми зустрілися з моїм свояком вчора.")
                ]),
                Question(expression: "чоловік", translation: "en man", examples: [
                    ("Min man jobbar på ett kontor.", "Мій чоловік працює в офісі."),
                    ("Han är snäll och omtänksam.", "Він добрий і турботливий."),
                    ("Min man älskar att resa.", "Мій чоловік любить подорожувати."),
                    ("Vi firade vår bröllopsdag.", "Ми святкували річницю весілля.")
                ]),
                Question(expression: "жінка", translation: "en kvinna", examples: [
                    ("Min kvinna arbetar som läkare.", "Моя жінка працює лікарем."),
                    ("Hon är mycket intelligent.", "Вона дуже розумна."),
                    ("Kvinnan i butiken hjälpte mig.", "Жінка в магазині допомогла мені."),
                    ("Min kvinna älskar att läsa böcker.", "Моя жінка любить читати книги.")
                ]),
                Question(expression: "онук", translation: "ett barnbarn", examples: [
                    ("Min farfar älskar att leka med sina barnbarn.", "Мій дідусь любить грати з своїми онуками."),
                    ("Barnbarnen besöker oss varje helg.", "Онуки відвідують нас кожні вихідні."),
                    ("Jag köpte en present till mitt barnbarn.", "Я купив подарунок для свого онука."),
                    ("Barnbarnen älskar att leka tillsammans.", "Онуки люблять грати разом.")
                ]),
                Question(expression: "племінник", translation: "en brorson", examples: [
                    ("Min brorson spelar fotboll.", "Мій племінник грає у футбол."),
                    ("Han älskar att leka med sina kompisar.", "Він любить грати з друзями."),
                    ("Jag träffade min brorson igår.", "Я зустрів мого племінника вчора."),
                    ("Min brorson är väldigt duktig i skolan.", "Мій племінник дуже здібний в школі.")
                ]),
                Question(expression: "племінниця", translation: "en brorsdotter", examples: [
                    ("Min brorsdotter älskar att måla.", "Моя племінниця любить малювати."),
                    ("Vi firade hennes födelsedag igår.", "Ми святкували її день народження вчора."),
                    ("Brorsdottern är väldigt kreativ.", "Племінниця дуже креативна."),
                    ("Jag såg min brorsdotter i parken.", "Я побачив свою племінницю в парку.")
                ]),
                Question(expression: "тітка", translation: "en tant", examples: [
                    ("Min tant bor i en liten stad.", "Моя тітка живе в маленькому місті."),
                    ("Tanten gillar att sticka.", "Тітка любить в'язати."),
                    ("Vi besökte min tant på helgen.", "Ми відвідали тітку на вихідних."),
                    ("Tanten ger oss alltid goda råd.", "Тітка завжди дає нам хороші поради.")
                ]),
                Question(expression: "дядько", translation: "min onkel", examples: [
                    ("Min onkel jobbar som ingenjör.", "Мій дядько працює інженером."),
                    ("Onkel brukar berätta roliga historier.", "Дядько часто розповідає смішні історії."),
                    ("Jag träffade min onkel på fest.", "Я зустрів мого дядька на святі."),
                    ("Min onkel älskar att fiska.", "Мій дядько любить рибалити.")
                ]),
                Question(expression: "сім'я", translation: "en familj", examples: [
                    ("Min familj bor i en stor hus.", "Моя родина живе в великому будинку."),
                    ("Familjen gillar att resa tillsammans.", "Родина любить подорожувати разом."),
                    ("Vi träffades alla i helgen.", "Ми зустрілися всі на вихідних."),
                    ("Familjen firade jul tillsammans.", "Родина святкувала Різдво разом.")
                ]),
                Question(expression: "батьки", translation: "föräldrar", examples: [
                    ("Mina föräldrar är väldigt stödjande.", "Мої батьки дуже підтримують."),
                    ("Vi ska fira jul med mina föräldrar.", "Ми будемо святкувати Різдво з моїми батьками."),
                    ("Föräldrar mina älskar att resa.", "Мої батьки люблять подорожувати."),
                    ("Jag har alltid fått bra råd från mina föräldrar.", "Я завжди отримував добрі поради від моїх батьків.")
                ]),
                Question(expression: "кузин", translation: "en kusin", examples: [
                    ("Min kusin bor i Göteborg.", "Мій кузен живе в Гетеборзі."),
                    ("Jag träffade min kusin på helgen.", "Я зустрів свого кузена на вихідних."),
                    ("Kusin min är bra på att spela gitarr.", "Мій кузен добре грає на гітарі."),
                    ("Vi gick till bio med min kusin.", "Ми пішли в кіно з моїм кузеном.")
                ]),
                Question(expression: "знайомий", translation: "en bekant", examples: [
                    ("Jag träffade en bekant på stan.", "Я зустрів знайомого на вулиці."),
                    ("Min bekant bor i Stockholm.", "Мій знайомий живе в Стокгольмі."),
                    ("Han är en god bekant till mig.", "Він хороший знайомий для мене."),
                    ("Jag pratade med en bekant på festen.", "Я розмовляв з знайомим на вечірці.")
                ])
            ],
        
            .professions: [
                Question(expression: "вчитель", translation: "en lärare", examples: [
                    ("Han är en lärare på en högskola.", "Він є вчителем у коледжі."),
                    ("Min lärare är väldigt snäll.", "Мій вчитель дуже добрий."),
                    ("Lärare min undervisar matematik.", "Мій вчитель викладає математику."),
                    ("Jag vill bli lärare i framtiden.", "Я хочу стати вчителем в майбутньому.")
                ]),
                Question(expression: "лікар", translation: "en läkare", examples: [
                    ("Min läkare arbetar på sjukhuset.", "Мій лікар працює в лікарні."),
                    ("Jag har en tid hos läkaren imorgon.", "У мене є запис до лікаря на завтра."),
                    ("Läkare min är expert på kirurgi.", "Мій лікар є експертом з хірургії."),
                    ("Jag behöver gå till läkaren för en undersökning.", "Мені потрібно піти до лікаря на огляд.")
                ]),
                Question(expression: "інженер", translation: "en ingenjör", examples: [
                    ("Min far är ingenjör.", "Мій батько інженер."),
                    ("Ingenjör min designar nya byggnader.", "Мій інженер проектує нові будівлі."),
                    ("Jag studerar för att bli ingenjör.", "Я навчаюся, щоб стати інженером."),
                    ("Ingenjören löste problemet snabbt.", "Інженер швидко вирішив проблему.")
                ]),
                Question(expression: "пожежник", translation: "en brandman", examples: [
                    ("Min bror är brandman.", "Мій брат є пожежником."),
                    ("Brandman min räddade en katt från ett träd.", "Мій пожежник врятував кота з дерева."),
                    ("Jag vill bli brandman när jag blir stor.", "Я хочу стати пожежником, коли виросту."),
                    ("Brandmän jobbar hårt för att rädda liv.", "Пожежники працюють важко, щоб рятувати життя.")
                ]),
                Question(expression: "програміст", translation: "en programmerare", examples: [
                    ("Jag är programmerare på ett IT-företag.", "Я програміст в ІТ-компанії."),
                    ("Programmerare min jobbar med webbutveckling.", "Мій програміст працює з веб-розробкою."),
                    ("Jag lär mig att bli programmerare.", "Я вчуся бути програмістом."),
                    ("Programmeraren fixade buggen på några minuter.", "Програміст виправив помилку за кілька хвилин.")
                ]),
                Question(expression: "музикант", translation: "en musiker", examples: [
                    ("Han är en känd musiker.", "Він відомий музикант."),
                    ("Min vän är en musiker i ett band.", "Мій друг музикант в групі."),
                    ("Musikern spelade på konserten igår.", "Музикант грав на концерті вчора."),
                    ("Jag drömmer om att bli musiker.", "Я мрію стати музикантом.")
                ]),
                Question(expression: "пекар", translation: "en bagare", examples: [
                    ("Min mamma är bagare.", "Моя мама пекар."),
                    ("Bagaren bakar goda bröd.", "Пекар пече смачні хліби."),
                    ("Jag köpte färskt bröd från bagaren.", "Я купив свіжий хліб у пекаря."),
                    ("Bagare min gör de bästa tårtorna.", "Мій пекар робить найкращі торти.")
                ]),
                Question(expression: "письменник", translation: "en författare", examples: [
                    ("Jag vill bli författare en dag.", "Я хочу стати письменником одного дня."),
                    ("Författare min skrev en bok om resor.", "Мій письменник написав книгу про подорожі."),
                    ("Jag läser många böcker av denna författare.", "Я читаю багато книг цього письменника."),
                    ("Författaren fick ett pris för sin senaste bok.", "Письменник отримав нагороду за свою останню книгу.")
                ]),
                Question(expression: "фотограф", translation: "en fotograf", examples: [
                    ("Min vän är fotograf.", "Мій друг фотограф."),
                    ("Fotografen tog fantastiska bilder.", "Фотограф зробив чудові фотографії."),
                    ("Jag gillar att arbeta som fotograf.", "Мені подобається працювати фотографом."),
                    ("Fotografen fångade alla viktiga ögonblick.", "Фотограф зафіксував усі важливі моменти.")
                ]),
                Question(expression: "психолог", translation: "en psykolog", examples: [
                    ("Jag går till en psykolog för rådgivning.", "Я ходжу до психолога за консультацією."),
                    ("Psykologen hjälpte mig att förstå mig själv bättre.", "Психолог допоміг мені краще зрозуміти себе."),
                    ("Min psykolog arbetar på en klinik.", "Мій психолог працює в клініці."),
                    ("Jag träffade min psykolog för en session.", "Я зустрівся з моїм психологом на сеанс."),
                ]),
                Question(expression: "архітектор", translation: "en arkitekt", examples: [
                    ("Min pappa är arkitekt.", "Мій тато архітектор."),
                    ("Arkitekten designade en vacker byggnad.", "Архітектор спроектував красиву будівлю."),
                    ("Jag vill bli arkitekt i framtiden.", "Я хочу стати архітектором в майбутньому."),
                    ("Arkitekten ritade en modern villa.", "Архітектор намалював сучасну віллу.")
                ]),
                Question(expression: "журналіст", translation: "en journalist", examples: [
                    ("Min vän är journalist.", "Мій друг журналіст."),
                    ("Journalisten intervjuade kändisar.", "Журналіст проводив інтерв'ю з відомими людьми."),
                    ("Jag arbetar som journalist på en tidning.", "Я працюю журналістом в газеті."),
                    ("Journalisten skrev en artikel om politik.", "Журналіст написав статтю про політику.")
                ]),
                Question(expression: "адвокат", translation: "en advokat", examples: [
                    ("Min farfar är advokat.", "Мій дідусь адвокат."),
                    ("Advokaten försvarade sin klient i rätten.", "Адвокат захищав свого клієнта в суді."),
                    ("Jag studerar för att bli advokat.", "Я вивчаю право, щоб стати адвокатом."),
                    ("Advokaten gav mig råd om mitt fall.", "Адвокат дав мені пораду щодо моєї справи.")
                ]),
                Question(expression: "дизайнер", translation: "en designer", examples: [
                    ("Min vän är en designer.", "Мій друг дизайнер."),
                    ("Designer min skapade en fantastisk logotyp.", "Мій дизайнер створив чудовий логотип."),
                    ("Jag vill bli designer och skapa kläder.", "Я хочу стати дизайнером і створювати одяг."),
                    ("Designern arbetade länge på det nya projektet.", "Дизайнер працював довго над новим проектом.")
                ]),
                Question(expression: "поштар", translation: "en brevbärare", examples: [
                    ("Brevbäraren levererade mitt paket igår.", "Поштар доставив мій пакет учора."),
                    ("Min pappa arbetade som brevbärare.", "Мій батько працював поштарем."),
                    ("Brevbäraren är på väg.", "Поштар на шляху."),
                    ("Jag såg brevbäraren utanför mitt hus.", "Я побачив поштаря біля мого будинку.")
                ]),
                Question(expression: "бармен", translation: "en bartender", examples: [
                    ("Bartendern gjorde en fantastisk drink.", "Бармен приготував чудовий коктейль."),
                    ("Jag träffade bartendern på en fest.", "Я зустрів бармена на вечірці."),
                    ("Bartendern rekommenderade en ny cocktail.", "Бармен порекомендував новий коктейль."),
                    ("Som bartender arbetar man ofta på kvällarna.", "Як бармен, зазвичай працюєш ввечері.")
                ]),
                Question(expression: "хірург", translation: "en kirurg", examples: [
                    ("Min syster är kirurg.", "Моя сестра хірург."),
                    ("Kirurgen opererade på mig förra veckan.", "Хірург оперував мене минулого тижня."),
                    ("Kirurgens skicklighet räddade livet på många patienter.", "Вміння хірурга врятувало життя багатьом пацієнтам."),
                    ("Jag vill bli kirurg när jag växer upp.", "Я хочу стати хірургом, коли виросту.")
                ]),
                Question(expression: "шофер", translation: "en chaufför", examples: [
                    ("Chauffören körde oss till flygplatsen.", "Шофер відвіз нас до аеропорту."),
                    ("Min granne är chaufför på ett bussföretag.", "Мій сусід шофер в автобусній компанії."),
                    ("Chauffören väntade på oss vid stationen.", "Шофер чекав на нас на станції."),
                    ("Jag kör som chaufför på helgerna.", "Я працюю шофером на вихідних.")
                ]),
                Question(expression: "менеджер", translation: "en chef", examples: [
                    ("Min chef är väldigt snäll.", "Мій менеджер дуже добрий."),
                    ("Chefen gav mig ett nytt projekt att arbeta på.", "Менеджер дав мені новий проект для роботи."),
                    ("Jag träffade chefen på mötet.", "Я зустрів менеджера на зустрічі."),
                    ("Som chef har man mycket ansvar.", "Як менеджер, маєш багато відповідальності.")
                ]),
                Question(expression: "копірайтер", translation: "en copywriter", examples: [
                    ("Copywritern skrev en fantastisk text för annonsen.", "Копірайтер написав чудовий текст для оголошення."),
                    ("Jag vill bli copywriter och jobba med reklam.", "Я хочу стати копірайтером і працювати з рекламою."),
                    ("Copywritern jobbar med att skapa innehåll för företag.", "Копірайтер працює над створенням контенту для компаній."),
                    ("Min vän är copywriter på ett reklambyrå.", "Мій друг копірайтер в рекламному агентстві.")
                ]),
                Question(expression: "юрист", translation: "en jurist", examples: [
                    ("Jag behöver en jurist för att hjälpa mig med min affär.", "Мені потрібен юрист, щоб допомогти з моїм бізнесом."),
                    ("Juristen förklarade reglerna för mig.", "Юрист пояснив мені правила."),
                    ("Min far är jurist och arbetar med familjerätt.", "Мій батько юрист і працює в сімейному праві."),
                    ("Juristen gav mig bra råd för mitt fall.", "Юрист дав мені хорошу пораду щодо моєї справи.")
                ]),
                Question(expression: "будівельник", translation: "en byggare", examples: [
                    ("Byggaren bygger ett hus på min gata.", "Будівельник будує будинок на моїй вулиці."),
                    ("Min farfar var byggare.", "Мій дідусь був будівельником."),
                    ("Byggaren använde stora maskiner på byggarbetsplatsen.", "Будівельник використовував великі машини на будівельному майданчику."),
                    ("Jag vill bli byggare och bygga hus.", "Я хочу стати будівельником і будувати будинки.")
                ]),
                Question(expression: "вчений", translation: "en vetenskapsman", examples: [
                    ("Den kända vetenskapsmannen upptäckte ett nytt ämne.", "Відомий вчений відкрив нову речовину."),
                    ("Jag vill bli vetenskapsman och forska om medicin.", "Я хочу стати вченим і досліджувати медицину."),
                    ("Vetenskapsmannen presenterade sina resultat på konferensen.", "Вчений представив свої результати на конференції."),
                    ("Min morfar är vetenskapsman och arbetar på ett universitet.", "Мій дідусь вчений і працює в університеті.")
                ]),
                Question(expression: "фермер", translation: "en bonde", examples: [
                    ("Bonden arbetar hårt på gården.", "Фермер працює важко на фермі."),
                    ("Min farfar var bonde.", "Мій дідусь був фермером."),
                    ("Bonden skördade sina äpplen på hösten.", "Фермер збирав яблука восени."),
                    ("Bonden säljer sina produkter på marknaden.", "Фермер продає свої продукти на ринку.")
                ]),
                Question(expression: "технік", translation: "en tekniker", examples: [
                    ("Teknikern fixade min dator.", "Технік полагодив мій комп'ютер."),
                    ("Min bror arbetar som tekniker på ett företag.", "Мій брат працює техніком у компанії."),
                    ("Teknikern installera ny utrustning i kontoret.", "Технік встановив нове обладнання в офісі."),
                    ("Jag jobbar som tekniker inom telekommunikation.", "Я працюю техніком у сфері телекомунікацій.")
                ]),
                Question(expression: "пілот", translation: "en pilot", examples: [
                    ("Piloten flög oss till Paris.", "Пілот полетів до Парижа."),
                    ("Min dröm är att bli pilot.", "Моя мрія стати пілотом."),
                    ("Piloten landade planet säkert.", "Пілот приземлився безпечно."),
                    ("Jag såg piloten innan vi gick ombord på planet.", "Я побачив пілота перед тим, як ми сели на літак.")
                ]),
                Question(expression: "режисер", translation: "en regissör", examples: [
                    ("Regissören regisserade en fantastisk film.", "Режисер поставив чудовий фільм."),
                    ("Jag vill bli regissör och skapa egna filmer.", "Я хочу стати режисером і створювати власні фільми."),
                    ("Regissören gav oss instruktioner för scenen.", "Режисер дав нам інструкції для сцени."),
                    ("Regissören är känd för sina spännande filmer.", "Режисер відомий своїми захоплюючими фільмами.")
                ]),
                Question(expression: "спортсмен", translation: "en idrottare", examples: [
                    ("Jag träffade en känd idrottare på eventet.", "Я зустрів відомого спортсмена на заході."),
                    ("Min kompis är en professionell idrottare.", "Мій друг — професійний спортсмен."),
                    ("Idrottaren tränar varje dag.", "Спортсмен тренується кожен день."),
                    ("Jag vill bli idrottare och vinna medaljer.", "Я хочу стати спортсменом і вигравати медалі.")
                ]),
                Question(expression: "гід", translation: "en guide", examples: [
                    ("Guiden visade oss runt i staden.", "Гід показав нам місто."),
                    ("Jag arbetade som guide på museum.", "Я працював гідом в музеї."),
                    ("Guiderna berättade om historien bakom byggnaden.", "Гіди розповіли історію будівлі."),
                    ("Jag vill bli guide och arbeta på ett reseföretag.", "Я хочу стати гідом і працювати в туристичній компанії.")
                ]),
                Question(expression: "розробник", translation: "en utvecklare", examples: [
                    ("Jag arbetar som utvecklare på ett techföretag.", "Я працюю розробником в технологічній компанії."),
                    ("Utvecklaren skapade en ny funktion för appen.", "Розробник створив нову функцію для додатку."),
                    ("Som utvecklare måste man ha goda programmeringskunskaper.", "Як розробник, потрібно мати хороші знання програмування."),
                    ("Jag träffade en utvecklare på konferensen.", "Я зустрів розробника на конференції.")
                ]),
                Question(expression: "бухгалтер", translation: "en revisor", examples: [
                    ("Revisorn kontrollerade företagets bokföring.", "Бухгалтер перевірив фінансові документи компанії."),
                    ("Jag arbetar som revisor på ett internationellt företag.", "Я працюю бухгалтером у міжнародній компанії."),
                    ("Revisorn såg till att alla transaktioner var korrekta.", "Бухгалтер переконався, що всі транзакції були правильними."),
                    ("Jag behöver träffa en revisor för att ordna mina skatter.", "Мені потрібно зустрітися з бухгалтером, щоб вирішити податкові питання.")
                ]),
                Question(expression: "священик", translation: "en präst", examples: [
                    ("Prästen höll en gudstjänst på söndagen.", "Священик провів службу в неділю."),
                    ("Min farbror är präst i en liten by.", "Мій дядько — священик у маленькому селі."),
                    ("Prästen gav en predikan om kärlek och förlåtelse.", "Священик виголосив проповідь про любов і прощення."),
                    ("Prästen besökte sjukhuset för att trösta de sjuka.", "Священик відвідав лікарню, щоб втішити хворих.")
                ]),
                Question(expression: "медсестра", translation: "en sjuksköterska", examples: [
                    ("Sjuksköterskan tog hand om mig när jag var sjuk.", "Медсестра піклувалася про мене, коли я був хворий."),
                    ("Min syster är sjuksköterska på ett sjukhus.", "Моя сестра — медсестра в лікарні."),
                    ("Sjuksköterskan hjälpte läkaren under operationen.", "Медсестра допомагала лікарю під час операції."),
                    ("Jag vill bli sjuksköterska och arbeta på akuten.", "Я хочу стати медсестрою і працювати в швидкій допомозі.")
                ]),
                Question(expression: "монахиня", translation: "en nunna", examples: [
                    ("Nunnan lever ett liv i böner och meditation.", "Монахиня веде життя в молитвах і медитації."),
                    ("Jag träffade en nunna som hjälpte barn i byn.", "Я зустрів монахиню, яка допомагала дітям у селі."),
                    ("Nunnorna tar hand om sjuka och äldre människor.", "Монахині доглядають за хворими та літніми людьми."),
                    ("Som nunna är livet fokuserat på andakt och tjänst.", "Як монахиня, життя зосереджене на молитвах та служінні.")
                ]),
                
                Question(expression: "директор школи", translation: "rektor", examples: [
                    ("Rektorn höll ett tal på skolavslutningen.", "Директор школи виголосив промову на випускному."),
                    ("Rektorn var inte nöjd med resultaten.", "Директор школи не був задоволений результатами."),
                    ("Jag pratade med rektorn om skolan.", "Я поговорив з директором школи про школу."),
                    ("Rektorn bestämde sig för att införa nya regler.", "Директор школи вирішив впровадити нові правила.")
                ]),
                Question(expression: "біолог", translation: "en biolog", examples: [
                    ("Biologen forskade på nya växtarter.", "Біолог досліджував нові види рослин."),
                    ("Jag träffade en biologi lärare som var biolog.", "Я зустрів вчителя біології, який був біологом."),
                    ("Biologen observerade djurens beteende i naturen.", "Біолог спостерігав за поведінкою тварин у природі."),
                    ("Min vän är biologi och arbetade som biolog.", "Мій друг є біологом і працював біологом.")
                ]),
                Question(expression: "біохімік", translation: "en biokemist", examples: [
                    ("Biokemisten undersökte molekylstrukturer.", "Біохімік вивчав молекулярні структури."),
                    ("Biokemistens forskning fokuserade på cancerbehandlingar.", "Дослідження біохіміка зосереджувалися на лікуванні раку."),
                    ("Jag arbetar som biokemist på ett forskningsinstitut.", "Я працюю біохіміком у дослідницькому інституті."),
                    ("Biokemisten publicerade sina resultat i en vetenskaplig tidskrift.", "Біохімік опублікував свої результати в науковому журналі.")
                ]),
                Question(expression: "хімік", translation: "en kemist", examples: [
                    ("Kemistens laboratorium var fullt av kemikalier.", "Лабораторія хіміка була заповнена хімікатами."),
                    ("Kemistens forskning hjälpte till att utveckla nya läkemedel.", "Дослідження хіміка допомогли розробити нові ліки."),
                    ("Jag studerar kemi för att bli kemist.", "Я вивчаю хімію, щоб стати хіміком."),
                    ("Kemisten experimenterade med olika ämnen.", "Хімік експериментував з різними речовинами.")
                ]),
                Question(expression: "фізик", translation: "en fysiker", examples: [
                    ("Fysikern presenterade en teori om universums uppkomst.", "Фізик представив теорію про виникнення Всесвіту."),
                    ("Jag träffade en fysiker som arbetade med rymdteknik.", "Я зустрів фізика, який працював з космічними технологіями."),
                    ("Fysikern forskade på kvantmekanik.", "Фізик досліджував квантову механіку."),
                    ("Fysikern förklarade en komplex teori om energi.", "Фізик пояснив складну теорію енергії.")
                ]),
                Question(expression: "логопед", translation: "en logoped", examples: [
                    ("Logopeden hjälpte barnet att lära sig tala korrekt.", "Логопед допоміг дитині навчитися правильно говорити."),
                    ("Jag besökte logopeden för att få hjälp med talträning.", "Я відвідав логопеда, щоб отримати допомогу з мовними вправами."),
                    ("Logopeden arbetar med patienter som har talproblem.", "Логопед працює з пацієнтами, які мають проблеми з мовленням."),
                    ("Som logoped hjälper man människor att förbättra sin talförmåga.", "Як логопед, допомагаєш людям покращити свої мовні навички.")
                ]),
                Question(expression: "актор", translation: "en skådespelare", examples: [
                    ("Skådespelaren fick ett pris för bästa roll.", "Актор отримав нагороду за найкращу роль."),
                    ("Jag såg en film där skådespelaren spelade en hjälte.", "Я побачив фільм, де актор зіграв героя."),
                    ("Skådespelaren tränade för sin nya filmroll.", "Актор тренувався для нової ролі у фільмі."),
                    ("Han är en populär skådespelare i Hollywood.", "Він популярний актор у Голлівуді.")
                ]),
                Question(expression: "хореограф", translation: "en koreograf", examples: [
                    ("Koreografen skapade en spektakulär dans.", "Хореограф створив вражаючий танець."),
                    ("Koreografen lärde oss olika danssteg.", "Хореограф навчив нас різних танцювальних кроків."),
                    ("Koreografen arbetade med en berömd dansgrupp.", "Хореограф працював з відомою танцювальною групою."),
                    ("Han är en internationellt erkänd koreograf.", "Він міжнародно визнаний хореограф.")
                ]),
                Question(expression: "писатель", translation: "en författare", examples: [
                    ("Författaren skrev en bok om historia.", "Письменник написав книгу про історію."),
                    ("Författaren har vunnit flera litterära priser.", "Письменник отримав кілька літературних нагород."),
                    ("Författaren håller en boksignering.", "Письменник проводить підписування книг."),
                    ("Han är en känd författare inom science fiction-genren.", "Він відомий письменник у жанрі наукової фантастики.")
                ]),
                Question(expression: "диригент", translation: "en dirigent", examples: [
                    ("Dirigenten styrde orkestern under konserten.", "Диригент керував оркестром під час концерту."),
                    ("Dirigenten ledde repetitionen.", "Диригент проводив репетицію."),
                    ("Han är en berömd dirigent som har arbetat med många orkestrar.", "Він відомий диригент, який працював з багатьма оркестрами."),
                    ("Dirigenten använde en taktpinne för att ge instruktioner.", "Диригент використовував диригентську паличку для подачі інструкцій.")
                ]),
                Question(expression: "художник", translation: "en målare", examples: [
                    ("Målaren skapade ett porträtt av sin vän.", "Маляр створив портрет свого друга."),
                    ("Målaren använde oljefärger för att måla tavlan.", "Маляр використовував олійні фарби для малювання картини."),
                    ("Jag köpte en tavla av en känd målare.", "Я купив картину відомого маляра."),
                    ("Målaren visade sina verk på en utställning.", "Маляр показав свої роботи на виставці.")
                ]),
                Question(expression: "піаніст", translation: "en pianist", examples: [
                    ("Pianisten spelade en vacker melodi.", "Піаніст грав гарну мелодію."),
                    ("Pianisten har spelat på många internationella konserter.", "Піаніст виступав на багатьох міжнародних концертах."),
                    ("Pianisten övade varje dag för sin stora konsert.", "Піаніст тренувався кожен день до великого концерту."),
                    ("Jag såg en fantastisk pianist spela på teatern.", "Я бачив фантастичного піаніста, який грав у театрі.")
                ]),
                Question(expression: "спеціаліст з маркетингу", translation: "en marknadsförare", examples: [
                    ("Marknadsföraren utvecklar nya strategier för att locka kunder.", "Спеціаліст з маркетингу розробляє нові стратегії для залучення клієнтів."),
                    ("Hon arbetar som marknadsförare på ett internationellt företag.", "Вона працює спеціалістом з маркетингу в міжнародній компанії."),
                    ("En marknadsförare behöver förstå konsumentbeteende.", "Спеціаліст з маркетингу повинен розуміти поведінку споживачів."),
                    ("Marknadsföraren lanserade en ny reklamkampanj.", "Спеціаліст з маркетингу запустив нову рекламну кампанію.")
                ]),
                Question(expression: "співак, співачка", translation: "en sångare, en sångerska", examples: [
                    ("Sångaren sjöng en vacker ballad.", "Співак заспівав гарну баладу."),
                    ("Sångerskan har en fantastisk röst.", "Співачка має фантастичний голос."),
                    ("De båda sångarna framträdde på scenen.", "Обидва співаки виступали на сцені."),
                    ("Sångerskan uppträdde på en stor festival.", "Співачка виступала на великому фестивалі.")
                ])
            ],
        
            .animals: [
                Question(expression: "собака", translation: "en hund", examples: [
                    ("Min hund älskar att leka i parken.", "Мій собака любить гратися в парку."),
                    ("Jag har en liten hund.", "У мене є маленький собака."),
                    ("Hunden skäller på främlingar.", "Собака гавкає на незнайомців."),
                    ("Barnet klappar hunden.", "Дитина гладить собаку.")
                ]),
                Question(expression: "кіт", translation: "en katt", examples: [
                    ("Min katt sover hela dagen.", "Мій кіт спить цілий день."),
                    ("Jag har en svart katt.", "У мене є чорний кіт."),
                    ("Katten jagar en mus.", "Кіт полює на мишу."),
                    ("Barnet matar katten.", "Дитина годує кота.")
                ]),
                Question(expression: "кінь", translation: "en häst", examples: [
                    ("Hästen springer på fältet.", "Кінь біжить по полю."),
                    ("Jag rider en häst.", "Я катаюсь на коні."),
                    ("Barnen älskar hästar.", "Діти люблять коней."),
                    ("Hästen behöver mat.", "Коню потрібна їжа.")
                ]),
                Question(expression: "корова", translation: "en ko", examples: [
                    ("Kon ger oss mjölk.", "Корова дає нам молоко."),
                    ("Jag såg en ko på bondgården.", "Я бачив корову на фермі."),
                    ("Korna betar på ängen.", "Корови пасуться на лузі."),
                    ("Den svarta kon är väldigt stor.", "Чорна корова дуже велика.")
                ]),
                Question(expression: "свиня", translation: "en gris", examples: [
                    ("Grisen rullar i leran.", "Свиня катається в багнюці."),
                    ("Vi såg en gris på gården.", "Ми бачили свиню на подвір'ї."),
                    ("Grisen äter äpplen.", "Свиня їсть яблука."),
                    ("Barnen matar grisen.", "Діти годують свиню.")
                ]),
                Question(expression: "вовк", translation: "en varg", examples: [
                    ("Vargen ylar på natten.", "Вовк виє вночі."),
                    ("Vi såg en varg i skogen.", "Ми бачили вовка в лісі."),
                    ("Vargen jagar rådjur.", "Вовк полює на оленя."),
                    ("Den grå vargen är farlig.", "Сірий вовк є небезпечним.")
                ]),
                Question(expression: "ведмідь", translation: "en björn", examples: [
                    ("Björnen sover under vintern.", "Ведмідь спить взимку."),
                    ("Vi såg en björn i zoo.", "Ми бачили ведмедя в зоопарку."),
                    ("Björnen äter honung.", "Ведмідь їсть мед."),
                    ("En stor björn går genom skogen.", "Великий ведмідь йде через ліс.")
                ]),
                Question(expression: "олень", translation: "en hjort", examples: [
                    ("Hjorten springer genom skogen.", "Олень біжить через ліс."),
                    ("Jag såg en hjort i parken.", "Я бачив оленя в парку."),
                    ("Hjortar är vackra djur.", "Олені – красиві тварини."),
                    ("Den unga hjorten leker med sin mamma.", "Молодий олень грається з мамою.")
                ]),
                Question(expression: "лисиця", translation: "en räv", examples: [
                    ("Räven har en röd päls.", "Лисиця має руде хутро."),
                    ("Jag såg en räv på vägen.", "Я бачив лисицю на дорозі."),
                    ("Räven jagar små djur.", "Лисиця полює на дрібних тварин."),
                    ("Den listiga räven gömmer sig i skogen.", "Хитра лисиця ховається в лісі.")
                ]),
                Question(expression: "заєць", translation: "en hare", examples: [
                    ("Haren hoppar snabbt.", "Заєць швидко стрибає."),
                    ("Jag såg en hare i trädgården.", "Я бачив зайця в саду."),
                    ("Haren är rädd för rovdjur.", "Заєць боїться хижаків."),
                    ("Barnen försöker fånga en hare.", "Діти намагаються зловити зайця.")
                ]),
                Question(expression: "їжак", translation: "en igelkott", examples: [
                    ("Igelkotten rullar ihop sig.", "Їжак згортається в клубок."),
                    ("Jag såg en igelkott i parken.", "Я бачив їжака в парку."),
                    ("Igelkotten har många taggar.", "Їжак має багато колючок."),
                    ("Barnen matar en igelkott.", "Діти годують їжака.")
                ]),
                Question(expression: "орел", translation: "en örn", examples: [
                    ("Örnen svävar högt i luften.", "Орел ширяє високо в повітрі."),
                    ("Jag såg en örn vid sjön.", "Я бачив орла біля озера."),
                    ("Örnen jagar fisk.", "Орел полює на рибу."),
                    ("Den stora örnen har skarpa klor.", "Великий орел має гострі кігті.")
                ]),
                Question(expression: "кабан", translation: "ett vildsvin", examples: [
                    ("Vildsvinet springer genom skogen.", "Кабан біжить через ліс."),
                    ("Jag såg ett vildsvin på fältet.", "Я бачив кабана на полі."),
                    ("Vildsvinet letar efter mat.", "Кабан шукає їжу."),
                    ("Den stora vildsvinet är skrämmande.", "Великий кабан виглядає страхітливо.")
                ]),
                Question(expression: "лебідь", translation: "en svan", examples: [
                    ("Svanen simmar på sjön.", "Лебідь пливе по озеру."),
                    ("Jag såg en vacker svan.", "Я бачив гарного лебедя."),
                    ("Svanar lever ofta i par.", "Лебеді часто живуть парами."),
                    ("Barnen matar svanarna vid sjön.", "Діти годують лебедів біля озера.")
                ]),
                Question(expression: "павук", translation: "en spindel", examples: [
                    ("Spindeln bygger ett nät.", "Павук плете павутину."),
                    ("Jag såg en stor spindel i rummet.", "Я бачив великого павука в кімнаті."),
                    ("Spindlar fångar insekter.", "Павуки ловлять комах."),
                    ("Barnet är rädd för spindlar.", "Дитина боїться павуків.")
                ]),
                Question(expression: "жирафа", translation: "en giraff", examples: [
                    ("Giraffen har en lång hals.", "Жирафа має довгу шию."),
                    ("Jag såg en giraff på zoo.", "Я бачив жирафу в зоопарку."),
                    ("Giraffer äter löv från träd.", "Жирафи їдять листя з дерев."),
                    ("Barnen älskar att titta på giraffer.", "Діти люблять дивитися на жираф.")
                ]),
                Question(expression: "зебра", translation: "en zebra", examples: [
                    ("Zebran har svartvita ränder.", "Зебра має чорні та білі смуги."),
                    ("Jag såg en zebra på savannen.", "Я бачив зебру на савані."),
                    ("Zebror lever i stora grupper.", "Зебри живуть у великих групах."),
                    ("Zebran sprang snabbt över fältet.", "Зебра швидко бігла по полю.")
                ]),
                Question(expression: "носоріг", translation: "en noshörning", examples: [
                    ("Noshörningen har ett stort horn.", "Носоріг має великий ріг."),
                    ("Jag såg en noshörning på zoo.", "Я бачив носорога в зоопарку."),
                    ("Noshörningar är väldigt starka djur.", "Носороги – дуже сильні тварини."),
                    ("Den stora noshörningen betar i gräset.", "Великий носоріг пасеться на траві.")
                ]),
                Question(expression: "слон", translation: "en elefant", examples: [
                    ("Elefanten har en lång snabel.", "Слон має довгий хобот."),
                    ("Jag såg en elefant i djungeln.", "Я бачив слона в джунглях."),
                    ("Elefanter lever i stora flockar.", "Слони живуть у великих стадах."),
                    ("Barnen matade en elefant med frukt.", "Діти годували слона фруктами.")
                ]),
                Question(expression: "тигр", translation: "en tiger", examples: [
                    ("Tigern har orange päls med svarta ränder.", "Тигр має помаранчеву шерсть із чорними смугами."),
                    ("Jag såg en tiger på zoo.", "Я бачив тигра в зоопарку."),
                    ("Tigrar är starka rovdjur.", "Тигри – сильні хижаки."),
                    ("Den stora tigern vilar i skuggan.", "Великий тигр відпочиває в тіні.")
                ]),
                Question(expression: "леопард", translation: "en leopard", examples: [
                    ("Leoparden springer snabbt.", "Леопард бігає швидко."),
                    ("Jag såg en leopard i dokumentären.", "Я бачив леопарда в документальному фільмі."),
                    ("Leoparder jagar om natten.", "Леопарди полюють вночі."),
                    ("Den vackra leoparden har prickig päls.", "Гарний леопард має плямисту шерсть.")
                ]),
                Question(expression: "пінгвін", translation: "en pingvin", examples: [
                    ("Pingviner bor på Antarktis.", "Пінгвіни живуть в Антарктиці."),
                    ("Jag såg en pingvin på zoo.", "Я бачив пінгвіна в зоопарку."),
                    ("Pingviner simmar väldigt bra.", "Пінгвіни дуже добре плавають."),
                    ("Barnen älskar att titta på pingviner.", "Діти люблять дивитися на пінгвінів.")
                ]),
                Question(expression: "дельфін", translation: "en delfin", examples: [
                    ("Delfiner är väldigt intelligenta.", "Дельфіни дуже розумні."),
                    ("Jag såg en delfin hoppa i havet.", "Я бачив, як дельфін стрибнув у море."),
                    ("Delfiner kommunicerar med ljud.", "Дельфіни спілкуються за допомогою звуків."),
                    ("Den lekfulla delfinen simmar nära båten.", "Грайливий дельфін плаває поруч із човном.")
                ]),
                Question(expression: "крокодил", translation: "en krokodil", examples: [
                    ("Krokodilen simmar i floden.", "Крокодил плаває в річці."),
                    ("Jag såg en krokodil i djurparken.", "Я бачив крокодила в зоопарку."),
                    ("Krokodiler har starka käkar.", "Крокодили мають сильні щелепи."),
                    ("Den stora krokodilen ligger på stranden.", "Великий крокодил лежить на березі.")
                ]),
                Question(expression: "бегемот", translation: "en flodhäst", examples: [
                    ("Flodhästen badar i vattnet.", "Бегемот купається у воді."),
                    ("Jag såg en flodhäst på zoo.", "Я бачив бегемота в зоопарку."),
                    ("Flodhästar är väldigt tunga djur.", "Бегемоти – дуже важкі тварини."),
                    ("Den stora flodhästen gäspar bredvid floden.", "Великий бегемот позіхає біля річки.")
                ]),
                Question(expression: "шакал", translation: "en schakal", examples: [
                    ("Schakalen letar efter mat.", "Шакал шукає їжу."),
                    ("Jag såg en schakal i öknen.", "Я бачив шакала в пустелі."),
                    ("Schakaler jagar i flock.", "Шакали полюють зграями."),
                    ("Den listiga schakalen smyger genom buskarna.", "Хитрий шакал крадеться через кущі.")
                ]),
                Question(expression: "білка", translation: "en ekorre", examples: [
                    ("Ekorren hoppar mellan grenarna.", "Білка стрибає між гілками."),
                    ("Jag såg en ekorre i parken.", "Я бачив білку в парку."),
                    ("Ekorren samlar nötter.", "Білка збирає горіхи."),
                    ("Barnen försöker mata ekorren.", "Діти намагаються нагодувати білку.")
                ]),
                Question(expression: "омар", translation: "en hummer", examples: [
                    ("Hummern lever i havet.", "Омар живе в морі."),
                    ("Jag åt en hummer på restaurangen.", "Я їв омара в ресторані."),
                    ("Hummern har stora klor.", "Омар має великі клешні."),
                    ("Den röda hummern är dyr.", "Червоний омар є дорогим.")
                ]),
                Question(expression: "морська зірка", translation: "en sjöstjärna", examples: [
                    ("Sjöstjärnan ligger på havsbotten.", "Морська зірка лежить на дні моря."),
                    ("Jag hittade en sjöstjärna på stranden.", "Я знайшов морську зірку на пляжі."),
                    ("Sjöstjärnor har fem armar.", "Морські зірки мають п'ять рук."),
                    ("Den lilla sjöstjärnan är färgglad.", "Маленька морська зірка є яскравою.")
                ]),
                Question(expression: "медуза", translation: "en manet", examples: [
                    ("Maneter simmar i havet.", "Медузи плавають у морі."),
                    ("Jag såg en stor manet.", "Я бачив велику медузу."),
                    ("Maneter kan brännas.", "Медузи можуть жалити."),
                    ("Den genomskinliga maneten ser magisk ut.", "Прозора медуза виглядає чарівно.")
                ])
            ],
        
            .transport: [
                Question(expression: "автомобіль", translation: "en bil", examples: [
                    ("Jag har en röd bil.", "У мене є червона машина."),
                    ("Bilen står på parkeringen.", "Машина стоїть на парковці."),
                    ("Han köpte en ny bil.", "Він купив нову машину."),
                    ("Vi åker bil till jobbet.", "Ми їдемо машиною на роботу.")
                ]),
                Question(expression: "автобус", translation: "en buss", examples: [
                    ("Bussen är försenad.", "Автобус запізнюється."),
                    ("Jag tar bussen till skolan.", "Я їду автобусом до школи."),
                    ("Bussen stannar vid nästa hållplats.", "Автобус зупиняється на наступній зупинці."),
                    ("Det är många passagerare på bussen.", "В автобусі багато пасажирів.")
                ]),
                Question(expression: "поїзд", translation: "ett tåg", examples: [
                    ("Tåget går klockan åtta.", "Поїзд відправляється о восьмій."),
                    ("Jag reser med tåg till Stockholm.", "Я подорожую поїздом до Стокгольма."),
                    ("Tågresan var bekväm.", "Подорож поїздом була комфортною."),
                    ("Tåget har flera vagnar.", "Поїзд має кілька вагонів.")
                ]),
                Question(expression: "метро", translation: "en tunnelbana", examples: [
                    ("Tunnelbanan går var femte minut.", "Метро ходить кожні п’ять хвилин."),
                    ("Jag tar tunnelbanan till jobbet.", "Я їду метро на роботу."),
                    ("Stockholm har en stor tunnelbana.", "Стокгольм має велике метро."),
                    ("Tunnelbanestationen är nära.", "Станція метро знаходиться поруч.")
                ]),
                Question(expression: "трамвай", translation: "en spårvagn", examples: [
                    ("Spårvagnen är snabb.", "Трамвай швидкий."),
                    ("Jag tar spårvagnen till centrum.", "Я їду трамваєм до центру."),
                    ("Spårvagnens hållplats är där borta.", "Зупинка трамвая там."),
                    ("Det är trevligt att åka spårvagn.", "Приємно їздити трамваєм.")
                ]),
                Question(expression: "таксі", translation: "en taxi", examples: [
                    ("Jag beställde en taxi.", "Я замовив таксі."),
                    ("Taxin är här om fem minuter.", "Таксі буде тут через п’ять хвилин."),
                    ("Det är dyrt att åka taxi.", "Їздити на таксі дорого."),
                    ("Taxichauffören var trevlig.", "Водій таксі був привітним.")
                ]),
                Question(expression: "велосипед", translation: "en cykel", examples: [
                    ("Jag cyklar till jobbet.", "Я їду на велосипеді на роботу."),
                    ("Min cykel är blå.", "Мій велосипед синій."),
                    ("Cykeln har en korg.", "Велосипед має кошик."),
                    ("Det är hälsosamt att cykla.", "Кататися на велосипеді корисно.")
                ]),
                Question(expression: "мотоцикл", translation: "en motorcykel", examples: [
                    ("Han köpte en ny motorcykel.", "Він купив новий мотоцикл."),
                    ("Motorcykeln går snabbt.", "Мотоцикл їде швидко."),
                    ("Det är farligt att köra motorcykel.", "Керувати мотоциклом небезпечно."),
                    ("Jag älskar att åka motorcykel.", "Я люблю кататися на мотоциклі.")
                ]),
                Question(expression: "вантажівка", translation: "en lastbil", examples: [
                    ("Lastbilen transporterar varor.", "Вантажівка перевозить товари."),
                    ("Min pappa kör lastbil.", "Мій тато водить вантажівку."),
                    ("Lastbilen är stor.", "Вантажівка велика."),
                    ("Lastbilar är viktiga för ekonomin.", "Вантажівки важливі для економіки.")
                ]),
                Question(expression: "паром", translation: "en färja", examples: [
                    ("Färjan går till Gotland.", "Паром прямує на Готланд."),
                    ("Jag åker färja till Finland.", "Я пливу паромом до Фінляндії."),
                    ("Färjan är full med bilar.", "Паром повний машин."),
                    ("Vi njuter av utsikten från färjan.", "Ми насолоджуємося видом з парома.")
                ]),
                Question(expression: "літак", translation: "ett flygplan", examples: [
                    ("Flygplanet lyfter snart.", "Літак скоро злітає."),
                    ("Jag reser med flygplan.", "Я подорожую літаком."),
                    ("Flygplan är mycket snabba.", "Літаки дуже швидкі."),
                    ("Piloten styr flygplanet.", "Пілот керує літаком.")
                ]),
                Question(expression: "вертоліт", translation: "en helikopter", examples: [
                    ("Helikoptern landar på sjukhuset.", "Вертоліт приземляється біля лікарні."),
                    ("Jag såg en helikopter i luften.", "Я бачив вертоліт у повітрі."),
                    ("Helikoptrar används för räddning.", "Вертольоти використовуються для порятунку."),
                    ("En militärhelikopter flög förbi.", "Пролетів військовий вертоліт.")
                ]),
                Question(expression: "пішохід", translation: "en fotgängare", examples: [
                    ("Fotgängare måste använda övergångsstället.", "Пішоходи повинні користуватися переходом."),
                    ("Det finns många fotgängare i centrum.", "У центрі багато пішоходів."),
                    ("Fotgängaren väntar vid röd signal.", "Пішохід чекає на червоне світло."),
                    ("Var försiktig när du går som fotgängare.", "Будь обережним, коли йдеш як пішохід.")
                ]),
                Question(expression: "дорожній знак", translation: "en vägskylt", examples: [
                    ("Vägskylten visar hastighetsgränsen.", "Дорожній знак показує обмеження швидкості."),
                    ("Jag såg en vägskylt som pekar mot Stockholm.", "Я бачив дорожній знак, що вказує на Стокгольм."),
                    ("Vägskyltar hjälper bilförare.", "Дорожні знаки допомагають водіям."),
                    ("Den här vägskylten är gammal.", "Цей дорожній знак старий.")
                ]),
                Question(expression: "світлофор", translation: "ett trafikljus", examples: [
                    ("Trafikljuset är rött.", "Світлофор червоний."),
                    ("Jag väntar på grönt ljus.", "Я чекаю зеленого світла."),
                    ("Trafikljus reglerar trafiken.", "Світлофор регулює рух."),
                    ("Bilisten stannar vid trafikljuset.", "Водій зупиняється біля світлофора.")
                ]),
                Question(expression: "автострада", translation: "en motorväg", examples: [
                    ("Motorvägen är bred.", "Автострада широка."),
                    ("Vi kör på motorvägen.", "Ми їдемо по автостраді."),
                    ("Motorvägar har hög hastighet.", "На автострадах висока швидкість."),
                    ("Det är mycket trafik på motorvägen.", "На автостраді багато машин.")
                ]),
                Question(expression: "залізнична станція", translation: "en tågstation", examples: [
                    ("Jag väntar på tåget på tågstationen.", "Я чекаю на поїзд на вокзалі."),
                    ("Tågstationen är stor.", "Залізнична станція велика."),
                    ("Det finns en butik på tågstationen.", "На вокзалі є магазин."),
                    ("Tågstationen har flera perronger.", "На залізничній станції є кілька платформ.")
                ]),
                Question(expression: "поромний термінал", translation: "en färjeterminal", examples: [
                    ("Vi väntar på färjan vid färjeterminalen.", "Ми чекаємо на пором у поромному терміналі."),
                    ("Färjeterminalen är full av resenärer.", "Поромний термінал заповнений пасажирами."),
                    ("Det finns en restaurang vid färjeterminalen.", "У поромному терміналі є ресторан."),
                    ("Vi checkar in vid färjeterminalen.", "Ми реєструємось у поромному терміналі.")
                ]),
                Question(expression: "вокзал", translation: "en järnvägsstation", examples: [
                    ("Järnvägsstationen ligger i centrum.", "Вокзал розташований у центрі."),
                    ("Vi köpte biljetter på järnvägsstationen.", "Ми купили квитки на вокзалі."),
                    ("Tågen avgår från järnvägsstationen.", "Поїзди відправляються з вокзалу."),
                    ("Järnvägsstationen har många perronger.", "Вокзал має багато платформ.")
                ]),
                Question(expression: "злітна смуга", translation: "en landningsbana", examples: [
                    ("Flygplanet landar på landningsbanan.", "Літак приземляється на злітній смузі."),
                    ("Landningsbanan är mycket lång.", "Злітна смуга дуже довга."),
                    ("Piloten förbereder sig för att landa på landningsbanan.", "Пілот готується до посадки на злітній смузі."),
                    ("Vi ser flygplan starta från landningsbanan.", "Ми бачимо, як літаки злітають зі злітної смуги.")
                ]),
                Question(expression: "автостоянка", translation: "en parkering", examples: [
                    ("Jag parkerade bilen på parkeringen.", "Я припаркував машину на автостоянці."),
                    ("Det finns ingen plats på parkeringen.", "На парковці немає місць."),
                    ("Parkeringen är underjordisk.", "Парковка підземна."),
                    ("Vi måste betala för parkeringen.", "Ми повинні заплатити за парковку.")
                ]),
                Question(expression: "підземний перехід", translation: "en gångtunnel", examples: [
                    ("Vi går genom gångtunneln.", "Ми йдемо через підземний перехід."),
                    ("Gångtunneln är väl upplyst.", "Підземний перехід добре освітлений."),
                    ("Det är säkrare att använda gångtunneln.", "Безпечніше користуватися підземним переходом."),
                    ("Gångtunneln förbinder två delar av staden.", "Підземний перехід з'єднує дві частини міста.")
                ]),
                Question(expression: "пішохідний перехід", translation: "ett övergångsställe", examples: [
                    ("Fotgängare använder övergångsstället.", "Пішоходи користуються пішохідним переходом."),
                    ("Övergångsstället har trafikljus.", "Пішохідний перехід має світлофор."),
                    ("Vi väntar på grönt ljus vid övergångsstället.", "Ми чекаємо зеленого світла на пішохідному переході."),
                    ("Bilar måste stanna vid övergångsstället.", "Автомобілі повинні зупинятися на пішохідному переході.")
                ]),
                Question(expression: "авіакомпанія", translation: "ett flygbolag", examples: [
                    ("SAS är ett svenskt flygbolag.", "SAS — це шведська авіакомпанія."),
                    ("Jag bokade en biljett med ett billigt flygbolag.", "Я забронював квиток у дешевій авіакомпанії."),
                    ("Flygbolaget erbjuder gratis bagage.", "Авіакомпанія пропонує безкоштовний багаж."),
                    ("Flygbolaget har många internationella rutter.", "Авіакомпанія має багато міжнародних маршрутів.")
                ]),
                Question(expression: "залізнична колія", translation: "ett järnvägsspår", examples: [
                    ("Tåget åker på järnvägsspåret.", "Поїзд їде по залізничній колії."),
                    ("Järnvägsspåren måste underhållas regelbundet.", "Залізничні колії потрібно регулярно обслуговувати."),
                    ("Vi såg en lång godsvagn på järnvägsspåret.", "Ми бачили довгий вантажний вагон на залізничній колії."),
                    ("Järnvägsspåren leder till stationen.", "Залізничні колії ведуть до вокзалу.")
                ]),
                Question(expression: "заправна станція", translation: "en bensinstation", examples: [
                    ("Vi måste stanna vid en bensinstation.", "Нам потрібно зупинитися на заправці."),
                    ("Bensinstationen säljer också mat.", "На заправці також продається їжа."),
                    ("Jag tankar bilen på bensinstationen.", "Я заправляю машину на заправці."),
                    ("Bensinstationen ligger nära motorvägen.", "Заправка знаходиться біля автостради.")
                ]),
                Question(expression: "пасажир", translation: "en passagerare", examples: [
                    ("Passagerarna väntar på bussen.", "Пасажири чекають на автобус."),
                    ("Tåget har många passagerare.", "Поїзд має багато пасажирів."),
                    ("Flygplanet kan ta 200 passagerare.", "Літак може перевозити 200 пасажирів."),
                    ("Passagerarna måste ha biljetter.", "Пасажири повинні мати квитки.")
                ]),
                Question(expression: "квитковий автомат", translation: "en biljettautomat", examples: [
                    ("Biljettautomaten är ur funktion.", "Квитковий автомат не працює."),
                    ("Jag köpte en biljett i biljettautomaten.", "Я купив квиток у квитковому автоматі."),
                    ("Biljettautomaten finns vid stationen.", "Квитковий автомат знаходиться на станції."),
                    ("Man kan betala med kort i biljettautomaten.", "У квитковому автоматі можна розраховуватися карткою.")
                ]),
                Question(expression: "вантажний потяг", translation: "ett godståg", examples: [
                    ("Ett långt godståg passerade stationen.", "Довгий вантажний поїзд проїхав станцію."),
                    ("Godståget transporterar varor.", "Вантажний поїзд перевозить товари."),
                    ("Vi såg ett godståg vid järnvägen.", "Ми бачили вантажний поїзд біля залізниці."),
                    ("Godståg används ofta för långa transporter.", "Вантажні поїзди часто використовуються для далеких перевезень.")
                ]),
                Question(expression: "рятувальний човен", translation: "en livbåt", examples: [
                    ("Färjan har flera livbåtar.", "Пором має кілька рятувальних човнів."),
                    ("Livbåten kan rädda många människor.", "Рятувальний човен може врятувати багато людей."),
                    ("Besättningen kontrollerar livbåtarna.", "Екіпаж перевіряє рятувальні човни."),
                    ("Livbåtar används vid nödsituationer.", "Рятувальні човни використовуються у надзвичайних ситуаціях.")
                ])
            ],
        
            .numbers: [
                Question(expression: "нуль", translation: "noll", examples: [
                    ("Det finns noll äpplen kvar.", "Залишилося нуль яблук."),
                    ("Hon har noll tålamod.", "Вона має нуль терпіння."),
                    ("Noll grader är fryspunkten.", "Нуль градусів – це точка замерзання."),
                    ("Vi fick noll poäng.", "Ми отримали нуль балів.")
                ]),
                Question(expression: "один", translation: "ett", examples: [
                    ("Jag har ett hus.", "Я маю один будинок."),
                    ("Han drack ett glas vatten.", "Він випив один стакан води."),
                    ("Ett problem i taget.", "Одна проблема за раз."),
                    ("Vi behöver ett svar.", "Нам потрібна одна відповідь.")
                ]),
                Question(expression: "два", translation: "två", examples: [
                    ("Jag har två katter.", "У мене є дві кішки."),
                    ("Vi behöver två biljetter.", "Нам потрібно два квитки."),
                    ("Han har två bröder.", "У нього є два брати."),
                    ("Hon köpte två böcker.", "Вона купила дві книги.")
                ]),
                Question(expression: "три", translation: "tre", examples: [
                    ("Vi är tre personer här.", "Нас тут троє."),
                    ("Han har tre systrar.", "У нього три сестри."),
                    ("Tre dagar kvar till semestern.", "Залишилося три дні до відпустки."),
                    ("Jag såg tre fåglar.", "Я бачив трьох птахів.")
                ]),
                Question(expression: "чотири", translation: "fyra", examples: [
                    ("Bussen kommer om fyra minuter.", "Автобус прибуде за чотири хвилини."),
                    ("Vi har fyra rum i huset.", "У нас у будинку чотири кімнати."),
                    ("Hon köpte fyra äpplen.", "Вона купила чотири яблука."),
                    ("Det är fyra grader ute.", "Зовні чотири градуси.")
                ]),
                Question(expression: "п'ять", translation: "fem", examples: [
                    ("Jag har fem vänner.", "У мене п’ять друзів."),
                    ("Hon läste fem böcker i somras.", "Вона прочитала п’ять книг цього літа."),
                    ("Fem minuter kvar.", "Залишилося п’ять хвилин."),
                    ("Vi har fem problem att lösa.", "У нас є п’ять проблем, які потрібно вирішити.")
                ]),
                Question(expression: "шість", translation: "sex", examples: [
                    ("Jag vaknade klockan sex.", "Я прокинувся о шостій годині."),
                    ("Hon har sex kattungar.", "У неї шість кошенят."),
                    ("Det är sex personer i rummet.", "У кімнаті шість осіб."),
                    ("Vi behöver sex biljetter.", "Нам потрібно шість квитків.")
                ]),
                Question(expression: "сім", translation: "sju", examples: [
                    ("Tåget avgår klockan sju.", "Поїзд відправляється о сьомій."),
                    ("Vi har sju dagar på oss.", "У нас є сім днів."),
                    ("Sju elever var sjuka idag.", "Сім учнів сьогодні хворіли."),
                    ("Hon har sju böcker i sin väska.", "У неї в сумці сім книг.")
                ]),
                Question(expression: "вісім", translation: "åtta", examples: [
                    ("Vi börjar jobbet klockan åtta.", "Ми починаємо роботу о восьмій."),
                    ("Det finns åtta stolar i rummet.", "У кімнаті є вісім стільців."),
                    ("Hon har åtta kusiner.", "У неї вісім кузенів."),
                    ("Åtta personer kom till mötet.", "Вісім осіб прийшли на зустріч.")
                ]),
                Question(expression: "дев'ять", translation: "nio", examples: [
                    ("Vi måste vakna klockan nio.", "Нам потрібно прокинутися о дев’ятій."),
                    ("Hon har nio mål att uppnå.", "У неї дев’ять цілей для досягнення."),
                    ("Nio barn lekte i parken.", "Дев’ять дітей гралися у парку."),
                    ("Han sprang nio kilometer.", "Він пробіг дев’ять кілометрів.")
                ]),
                Question(expression: "десять", translation: "tio", examples: [
                    ("Jag har tio fingrar.", "У мене десять пальців."),
                    ("Det är tio grader ute.", "Зовні десять градусів."),
                    ("Hon läste tio sidor av boken.", "Вона прочитала десять сторінок книги."),
                    ("Vi har tio uppgifter att göra.", "У нас є десять завдань, які потрібно виконати.")
                ]),
                Question(expression: "сто", translation: "ett hundra", examples: [
                    ("Det finns hundra sidor i boken.", "У книзі сто сторінок."),
                    ("Jag har hundra kronor.", "У мене є сто крон."),
                    ("Rummet är hundra kvadratmeter.", "Кімната має сто квадратних метрів."),
                    ("Vi sålde hundra biljetter.", "Ми продали сто квитків.")
                ]),
                Question(expression: "сто сімдесят", translation: "etthundrasjuttio", examples: [
                    ("Huset kostar etthundrasjuttio tusen kronor.", "Будинок коштує сто сімдесят тисяч крон."),
                    ("Det är etthundrasjuttio dagar kvar till sommaren.", "До літа залишилося сто сімдесят днів."),
                    ("Hon sprang etthundrasjuttio meter.", "Вона пробігла сто сімдесят метрів."),
                    ("Jag har etthundrasjuttio e-postmeddelanden.", "У мене сто сімдесят електронних листів.")
                ]),
                Question(expression: "двісті", translation: "tvåhundra", examples: [
                    ("Boken kostar tvåhundra kronor.", "Книга коштує двісті крон."),
                    ("Jag har tvåhundra vänner på sociala medier.", "У мене двісті друзів у соцмережах."),
                    ("Vi reste tvåhundra kilometer.", "Ми подорожували двісті кілометрів."),
                    ("Det finns tvåhundra träd i parken.", "У парку є двісті дерев.")
                ]),
                Question(expression: "п’ятсот", translation: "femhundra", examples: [
                    ("Han tjänar femhundra kronor per dag.", "Він заробляє п’ятсот крон на день."),
                    ("Vi behöver femhundra volontärer.", "Нам потрібно п’ятсот волонтерів."),
                    ("Bilen körde femhundra kilometer.", "Автомобіль проїхав п’ятсот кілометрів."),
                    ("Hon har femhundra följare.", "У неї п’ятсот підписників.")
                ]),
                Question(expression: "тисяча", translation: "ett tusen", examples: [
                    ("Jag har tusen kronor.", "У мене є тисяча крон."),
                    ("Det bor tusen personer i byn.", "У селі живе тисяча людей."),
                    ("Hon har tusen idéer.", "У неї тисяча ідей."),
                    ("Boken har tusen sidor.", "Книга має тисячу сторінок.")
                ]),
                Question(expression: "дві тисячі", translation: "tvåtusen", examples: [
                    ("Det finns tvåtusen elever på skolan.", "У школі навчається дві тисячі учнів."),
                    ("Jag sprang tvåtusen meter.", "Я пробіг дві тисячі метрів."),
                    ("Vi har tvåtusen böcker i biblioteket.", "У бібліотеці є дві тисячі книг."),
                    ("Stadens befolkning är tvåtusen personer.", "Населення міста – дві тисячі осіб.")
                ]),
                Question(expression: "десять тисяч", translation: "tiotusen", examples: [
                    ("Han vann tiotusen kronor.", "Він виграв десять тисяч крон."),
                    ("Det är tiotusen steg till toppen.", "До вершини десять тисяч кроків."),
                    ("Hon har tiotusen följare på Instagram.", "У неї десять тисяч підписників в Instagram."),
                    ("Vi tryckte tiotusen exemplar av boken.", "Ми надрукували десять тисяч примірників книги.")
                ]),
                Question(expression: "сто тисяч", translation: "etthundratusen", examples: [
                    ("Stadens befolkning är etthundratusen personer.", "Населення міста – сто тисяч осіб."),
                    ("Vi samlade in etthundratusen kronor till välgörenhet.", "Ми зібрали сто тисяч крон на благодійність."),
                    ("Boken såldes i etthundratusen exemplar.", "Книга продалася накладом у сто тисяч примірників."),
                    ("Han sprang etthundratusen meter under året.", "Він пробіг сто тисяч метрів за рік.")
                ]),
                Question(expression: "мільйон", translation: "en miljon", examples: [
                    ("En miljon människor såg filmen.", "Мільйон людей подивилися фільм."),
                    ("Han tjänade en miljon kronor på ett år.", "Він заробив мільйон крон за рік."),
                    ("Vi donerade en miljon kronor.", "Ми пожертвували мільйон крон."),
                    ("Hon har en miljon idéer.", "У неї мільйон ідей.")
                ]),
                Question(expression: "два мільйони", translation: "två miljoner", examples: [
                    ("Det bor två miljoner människor i staden.", "У місті живе два мільйони людей."),
                    ("Företaget sålde två miljoner produkter.", "Компанія продала два мільйони товарів."),
                    ("Han vann två miljoner i lotteriet.", "Він виграв два мільйони в лотерею."),
                    ("Filmen hade två miljoner tittare.", "Фільм подивилися два мільйони глядачів.")
                ]),
                Question(expression: "десять мільйонів", translation: "tio miljoner", examples: [
                    ("Det finns tio miljoner invånare i landet.", "У країні проживає десять мільйонів мешканців."),
                    ("Tio miljoner människor såg matchen.", "Десять мільйонів людей дивилися матч."),
                    ("Boken såldes i tio miljoner exemplar.", "Книга продалася накладом у десять мільйонів примірників."),
                    ("Företaget omsatte tio miljoner kronor.", "Компанія мала обіг у десять мільйонів крон.")
                ]),
                Question(expression: "сто мільйонів", translation: "etthundra miljoner", examples: [
                    ("Etthundra miljoner människor talar språket.", "Сто мільйонів людей говорять цією мовою."),
                    ("Han tjänade etthundra miljoner kronor.", "Він заробив сто мільйонів крон."),
                    ("Bolaget har etthundra miljoner användare.", "Компанія має сто мільйонів користувачів."),
                    ("Filmen såldes för etthundra miljoner kronor.", "Фільм був проданий за сто мільйонів крон.")
                ]),
                Question(expression: "мільярд", translation: "en miljard", examples: [
                    ("Det finns en miljard stjärnor på himlen.", "На небі є мільярд зірок."),
                    ("Han äger en miljard kronor.", "Він володіє мільярдом крон."),
                    ("En miljard människor använder appen.", "Мільярд людей користуються додатком."),
                    ("Företaget är värt en miljard kronor.", "Компанія коштує мільярд крон.")
                ]),
                Question(expression: "два мільярди", translation: "två miljarder", examples: [
                    ("Två miljarder människor använder internet.", "Два мільярди людей користуються інтернетом."),
                    ("Företaget har två miljarder kronor i omsättning.", "Компанія має два мільярди крон обороту."),
                    ("Två miljarder träd planteras varje år.", "Щороку висаджують два мільярди дерев."),
                    ("Världens befolkning ökar med två miljarder på några decennier.", "Населення світу зросте на два мільярди за кілька десятиліть.")
                ])
            ],
        
            .ordinalNumbers: [
                Question(expression: "перший", translation: "första", examples: [
                    ("Han kom på första plats.", "Він зайняв перше місце."),
                    ("Det är första gången jag är här.", "Це перший раз, коли я тут."),
                    ("Hon bor på första våningen.", "Вона живе на першому поверсі."),
                    ("Första intrycket är viktigt.", "Перше враження важливе.")
                ]),
                Question(expression: "другий", translation: "andra", examples: [
                    ("Hon blev tvåa i tävlingen.", "Вона стала другою у змаганнях."),
                    ("Andra världskriget började 1939.", "Друга світова війна почалася у 1939 році."),
                    ("Vi bor på andra våningen.", "Ми живемо на другому поверсі."),
                    ("Andra dagen på jobbet var lättare.", "Другий день на роботі був легшим.")
                ]),
                Question(expression: "третій", translation: "tredje", examples: [
                    ("Han slutade på tredje plats.", "Він фінішував третім."),
                    ("Vi bor på tredje våningen.", "Ми живемо на третьому поверсі."),
                    ("Detta är tredje gången vi träffas.", "Це третій раз, коли ми зустрічаємось."),
                    ("Han har en tredje bror.", "У нього є третій брат.")
                ]),
                Question(expression: "четвертий", translation: "fjärde", examples: [
                    ("Detta är mitt fjärde år på universitetet.", "Це мій четвертий рік в університеті."),
                    ("Hon bor på fjärde våningen.", "Вона живе на четвертому поверсі."),
                    ("Han blev fjärde i tävlingen.", "Він став четвертим у змаганні."),
                    ("Fjärde kapitlet handlar om historia.", "Четвертий розділ про історію.")
                ]),
                Question(expression: "п’ятий", translation: "femte", examples: [
                    ("Det är den femte dagen på resan.", "Це п’ятий день подорожі."),
                    ("Vi träffades på femte gatan.", "Ми зустрілися на п’ятій вулиці."),
                    ("Hon kom femte i loppet.", "Вона фінішувала п’ятою у забігу."),
                    ("Femte våningen har en fantastisk utsikt.", "П’ятий поверх має фантастичний вид.")
                ]),
                Question(expression: "шостий", translation: "sjätte", examples: [
                    ("Detta är den sjätte gången vi ses.", "Це шостий раз, коли ми бачимося."),
                    ("Han bor på sjätte våningen.", "Він живе на шостому поверсі."),
                    ("Sjätte kapitlet handlar om vetenskap.", "Шостий розділ про науку."),
                    ("Sjätte sinnet är intuition.", "Шосте відчуття – це інтуїція.")
                ]),
                Question(expression: "сьомий", translation: "sjunde", examples: [
                    ("Han föddes den sjunde juli.", "Він народився сьомого липня."),
                    ("Vi kom sjunde i turneringen.", "Ми зайняли сьоме місце у турнірі."),
                    ("Detta är sjunde gången han försöker.", "Це сьомий раз, коли він пробує."),
                    ("Hon bor på sjunde våningen.", "Вона живе на сьомому поверсі.")
                ]),
                Question(expression: "восьмий", translation: "åttonde", examples: [
                    ("Vi träffas den åttonde mars.", "Ми зустрінемося восьмого березня."),
                    ("Det är den åttonde filmen i serien.", "Це восьмий фільм у серії."),
                    ("Han bor på åttonde våningen.", "Він живе на восьмому поверсі."),
                    ("Detta är mitt åttonde år i skolan.", "Це мій восьмий рік у школі.")
                ]),
                Question(expression: "дев’ятий", translation: "nionde", examples: [
                    ("Han föddes den nionde oktober.", "Він народився дев’ятого жовтня."),
                    ("Nionde kapitlet är det svåraste.", "Дев’ятий розділ найскладніший."),
                    ("Det är hans nionde bok.", "Це його дев’ята книга."),
                    ("Hon bor på nionde våningen.", "Вона живе на дев’ятому поверсі.")
                ]),
                Question(expression: "десятий", translation: "tionde", examples: [
                    ("Vi kommer tionde i tävlingen.", "Ми зайняли десяте місце у змаганні."),
                    ("Tionde kapitlet handlar om fysik.", "Десятий розділ про фізику."),
                    ("Han bor på tionde våningen.", "Він живе на десятому поверсі."),
                    ("Det är tionde gången han försöker.", "Це десятий раз, коли він пробує.")
                ]),
                Question(expression: "одинадцятий", translation: "elfte", examples: [
                    ("Han är född den elfte november.", "Він народився одинадцятого листопада."),
                    ("Det är mitt elfte år i Sverige.", "Це мій одинадцятий рік у Швеції."),
                    ("Hon bor på elfte våningen.", "Вона живе на одинадцятому поверсі."),
                    ("Detta är hans elfte bok.", "Це його одинадцята книга.")
                ]),
                Question(expression: "дванадцятий", translation: "tolfte", examples: [
                    ("Det är den tolfte dagen på semestern.", "Це дванадцятий день відпустки."),
                    ("Vi firar tolfte bröllopsdagen.", "Ми святкуємо дванадцяту річницю весілля."),
                    ("Han bor på tolfte våningen.", "Він живе на дванадцятому поверсі."),
                    ("Detta är hans tolfte projekt.", "Це його дванадцятий проект.")
                ]),
                Question(expression: "двадцятий", translation: "tjugonde", examples: [
                    ("Vi ses den tjugonde juni.", "Ми зустрінемося двадцятого червня."),
                    ("Han bor på tjugonde våningen.", "Він живе на двадцятому поверсі."),
                    ("Det är den tjugonde sidan i boken.", "Це двадцята сторінка книги."),
                    ("Hon firar sin tjugonde födelsedag.", "Вона святкує свій двадцятий день народження.")
                ]),
                Question(expression: "тридцятий", translation: "trettionde", examples: [
                    ("Han kom trettionde i loppet.", "Він фінішував тридцятим у забігу."),
                    ("Det är den trettionde dagen på resan.", "Це тридцятий день подорожі."),
                    ("Hon bor på trettionde våningen.", "Вона живе на тридцятому поверсі."),
                    ("Vi firar den trettionde årsdag.", "Ми святкуємо тридцяту річницю.")
                ]),
                Question(expression: "сотий", translation: "hundrade", examples: [
                    ("Det är hans hundrade dag på jobbet.", "Це його сотий день на роботі."),
                    ("Vi firar företagets hundrade årsdag.", "Ми святкуємо соту річницю компанії."),
                    ("Han fick sin hundrade kund i år.", "Він отримав свого сотого клієнта цього року."),
                    ("Det här är min hundrade bok jag läser.", "Це моя сота книга, яку я читаю.")
                ]),
                Question(expression: "двохсотий", translation: "tvåhundrade", examples: [
                    ("Det är hans tvåhundrade match i karriären.", "Це його двохсотий матч у кар'єрі."),
                    ("Vi bor i den tvåhundrade lägenheten.", "Ми живемо у двохсотій квартирі."),
                    ("Han skrev sitt tvåhundrade blogginlägg idag.", "Він написав сьогодні свій двохсотий блог."),
                    ("Det är den tvåhundrade sidan i boken.", "Це двохсота сторінка книги.")
                ]),
                Question(expression: "тисячний", translation: "tusende", examples: [
                    ("Han blev butikens tusende kund.", "Він став тисячним клієнтом магазину."),
                    ("Det här är mitt tusende inlägg på sociala medier.", "Це моя тисячна публікація у соцмережах."),
                    ("Staden firar sitt tusende år.", "Місто святкує своє тисячоліття."),
                    ("Det är den tusende gången vi pratar om detta.", "Це тисячний раз, коли ми про це говоримо.")
                ]),
                Question(expression: "мільйонний", translation: "miljonte", examples: [
                    ("Hon var den miljonte besökaren på museet.", "Вона була мільйонним відвідувачем музею."),
                    ("Företaget sålde sin miljonte produkt i år.", "Компанія продала свій мільйонний товар цього року."),
                    ("Det är den miljonte gången han berättar samma historia.", "Це мільйонний раз, коли він розповідає ту саму історію."),
                    ("Han skrev sitt miljonte ord i romanen.", "Він написав своє мільйонне слово в романі.")
                ])
            ],
            .interrogativePronouns: [
                Question(expression: "хто", translation: "vem", examples: [
                    ("Vem är du?", "Хто ти?"),
                    ("Vem vann tävlingen?", "Хто виграв змагання?"),
                    ("Vem ringer du?", "Кому ти телефонуєш?"),
                    ("Vem bor i detta hus?", "Хто живе в цьому будинку?")
                ]),
                Question(expression: "що", translation: "vad", examples: [
                    ("Vad heter du?", "Як тебе звати?"),
                    ("Vad gör du?", "Що ти робиш?"),
                    ("Vad är det där?", "Що це таке?"),
                    ("Vad vill du äta?", "Що ти хочеш їсти?")
                ]),
                Question(expression: "де", translation: "var", examples: [
                    ("Var är du?", "Де ти?"),
                    ("Var ligger banken?", "Де знаходиться банк?"),
                    ("Var bor du?", "Де ти живеш?"),
                    ("Var är min bok?", "Де моя книга?")
                ]),
                Question(expression: "куди", translation: "vart", examples: [
                    ("Vart ska du?", "Куди ти йдеш?"),
                    ("Vart reser ni i sommar?", "Куди ви подорожуєте цього літа?"),
                    ("Vart flyttade de?", "Куди вони переїхали?"),
                    ("Vart går den här bussen?", "Куди їде цей автобус?")
                ]),
                Question(expression: "звідки", translation: "varifrån", examples: [
                    ("Varifrån kommer du?", "Звідки ти?"),
                    ("Varifrån fick du denna information?", "Звідки ти отримав цю інформацію?"),
                    ("Varifrån är den här bilen?", "Звідки ця машина?"),
                    ("Varifrån reser du?", "Звідки ти подорожуєш?")
                ]),
                Question(expression: "коли", translation: "när", examples: [
                    ("När börjar filmen?", "Коли починається фільм?"),
                    ("När är ditt födelsedatum?", "Коли у тебе день народження?"),
                    ("När träffades ni?", "Коли ви зустрілися?"),
                    ("När öppnar butiken?", "Коли відкривається магазин?")
                ]),
                Question(expression: "чому", translation: "varför", examples: [
                    ("Varför är du sen?", "Чому ти запізнився?"),
                    ("Varför studerar du svenska?", "Чому ти вчиш шведську?"),
                    ("Varför skrattar du?", "Чому ти смієшся?"),
                    ("Varför är han arg?", "Чому він сердитий?")
                ]),
                Question(expression: "як", translation: "hur", examples: [
                    ("Hur mår du?", "Як ти себе почуваєш?"),
                    ("Hur fungerar det?", "Як це працює?"),
                    ("Hur gammal är du?", "Скільки тобі років?"),
                    ("Hur långt är det till stationen?", "Як далеко до станції?")
                ]),
                Question(expression: "скільки", translation: "hur mycket", examples: [
                    ("Hur mycket kostar det?", "Скільки це коштує?"),
                    ("Hur mycket tid har vi?", "Скільки у нас часу?"),
                    ("Hur mycket socker vill du ha?", "Скільки цукру ти хочеш?"),
                    ("Hur mycket vatten dricker du per dag?", "Скільки води ти п'єш на день?")
                ]),
                Question(expression: "скільки (лічильний)", translation: "hur många", examples: [
                    ("Hur många syskon har du?", "Скільки у тебе братів і сестер?"),
                    ("Hur många böcker har du?", "Скільки у тебе книг?"),
                    ("Hur många timmar tar resan?", "Скільки годин триває подорож?"),
                    ("Hur många elever är i klassen?", "Скільки учнів у класі?")
                ]),
                Question(expression: "який", translation: "vilken", examples: [
                    ("Vilken bok vill du läsa?", "Яку книгу ти хочеш прочитати?"),
                    ("Vilket språk talar du?", "Якою мовою ти говориш?"),
                    ("Vilka länder har du besökt?", "Які країни ти відвідав?"),
                    ("Vilken färg tycker du om?", "Який колір тобі подобається?")
                ]),
                Question(expression: "чий", translation: "vems", examples: [
                    ("Vems bil är det?", "Чия це машина?"),
                    ("Vems bok ligger här?", "Чия книга тут лежить?"),
                    ("Vems idé var det?", "Чия це була ідея?"),
                    ("Vems hund är det?", "Чий це собака?")
                ]),
                Question(expression: "який", translation: "hurdan", examples: [
                    ("Hurdan är din nya lägenhet?", "Яка твоя нова квартира?"),
                    ("Hurdant väder är det idag?", "Яка сьогодні погода?"),
                    ("Hurdana är dina vänner?", "Які твої друзі?"),
                    ("Hurdan är din bil?", "Яка твоя машина?")
                ])
            ],
        
            .law: [
                Question(expression: "закон", translation: "en lag", examples: [
                    ("Det är en viktig lag i Sverige.", "Це важливий закон у Швеції."),
                    ("Vi måste följa lagen.", "Ми повинні дотримуватись закону."),
                    ("Lagen gäller för alla.", "Закон стосується всіх."),
                    ("Han bryter mot lagen.", "Він порушує закон.")
                ]),
                Question(expression: "суд", translation: "en domstol", examples: [
                    ("Han gick till domstolen.", "Він пішов до суду."),
                    ("Domstolen beslutade att han var oskyldig.", "Суд вирішив, що він невинний."),
                    ("Domstolen kommer att avgöra fallet.", "Суд ухвалить рішення по справі."),
                    ("Vi ska ha en domstolsförhandling imorgon.", "Завтра ми будемо мати судове засідання.")
                ]),
                Question(expression: "адвокат", translation: "en advokat", examples: [
                    ("Jag har en advokat.", "У мене є адвокат."),
                    ("Hon arbetar som advokat.", "Вона працює адвокатом."),
                    ("Han anlitade en advokat.", "Він найняв адвоката."),
                    ("Advokaten gav mig bra råd.", "Адвокат дав мені хорошу пораду.")
                ]),
                Question(expression: "позов", translation: "en ansökan", examples: [
                    ("Han lämnade in en ansökan till domstolen.", "Він подав позов до суду."),
                    ("Det är en stor ansökan.", "Це великий позов."),
                    ("Han har inte fått svar på sin ansökan.", "Він не отримав відповіді на свій позов."),
                    ("Ansökan godkändes av domstolen.", "Позов був схвалений судом.")
                ]),
                Question(expression: "суддя", translation: "en domare", examples: [
                    ("Domaren var mycket rättvis.", "Суддя був дуже справедливий."),
                    ("Domaren avslog överklagandet.", "Суддя відхилив апеляцію."),
                    ("Domaren dömde honom till fängelse.", "Суддя засудив його до в'язниці."),
                    ("Domaren leder rättegången.", "Суддя веде судове засідання.")
                ]),
                Question(expression: "покарання", translation: "ett straff", examples: [
                    ("Straffet var mycket strängt.", "Покарання було дуже суворим."),
                    ("Han fick ett lindrigare straff.", "Він отримав більш м'яке покарання."),
                    ("Straffet för brottet är fängelse.", "Покарання за злочин — це в'язниця."),
                    ("Det finns olika typer av straff.", "Існують різні види покарань.")
                ]),
                Question(expression: "права", translation: "rättigheter", examples: [
                    ("Alla har samma rättigheter.", "Усі мають однакові права."),
                    ("Vi måste skydda våra rättigheter.", "Ми повинні захищати наші права."),
                    ("Han kämpade för sina rättigheter.", "Він боровся за свої права."),
                    ("Rättigheterna skyddas av lagen.", "Права захищені законом.")
                ]),
                Question(expression: "обвинувачення", translation: "en anklagelse", examples: [
                    ("Anklagelsen var allvarlig.", "Обвинувачення було серйозним."),
                    ("Han förnekade anklagelsen.", "Він заперечував обвинувачення."),
                    ("Anklagelsen mot honom var falsk.", "Обвинувачення проти нього було неправдивим."),
                    ("Rättegången handlade om en allvarlig anklagelse.", "Судовий процес стосувався серйозного обвинувачення.")
                ]),
                Question(expression: "свідок", translation: "ett vittne", examples: [
                    ("Vittnet gav sitt vittnesmål.", "Свідок дав своє свідчення."),
                    ("Han var ett vittne till olyckan.", "Він був свідком аварії."),
                    ("Vittnet blev kallat till domstolen.", "Свідка викликали до суду."),
                    ("Vittnet berättade vad de hade sett.", "Свідок розповів, що вони бачили.")
                ]),
                Question(expression: "договір", translation: "ett avtal", examples: [
                    ("De undertecknade ett avtal.", "Вони підписали договір."),
                    ("Avtalet gäller i fem år.", "Договір діє протягом п'яти років."),
                    ("De bröt avtalet.", "Вони порушили договір."),
                    ("Avtalet var rättvist för båda parter.", "Договір був справедливим для обох сторін.")
                ]),
                Question(expression: "права людини", translation: "mänskliga rättigheter", examples: [
                    ("Mänskliga rättigheter måste skyddas.", "Права людини повинні бути захищені."),
                    ("Han kämpade för mänskliga rättigheter.", "Він боролся за права людини."),
                    ("Föreläsningen handlade om mänskliga rättigheter.", "Лекція була про права людини."),
                    ("Mänskliga rättigheter är universella.", "Права людини є універсальними.")
                ]),
                Question(expression: "підозра", translation: "en misstanke", examples: [
                    ("Han var under misstanke för brott.", "Він був під підозрою в злочині."),
                    ("Misstanken mot honom var stark.", "Підозра проти нього була сильна."),
                    ("Det finns en misstanke om bedrägeri.", "Є підозра на шахрайство."),
                    ("Polisen hade ingen misstanke om honom.", "Поліція не мала підозри на нього.")
                ]),
                Question(expression: "винувачення", translation: "ett åtal", examples: [
                    ("Åtalet var allvarligt.", "Винувачення було серйозним."),
                    ("Han frikändes från åtalet.", "Його виправдали за звинуваченням."),
                    ("Åtalet väcktes av åklagaren.", "Винувачення було висунуте прокурором."),
                    ("Domstolen behandlade åtalet.", "Суд розглядав звинувачення.")
                ]),
                Question(expression: "відшкодування", translation: "ett skadestånd", examples: [
                    ("Han kräver skadestånd för skadorna.", "Він вимагає відшкодування за збитки."),
                    ("Skadeståndet blev fastställt av domstolen.", "Відшкодування було встановлено судом."),
                    ("Företaget betalade skadestånd.", "Компанія виплатила відшкодування."),
                    ("Hon begärde skadestånd för förlorad inkomst.", "Вона вимагала відшкодування за втрачені доходи.")
                ]),
                Question(expression: "виконання", translation: "ett fullföljande", examples: [
                    ("Fullföljandet av domen är viktigt.", "Виконання вироку є важливим."),
                    ("De fullföljde avtalet utan problem.", "Вони виконали договір без проблем."),
                    ("Fullföljandet av rättsprocessen tog lång tid.", "Виконання судового процесу зайняло багато часу."),
                    ("Fullföljande av alla regler är nödvändigt.", "Виконання всіх правил є необхідним.")
                ]),
                Question(expression: "права власності", translation: "en egendomrätt", examples: [
                    ("Egendomrätten skyddas av lagen.", "Право власності захищається законом."),
                    ("Han har rätt till sin egendom.", "Він має право на свою власність."),
                    ("Domstolen avgjorde tvisten om egendomrätten.", "Суд вирішив спір про право власності."),
                    ("Egendomrätt innebär kontroll över din fastighet.", "Право власності означає контроль над твоєю нерухомістю.")
                ]),
                Question(expression: "порушення", translation: "en Överträdelse", examples: [
                    ("Föraren fick böter för överträdelse av trafikreglerna.", "Водій отримав штраф за порушення правил дорожнього руху."),
                    ("Brott mot tystnadsregler efter 22:00 bestraffas med böter.", "Порушення тиші після 22:00 карається штрафом."),
                    ("Denna avtalsöverträdelse kan leda till uppsägning.", "Це порушення договору може призвести до його анулювання."),
                    ("Domstolen behandlar ett fall av upphovsrättsintrång.", "Суд розглядає справу про порушення авторських прав.")
                ]),
                Question(expression: "відповідальність", translation: "ett ansvar", examples: [
                    ("Han har ett stort ansvar.", "Він має велике відповідальність."),
                    ("Det är mitt ansvar att följa lagen.", "Це моя відповідальність — дотримуватись закону."),
                    ("Företaget har ansvar för sina anställda.", "Компанія несе відповідальність за своїх працівників."),
                    ("Domstolen fastställde hans ansvar för skadorna.", "Суд визначив його відповідальність за збитки.")
                ]),
                Question(expression: "слідчий", translation: "en utredare", examples: [
                    ("Utredaren undersöker fallet.", "Слідчий розслідує справу."),
                    ("Han pratade med utredaren igår.", "Він говорив з слідчим вчора."),
                    ("Utredaren samlade bevis.", "Слідчий зібрав докази."),
                    ("Utredaren arbetade lång tid på fallet.", "Слідчий працював над справою довгий час.")
                ]),
                Question(expression: "злочин", translation: "ett brott", examples: [
                    ("Han åtalades för ett brott.", "Його звинуватили у злочині."),
                    ("Brottet begicks på natten.", "Злочин був скоєний вночі."),
                    ("Det är ett allvarligt brott.", "Це серйозний злочин."),
                    ("Polisen utreder brottet.", "Поліція розслідує злочин.")
                ]),
                Question(expression: "свідчення", translation: "ett vittnesmål", examples: [
                    ("Vittnesmålet var avgörande för fallet.", "Свідчення були вирішальними для справи."),
                    ("Hans vittnesmål var trovärdigt.", "Його свідчення були правдоподібними."),
                    ("Vittnesmålet presenterades i domstolen.", "Свідчення були представлені в суді."),
                    ("Domaren lyssnade på vittnesmålet.", "Суддя вислухав свідчення.")
                ]),
                Question(expression: "обвинувач", translation: "en åklagare", examples: [
                    ("Åklagaren lade fram bevisen.", "Прокурор надав докази."),
                    ("Åklagaren ville att han skulle dömas.", "Прокурор хотів, щоб його засудили."),
                    ("Åklagaren representerade staten i rättegången.", "Прокурор представляв державу в суді."),
                    ("Han hade en diskussion med åklagaren.", "Він мав розмову з прокурором.")
                ]),
                Question(expression: "справа", translation: "ett mål", examples: [
                    ("Rättegången handlar om ett stort mål.", "Судова справа стосується великої справи."),
                    ("Domstolen beslutade i målet.", "Суд ухвалив рішення по справі."),
                    ("Det är ett komplicerat mål.", "Це складна справа."),
                    ("Vi har en rättsprocess på gång.", "У нас є поточна судова справа.")
                ]),
                Question(expression: "ухвала", translation: "en dom", examples: [
                    ("Domaren lämnade en dom.", "Суддя виніс вирок."),
                    ("Domen var mycket tydlig.", "Вирок був дуже чітким."),
                    ("De överklagade domen.", "Вони подали апеляцію на вирок."),
                    ("Domen ska verkställas nästa vecka.", "Вирок буде виконано наступного тижня.")
                ]),
                Question(expression: "співучасть", translation: "en medverkan", examples: [
                    ("Hans medverkan i brottet var avgörande.", "Його участь у злочині була вирішальною."),
                    ("De misstänker hans medverkan.", "Вони підозрюють його участь."),
                    ("Medverkan i brott kan leda till straff.", "Участь у злочині може призвести до покарання."),
                    ("Han nekade till sin medverkan.", "Він заперечував свою участь.")
                ]),
                Question(expression: "захист", translation: "ett försvar", examples: [
                    ("Han hade ett starkt försvar.", "Він мав сильний захист."),
                    ("Försvaret hävdade att han var oskyldig.", "Захист стверджував, що він невинний."),
                    ("Advokaten talade för hans försvar.", "Адвокат говорив на його захист."),
                    ("Försvaret presenterade sina bevis.", "Захист представив свої докази.")
                ]),
                Question(expression: "порушення прав", translation: "ett rättighetsbrott", examples: [
                    ("Det var ett allvarligt rättighetsbrott.", "Це було серйозне порушення прав."),
                    ("De anmälde rättighetsbrottet till domstolen.", "Вони подали заяву про порушення прав до суду."),
                    ("Rättighetsbrott kan leda till straff.", "Порушення прав може призвести до покарання."),
                    ("Vi måste skydda våra rättighetsbrott.", "Ми повинні захищати наші порушення прав.")
                ]),
                Question(expression: "слідство", translation: "en utredning", examples: [
                    ("Utredningen pågår fortfarande.", "Розслідування все ще триває."),
                    ("Polisen inledde en utredning.", "Поліція розпочала розслідування."),
                    ("Utredningen ledde till ett gripande.", "Розслідування призвело до арешту."),
                    ("Det är en omfattande utredning.", "Це велике розслідування.")
                ])
            ],
        
            .marketing: [
                Question(expression: "маркетинг", translation: "en marknadsföring", examples: [
                    ("Marknadsföring är viktig för företaget.", "Маркетинг є важливим для компанії."),
                    ("De arbetar med digital marknadsföring.", "Вони працюють з цифровим маркетингом."),
                    ("Marknadsföring handlar om att förstå kunden.", "Маркетинг полягає у розумінні клієнта."),
                    ("Effektiv marknadsföring kan öka försäljningen.", "Ефективний маркетинг може збільшити продажі.")
                ]),
                Question(expression: "реклама", translation: "en reklam", examples: [
                    ("Reklamen nådde många människor.", "Реклама досягла багатьох людей."),
                    ("Vi såg en reklam på tv.", "Ми побачили рекламу по телевізору."),
                    ("Reklamen var mycket kreativ.", "Реклама була дуже креативною."),
                    ("De satsar mycket på online reklam.", "Вони багато інвестують в онлайн-рекламу.")
                ]),
                Question(expression: "цільова аудиторія", translation: "en målgrupp", examples: [
                    ("Målgruppen för denna produkt är unga människor.", "Цільова аудиторія для цього продукту — молоді люди."),
                    ("För att lyckas måste du känna din målgrupp.", "Щоб досягти успіху, потрібно знати свою цільову аудиторію."),
                    ("Målgruppen för vår kampanj är professionella.", "Цільова аудиторія нашої кампанії — професіонали."),
                    ("Marknadsföring bör anpassas till målgruppen.", "Маркетинг має бути адаптований до цільової аудиторії.")
                ]),
                Question(expression: "бренд", translation: "ett varumärke", examples: [
                    ("Apple är ett välkänt varumärke.", "Apple — це відоме брендові."),
                    ("Bilden av varumärket är väldigt viktig.", "Образ бренду дуже важливий."),
                    ("Vi måste bygga ett starkt varumärke.", "Ми повинні побудувати сильний бренд."),
                    ("Varumärket representerar företagets värderingar.", "Бренд представляє цінності компанії.")
                ]),
                Question(expression: "стратегія", translation: "en strategi", examples: [
                    ("Vår marknadsföringsstrategi fokuserar på digitala kanaler.", "Наша маркетингова стратегія орієнтована на цифрові канали."),
                    ("Strategin syftar till att öka marknadsandelen.", "Стратегія спрямована на збільшення частки на ринку."),
                    ("Vi utvecklar en ny strategi för att attrahera kunder.", "Ми розробляємо нову стратегію для залучення клієнтів."),
                    ("Strategin innebär att vi ska öka vår synlighet online.", "Стратегія полягає в тому, щоб збільшити нашу видимість в Інтернеті.")
                ]),
                Question(expression: "кампанія", translation: "en kampanj", examples: [
                    ("Vi lanserade en ny kampanj för produkten.", "Ми запустили нову кампанію для продукту."),
                    ("Kampanjen var mycket framgångsrik.", "Кампанія була дуже успішною."),
                    ("Vi planerar en kampanj för att öka försäljningen.", "Ми плануємо кампанію для збільшення продажів."),
                    ("Kampanjen nådde många människor på sociala medier.", "Кампанія досягла багатьох людей у соціальних мережах.")
                ]),
                Question(expression: "підприємство", translation: "ett företag", examples: [
                    ("Företaget har vuxit snabbt.", "Компанія швидко зростає."),
                    ("Vi har ett framgångsrikt företag.", "Ми маємо успішну компанію."),
                    ("Företaget investerar mycket i marknadsföring.", "Компанія багато інвестує в маркетинг."),
                    ("Företaget fokuserar på hållbarhet.", "Компанія орієнтована на стійкість.")
                ]),
                Question(expression: "ціна", translation: "ett pris", examples: [
                    ("Priset på produkten är konkurrensmässigt.", "Ціна продукту є конкурентною."),
                    ("Vi behöver justera vårt pris för att bli mer konkurrensdugliga.", "Нам потрібно відкоригувати ціну, щоб стати більш конкурентоспроможними."),
                    ("Högt pris kan påverka försäljningen negativt.", "Висока ціна може негативно вплинути на продажі."),
                    ("De erbjöd ett rabatterat pris på produkten.", "Вони запропонували знижку на продукт.")
                ]),
                Question(expression: "переконання", translation: "en övertygelse", examples: [
                    ("Vår övertygelse är att kvalitet är viktigast.", "Наша переконаність полягає в тому, що якість найважливіша."),
                    ("Marknadsföringen bygger på övertygelse om produktens värde.", "Маркетинг ґрунтується на переконанні в цінності продукту."),
                    ("Övertygelse är avgörande för att påverka kunden.", "Переконання є вирішальним для впливу на клієнта."),
                    ("För att lyckas måste du ha en stark övertygelse.", "Щоб досягти успіху, потрібно мати сильну переконаність.")
                ]),
                Question(expression: "публікація", translation: "en publicering", examples: [
                    ("Publiceringen av artikeln var en stor framgång.", "Публікація статті була великим успіхом."),
                    ("Vi planerar en publicering av vår nya rapport.", "Ми плануємо публікацію нашого нового звіту."),
                    ("Publicering på sociala medier är en viktig del av marknadsföring.", "Публікація в соціальних мережах є важливою частиною маркетингу."),
                    ("De förbereder en publicering för att lansera produkten.", "Вони готують публікацію для запуску продукту.")
                ]),
                Question(expression: "клієнт", translation: "en kund", examples: [
                    ("Vår kundservice är tillgänglig dygnet runt.", "Наша служба підтримки клієнтів доступна цілодобово."),
                    ("Kundernas behov är i centrum för vår marknadsföring.", "Потреби клієнтів знаходяться в центрі нашого маркетингу."),
                    ("Vi erbjuder rabatter för våra lojala kunder.", "Ми пропонуємо знижки для наших лояльних клієнтів."),
                    ("Kundfeedback är viktig för att förbättra produkten.", "Зворотній зв'язок від клієнтів важливий для покращення продукту.")
                ]),
                Question(expression: "продаж", translation: "en försäljning", examples: [
                    ("Försäljningen har ökat med 20%.", "Продажі зросли на 20%."),
                    ("Vår försäljningsstrategi är att erbjuda rabatter.", "Наша стратегія продажів полягає в тому, щоб пропонувати знижки."),
                    ("Försäljningen sker både online och i butik.", "Продажі здійснюються як онлайн, так і в магазині."),
                    ("De förutspår en ökning av försäljningen under nästa kvartal.", "Прогнозується збільшення продажів наступного кварталу.")
                ]),
                Question(expression: "ціль", translation: "ett mål", examples: [
                    ("Vårt mål är att öka marknadsandelen.", "Наша мета — збільшити частку на ринку."),
                    ("Vi satte upp tydliga mål för kampanjen.", "Ми визначили чіткі цілі для кампанії."),
                    ("Målet är att förbättra kundnöjdheten.", "Метою є покращення задоволеності клієнтів."),
                    ("Vi arbetar mot våra långsiktiga mål.", "Ми працюємо над досягненням наших довгострокових цілей.")
                ]),
                Question(expression: "аналіз", translation: "en analys", examples: [
                    ("Vi gör en analys av kundbeteendet.", "Ми робимо аналіз поведінки клієнтів."),
                    ("Analysen visar att vi behöver ändra vår strategi.", "Аналіз показує, що нам потрібно змінити стратегію."),
                    ("Analys av marknaden är viktigt för att fatta beslut.", "Аналіз ринку важливий для прийняття рішень."),
                    ("Vi använder analys för att förbättra våra kampanjer.", "Ми використовуємо аналіз для покращення наших кампаній.")
                ]),
                Question(expression: "інтернет-маркетинг", translation: "en internetmarknadsföring", examples: [
                    ("Інтернет-маркетинг став ключовим елементом сучасних стратегій.", "Internetmarknadsföring har blivit en nyckelfaktor i moderna strategier."),
                    ("Ми інвестуємо в інтернет-маркетинг для залучення нових клієнтів.", "Vi investerar i internetmarknadsföring för att attrahera nya kunder."),
                    ("Інтернет-маркетинг включає SEO, рекламу та соціальні мережі.", "Internetmarknadsföring omfattar SEO, annonsering och sociala medier."),
                    ("Успішна кампанія в інтернет-маркетингу може значно збільшити продажі.", "En framgångsrik kampanj inom internetmarknadsföring kan öka försäljningen avsevärt.")
                ]),
                Question(expression: "соціальні мережі", translation: "sociala medier", examples: [
                    ("Соціальні мережі є потужним інструментом для залучення клієнтів.", "Sociala medier är ett kraftfullt verktyg för att attrahera kunder."),
                    ("Ми активно використовуємо соціальні мережі для реклами.", "Vi använder aktivt sociala medier för reklam."),
                    ("Інфлюенсери використовують соціальні мережі для просування товарів.", "Influencers använder sociala medier för att marknadsföra produkter."),
                    ("Соціальні мережі дозволяють здійснювати прямий контакт з клієнтами.", "Sociala medier möjliggör direkt kontakt med kunder.")
                ]),
                Question(expression: "бюджет", translation: "en budget", examples: [
                    ("Ми плануємо розподілити бюджет на маркетинг.", "Vi planerar att fördela budgeten på marknadsföring."),
                    ("Бюджет кампанії обмежений, тому потрібно бути креативними.", "Kampanjens budget är begränsad, så vi måste vara kreativa."),
                    ("Нам потрібно скоротити бюджет на рекламу.", "Vi behöver minska reklamens budget."),
                    ("Бюджет на маркетинг збільшиться наступного року.", "Marknadsföringsbudgeten kommer att öka nästa år.")
                ]),
                Question(expression: "пошукова оптимізація", translation: "en sökmotoroptimering", examples: [
                    ("Пошукова оптимізація є важливою для залучення органічного трафіку.", "Sökmotoroptimering är viktigt för att locka organisk trafik."),
                    ("Ми найняли фахівця для покращення пошукової оптимізації.", "Vi har anställt en specialist för att förbättra sökmotoroptimeringen."),
                    ("Пошукова оптимізація допомагає підвищити рейтинг сайту.", "Sökmotoroptimering hjälper till att förbättra webbplatsens rankning."),
                    ("Ми регулярно оновлюємо наш сайт для покращення пошукової оптимізації.", "Vi uppdaterar regelbundet vår webbplats för att förbättra sökmotoroptimeringen.")
                ]),
                Question(expression: "контент-маркетинг", translation: "en innehållsmarknadsföring", examples: [
                    ("Контент-маркетинг допомагає залучити клієнтів через корисний контент.", "Innehållsmarknadsföring hjälper till att attrahera kunder genom nyttigt innehåll."),
                    ("Ми запускаємо нову стратегію контент-маркетингу.", "Vi lanserar en ny innehållsmarknadsföringsstrategi."),
                    ("Контент-маркетинг фокусується на створенні цінного контенту.", "Innehållsmarknadsföring fokuserar på att skapa värdefullt innehåll."),
                    ("Добре виконаний контент-маркетинг збільшує впізнаваність бренду.", "Väl utförd innehållsmarknadsföring ökar varumärkets kännedom.")
                ]),
                Question(expression: "підписка", translation: "en prenumeration", examples: [
                    ("Вони пропонують підписку на свій сервіс.", "De erbjuder prenumeration på sin tjänst."),
                    ("Ми хочемо збільшити кількість підписок на наші послуги.", "Vi vill öka antalet prenumerationer på våra tjänster."),
                    ("Підписка на наші оновлення допоможе залишатися в курсі.", "Prenumeration på våra uppdateringar hjälper till att hålla sig uppdaterad."),
                    ("Ми знижуємо ціну на першу підписку.", "Vi sänker priset på första prenumerationen.")
                ]),
                Question(expression: "конверсія", translation: "en konvertering", examples: [
                    ("Покращення конверсії є важливим для бізнесу.", "Att förbättra konverteringen är viktigt för företaget."),
                    ("Ми спостерігаємо високий рівень конверсії після оновлення сайту.", "Vi ser en hög konverteringsgrad efter webbplatsens uppdatering."),
                    ("Ми працюємо над підвищенням конверсії на нашій посадковій сторінці.", "Vi arbetar med att öka konverteringen på vår landningssida."),
                    ("Конверсія з рекламної кампанії виявилася вищою, ніж очікувалося.", "Konverteringen från reklamkampanjen var högre än förväntat.")
                ]),
                Question(expression: "знижка", translation: "en rabatt", examples: [
                    ("Ми пропонуємо знижки для нових клієнтів.", "Vi erbjuder rabatter för nya kunder."),
                    ("Знижка на цей товар діє тільки до кінця тижня.", "Rabatten på denna produkt gäller endast fram till slutet av veckan."),
                    ("Ми надаємо знижку за попереднє замовлення.", "Vi erbjuder rabatt för förbeställningar."),
                    ("Знижки доступні при покупці більше ніж на 500 грн.", "Rabatter är tillgängliga vid köp över 500 SEK.")
                ]),
                Question(expression: "бренд-амбасадор", translation: "en varumärkesambassadör", examples: [
                    ("Вони найняли відомого спортсмена як бренд-амбасадора.", "De anställde en känd idrottare som varumärkesambassadör."),
                    ("Бренд-амбасадори допомагають зміцнити імідж бренду.", "Varumärkesambassadörer hjälper till att stärka varumärkets image."),
                    ("Ми шукаємо бренд-амбасадора для нашої нової кампанії.", "Vi söker en varumärkesambassadör för vår nya kampanj."),
                    ("Бренд-амбасадор може значно підвищити впізнаваність бренду.", "En varumärkesambassadör kan avsevärt öka varumärkets kännedom.")
                ]),
                Question(expression: "реклама в пошукових системах", translation: "en sökmotorannonsering", examples: [
                    ("Реклама в пошукових системах допомагає залучити клієнтів.", "Sökmotorannonsering hjälper till att attrahera kunder."),
                    ("Ми плануємо запустити рекламу в пошукових системах для нашого нового продукту.", "Vi planerar att starta sökmotorannonsering för vår nya produkt."),
                    ("Реклама в пошукових системах дозволяє націлюватися на конкретну аудиторію.", "Sökmotorannonsering gör det möjligt att rikta sig till en specifik publik."),
                    ("Ми збільшили витрати на рекламу в пошукових системах для покращення результатів.", "Vi har ökat vår budget för sökmotorannonsering för att förbättra resultaten.")
                ]),
                Question(expression: "інфлюенсер", translation: "en influencer", examples: [
                    ("Інфлюенсери можуть значно вплинути на рішення покупців.", "Influencers kan ha stor påverkan på köparbeslut."),
                    ("Вони співпрацюють з інфлюенсерами для просування своїх продуктів.", "De samarbetar med influencers för att marknadsföra sina produkter."),
                    ("Інфлюенсери стали важливою частиною сучасних маркетингових стратегій.", "Influencers har blivit en viktig del av moderna marknadsföringsstrategier."),
                    ("Ми підписали угоду з інфлюенсером для нашої нової рекламної кампанії.", "Vi har ingått ett avtal med en influencer för vår nya reklamkampanj.")
                ]),
                Question(expression: "повідомлення", translation: "ett meddelande", examples: [
                    ("Повідомлення повинно бути чітким і зрозумілим для клієнта.", "Meddelandet bör vara klart och tydligt för kunden."),
                    ("Ми надіслали повідомлення всім підписникам.", "Vi skickade meddelanden till alla prenumeranter."),
                    ("Повідомлення має бути персоналізованим для кращої взаємодії.", "Meddelandet bör vara personligt för bättre interaktion."),
                    ("Ми отримали багато позитивних повідомлень від наших клієнтів.", "Vi har fått många positiva meddelanden från våra kunder.")
                ])
            ],
        /*.homework12: [
            
        ],
        .homework22: [
            
        ],
        .homework32: [
            
        ],
        .homework42: [
            
        ],
        .homework52: [
            
        ],
        .weekdays2: [
            
        ],
        
            .months2: [
                
            ],
        
            .modalVerbs2: [
                
            ],
        
            .bodyParts2: [
                
            ],
        
            .colors2: [
                
            ],
        
            .verbs2: [
                
            ],
        
            .vegetables2: [
                
            ],
        
            .fruits2: [
                
            ],
            .time2: [
                
                
                
                
            ],
        
        
        
            .shoppingNouns2: [
                
                
                
                
            ],
        
            .home2: [
                
            ],
        
            .family2: [
                
            ],
        
            .professions2: [
                
            ],
        
            .animals2: [
                
            ],
        
            .transport2: [
                
            ],
        
            .numbers2: [
                
            ],
        
            .ordinalNumbers2: [
                
            ],
        
            .law2: [
                
                
            ],
        
            .marketing2: []*/
        
    ]
    
    
    /// Get questions by category
    static func questions(for category: QuestionCategory) -> [Question] {
        return data[category] ?? []
    }
}
