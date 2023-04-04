//
//  StudentListView.swift
//  ListOfStudents
//
//  Created by Charley Conroy on 3/27/23.
//

import SwiftUI

struct StudentListView: View {
    @EnvironmentObject var studentVM: StudentsViewModel
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(studentVM.studentsArray) { student in
                    NavigationLink {
                        DetailView(student: student)
                    } label: {
                        Image(systemName: "swift")
                            .foregroundColor(.orange)
                        Text(student.name)
                    }
                }
                .onDelete(perform: studentVM.deleteStudent)
                .onMove(perform: studentVM.moveStudent)
            }
            .listStyle(.plain)
            .font(.title2)
            .navigationTitle("Students in Swift:")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            NavigationStack {
                DetailView(student: Student())
            }
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
            .environmentObject(StudentsViewModel())
    }
}
