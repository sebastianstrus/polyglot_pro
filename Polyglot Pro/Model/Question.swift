//
//  Question.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//


import Foundation

struct Question: Decodable {
    let id: UUID // Manually set during decoding
    let expression: String
    let audioID: String? // Set to nil during decoding
    let translations: [String: String]

    let examples: [Example]
    
    // Custom initializer for decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode the properties from JSON
        self.expression = try container.decode(String.self, forKey: .expression)
        self.translations = try container.decode([String: String].self, forKey: .translations)
        self.examples = try container.decode([Example].self, forKey: .examples)
        
        // Set `id` and `audioID` manually (they are not part of the JSON)
        self.id = UUID() // Generate a new UUID
        self.audioID = nil // Set to nil
    }
    
    // CodingKeys to map JSON keys to properties
    enum CodingKeys: String, CodingKey {
        case expression
        case translations
        case examples
    }
}

struct Example: Decodable {
    let sentence: Sentence
    let translations: [Translation]
    
    struct Sentence: Decodable, Hashable {
        let language: Language
        let text: String
    }
    
    struct Translation: Decodable {
        let language: Language
        let text: String
    }
}

enum Language: String, CaseIterable, Identifiable, Codable {
    case english
    case swedish
    case ukrainian
    case spanish
    case german
    case polish
    case french
    case portuguese
    case italian
    
    // Conform to Identifiable
    var id: String { self.rawValue }
    
    // Custom initializer to handle lowercase JSON keys
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        switch rawValue.lowercased() {
        case "swedish": self = .swedish
        case "ukrainian": self = .ukrainian
        case "spanish": self = .spanish
        case "german": self = .german
        case "english": self = .english
        case "polish": self = .polish
        case "french": self = .french
        case "portuguese": self = .portuguese
        case "italian": self = .italian
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid language: \(rawValue)")
        }
    }
    
    // Helper method to get the display name
    var displayName: String {
        switch self {
        case .swedish: return "Swedish".localized
        case .ukrainian: return "Ukrainian".localized
        case .spanish: return "Spanish".localized
        case .german: return "German".localized
        case .english: return "English".localized
        case .polish: return "Polish".localized
        case .french: return "French".localized
        case .portuguese: return "Portuguese".localized
        case .italian: return "Italian".localized
        }
    }
    
    var localeIdentifier: String {
        switch self {
        case .swedish: return "sv"
        case .ukrainian: return "uk"
        case .spanish: return "es"
        case .german: return "de"
        case .english: return "en"
        case .polish: return "pl"
        case .french: return "fr"
        case .portuguese: return "pt-BR"
        case .italian: return "it"
        }
    }
    
    var languageTag: String {
        switch self {
        case .swedish: return "sv-SE"
        case .ukrainian: return "uk-UA"
        case .spanish: return "es-ES"
        case .german: return "de-DE"
        case .english: return "en-US"
        case .polish: return "pl-PL"
        case .french: return "fr-FR"
        case .portuguese: return "pt-BR"
        case .italian: return "it-IT"
        }
    }
    
    var letters: [String] {
        switch self {
        case .english:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z"]
            
        case .swedish:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z", "Å å", "Ä ä", "Ö ö"]
            
        case .ukrainian:
            return ["А а", "Б б", "В в", "Г г", "Ґ ґ", "Д д", "Е е", "Є є", "Ж ж", "З з",
                    "И и", "І і", "Ї ї", "Й й", "К к", "Л л", "М м", "Н н", "О о", "П п",
                    "Р р", "С с", "Т т", "У у", "Ф ф", "Х х", "Ц ц", "Ч ч", "Ш ш", "Щ щ",
                    "Ь ь", "Ю ю", "Я я"]
            
        case .spanish:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "Ñ ñ", "O o", "P p", "Q q", "R r", "S s",
                    "T t", "U u", "V v", "W w", "X x", "Y y", "Z z"]
            
        case .german:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z", "Ä ä", "Ö ö", "Ü ü", "ẞ ß"]
            
        case .polish:
            return ["A a", "Ą ą", "B b", "C c", "Ć ć", "D d", "E e", "Ę ę", "F f", "G g",
                    "H h", "I i", "J j", "K k", "L l", "Ł ł", "M m", "N n", "Ń ń", "O o",
                    "Ó ó", "P p", "Q q", "R r", "S s", "Ś ś", "T t", "U u", "V v", "W w",
                    "X x", "Y y", "Z z", "Ź ź", "Ż ż"]
            
        case .french:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z", "À à", "Â â", "Ç ç", "É é",
                    "È è", "Ê ê", "Ë ë", "Î î", "Ï ï", "Ô ô", "Œ œ", "Ù ù", "Û û", "Ü ü", "Ÿ ÿ"]
            
        case .portuguese:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z", "Á á", "Â â", "Ã ã", "À à",
                    "Ç ç", "É é", "Ê ê", "Í í", "Ó ó", "Ô ô", "Õ õ", "Ú ú", "Ü ü"]
            
        case .italian:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z", "À à", "È è", "É é", "Ì ì",
                    "Ò ò", "Ù ù"]
        }
    }
        
}
