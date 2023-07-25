//
//  HTTPMimeType+CaseIterable.swift
//  DSModel
//
//  Copyright (c) 2023 Bahadır A. Güder
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

// MARK: CaseIterable

extension HTTPMimeType: CaseIterable {
    public static var allCases: [Self] {
        return [
            .aac,
            .abw,
            .arc,
            .avi,
            .avif,
            .azw,
            .bin,
            .bmp,
            .bz,
            .bz2,
            .cda,
            .csh,
            .css,
            .csv,
            .doc,
            .docx,
            .eot,
            .epub,
            .gif,
            .gz,
            .htm,
            .html,
            .ico,
            .ics,
            .jar,
            .jpeg,
            .jpg,
            .js,
            .json,
            .jsonld,
            .mid,
            .midi,
            .mp3,
            .mp4,
            .mpeg,
            .mpkg,
            .odp,
            .ods,
            .odt,
            .oga,
            .ogv,
            .ogx,
            .opus,
            .otf,
            .pdf,
            .php,
            .png,
            .ppt,
            .pptx,
            .rar,
            .rtf,
            .sh,
            .svg,
            .tar,
            .tif,
            .tiff,
            .ts,
            .ttf,
            .txt,
            .vsd,
            .wav,
            .weba,
            .webm,
            .webp,
            .woff,
            .woff2,
            .xhtml,
            .xls,
            .xlsx,
            .xml,
            .xul,
            .zip
        ]
    }
}
