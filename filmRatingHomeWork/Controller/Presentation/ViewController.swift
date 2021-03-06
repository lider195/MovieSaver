import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let informationTableView = UITableView()
    private var watchedFilm: [WatchedFilm] = [] {
        didSet {
            informationTableView.reloadData()
        }
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstrains()
        setupUI()
        setupAddButton()
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        watchedFilm = UserDafaultsManager.instance.getWatchedFilm()
    }
    // MARK: - Setups
    private func addSubViews() {
        view.addSubview(informationTableView)
    }
    private func setupTableView() {
        informationTableView.delegate = self
        informationTableView.dataSource = self
        informationTableView.rowHeight = UITableView.automaticDimension
        informationTableView.separatorStyle = .none
        informationTableView.backgroundColor = AppColor.mainViewControllerBackgroundColor
    }
    private func setupConstrains() {
        informationTableView.translatesAutoresizingMaskIntoConstraints = false
        informationTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        informationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        informationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        informationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    private func setupUI() {
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = AppColor.mainViewControllerBackgroundColor
    }
    private func setupAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addInformation))
        addButton.tintColor = AppColor.buttonColorText
        navigationItem.setRightBarButton(addButton, animated: true)
    }
    // MARK: - Helpers
    @objc func addInformation() {
        let addInformationViewController = AddInformationViewController()
        addInformationViewController.delegateFilm = self
        navigationController?.pushViewController(addInformationViewController, animated: true)
    }
}
// MARK: - extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.watchedFilm.count
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            UserDafaultsManager.instance.restoreDeletedFilm(deletedFilm:
                                                                self.watchedFilm.remove(at: indexPath.row))
            UserDafaultsManager.instance.updateFilms(updatedFilm:
                                                        self.watchedFilm)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let presentInfoViewController = storyboard.instantiateViewController(
            withIdentifier: "PresentInfoViewController") as? PresentInfoViewController {
            informationTableView.isUserInteractionEnabled = true
            presentInfoViewController.set(film: watchedFilm[indexPath.row])
            self.navigationController?.pushViewController(presentInfoViewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        informationTableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "InformationTableViewCell")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell",
                                                    for: indexPath) as? InformationTableViewCell {
            cell.set(film: watchedFilm[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
extension ViewController: TransferFilmViewControllerDelegats {
    func transferMovie(_ film: WatchedFilm) {
        watchedFilm.insert(film, at: 0)
    }
}
