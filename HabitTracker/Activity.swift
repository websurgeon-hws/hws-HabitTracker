//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import Foundation

struct Activity: Identifiable, Codable {
    let id: UUID = UUID()
    let title: String
    let description: String
}
