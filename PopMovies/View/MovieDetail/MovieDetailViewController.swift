//
//  MovieDetailViewController.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    weak var movieCoordinator: MovieCoordinator?
    private let factory: MovieFactory
    private var movie: Movie
    
    private lazy var movieDetailUIView: MovieDetailUIView = {
        let view = MovieDetailUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    required init(factory: MovieFactory, movieCoordinator: MovieCoordinator,movie: Movie) {
        self.factory = factory
        self.movieCoordinator = movieCoordinator
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setNavBar()
        initComponents()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setNavBar() {
        view.backgroundColor = .gray
        self.title = NSLocalizedString(GlobalConstants.Localize.detailTitle, comment: "")
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: GlobalConstants.Images.back), style: .plain, target: self, action: #selector(backPressed))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        initView()
    }
    
    private func addComponents() {
        view.addSubview(movieDetailUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            movieDetailUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieDetailUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieDetailUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieDetailUIView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func initView(){
        movieDetailUIView.setMovieDetail(movie: movie)
    }
    
    @objc private func backPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
}
