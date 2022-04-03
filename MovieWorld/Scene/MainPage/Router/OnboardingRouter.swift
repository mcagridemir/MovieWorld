//
//  OnboardingRouter.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import UIKit

class OnboardingRouter {
    class func showMainPage() {
        guard let vc = StoryboardRedirect.MainPage.instance.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window else { return }
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
    }
}
