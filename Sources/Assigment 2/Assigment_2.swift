import Foundation

@main
public struct Assigment_2 {
    public private(set) var text = UUID().uuidString

    public static func main() {
        let system = System()
        let console = Console()
        var mainMenu = MainMenu(console: console,
                                system: system)
        
        mainMenu.mainMenuActions()

    }
}
