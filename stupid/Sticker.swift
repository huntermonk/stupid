import SceneKit

enum Sticker {
    case angel, brazzers, drake, kanyeGlasses, lightbulb, missiles//, mustache, sunglasses

    var title: String {
        switch self {
        case .angel:
            return "😇"
        case .brazzers:
            return "😈"
        case .drake:
            return "🦉"
        case .kanyeGlasses:
            return "🕶"
        case .lightbulb:
            return "💡"
        case .missiles:
            return "💥"
//        case .mustache:
//            return "👨🏽"
//        case .sunglasses:
//            return "🕶"
        }
    }

    var image: UIImage {
        return UIImage(named: title)!
    }

    static var allExceptDrake: [Sticker] {
        return [
            angel,
            brazzers,
            kanyeGlasses,
            lightbulb,
            missiles,
            //            mustache,
            //            sunglasses
        ]
    }
}
