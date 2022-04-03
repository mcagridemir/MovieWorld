//
//  DetailViewModel.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import Foundation

class DetailViewModel {
    private(set) var movie = Bindable<Movie>()
    private(set) var isLoading = Bindable<Bool>()
    private(set) var error = Bindable<Error>()
    func getMovieDetail(id: String?) {
        guard let id = id else { return }
        isLoading.value = true
        MovieRepo.getMovie(id: id) { [weak self] response in
            guard let self = self else { return }
            self.isLoading.value = false
            self.movie.value = response
        } failure: { [weak self] error in
            guard let self = self else { return }
            self.isLoading.value = false
            self.error.value = error
        }
    }
}
