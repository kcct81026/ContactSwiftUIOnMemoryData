//
//  AddContactView.swift
//  ContactSwiftUI
//
//  Created by KC on 15/07/2022.
//

import SwiftUI

struct AddContactView: View {
    
    @Binding var isPrensented : Bool
    
    @State var textFieldName : String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment : .leading){
                TextField("Enter name", text: $textFieldName)
                    .padding([.leading, .trailing], 10)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray)
                )
                
                HStack{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(.systemGreen))
                    Text("add phone")
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Add Contact View", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.isPrensented = false 
            },label: {
                Text("Cancel")
            }), trailing: Button(action: {
                self.addContact()
                self.isPrensented = false
            }, label: {
                Text("Done")
            }))
        }
    }
    
    
    
    private func addContact(){

        ContactRepo.shared.contacts.append(ContactVO(name: self.textFieldName, phoneNumbers: [PhoneNumberVO]()))
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(isPrensented: .constant(true))
    }
}
