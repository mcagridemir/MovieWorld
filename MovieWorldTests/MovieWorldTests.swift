//
//  MovieWorldTests.swift
//  MovieWorldTests
//
//  Created by Çağrı Demir on 3.04.2022.
//

import XCTest
@testable import MovieWorld

class MovieWorldTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testData() throws {
        var nowPlayingMovies: [Movie]?
        var upcomingMovies: [Movie]?
        var upcomingMoviesList = [Movie]()
        var upcomingMovies2Times: [Movie]?
        var movie: Movie?
        let id = "10749"
        
        let nowPlayingExp = expectation(description: "now playing movies")
        let upcomingExp = expectation(description: "upcoming movies")
        let upcomingExp2 = expectation(description: "upcoming movies 2")
        let movieExp = expectation(description: "movie")
        
        let nowPlaying = "now_playing"
        let upcoming = "upcoming"
        
        getMovies(prefix: nowPlaying, page: 1) { response in
            nowPlayingMovies = []
            nowPlayingMovies?.append(contentsOf: response.results?.choose(5) ?? [])
            nowPlayingExp.fulfill()
        }
        
        getMovies(prefix: upcoming, page: 1) { [weak self] response in
            guard let self = self else { return }
            if let movies = response.results {
                upcomingMoviesList.append(contentsOf: movies)
                upcomingMovies = upcomingMoviesList
                upcomingMovies2Times = upcomingMoviesList
                upcomingExp.fulfill()
                self.getMovies(prefix: upcoming, page: 2) { response in
                    if let movies = response.results {
                        upcomingMoviesList.append(contentsOf: movies)
//                        upcomingMovies = upcomingMoviesList
                        upcomingMovies2Times = upcomingMoviesList
                        upcomingExp2.fulfill()
                        getMovie()
                    }
                }
            }
        }
        
        func getMovie() {
            MovieRepo.getMovie(id: id) { response in
                movie = response
                movieExp.fulfill()
            } failure: { error in
                print(error.rawValue)
            }
        }
        
        waitForExpectations(timeout: 20) { error in
            print(error.debugDescription)
        }
        
        XCTAssertEqual(nowPlayingMovies?.count ?? 0, 5, "Now playing movies count must be 5.")
        XCTAssertLessThanOrEqual(upcomingMovies?.count ?? 0, 20, "Count of upcoming movies must be 20.")
        XCTAssertLessThanOrEqual(upcomingMovies2Times?.count ?? 0, 40, "Count of 2 pages upcoming movies must be 40.")
        XCTAssertEqual(movie?.id ?? 0, Int(id), "Movie id must be 10749")
    }
    
    func testExample() throws {

    }
    
    func getMovies(prefix: String, page: Int, success: @escaping(_ response: MovieModel) -> Void) {
        MovieRepo.getMovies(urlPrefix: prefix, page: page) { response in
            success(response)
        } failure: { error in
            print(error.rawValue)
        }
    }
    
    func getMovie(id: String, success: @escaping(_ response: Movie) -> Void) {
        MovieRepo.getMovie(id: id) { response in
            success(response)
        } failure: { error in
            print(error.rawValue)
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
