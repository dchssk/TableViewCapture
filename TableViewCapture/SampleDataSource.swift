//
//  SampleDataSource.swift
//  TableViewCapture
//
//  Created by dchSsk on 2019/01/22.
//  Copyright © 2019 dchssk. All rights reserved.
//

import UIKit

class SampleDataSource : NSObject, UITableViewDataSource, UITableViewDelegate {
	
	var dataCount: Int = 60
	
	// MARK: - tableView delegate
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataCount
	}

	func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		return false	// 移動禁止
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return false		// 編集禁止
	}
	
	func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = table.dequeueReusableCell(withIdentifier: "sample", for: indexPath)
		
		cell.textLabel?.text = String.init(format: "count %d", indexPath.row)
		
		return cell
	}
}
