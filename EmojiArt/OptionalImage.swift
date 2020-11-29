//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Frank Bara on 11/27/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
                
            }
        }
    }
}
