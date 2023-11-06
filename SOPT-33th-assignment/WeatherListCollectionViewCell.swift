//
//  WeatherListCollectionViewCell.swift
//  SOPT-33th-assignment
//
//  Created by 이자민 on 2023/10/30.
//

import UIKit
import SnapKit
import Then

class WeatherListCollectionViewCell: UICollectionViewCell {
    static let identifier:String = "WeatherListCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [backgroundImageView, stackView, label3, label4, label5].forEach{
            self.contentView.addSubview($0)
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }

        [label1, label2].forEach{
            self.stackView.addArrangedSubview($0)
        }

        label3.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
            
        }
        label4.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
            
        }
        label5.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
            
        }
        
    }
    
    
    private lazy var backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "list")
    }
    
    private var label1: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        //label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    
    private var label2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        //label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    private var label3: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        //label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    private var label4: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 52, weight: .light)
        //label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    private var label5: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        //label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        
        return stackView
    }()
     
    @objc private func weatherListTap() {
        print("Tap")
    }
    
    func bindData(data: WeatherListCollectionData,
                  row: Int) {
        self.backgroundImageView.image = UIImage(named: data.image)
        self.label1.text = data.label1
        self.label2.text = data.label2
        self.label3.text = data.label3
        self.label4.text = data.label4
        self.label5.text = data.label5
        
    }

}
