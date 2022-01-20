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
    private let presentationScrollView = UIScrollView()
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstrains()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    // MARK: - Setups
    private func addSubViews(){
        view.addSubview(screenImageView)
        view.addSubview(presentationScrollView)
        
        presentationScrollView.addSubview(whiteView)
        whiteView.addSubview(namedLabel)
        whiteView.addSubview(ratingAndYearsLabel)
        whiteView.addSubview(descriptionLabel)
        whiteView.addSubview(youTubeWebView)
       
    }
    
    private func setupConstrains(){
        presentationScrollView.translatesAutoresizingMaskIntoConstraints = false
        presentationScrollView.topAnchor.constraint(equalTo: screenImageView.bottomAnchor, constant: -29).isActive = true
        presentationScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        presentationScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        presentationScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
       
        
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.topAnchor.constraint(equalTo: presentationScrollView.topAnchor, constant: 0).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: presentationScrollView.leadingAnchor, constant: 0).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: presentationScrollView.trailingAnchor, constant: 0).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: presentationScrollView.bottomAnchor, constant: 0).isActive = true
        whiteView.widthAnchor.constraint(equalTo: presentationScrollView.widthAnchor, multiplier: 1.0).isActive = true
        
        screenImageView.translatesAutoresizingMaskIntoConstraints = false
        screenImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        screenImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        screenImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        screenImageView.heightAnchor.constraint(equalToConstant: 386).isActive = true
        
        namedLabel.translatesAutoresizingMaskIntoConstraints = false
        namedLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 29).isActive = true
        namedLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 18).isActive = true
        namedLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -18).isActive = true
        namedLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        ratingAndYearsLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingAndYearsLabel.topAnchor.constraint(equalTo: namedLabel.bottomAnchor, constant: 14).isActive = true
        ratingAndYearsLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 18).isActive = true
        ratingAndYearsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -18).isActive = true
        ratingAndYearsLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: ratingAndYearsLabel.bottomAnchor, constant: 19).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 18).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -18).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 138).isActive = true
        
        youTubeWebView.translatesAutoresizingMaskIntoConstraints = false
        youTubeWebView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
        youTubeWebView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -52).isActive = true
        youTubeWebView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 18).isActive = true
        youTubeWebView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -18).isActive = true
        youTubeWebView.heightAnchor.constraint(equalToConstant: 196).isActive = true
       
    }
    
    private func setupUI(){
        view.backgroundColor = AppColor.viewBackground
        
        whiteView.layer.cornerRadius = 20
        whiteView.layer.masksToBounds = true
        whiteView.backgroundColor = AppColor.viewBackground
        
        namedLabel.font = .manrope(ofSize: 24, weight: .bold)
        namedLabel.textColor = AppColor.textColor
            
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = AppColor.textColor
        descriptionLabel.font = .manrope(ofSize: 14, weight: .regular)
                
        youTubeWebView.layer.borderWidth = 0.5
      
        let url = URL(string: "https://www.youtube.com/\(traillerrFilm)")
        let request = URLRequest(url: url!)
        youTubeWebView.load(request)
    }
    // MARK: - Helpers
}




