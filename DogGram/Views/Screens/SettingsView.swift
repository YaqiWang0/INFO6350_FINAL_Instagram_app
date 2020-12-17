import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                
                // MARK: SECTION 1: DOGGRAM
                GroupBox(label: SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right"), content: {
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20)
                        
                        Text("DogGram is the #1 for posting pictures of your  dog and sharing them across the world, We are a dog-loving community and we're happy to have you!")
                            .font(.footnote)
                    })
                })
                .padding()
                
                // MARK: SECTION 2: PROFILE
                GroupBox(label: SettingsLabelView(labelText: "Profile", labelImage: "person.fill"), content: {
                    NavigationLink(
                        destination: SettingEditTextView(submissionText: "Current display name", title: "Display name", description: "Your can edit your display name here, this will be seen by other users on your profile and on your posts!", placeholder: "Your display name here ..."),
                        label: {
                            SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.purpleColor)
                        })
                    
                    NavigationLink (
                        destination: SettingEditTextView(submissionText: "Current bio here", title: "Profile Bio", description: "Your bio is a great place ti let users know a little about you. It will be shonw on your profile only", placeholder: "Your bio here ..."),
                        label: {
                            SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
                        })
                    
                   
                    NavigationLink (
                        destination: SettingsEditImageView(title: "Profile Picture", description: "Your profile picture will be shown on your profile and on your posts. Most users ake it a image of themselves or their dog!", selectedImage: UIImage(named: "dog1")!),
                        label: {
                            SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.purpleColor)
                        })
                
                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Sign out", color: Color.MyTheme.purpleColor)
                })
                .padding()
                
                // MARK: SECTION 3: APPLICATION
                GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.yahoo.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms and Conditions", color: Color.MyTheme.yellowColor)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.bing.com")
                    }, label: {
                        SettingsRowView(leftIcon: "globe", text: "DogGram's Website", color: Color.MyTheme.yellowColor)
                    })
 
                })
                .padding()
                
                // MARK: SECTION 4: APPLICATION
                
                GroupBox{
                    Text("DogGram was made with love. \n All Rights Reserved \n Cool Apps Inc. \n Copyright 2020 ❤️")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .padding(.bottom, 80)
            })
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "xmark")
                                        font(.title)
                                    })
                                    .accentColor(.primary)
            
            )
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
    }
    
    // MARK: FUNCTIONS
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
