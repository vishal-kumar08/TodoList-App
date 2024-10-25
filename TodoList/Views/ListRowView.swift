import SwiftUI

struct ListRowView: View {
    var item: itemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }
    }
}







    /*    we should preview struct for preview the output  otherwise we dont need becoz we have call this in main file (listView)   */

//struct Preview: PreviewProvider{
//    static var firstItem = itemModel(title: "frist item", isCompleted: true)
//    static var secondItem = itemModel(title: "second item", isCompleted: false)
//
//    static var previews: some View{
//        Group{
//            ListRowView(item: firstItem)
//            ListRowView(item: secondItem)
//
//        }
//       //    .previewLayout(.sizeThatFits)
//    }
//}

//#Preview {
//    NavigationView{
//        ListRowView(title: "This is my first title")
//    }
//}
