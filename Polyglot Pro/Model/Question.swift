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
    
    // TODO: Not supported yet.
    case japanese
    case simplifiedChinese
    case indonesian
    case danish
    case norwegian
    case arabic
    case hindi
    case punjabi
    case bengali
    case finnish
    case korean
    case urdu
    case icelandic
    
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
        case "japanese": self = .japanese
        case "simplifiedchinese": self = .simplifiedChinese
        case "indonesian": self = .indonesian
        case "danish": self = .danish
        case "norwegian": self = .norwegian
        case "arabic": self = .arabic
        case "hindi": self = .hindi
        case "punjabi": self = .punjabi
        case "bengali": self = .bengali
        case "finnish": self = .finnish
        case "korean": self = .korean
        case "urdu": self = .urdu
        case "icelandic": self = .icelandic
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
        case .japanese: return "Japanese".localized
        case .simplifiedChinese: return "Simplified Chinese".localized
        case .indonesian: return "Indonesian".localized
        case .danish: return "Danish".localized
        case .norwegian: return "Norwegian".localized
        case .arabic: return "Arabic".localized
        case .hindi: return "Hindi".localized
        case .punjabi: return "Punjabi".localized
        case .bengali: return "Bengali".localized
        case .finnish: return "Finnish".localized
        case .korean: return "Korean".localized
        case .urdu: return "Urdu".localized
        case .icelandic: return "Icelandic".localized
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
        case .japanese: return "ja"
        case .simplifiedChinese: return "zh-Hans"
        case .indonesian: return "id"
        case .danish: return "da"
        case .norwegian: return "no"
        case .arabic: return "ar"
        case .hindi: return "hi"
        case .punjabi: return "pa"
        case .bengali: return "bn"
        case .finnish: return "fi"
        case .korean: return "ko"
        case .urdu: return "ur"
        case .icelandic: return "is"
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
        case .japanese: return "ja-JP"
        case .simplifiedChinese: return "zh-Hans"
        case .indonesian: return "id-ID"
        case .danish: return "da-DK"
        case .norwegian: return "no-NO"
        case .arabic: return "ar-SA"
        case .hindi: return "hi-IN"
        case .punjabi: return "pa-IN"
        case .bengali: return "bn-BD"
        case .finnish: return "fi-FI"
        case .korean: return "ko-KR"
        case .urdu: return "ur-PK"
        case .icelandic: return "is-IS"
        }
    }

    
    var flag: String {
        switch self {
        case .swedish: return "🇸🇪"
        case .ukrainian: return "🇺🇦"
        case .spanish: return "🇪🇸"
        case .german: return "🇩🇪"
        case .english: return "🇺🇸" // 🇬🇧
        case .polish: return "🇵🇱"
        case .french: return "🇫🇷"
        case .portuguese: return "🇧🇷" // 🇵🇹
        case .italian: return "🇮🇹"
        case .japanese: return "🇯🇵"
        case .simplifiedChinese: return "🇨🇳"
        case .indonesian: return "🇮🇩"
        case .danish: return "🇩🇰"
        case .norwegian: return "🇳🇴"
        case .arabic: return "🇸🇦"
        case .hindi: return "🇮🇳"
        case .punjabi: return "🇮🇳" // No specific flag, using India’s
        case .bengali: return "🇧🇩" // Bangladesh
        case .finnish: return "🇫🇮"
        case .korean: return "🇰🇷"
        case .urdu: return "🇵🇰"
        case .icelandic: return "🇮🇸"
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
            
        case .japanese:
            return ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と",
                    "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "や", "ゆ", "よ", "ら", "り", "る", "れ", "ろ",
                    "わ", "を", "ん"]
            
        case .simplifiedChinese:
            return ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "日", "月", "年", "人", "大", "小", "高", "低", "天", "地", "和", "中", "国"]
            
        case .indonesian:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z"]
            
        case .danish:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z", "Æ æ", "Ø ø", "Å å"]
            
        case .norwegian:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j",
                    "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z", "Æ æ", "Ø ø", "Å å"]
            
        case .arabic:
            return ["ا", "ب", "ت", "ث", "ج", "ح", "خ", "د", "ذ", "ر", "ز", "س", "ش",
                    "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ك", "ل", "م", "ن", "ه",
                    "و", "ي"]
            
        case .hindi:
            return ["अ", "आ", "इ", "ई", "उ", "ऊ", "ऋ", "ॠ", "ऌ", "ॡ", "ए", "ऐ",
                    "ओ", "औ", "अं", "अः", "क", "ख", "ग", "घ", "ङ", "च", "छ", "ज",
                    "झ", "ञ", "ट", "ठ", "ड", "ढ", "ण", "त", "थ", "द", "ध", "न",
                    "प", "फ", "ब", "भ", "म", "य", "र", "ल", "व", "श", "ष", "स",
                    "ह", "क्ष", "त्र", "ज्ञ"]
            
        case .punjabi:
            return ["ਅ", "ਆ", "ਇ", "ਈ", "ਉ", "ਊ", "ਏ", "ਐ", "ਓ", "ਔ", "ਕ", "ਖ", "ਗ", "ਘ", "ਙ", "ਚ", "ਛ", "ਜ", "ਝ", "ਞ", "ਟ", "ਠ", "ਡ", "ਢ", "ਣ", "ਤ",
                    "ਥ", "ਦ", "ਧ", "ਨ", "ਪ", "ਫ", "ਬ", "ਭ", "ਮ", "ਯ", "ਰ", "ਲ", "ਵ", "ਸ਼", "ਸ", "ਹ", "ੜ", "ਕਾ", "ਹਾ"]
            
        case .bengali:
            return ["অ", "আ", "ই", "ঈ", "উ", "ঊ", "ঋ", "ঌ", "এ", "ঐ", "ও", "ঔ", "ক", "খ", "গ", "ঘ", "ঙ", "চ", "ছ", "জ", "ঝ", "ঞ", "ট", "ঠ", "ড", "ঢ", "ণ",
                    "ত", "থ", "দ", "ধ", "ন", "প", "ফ", "ব", "ভ", "ম", "য", "র", "ল", "শ", "ষ", "স", "হ", "ড়", "ঢ়", "য়", "ৰ"]
            
        case .finnish:
            return ["A a", "B b", "C c", "D d", "E e", "F f", "G g", "H h", "I i", "J j", "K k", "L l", "M m", "N n", "O o", "P p", "Q q", "R r", "S s", "T t",
                    "U u", "V v", "W w", "X x", "Y y", "Z z", "Å å", "Ä ä", "Ö ö"]
            
        case .korean:
            return ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하", "거", "너", "더", "러", "머", "버", "서", "어", "저", "처",
                    "커", "터", "퍼", "허"]
            
        case .urdu:
            return ["ا", "ب", "پ", "ت", "ٹ", "ث", "ج", "چ", "ح", "خ", "د", "ڈ", "ذ", "ر", "ڑ", "ز", "ژ", "س", "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق",
                    "ک", "گ", "ل", "م", "ن", "ں", "و", "ہ", "ھ", "ء", "ی", "ے"]
            
        case .icelandic:
            return ["A a", "Á á", "B b", "D d", "Ð ð", "E e", "É é", "F f", "G g", "H h", "I i", "Í í", "J j", "K k", "L l", "M m", "N n", "O o", "Ó ó", "P p",
                    "R r", "S s", "T t", "U u", "Ú ú", "V v", "X x", "Y y", "Z z", "Þ þ", "Æ æ", "Ö ö"]

        }
    }
}
