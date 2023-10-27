
import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FirstView")
        self.navigationItem.title = "날씨"
        let ellipsisButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(ellipsisButtonTapped))
        navigationItem.rightBarButtonItem = ellipsisButton
//
//        customImageViewButton.isUserInteractionEnabled = true
//        customImageViewButton.addTarget(self, action: #selector(customImageViewTapped), for: .touchUpInside)
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationBar.prefersLargeTitles = true
            ellipsisButton.tintColor = .white
        }
        customImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(customImageViewTapped))
        customImageView.addGestureRecognizer(tapGesture)

        setLayout()
        
        
                
    }
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        self.view.addSubview(search)
        scrollView.addSubview(contentView)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        search.translatesAutoresizingMaskIntoConstraints = false
        
        //navigationItem.titleView = search
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
        
        NSLayoutConstraint.activate([
            search.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            search.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            search.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor) // 원하는 위치로 조정
        ])
        
        [firstStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([firstStackView.topAnchor.constraint(equalTo:search.bottomAnchor,constant: 15),
                                     firstStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 20),
                                     firstStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -20)])

        
        [customImageView].forEach {
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            firstStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([customImageView.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor),
                                     customImageView.topAnchor.constraint(equalTo: firstStackView.topAnchor),
                                     customImageView.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor)])
        
//        customImageView.addSubview(customImageViewButton)
//        customImageViewButton.translatesAutoresizingMaskIntoConstraints = false

//        NSLayoutConstraint.activate([customImageViewButton.topAnchor.constraint(equalTo: customImageView.topAnchor),
//                                     customImageViewButton.leadingAnchor.constraint(equalTo: customImageView.leadingAnchor),
//                                     customImageViewButton.trailingAnchor.constraint(equalTo: customImageView.trailingAnchor),
//                                     customImageViewButton.bottomAnchor.constraint(equalTo: customImageView.bottomAnchor),
//                                     customImageViewButton.heightAnchor.constraint(equalTo: customImageView.heightAnchor)
//                                    ])
//        
//        NSLayoutConstraint.activate([customImageView2.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor),
//                                     customImageView2.topAnchor.constraint(equalTo: customImageView.bottomAnchor,constant: 150),
//                                     customImageView.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor)])
        
    }
    
    
    let customImageView = ListImageView(city: "의정부시",weather: "흐림",temperature: "21°", temperatureRange: "최고:29° 최저:15°")
    //let customImageView2 = ListImageView(city: "의정부",weather: "맑음",temperature: "30°", temperatureRange: "최고:29° 최저:15°")
    
    
    
    private var customImageViewButton:UIButton = {
        let customImageViewButton = UIButton(type: .custom)
        customImageViewButton.translatesAutoresizingMaskIntoConstraints = false
        customImageViewButton.backgroundColor = .clear
        
        return customImageViewButton
    }()
    
    
    private var search:UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "도시 또는 공항 검색"
        search.searchBarStyle = .minimal

        return search
    }()
    
    private var firstStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 14
        return stackView
    }()
    
    
    @objc func ellipsisButtonTapped() {
        // ellipsis.circle 버튼 탭
        print("ellipsis Tapped")
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    @objc func customImageViewTapped(sender: UITapGestureRecognizer) {
        print("Tap!")
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }


}


