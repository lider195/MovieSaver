import UIKit

final class ViewController: UIViewController   {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let informationTableView = UITableView()
    private var watchedFilm:[WatchedFilm] = []
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstrains()
        setupUI()
        presentInformaationView()
        getUserDefaults()
        setupTableView()
    }
    // MARK: - Setups
    private func addSubViews(){
        view.addSubview(informationTableView)
    }
    private func setupTableView(){
        informationTableView.delegate = self
        informationTableView.dataSource = self
        informationTableView.rowHeight = UITableView.automaticDimension
        informationTableView.separatorStyle = .none
        informationTableView.backgroundColor = AppColor.mainViewControllerBackgroundColor
    }
    
    private func setupConstrains(){
        informationTableView.translatesAutoresizingMaskIntoConstraints = false
        informationTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        informationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        informationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        informationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    private func setupUI(){
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = AppColor.mainViewControllerBackgroundColor
    }
    private func presentInformaationView(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addInformation))
        addButton.tintColor = AppColor.buttonColorText
        navigationItem.setRightBarButton(addButton, animated: true)
    }
    private func getUserDefaults(){
        watchedFilm.append(WatchedFilm(
            filmName: UserDefaults.standard.string(forKey: UserKeys.filmName.rawValue) ?? "fdsaf",
            filmRating: UserDefaults.standard.string(forKey: UserKeys.filmRating.rawValue) ?? "fdsaf",
            filmRelease: UserDefaults.standard.string(forKey: UserKeys.filmRelease.rawValue) ?? "fdsaf",
            filmDescription: UserDefaults.standard.string(forKey: UserKeys.filmDescription.rawValue) ?? "fdsaf",
            trailerLink: UserDefaults.standard.string(forKey: UserKeys.trailerLink.rawValue) ?? "fdsaf",
            imageFilm: UIImageView.init(image: UIImage.strokedCheckmark)
            //                UserDefaults.standard.object(forKey: UserKeys.imageFilm.rawValue)
            
        ))
    }
    // MARK: - Helpers
    @objc func addInformation(){
        let addInformationViewController = AddInformationViewController()
        addInformationViewController.delegateFilm = self
        navigationController?.pushViewController(addInformationViewController, animated: true)
    }
}
// MARK: - extension
extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.watchedFilm.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let presentInfoViewController = storyboard.instantiateViewController(withIdentifier: "PresentInfoViewController") as? PresentInfoViewController {
            informationTableView.isUserInteractionEnabled = true
            presentInfoViewController.screenImageView.image = watchedFilm[indexPath.row].imageFilm.image
            presentInfoViewController.namedLabel.text = watchedFilm[indexPath.row].filmName
            presentInfoViewController.ratingAndYearsLabel.attributedText = ratingAtr(watchedFilm[indexPath.row].filmRating, date: watchedFilm[indexPath.row].filmRelease)
            presentInfoViewController.descriptionLabel.text = watchedFilm[indexPath.row].filmDescription
            presentInfoViewController.traillerrFilm =  watchedFilm[indexPath.row].trailerLink
            self.navigationController?.pushViewController(presentInfoViewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        informationTableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "InformationTableViewCell")

        if let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as? InformationTableViewCell{
            
            cell.nameLabel.text = watchedFilm[indexPath.row].filmName
            cell.ratingLabel.attributedText = ratingMovieInfo(indexPath)
            cell.informationImage.image = watchedFilm[indexPath.row].imageFilm.image
            
            return cell
        }
        return UITableViewCell()
    }
    private func ratingMovieInfo(_ indexPath: IndexPath) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont.manrope(ofSize: 18, weight: .bold) ]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1), NSAttributedString.Key.font: UIFont.manrope(ofSize: 18, weight: .regular)]
        let firstString = NSMutableAttributedString(string: "\(watchedFilm[indexPath.row].filmRating)", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
    private func ratingAtr(_ rating : String ,date:String ) -> NSMutableAttributedString{
        
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.manrope(ofSize: 14, weight: .bold)]
        
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1), NSAttributedString.Key.font: UIFont.manrope(ofSize: 14, weight: .regular)]
        let thirdAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1), NSAttributedString.Key.font: UIFont.manrope(ofSize: 14, weight: .regular)]
        
        let firstString = NSMutableAttributedString(string: "\u{2B50} " + rating , attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10  ", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: date , attributes: thirdAttributes)
        firstString.append(secondString)
        firstString.append(thirdString)
        
        return firstString
        
    }
}
extension ViewController:TransferFilmViewControllerDelegats  {
    func transferMovie(_ film: WatchedFilm) {
        watchedFilm.insert(film, at: 0)
        informationTableView.reloadData()
        
    }
}


