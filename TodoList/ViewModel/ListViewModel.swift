import SwiftUI

class ListViewModel: ObservableObject{
    
    @Published var items: [itemModel] = []{
        didSet{
            SaveItems()
        }
    }
    
    let itemsKeys: String = "item_list"
    
    
    init(){
        getItems()
    }
    
    
    func getItems(){
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKeys),
            let savedItem = try? JSONDecoder().decode([itemModel].self, from: data)
        
        else{return}
        self.items = savedItem
    }
    func deleteItems(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
           }
    func moveItems(from:IndexSet, to:Int){
        items.move(fromOffsets: from, toOffset: to)
        }

    func addItems(title:String){
        let newItem = itemModel(title: title , isCompleted: true)
        items.append(newItem)
    }
    
    func updateItems(item: itemModel) {
           if let index = items.firstIndex(where: { $0.id == item.id }) {
               items[index].toggleCompletion()
           }
       }
    
    func SaveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: "item_list")
        }
    }
    
    
    
}// class end
