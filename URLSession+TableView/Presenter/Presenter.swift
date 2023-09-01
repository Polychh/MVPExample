//
//  Presenter.swift
//  URLSession+TableView
//
//  Created by USER on 01.09.2023.
//

import Foundation

import Foundation


class Presenter {
    
    var delegate: Updates?
    
    private var albumArray: [String] = []
    
    func getAlbum(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else {
            fatalError("Can not find url")
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else {return}
            if let error = error {
                print(error)
            }
            if let safeData = data {
                if let albumData = self.parseJSON(data: safeData){
                    self.albumArray = albumData
                    self.delegate?.didUpdateAlbum(albumStruct: albumData)
                }
            }
        }
        task.resume()
    }

    private func parseJSON(data: Data) -> [String]?{
        let decoder = JSONDecoder()
        var stringArrayData: [String] = []
        do{
            let decodedData = try decoder.decode([AlbumData].self, from: data)
            for album in decodedData{
                stringArrayData.append(album.title)
            }
            return stringArrayData
        } catch{
            print("Can not parse JSON")
            return nil
        }
    }
}

extension Presenter: UserAction{
    func didCountElementsInTable() -> Int {
        return albumArray.count
    }
    
    func didFillTable(indexOfElement: Int) -> String {
        return albumArray[indexOfElement]
    }
    
    func didRemovet(indexOfElement: Int) {
        albumArray.remove(at: indexOfElement)
    }
    
    func didInsert(text: String){
        albumArray.append(text)
        print(albumArray)
    }
}
