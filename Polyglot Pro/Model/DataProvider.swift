//
//  Data.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-17.
//

import Foundation

enum Category: String, CaseIterable {
    
    enum CatSection: String, CaseIterable {
        case pronouns
        case nouns
        case verbs
        case adjectives
        case expressions
        case conjunctions
    }
    
    // pronouns
    case pronounsPersonal = "Personliga pronomen"
    case pronounsPossessive = "Possessiva pronomen"
    case pronounsReflexive = "Reflexiva pronomen"
    case pronounsInterrogative = "Frågande pronomen"
    
    // nouns
    case nounsWeekdays = "Veckodagar"
    case nounsMonths = "Månader"
    case nounsVegetables = "Grönsaker"
    case nounsFruits = "Frukter"
    case nounsBodyParts = "Kroppsdelar"
    case nounsShopping = "Shopping"
    case nounsHome = "Hem"
    case nounsFamily = "Familj"
    case nounsProfessions = "Yrken"
    case nounsAnimals = "Djur"
    case nounsTransport = "Transport"
    
    // verbs
    case verbsModal = "Modala verb"
    case verbsMotion = "Rörelseverben"
    case verbsPerception = "Perceptionsverb"
    case verbsThinking = "Tankeverb"
    case verbsAction = "Handlingsverb"
    case verbsChange = "Förändringsverb"
    case verbsState = "Tillståndsverb"
    case verbsCommunication = "Kommunikationsverb"
    case verbsFood = "Matverb"
    case verbsTime = "Tidsverb"
    case verbsControl = "Verb för kontroll"
    case verbsCreation = "Skapandeverb"
    case verbsLife = "Livsverb"
    case verbsEmotion = "Känsloverb"
    
    // adjectives
    case adjectivesColors = "Färger"
    case adjectivesAppearance = "Beskrivande adjektiv"
    case adjectivesEmotions = "Känslor och humör"
    case adjectivesPersonality = "Personlighet och karaktär"
    case adjectivesTraits = "Egenskaper"
    case adjectivesState = "Tillstånd och känsla "
    case adjectivesTime = "Ålder och tid"
    case adjectivesTaste = "Smak och doft"
    case adjectivesTemperature = "Temperatur"
    case adjectivesSound = "Ljud och röst"
    case adjectivesBehavior = "Beteende och attityd"
    case adjectivesMorality = "Moral och etik"
    case adjectivesRelationships = "Relationer och sociala egenskaper"
    case adjectivesMood = "Stämning och atmosfär"
    case adjectivesCondition = "Kvalitet och tillstånd på saker"
    
    // expressions
    case expressionsTime = "Tidsuttryck"
    //grzecznosciowe
    
    // conjunctions
    case conjunctions = "Sammanhängande ord"
    
    var primaryName: String {
        switch self {
        case .pronounsPersonal: return "Personal pronouns".localized
        case .pronounsPossessive: return "Possessive pronouns".localized
        case .pronounsReflexive: return "Reflexive pronouns".localized
        case .pronounsInterrogative: return "Interrogative pronouns".localized
                
        // Nouns
        case .nounsWeekdays: return "Weekdays".localized
        case .nounsMonths: return "Months".localized
        case .nounsVegetables: return "Vegetables".localized
        case .nounsFruits: return "Fruits".localized
        case .nounsBodyParts: return "Body parts".localized
        case .nounsShopping: return "Shopping".localized
        case .nounsHome: return "Home".localized
        case .nounsFamily: return "Family".localized
        case .nounsProfessions: return "Professions".localized
        case .nounsAnimals: return "Animals".localized
        case .nounsTransport: return "Transport".localized
                
        // Verbs
        case .verbsModal: return "Modal verbs".localized
        case .verbsMotion: return "Motion verbs".localized
        case .verbsPerception: return "Perception verbs".localized
        case .verbsThinking: return "Thinking verbs".localized
        case .verbsAction: return "Action verbs".localized
        case .verbsChange: return "Change verbs".localized
        case .verbsState: return "State verbs".localized
        case .verbsCommunication: return "Communication verbs".localized
        case .verbsFood: return "Food verbs".localized
        case .verbsTime: return "Time verbs".localized
        case .verbsControl: return "Control verbs".localized
        case .verbsCreation: return "Creation verbs".localized
        case .verbsLife: return "Life verbs".localized
        case .verbsEmotion: return "Emotion verbs".localized
                
        // Adjectives
        case .adjectivesColors: return "Colors".localized
        case .adjectivesAppearance: return "Descriptive adjectives".localized
        case .adjectivesEmotions: return "Emotions and mood".localized
        case .adjectivesPersonality: return "Personality".localized
        case .adjectivesTraits: return "Intellectual traits".localized
        case .adjectivesState: return "States and feelings".localized
        case .adjectivesTime: return "Age and time".localized
        case .adjectivesTaste: return "Taste and smell".localized
        case .adjectivesTemperature: return "Temperature".localized
        case .adjectivesSound: return "Sound and voice".localized
        case .adjectivesBehavior: return "Behavior".localized
        case .adjectivesMorality: return "Morality and ethics".localized
        case .adjectivesRelationships: return "Relationships".localized
        case .adjectivesMood: return "Mood".localized
        case .adjectivesCondition: return "Quality and condition".localized
                
        // Expressions
        case .expressionsTime: return "Time expressions".localized
                
        // Conjunctions
        case .conjunctions: return "Linking words".localized
        }
    }
    
