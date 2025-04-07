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
        
        var displayName: String {
            switch self {
            case .pronouns:
                return "Pronouns".localized
            case .nouns:
                return "Nouns".localized
            case .verbs:
                return "Verbs".localized
            case .adjectives:
                return "Adjectives".localized
            case .expressions:
                return "Expressions".localized
            case .conjunctions:
                return "Conjunctions".localized
            }
        }
    }
    
    // pronouns
    case pronounsPersonal
    case pronounsPossessive
    case pronounsReflexive
    case pronounsInterrogative
    
    // nouns
    case nounsWeekdays
    case nounsMonths
    case nounsVegetables
    case nounsFruits
    case nounsBodyParts
    case nounsShopping
    case nounsHome
    case nounsFamily
    case nounsProfessions
    case nounsAnimals
    case nounsTransport
    
    // verbs
    case verbsModal
    case verbsMotion
    case verbsPerception
    case verbsThinking
    case verbsAction
    case verbsChange
    case verbsState
    case verbsCommunication
    case verbsFood
    case verbsTime
    case verbsControl
    case verbsCreation
    case verbsLife
    case verbsEmotion
    
    // adjectives
    case adjectivesColors
    case adjectivesAppearance
    case adjectivesEmotions
    case adjectivesPersonality
    case adjectivesTraits
    case adjectivesState
    case adjectivesTime
    case adjectivesTaste
    case adjectivesTemperature
    case adjectivesSound
    case adjectivesBehavior
    case adjectivesMorality
    case adjectivesRelationships
    case adjectivesMood
    case adjectivesCondition
    
    // expressions
    case expressionsPolite
    case expressionsTime
    case expressionsBusiness
    
    // conjunctions
    case conjunctions
    
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
        case .expressionsPolite: return "Polite expressions".localized
        case .expressionsTime: return "Time expressions".localized
        case .expressionsBusiness: return "Business expressions".localized
                
        // Conjunctions
        case .conjunctions: return "Linking words".localized
        }
    }
    
    var catSection: CatSection {
        switch self {
        case .pronounsPersonal, .pronounsPossessive, .pronounsReflexive, .pronounsInterrogative:
            return .pronouns
                
        case .nounsWeekdays, .nounsMonths, .nounsVegetables, .nounsFruits, .nounsBodyParts, .nounsShopping, .nounsHome,  .nounsFamily, .nounsProfessions, .nounsAnimals, .nounsTransport:
            return .nouns
            
        case .verbsModal, .verbsMotion, .verbsPerception, .verbsThinking, .verbsAction, .verbsChange, .verbsState, .verbsCommunication, .verbsFood, .verbsTime, .verbsControl, .verbsCreation, .verbsLife, .verbsEmotion:
            return .verbs
            
        case .adjectivesColors, .adjectivesAppearance, .adjectivesEmotions, .adjectivesPersonality, .adjectivesTraits, .adjectivesState, .adjectivesTime, .adjectivesTaste, .adjectivesTemperature, .adjectivesSound, .adjectivesBehavior, .adjectivesMorality, .adjectivesRelationships, .adjectivesMood, .adjectivesCondition:
            return .adjectives
                
        case .expressionsPolite, .expressionsTime, .expressionsBusiness:
            return .expressions
                
        case .conjunctions:
            return .conjunctions
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
        case .expressionsPolite: return "Polite expressions".targetLocalized
        case .expressionsTime: return "Time expressions".targetLocalized
        case .expressionsBusiness: return "Business expressions".targetLocalized
                
        // Conjunctions
        case .conjunctions: return "Linking words".targetLocalized
        }
    }
}

class DataProvider {
    private static var cachedData: [Category: [Question]] = [:]
    
