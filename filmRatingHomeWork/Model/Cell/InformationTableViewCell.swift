import UIKit

final class InformationTableViewCell: UITableViewCell {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private var informationImage = UIImageView()
    private var view = UIView()
    private var whiteView = UIView()
    private var nameLabel = UILabel()
    private var ratingLabel  = UILabel()
    private var traillerLink = UILabel()
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstrains()
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - API
    func set(film: WatchedFilm) {
        informationImage.image = UIImage(data: film.poster)
        nameLabel.text = film.name
        ratingLabel.attributedText = ratingMovieInfo(film.rating)
    }
    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubview(view)
        contentView.addSubview(whiteView)
        contentView.addSubview(informationImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(traillerLink)
    }
    private func setupConstrains() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18).isActive = true
        view.heightAnchor.constraint(equalToConstant: 212).isActive = true
        informationImage.translatesAutoresizingMaskIntoConstraints = false
        informationImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        informationImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        informationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        informationImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -156).isActive = true
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: informationImage.trailingAnchor, constant: 0).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: informationImage.trailingAnchor, constant: 0).isActive = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 34).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 59).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 15).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    private func setupUI() {
        nameLabel.numberOfLines = 3
        nameLabel.textColor = AppColor.textColor
        nameLabel.textAlignment = .center
        nameLabel.font = .manrope(ofSize: 18, weight: .medium)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = AppColor.textColor
        contentView.backgroundColor = AppColor.mainViewControllerBackgroundColor
        informationImage.layer.cornerRadius = 15
        informationImage.layer.masksToBounds = true
        informationImage.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.layer.shadowColor = AppColor.textColor?.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1
        view.backgroundColor = AppColor.viewBackground
    }
    private func ratingMovieInfo(_ rating: String) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                              NSAttributedString.Key.font: UIFont.manrope(ofSize: 18,
                                                                                                         weight: .bold)]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.592,
                                                                                green: 0.592,
                                                                                blue: 0.592,
                                                                                alpha: 1),
                                NSAttributedString.Key.font: UIFont.manrope(ofSize: 18,
                                                                            weight: .regular)]
        let firstString = NSMutableAttributedString(string: rating, attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
    // MARK: - Helpers
}