    var targetName: String {
        switch self {
        case .pronounsPersonal: return "Personal pronouns".targetLocalized
        case .pronounsPossessive: return "Possessive pronouns".targetLocalized
        case .pronounsReflexive: return "Reflexive pronouns".targetLocalized
        case .pronounsInterrogative: return "Interrogative pronouns".targetLocalized
                
        // Nouns
        case .nounsWeekdays: return "Weekdays".targetLocalized
        case .nounsMonths: return "Months".targetLocalized
        case .nounsVegetables: return "Vegetables".targetLocalized
        case .nounsFruits: return "Fruits".targetLocalized
        case .nounsBodyParts: return "Body parts".targetLocalized
        case .nounsShopping: return "Shopping".targetLocalized
        case .nounsHome: return "Home".targetLocalized
        case .nounsFamily: return "Family".targetLocalized
        case .nounsProfessions: return "Professions".targetLocalized
        case .nounsAnimals: return "Animals".targetLocalized
        case .nounsTransport: return "Transport".targetLocalized
                
        // Verbs
        case .verbsModal: return "Modal verbs".targetLocalized
        case .verbsMotion: return "Motion verbs".targetLocalized
        case .verbsPerception: return "Perception verbs".targetLocalized
        case .verbsThinking: return "Thinking verbs".targetLocalized
        case .verbsAction: return "Action verbs".targetLocalized
        case .verbsChange: return "Change verbs".targetLocalized
        case .verbsState: return "State verbs".targetLocalized
        case .verbsCommunication: return "Communication verbs".targetLocalized
        case .verbsFood: return "Food verbs".targetLocalized
        case .verbsTime: return "Time verbs".targetLocalized
        case .verbsControl: return "Control verbs".targetLocalized
        case .verbsCreation: return "Creation verbs".targetLocalized
        case .verbsLife: return "Life verbs".targetLocalized
        case .verbsEmotion: return "Emotion verbs".targetLocalized
                
        // Adjectives
        case .adjectivesColors: return "Colors".targetLocalized
        case .adjectivesAppearance: return "Descriptive adjectives".targetLocalized
        case .adjectivesEmotions: return "Emotions and mood".targetLocalized
        case .adjectivesPersonality: return "Personality".targetLocalized
        case .adjectivesTraits: return "Intellectual traits".targetLocalized
        case .adjectivesState: return "States and feelings".localized
        case .adjectivesTime: return "Age and time".targetLocalized
        case .adjectivesTaste: return "Taste and smell".targetLocalized
        case .adjectivesTemperature: return "Temperature".targetLocalized
        case .adjectivesSound: return "Sound and voice".targetLocalized
        case .adjectivesBehavior: return "Behavior".targetLocalized
        case .adjectivesMorality: return "Morality and ethics".targetLocalized
        case .adjectivesRelationships: return "Relationships".targetLocalized
        case .adjectivesMood: return "Mood".targetLocalized
        case .adjectivesCondition: return "Quality and condition".targetLocalized
                
        // Expressions
        case .expressionsTime: return "Time expressions".targetLocalized
                
        // Conjunctions
        case .conjunctions: return "Linking words".targetLocalized
        }
    }
    
