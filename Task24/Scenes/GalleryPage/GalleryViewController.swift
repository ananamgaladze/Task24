//
//  GalleryViewController.swift
//  Task24
//
//  Created by ana namgaladze on 08.05.24.
//

import UIKit
final class GalleryViewController: UIViewController {
    //MARK: ---Properties
    private lazy var galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let headerTitle: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.text = "გალერეა"
        title.font = UIFont.systemFont(ofSize: 32)
        title.textColor = .systemBlue
        return title
    }()
    
    var viewModel: GalleryViewModel
    var dataSource: UICollectionViewDiffableDataSource<Int, Photo>!
    
    //MARK: ---init
    init(viewModel: GalleryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ---Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        setupLayout()
        configureDataSource()
        collectionViewDelegate()
        
        viewModel.delegate = self
        viewModel.getInfo()
    }
    
    //MARK: ---Methods
    private func addTitle() {
        navigationItem.titleView = headerTitle
    }
    
    private func setupLayout() {
        view.addSubview(galleryCollectionView)
        
        NSLayoutConstraint.activate([
            galleryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            galleryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            galleryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            galleryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func collectionViewDelegate() {
        galleryCollectionView.delegate = self
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Photo>(collectionView: galleryCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, photo: Photo) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as? GalleryCollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            cell.configure(with: URL(string: photo.urls.regular))
            return cell
        }
    }
}



