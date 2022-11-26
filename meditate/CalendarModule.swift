//
//  CalendarModule.swift
//  meditate
//
//  Created by Zoe Matrullo on 27/11/22.
//

import SwiftUI
import FSCalendar

class CalendarModule: UIViewController, FSCalendarDelegate {
    
    var calendar = FSCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initCalendar()
        view.addSubview(calendar)
    }
    
    private func initCalendar() {
        calendar.backgroundColor = UIColor(CustomColor.cream)
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        calendar.appearance.headerTitleColor = UIColor(CustomColor.darkgreen)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        calendar.appearance.titleDefaultColor = UIColor(CustomColor.brown)
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        calendar.appearance.weekdayTextColor = UIColor(CustomColor.darkgreen)
        calendar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
        calendar.appearance.todayColor = UIColor(CustomColor.darkgreen)
        calendar.appearance.selectionColor = UIColor(CustomColor.beige)
    }
}

struct CalendarModuleViewController: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CalendarModuleViewController>) -> UIViewController {
        let viewController = CalendarModule()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CalendarModuleViewController>) {
    
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    final class Coordinator: NSObject, FSCalendarDelegate {
        private var parent: CalendarModuleViewController
        
        
        init (_ parent: CalendarModuleViewController) {
            self.parent = parent
        }
        
    }
}

struct CalendarModuleView: View {
    
    var body: some View {
        CalendarModuleViewController()
    }
    
}