    /*
    
    // Dictionary of localized names
    private var localizedNames: [Language: [Category: String]] {
        return [
            .english: [
                // Pronouns
                .pronounsPersonal: "Personal pronouns",
                .pronounsPossessive: "Possessive pronouns",
                .pronounsReflexive: "Reflexive pronouns",
                .pronounsInterrogative: "Interrogative pronouns",
                
                // Nouns
                .nounsWeekdays: "Weekdays",
                .nounsMonths: "Months",
                .nounsVegetables: "Vegetables",
                .nounsFruits: "Fruits",
                .nounsBodyParts: "Body parts",
                .nounsShopping: "Shopping",
                .nounsHome: "Home",
                .nounsFamily: "Family",
                .nounsProfessions: "Professions",
                .nounsAnimals: "Animals",
                .nounsTransport: "Transport",
                
                // Verbs
                .verbsModal: "Modal verbs",
                .verbsMotion: "Motion verbs",
                .verbsPerception: "Perception verbs",
                .verbsThinking: "Thinking verbs",
                .verbsAction: "Action verbs",
                .verbsChange: "Change verbs",
                .verbsState: "State verbs",
                .verbsCommunication: "Communication verbs",
                .verbsFood: "Food verbs",
                .verbsTime: "Time verbs",
                .verbsControl: "Control verbs",
                .verbsCreation: "Creation verbs",
                .verbsLife: "Life verbs",
                .verbsEmotion: "Emotion verbs",
                
                // Adjectives
                .adjectivesColors: "Colors",
                .adjectivesAppearance: "Descriptive adjectives",
                .adjectivesEmotions: "Emotions and mood",
                .adjectivesPersonality: "Personality",
                .adjectivesTraits: "Intellectual traits",
                .adjectivesState: "States and feelings",
                .adjectivesTime: "Age and time",
                .adjectivesTaste: "Taste and smell",
                .adjectivesTemperature: "Temperature",
                .adjectivesSound: "Sound and voice",
                .adjectivesBehavior: "Behavior",
                .adjectivesMorality: "Morality and ethics",
                .adjectivesRelationships: "Relationships",
                .adjectivesMood: "Mood",
                .adjectivesCondition: "Quality and condition",
                
                // Expressions
                .expressionsTime: "Time expressions",
                
                // Conjunctions
                .conjunctions: "Linking words"
            ],
            .swedish: [
                // Pronouns
                .pronounsPersonal: "Personliga pronomen",
                .pronounsPossessive: "Possessiva pronomen",
                .pronounsReflexive: "Reflexiva pronomen",
                .pronounsInterrogative: "Frågande pronomen",
                
                // Nouns
                .nounsWeekdays: "Veckodagar",
                .nounsMonths: "Månader",
                .nounsVegetables: "Grönsaker",
                .nounsFruits: "Frukter",
                .nounsBodyParts: "Kroppsdelar",
                .nounsShopping: "Shopping",
                .nounsHome: "Hem",
                .nounsFamily: "Familj",
                .nounsProfessions: "Yrken",
                .nounsAnimals: "Djur",
                .nounsTransport: "Transport",
                
                // Verbs
                .verbsModal: "Modala verb",
                .verbsMotion: "Rörelseverben",
                .verbsPerception: "Perceptionsverb",
                .verbsThinking: "Tankeverb",
                .verbsAction: "Handlingsverb",
                .verbsChange: "Förändringsverb",
                .verbsState: "Tillståndsverb",
                .verbsCommunication: "Kommunikationsverb",
                .verbsFood: "Matverb",
                .verbsTime: "Tidsverb",
                .verbsControl: "Kontrollverb",
                .verbsCreation: "Skapandeverb",
                .verbsLife: "Livsverb",
                .verbsEmotion: "Känsloverb",
                
                // Adjectives
                .adjectivesColors: "Färger",
                .adjectivesAppearance: "Beskrivande adjektiv",
                .adjectivesEmotions: "Känslor och humör",
                .adjectivesPersonality: "Personlighet",
                .adjectivesTraits: "Egenskaper",
                .adjectivesState: "Tillstånd och känsla",
                .adjectivesTime: "Ålder och tid",
                .adjectivesTaste: "Smak och doft",
                .adjectivesTemperature: "Temperatur",
                .adjectivesSound: "Ljud och röst",
                .adjectivesBehavior: "Beteende",
                .adjectivesMorality: "Moral och etik",
                .adjectivesRelationships: "Relationer",
                .adjectivesMood: "Stämning",
                .adjectivesCondition: "Kvalitet och tillstånd",
                
                // Expressions
                .expressionsTime: "Tidsuttryck",
                
                // Conjunctions
                .conjunctions: "Sammanhängande ord"
            ],
            .ukrainian: [
                // Pronouns
                .pronounsPersonal: "Особові займенники",
                .pronounsPossessive: "Присвійні займенники",
                .pronounsReflexive: "Зворотні займенники",
                .pronounsInterrogative: "Питальні займенники",
                
                // Nouns
                .nounsWeekdays: "Дні тижня",
                .nounsMonths: "Місяці",
                .nounsVegetables: "Овочі",
                .nounsFruits: "Фрукти",
                .nounsBodyParts: "Частини тіла",
                .nounsShopping: "Шопінг",
                .nounsHome: "Дім",
                .nounsFamily: "Родина",
                .nounsProfessions: "Професії",
                .nounsAnimals: "Тварини",
                .nounsTransport: "Транспорт",
                
                // Verbs
                .verbsModal: "Модальні дієслова",
                .verbsMotion: "Дієслова руху",
                .verbsPerception: "Дієслова сприйняття",
                .verbsThinking: "Дієслова мислення",
                .verbsAction: "Дієслова дії",
                .verbsChange: "Дієслова зміни",
                .verbsState: "Дієслова стану",
                .verbsCommunication: "Дієслова спілкування",
                .verbsFood: "Дієслова їжі",
                .verbsTime: "Дієслова часу",
                .verbsControl: "Дієслова контролю",
                .verbsCreation: "Дієслова творення",
                .verbsLife: "Дієслова життя",
                .verbsEmotion: "Дієслова емоцій",
                
                // Adjectives
                .adjectivesColors: "Кольори",
                .adjectivesAppearance: "Описові прикметники",
                .adjectivesEmotions: "Емоції та настрій",
                .adjectivesPersonality: "Особистість",
                .adjectivesTraits: "Інтелектуальні якості",
                .adjectivesState: "Стани та відчуття",
                .adjectivesTime: "Вік та час",
                .adjectivesTaste: "Смак та запах",
                .adjectivesTemperature: "Температура",
                .adjectivesSound: "Звук та голос",
                .adjectivesBehavior: "Поведінка",
                .adjectivesMorality: "Мораль та етика",
                .adjectivesRelationships: "Стосунки",
                .adjectivesMood: "Настрій",
                .adjectivesCondition: "Якість та стан",
                
                // Expressions
                .expressionsTime: "Часові вирази",
                
                // Conjunctions
                .conjunctions: "Зв'язуючі слова"
            ],
            .spanish: [
                // Pronouns
                .pronounsPersonal: "Pronombres personales",
                .pronounsPossessive: "Pronombres posesivos",
                .pronounsReflexive: "Pronombres reflexivos",
                .pronounsInterrogative: "Pronombres interrogativos",
                
                // Nouns
                .nounsWeekdays: "Días de la semana",
                .nounsMonths: "Meses",
                .nounsVegetables: "Verduras",
                .nounsFruits: "Frutas",
                .nounsBodyParts: "Partes del cuerpo",
                .nounsShopping: "Compras",
                .nounsHome: "Hogar",
                .nounsFamily: "Familia",
                .nounsProfessions: "Profesiones",
                .nounsAnimals: "Animales",
                .nounsTransport: "Transporte",
                
                // Verbs
                .verbsModal: "Verbos modales",
                .verbsMotion: "Verbos de movimiento",
                .verbsPerception: "Verbos de percepción",
                .verbsThinking: "Verbos de pensamiento",
                .verbsAction: "Verbos de acción",
                .verbsChange: "Verbos de cambio",
                .verbsState: "Verbos de estado",
                .verbsCommunication: "Verbos de comunicación",
                .verbsFood: "Verbos de comida",
                .verbsTime: "Verbos de tiempo",
                .verbsControl: "Verbos de control",
                .verbsCreation: "Verbos de creación",
                .verbsLife: "Verbos de vida",
                .verbsEmotion: "Verbos de emoción",
                
                // Adjectives
                .adjectivesColors: "Colores",
                .adjectivesAppearance: "Adjetivos descriptivos",
                .adjectivesEmotions: "Emociones y ánimo",
                .adjectivesPersonality: "Personalidad",
                .adjectivesTraits: "Rasgos intelectuales",
                .adjectivesState: "Estados y sentimientos",
                .adjectivesTime: "Edad y tiempo",
                .adjectivesTaste: "Sabor y olor",
                .adjectivesTemperature: "Temperatura",
                .adjectivesSound: "Sonido y voz",
                .adjectivesBehavior: "Comportamiento",
                .adjectivesMorality: "Moral y ética",
                .adjectivesRelationships: "Relaciones",
                .adjectivesMood: "Ambiente",
                .adjectivesCondition: "Calidad y estado",
                
                // Expressions
                .expressionsTime: "Expresiones de tiempo",
                
                // Conjunctions
                .conjunctions: "Palabras de enlace"
            ],
            .german: [
                // Pronouns
                .pronounsPersonal: "Persönliche Pronomen",
                .pronounsPossessive: "Possessivpronomen",
                .pronounsReflexive: "Reflexivpronomen",
                .pronounsInterrogative: "Fragepronomen",
                
                // Nouns
                .nounsWeekdays: "Wochentage",
                .nounsMonths: "Monate",
                .nounsVegetables: "Gemüse",
                .nounsFruits: "Obst",
                .nounsBodyParts: "Körperteile",
                .nounsShopping: "Einkaufen",
                .nounsHome: "Zuhause",
                .nounsFamily: "Familie",
                .nounsProfessions: "Berufe",
                .nounsAnimals: "Tiere",
                .nounsTransport: "Transport",
                
                // Verbs
                .verbsModal: "Modalverben",
                .verbsMotion: "Bewegungsverben",
                .verbsPerception: "Wahrnehmungsverben",
                .verbsThinking: "Denkverben",
                .verbsAction: "Handlungsverben",
                .verbsChange: "Veränderungsverben",
                .verbsState: "Zustandsverben",
                .verbsCommunication: "Kommunikationsverben",
                .verbsFood: "Essensverben",
                .verbsTime: "Zeitverben",
                .verbsControl: "Kontrollverben",
                .verbsCreation: "Schöpfungsverben",
                .verbsLife: "Lebensverben",
                .verbsEmotion: "Emotionsverben",
                
                // Adjectives
                .adjectivesColors: "Farben",
                .adjectivesAppearance: "Beschreibende Adjektive",
                .adjectivesEmotions: "Emotionen und Stimmungen",
                .adjectivesPersonality: "Persönlichkeit",
                .adjectivesTraits: "Intellektuelle Eigenschaften",
                .adjectivesState: "Zustände und Gefühle",
                .adjectivesTime: "Alter und Zeit",
                .adjectivesTaste: "Geschmack und Geruch",
                .adjectivesTemperature: "Temperatur",
                .adjectivesSound: "Klang und Stimme",
                .adjectivesBehavior: "Verhalten",
                .adjectivesMorality: "Moral und Ethik",
                .adjectivesRelationships: "Beziehungen",
                .adjectivesMood: "Stimmung",
                .adjectivesCondition: "Qualität und Zustand",
                
                // Expressions
                .expressionsTime: "Zeitausdrücke",
                
                // Conjunctions
                .conjunctions: "Verbindungswörter"
            ],
            .polish: [
                // Pronouns
                .pronounsPersonal: "Zaimki osobowe",
                .pronounsPossessive: "Zaimki dzierżawcze",
                .pronounsReflexive: "Zaimki zwrotne",
                .pronounsInterrogative: "Zaimki pytające",
                
                // Nouns
                .nounsWeekdays: "Dni tygodnia",
                .nounsMonths: "Miesiące",
                .nounsVegetables: "Warzywa",
                .nounsFruits: "Owoce",
                .nounsBodyParts: "Części ciała",
                .nounsShopping: "Zakupy",
                .nounsHome: "Dom",
                .nounsFamily: "Rodzina",
                .nounsProfessions: "Zawody",
                .nounsAnimals: "Zwierzęta",
                .nounsTransport: "Transport",
                
                // Verbs
                .verbsModal: "Czasowniki modalne",
                .verbsMotion: "Czasowniki ruchu",
                .verbsPerception: "Czasowniki percepcji",
                .verbsThinking: "Czasowniki myślenia",
                .verbsAction: "Czasowniki działania",
                .verbsChange: "Czasowniki zmiany",
                .verbsState: "Czasowniki stanu",
                .verbsCommunication: "Czasowniki komunikacji",
                .verbsFood: "Czasowniki jedzenia",
                .verbsTime: "Czasowniki czasu",
                .verbsControl: "Czasowniki kontroli",
                .verbsCreation: "Czasowniki tworzenia",
                .verbsLife: "Czasowniki życia",
                .verbsEmotion: "Czasowniki emocji",
                
                // Adjectives
                .adjectivesColors: "Kolory",
                .adjectivesAppearance: "Przymiotniki opisowe",
                .adjectivesEmotions: "Emocje i nastrój",
                .adjectivesPersonality: "Osobowość",
                .adjectivesTraits: "Cechy intelektualne",
                .adjectivesState: "Stany i uczucia",
                .adjectivesTime: "Wiek i czas",
                .adjectivesTaste: "Smak i zapach",
                .adjectivesTemperature: "Temperatura",
                .adjectivesSound: "Dźwięk i głos",
                .adjectivesBehavior: "Zachowanie",
                .adjectivesMorality: "Moralność i etyka",
                .adjectivesRelationships: "Relacje",
                .adjectivesMood: "Nastrój",
                .adjectivesCondition: "Jakość i stan",
                
                // Expressions
                .expressionsTime: "Wyrażenia czasowe",
                
                // Conjunctions
                .conjunctions: "Spójniki"
            ],
            .french: [
                // Pronouns
                .pronounsPersonal: "Pronoms personnels",
                .pronounsPossessive: "Pronoms possessifs",
                .pronounsReflexive: "Pronoms réfléchis",
                .pronounsInterrogative: "Pronoms interrogatifs",
                
                // Nouns
                .nounsWeekdays: "Jours de la semaine",
                .nounsMonths: "Mois",
                .nounsVegetables: "Légumes",
                .nounsFruits: "Fruits",
                .nounsBodyParts: "Parties du corps",
                .nounsShopping: "Shopping",
                .nounsHome: "Maison",
                .nounsFamily: "Famille",
                .nounsProfessions: "Professions",
                .nounsAnimals: "Animaux",
                .nounsTransport: "Transport",
                
                // Verbs
                .verbsModal: "Verbes modaux",
                .verbsMotion: "Verbes de mouvement",
                .verbsPerception: "Verbes de perception",
                .verbsThinking: "Verbes de pensée",
                .verbsAction: "Verbes d'action",
                .verbsChange: "Verbes de changement",
                .verbsState: "Verbes d'état",
                .verbsCommunication: "Verbes de communication",
                .verbsFood: "Verbes alimentaires",
                .verbsTime: "Verbes de temps",
                .verbsControl: "Verbes de contrôle",
                .verbsCreation: "Verbes de création",
                .verbsLife: "Verbes de vie",
                .verbsEmotion: "Verbes d'émotion",
                
                // Adjectives
                .adjectivesColors: "Couleurs",
                .adjectivesAppearance: "Adjectifs descriptifs",
                .adjectivesEmotions: "Émotions et humeur",
                .adjectivesPersonality: "Personnalité",
                .adjectivesTraits: "Traits intellectuels",
                .adjectivesState: "États et sentiments",
                .adjectivesTime: "Âge et temps",
                .adjectivesTaste: "Goût et odorat",
                .adjectivesTemperature: "Température",
                .adjectivesSound: "Son et voix",
                .adjectivesBehavior: "Comportement",
                .adjectivesMorality: "Moralité et éthique",
                .adjectivesRelationships: "Relations",
                .adjectivesMood: "Ambiance",
                .adjectivesCondition: "Qualité et état",
                
                // Expressions
                .expressionsTime: "Expressions temporelles",
                
                // Conjunctions
                .conjunctions: "Conjonctions"
            ],
            .portuguese: [
                // Pronouns
                .pronounsPersonal: "Pronomes pessoais",
                .pronounsPossessive: "Pronomes possessivos",
                .pronounsReflexive: "Pronomes reflexivos",
                .pronounsInterrogative: "Pronomes interrogativos",
                
                // Nouns
                .nounsWeekdays: "Dias da semana",
                .nounsMonths: "Meses",
                .nounsVegetables: "Legumes",
                .nounsFruits: "Frutas",
                .nounsBodyParts: "Partes do corpo",
                .nounsShopping: "Compras",
                .nounsHome: "Casa",
                .nounsFamily: "Família",
                .nounsProfessions: "Profissões",
                .nounsAnimals: "Animais",
                .nounsTransport: "Transporte",
                
                // Verbs
                .verbsModal: "Verbos modais",
                .verbsMotion: "Verbos de movimento",
                .verbsPerception: "Verbos de percepção",
                .verbsThinking: "Verbos de pensamento",
                .verbsAction: "Verbos de ação",
                .verbsChange: "Verbos de mudança",
                .verbsState: "Verbos de estado",
                .verbsCommunication: "Verbos de comunicação",
                .verbsFood: "Verbos de comida",
                .verbsTime: "Verbos de tempo",
                .verbsControl: "Verbos de controle",
                .verbsCreation: "Verbos de criação",
                .verbsLife: "Verbos de vida",
                .verbsEmotion: "Verbos de emoção",
                
                // Adjectives
                .adjectivesColors: "Cores",
                .adjectivesAppearance: "Adjetivos descritivos",
                .adjectivesEmotions: "Emoções e humor",
                .adjectivesPersonality: "Personalidade",
                .adjectivesTraits: "Traços intelectuais",
                .adjectivesState: "Estados e sentimentos",
                .adjectivesTime: "Idade e tempo",
                .adjectivesTaste: "Sabor e aroma",
                .adjectivesTemperature: "Temperatura",
                .adjectivesSound: "Som e voz",
                .adjectivesBehavior: "Comportamento",
                .adjectivesMorality: "Moral e ética",
                .adjectivesRelationships: "Relações",
                .adjectivesMood: "Clima",
                .adjectivesCondition: "Qualidade e condição",
                
                // Expressions
                .expressionsTime: "Expressões temporais",
                
                // Conjunctions
                .conjunctions: "Conjunções"
            ],
            .italian: [
                // Pronouns
                .pronounsPersonal: "Pronomi personali",
                .pronounsPossessive: "Pronomi possessivi",
                .pronounsReflexive: "Pronomi riflessivi",
                .pronounsInterrogative: "Pronomi interrogativi",
                
                // Nouns
                .nounsWeekdays: "Giorni della settimana",
                .nounsMonths: "Mesi",
                .nounsVegetables: "Verdure",
                .nounsFruits: "Frutta",
                .nounsBodyParts: "Parti del corpo",
                .nounsShopping: "Shopping",
                .nounsHome: "Casa",
                .nounsFamily: "Famiglia",
                .nounsProfessions: "Professioni",
                .nounsAnimals: "Animali",
                .nounsTransport: "Trasporto",
                
                // Verbs
                .verbsModal: "Verbi modali",
                .verbsMotion: "Verbi di movimento",
                .verbsPerception: "Verbi di percezione",
                .verbsThinking: "Verbi di pensiero",
                .verbsAction: "Verbi d'azione",
                .verbsChange: "Verbi di cambiamento",
                .verbsState: "Verbi di stato",
                .verbsCommunication: "Verbi di comunicazione",
                .verbsFood: "Verbi alimentari",
                .verbsTime: "Verbi di tempo",
                .verbsControl: "Verbi di controllo",
                .verbsCreation: "Verbi di creazione",
                .verbsLife: "Verbi di vita",
                .verbsEmotion: "Verbi di emozione",
                
                // Adjectives
                .adjectivesColors: "Colori",
                .adjectivesAppearance: "Aggettivi descrittivi",
                .adjectivesEmotions: "Emozioni e umore",
                .adjectivesPersonality: "Personalità",
                .adjectivesTraits: "Tratti intellettuali",
                .adjectivesState: "Stati e sentimenti",
                .adjectivesTime: "Età e tempo",
                .adjectivesTaste: "Gusto e odore",
                .adjectivesTemperature: "Temperatura",
                .adjectivesSound: "Suono e voce",
                .adjectivesBehavior: "Comportamento",
                .adjectivesMorality: "Moralità ed etica",
                .adjectivesRelationships: "Relazioni",
                .adjectivesMood: "Atmosfera",
                .adjectivesCondition: "Qualità e condizione",
                
                // Expressions
                .expressionsTime: "Espressioni temporali",
                
                // Conjunctions
                .conjunctions: "Congiunzioni"
            ]
        ]
    }
    
    // Retrieve the localized name
    func displayName(for language: Language) -> String {
        return localizedNames[language]?[self] ?? self.rawValue
    }*/
}

