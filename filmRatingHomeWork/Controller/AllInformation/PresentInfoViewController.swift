import UIKit
import WebKit

final class PresentInfoViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    let screenImageView = UIImageView()
    let whiteView = UIView()
    let namedLabel = UILabel()
    let ratingAndYearsLabel = UILabel()
    let descriptionLabel = UILabel()
    var youTubeWebView = WKWebView()
    var traillerrFilm:String = ""
    // MARK: Private
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstrains()
        setupUI()
    }
    // MARK: - Setups
    private func addSubViews(){
        view.addSubview(screenImageView)
        view.addSubview(whiteView)
        view.addSubview(namedLabel)
        view.addSubview(ratingAndYearsLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(youTubeWebView)
        
    }
    
    private func setupConstrains(){
        screenImageView.translatesAutoresizingMaskIntoConstraints = false
        screenImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        screenImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        screenImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        screenImageView.heightAnchor.constraint(equalToConstant: 386).isActive = true
        
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.topAnchor.constraint(equalTo: screenImageView.bottomAnchor, constant: -29).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        namedLabel.translatesAutoresizingMaskIntoConstraints = false
        namedLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 29).isActive = true
        namedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        namedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        namedLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        ratingAndYearsLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingAndYearsLabel.topAnchor.constraint(equalTo: namedLabel.bottomAnchor, constant: 14).isActive = true
        ratingAndYearsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        ratingAndYearsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        ratingAndYearsLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        ratingAndYearsLabel.widthAnchor.constraint(equalToConstant: 124).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: ratingAndYearsLabel.bottomAnchor, constant: 19).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 138).isActive = true
        
        youTubeWebView.translatesAutoresizingMaskIntoConstraints = false
        youTubeWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52).isActive = true
        youTubeWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        youTubeWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        youTubeWebView.heightAnchor.constraint(equalToConstant: 196).isActive = true
        
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        
        whiteView.layer.cornerRadius = 20
        whiteView.layer.masksToBounds = true
        whiteView.backgroundColor = .white
        
        namedLabel.font = .manrope(ofSize: 24, weight: .bold)
        namedLabel.textColor = .black
        
        ratingAndYearsLabel.textColor = .black
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        descriptionLabel.font = .manrope(ofSize: 14, weight: .regular)
        
        
        youTubeWebView.layer.borderWidth = 0.5
        
        
        let url = URL(string: "https://www.youtube.com/\(traillerrFilm)")
        let request = URLRequest(url: url!)
        youTubeWebView.load(request)
        
        
    }
    // MARK: - Helpers
    
}




