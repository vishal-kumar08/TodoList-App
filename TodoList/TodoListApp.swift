
import SwiftUI

@main
struct TodoListApp: App {
    var listviewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listviewModel)


        }
    }
}
