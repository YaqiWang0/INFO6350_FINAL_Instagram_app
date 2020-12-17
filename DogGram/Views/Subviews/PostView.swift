//
//  PostView.swift
//  DogGram
//
//  Created by Yaqi Wang on 12/15/20.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    @State var animate: Bool = false
    @State var addheartAnimationToView: Bool
    @State var showActionSheet: Bool = false
    @State var actionSheetType: PostActionSheetOption = .general
    @State var postImage: UIImage = UIImage(named: "dog1")!
    
    enum PostActionSheetOption {
        case general
        case reporting
    }
    
    
    var showHeaderOrFooter: Bool
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            // MARK: HEADER
            if showHeaderOrFooter {
                HStack {
                    
                    NavigationLink(
                        destination: ProfileView(isMyProfile: false, profileDisplayName: post.username, profileUserID: post.userID),
                        label: {
                            Image("dog1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(15)
                            
                            Text(post.username)
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                        })
                    
                    Spacer()
                    
                    Button(action: {
                        showActionSheet.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    })
                    .accentColor(.primary)
                    .actionSheet(isPresented: $showActionSheet, content: {
                            getActionSheet()
                    })
                    
                }
                .padding(.all, 6)
            }
            
            // MARK: IMAGE
            
            ZStack {
                Image(uiImage: postImage)
                    .resizable()
                    .scaledToFit()
                if addheartAnimationToView {
                    LikeAnimationView(animate: $animate)
                }
            }
            
            // MARK: FOOTER
            if showHeaderOrFooter {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                    Button(action: {
                        if post.likedByUser {
                            unlikePost()
                        } else {
                            likePost()
                        }
                    }, label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                            .font(.title3)
                    })
                    .accentColor(post.likedByUser ? .red : .primary)
                    
                    
                    
                    // MARK: COMMENT ICON
                    NavigationLink(
                        destination: CommentsView(),
                        label: {
                            Image(systemName: "bubble.middle.bottom")
                                .font(.title3)
                                .foregroundColor(.primary)
                        })
                    Button(action: {
                        sharePost()
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    })
                    .accentColor(.primary)

                    
                    Spacer()
                })
                .padding(.all, 6)
                
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/,6)
                }
            }
        })
    }
    
    
    //MARK: FUNCTIONS
    func likePost() {
        // Update the local data
        
        let updatedPost = PostModel(postID: post.postID, userID: post.postID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        self.post = updatedPost
        
        
        animate = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animate = false
        }
    }
    
    func unlikePost() {
        
        let updatedPost = PostModel(postID: post.postID, userID: post.postID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        self.post = updatedPost
    }
    
    func getActionSheet() -> ActionSheet {
        
        switch self.actionSheetType {
            case .general :
                return ActionSheet(title: Text("What would you like to do "), message: nil, buttons: [.destructive(Text("Report"), action: {
                    
                    self.actionSheetType = .reporting
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showActionSheet.toggle()
                    }

                }),
                
                .default(Text("Learn more ..."), action: {
                    print("LEARN MORE PRESSED")
                }),
                
                .cancel()
            
            ])
            case .reporting:
                return ActionSheet(title: Text("Why are you reporting this post?"), message: nil, buttons: [
                    .destructive(Text("This is inappropriate"), action: {
                        reportPost(reason: "This is inappropriate")
                    }),
                    
                    .destructive(Text("This is spam"), action: {
                        reportPost(reason: "This is spam")
                    }),
                    
                    .destructive(Text("It made me uncomfortable"), action: {
                        reportPost(reason: "It made me uncomfortable")
                    }),
                    
                    .cancel({
                        self.actionSheetType = .general
                    })
                
                ])
        }
        
    }
    
    func reportPost(reason: String) {
        print("REPORT POST NOW")
    }
    
    func sharePost() {
        let message = "Check out this post on DogGram"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    
    static var previews: some View {
        PostView(post: post, addheartAnimationToView: true, showHeaderOrFooter: true )
            .previewLayout(.sizeThatFits)
    }
}
