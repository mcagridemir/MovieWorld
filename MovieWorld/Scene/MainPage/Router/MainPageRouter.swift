//
//  MainPageRouter.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import UIKit

class MainPageRouter {
    class func showDetailPage(id: String?, nav: UINavigationController?, viewController: UIViewController) {
        guard let vc = StoryboardRedirect.Detail.instance.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.initWithId(id: id ?? "")
        nav?.show(vc, sender: viewController)
    }
}
