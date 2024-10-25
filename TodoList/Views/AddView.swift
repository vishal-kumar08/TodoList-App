import SwiftUI

struct AddView: View{
// monitoring the screens(we could goback )
@Environment(\.presentationMode) var presentationMode
@EnvironmentObject var listViewModel: ListViewModel
    
@State var textfield: String = ""
@State var alertTitle: String = ""
@State var showAlert: Bool = false

var body: some View{
    
    ScrollView{
        VStack{
            TextField(" Type something here....", text: $textfield)
                .frame(height: 50)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal, 20)

            
            Button(action:{
               SaveButtonPressed()
            }){
                Text("Save")
                    .foregroundColor(.white)
                    .bold()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
            }
                
        }
        
        
     }
    .navigationTitle("Add the Items... 🖌️")
    .alert(isPresented: $showAlert, content: getAlert)
 
   }
    func SaveButtonPressed(){
        if textisAppropriate() == true{
            listViewModel.addItems(title: textfield)
            presentationMode.wrappedValue.dismiss()
        }
       
       
    }
    
    func textisAppropriate() ->Bool{
        if textfield.count < 3{
            alertTitle = "Your Character must be at least more than 3 characters.."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
    
    
}// struct end




#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
    
}

