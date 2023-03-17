//
//  CCThumbnailLimitMaskProtocol.swift
//  ZLPhotoBrowser
//
//  Created by hunbei on 2023/3/10.
//

import UIKit

/// Cola: 缩略图cell, 自定义无效蒙层
public protocol CCThumbnailLimitMaskProtocol: UIView {
    /// Cola: 是否需要隐藏asset类型样式
    var shouldHideAssetTagStyle: Bool { get set }
    /// Cola: 缩略图cell允许交互
    var isCellEnableSelect: Bool { get set }
    
    /// 根据图片model更新蒙层样式
    /// - Returns: 返回值控制cell是否允许选中
    func updateMaskStyle(with photoModel: ZLPhotoModel)
}

extension CCThumbnailLimitMaskProtocol {
    public func updateMaskStyle(with photoModel: ZLPhotoModel) {
        return
    }
}

public class CCThumbnailLimitMaskView: UIView, CCThumbnailLimitMaskProtocol {
    public var shouldHideAssetTagStyle: Bool = false
    public var isCellEnableSelect: Bool = true
}
