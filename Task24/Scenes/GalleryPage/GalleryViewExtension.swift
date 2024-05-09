//
//  GalleryViewExtension.swift
//  Task24
//
//  Created by ana namgaladze on 09.05.24.
//

import UIKit
//MARK: ---extensions
extension GalleryViewController: GalleryViewModelDelegate {
    func photosFetched<T: Decodable>(_ photos: [T]) {
        if let photos = photos as? [Photo] {
            var snapshot = NSDiffableDataSourceSnapshot<Int, Photo>()
            snapshot.appendSections([0])
            snapshot.appendItems(photos)
            dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    func fetchFailed(with error: Error) {
        print("Error fetching photos: \(error)")
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoViewModel = PhotoViewModel(startIndex: indexPath.item)
        let photoVC = PhotoViewController(viewModel: photoViewModel)
        photoVC.photos = viewModel.photos
        photoVC.dataSourceDiffable()
        photoVC.applySnapshot()
        photoVC.loadNewPhoto()
        navigationController?.pushViewController(photoVC, animated: true)
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = collectionView.frame.width / 3 - 1
        if UIDevice.current.orientation.isLandscape {
            width = collectionView.frame.width / 6 - 1
        }
        return CGSize(width: width, height: width)
    }
}
