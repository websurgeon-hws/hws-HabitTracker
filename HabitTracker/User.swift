//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import Foundation

class User: ObservableObject {
    @Published var activities = [Activity]()
}
