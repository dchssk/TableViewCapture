//
//  TableViewAndOtherViewController.swift
//  TableViewCapture
//
//  Created by dchSsk on 2019/01/22.
//  Copyright © 2019 dchssk. All rights reserved.
//

import UIKit

class TableViewAndOtherViewController: UIViewController, ImageProtocol {
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var imageHolderView: UIView!
	
	/**
	TableViewとImageViewのキャプチャを生成する
	・TableViewより上の部分は、self.viewからのキャプチャとする
	・そのキャプチャに被せるようにtableViewのキャプチャを載せる
	*/
	func createViewImage() -> UIImage? {
		// キャプチャサイズ計算
		let captureSize = CGSize(width: self.view.frame.size.width,
								 height: self.imageHolderView.frame.size.height + tableView.contentSize.height)
		print("captureSize = \(captureSize)")
		
		// context生成
		UIGraphicsBeginImageContextWithOptions(captureSize, false, 0.0)
		
		// tableViewのframe退避
		let previousFrame = tableView.frame
		
		// UINavigationController調整
		var topAdjust: CGFloat = 0
		if let _ = self.navigationController {
			// 最上部に描画するViewからy座標の位置分調整する
			// もしくは、NavigationControllerの高さとステータスバーの高さを調整としても良い
			topAdjust = self.imageHolderView.frame.origin.y
		}
		if let context = UIGraphicsGetCurrentContext(){
			
			// NavigationControllerが描画域に入らないように調整して描画
			context.translateBy(x: 0, y: -topAdjust)
			self.view.layer.render(in: context)
			context.translateBy(x: 0, y: topAdjust)
			
			// tableViewの描画にむけ、contextをimageView分だけ移動
			context.translateBy(x: 0, y: self.imageHolderView.frame.size.height)
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
