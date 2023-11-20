import UIKit
import SnapKit
import Then

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
        
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImageView)
        self.setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
        self.setTableViewConfig()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(image4Tapped))
        image4View.addGestureRecognizer(tapGesture)
        image4View.isUserInteractionEnabled = true
        
        tableView.estimatedRowHeight = 55 // 예상되는 셀 높이
        tableView.rowHeight = UITableView.automaticDimension // 동적으로 셀 높이 설정

    }
    
    @objc func image4Tapped() {
        navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .clear
    }
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .init(red: 0.175, green: 0.201, blue: 0.249, alpha: 1)
        $0.separatorColor = .lightGray
        $0.separatorStyle = .singleLine
    }
    
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        self.view.addSubview(tableView)
        scrollView.addSubview(contentView)
        
        scrollView.backgroundColor = .clear
        contentView.backgroundColor = .clear
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 15
        
        
        scrollView.snp.makeConstraints {
            //$0.edges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(4)
            
            
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(1000)
        }
        
        [firstStackView, secondStackView,tableView ,strokeView2,image4View, image3View].forEach{
            contentView.addSubview($0)
        }
        
        firstStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(78)
            $0.centerX.equalToSuperview()
        }
        
        [titleLabel, temperatureLabel, weatherLabel, temperatureRangeLabel].forEach{
            firstStackView.addArrangedSubview($0)
        }
        
        secondStackView.snp.makeConstraints{
            $0.top.equalTo(firstStackView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        [weatherDescriptionLabel, strokeView, collectionView].forEach{
            secondStackView.addArrangedSubview($0)
        }
        
        weatherDescriptionLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        strokeView.snp.makeConstraints{
            $0.height.equalTo(0.2)
            $0.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(15)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(strokeView.snp.bottom).offset(10)
            
            $0.height.equalTo(120)
            //$0.bottom.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(secondStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(200)
            
        }
        
        strokeView2.snp.makeConstraints{
            $0.height.equalTo(0.2)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom).inset(75)
            
        }
        
        image4View.snp.makeConstraints{
            $0.top.equalTo(strokeView2.snp.top).inset(10)
            $0.trailing.equalTo(strokeView2.snp.trailing).inset(20)
        }
        
        image3View.snp.makeConstraints{
            $0.top.equalTo(strokeView2.snp.top).inset(10)
            $0.leading.equalTo(strokeView2.snp.leading).inset(20)
        }
        
        
        
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 50, height: 120)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 3
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 15, right: 0)
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(DetailCollectionViewCell.self,
                                     forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setTableViewConfig() {
        self.tableView.register(ItemListTableViewCell.self,
                                forCellReuseIdentifier: ItemListTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}



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
    let imageView = UIImageView(image: UIImage(systemName: "map"))
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




extension DetailViewController: UICollectionViewDelegate {}
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherInfoCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier,
                                                            for: indexPath) as? DetailCollectionViewCell else {return UICollectionViewCell()}
        //item.delegate = self
        item.bindData2(data: weatherInfoCollectionList[indexPath.row], row: indexPath.row)
        return item
    }
}


extension DetailViewController: UITableViewDelegate {}
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.identifier,
                                                       for: indexPath) as? ItemListTableViewCell else {return UITableViewCell()}
        
        cell.bindData3(data: itemListData[indexPath.row])
        return cell
    }
    
}
