import UIKit

final class LinkViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    weak var delegateLink: TransferInfoAddViewController?
    // MARK: Private
    private let linkNameLabel = UILabel()
    private let linkTextField = UITextField()
    private let savelinkButton = UIButton()
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
        linkTextField.becomeFirstResponder()
    }
    // MARK: - Setups
    private func addSubViews(){
        view.addSubview(linkNameLabel)
        view.addSubview(linkTextField)
        view.addSubview(savelinkButton)
        linkTextField.addSubview(lineView)
    }
    private func setupConstrains(){
        linkNameLabel.translatesAutoresizingMaskIntoConstraints = false
        linkNameLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        linkNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        linkNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        linkNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        linkTextField.translatesAutoresizingMaskIntoConstraints = false
        linkTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        linkTextField.topAnchor.constraint(equalTo: linkNameLabel.bottomAnchor, constant: 42).isActive = true
        linkTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        linkTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        savelinkButton.translatesAutoresizingMaskIntoConstraints = false
        savelinkButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        savelinkButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        savelinkButton.topAnchor.constraint(equalTo: linkTextField.bottomAnchor, constant: 42).isActive = true
        savelinkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.leadingAnchor.constraint(equalTo: linkTextField.leadingAnchor, constant: 0).isActive = true
        lineView.trailingAnchor.constraint(equalTo: linkTextField.trailingAnchor, constant: 0).isActive = true
        lineView.bottomAnchor.constraint(equalTo: linkTextField.bottomAnchor, constant: -5).isActive = true
    }
    private func setupUI(){
        view.backgroundColor = AppColor.viewBackground
        
        linkNameLabel.text = "Link YouTube"
        linkNameLabel.textColor = AppColor.textColor
        linkNameLabel.textAlignment = .center
        linkNameLabel.font = .manrope(ofSize: 24, weight: .medium)
        
        linkTextField.placeholder = "link"
        linkTextField.textColor = AppColor.textColor
        
        savelinkButton.setTitle("Save", for: .normal)
        savelinkButton.setTitleColor(AppColor.buttonColorText, for: .normal)
        savelinkButton.addTarget(self, action: #selector(trailer), for: .touchUpInside)
        
        lineView.backgroundColor = .systemGray
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Helpers
    
    @objc func trailer(){
        let enteredLink = linkTextField.text!
            delegateLink?.transferLink(enteredLink)
            navigationController?.popViewController(animated: true)
        
    }
}
