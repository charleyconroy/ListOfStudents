//
//  DetailView.swift
//  ListOfStudents
//
//  Created by Charley Conroy on 3/27/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var studentVM: StudentsViewModel
    @State var student: Student
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack (alignment: .leading) {
            Text("Student Name:")
                .bold()
            TextField("Enter student name:", text: $student.name)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }
            Text("Major:")
                .bold()
            TextField("Enter major:", text: $student.major)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }
            Text("Hometown:")
                .bold()
            TextField("Enter hometown name:", text: $student.hometown)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }
            Text("Year:")
                .bold()
            Picker("", selection: $student.year) {
                ForEach(Year.allCases, id: \.self) { year in
                    Text(year.rawValue.capitalized)
                }
                .pickerStyle(.segmented)
            }
            Spacer()
        }
        .font(.title2)
        .padding()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    studentVM.saveStudent(student: Student(name: student.name, major: student.major, hometown: student.hometown, year: student.year))
                    dismiss()
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(student: Student())
                .environmentObject(StudentsViewModel())
        }
        
    }
}
