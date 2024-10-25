import SwiftUI

struct itemModel: Identifiable , Codable{
    var id: String
    var title: String
    var isCompleted: Bool

    // Init
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id // Use the id parameter
        self.title = title
        self.isCompleted = isCompleted
    }
    mutating func toggleCompletion() {
        isCompleted.toggle()
    }
    
    
}



