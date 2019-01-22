//
//  ViewController+action.swift
//  TableViewCapture
//
//  Created by dchSsk on 2019/01/22.
//  Copyright © 2019 dchssk. All rights reserved.
//

import UIKit

extension UIViewController {
	@IBAction func barButtonAction(_ sender: Any) {
		guard let navigationController = self as? UINavigationController,
			let viewController = navigationController.topViewController as? ImageProtocol else {
			abort()
		}
		guard let image = viewController.createViewImage() else {
			print("capture fail")
			return
		}
		let activityItems: [Any] = [image]
		let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
		
		if UIDevice.current.userInterfaceIdiom == .pad {
			activityVC.popoverPresentationController?.sourceView = self.view
			activityVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.size.height / 2.0, width: 1.0, height: 1.0)
		}
		self.present(activityVC, animated: true, completion: nil)
	}
}
