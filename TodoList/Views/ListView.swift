import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
            ZStack{
                if listViewModel.items.isEmpty{
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 1.0)))
                    
                }else{
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItems(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItems)
                        .onMove(perform: listViewModel.moveItems)
                    }
                    .textContentType(.none) // Ignore the autofill suggestion
                    .listStyle(InsetGroupedListStyle())
                    
                }
                
            } // ZStack end
            .navigationTitle("Todo List 📝")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
       
    }
}



// #Preview is a directive (special command or instruction...)
#Preview {
    NavigationView {
        ListView()
    }
    .preferredColorScheme(.dark)
    .environmentObject(ListViewModel())
}

