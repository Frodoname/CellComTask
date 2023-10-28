//
//  ApplicationFactory.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//
// swiftlint: disable private_over_fileprivate
// swiftlint: disable custom_void_parameters_method

import SwiftUI

let viewFactory = ViewFactory()

final class ViewFactory {
    fileprivate var applicationFactory = ApplicationFactory()
    fileprivate init() { }
    
    func makeAppRootView() -> some View {
        AppRootContainerView()
            .environmentObject(applicationFactory.appRootViewModel)
            .environmentObject(NavigationManager.shared)
    }
    
    func makeHomeView() -> some View {
        HomeContainerView()
            .environmentObject(applicationFactory.homeViewModel)
    }
    
    func makeDetailView(_ movie: Movie) -> some View {
        DetailContainerView(movie: movie)
            .environmentObject(applicationFactory.homeViewModel)
    }
}

fileprivate final class ApplicationFactory {
    let decoder: JSONDecoder
    let urlSession: URLSession
    
    let dataDecoder: DataDecoder
    let requestBuilder: URLRequestBuilder
    let taskExecutor: DataTaskExecutor
    
    let networkService: NetworkService
    let movieAPI: MovieAPI
        
    fileprivate init() {
        decoder = .snakeCaseDecoder
        urlSession = .shared
        
        dataDecoder = DefaultDataDecoder(decoder: decoder)
        requestBuilder = DefaultURLRequestBuilder()
        taskExecutor = DefaultDataTaskExecutor(session: urlSession)
        
        networkService = .init(requestBuilder: requestBuilder, taskExecutor: taskExecutor, dataDecoder: dataDecoder)
        movieAPI = .init(networkService: networkService)
    }
    
    fileprivate lazy var appRootViewModel: AppRootViewModel = {
        .init()
    }()
    
    fileprivate lazy var homeViewModel: HomeViewModel = {
        .init(movieAPI: movieAPI)
    }()
}
