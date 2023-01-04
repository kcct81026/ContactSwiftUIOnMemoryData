//
//  UpdateContactView.swift
//  ContactSwiftUI
//
//  Created by KC on 15/07/2022.
//

import SwiftUI

struct UpdateContactView: View {
    
    @State var textFiledName : String = ""
    @Binding var isPrensented: Bool
    
    var data: ContactVO
    
    
    init(isPrensented: Binding<Bool>, data: ContactVO){
        self._isPrensented = isPrensented
        self.data = data
        self._textFiledName = .init(initialValue: data.name)
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment : .leading){
                TextField("Enter name", text: $textFiledName)
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
                    Text("add phoone")
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Update Contact View", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.isPrensented = false
            },label: {
                Text("Cancel")
            }), trailing: Button(action: {
                self.updateContact()
                self.isPrensented = false
            }, label: {
                Text("Done")
            }))
        }
    }
    
    private func updateContact(){
        ContactRepo.shared.contacts = ContactRepo.shared.contacts.map ({ (data) -> ContactVO in
            var contact = data
            if self.data.id == data.id {
                contact.name = self.textFiledName
            }
            return contact
        })
    }
}

struct UpdateContactView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateContactView(isPrensented: .constant(true), data: ContactVO(name: "", phoneNumbers: []))
    }
}
