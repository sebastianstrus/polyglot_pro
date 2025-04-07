//
//  DataProvider.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-17.
//

import Foundation

enum Category: Codable, Hashable {
    enum CatSection: String, CaseIterable {
        case custom
        case pronouns
        case nouns
        case verbs
        case adjectives
        case expressions
        case conjunctions
        
        var displayName: String {
            switch self {
            case .custom: return "Custom".localized
            case .pronouns: return "Pronouns".localized
            case .nouns: return "Nouns".localized
            case .verbs: return "Verbs".localized
            case .adjectives: return "Adjectives".localized
            case .expressions: return "Expressions".localized
            case .conjunctions: return "Conjunctions".localized
            }
        }
    }
    
    // Built-in cases
    case pronounsPersonal
    case pronounsPossessive
    case pronounsReflexive
    case pronounsInterrogative
    
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
    
    case expressionsPolite
    case expressionsTime
    case expressionsBusiness
    
    case conjunctions
    
    // Custom category case
    case custom(name: String)
    
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
                .conjunctions
            ]
        }

        // Helper to get all built-in cases (excluding custom)
        static var builtInCases: [Category] {
            return allCases
        }
    
    var primaryName: String {
        switch self {
        case .custom(let name): return name
        case .pronounsPersonal: return "Personal pronouns".localized
        case .pronounsPossessive: return "Possessive pronouns".localized
        case .pronounsReflexive: return "Reflexive pronouns".localized
        case .pronounsInterrogative: return "Interrogative pronouns".localized
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
        case .expressionsPolite: return "Polite expressions".localized
        case .expressionsTime: return "Time expressions".localized
        case .expressionsBusiness: return "Business expressions".localized
        case .conjunctions: return "Linking words".localized
        }
    }
    
    var catSection: CatSection {
        switch self {
        case .custom: return .custom
        case .pronounsPersonal, .pronounsPossessive, .pronounsReflexive, .pronounsInterrogative:
            return .pronouns
        case .nounsWeekdays, .nounsMonths, .nounsVegetables, .nounsFruits, .nounsBodyParts,
             .nounsShopping, .nounsHome, .nounsFamily, .nounsProfessions, .nounsAnimals, .nounsTransport:
            return .nouns
        case .verbsModal, .verbsMotion, .verbsPerception, .verbsThinking, .verbsAction,
             .verbsChange, .verbsState, .verbsCommunication, .verbsFood, .verbsTime,
             .verbsControl, .verbsCreation, .verbsLife, .verbsEmotion:
            return .verbs
        case .adjectivesColors, .adjectivesAppearance, .adjectivesEmotions, .adjectivesPersonality,
             .adjectivesTraits, .adjectivesState, .adjectivesTime, .adjectivesTaste,
             .adjectivesTemperature, .adjectivesSound, .adjectivesBehavior, .adjectivesMorality,
             .adjectivesRelationships, .adjectivesMood, .adjectivesCondition:
            return .adjectives
        case .expressionsPolite, .expressionsTime, .expressionsBusiness:
            return .expressions
        case .conjunctions:
            return .conjunctions
        }
    }
    
    var targetName: String {
        switch self {
        case .custom(let name): return name
        case .pronounsPersonal: return "Personal pronouns".targetLocalized
        case .pronounsPossessive: return "Possessive pronouns".targetLocalized
        case .pronounsReflexive: return "Reflexive pronouns".targetLocalized
        case .pronounsInterrogative: return "Interrogative pronouns".targetLocalized
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
        case .adjectivesColors: return "Colors".targetLocalized
        case .adjectivesAppearance: return "Descriptive adjectives".targetLocalized
        case .adjectivesEmotions: return "Emotions and mood".targetLocalized
        case .adjectivesPersonality: return "Personality".targetLocalized
        case .adjectivesTraits: return "Intellectual traits".targetLocalized
        case .adjectivesState: return "States and feelings".targetLocalized
        case .adjectivesTime: return "Age and time".targetLocalized
        case .adjectivesTaste: return "Taste and smell".targetLocalized
        case .adjectivesTemperature: return "Temperature".targetLocalized
        case .adjectivesSound: return "Sound and voice".targetLocalized
        case .adjectivesBehavior: return "Behavior".targetLocalized
        case .adjectivesMorality: return "Morality and ethics".targetLocalized
        case .adjectivesRelationships: return "Relationships".targetLocalized
        case .adjectivesMood: return "Mood".targetLocalized
        case .adjectivesCondition: return "Quality and condition".targetLocalized
        case .expressionsPolite: return "Polite expressions".targetLocalized
        case .expressionsTime: return "Time expressions".targetLocalized
        case .expressionsBusiness: return "Business expressions".targetLocalized
        case .conjunctions: return "Linking words".targetLocalized
        }
    }
    
    // Codable implementation
    private enum CodingKeys: String, CodingKey {
        case type, name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "custom":
            let name = try container.decode(String.self, forKey: .name)
            self = .custom(name: name)
        default:
            guard let builtInCase = Category.builtInCases.first(where: { "\($0)" == type }) else {
                throw DecodingError.dataCorruptedError(
                    forKey: .type,
                    in: container,
                    debugDescription: "Invalid category type: \(type)"
                )
            }
            self = builtInCase
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .custom(let name):
            try container.encode("custom", forKey: .type)
            try container.encode(name, forKey: .name)
        default:
            try container.encode("\(self)", forKey: .type)
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
    
    static func loadQuestions(from filename: String) -> [Question] {
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

//    static var data: [Category: [Question]] {
//        var allData: [Category: [Question]] = [:]
//        print("TEST100 data")
//        
//        // Load built-in categories
//        for category in Category.builtInCases {
//            switch category {
//            case .pronounsPersonal: allData[category] = loadQuestions(from: "sv_pronouns_personal")
//            case .pronounsPossessive: allData[category] = loadQuestions(from: "sv_pronouns_possessive")
//            case .pronounsReflexive: allData[category] = loadQuestions(from: "sv_pronouns_reflexive")
//            case .pronounsInterrogative: allData[category] = loadQuestions(from: "sv_pronouns_interrogative")
//            case .nounsWeekdays: allData[category] = loadQuestions(from: "sv_nouns_weekdays")
//            case .nounsMonths: allData[category] = loadQuestions(from: "sv_nouns_months")
//            case .nounsVegetables: allData[category] = loadQuestions(from: "sv_nouns_vegetables")
//            case .nounsFruits: allData[category] = loadQuestions(from: "sv_nouns_fruits")
//            case .nounsBodyParts: allData[category] = loadQuestions(from: "sv_nouns_body_parts")
//            case .nounsShopping: allData[category] = loadQuestions(from: "sv_nouns_shopping")
//            case .nounsHome: allData[category] = loadQuestions(from: "sv_nouns_home")
//            case .nounsFamily: allData[category] = loadQuestions(from: "sv_nouns_family")
//            case .nounsProfessions: allData[category] = loadQuestions(from: "sv_nouns_professions")
//            case .nounsAnimals: allData[category] = loadQuestions(from: "sv_nouns_animals")
//            case .nounsTransport: allData[category] = loadQuestions(from: "sv_nouns_transport")
//            case .verbsModal: allData[category] = loadQuestions(from: "sv_verbs_modal")
//            case .verbsMotion: allData[category] = loadQuestions(from: "sv_verbs_motion")
//            case .verbsPerception: allData[category] = loadQuestions(from: "sv_verbs_perception")
//            case .verbsThinking: allData[category] = loadQuestions(from: "sv_verbs_thinking")
//            case .verbsAction: allData[category] = loadQuestions(from: "sv_verbs_action")
//            case .verbsChange: allData[category] = loadQuestions(from: "sv_verbs_change")
//            case .verbsState: allData[category] = loadQuestions(from: "sv_verbs_state")
//            case .verbsCommunication: allData[category] = loadQuestions(from: "sv_verbs_communication")
//            case .verbsFood: allData[category] = loadQuestions(from: "sv_verbs_food")
//            case .verbsTime: allData[category] = loadQuestions(from: "sv_verbs_time")
//            case .verbsControl: allData[category] = loadQuestions(from: "sv_verbs_control")
//            case .verbsCreation: allData[category] = loadQuestions(from: "sv_verbs_creation")
//            case .verbsLife: allData[category] = loadQuestions(from: "sv_verbs_life")
//            case .verbsEmotion: allData[category] = loadQuestions(from: "sv_verbs_emotion")
//            case .adjectivesColors: allData[category] = loadQuestions(from: "sv_adjectives_colors")
//            case .adjectivesAppearance: allData[category] = loadQuestions(from: "sv_adjectives_appearance")
//            case .adjectivesEmotions: allData[category] = loadQuestions(from: "sv_adjectives_emotions")
//            case .adjectivesPersonality: allData[category] = loadQuestions(from: "sv_adjectives_personality")
//            case .adjectivesTraits: allData[category] = loadQuestions(from: "sv_adjectives_traits")
//            case .adjectivesState: allData[category] = loadQuestions(from: "sv_adjectives_state")
//            case .adjectivesTime: allData[category] = loadQuestions(from: "sv_adjectives_time")
//            case .adjectivesTaste: allData[category] = loadQuestions(from: "sv_adjectives_taste")
//            case .adjectivesTemperature: allData[category] = loadQuestions(from: "sv_adjectives_temperature")
//            case .adjectivesSound: allData[category] = loadQuestions(from: "sv_adjectives_sound")
//            case .adjectivesBehavior: allData[category] = loadQuestions(from: "sv_adjectives_behavior")
//            case .adjectivesMorality: allData[category] = loadQuestions(from: "sv_adjectives_morality")
//            case .adjectivesRelationships: allData[category] = loadQuestions(from: "sv_adjectives_relationships")
//            case .adjectivesMood: allData[category] = loadQuestions(from: "sv_adjectives_mood")
//            case .adjectivesCondition: allData[category] = loadQuestions(from: "sv_adjectives_condition")
//            case .expressionsPolite: allData[category] = loadQuestions(from: "sv_expressions_polite")
//            case .expressionsTime: allData[category] = loadQuestions(from: "sv_expressions_time")
//            case .expressionsBusiness: allData[category] = loadQuestions(from: "sv_expressions_business")
//            case .conjunctions: allData[category] = loadQuestions(from: "sv_conjunctions")
//            case .custom: break // Custom categories handled separately
//            }
//        }
//        
//        // Add custom categories
//        let customCategories = customCategoryManager.loadCustomCategories()
//        for category in customCategories {
//            allData[category] = customCategoryManager.loadQuestions(for: category)
//        }
//        
//        return allData
//    }
    
//    func questions(for category: Category) -> [Question] {
//        print("TEST100 questions for: \(category)")
//        if case .custom = category {
//            return CustomCategoryManager.shared.loadQuestions(for: category)
//        }
//        return Self.data[category] ?? []
//    }
    
    static func addCustomCategory(name: String, questions: [Question]) {
        customCategoryManager.addCustomCategory(name: name, questions: questions)
    }
    
    static func saveQuestions(_ questions: [Question], for category: Category) {
        customCategoryManager.saveQuestions(questions, for: category)
    }
}














//
//  CustomCategoryManager.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-17.
//

import Foundation

class CustomCategoryManager {
    static let shared = CustomCategoryManager()
    private let userDefaultsKey = "customCategories"
    private let questionsPrefix = "customQuestions_"
    
    private init() {}
    
    // MARK: - Category Management
    
    func saveCustomCategories(_ categories: [Category]) {
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
        guard case .custom = category else { return }
        
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(questions)
            UserDefaults.standard.set(encoded, forKey: questionsKey(for: category))
        } catch {
            print("Failed to encode questions for category \(category): \(error)")
        }
    }
    
    func loadQuestions(for category: Category) -> [Question] {
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
        guard case .custom = category else { return }
        
        var questions = loadQuestions(for: category)
        questions.append(question)
        saveQuestions(questions, for: category)
    }
    
    func updateQuestion(_ question: Question, in category: Category) {
        guard case .custom = category else { return }
        
        var questions = loadQuestions(for: category)
        if let index = questions.firstIndex(where: { $0.id == question.id }) {
            questions[index] = question
            saveQuestions(questions, for: category)
        }
    }
    
    func deleteQuestion(_ question: Question, from category: Category) {
        guard case .custom = category else { return }
        
        var questions = loadQuestions(for: category)
        questions.removeAll { $0.id == question.id }
        saveQuestions(questions, for: category)
    }
}
