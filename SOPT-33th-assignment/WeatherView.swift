import UIKit

class WeatherView: UIView {
    private var imageView: UIImageView!
    private var timeLabel: UILabel!
    private var temperatureLabel: UILabel!
    
    init(time: String, image: UIImage, temperature: String) {
        super.init(frame: .zero)
        
        imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        
        timeLabel = UILabel()
        timeLabel.text = time
        timeLabel.font = UIFont.systemFont(ofSize: 17)
        timeLabel.textAlignment = .center
        timeLabel.textColor = .white
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        temperatureLabel = UILabel()
        temperatureLabel.text = temperature
        temperatureLabel.font = UIFont.systemFont(ofSize: 22)
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = .white
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [timeLabel, imageView, temperatureLabel])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        // 스택뷰 제약 조건 설정
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
   
    }
        
//        [timeLabel,imageView,temperatureLabel].forEach{
//            stackView.addArrangedSubview($0)
//        }
//

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
