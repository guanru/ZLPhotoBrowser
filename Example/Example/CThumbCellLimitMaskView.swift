//
//  CThumbCellLimitMaskView.swift
//  Example
//
//  Created by hunbei on 2023/3/10.
//

import UIKit
import ZLPhotoBrowser

class CThumbCellLimitMaskView: UIView {
    
    var shouldHideAssetTagStyle: Bool = false
    
    private lazy var bottomAlertView: UIView = {
        let view = UIView()
        view.layer.contents = UIImage(named: "zl_shadow")?.cgImage
        view.isHidden = true
        return view
    }()
    
    private lazy var waringImgView: UIImageView = {
        let imgv = UIImageView(image: UIImage(named: "image_picker_alert"))
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    private lazy var waringLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "像素不足"
        return label
    }()
    
    private var stackView: UIStackView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bottomAlertView)
        let stack = UIStackView(arrangedSubviews: [waringImgView, waringLabel])
        stack.spacing = 2.0
        stack.axis = .horizontal
        bottomAlertView.addSubview(stack)
        stackView = stack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        bottomAlertView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(20.0)
        }
        stackView?.snp.makeConstraints({ make in
            make.center.equalToSuperview()
        })
        super.layoutSubviews()
    }
}

extension CThumbCellLimitMaskView: CCThumbnailLimitMaskProtocol {
    func updateMaskStyle(with photoModel: ZLPhotoModel) {
        print("更新蒙层样式")
        print("pixelWidth: \(photoModel.asset.pixelWidth), pixelHeight: \(photoModel.asset.pixelHeight)")
        if photoModel.asset.pixelWidth < 1200 || photoModel.asset.pixelHeight < 1200 {
            backgroundColor = ZLPhotoUIConfiguration.default().invalidMaskColor
            bottomAlertView.isHidden = false
            shouldHideAssetTagStyle = true
        } else {
            backgroundColor = .clear
            bottomAlertView.isHidden = true
            shouldHideAssetTagStyle = false
        }
    }
}
