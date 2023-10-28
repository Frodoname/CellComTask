//
//  UnifiedAsyncImage.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import CachedAsyncImage
import SwiftUI

struct UnifiedAsyncImage: View {
    let url: URL?
    
    var body: some View {
        CachedAsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Text(Texts.smthWentWrong)
            @unknown default:
                Text("Unknown error")
            }
        }
    }
}
