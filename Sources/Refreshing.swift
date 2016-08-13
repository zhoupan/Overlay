//
//  Refreshing.swift
//  Overlay
//
//  Created by Justin Jia on 6/29/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import UIKit

public extension UIBarItem {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        refresh()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        refresh()
    }

}

public extension UIView {

    public override func awakeFromNib() {
        super.awakeFromNib()
        refresh()
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        refresh()
    }

}

extension UIBarItem: ViewCustomizable {
    
    public func refresh() {
        if let style = self as? CustomImage {
            image = style.selected(style.imageStyle)
        }
        
        if let style = self as? CustomBarItemLandscapeImagePhone {
            landscapeImagePhone = style.selected(style.landscapeImagePhoneStyle)
        }
    }
    
}

public extension UIBarButtonItem {
    
    public override func refresh() {
        super.refresh()
        
        if let style = self as? CustomBarItemTintColor {
            tintColor = style.selected(style.tintColorStyle)
        }
    }
    
}

public extension UITabBarItem {
    
    public override func refresh() {
        super.refresh()
        
        if #available(iOS 10.0, *), let style = self as? CustomBarItemBadgeColor {
            badgeColor = style.selected(style.badgeColorStyle)
        }
        
        if let style = self as? CustomBarItemSelectedImage {
            selectedImage = style.selected(style.selectedImageStyle)
        }
    }
    
}

extension UIView: ViewCustomizable {

    public func refresh() {
        if let layout = self as? CustomLayout, let contentView = layout.contentView(of: self), !subviews.contains(contentView) {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            insertSubview(contentView, at: 0)
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            contentView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        }

        if let style = self as? CustomTintColor {
            tintColor = style.selected(style.tintColorStyle)
        }

        if let style = self as? CustomBackgroundColor {
            backgroundColor = style.selected(style.backgroundColorStyle)
        }
    }

}

public extension UIActivityIndicatorView {

    override public func refresh() {
        super.refresh()

        if let style = self as? CustomActivityIndicatorViewColor {
            color = style.selected(style.colorStyle)
        }
    }

}

public extension UIButton {
    
    override public func refresh() {
        super.refresh()
        
        if let style = self as? CustomButtonTitleColor {
            style.setColor(style.titleColorStyle, for: setTitleColor)
        }
        
        if let style = self as? CustomButtonTitleShadowColor {
            style.setColor(style.titleShadowColorStyle, for: setTitleShadowColor)
        }
        
        if let style = self as? CustomButtonImage {
            style.setImage(style.imageStyle, for: setImage)
        }
        
        if let style = self as? CustomButtonBackgroundImage {
            style.setImage(style.backgroundImageStyle, for: setBackgroundImage)
        }
    }
    
}

public extension UISlider {
    
    public override func refresh() {
        super.refresh()
        
        if let style = self as? CustomSliderMinimumTrackTintColor {
            minimumTrackTintColor = style.selected(style.minimumTrackTintColorStyle)
        }

        if let style = self as? CustomSliderMaximumTrackTintColor {
            maximumTrackTintColor = style.selected(style.maximumTrackTintColorStyle)
        }
        
        if let style = self as? CustomSliderThumbTintColor {
            thumbTintColor = style.selected(style.thumbTintColorStyle)
        }
        
        if let style = self as? CustomSliderMinimumValueImage {
            minimumValueImage = style.selected(style.minimumValueImageStyle)
        }

        if let style = self as? CustomSliderMaximumValueImage {
            maximumValueImage = style.selected(style.maximumValueImageStyle)
        }
        
        if let style = self as? CustomSliderMinimumTrackImage {
            style.setImage(style.minimumTrackImageStyle, for: setMinimumTrackImage)
        }
        
        if let style = self as? CustomSliderMaximumTrackImage {
            style.setImage(style.maximumTrackImageStyle, for: setMaximumTrackImage)
        }
        
        if let style = self as? CustomSliderThumbImage {
            style.setImage(style.thumbImageStyle, for: setThumbImage)
        }
    }
    
}

public extension UIStepper {
    
    public override func refresh() {
        super.refresh()
        
        if let style = self as? CustomStepperBackgroundImage {
            style.setImage(style.backgroundImageStyle, for: setBackgroundImage)
        }
        
        if let style = self as? CustomStepperDecrementImage {
            style.setImage(style.decrementImageStyle, for: setDecrementImage)
        }
        
        if let style = self as? CustomStepperIncrementImage {
            style.setImage(style.incrementImageStyle, for: setIncrementImage)
        }
    }
    
}

public extension UISwitch {
    
    override public func refresh() {
        super.refresh()
        
        if let style = self as? CustomSwitchOnTintColor {
            onTintColor = style.selected(style.onTintColorStyle)
        }
        
        if let style = self as? CustomSwitchThumbTintColor {
            thumbTintColor = style.selected(style.thumbTintColorStyle)
        }
        
        if let style = self as? CustomSwitchOnImage {
            onImage = style.selected(style.onImageStyle)
        }
        
        if let style = self as? CustomSwitchOffImage {
            offImage = style.selected(style.offImageStyle)
        }
    }
    
}

