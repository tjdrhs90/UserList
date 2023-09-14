//
//  ViewModel.swift
//  UserList
//
//  Created by 심성곤 on 2023/08/17.
//

import Foundation

/// 사용자 목록 뷰모델
final class ViewModel {
    
    /// 사용자 목록
    var users = [User]()
    
    /// 데이터 가져오기 완료 클로저
    var outputData: (() -> ())?
    /// 에러 발생 클로저
    var outputError: ((_ errMsg: String?) -> ())?
    
    /// 데이터 가져오기
    @MainActor func fetchData() {
        
        Task {
            do {
                users = try await Service.fetchUsers()
                outputData?()
            }
            catch {
                users.removeAll()
                outputError?(error.localizedDescription)
            }
        }
    }
}
