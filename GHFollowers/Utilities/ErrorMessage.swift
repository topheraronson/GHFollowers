//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/14/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import Foundation

enum ErrorMessage: String {
    
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete request. Please check you internet conection."
    case invalidResponse = "Invalid response from server. Please try agin."
    case invalidData = "The data recived from the server was invalid. Please try again."
}