public extension UITextField {
    
    override public func refresh() {
        super.refresh()
        
        if let style = self as? CustomFont {
            font = style.selected(style.fontStyle)
        }
        
        if let style = self as? CustomTextColor {
            textColor = style.selected(style.textColorStyle)
        }
    }
    
}

public extension UIImageView {
    
    override public func refresh() {
        super.refresh()
        
        if let style = self as? CustomImage {
            image = style.selected(style.imageStyle)
        }
        
        if let style = self as? CustomHighlightedImage {
            highlightedImage = style.selected(style.highlightedImageStyle)
        }
    }
    
}

public extension UILabel {

    override public func refresh() {
        super.refresh()

        if let style = self as? CustomFont {
            font = style.selected(style.fontStyle)
        }

        if let style = self as? CustomTextColor {
            textColor = style.selected(style.textColorStyle, except: [.highlighted])
            if let colorStyleGroup = style.textColorStyle as? ColorStyleGroup {
                highlightedTextColor = colorStyleGroup.highlighted()
            }
        }

        if let style = self as? CustomShadowColor {
            shadowColor = style.selected(style.shadowColorStyle)
        }
    }

}

public extension UINavigationBar {

    override public func refresh() {
        super.refresh()

        if let style = self as? CustomBarTintColor {
            barTintColor = style.selected(style.barTintColorStyle)
        }
        
        if let style = self as? CustomShadowImage {
            shadowImage = style.selected(style.shadowImageStyle)
        }
    }

}

public extension UIProgressView {

    override public func refresh() {
        super.refresh()

        if let style = self as? CustomProgressTintColor {
            progressTintColor = style.selected(style.progressTintColorStyle)
        }

        if let style = self as? CustomProgressTrackTintColor {
            trackTintColor = style.selected(style.trackTintColorStyle)
        }
        
        if let style = self as? CustomProgressImage {
            progressImage = style.selected(style.progressImageStyle)
        }
        
        if let style = self as? CustomProgressTrackImage {
            trackImage = style.selected(style.trackImageStyle)
        }
    }

}

public extension UITableView {
    
    override public func refresh() {
        super.refresh()
        
        if let style = self as? CustomTableViewSeparatorColor {
            separatorColor = style.selected(style.separatorColorStyle)
        }
        
        if let style = self as? CustomTableViewSectionIndexColor {
            sectionIndexColor = style.selected(style.sectionIndexColorStyle)
        }
        
        if let style = self as? CustomTableViewSectionIndexBackgroundColor {
            sectionIndexBackgroundColor = style.selected(style.sectionIndexBackgroundColorStyle)
        }
        
        if let style = self as? CustomTableViewSectionIndexTrackingBackgroundColor {
            sectionIndexTrackingBackgroundColor = style.selected(style.sectionIndexTrackingBackgroundColorStyle)
        }
    }
    
}

public extension UITextView {
    
    override public func refresh() {
        super.refresh()
        
        if let style = self as? CustomFont {
            font = style.selected(style.fontStyle)
        }
        
        if let style = self as? CustomTextColor {
            textColor = style.selected(style.textColorStyle)
        }
    }
    
}

public extension UISearchBar {

    override public func refresh() {
        super.refresh()

        if let style = self as? CustomBarTintColor {
            barTintColor = style.selected(style.barTintColorStyle)
        }
        
        if let style = self as? CustomBarBackgroundImage {
            backgroundImage = style.selected(style.backgroundImageStyle)
        }
        
        if let style = self as? CustomScopeBarButtonBackgroundImage {
            style.setImage(style.scopeBarButtonBackgroundImageStyle, for: setScopeBarButtonBackgroundImage)
        }
        
        if let style = self as? CustomSearchFieldBackgroundImage {
            style.setImage(style.searchFieldBackgroundImageStyle, for: setSearchFieldBackgroundImage)
        }
    }

}

public extension UITabBar {

    override public func refresh() {
        super.refresh()

        if let style = self as? CustomBarTintColor {
            barTintColor = style.selected(style.barTintColorStyle)
        }

        if #available(iOS 10.0, *), let style = self as? CustomTabBarUnselectedItemTintColor {
            unselectedItemTintColor = style.selected(style.unselectedItemTintColorStyle)
        }

        if let style = self as? CustomShadowImage {
            shadowImage = style.selected(style.shadowImageStyle)
        }
        
        if let style = self as? CustomBarBackgroundImage {
            backgroundImage = style.selected(style.backgroundImageStyle)
        }
    }

}

public extension UIToolbar {

    override public func refresh() {
        super.refresh()

        if let style = self as? CustomBarTintColor {
            barTintColor = style.selected(style.barTintColorStyle)
        }
    }

}

