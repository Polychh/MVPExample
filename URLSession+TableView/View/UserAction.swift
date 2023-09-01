//
//  UserAction.swift
//  URLSession+TableView
//
//  Created by USER on 01.09.2023.
//

import Foundation


protocol UserAction: AnyObject{
    func didInsert(text: String)
    func didRemovet(indexOfElement: Int)
    func didFillTable(indexOfElement: Int) -> String
    func didCountElementsInTable() -> Int
}
