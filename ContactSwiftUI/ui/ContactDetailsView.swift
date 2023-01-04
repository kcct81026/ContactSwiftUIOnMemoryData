//
//  ContactDetailsView.swift
//  ContactSwiftUI
//
//  Created by KC on 15/07/2022.
//

import SwiftUI

struct ContactDetailsView: View {
    
    @State var isUpdateContactViewShowing : Bool = false
    
    var data: ContactVO
    
    var body: some View {
        ScrollView{
            HStack{
                
                VStack(alignment: .leading){
                    Text("Phone Numbers")
                        .font(Font.system(size: 20))
                    ForEach(data.phoneNumbers, id:
                                \.id, content: { item  in
                        Button(action: {
                            
                        }, label: {
                            Text("\(item.number)")
                        })
                    })
                    Divider().foregroundColor(Color(.gray))
                }
                Spacer()
            }.padding()

        }
        .navigationBarTitle("User Name")
        .navigationBarItems(trailing: Button(action: {
            self.isUpdateContactViewShowing = true
        }, label: {
            Text("Edit")
        }).sheet(isPresented: $isUpdateContactViewShowing, content: { UpdateContactView(isPrensented: self.$isUpdateContactViewShowing, data: data)})
        )
    }
    
    
    
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(data: ContactVO(name: "Ma Ma ", phoneNumbers:[]))
    }
}
