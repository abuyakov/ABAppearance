![Post Square@2x1](https://user-images.githubusercontent.com/56303086/185908836-33cc8a63-49e3-417f-ae83-a8a44632e0bc.png)


### About
I tried to create a project where you can globally change the appearance of the application.    
Perhaps someone was looking for such a solution.    
    
⭐️ **Put a like if I helped you, and write ideas on what can be done better.**    

### Themes
- `.unspecified` The appearance of the system is used.
- `.light` Permanent light appearance.
- `.dark` Permanent dark appearance.

### Colors
- `.red` `.pink` `.orange` `.yellow` `.green` `.blue` `.purple`
- Your own colors that you like.

##### SceneDelegate
```swift
    func scene(_ scene: UIScene, 
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        self.window?.overrideUserInterfaceStyle = AppearanceService.shared.theme.getUserInterfaceStyle()
        self.window?.tintColor = AppearanceService.shared.color.getColorStyle()
    }
```


##### AppDelegate
```swift
    func application(_ application: UIApplication, 
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserDefaults.standard.object(forKey: DefaultKeys.switchState) == nil {
            UserDefaults.standard.set(true, forKey: DefaultKeys.switchState)
        }
        if UserDefaults.standard.object(forKey: DefaultKeys.selectedColor) == nil {
            UserDefaults.standard.set(5, forKey: DefaultKeys.selectedColor)
        }
        return true
    }
```
