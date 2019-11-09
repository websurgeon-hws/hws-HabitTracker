//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities = Activities()
    
    @State private var actitivityTitle: String = ""
    @State private var actitivityDescription: String = ""
    @State private var showingValidationError = false

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: self.$actitivityTitle)
                TextField("Description", text: self.$actitivityDescription)
            }
            .navigationBarTitle("Add Activity", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                },
                trailing:
                    Button("Save") {
                        if self.actitivityTitle.isEmpty {
                            let activity = Activity(title: self.actitivityTitle,
                                                    description: self.actitivityDescription)
                            self.activities.items.append(activity)
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            self.showingValidationError = true
                        }
                    }
            )
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
