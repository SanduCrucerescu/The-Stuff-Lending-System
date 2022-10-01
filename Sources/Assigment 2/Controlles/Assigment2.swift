import Foundation

@main
public struct Assigment2 {
    public static func main() {
        var system = System()
        let allan = try? Member(name: "Allan",
                              email: "allan@enigma.com",
                              mobilePhone: "123456",
                              members: system.members)
        system.addNewMember(allan!)
        MainMenuController().mainMenuActions(system: &system)
    }
}
