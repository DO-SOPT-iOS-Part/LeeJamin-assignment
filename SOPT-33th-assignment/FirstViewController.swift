
import UIKit
import SnapKit
import Then

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FirstView")
        self.navigationItem.title = "날씨"
        let ellipsisButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(ellipsisButtonTapped))
        navigationItem.rightBarButtonItem = ellipsisButton
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationBar.prefersLargeTitles = true
            ellipsisButton.tintColor = .white
            //navigationBar.setBackgroundImage(UIImage(), for: .default)
//            navigationBar.shadowImage = UIImage()
            navigationBar.barTintColor = .black // 네비게이션 바 배경색
                        navigationBar.isTranslucent = false // 투명도 비활성화
            
        }
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController?.searchBar.placeholder = "도시 또는 공항 검색"
        searchController.searchBar.backgroundColor = .black
        searchController.searchBar.searchTextField.backgroundColor = UIColor(red: 0.102, green: 0.102, blue: 0.102, alpha: 1)
        
        
//        searchController.searchBar.searchTextField.snp.makeConstraints{
//            //$0.edges.equalToSuperview()
//            $0.trailing.leading.equalToSuperview().inset(20)
//            $0.centerY.equalToSuperview()
//            $0.height.equalTo(40)
//        }

        
        self.navigationItem.searchController = searchController
        
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
        
    }
    
    private let scrollView = UIScrollView()
    private let searchBar = UISearchBar()
    private var contentView = UIView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .clear
    }
    private let label = UILabel()
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 40), height: (UIScreen.main.bounds.width - 6) / 3 )
        flowLayout.minimumLineSpacing = 16
        flowLayout.minimumInteritemSpacing = 3
        flowLayout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 16, right: 0)
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(WeatherListCollectionViewCell.self,
                                     forCellWithReuseIdentifier: WeatherListCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    
    @objc func ellipsisButtonTapped() {
        // ellipsis.circle 버튼 탭
        print("ellipsis Tapped")
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    @objc func weatherListTapped(_ indexPath: IndexPath) {
        // ellipsis.circle 버튼 탭
        print("weather Tapped")
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
}

extension FirstViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        weatherListTapped(indexPath)
    }
}
extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(imageCollectionList.count)
        return imageCollectionList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherListCollectionViewCell.identifier,
                                                            for: indexPath) as? WeatherListCollectionViewCell else {return UICollectionViewCell()}
        //item.delegate = self
        item.bindData(data: imageCollectionList[indexPath.row], row: indexPath.row)
        return item
    }
}


