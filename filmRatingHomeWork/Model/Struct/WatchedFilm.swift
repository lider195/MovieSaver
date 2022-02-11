import UIKit
struct WatchedFilm: Codable {
    let name: String
    let rating: String
    let release: String
    let description: String
    let link: String
    var poster: Data {
        didSet { _ = mainImage }
    }
    lazy var mainImage: UIImage = {
        UIImage(data: poster)!
    }()
}
