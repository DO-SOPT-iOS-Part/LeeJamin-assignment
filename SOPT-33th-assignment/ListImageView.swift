import UIKit

class ListImageView: UIView {
    private var imageView: UIImageView!
    private var leftLabel1: UILabel!
    private var leftLabel2: UILabel!
    private var leftLabel3: UILabel!
    private var rightLabel1: UILabel!
    private var rightLabel2: UILabel!
    
    init(city: String, weather: String, temperature: String, temperatureRange: String) {
        super.init(frame: .zero)
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "list")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        leftLabel1 = UILabel()
        leftLabel1.text = "나의 위치"
        leftLabel1.font = UIFont.systemFont(ofSize: 24)
        //leftLabel1.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        leftLabel1.textAlignment = .left
        leftLabel1.textColor = .white
        leftLabel1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftLabel1)
        
        leftLabel2 = UILabel()
        leftLabel2.text = city
        leftLabel2.font = UIFont.systemFont(ofSize: 17)
        leftLabel2.textAlignment = .left
        leftLabel2.textColor = .white
        leftLabel2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftLabel2)
        
        leftLabel3 = UILabel()
        leftLabel3.text = weather
        leftLabel3.font = UIFont.systemFont(ofSize: 16)
        leftLabel3.textAlignment = .left
        leftLabel3.textColor = .white
        leftLabel3.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftLabel3)
        
        rightLabel1 = UILabel()
        rightLabel1.text = temperature
        rightLabel1.font = UIFont.systemFont(ofSize: 52)
        rightLabel1.textAlignment = .right
        rightLabel1.textColor = .white
        rightLabel1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightLabel1)
        
        rightLabel2 = UILabel()
        rightLabel2.text = temperatureRange
        rightLabel2.font = UIFont.systemFont(ofSize: 15)
        rightLabel2.textAlignment = .right
        rightLabel2.textColor = .white
        rightLabel2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightLabel2)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.contentMode = .scaleAspectFit 
        
        
        leftLabel1.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10).isActive = true
        leftLabel1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        leftLabel2.topAnchor.constraint(equalTo: leftLabel1.bottomAnchor, constant: 2).isActive = true
        leftLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        leftLabel3.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10).isActive = true
        leftLabel3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        rightLabel1.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10).isActive = true
        rightLabel1.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16).isActive = true
        
        rightLabel2.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10).isActive = true
        rightLabel2.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
