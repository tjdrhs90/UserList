//
//  DetailVC.swift
//  UserList
//
//  Created by 심성곤 on 2023/08/18.
//

import UIKit
import MapKit
import SafariServices

/// 상세 화면
final class DetailVC: UIViewController {
    
    /// 사용자 정보 텍스트뷰
    @IBOutlet weak private var textView: UITextView!
    /// 맵뷰
    @IBOutlet weak private var mapView: MKMapView!
    
    /// 사용자 데이터
    var data: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    /// 설정
    private func setup() {
        
        guard let data else { return }
        
        textView.text = data.printJson
        
        let address = data.address
        let geo = address.geo
        
        let coordinate = CLLocationCoordinate2D(latitude: Double(geo.lat) ?? 0, longitude: Double(geo.lng) ?? 0)
        mapView.centerCoordinate = coordinate
        mapView.region.span = .init(latitudeDelta: 100, longitudeDelta: 100)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = address.city
        annotation.subtitle = address.street
        
        mapView.addAnnotation(annotation)
    }
}

extension DetailVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        let isWebLink = url.absoluteString.hasPrefix("http")
        
        if isWebLink {
            present(SFSafariViewController(url: url), animated: true)
        }
        
        return !isWebLink
    }
}
