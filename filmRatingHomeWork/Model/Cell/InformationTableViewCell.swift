
import UIKit

class InformationTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    // MARK: Public
    var view = UIView()
    var informationImage = UIImageView()
    var nameLabel = UILabel()
    var ratingLabel  = UILabel()
    var traillerLink = UILabel()
    // MARK: Private
   

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
    // MARK: - Setups
    private func addSubviews(){
        contentView.addSubview(view)
        contentView.addSubview(informationImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(traillerLink)
    }
    private func setupConstrains(){

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.heightAnchor.constraint(equalToConstant: 212).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 375).isActive = true

        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1).isActive = true
        view.heightAnchor.constraint(equalToConstant: 212).isActive = true

        informationImage.translatesAutoresizingMaskIntoConstraints = false
        informationImage.widthAnchor.constraint(equalToConstant: 197).isActive = true
        informationImage.heightAnchor.constraint(equalToConstant: 212).isActive = true
        informationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 78).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 106).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 34).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: informationImage.trailingAnchor, constant: 15).isActive = true

        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 79).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: informationImage.trailingAnchor, constant: 31).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 45).isActive = true
        
    }
    private func setupUI(){
        
        nameLabel.numberOfLines = 4
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = .manrope(ofSize: 18, weight: .medium)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .black
        
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        informationImage.layer.cornerRadius = 16
        informationImage.layer.masksToBounds = true
        
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1
        view.backgroundColor = .white
      
        
    }
    // MARK: - Helpers
    
}
