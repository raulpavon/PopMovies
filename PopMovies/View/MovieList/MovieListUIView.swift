//
//  MovieListUIView.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import UIKit

protocol MovieListUIViewDelegate: AnyObject {
    func getMovieDetails(movieId: Int)
}

class MovieListUIView: UIView {
    
    weak var delegate: MovieListUIViewDelegate?
    var movies = MovieList()
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let collectionViewMovies: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 187, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .black
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        setUp()
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(collectionViewMovies)
    }
    
    private func setUp() {
        collectionViewMovies.delegate = self
        collectionViewMovies.dataSource = self
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            collectionViewMovies.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            collectionViewMovies.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            collectionViewMovies.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            collectionViewMovies.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
        ])
    }
    
    func loadMovies(movies: MovieList) {
        self.movies = movies
        DispatchQueue.main.async {
            self.collectionViewMovies.reloadData()
        }
    }
}

extension MovieListUIView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell
        cell?.fillMovieInfo(posterPath: movies.results[indexPath.item].posterPath)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.getMovieDetails(movieId: movies.results[indexPath.item].id)
    }
}
