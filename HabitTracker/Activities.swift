//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import Foundation

class Activities: ObservableObject {
    @Published var items: [Activity]
    
    init(items: [Activity] = []) {
        self.items = items
    }
}
