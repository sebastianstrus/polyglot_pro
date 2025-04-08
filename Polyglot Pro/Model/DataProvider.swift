//
//  Data.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-17.
//

import Foundation

enum Category: Codable, Hashable, Identifiable {
    
    enum CatSection: String, CaseIterable {
        case pronouns
        case nouns
        case verbs
        case adjectives
        case expressions
        case conjunctions
        case custom
        
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
            case .custom:
                return "Custom".localized
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
    
    // custom
    case custom(name: String)
    
    var id: String {
            switch self {
            case .custom(let name):
                return "custom-\(name)"
            default:
                return String(describing: self)
            }
        }
    
    static var allCases: [Category] {
        return [
            .pronounsPersonal,
            .pronounsPossessive,
            .pronounsReflexive,
            .pronounsInterrogative,
            .nounsWeekdays,
            .nounsMonths,
            .nounsVegetables,
            .nounsFruits,
            .nounsBodyParts,
            .nounsShopping,
            .nounsHome,
            .nounsFamily,
            .nounsProfessions,
            .nounsAnimals,
            .nounsTransport,
            .verbsModal,
            .verbsMotion,
            .verbsPerception,
            .verbsThinking,
            .verbsAction,
            .verbsChange,
            .verbsState,
            .verbsCommunication,
            .verbsFood,
            .verbsTime,
            .verbsControl,
            .verbsCreation,
            .verbsLife,
            .verbsEmotion,
            .adjectivesColors,
            .adjectivesAppearance,
            .adjectivesEmotions,
            .adjectivesPersonality,
            .adjectivesTraits,
            .adjectivesState,
            .adjectivesTime,
            .adjectivesTaste,
            .adjectivesTemperature,
            .adjectivesSound,
            .adjectivesBehavior,
            .adjectivesMorality,
            .adjectivesRelationships,
            .adjectivesMood,
            .adjectivesCondition,
            .expressionsPolite,
            .expressionsTime,
            .expressionsBusiness,
            .conjunctions,
        ]
    }
    
    static var builtInCases: [Category] {
        return allCases
    }
    
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
        case .custom(let name): return name
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
        case .custom:
            return .custom
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
        case .custom(let name): return name
        }
    }
}

extension Category {
    // Replace rawValue access with this computed property
    var stringValue: String {
        switch self {
        case .pronounsPersonal: return "pronounsPersonal"
        case .pronounsPossessive: return "pronounsPossessive"
        case .pronounsReflexive: return "pronounsReflexive"
        case .pronounsInterrogative: return "pronounsInterrogative"
        case .nounsWeekdays: return "nounsWeekdays"
        case .nounsMonths: return "nounsMonths"
        case .nounsVegetables: return "nounsVegetables"
        case .nounsFruits: return "nounsFruits"
        case .nounsBodyParts: return "nounsBodyParts"
        case .nounsShopping: return "nounsShopping"
        case .nounsHome: return "nounsHome"
        case .nounsFamily: return "nounsFamily"
        case .nounsProfessions: return "nounsProfessions"
        case .nounsAnimals: return "nounsAnimals"
        case .nounsTransport: return "nounsTransport"
        case .verbsModal: return "verbsModal"
        case .verbsMotion: return "verbsMotion"
        case .verbsPerception: return "verbsPerception"
        case .verbsThinking: return "verbsThinking"
        case .verbsAction: return "verbsAction"
        case .verbsChange: return "verbsChange"
        case .verbsState: return "verbsState"
        case .verbsCommunication: return "verbsCommunication"
        case .verbsFood: return "verbsFood"
        case .verbsTime: return "verbsTime"
        case .verbsControl: return "verbsControl"
        case .verbsCreation: return "verbsCreation"
        case .verbsLife: return "verbsLife"
        case .verbsEmotion: return "verbsEmotion"
        case .adjectivesColors: return "adjectivesColors"
        case .adjectivesAppearance: return "adjectivesAppearance"
        case .adjectivesEmotions: return "adjectivesEmotions"
        case .adjectivesPersonality: return "adjectivesPersonality"
        case .adjectivesTraits: return "adjectivesTraits"
        case .adjectivesState: return "adjectivesState"
        case .adjectivesTime: return "adjectivesTime"
        case .adjectivesTaste: return "adjectivesTaste"
        case .adjectivesTemperature: return "adjectivesTemperature"
        case .adjectivesSound: return "adjectivesSound"
        case .adjectivesBehavior: return "adjectivesBehavior"
        case .adjectivesMorality: return "adjectivesMorality"
        case .adjectivesRelationships: return "adjectivesRelationships"
        case .adjectivesMood: return "adjectivesMood"
        case .adjectivesCondition: return "adjectivesCondition"
        case .expressionsPolite: return "expressionsPolite"
        case .expressionsTime: return "expressionsTime"
        case .expressionsBusiness: return "expressionsBusiness"
        case .conjunctions: return "conjunctions"
        case .custom(let name): return "custom_\(name)"
        }
    }
}

