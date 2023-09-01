//
//  UpdatesFromModel.swift
//  URLSession+TableView
//
//  Created by USER on 01.09.2023.
//

import Foundation

protocol Updates: AnyObject{
    func didUpdateAlbum(albumStruct: [String])
}
