//
//  ViewCellCollectionViewCell.swift
//  Task24
//
//  Created by ana namgaladze on 08.05.24.
//
//

import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
    //MARK: ---Properties
    static let identifier = "ViewCellCollectionViewCell"
    
   private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    //MARK: ---init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   //MARK: ---Methods
   private func setupUI() {
   addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with imageURL: URL?) {
        guard let imageURL = imageURL else {
            print("no photo")
            return
        }
        image.setImage(with: imageURL)
    }
    
}


