//import UIKit
////protocol TransferFilmViewControllerDelegats: AnyObject {
////    func transferMovie(_ film: WatchedFilm)
////}
//
////protocol TransferAllInfo:AnyObject{
////    func transferALL(_ info: WatchedFilm)
////
////}
//final class InformationAddViewController: UIViewController {
//   
//    
//    // MARK: - Properties
//    
//    // MARK: Public
////    weak var delegateFilm: TransferFilmViewControllerDelegats?
////    weak var transferAll:TransferAllInfo?
//    // MARK: Private
//    private let nameStackView = UIStackView()
//    private let ratingStackView = UIStackView()
//    private let dateStackView = UIStackView()
//    private let linkStackView = UIStackView()
//    private let addImage = UIImageView()
//    private let nameLabel = UILabel()
//    private let ratingLabel = UILabel()
//    private let dateLabel = UILabel()
//    private let linkLabel = UILabel()
//    private let nameChangeButton = UIButton()
//    private let ratingChangeButton = UIButton()
//    private let dateChangeButton = UIButton()
//    private let linkChangeButton = UIButton()
//    private var nameInfoLabel = UILabel()
//    private var ratingInfoLabel = UILabel()
//    private var dateInfoLabel = UILabel()
//    private var linkInfoLabel = UILabel()
//    private let descriptionLabel = UILabel()
//    private let descriptionTextView = UITextView()
//    
//    // MARK: - Lifecycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addSubViews()
//        setupUI()
//        setupConstrains()
//        setupNavigationBar()
//        setupStackView()
//        setupButton()
//    }
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        addImage.layer.cornerRadius = addImage.frame.size.height/2
//        addImage.layer.masksToBounds = true
//
//    }
//    // MARK: - Setups
//    private func addSubViews(){
//        view.addSubview(addImage)
//        view.addSubview(nameStackView)
//        view.addSubview(ratingStackView)
//        view.addSubview(dateStackView)
//        view.addSubview(linkStackView)
//        view.addSubview(descriptionLabel)
//        view.addSubview(descriptionTextView)
//        nameStackView.addSubview(nameLabel)
//        nameStackView.addSubview(nameChangeButton)
//        nameStackView.addSubview(nameInfoLabel)
//        ratingStackView.addSubview(ratingLabel)
//        ratingStackView.addSubview(ratingChangeButton)
//        ratingStackView.addSubview(ratingInfoLabel)
//        dateStackView.addSubview(dateLabel)
//        dateStackView.addSubview(dateChangeButton)
//        dateStackView.addSubview(dateInfoLabel)
//        linkStackView.addSubview(linkLabel)
//        linkStackView.addSubview(linkChangeButton)
//        linkStackView.addSubview(linkInfoLabel)
//        
//    }
//    private func setupConstrains(){
//        
//        
//        addImage.translatesAutoresizingMaskIntoConstraints = false
//        addImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        addImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        addImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 167).isActive = true
//        addImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//        
//        nameStackView.translatesAutoresizingMaskIntoConstraints = false
//        nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        nameStackView.heightAnchor.constraint(equalToConstant: 82).isActive = true
//        nameStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
//        nameStackView.topAnchor.constraint(equalTo: addImage.bottomAnchor, constant: 32).isActive = true
//        
//        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
//        ratingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        ratingStackView.heightAnchor.constraint(equalToConstant: 82).isActive = true
//        ratingStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
//        ratingStackView.topAnchor.constraint(equalTo: addImage.bottomAnchor, constant: 32).isActive = true
//        
//        dateStackView.translatesAutoresizingMaskIntoConstraints = false
//        dateStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        dateStackView.heightAnchor.constraint(equalToConstant: 82).isActive = true
//        dateStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
//        dateStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32).isActive = true
//        
//        linkStackView.translatesAutoresizingMaskIntoConstraints = false
//        linkStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        linkStackView.heightAnchor.constraint(equalToConstant: 82).isActive = true
//        linkStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
//        linkStackView.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 32).isActive = true
//        
//        nameChangeButton.translatesAutoresizingMaskIntoConstraints = false
//        nameChangeButton.widthAnchor.constraint(equalToConstant: 91.44).isActive = true
//        nameChangeButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
//        nameChangeButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
//        nameChangeButton.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor, constant: 16.2).isActive = true
//        
//        ratingChangeButton.translatesAutoresizingMaskIntoConstraints = false
//        ratingChangeButton.widthAnchor.constraint(equalToConstant: 91.44).isActive = true
//        ratingChangeButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
//        ratingChangeButton.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 30).isActive = true
//        ratingChangeButton.leadingAnchor.constraint(equalTo: ratingStackView.leadingAnchor, constant: 16.2).isActive = true
//        
//        dateChangeButton.translatesAutoresizingMaskIntoConstraints = false
//        dateChangeButton.widthAnchor.constraint(equalToConstant: 91.44).isActive = true
//        dateChangeButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
//        dateChangeButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 30).isActive = true
//        dateChangeButton.leadingAnchor.constraint(equalTo: dateStackView.leadingAnchor, constant: 16.2).isActive = true
//        
//        linkChangeButton.translatesAutoresizingMaskIntoConstraints = false
//        linkChangeButton.widthAnchor.constraint(equalToConstant: 91.44).isActive = true
//        linkChangeButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
//        linkChangeButton.topAnchor.constraint(equalTo: linkLabel.bottomAnchor, constant: 30).isActive = true
//        linkChangeButton.leadingAnchor.constraint(equalTo: linkStackView.leadingAnchor, constant: 16.2).isActive = true
//        
//        nameInfoLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameInfoLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
//        nameInfoLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        nameInfoLabel.centerYAnchor.constraint(equalTo: nameStackView.centerYAnchor, constant: 0).isActive = true
//        nameInfoLabel.centerXAnchor.constraint(equalTo: nameStackView.centerXAnchor, constant: 0).isActive = true
//        
//        ratingInfoLabel.translatesAutoresizingMaskIntoConstraints = false
//        ratingInfoLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
//        ratingInfoLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        ratingInfoLabel.centerYAnchor.constraint(equalTo: ratingStackView.centerYAnchor, constant: 0).isActive = true
//        ratingInfoLabel.centerXAnchor.constraint(equalTo: ratingStackView.centerXAnchor, constant: 0).isActive = true
//        
//        dateInfoLabel.translatesAutoresizingMaskIntoConstraints = false
//        dateInfoLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
//        dateInfoLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        dateInfoLabel.centerYAnchor.constraint(equalTo: dateStackView.centerYAnchor, constant: 0).isActive = true
//        dateInfoLabel.centerXAnchor.constraint(equalTo: dateStackView.centerXAnchor, constant: 0).isActive = true
//        
//        linkInfoLabel.translatesAutoresizingMaskIntoConstraints = false
//        linkInfoLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
//        linkInfoLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        linkInfoLabel.centerYAnchor.constraint(equalTo: linkStackView.centerYAnchor, constant: 0).isActive = true
//        linkInfoLabel.centerXAnchor.constraint(equalTo: linkStackView.centerXAnchor, constant: 0).isActive = true
//        
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
//        descriptionLabel.widthAnchor.constraint(equalToConstant: 311).isActive = true
//        descriptionLabel.topAnchor.constraint(equalTo: linkStackView.bottomAnchor, constant: 36).isActive = true
//        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//        
//        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
//        descriptionTextView.heightAnchor.constraint(equalToConstant: 145).isActive = true
//        descriptionTextView.widthAnchor.constraint(equalToConstant: 311).isActive = true
//        descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
//        
//
//        
//    }
//    private func setupUI(){
//        title = "Add new"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        addImage.image = UIImage(named: "image1")
//        
//        descriptionLabel.text = "Description"
//        descriptionLabel.font = UIFont(name: "Manrope", size: 18)
//        descriptionLabel.textAlignment = .center
//        
//        descriptionTextView.font = UIFont(name: "Manrope", size: 14)
//        
//        
//        
//    }
//    
//    private func setupNavigationBar(){
//        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveFilmAction))
//        saveButton.tintColor = .systemBlue
//        navigationItem.setRightBarButton(saveButton, animated: true)
//    }
//    private func setupStackView(){
//        nameLabel.frame = CGRect(x: 0, y: 0, width: 125, height: 27)
//        ratingLabel.frame = CGRect(x: 0, y: 0, width: 125, height: 27)
//        dateLabel.frame = CGRect(x: 0, y: 0, width: 125, height: 27)
//        linkLabel.frame = CGRect(x: 0, y: 0, width: 125, height: 27)
//        
//        nameLabel.text = "Name"
//        nameLabel.textAlignment = .center
//        nameLabel.font = UIFont(name: "Manrope", size: 18)
//        
//        ratingLabel.text = "Your Rating"
//        ratingLabel.font = UIFont(name: "Manrope", size: 18)
//        ratingLabel.textAlignment = .center
//        
//        dateLabel.text = "Release Date"
//        dateLabel.font = UIFont(name: "Manrope", size: 18)
//        dateLabel.textAlignment = .center
//        
//        linkLabel.text = "YouTube Link"
//        linkLabel.font = UIFont(name: "Manrope", size: 18)
//        linkLabel.textAlignment = .center
//        
//        
//        nameChangeButton.setTitle("Change", for: .normal)
//        nameChangeButton.tintColor = UIColor.systemBlue
//        nameChangeButton.setTitleColor(.systemBlue, for: .normal)
//        ratingChangeButton.setTitle("Change", for: .normal)
//        ratingChangeButton.setTitleColor(.systemBlue, for: .normal)
//        dateChangeButton.setTitle("Change", for: .normal)
//        dateChangeButton.setTitleColor(.systemBlue, for: .normal)
//        linkChangeButton.setTitle("Change", for: .normal)
//        linkChangeButton.setTitleColor(.systemBlue, for: .normal)
//        
//        nameInfoLabel.text = "-"
//        nameInfoLabel.font = UIFont(name: "Manrope", size: 18)
//        nameInfoLabel.textAlignment = .center
//        nameInfoLabel.adjustsFontSizeToFitWidth = true
//        nameInfoLabel.minimumScaleFactor = 0.5
//        
//        ratingInfoLabel.text = "-"
//        ratingInfoLabel.font = UIFont(name: "Manrope", size: 18)
//        ratingInfoLabel.textAlignment = .center
//        ratingInfoLabel.adjustsFontSizeToFitWidth = true
//        ratingInfoLabel.minimumScaleFactor = 0.5
//        
//        dateInfoLabel.text = "-"
//        dateInfoLabel.font = UIFont(name: "Manrope", size: 18)
//        dateInfoLabel.textAlignment = .center
//        dateInfoLabel.adjustsFontSizeToFitWidth = true
//        dateInfoLabel.minimumScaleFactor = 0.5
//        
//        linkInfoLabel.text = "-"
//        linkInfoLabel.font = UIFont(name: "Manrope", size: 18)
//        linkInfoLabel.textAlignment = .center
//        linkInfoLabel.adjustsFontSizeToFitWidth = true
//        linkInfoLabel.minimumScaleFactor = 0.5
//        
//        descriptionTextView.font = UIFont(name: "Manrope-Regular", size: 14)
//        
//        let tapGR = UITapGestureRecognizer(target: self, action: #selector(cameraAlert))
//        addImage.addGestureRecognizer(tapGR)
//        addImage.isUserInteractionEnabled = true
//    }
//    
//    private func setupButton(){
//        ratingChangeButton.addTarget(self, action: #selector(ratingScreen), for: .touchUpInside)
//        nameChangeButton.addTarget(self, action: #selector(nameScreen), for: .touchUpInside)
//        dateChangeButton.addTarget(self, action: #selector(releaseScreen), for: .touchUpInside)
//        linkChangeButton.addTarget(self, action: #selector(linkScreen), for: .touchUpInside)
//    }
//    // MARK: - Helpers
//   
//    @objc func nameScreen(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nameViewController = storyboard.instantiateViewController(withIdentifier: "NameViewController") as! NameViewController
//        nameViewController.delegateName = self
//        navigationController?.pushViewController(nameViewController, animated: true)
//    }
//    
//    
//    @objc func ratingScreen(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let ratingViewController = storyboard.instantiateViewController(withIdentifier: "RatingViewController") as! RatingViewController
//        ratingViewController.delegateRating = self
//        navigationController?.pushViewController(ratingViewController, animated: true)
//    }
//    @objc func releaseScreen(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let releaseViewController = storyboard.instantiateViewController(withIdentifier: "ReleaseViewController") as! ReleaseViewController
//        releaseViewController.delegateDate = self
//        navigationController?.pushViewController(releaseViewController, animated: true)
//    }
//    @objc func linkScreen(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let linkViewController = storyboard.instantiateViewController(withIdentifier: "LinkViewController") as! LinkViewController
//        linkViewController.delegateLink = self
//        navigationController?.pushViewController(linkViewController, animated: true)
//    }
//    
//    @objc private func cameraAlert(sender: UITapGestureRecognizer){
//        let alert = UIAlertController(title: "Add Photo", message: "", preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
//            
//            let imagePickerController = UIImagePickerController()
//            imagePickerController.allowsEditing = true
//            imagePickerController.sourceType = .camera
//            imagePickerController.delegate = self
////            if let image = info[.originalImage] as? UIImageView{
////                addImage.image = image
////            }
//            self.present(imagePickerController, animated: true, completion: nil)
//            
//        }))
//        
//        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in
//            let imagePickerController = UIImagePickerController()
//            imagePickerController.allowsEditing = false
//            imagePickerController.sourceType = .photoLibrary
//            imagePickerController.delegate = self
//            self.present(imagePickerController, animated: true, completion: nil)
//            
//            
//        }))
//        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in
//            
//        }))
//        present(alert,animated: true,completion: nil)
//    }
//    @objc func saveFilmAction(sender: UIButton!) {
//        let watchedFilm = WatchedFilm(filmName: nameInfoLabel.text!, filmRating: ratingInfoLabel.text!, filmRelease: dateInfoLabel.text!,filmDescription: descriptionTextView.text!, trailerLink: linkInfoLabel.text!,imageFilm: addImage)
////        delegateFilm?.transferMovie(watchedFilm)
//        navigationController?.popViewController(animated: true)
//    }
//}
//extension InformationAddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//        addImage.image  = tempImage
//        self.dismiss(animated: true, completion: nil)
//    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//}
//
//
//extension InformationAddViewController:TransferNameViewControllerDelegate,TransferRatingViewControllerDelegate,TransferDateInformationViewControllerDelegate,TransferLinkBetweenVCDelegats {
//    func transferName(_ name: String) {
//        nameInfoLabel.text = name
//    }
//    func transferDate(_ date: String) {
//        dateInfoLabel.text = date
//    }
//    func transferRating(_ rating: String) {
//        ratingInfoLabel.text = rating
//    }
//    func transferLink(_ link: String) {
//        linkInfoLabel.text = link
//    }
//}
//
//
