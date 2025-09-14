//
//  AudioDetail.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation
import AVFAudio

struct AudioDetail: Identifiable, Equatable {
    let id = UUID()
    let url: URL
    let description: String
}
