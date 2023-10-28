//
//  HomeContainerView.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import SwiftUI

struct HomeContainerView: View {
    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $viewModel.selectedFilter, label: Text(Texts.filter)) {
                ForEach(viewModel.moviesFilter) { movieFilter in
                    Text(movieFilter.title)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            MovieList()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(Texts.movieApp)
        .alert(isPresented: $viewModel.isError) {
            Alert(
                title: Text(Texts.smthWentWrong),
                message: Text(viewModel.errorText ?? ""),
                dismissButton: .default(Text(Texts.gotIt))
            )
        }
    }

    @EnvironmentObject private var viewModel: HomeViewModel
}
