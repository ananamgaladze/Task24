//
//  galleryViewModel.swift
//  Task24
//
//  Created by ana namgaladze on 08.05.24.
//

import Foundation
import Networking

protocol GalleryViewModelDelegate: AnyObject {
    func photosFetched<T: Decodable>(_ photos: [T])
    func fetchFailed(with error: Error)
}

final class GalleryViewModel {
    //MARK: ---Properties
    weak var delegate: GalleryViewModelDelegate?
    private let urlString = "https://api.unsplash.com/photos/?per_page=80&client_id=YKZzTaXqdpI5RojcT6OBviYMACviQ8pG7k0Tv3N8EVE#"
    // private(set) -ით შექმნილი ცვლადი შეიძლება დეკლარირებული იქნას მხოლოდ ამ კონკრეტულ ფაილში, ხოლო მისი წაკითხვა, დანახვა შესაძლებელი იქნება ყველა სხვა ფაილში,მოკლედ შეზღუდვა შესწორებაზე სხვა ფაილებიდან,მაგრამ წვდომა მხოლოდ წასაკითხად, (ამის გარეშეც მუშაობს, სიფრთხილე უბრალოდ :D)
    private(set) var photos: [Photo] = []
    //MARK: ---Methods
    func getInfo() {
        NetworkService().getInfo(urlString: urlString) { [weak self] (result: Result<[Photo], Error>) in
            switch result {
            case .success(let photos):
                self?.photos = photos
                self?.delegate?.photosFetched(photos)
            case .failure(let error):
                self?.delegate?.fetchFailed(with: error)
            }
        }
    }
}

