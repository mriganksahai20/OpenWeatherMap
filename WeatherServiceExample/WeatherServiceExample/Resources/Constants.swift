//
//  Constants.swift
//  CRM
//
//  Created by Mrigank Sahai on 29/07/19.
//  Copyright © 2019 Adglobal India Pvt Ltd. All rights reserved.
//

import UIKit

struct Constants {
    
    //MARK: URL
    struct APIKey {
        static let apiKey = "5b949e1b6d4efc73f12e02bc63899c9f"
    }
    
    struct StroryBoard {
        static let storyBoard = "Main"
    }
    
    struct URL {
        static let url = "http://api.openweathermap.org/data/2.5/weather?lat=30.275755&lon=-97.739607&APPID=\(APIKey.apiKey)"
    }

}

