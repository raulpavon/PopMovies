//
//  MovieDetailUIView.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import UIKit
import WebKit
import YoutubePlayer_in_WKWebView

class MovieDetailUIView: UIView {
    
    enum MovieDetailUIViewConstraints {
        enum ContainerMovieTitle {
            static let height: CGFloat = 150
        }
        enum LbMovieName {
            static let leading: CGFloat = 30
            static let trailing: CGFloat = -30
            static let fontSize: CGFloat = 45
        }
        enum ImgMovie {
            static let height: CGFloat = 180
            static let top: CGFloat = 5
        }
        enum Labels {
            static let leading: CGFloat = 15
            static let top: CGFloat = 8
            static let fontSizeDate: CGFloat = 20
            static let fontSizeTime: CGFloat = 18
            static let fontSizeRaiting: CGFloat = 12
            static let fontSizeTrailer: CGFloat = 14
        }
        enum BtFavorite {
            static let width: CGFloat = 80
            static let height: CGFloat = 35
            static let fontSize: CGFloat = 12
        }
        enum LbMovieDescription {
            static let leading: CGFloat = 10
            static let top: CGFloat = 20
            static let trailing: CGFloat = -10
            static let fontSize: CGFloat = 13
        }
    }
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var containerMovieTitle: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: GlobalConstants.Colors.greenSea)
        return view
    }()
    
    private lazy var lbMovieName: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: MovieDetailUIViewConstraints.LbMovieName.fontSize)
        label.textColor = .white
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let imgMovie: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lbMovieDescription: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: MovieDetailUIViewConstraints.LbMovieDescription.fontSize)
        label.textColor = UIColor(hex: GlobalConstants.Colors.concrete)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var lbDate: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: MovieDetailUIViewConstraints.Labels.fontSizeDate)
        label.textColor = UIColor(hex: GlobalConstants.Colors.concrete)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var lbTime: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: MovieDetailUIViewConstraints.Labels.fontSizeTime)
        label.textColor = UIColor(hex: GlobalConstants.Colors.concrete)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var lbRaiting: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: MovieDetailUIViewConstraints.Labels.fontSizeRaiting)
        label.textColor = UIColor(hex: GlobalConstants.Colors.concrete)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var btFavorite: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString(GlobalConstants.Localize.favoriteButtonTitle, comment: ""), for: .normal)
        button.setTitleColor(UIColor(hex: GlobalConstants.Colors.concrete), for: .normal)
        button.backgroundColor = UIColor(hex: GlobalConstants.Colors.turquoise)
        button.titleLabel?.font = UIFont.systemFont(ofSize: MovieDetailUIViewConstraints.BtFavorite.fontSize)
        return button
    }()
    
    private lazy var lbTrailer: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: MovieDetailUIViewConstraints.Labels.fontSizeTrailer)
        label.textColor = UIColor(hex: GlobalConstants.Colors.concrete)
        label.textAlignment = .left
        label.text = "Trailers:"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var seperatorView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: GlobalConstants.Colors.concrete)
        return view
    }()
    
    private lazy var containerTrailer: WKYTPlayerView = {
        let view = WKYTPlayerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.bounces = true
        scroll.delaysContentTouches = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        return scroll
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
    }
    
    private func addComponents() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(containerMovieTitle)
        containerMovieTitle.addSubview(lbMovieName)
        containerView.addSubview(imgMovie)
        containerView.addSubview(lbDate)
        containerView.addSubview(lbTime)
        containerView.addSubview(lbRaiting)
        containerView.addSubview(btFavorite)
        containerView.addSubview(lbMovieDescription)
        containerView.addSubview(lbTrailer)
        containerView.addSubview(seperatorView)
        containerView.addSubview(containerTrailer)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            containerMovieTitle.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerMovieTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerMovieTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            containerMovieTitle.heightAnchor.constraint(equalToConstant: MovieDetailUIViewConstraints.ContainerMovieTitle.height),
            
            lbMovieName.centerYAnchor.constraint(equalTo: containerMovieTitle.centerYAnchor),
            lbMovieName.leadingAnchor.constraint(equalTo: containerMovieTitle.leadingAnchor, constant: MovieDetailUIViewConstraints.LbMovieName.leading),
            lbMovieName.trailingAnchor.constraint(equalTo: containerMovieTitle.trailingAnchor, constant: MovieDetailUIViewConstraints.LbMovieName.trailing),
            
            imgMovie.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imgMovie.heightAnchor.constraint(equalToConstant: MovieDetailUIViewConstraints.ImgMovie.height),
            imgMovie.topAnchor.constraint(equalTo: containerMovieTitle.bottomAnchor, constant: MovieDetailUIViewConstraints.ImgMovie.top),
            
            lbDate.topAnchor.constraint(equalTo: containerMovieTitle.bottomAnchor, constant: MovieDetailUIViewConstraints.Labels.top),
            lbDate.leadingAnchor.constraint(equalTo: imgMovie.trailingAnchor, constant: MovieDetailUIViewConstraints.Labels.leading),
            
            lbTime.topAnchor.constraint(equalTo: lbDate.bottomAnchor, constant: MovieDetailUIViewConstraints.Labels.top),
            lbTime.leadingAnchor.constraint(equalTo: lbDate.leadingAnchor),
            
            lbRaiting.topAnchor.constraint(equalTo: lbTime.bottomAnchor, constant: MovieDetailUIViewConstraints.Labels.top),
            lbRaiting.leadingAnchor.constraint(equalTo: lbDate.leadingAnchor),
            
            btFavorite.topAnchor.constraint(equalTo: lbRaiting.bottomAnchor, constant: MovieDetailUIViewConstraints.Labels.top),
            btFavorite.leadingAnchor.constraint(equalTo: lbDate.leadingAnchor),
            btFavorite.widthAnchor.constraint(equalToConstant: MovieDetailUIViewConstraints.BtFavorite.width),
            btFavorite.heightAnchor.constraint(equalToConstant: MovieDetailUIViewConstraints.BtFavorite.height),
            
            lbMovieDescription.topAnchor.constraint(equalTo: imgMovie.bottomAnchor, constant: MovieDetailUIViewConstraints.LbMovieDescription.top),
            lbMovieDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: MovieDetailUIViewConstraints.LbMovieDescription.leading),
            lbMovieDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: MovieDetailUIViewConstraints.LbMovieDescription.trailing),
            
            seperatorView.topAnchor.constraint(equalTo: lbMovieDescription.bottomAnchor, constant: 10),
            seperatorView.heightAnchor.constraint(equalToConstant: 2),
            seperatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            seperatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            
            lbTrailer.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 10),
            lbTrailer.leadingAnchor.constraint(equalTo: lbMovieDescription.leadingAnchor),
            
            containerTrailer.topAnchor.constraint(equalTo: lbTrailer.bottomAnchor, constant: 10),
            containerTrailer.widthAnchor.constraint(equalToConstant: 375),
            containerTrailer.heightAnchor.constraint(equalToConstant: 210),
            containerTrailer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    func setMovieDetail(movie: Movie) {
        imgMovie.image = UIImage.getImageFromURL(imageString: movie.posterPath)
        lbMovieName.text = "\(movie.title)"
        lbRaiting.text = "\(movie.raiting)/10"
        lbTime.text = "\(movie.runTime)min"
        lbDate.text = "\(movie.releaseDate.dropLast(6))"
        lbMovieDescription.text = "\(movie.overview)"
        if !(movie.trailers.results.isEmpty) {
            setTrailers(trailers: movie.trailers.results)
        } else {
            seperatorView.isHidden = true
            lbTrailer.isHidden = true
            containerTrailer.isHidden = true
        }
    }
    
    private func setTrailers(trailers: [Trailer]) {
        seperatorView.isHidden = false
        lbTrailer.isHidden = false
        containerTrailer.isHidden = false
        for trailer in trailers {
            containerView.addSubview(containerTrailer)
            containerTrailer.load(withVideoId: trailer.key)
        }
    }
}
