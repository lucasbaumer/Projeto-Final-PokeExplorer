// Resources/DesignTokens.swift
import SwiftUI

enum DesignTokens {
    enum Colors {
        static let primary = Color("PrimaryColor")
        static let background = Color("BackgroundColor")
        static let accent = Color("AccentColor")
    }
    
    enum FontSizes {
        static let largeTitle: CGFloat = 34
        static let title: CGFloat = 28
        static let body: CGFloat = 17
    }
    
    enum Spacing {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 32
    }
}
