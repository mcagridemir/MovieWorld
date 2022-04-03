//
//  StoryboardRedirect.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import Foundation
import UIKit

enum StoryboardRedirect: String {
    case MainPage
    case Detail
    
    var instance: UIStoryboard {
      return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}
