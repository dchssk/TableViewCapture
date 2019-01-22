//
//  TableViewOnlyViewController.swift
//  TableViewCapture
//
//  Created by dchSsk on 2019/01/22.
//  Copyright © 2019 dchssk. All rights reserved.
//

import UIKit

class TableViewOnlyViewController: UIViewController, ImageProtocol {	
	@IBOutlet weak var tableView: UITableView!
	
	/**
	TableViewだけのキャプチャを作成
	*/
	func createViewImage() -> UIImage? {
		// キャプチャサイズにTableViewのcontentSizeを指定
		let captureSize = tableView.contentSize
		print("captureSize = \(captureSize)")
		
		// context生成
		UIGraphicsBeginImageContextWithOptions(captureSize, false, 0.0)
		
		// tableViewのframe退避
		let previousFrame = tableView.frame
		
		if let context = UIGraphicsGetCurrentContext(){
			// tableviewのframeを、コンテンツサイズに一時的に変更
			tableView.frame = CGRect(x:tableView.frame.origin.x,
									 y:tableView.frame.origin.y,
									 width:tableView.contentSize.width,
									 height:tableView.contentSize.height)
			// tableViewのレイヤを描画
			tableView.layer.render(in: context)
		}
		// tableViewのframe復帰
		tableView.frame = previousFrame
		
		// image生成
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext();
		
		return image
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

