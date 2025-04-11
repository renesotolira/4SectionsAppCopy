//
//  Images.swift
//  TabsApp
//
//  Created by rene on 13/02/25.
//

import Foundation

struct Images {
    
    
    static let appLogo: String = "logo"
    static let toolbarLogo: String = "toolbar_logo"
    //iconos que se usarán en la Tab Bar (Es decir la sección de abajo de la app)
    static let tabHome: String = "home"
    static let tabGrid: String = "grid"
    static let tabNotif: String = "notif"
    static let tabId: String = "id"
    
    private static let suffix:String = "_selected"
    static var tabHomeSelected: String {
        tabHome + suffix
    }
    static var tabGridSelected: String { tabGrid + suffix
    }
    static var tabNotifSelected: String {
        tabNotif + suffix
    }
    static var tabIdSelected: String {
        tabId + suffix
    }
    
}
