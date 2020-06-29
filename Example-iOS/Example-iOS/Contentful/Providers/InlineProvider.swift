// Example-iOS

import Contentful
import RichTextRenderer

final class InlineProvider: ResourceLinkInlineStringProviding {
    func string(
        for resource: Link,
        context: [CodingUserInfoKey : Any]
    ) -> NSMutableAttributedString {
        switch resource {
        case .entryDecodable(let entryDecodable):
            if let cat = entryDecodable as? Cat {
                return CatInlineProvider.string(for: cat)
            }

        default:
            break
        }

        return NSMutableAttributedString(string: "")
    }
}

private final class CatInlineProvider {
    static func string(for cat: Cat) -> NSMutableAttributedString {
        return NSMutableAttributedString(
            string: "🐈 \(cat.name) ❤️",
            attributes: nil
        )
    }
}
