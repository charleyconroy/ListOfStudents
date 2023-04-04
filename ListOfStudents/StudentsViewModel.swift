//
//  StudentsViewModel.swift
//  ListOfStudents
//
//  Created by Charley Conroy on 3/27/23.
//

import Foundation

class StudentsViewModel: ObservableObject {
    @Published var studentsArray: [Student] = []
    
    init() {
        loadData()
    }
    
    func saveStudent(student: Student) {
        if student.id == nil { //clicked on plus
            var newStudent = student
            newStudent.id = UUID().uuidString
            studentsArray.append(newStudent)
        } else { //clicked on an element of the list
            if let index = studentsArray.firstIndex(where: {$0.id == student.id}) {
                studentsArray[index] = student
            }
        }
        saveData()
    }
    
    func deleteStudent(indexSet: IndexSet) {
        studentsArray.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveStudent(fromOffsets: IndexSet, InttoOffset: Int) {
        studentsArray.move(fromOffsets: fromOffsets, toOffset: InttoOffset)
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "studentsArray")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            studentsArray = try JSONDecoder().decode(Array<Student>.self, from: data)
        } catch {
            print("🤮 ERROR: Could not load data \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "studentsArray")
        let data = try? JSONEncoder().encode(studentsArray)
        do {
            try data?.write(to: path)
        } catch {
            print("🤮 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
}
