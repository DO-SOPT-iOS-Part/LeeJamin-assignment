//
//  DetailCollectionViewCell.swift
//  SOPT-33th-assignment
//
//  Created by 이자민 on 2023/11/02.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "DetailCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [stackView].forEach{
            self.contentView.addSubview($0)
        }
        
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }

        [label1,ImageView, label2].forEach{
            self.stackView.addArrangedSubview($0)
        }
        
//
//        label1.snp.makeConstraints{
//            $0.leading.trailing.equalToSuperview()
//            $0.centerX.equalToSuperview()
//        }
        
        ImageView.snp.makeConstraints{
            $0.height.equalTo(35)
            //$0.centerX.equalToSuperview().inset()
        }
    }
    
    
    private lazy var ImageView = UIImageView().then {
        $0.image = UIImage(named: "image5")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .white
    }
    
    private var label1: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        //label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    
    private var label2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        //label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .equalCentering
        
        return stackView
    }()
     
    @objc private func weatherListTap() {
        print("Tap")
    }
    
    func bindData2(data: WeatherInfoListCollectionData,
                  row: Int) {
        self.ImageView.image = UIImage(systemName: data.image)
        self.label1.text = data.label1
        self.label2.text = data.label2
        
    }
    
}
