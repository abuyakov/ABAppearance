![test_appearance](https://user-images.githubusercontent.com/56303086/184757820-b4560008-8526-4829-8692-5d7b31213e0a.png)

# About
I tried to create a project where you can globally change the appearance of the application.    
Perhaps someone was looking for such a solution.    
    
⭐️ **Put a like if I helped you, and write ideas on what can be done better.**    

### Styles
- `.unspecified` The appearance of the system is used.
- `.light` Permanent light appearance.
- `.dark` Permanent dark appearance.

### SceneDelegate
```swift
    func scene(_ scene: UIScene, 
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        self.window?.overrideUserInterfaceStyle = ThemeService.shared.theme.getUserInterfaceStyle()
    }
```
