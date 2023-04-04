//
//  Student.swift
//  ListOfStudents
//
//  Created by Charley Conroy on 3/27/23.
//

import Foundation

enum Year: String, CaseIterable, Codable {
    case freshman, sophomore, junior, senior
}

struct Student: Codable, Identifiable {
    var id: String?
    var name = ""
    var major = ""
    var hometown = ""
    var year: Year = .freshman
    
}
