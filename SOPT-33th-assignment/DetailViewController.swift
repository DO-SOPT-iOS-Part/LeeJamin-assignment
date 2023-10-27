import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        
        // 이미지 뷰를 전체 화면에 채우도록
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImageView)
        self.setLayout()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(image4Tapped))
                image4View.addGestureRecognizer(tapGesture)
                image4View.isUserInteractionEnabled = true
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        [firstStackView, secondStackView,strokeView2,bottomStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 78),
            firstStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            firstStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 44),
            secondStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            secondStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            secondStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -246)
        ])
        
        NSLayoutConstraint.activate([
            strokeView2.heightAnchor.constraint(equalToConstant: 0.2),
             strokeView2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -78),
             strokeView2.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
             strokeView2.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
                                    ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: strokeView2.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            bottomStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            bottomStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 14)
        ])
        
        [image3View, pageStackView, image4View].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            bottomStackView.addArrangedSubview($0)
        }

        
        [image1View,image2View].forEach{
            pageStackView.addArrangedSubview($0)
        }
        
        [titleLabel, temperatureLabel, weatherLabel, temperatureRangeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            firstStackView.addArrangedSubview($0)
        }
        
        [weatherDescriptionLabel,strokeView,weatherStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            secondStackView.addArrangedSubview($0)
            
            NSLayoutConstraint.activate([
                                $0.leadingAnchor.constraint(equalTo: secondStackView.leadingAnchor, constant: 15),
                                $0.trailingAnchor.constraint(equalTo: secondStackView.trailingAnchor, constant: -15)
                            ])
                        
            NSLayoutConstraint.activate([weatherDescriptionLabel.topAnchor.constraint(equalTo: secondStackView.topAnchor, constant: 10)
                                        ])
            NSLayoutConstraint.activate([strokeView.heightAnchor.constraint(equalToConstant: 0.2)])
            
            
            
            //NSLayoutConstraint.activate([weatherStackView.topAnchor.constraint(equalTo: strokeView.bottomAnchor, constant: 14)])
            weatherStackView.translatesAutoresizingMaskIntoConstraints = false
            secondStackView.addArrangedSubview(weatherStackView)
            //weatherStackView.widthAnchor.constraint(equalTo: secondStackView.widthAnchor, multiplier: 1).isActive = true
            
            
            [customWeatherView, customWeatherView1, customWeatherView2, customWeatherView3, customWeatherView4].forEach{
                weatherStackView.addArrangedSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    $0.widthAnchor.constraint(equalToConstant: 46)
                ])
            }
           
        }
    }
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()

    
    let customWeatherView = WeatherView(time: "Now", image: UIImage(systemName: "cloud.sun.fill")!, temperature: "21")
    let customWeatherView1 = WeatherView(time: "Now", image: UIImage(systemName: "cloud.sun.fill")!, temperature: "21")
    let customWeatherView2 = WeatherView(time: "Now", image: UIImage(systemName: "cloud.sun.fill")!, temperature: "21")
    let customWeatherView3 = WeatherView(time: "Now", image: UIImage(systemName: "cloud.sun.fill")!, temperature: "21")
    let customWeatherView4 = WeatherView(time: "Now", image: UIImage(systemName: "cloud.sun.fill")!, temperature: "21")
    let customWeatherView5 = WeatherView(time: "Now", image: UIImage(systemName: "cloud.sun.fill")!, temperature: "21")
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "서울시"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "21°"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 102, weight: .thin)
        label.textAlignment = .center
        return label
    }()
    
    private var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private var temperatureRangeLabel: UILabel = {
        let label = UILabel()
        label.text = "최고:29° 최저:15°"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private var weatherDescriptionLabel:UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    
    private var strokeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private var strokeView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private var firstStackView:UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 4
            return stackView
        }()
        
        private var secondStackView:UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 10
            stackView.layer.borderWidth = 1.0 // 테두리 두께
            stackView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
            stackView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03).cgColor
            stackView.layer.cornerRadius = 15.0 // 코너 둥글기 반경
            stackView.layer.masksToBounds = true // 마스크 설정
            return stackView
        }()
    
//    private var weatherStackScrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.isPagingEnabled = true
//        scrollView.backgroundColor = .white
//        return scrollView
//    }()
//
    private var weatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 22
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 100
        return stackView
    }()
    
    private var pageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    
    private var image1View: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "location.fill"))
        imageView.tintColor = . white
        //imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return imageView
    }()
    
    private var image2View: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        imageView.tintColor = . white
        //imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return imageView
    }()

    private var image3View: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "map.fill"))
        imageView.tintColor = . white
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    private var image4View: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "list.bullet"))
        imageView.tintColor = . white
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    @objc func image4Tapped() {
        navigationController?.popViewController(animated: true)
    }

}
