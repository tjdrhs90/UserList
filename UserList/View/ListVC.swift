//
//  ListVC.swift
//  UserList
//
//  Created by 심성곤 on 2023/08/17.
//

import UIKit

/// 목록 화면
final class ListVC: UIViewController {
    
    /// 에러 메시지 레이블
    @IBOutlet weak private var lblError: UILabel!
    /// 사용자 목록 테이블뷰
    @IBOutlet weak private var tableView: UITableView!
    
    /// 새로고침 컨트롤
    private let refreshControl = UIRefreshControl()
    
    /// 뷰모델
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupBind()
    }
    
    /// 테이블뷰 설정
    private func setupTableView() {
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    /// 테이블뷰 새로고침
    @objc private func pullToRefresh() {
        Task {
            try await Task.sleep(for: .seconds(0.5))
            viewModel.fetchData()
        }
    }
    
    /// 테이블뷰 리로드
    private func reloadData() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
    
    /// 바인딩 설정
    private func setupBind() {
        
        viewModel.outputData = { [weak self] in
            self?.reloadData()
            
            self?.lblError.isHidden = true
        }
        
        viewModel.outputError = { [weak self] errMsg in
            self?.reloadData()
            
            self?.lblError.isHidden = false
            self?.lblError.text = errMsg
        }
        
        viewModel.fetchData()
    }
}

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailVC.self)) as? DetailVC else {
            return
        }
        vc.data = viewModel.users[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self)) as? ListCell else {
            return .init()
        }
        
        cell.configure(data: viewModel.users[indexPath.row])
        
        return cell
    }
}
