
import UIKit

class ItemListTableViewCell: UITableViewCell {

    static let identifier: String = "ItemListTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.setLayout()
    
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    
    func bindData3(data: ItemListData){
        self.dayLabel.text = data.dayLabel
        self.weatherImageView.image = UIImage(systemName: data.image)
        self.minTemperatureLabel.text = data.minLabel
        self.rangeImageView .image = UIImage(named: data.rangeImage)
        self.maxTemperatureLabel.text = data.maxLabel
    }
    
    private func setLayout() {
        self.backgroundColor = .init(red: 0.175, green: 0.201, blue: 0.249, alpha: 1)
        
//        self.layer.cornerRadius = 15
//        self.layer.borderWidth = 0.5
//        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        
        [dayLabel, stack2View].forEach {
            self.contentView.addSubview($0)
            
        }
        
        
        dayLabel.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview().inset(15)
        }
        
        stack2View.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview().inset(20)
        }
        
        [weatherImageView,minTemperatureLabel,rangeImageView,maxTemperatureLabel].forEach{
            self.stack2View.addArrangedSubview($0)
        }
        
        weatherImageView.snp.makeConstraints{
            $0.trailing.equalTo(minTemperatureLabel.snp.leading).offset(-20)
        }
        
    }
    
    
    private let stack2View = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 10
    }
    
    
    private let dayLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22)
        $0.numberOfLines = 1
        $0.textColor = .white
    }
    
    private let weatherImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let minTemperatureLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22)
        $0.textColor = .white
    }
    
    private let rangeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    private let maxTemperatureLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22)
        $0.textColor = .white
    }

}
