# 과제

## 다음 API를 사용하여 UITableView 또는 UICollectionView 로 리스트 화면 구성

1. 요구조건
- API: https://jsonplaceholder.typicode.com/users
- 순수 Swift만으로 구현
- 라이브러리 사용 금지
- 통신모듈 URLSession 을 사용하여 구현
- 데이터 파싱 Codable 프로토콜 채택하여 구조체로 데이터를 관리 및 사용
2. 리스트 화면 구성
- 스토리보드 사용
- 화면구성 (총 3개 화면)
    ◆ 리스트
    ◆ 상세
    ◆ SafariViewController
- UITableView || UICollectionView 택일하여 리스트 구성 - name, username, email 데이터 사용하여 리스트 구현
- 나머지 데이터를 사용하여 상세 페이지 구현
- Url 데이터 -> SFSafariViewController 로 오픈
- 전화번호 -> 전화로연결
- email -> 메일쓰기오픈
- 상세화면 MapView에 Geo정보로 pin표시
- pulltoRefresh 구현
- 통신실패시화면처리