class DataProvider2 {
    static func loadQuestions(from filename: String) -> [Question] {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to locate \(filename) in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            // Print the JSON data as a string
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Data: \(jsonString)")
            }
            let decoder = JSONDecoder()
            let questions = try decoder.decode([Question].self, from: data)
            print("TEST100 1")
            return questions
        } catch {
            fatalError("Failed to decode \(filename) from bundle: \(error.localizedDescription)")
        }
    }
}

struct DataProviderStruct {
    static let data: [Category: [Question]] = [
        // pronouns
        .pronounsPersonal: DataProvider2.loadQuestions(from: "sv_pronouns_personal"),
        .pronounsPossessive: DataProvider2.loadQuestions(from: "sv_pronouns_possessive"),
        .pronounsReflexive: DataProvider2.loadQuestions(from: "sv_pronouns_reflexive"),
        .pronounsInterrogative: DataProvider2.loadQuestions(from: "sv_pronouns_interrogative"),
        
        // nouns
        .nounsWeekdays: DataProvider2.loadQuestions(from: "sv_nouns_weekdays"),
        .nounsMonths: DataProvider2.loadQuestions(from: "sv_nouns_months"),
        .nounsVegetables: DataProvider2.loadQuestions(from: "sv_nouns_vegetables"),
        .nounsFruits: DataProvider2.loadQuestions(from: "sv_nouns_fruits"),
        .nounsBodyParts: DataProvider2.loadQuestions(from: "sv_nouns_body_parts"),
        .nounsShopping: DataProvider2.loadQuestions(from: "sv_nouns_shopping"),
        .nounsHome: DataProvider2.loadQuestions(from: "sv_nouns_home"),
        .nounsFamily: DataProvider2.loadQuestions(from: "sv_nouns_family"),
        .nounsProfessions: DataProvider2.loadQuestions(from: "sv_nouns_professions"),
        .nounsAnimals: DataProvider2.loadQuestions(from: "sv_nouns_animals"),
        .nounsTransport: DataProvider2.loadQuestions(from: "sv_nouns_transport"),
        
        // verbs
        .verbsModal: DataProvider2.loadQuestions(from: "sv_verbs_modal"),
        .verbsMotion: DataProvider2.loadQuestions(from: "sv_verbs_motion"),
        .verbsPerception: DataProvider2.loadQuestions(from: "sv_verbs_perception"),
        .verbsThinking: DataProvider2.loadQuestions(from: "sv_verbs_thinking"),
        .verbsAction: DataProvider2.loadQuestions(from: "sv_verbs_action"),
        .verbsChange: DataProvider2.loadQuestions(from: "sv_verbs_change"),
        .verbsState: DataProvider2.loadQuestions(from: "sv_verbs_state"),
        .verbsCommunication: DataProvider2.loadQuestions(from: "sv_verbs_communication"),
        .verbsFood: DataProvider2.loadQuestions(from: "sv_verbs_food"),
        .verbsTime: DataProvider2.loadQuestions(from: "sv_verbs_time"),
        .verbsControl: DataProvider2.loadQuestions(from: "sv_verbs_control"),
        .verbsCreation: DataProvider2.loadQuestions(from: "sv_verbs_creation"),
        .verbsLife: DataProvider2.loadQuestions(from: "sv_verbs_life"),
        .verbsEmotion: DataProvider2.loadQuestions(from: "sv_verbs_emotion"),
                
        //adjectives
        .adjectivesColors: DataProvider2.loadQuestions(from: "sv_adjectives_colors"),
        .adjectivesAppearance: DataProvider2.loadQuestions(from: "sv_adjectives_appearance"),
        .adjectivesEmotions: DataProvider2.loadQuestions(from: "sv_adjectives_emotions"),
        .adjectivesPersonality: DataProvider2.loadQuestions(from: "sv_adjectives_personality"),
        .adjectivesTraits: DataProvider2.loadQuestions(from: "sv_adjectives_traits"),
        .adjectivesState: DataProvider2.loadQuestions(from: "sv_adjectives_state"),
        .adjectivesTime: DataProvider2.loadQuestions(from: "sv_adjectives_time"),
        .adjectivesTaste: DataProvider2.loadQuestions(from: "sv_adjectives_taste"),
        .adjectivesTemperature: DataProvider2.loadQuestions(from: "sv_adjectives_temperature"),
        .adjectivesSound: DataProvider2.loadQuestions(from: "sv_adjectives_sound"),
        .adjectivesBehavior: DataProvider2.loadQuestions(from: "sv_adjectives_behavior"),
        .adjectivesMorality: DataProvider2.loadQuestions(from: "sv_adjectives_morality"),
        .adjectivesRelationships: DataProvider2.loadQuestions(from: "sv_adjectives_relationships"),
        .adjectivesMood: DataProvider2.loadQuestions(from: "sv_adjectives_mood"),
        .adjectivesCondition: DataProvider2.loadQuestions(from: "sv_adjectives_condition"),
        
        // expressions
        .expressionsTime: DataProvider2.loadQuestions(from: "sv_expressions_time"),
        
        .conjunctions: DataProvider2.loadQuestions(from: "sv_conjunctions"),
    ]
    
    static func questions(for category: Category) -> [Question] {
        return data[category] ?? []
    }
}
