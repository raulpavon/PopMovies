//
//  MovieCollectionViewCell.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgMovie: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initComponents()
    }

    private func initComponents() {
        addComponents()
        setAutolayout()
    }

    private func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(imgMovie)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imgMovie.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            imgMovie.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            imgMovie.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            imgMovie.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor)
        ])
    }
    
    func fillMovieInfo(posterPath: String) {
        imgMovie.image = UIImage.getImageFromURL(imageString: posterPath)
    }
}
