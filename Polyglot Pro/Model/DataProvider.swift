//
//  Data.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-17.
//

import Foundation

enum Category: String, CaseIterable {
    
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
    
    // numerals "Numeral"
    //    case law = "Lag"
    
    //
    
    
    // spojniki
    
    
    
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
    case adjectivesTraits = "Intellektuella och mentala egenskaper"
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
