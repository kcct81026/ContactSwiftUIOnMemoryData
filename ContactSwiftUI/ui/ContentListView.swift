//
//  ContentView.swift
//  ContactSwiftUI
//
//  Created by KC on 14/07/2022.
//

import SwiftUI
import CoreData

struct ContentListView: View {

    @State var isAddContactViewShowing: Bool = false

    var body: some View {
        TabView{
            NavigationView{
                
                ContactListView()
                    .navigationBarTitle("Contact")
                    .navigationBarItems(trailing:
                            Button(action: {
                                self.isAddContactViewShowing = true
                                
                            }, label: {
                                Image(systemName: "plus")
                            }).sheet(isPresented: $isAddContactViewShowing, content: {
                                AddContactView(isPrensented: self.$isAddContactViewShowing)
                        })
                    ).listStyle(.plain)
            }
            
            .tabItem({
                VStack{
                    Image(systemName: "house")
                    Text("Home")
                }
            })
        }
       
       
    }
}

extension Color{
    static var random : Color{
        return Color(red: .random(in: 0.2...0.8),
                     green: .random(in: 0.2...0.8),
                     blue: .random(in: 0.2...0.8))
    }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}

struct ContantListItem: View {
    var data: ContactVO
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .frame(width: 50.0, height: 50.0, alignment: .center)
                    .foregroundColor(Color.random)
                Text("\(String(data.name.first ?? "A"))").foregroundColor(Color(.white))
            }
            Text("\(data.name)")
            
        }
    }
}

struct ContactListView: View {
    @ObservedObject var data : ContactRepo = ContactRepo.shared
    var body: some View {
        List(data.contacts,id: \.id, rowContent: { data in
            NavigationLink(destination: ContactDetailsView(data: data), label: {
                ContantListItem(data: data)
            })
            
        })
           
    }
}