class DataProvider {
    
    private static let customCategoryManager = CustomCategoryManager.shared
    
    private static var cachedData: [Category: [Question]] = [:]
    
    static func loadQuestionsIfNeeded(for category: Category) -> [Question] {
        // Return cached data if available
        if let cached = cachedData[category] {
            return cached
        }
        
        if case .custom = category {
            let questions = CustomCategoryManager.shared.loadQuestions(for: category)
            cachedData[category] = questions
            return questions
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
        case .custom(let name): filename =  "custom_\(name)"
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
    
    static func addCustomCategory(name: String, questions: [Question]) {
        customCategoryManager.addCustomCategory(name: name, questions: questions)
    }
    
    static func saveQuestions(_ questions: [Question], for category: Category) {
        customCategoryManager.saveQuestions(questions, for: category)
    }
}









import Foundation

class CustomCategoryManager {
    static let shared = CustomCategoryManager()
    private let userDefaultsKey = "customCategories"
    private let questionsPrefix = "customQuestions_"
    
    private init() {}
    
    // MARK: - Category Management
    
    func saveCustomCategories(_ categories: [Category]) {
        print("TEST100 saveCustomCategories: \(categories)")
        let customCategories = categories.filter { category in
            if case .custom = category { return true }
            return false
        }
        
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(customCategories)
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
            print("TEST100 saved")
        } catch {
            print("TEST100 failed to save")
            print("Failed to encode custom categories: \(error)")
        }
    }
    
    func loadCustomCategories() -> [Category] {
        print("TEST100 loadCustomCategories")
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            print("TEST100 load empty")
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            let categories = try decoder.decode([Category].self, from: data)
            print(categories)
            return categories
        } catch {
            print("Failed to decode custom categories: \(error)")
            return []
        }
    }
    
    func addCustomCategory(name: String, questions: [Question]) {
        print("TEST100 addCustomCategory")
        guard !name.isEmpty else {
            print("TEST100 empty")
            return
        }
        
        var currentCategories = loadCustomCategories()
        print("TEST100 currentCategories.count: \(currentCategories.count)")
        let newCategory = Category.custom(name: name)
        
        // Check if category already exists
        if !currentCategories.contains(where: {
            print("TEST100 1")
            if case let .custom(existingName) = $0 {
                print("TEST100 2")
                return existingName == name
            }
            print("TEST100 3")
            return false
        }) {
            print("TEST100 4")
            currentCategories.append(newCategory)
            saveCustomCategories(currentCategories)
            saveQuestions(questions, for: newCategory)
        }
    }
    
    func deleteCustomCategory(_ category: Category) {
        guard case .custom = category else { return }
        
        var currentCategories = loadCustomCategories()
        currentCategories.removeAll { $0 == category }
        saveCustomCategories(currentCategories)
        
        // Remove associated questions
        UserDefaults.standard.removeObject(forKey: questionsKey(for: category))
    }
    
    // MARK: - Question Management
    
//    private func questionsKey(for category: Category) -> String {
//        if case let .custom(name) = category {
//            return questionsPrefix + name
//        }
//        return questionsPrefix + "default"
//    }
    
    // Update the questionsKey function in CustomCategoryManager
    private func questionsKey(for category: Category) -> String {
        return questionsPrefix + category.stringValue
    }
    
    func saveQuestions(_ questions: [Question], for category: Category) {
        print("TEST100 saveQuestions: \(questions) for category: \(category)")
        guard case .custom = category else { return }
        
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(questions)
            print("TEST100 saved questions")
            UserDefaults.standard.set(encoded, forKey: questionsKey(for: category))
        } catch {
            print("Failed to encode questions for category \(category): \(error)")
        }
    }
    
    func loadQuestions(for category: Category) -> [Question] {
        print("TEST100 loadQuestions: for category: \(category)")
        guard case .custom = category else { return [] }
        
        guard let data = UserDefaults.standard.data(forKey: questionsKey(for: category)) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Question].self, from: data)
        } catch {
            print("Failed to decode questions for category \(category): \(error)")
            return []
        }
    }
    
    func addQuestion(_ question: Question, to category: Category) {
        print("TEST100 addQuestion")
        guard case .custom = category else { return }
        
        var questions = loadQuestions(for: category)
        questions.append(question)
        saveQuestions(questions, for: category)
    }
    
    func updateQuestion(_ question: Question, in category: Category) {
        print("TEST100 updateQuestion")
        guard case .custom = category else { return }
        
        var questions = loadQuestions(for: category)
        if let index = questions.firstIndex(where: { $0.id == question.id }) {
            questions[index] = question
            saveQuestions(questions, for: category)
        }
    }
    
    func deleteQuestion(_ question: Question, from category: Category) {
        print("TEST100 deleteQuestion")
        guard case .custom = category else { return }
        
        var questions = loadQuestions(for: category)
        questions.removeAll { $0.id == question.id }
        saveQuestions(questions, for: category)
    }
}