    static func loadQuestionsIfNeeded(for category: Category) -> [Question] {
        // Return cached data if available
        if let cached = cachedData[category] {
            return cached
        }
        
        // Otherwise load and cache the data
        let filename: String
        switch category {
        // pronouns
        case .pronounsPersonal: filename = "sv_pronouns_personal"
        case .pronounsPossessive: filename = "sv_pronouns_possessive"
        case .pronounsReflexive: filename = "sv_pronouns_reflexive"
        case .pronounsInterrogative: filename = "sv_pronouns_interrogative"
            
        // nouns
        case .nounsWeekdays: filename = "sv_nouns_weekdays"
        case .nounsMonths: filename = "sv_nouns_months"
        case .nounsVegetables: filename = "sv_nouns_vegetables"
        case .nounsFruits: filename = "sv_nouns_fruits"
        case .nounsBodyParts: filename = "sv_nouns_body_parts"
        case .nounsShopping: filename = "sv_nouns_shopping"
        case .nounsHome: filename = "sv_nouns_home"
        case .nounsFamily: filename = "sv_nouns_family"
        case .nounsProfessions: filename = "sv_nouns_professions"
        case .nounsAnimals: filename = "sv_nouns_animals"
        case .nounsTransport: filename = "sv_nouns_transport"
            
        // verbs
        case .verbsModal: filename = "sv_verbs_modal"
        case .verbsMotion: filename = "sv_verbs_motion"
        case .verbsPerception: filename = "sv_verbs_perception"
        case .verbsThinking: filename = "sv_verbs_thinking"
        case .verbsAction: filename = "sv_verbs_action"
        case .verbsChange: filename = "sv_verbs_change"
        case .verbsState: filename = "sv_verbs_state"
        case .verbsCommunication: filename = "sv_verbs_communication"
        case .verbsFood: filename = "sv_verbs_food"
        case .verbsTime: filename = "sv_verbs_time"
        case .verbsControl: filename = "sv_verbs_control"
        case .verbsCreation: filename = "sv_verbs_creation"
        case .verbsLife: filename = "sv_verbs_life"
        case .verbsEmotion: filename = "sv_verbs_emotion"
                
        // adjectives
        case .adjectivesColors: filename = "sv_adjectives_colors"
        case .adjectivesAppearance: filename = "sv_adjectives_appearance"
        case .adjectivesEmotions: filename = "sv_adjectives_emotions"
        case .adjectivesPersonality: filename = "sv_adjectives_personality"
        case .adjectivesTraits: filename = "sv_adjectives_traits"
        case .adjectivesState: filename = "sv_adjectives_state"
        case .adjectivesTime: filename = "sv_adjectives_time"
        case .adjectivesTaste: filename = "sv_adjectives_taste"
        case .adjectivesTemperature: filename = "sv_adjectives_temperature"
        case .adjectivesSound: filename = "sv_adjectives_sound"
        case .adjectivesBehavior: filename = "sv_adjectives_behavior"
        case .adjectivesMorality: filename = "sv_adjectives_morality"
        case .adjectivesRelationships: filename = "sv_adjectives_relationships"
        case .adjectivesMood: filename = "sv_adjectives_mood"
        case .adjectivesCondition: filename = "sv_adjectives_condition"
        
        // expressions
        case .expressionsPolite: filename = "sv_expressions_polite"
        case .expressionsTime: filename = "sv_expressions_time"
        case .expressionsBusiness: filename = "sv_expressions_business"
            
        case .conjunctions: filename = "sv_conjunctions"
        }
        
        let questions = loadQuestions(from: filename)
        cachedData[category] = questions
        return questions
    }
    
    private static func loadQuestions(from filename: String) -> [Question] {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to locate \(filename) in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode([Question].self, from: data)
        } catch {
            fatalError("Failed to decode \(filename) from bundle: \(error.localizedDescription)")
        }
    }
    
    func questions(for category: Category) -> [Question] {
        return Self.loadQuestionsIfNeeded(for: category)
    }
    
    // Optional: Preload specific categories if needed
    static func preloadCategories(_ categories: [Category]) {
        categories.forEach { _ = loadQuestionsIfNeeded(for: $0) }
    }
}
