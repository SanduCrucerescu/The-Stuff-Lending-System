import Foundation

@main
public struct Assigment_2 {
    public private(set) var text = UUID().uuidString

    public static func main() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let date = dateFormater.date(from: "2022-09-17 14:00:00 +0200")
        
        
        let system = System(time: date!)
        let console = Console()
        var mainMenu = MainMenu(console: console,
                                system: system)
        
        mainMenu.mainMenuActions()

    }
}
