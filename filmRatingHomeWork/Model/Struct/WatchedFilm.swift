import UIKit
struct WatchedFilm: Codable {
    var name: String
    var rating: String
    var release: String
    var description: String
    var link: String
    var poster: Data {
        didSet { _ = mainImage }
    }
    lazy var mainImage: UIImage = {
        UIImage(data: poster)!
    }()
}
