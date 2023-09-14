//
//  ListCell.swift
//  UserList
//
//  Created by 심성곤 on 2023/08/17.
//

import UIKit

/// 사용자 목록 셀
final class ListCell: UITableViewCell {
    /// 이름 레이블
    @IBOutlet weak private var lblName: UILabel!
    /// 사용자명 레이블
    @IBOutlet weak private var lblUsername: UILabel!
    /// 이메일 레이블
    @IBOutlet weak private var lblEmail: UILabel!
    
    /// 데이터 설정
    func configure(data: User) {
        lblName.text = data.name
        lblUsername.text = data.username
        lblEmail.text = data.email
    }
}
