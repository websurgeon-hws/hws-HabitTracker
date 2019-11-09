//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    var activities: [Activity]
    
    var body: some View {
        Text("TODO: Add Activity")
    }
}

struct ContentView: View {
    let user: User
    @State private var showingAddActivity = false

    var body: some View {
        NavigationView {
            List {
                ForEach(user.activities) {
                    Text("\($0.title)")
                }
            }
            .navigationBarTitle("Activities")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddActivity = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(activities: self.user.activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let user = User(activities: [
        Activity(title: "Acitivty 1",
                 description: "Activity 1 Detail"),
        Activity(title: "Acitivty 2",
                 description: "Activity 2 Detail"),
        Activity(title: "Acitivty 2",
                 description: "Activity 2 Detail"),
    ])

    static var previews: some View {
        ContentView(user: user)
    }
}
