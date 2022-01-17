import UIKit

protocol TransferFilmViewControllerDelegats: AnyObject {
    func transferMovie(_ film: WatchedFilm)
}
protocol TransferInfoAddViewController: AnyObject {
    func transferLink(_ link: String)
    func transferName(_ name:String)
    func transferDate(_ date: String)
    func transferRating (_ rating:String )
}
final class AddInformationViewController: UIViewController{
    // MARK: - Properties
    
    // MARK: Weak
    weak var delegateFilm: TransferFilmViewControllerDelegats?
    // MARK: Private
    // scrollView
    private let scrollView = UIScrollView()
    // view
    private let contentView = UIView()
    private let circleImageView = UIView()
    private let filmImageView = UIImageView()
    // label
    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let dateLabel = UILabel()
    private let linkLabel = UILabel()
    private var nameInfoLabel = UILabel()
    private var ratingInfoLabel = UILabel()
    private var dateInfoLabel = UILabel()
    private var linkInfoLabel = UILabel()
    private let descriptionLabel = UILabel()
    // button
    private let nameChangeButton = UIButton()
    private let ratingChangeButton = UIButton()
    private let dateChangeButton = UIButton()
    private let linkChangeButton = UIButton()
    // textView
    private let descriptionTextView = UITextView()
    // stackView
    private var firstVerticalStackView = UIStackView()
    private var horizontalOneStackView = UIStackView()
    private var horizontalTwoStackView = UIStackView()
    private var oneVerticalStackView = UIStackView()
    private var twoVerticalStackView = UIStackView()
    private var threeVerticalStackView = UIStackView()
    private var fourVerticalStackView = UIStackView()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addStackView()
        setupViewConstrains()
        setupStackConstrains()
        setupStack()
        setupUI()
        setupNavigationBar()
        setupButton()
        addMovieImageViewUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        circleImageView.layer.cornerRadius = circleImageView.frame.size.height/2
        circleImageView.layer.masksToBounds = true
    }
    // MARK: - Setups
    
    private func addSubviews(){
        view.addSubview(scrollView)
        contentView.addSubview(circleImageView)
        scrollView.addSubview(contentView)
        circleImageView.addSubview(filmImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(descriptionTextView)
        
    }
    private func addStackView(){
        oneVerticalStackView = UIStackView(arrangedSubviews: [nameLabel,nameInfoLabel,nameChangeButton])
        
        twoVerticalStackView = UIStackView(arrangedSubviews: [ratingLabel,ratingInfoLabel,ratingChangeButton])
        
        threeVerticalStackView = UIStackView(arrangedSubviews: [dateLabel,dateInfoLabel,dateChangeButton])
        
        fourVerticalStackView = UIStackView(arrangedSubviews: [linkLabel,linkInfoLabel,linkChangeButton])
        
        horizontalOneStackView = UIStackView(arrangedSubviews: [oneVerticalStackView,twoVerticalStackView])
        
        horizontalTwoStackView = UIStackView(arrangedSubviews: [threeVerticalStackView,fourVerticalStackView])
        
        firstVerticalStackView = UIStackView(arrangedSubviews: [horizontalOneStackView,horizontalTwoStackView])
        
        contentView.addSubview(firstVerticalStackView)
    }
    
    private func setupViewConstrains(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        //////////////
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0).isActive = true
        
        
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        circleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27).isActive = true
        circleImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        circleImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        circleImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        filmImageView.translatesAutoresizingMaskIntoConstraints = false
        filmImageView.topAnchor.constraint(equalTo: circleImageView.topAnchor, constant: 0).isActive = true
        filmImageView.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: 0).isActive = true
        filmImageView.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 0).isActive = true
        filmImageView.trailingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 0).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: firstVerticalStackView.bottomAnchor, constant:36).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 145).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47).isActive = true
        
    }
    private func setupStackConstrains(){
        firstVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        firstVerticalStackView.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 32).isActive = true
        firstVerticalStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        firstVerticalStackView.heightAnchor.constraint(equalToConstant: 198).isActive = true
        firstVerticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        firstVerticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        
    }
    private func setupStack(){
        firstVerticalStackView.axis = .vertical
        firstVerticalStackView.distribution = .fillEqually
        firstVerticalStackView.spacing = 10
        
        horizontalOneStackView.axis = .horizontal
        horizontalOneStackView.distribution = .fillEqually
        horizontalOneStackView.spacing = 10
        
        horizontalTwoStackView.axis = .horizontal
        horizontalTwoStackView.distribution = .fillEqually
        horizontalTwoStackView.spacing = 10
        
        oneVerticalStackView.axis = .vertical
        oneVerticalStackView.distribution = .fillEqually
        oneVerticalStackView.spacing = 5
        
        twoVerticalStackView.axis = .vertical
        twoVerticalStackView.distribution = .fillEqually
        twoVerticalStackView.spacing = 5
        
        threeVerticalStackView.axis = .vertical
        threeVerticalStackView.distribution = .fillEqually
        threeVerticalStackView.spacing = 5
        
        fourVerticalStackView.axis = .vertical
        fourVerticalStackView.distribution = .fillEqually
        fourVerticalStackView.spacing = 5
        
    }
    
    private func setupUI(){
        
        title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        scrollView.backgroundColor = .white
        
        filmImageView.image = UIImage(named: "image1")
        
        descriptionLabel.text = "Description"
        descriptionLabel.font = .manrope(ofSize: 18, weight: .light)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
        
        nameLabel.text = "Name"
        nameLabel.textAlignment = .center
        nameLabel.font = .manrope(ofSize: 18, weight: .light)
        nameLabel.textColor = .black
        
        ratingLabel.text = "Your Rating"
        ratingLabel.font = .manrope(ofSize: 18, weight: .light)
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .black
        
        dateLabel.text = "Release Date"
        dateLabel.font = .manrope(ofSize: 18, weight: .light)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .black
        
        linkLabel.text = "YouTube Link"
        linkLabel.font = .manrope(ofSize: 18, weight: .light)
        linkLabel.textAlignment = .center
        linkLabel.textColor = .black
        
        nameChangeButton.setTitle("Change", for: .normal)
        nameChangeButton.setTitleColor(.systemBlue, for: .normal)
        ratingChangeButton.setTitle("Change", for: .normal)
        ratingChangeButton.setTitleColor(.systemBlue, for: .normal)
        dateChangeButton.setTitle("Change", for: .normal)
        dateChangeButton.setTitleColor(.systemBlue, for: .normal)
        linkChangeButton.setTitle("Change", for: .normal)
        linkChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        nameInfoLabel.text = "-"
        nameInfoLabel.textColor = .black
        nameInfoLabel.font = .manrope(ofSize: 18, weight: .light)
        nameInfoLabel.textAlignment = .center
        nameInfoLabel.adjustsFontSizeToFitWidth = true
        nameInfoLabel.minimumScaleFactor = 0.5
        
        ratingInfoLabel.text = "-"
        ratingInfoLabel.textColor = .black
        ratingInfoLabel.font = .manrope(ofSize: 18, weight: .light)
        ratingInfoLabel.textAlignment = .center
        ratingInfoLabel.adjustsFontSizeToFitWidth = true
        ratingInfoLabel.minimumScaleFactor = 0.5
        
        dateInfoLabel.text = "-"
        dateInfoLabel.textColor = .black
        dateInfoLabel.font = .manrope(ofSize: 18, weight: .light)
        dateInfoLabel.textAlignment = .center
        dateInfoLabel.adjustsFontSizeToFitWidth = true
        dateInfoLabel.minimumScaleFactor = 0.5
        
        linkInfoLabel.text = "-"
        linkInfoLabel.textColor = .black
        linkInfoLabel.font = .manrope(ofSize: 18, weight: .light)
        linkInfoLabel.textAlignment = .center
        linkInfoLabel.adjustsFontSizeToFitWidth = true
        linkInfoLabel.minimumScaleFactor = 0.5
        
        descriptionTextView.font = .manrope(ofSize: 14, weight: .regular)
        descriptionTextView.backgroundColor = .white
        descriptionTextView.textColor = .black
        
    }
    private func setupNavigationBar(){
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveFilmAction))
        saveButton.tintColor = .systemBlue
        navigationItem.setRightBarButton(saveButton, animated: true)
    }
    private func setupButton(){
        ratingChangeButton.addTarget(self, action: #selector(ratingScreen), for: .touchUpInside)
        nameChangeButton.addTarget(self, action: #selector(nameScreen), for: .touchUpInside)
        dateChangeButton.addTarget(self, action: #selector(releaseScreen), for: .touchUpInside)
        linkChangeButton.addTarget(self, action: #selector(linkScreen), for: .touchUpInside)
    }
    private func addMovieImageViewUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imagePickerBtnAction))
        circleImageView.isUserInteractionEnabled = true
        circleImageView.addGestureRecognizer(tap)
    }
      
    // MARK: - Helpers
    @objc func saveFilmAction(sender: UIButton!) {
        let watchedFilm = WatchedFilm(filmName: nameInfoLabel.text!, filmRating: ratingInfoLabel.text!, filmRelease: dateInfoLabel.text!,filmDescription: descriptionTextView.text!, trailerLink: linkInfoLabel.text!,imageFilm: filmImageView)
        delegateFilm?.transferMovie(watchedFilm)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nameScreen(){
        let nameViewController = NameViewController()
        nameViewController.delegateName = self
        navigationController?.pushViewController(nameViewController, animated: true)
    }
    @objc func ratingScreen(){
        let ratingViewController = RatingViewController()
        ratingViewController.delegateRating = self
        navigationController?.pushViewController(ratingViewController, animated: true)
    }
    @objc func releaseScreen(){
        let releaseViewController = ReleaseViewController()
        releaseViewController.delegateDate = self
        navigationController?.pushViewController(releaseViewController, animated: true)
    }
    @objc func linkScreen(){
        let linkViewController = LinkViewController()
        linkViewController.delegateLink = self
        navigationController?.pushViewController(linkViewController, animated: true)
    }
    @objc private func imagePickerBtnAction() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension  AddInformationViewController: TransferInfoAddViewController {
    func transferName(_ name: String) {
        nameInfoLabel.text = name
    }
    func transferDate(_ date: String) {
        dateInfoLabel.text = date
    }
    func transferRating(_ rating: String) {
        ratingInfoLabel.text = rating
    }
    func transferLink(_ link: String) {
        linkInfoLabel.text = link
    }
}
extension AddInformationViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            filmImageView.image = image
        }
        if let image = info[.editedImage] as? UIImage {
            filmImageView.image = image
        }
    }
}
