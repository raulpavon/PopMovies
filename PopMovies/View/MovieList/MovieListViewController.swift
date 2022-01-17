//
//  MovieListViewController.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    enum OrderOptions: String, CaseIterable {
        case One = "TOP_RATED"
        case Two = "POPULAR"
        
        func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
    }
    
    weak var movieCoordinator: MovieCoordinator?
    private let factory: MovieFactory
    
    private lazy var movieListUIView: MovieListUIView = {
        let view = MovieListUIView(frame: .zero)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewModel: MovieViewModel = {
        factory.makeMovieViewModel(view: self, repository: factory.makeMovieRepository())
    }()

    required init(factory: MovieFactory, movieCoordinator: MovieCoordinator) {
        self.factory = factory
        self.movieCoordinator = movieCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .gray
        setNavBar()
        initComponents()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieList(option: OrderOptions.One.rawValue)
    }
    
    private func setNavBar() {
        self.title = GlobalConstants.MovieList.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: GlobalConstants.Images.slider), style: .plain, target: self, action: #selector(setList))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func addComponents() {
        view.addSubview(movieListUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            movieListUIView.topAnchor.constraint(equalTo: view.topAnchor),
            movieListUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieListUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieListUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func setList() {
        let ac = UIAlertController(title: NSLocalizedString(GlobalConstants.Localize.orderBy, comment: ""), message: nil, preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: NSLocalizedString(GlobalConstants.Localize.topRated, comment: ""), style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: NSLocalizedString(GlobalConstants.Localize.popular, comment: ""), style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: NSLocalizedString(GlobalConstants.Localize.cancel, comment: ""), style: .cancel))
            ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
            present(ac, animated: true)
    }
    
    private func openPage(action: UIAlertAction) {
        if action.title == OrderOptions.One.rawValue {
            viewModel.getMovieList(option: OrderOptions.One.rawValue)
        } else {
            viewModel.getMovieList(option: OrderOptions.Two.rawValue)
        }
        DispatchQueue.main.async {
            self.movieListUIView.collectionViewMovies.reloadData()
        }
    }
}

extension MovieListViewController: MovieView {
     
    func goToMovieDetail(movie: Movie) {
        DispatchQueue.main.async {
            self.movieCoordinator?.openMovieDetail(movie: movie)
        }
    }
    
    func setMovie(movie: MovieList) {
        movieListUIView.loadMovies(movies: movie)
    }
}

extension MovieListViewController: MovieListUIViewDelegate {
    func getMovieDetails(movieId: Int) {
        viewModel.getMovieDetail(movieId: movieId)
    }
}
