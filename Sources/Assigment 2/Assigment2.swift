import Foundation

@main
public struct Assigment2 {
    public static func main() {
        var system = System()
        let console = Console()
        mainMenuActions(console: console, system: &system)
//        let memberController = MemberController(system: &system)
//        var mainMenu = MainMenu(console: console,
//                                system: &system,
//                                memberController: memberController)
//
//        mainMenu.mainMenuActions()
    }
}
