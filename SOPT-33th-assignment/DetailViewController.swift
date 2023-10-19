
import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for family in UIFont.familyNames {
                    print(family)
                    
                    for names in UIFont.fontNames(forFamilyName: family) {
                        print("== \(names)")
                    }
        }
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        
        // 이미지 뷰를 전체 화면에 채우도록
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImageView)
        self.setLayout()
        
    }
    
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
        
        
        
        [firstStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([firstStackView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor,constant: 34),
                                     firstStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     firstStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)])
        
        
        [titleLabel].forEach {
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            firstStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor),
                                     titleLabel.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor),
                                     titleLabel.topAnchor.constraint(equalTo: firstStackView.topAnchor)
                                    ])
        
    }
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "서울시"
        label.textColor = .white
        label.font = UIFont(name: "SFProDisplay-Bold", size: 76)
        label.textAlignment = .center
        return label
    }()
    
    private var temperatureLabel:UILabel = {
        let label = UILabel()
        label.text = "21°"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private var firstStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
}
