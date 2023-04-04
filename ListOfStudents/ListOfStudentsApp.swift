//
//  ListOfStudentsApp.swift
//  ListOfStudents
//
//  Created by Charley Conroy on 3/27/23.
//

import SwiftUI

@main
struct ListOfStudentsApp: App {
    @StateObject var studentVM = StudentsViewModel()
    var body: some Scene {
        WindowGroup {
            StudentListView()
                .environmentObject(studentVM)
        }
    }
}
