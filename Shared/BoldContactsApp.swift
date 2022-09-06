import SwiftUI
import Contacts
import os

typealias AppItem = CNContact

@main
struct BoldContactApp: App {
    let persistenceController = PersistenceController.shared

    // Connect to app delegate class defined in AppDelegate.swift
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @State private var store = CNContactStore()
    @State private var cursor = Cursor<AppItem>()

    init() {
        logger.debug("BoldContact init()")
        logger.debug("\(CNContactStore.authorizationStatusMessage(for: .contacts))")
        

    }

    var body: some Scene {
        WindowGroup {
            switch  CNContactStore.authorizationStatus(for: .contacts) {
            case .authorized, .notDetermined:
                ContentView(cursor:  cursor)
                .onAppear {
                    Task.init {
                        logger.debug("BoldContact store.requestAccess() -> true")
                        do {
                            if try await store.requestAccess(for: .contacts) {
                                logger.debug("BoldContact store.requestAccess() -> true")
                                #if targetEnvironment(simulator)
                                    demoContacts()
                                #endif
                                cursor.setList(list: store.list())
                                cursor.setCallable(callable: openViaCNContact)

                            } else {
                                logger.debug("BoldContact store.requestAccess() -> false")
                            }
                        }
                        catch {
                            logger.debug("BoldContact store.requestAccess() -> error: \(String(describing: error))")
                        }
                    }
                }
            case .restricted:
                Text("BoldContact cannot access your contacts because your contact store authorization status is restricted. You can quit the app now. You can launch your Preferences app, and authorize BoldContact to access your contacts, then relaunch BoldContact.")
            case .denied:
                Text("BoldContact cannot access your contacts because your contact store authorization status is denied. You can quit the app now. You can launch your Preferences app, and authorize BoldContact to access your contacts, then relaunch BoldContact.")
            default:
                Text("BoldContact cannot access your contacts because of an unknown error. Please contact the app developer to take a closer look at what's happening and how to fix it for you. Email address is joel@joelparkerhenderson.com. Phone number is +1-415-317-2700. Thank you.")
            }
        }
    }
    
}

//Original:
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
//    }
