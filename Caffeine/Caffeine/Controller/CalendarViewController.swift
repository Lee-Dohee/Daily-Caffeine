//
//  CalendarViewController.swift
//  Caffeine
//
//  Created by hyogang on 2021/08/18.
//

import UIKit
import SQLite3
import FSCalendar

class CalendarViewController: UIViewController {
    
    let tempMg : [Int] = [70,75, 70, 150, 75, 70, 150, 70, 75, 70]
    let tempName : [String] = ["믹스커피", "Espresso 1shot", "믹스커피", "Espresso 2shot", "Espresso 1shot", "믹스커피", "Espresso 2shot", "믹스커피", "Espresso 1shot", "믹스커피"]

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var calendarTable: UITableView!
    
    let screenSize : CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarTable.delegate = self
        calendarTable.dataSource = self
        
        calendar.delegate = self
        calendar.dataSource = self
        setCalendar()
        
        // Do any additional setup after loading the view.
    }
    
    func setCalendar(){
        
        // autoLayout
        self.view.addSubview(calendar)
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        calendar.widthAnchor.constraint(equalToConstant: screenSize.width * 0.8).isActive = true
        calendar.heightAnchor.constraint(equalTo: calendar.widthAnchor, multiplier: 1/1).isActive = true
        calendar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        calendar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        // 달력 UI
        
        // 달력의 평일 날짜 색깔
        calendar.appearance.titleDefaultColor = UIColor(named: "c100")
        // 달력의 토,일 날짜 색깔
        calendar.appearance.titleWeekendColor = UIColor(named: "c100")
        // 달력의 맨 위의 년도, 월의 색깔
        calendar.appearance.headerTitleColor = UIColor(named: "c60")
        // 달력의 요일 글자 색깔
        calendar.appearance.weekdayTextColor = UIColor(named: "c60")
        
        // 달력의 년월 글자 바꾸기
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        // 달력 언어
        calendar.locale = Locale(identifier: "ko_KR")
        
        // 년월에 흐릿하게 보이는 애들 없애기
        calendar.appearance.headerMinimumDissolvedAlpha = 0
    }
    
} // CalendarViewController


// MARK : - TableView Delegate, DataSource
extension CalendarViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempMg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = self.calendarTable.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath)
        cell.textLabel?.text = tempName[indexPath.row]
        
        return cell
    }
    
    
}

// MARK : - Calendar Delegate, DataSource
extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource{
    
}
