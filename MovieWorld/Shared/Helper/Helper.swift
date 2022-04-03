//
//  Helper.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import UIKit

class Helper {
     class func getFont(type: CustomFont, size: CGFloat) -> UIFont {
        let fontSize = ((Globals.shared.screenWidth * size) / 375)
        switch type {
        case .regular:
            return FontFamily.SFProText.regular.font(size: fontSize)
        case .medium:
            return FontFamily.SFProText.medium.font(size: fontSize)
        case .bold:
            return FontFamily.SFProText.bold.font(size: fontSize)
        case .light:
            return FontFamily.SFProText.light.font(size: fontSize)
        case .semibold:
            return FontFamily.SFProText.semibold.font(size: fontSize)
        case .thin:
            return FontFamily.SFProText.thin.font(size: fontSize)
        case .heavy:
            return FontFamily.SFProText.heavy.font(size: fontSize)
        case .semiboldItalic:
            return FontFamily.SFProText.semiboldItalic.font(size: fontSize)
        case .boldItalic:
            return FontFamily.SFProText.boldItalic.font(size: fontSize)
        }
    }
    
    class func formatDate(dateTxt: String, inputFormat: String? = nil, outputFormat: String? = nil) -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = inputFormat ?? "dd.MM.yyyy"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = outputFormat ?? "yyyy-MM-ddTHH:mm:ss"
        if let date = dateFormatterGet.date(from: dateTxt) {
            return dateFormatterPrint.string(from: date)
        }
        return nil
    }
}
