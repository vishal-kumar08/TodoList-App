import SwiftUI
struct NoItemsView: View{
    @State var animate: Bool = false
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                Text("There was no items..")
                .font(.title)
                .fontWeight(.semibold)
                
                Text("You Should Click on this add button and add bunch of items to your Todo list...")
                
                NavigationLink(destination: AddView(), label:{
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? .red : .blue)
                        .cornerRadius(15)
                    
                })
                .padding(.horizontal, animate ? 30: 50)
                .shadow(
                    color: animate ? .black.opacity(0.7) : .blue.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: AddAnimation)
//            .scaleEffect(animate ? 1.1 : 1.0)
//            .offset(y: animate ? -7 : 0)
            
            
        } // scroll view end
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func AddAnimation(){
        //guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView{
        NoItemsView()
    }
    .navigationTitle("Title")
}
