import UIKit

final class NameViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: Weak
    weak var delegateName:TransferInfoAddViewController?
    // MARK: Private
    private let filmNameLabel = UILabel()
    private let nameFilmTextField = UITextField()
    private let saveNameButton = UIButton()
    private let lineView = UIView()
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstrains()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameFilmTextField.becomeFirstResponder()
    }
    // MARK: - Setups
    private func addSubViews(){
        view.addSubview(filmNameLabel)
        view.addSubview(nameFilmTextField)
        view.addSubview(saveNameButton)
        nameFilmTextField.addSubview(lineView)
    }
    private func setupConstrains(){
        filmNameLabel.translatesAutoresizingMaskIntoConstraints = false
        filmNameLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        filmNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        filmNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        filmNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        nameFilmTextField.translatesAutoresizingMaskIntoConstraints = false
        nameFilmTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameFilmTextField.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 42).isActive = true
        nameFilmTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        nameFilmTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        saveNameButton.translatesAutoresizingMaskIntoConstraints = false
        saveNameButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveNameButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveNameButton.topAnchor.constraint(equalTo: nameFilmTextField.bottomAnchor, constant: 42).isActive = true
        saveNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.leadingAnchor.constraint(equalTo: nameFilmTextField.leadingAnchor, constant: 0).isActive = true
        lineView.trailingAnchor.constraint(equalTo: nameFilmTextField.trailingAnchor, constant: 0).isActive = true
        lineView.bottomAnchor.constraint(equalTo: nameFilmTextField.bottomAnchor, constant:-5).isActive = true
    }
    
    private func setupUI(){
        view.backgroundColor = AppColor.viewBackground
        
        filmNameLabel.text = "Film Name"
        filmNameLabel.textColor = AppColor.textColor
        filmNameLabel.textAlignment = .center
        filmNameLabel.font = .manrope(ofSize: 24, weight: .medium)
        
        nameFilmTextField.placeholder = "  Name"
        nameFilmTextField.textColor = AppColor.textColor
        
        saveNameButton.setTitle("Save", for: .normal)
        saveNameButton.setTitleColor(AppColor.buttonColorText, for: .normal)
        saveNameButton.addTarget(self, action: #selector(saveName), for: .touchUpInside)
        lineView.backgroundColor = .systemGray
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Helpers
    @objc private func saveName() -> UIAlertController{
        let alert = UIAlertController(title: "Ошибка" , message: "Введите название фильма", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        let entryName = nameFilmTextField.text!
        if entryName.isEmpty {
            present(alert,animated: true,completion: nil)
            nameFilmTextField.layer.borderColor = UIColor.red.cgColor
            nameFilmTextField.layer.cornerRadius = 10
            nameFilmTextField.layer.borderWidth = 0.5
            return  alert
        } else {
            delegateName?.transferName(entryName)
            navigationController?.popViewController(animated: true)
            return alert
        }
    }
}



