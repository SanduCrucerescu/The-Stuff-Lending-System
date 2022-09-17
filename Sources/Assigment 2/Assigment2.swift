import Foundation

@main
public struct Assigment2 {
    public static func main() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let date = dateFormater.date(from: "2022-09-17 14:00:00 +0200")
        var system = System(time: date!)
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
