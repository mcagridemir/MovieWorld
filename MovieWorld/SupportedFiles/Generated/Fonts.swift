// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum SFPro {
    internal static let opticalSize17Weight1000 = FontConvertible(name: "SFPro-Black", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS400Weight1000 = FontConvertible(name: "SFPro-BlackItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let opticalSize17Weight700 = FontConvertible(name: "SFPro-Bold", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS430Weight700 = FontConvertible(name: "SFPro-BoldItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let opticalSize17Weight860 = FontConvertible(name: "SFPro-Heavy", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS400Weight8584 = FontConvertible(name: "SFPro-HeavyItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let opticalSize17Weight274315 = FontConvertible(name: "SFPro-Light", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS400Weight27631 = FontConvertible(name: "SFPro-LightItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let opticalSize17Weight510 = FontConvertible(name: "SFPro-Medium", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS436Weight508 = FontConvertible(name: "SFPro-MediumItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let opticalSize17Weight400 = FontConvertible(name: "SFPro-Regular", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS400Weight400 = FontConvertible(name: "SFPro-RegularItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let opticalSize17Weight590 = FontConvertible(name: "SFPro-Semibold", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS4192Weight5908 = FontConvertible(name: "SFPro-SemiboldItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let opticalSize17Weight110725 = FontConvertible(name: "SFPro-Thin", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS400Weight11272 = FontConvertible(name: "SFPro-ThinItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let opticalSize17Weight30925 = FontConvertible(name: "SFPro-Ultralight", family: "SF Pro", path: "SF-Pro.ttf")
    internal static let opticalSize17YAXS400Weight289299 = FontConvertible(name: "SFPro-UltralightItalic", family: "SF Pro", path: "SF-Pro-Italic.ttf")
    internal static let all: [FontConvertible] = [opticalSize17Weight1000, opticalSize17YAXS400Weight1000, opticalSize17Weight700, opticalSize17YAXS430Weight700, opticalSize17Weight860, opticalSize17YAXS400Weight8584, opticalSize17Weight274315, opticalSize17YAXS400Weight27631, opticalSize17Weight510, opticalSize17YAXS436Weight508, opticalSize17Weight400, opticalSize17YAXS400Weight400, opticalSize17Weight590, opticalSize17YAXS4192Weight5908, opticalSize17Weight110725, opticalSize17YAXS400Weight11272, opticalSize17Weight30925, opticalSize17YAXS400Weight289299]
  }
  internal enum SFProDisplay {
    internal static let black = FontConvertible(name: "SFProDisplay-Black", family: "SF Pro Display", path: "SF-Pro-Display-Black.otf")
    internal static let blackItalic = FontConvertible(name: "SFProDisplay-BlackItalic", family: "SF Pro Display", path: "SF-Pro-Display-BlackItalic.otf")
    internal static let bold = FontConvertible(name: "SFProDisplay-Bold", family: "SF Pro Display", path: "SF-Pro-Display-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "SFProDisplay-BoldItalic", family: "SF Pro Display", path: "SF-Pro-Display-BoldItalic.otf")
    internal static let heavy = FontConvertible(name: "SFProDisplay-Heavy", family: "SF Pro Display", path: "SF-Pro-Display-Heavy.otf")
    internal static let heavyItalic = FontConvertible(name: "SFProDisplay-HeavyItalic", family: "SF Pro Display", path: "SF-Pro-Display-HeavyItalic.otf")
    internal static let light = FontConvertible(name: "SFProDisplay-Light", family: "SF Pro Display", path: "SF-Pro-Display-Light.otf")
    internal static let lightItalic = FontConvertible(name: "SFProDisplay-LightItalic", family: "SF Pro Display", path: "SF-Pro-Display-LightItalic.otf")
    internal static let medium = FontConvertible(name: "SFProDisplay-Medium", family: "SF Pro Display", path: "SF-Pro-Display-Medium.otf")
    internal static let mediumItalic = FontConvertible(name: "SFProDisplay-MediumItalic", family: "SF Pro Display", path: "SF-Pro-Display-MediumItalic.otf")
    internal static let regular = FontConvertible(name: "SFProDisplay-Regular", family: "SF Pro Display", path: "SF-Pro-Display-Regular.otf")
    internal static let regularItalic = FontConvertible(name: "SFProDisplay-RegularItalic", family: "SF Pro Display", path: "SF-Pro-Display-RegularItalic.otf")
    internal static let semibold = FontConvertible(name: "SFProDisplay-Semibold", family: "SF Pro Display", path: "SF-Pro-Display-Semibold.otf")
    internal static let semiboldItalic = FontConvertible(name: "SFProDisplay-SemiboldItalic", family: "SF Pro Display", path: "SF-Pro-Display-SemiboldItalic.otf")
    internal static let thin = FontConvertible(name: "SFProDisplay-Thin", family: "SF Pro Display", path: "SF-Pro-Display-Thin.otf")
    internal static let thinItalic = FontConvertible(name: "SFProDisplay-ThinItalic", family: "SF Pro Display", path: "SF-Pro-Display-ThinItalic.otf")
    internal static let ultralight = FontConvertible(name: "SFProDisplay-Ultralight", family: "SF Pro Display", path: "SF-Pro-Display-Ultralight.otf")
    internal static let ultralightItalic = FontConvertible(name: "SFProDisplay-UltralightItalic", family: "SF Pro Display", path: "SF-Pro-Display-UltralightItalic.otf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, heavy, heavyItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, semibold, semiboldItalic, thin, thinItalic, ultralight, ultralightItalic]
  }
  internal enum SFProText {
    internal static let black = FontConvertible(name: "SFProText-Black", family: "SF Pro Text", path: "SF-Pro-Text-Black.otf")
    internal static let blackItalic = FontConvertible(name: "SFProText-BlackItalic", family: "SF Pro Text", path: "SF-Pro-Text-BlackItalic.otf")
    internal static let bold = FontConvertible(name: "SFProText-Bold", family: "SF Pro Text", path: "SF-Pro-Text-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "SFProText-BoldItalic", family: "SF Pro Text", path: "SF-Pro-Text-BoldItalic.otf")
    internal static let heavy = FontConvertible(name: "SFProText-Heavy", family: "SF Pro Text", path: "SF-Pro-Text-Heavy.otf")
    internal static let heavyItalic = FontConvertible(name: "SFProText-HeavyItalic", family: "SF Pro Text", path: "SF-Pro-Text-HeavyItalic.otf")
    internal static let light = FontConvertible(name: "SFProText-Light", family: "SF Pro Text", path: "SF-Pro-Text-Light.otf")
    internal static let lightItalic = FontConvertible(name: "SFProText-LightItalic", family: "SF Pro Text", path: "SF-Pro-Text-LightItalic.otf")
    internal static let medium = FontConvertible(name: "SFProText-Medium", family: "SF Pro Text", path: "SF-Pro-Text-Medium.otf")
    internal static let mediumItalic = FontConvertible(name: "SFProText-MediumItalic", family: "SF Pro Text", path: "SF-Pro-Text-MediumItalic.otf")
    internal static let regular = FontConvertible(name: "SFProText-Regular", family: "SF Pro Text", path: "SF-Pro-Text-Regular.otf")
    internal static let regularItalic = FontConvertible(name: "SFProText-RegularItalic", family: "SF Pro Text", path: "SF-Pro-Text-RegularItalic.otf")
    internal static let semibold = FontConvertible(name: "SFProText-Semibold", family: "SF Pro Text", path: "SF-Pro-Text-Semibold.otf")
    internal static let semiboldItalic = FontConvertible(name: "SFProText-SemiboldItalic", family: "SF Pro Text", path: "SF-Pro-Text-SemiboldItalic.otf")
    internal static let thin = FontConvertible(name: "SFProText-Thin", family: "SF Pro Text", path: "SF-Pro-Text-Thin.otf")
    internal static let thinItalic = FontConvertible(name: "SFProText-ThinItalic", family: "SF Pro Text", path: "SF-Pro-Text-ThinItalic.otf")
    internal static let ultralight = FontConvertible(name: "SFProText-Ultralight", family: "SF Pro Text", path: "SF-Pro-Text-Ultralight.otf")
    internal static let ultralightItalic = FontConvertible(name: "SFProText-UltralightItalic", family: "SF Pro Text", path: "SF-Pro-Text-UltralightItalic.otf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, heavy, heavyItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, semibold, semiboldItalic, thin, thinItalic, ultralight, ultralightItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [SFPro.all, SFProDisplay.all, SFProText.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(macOS)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(macOS)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
