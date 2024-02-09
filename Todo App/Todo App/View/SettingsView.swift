// SimplyDone
//
// By: Yash Shah


import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var iconSettings: IconNames
  
  // THEME
  
  let themes: [Theme] = themeData
  @ObservedObject var theme = ThemeSettings.shared
  @State private var isThemeChanged: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    NavigationView {
      VStack(alignment: .center, spacing: 0) {
        // MARK: - FORM
        
        Form {
       
              
    
         
          // MARK: - SECTION 3
          
          Section(header: Text("My Other Accounts")) {
            FormRowLinkView(icon: "link.icloud", color: Color.pink, text: "Portfolio", link:"https://yashshah.com")
            FormRowLinkView(icon: "person.2.fill", color: Color.blue, text: "LinkedIn", link: "https://www.linkedin.com/in/shah2/")
            FormRowLinkView(icon: "laptopcomputer.and.arrow.down", color: Color.green, text: "Github", link: "https://github.com/YashShah5")
          } //: SECTION 3
            .padding(.vertical, 3)
          
          // MARK: - SECTION 4
          
          Section(header: Text("About the application")) {
            FormRowStaticView(icon: "gear", firstText: "Application", secondText: "SimplyDone")
            FormRowStaticView(icon: "checkmark.seal", firstText: "Designed For", secondText: "iOS Devices")
            FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Yash Shah")
          } //: SECTION 4
            .padding(.vertical, 3)
        } //: FORM
          .listStyle(GroupedListStyle())
          .environment(\.horizontalSizeClass, .regular)
        
        // MARK: - FOOTER
        
        Text("Copyright © Yash Shah MIT Licensing Agreement.")
          .multilineTextAlignment(.center)
          .font(.footnote)
          .padding(.top, 6)
          .padding(.bottom, 8)
          .foregroundColor(Color.secondary)
      } //: VSTACK
        .navigationBarItems(trailing:
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: "xmark")
          }
        )
        .navigationBarTitle("Settings", displayMode: .inline)
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    } //: NAVIGATION
      .accentColor(themes[self.theme.themeSettings].themeColor)
      .navigationViewStyle(StackNavigationViewStyle())
  }
}

// MARK: - PREIVEW

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView().environmentObject(IconNames())
      .previewDevice("iPhone 12 Pro")
  }
}
