import UIKit

final class ReleaseViewController: UIViewController {
    // MARK: - Properties
    // MARK: Weak
    weak var delegateDate: TransferInfoAddViewController?
    // MARK: Private
    private let releaseLabel = UILabel()
    private let releasePickerView = UIDatePicker()
    private let saveReleaseButton = UIButton()
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstrains()
        setupUI()
    }
    // MARK: - Setups
    private func addSubviews(){
        view.addSubview(releaseLabel)
        view.addSubview(releasePickerView)
        view.addSubview(saveReleaseButton)
    }
    private func setupConstrains(){
        releaseLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        releaseLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        releaseLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        releaseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        releasePickerView.translatesAutoresizingMaskIntoConstraints = false
        releasePickerView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        releasePickerView.heightAnchor.constraint(equalToConstant: 194).isActive = true
        releasePickerView.topAnchor.constraint(equalTo: releaseLabel.bottomAnchor, constant: 32).isActive = true
        releasePickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        saveReleaseButton.translatesAutoresizingMaskIntoConstraints = false
        saveReleaseButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveReleaseButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveReleaseButton.topAnchor.constraint(equalTo: releasePickerView.bottomAnchor, constant: 32).isActive = true
        saveReleaseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    private func setupUI(){
        view.backgroundColor = AppColor.viewBackground
        
        releaseLabel.text = "Release Date"
        releaseLabel.textColor = AppColor.textColor
        releaseLabel.textAlignment = .center
        releaseLabel.font = .manrope(ofSize: 24, weight: .medium)
        
        releasePickerView.preferredDatePickerStyle = .wheels
        releasePickerView.datePickerMode = .date
       
        
        saveReleaseButton.setTitle("Save", for: .normal)
        saveReleaseButton.setTitleColor(AppColor.buttonColorText, for: .normal)
        saveReleaseButton.addTarget(self, action: #selector(saveDate), for: .touchUpInside)
    }
    
    // MARK: - Helpers
    
    @objc func saveDate(sender: UIButton!) {
        let dateAnswer = DateFormatter()        
        dateAnswer.dateFormat = "yyyy"
        let releasingDate: String = dateAnswer.string(from: releasePickerView.date)
        delegateDate?.transferDate(releasingDate)
        navigationController?.popViewController(animated: true)
    }
}


