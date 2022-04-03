//
//  MainViewModel.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import Foundation

class MainPageViewModel {
    private let nowPlaying = "now_playing"
    private let upcoming = "upcoming"
    private(set) var isLoading = Bindable<Bool>()
    private(set) var error = Bindable<Error>()
    private(set) var nowPlayingMovies = Bindable<[Movie]>()
    private(set) var upcomingMovies = Bindable<[Movie]>()
    private var upcomingMoviesList = [Movie]()
    private var page = 1
    var isMore = true
    var shouldDisplayLoading = false
    var upcomingMoviesCount: Int {
        return upcomingMovies.value?.count ?? 0
    }
    
    func getNowPlaying(_ noLoading: Bool = false) {
        if !noLoading {
            isLoading.value = true
        }
        MovieRepo.getMovies(urlPrefix: nowPlaying) { [weak self] response in
            guard let self = self else { return }
            self.isLoading.value = false
            self.nowPlayingMovies.value = []
            self.nowPlayingMovies.value?.append(contentsOf: response.results?.choose(5) ?? [])
        } failure: { [weak self] error in
            guard let self = self else { return }
            self.isLoading.value = false
            self.error.value = error
        }
    }
    
    func getUpcoming(_ noLoading: Bool = false) {
        guard isMore else { return }
        if page == 1 && !noLoading {
            isLoading.value = true
        }
        page = noLoading ? 1 : page
        upcomingMoviesList = noLoading ? [] : upcomingMoviesList
        MovieRepo.getMovies(urlPrefix: upcoming, page: page) { [weak self] response in
            guard let self = self else { return }
            self.isLoading.value = false
            if let movies = response.results {
                self.upcomingMoviesList.append(contentsOf: movies)
                self.upcomingMovies.value = self.upcomingMoviesList
            }
            self.page += 1
            if response.results?.count == 0 {
                self.isMore = false
            }
            self.shouldDisplayLoading = false
        } failure: { [weak self] error in
            guard let self = self else { return }
            self.isLoading.value = false
            self.error.value = error
        }
    }
}
