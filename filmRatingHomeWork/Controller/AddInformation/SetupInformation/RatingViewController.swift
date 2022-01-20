import UIKit

final class RatingViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: Weak
    weak var delegateRating: TransferInfoAddViewController?
    // MARK: Private
    private let ratingPickerView = UIPickerView()
    private let ratingLabel = UILabel()
    private let saveRatingButton = UIButton()
    private let doubles = Array(stride(from: 0.0, through: 10.0, by: 0.1).reversed())
    private var numbersDouble:[String] = []
    private var backScreen:String = "10.0"
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstrains()
        setupUI()
        
    }
    // MARK: - Setups
    private func addSubViews(){
        view.addSubview(ratingPickerView)
        view.addSubview(ratingLabel)
        view.addSubview(saveRatingButton)
    }
    
    private func setupConstrains(){
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        ratingPickerView.translatesAutoresizingMaskIntoConstraints = false
        ratingPickerView.heightAnchor.constraint(equalToConstant: 131).isActive = true
        ratingPickerView.widthAnchor.constraint(equalToConstant: 374).isActive = true
        ratingPickerView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 32).isActive = true
        ratingPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        saveRatingButton.translatesAutoresizingMaskIntoConstraints = false
        saveRatingButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveRatingButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveRatingButton.topAnchor.constraint(equalTo: ratingPickerView.bottomAnchor, constant: 32).isActive = true
        saveRatingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    private func setupUI(){
        view.backgroundColor = AppColor.viewBackground
        
        ratingLabel.text = "Your Rating"
        ratingLabel.textColor = AppColor.textColor
        ratingLabel.font = .manrope(ofSize: 24, weight: .medium)
        
        ratingLabel.textAlignment = .center
        ratingPickerView.delegate = self
        ratingPickerView.dataSource = self
        
        saveRatingButton.setTitle("Save", for: .normal)
        saveRatingButton.setTitleColor(AppColor.buttonColorText, for: .normal)
        saveRatingButton.addTarget(self, action: #selector(saveRating), for: .touchUpInside)
        for string in doubles {
            numbersDouble.append(String(format: "%.1f", string))
        }
    }
    
    // MARK: - Helpers
    @objc func saveRating(){
        delegateRating?.transferRating(backScreen)
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - extension UIPicker

extension RatingViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbersDouble.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  numbersDouble[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        backScreen = numbersDouble[row]
    }
}
