//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities: Activities
    @State private var showingAddActivity = false

    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) {
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
                AddActivityView(activities: self.activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let activities = Activities(items: [
        Activity(title: "Acitivty 1",
                 description: "Activity 1 Detail"),
        Activity(title: "Acitivty 2",
                 description: "Activity 2 Detail"),
        Activity(title: "Acitivty 2",
                 description: "Activity 2 Detail"),
    ])

    static var previews: some View {
        ContentView(activities: activities)
    }
}
