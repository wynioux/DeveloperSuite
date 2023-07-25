//
//  HTTPMimeType+RawRepresentable.swift
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

// MARK: RawRepresentable

extension HTTPMimeType: RawRepresentable {
    public typealias RawValue = String

    // MARK: - init

    public init?(rawValue: String) {
        let trimmedRawValue = rawValue.trimmingCharacters(in: .whitespaces)

        switch trimmedRawValue {
        // swiftformat:disable all
        // Regular -------------------------------------------------------------------------------------------------------
        case "audio/aac":                                                                 self = .aac
        case "application/x-abiword":                                                     self = .abw
        case "application/x-freearc":                                                     self = .arc
        case "video/x-msvideo":                                                           self = .avi
        case "image/avif":                                                                self = .avif
        case "application/vnd.amazon.ebook":                                              self = .azw
        case "application/octet-stream":                                                  self = .bin
        case "image/bmp":                                                                 self = .bmp
        case "application/x-bzip":                                                        self = .bz
        case "application/x-bzip2":                                                       self = .bz2
        case "application/x-cdf":                                                         self = .cda
        case "application/x-csh":                                                         self = .csh
        case "text/css":                                                                  self = .css
        case "text/csv":                                                                  self = .csv
        case "application/msword":                                                        self = .doc
        case "application/vnd.openxmlformats-officedocument.wordprocessingml.document":   self = .docx
        case "application/vnd.ms-fontobject":                                             self = .eot
        case "application/epub+zip":                                                      self = .epub
        case "image/gif":                                                                 self = .gif
        case "application/gzip":                                                          self = .gz
        case "text/htm":                                                                  self = .htm
        case "text/html":                                                                 self = .html
        case "image/vnd.microsoft.icon":                                                  self = .ico
        case "text/calendar":                                                             self = .ics
        case "application/java-archive":                                                  self = .jar
        case "image/jpeg":                                                                self = .jpeg
        case "image/jpg":                                                                 self = .jpg
        case "text/javascript":                                                           self = .js
        case "application/json":                                                          self = .json
        case "application/ld+json":                                                       self = .jsonld
        case "audio/midi":                                                                self = .mid
        case "audio/x-midi":                                                              self = .midi
        case "audio/mpeg":                                                                self = .mp3
        case "video/mp4":                                                                 self = .mp4
        case "video/mpeg":                                                                self = .mpeg
        case "application/vnd.apple.installer+xml":                                       self = .mpkg
        case "application/vnd.oasis.opendocument.presentation":                           self = .odp
        case "application/vnd.oasis.opendocument.spreadsheet":                            self = .ods
        case "application/vnd.oasis.opendocument.text":                                   self = .odt
        case "audio/ogg":                                                                 self = .oga
        case "video/ogg":                                                                 self = .ogv
        case "application/ogg":                                                           self = .ogx
        case "audio/opus":                                                                self = .opus
        case "font/otf":                                                                  self = .otf
        case "application/pdf":                                                           self = .pdf
        case "application/x-httpd-php":                                                   self = .php
        case "image/png":                                                                 self = .png
        case "application/vnd.ms-powerpoint":                                             self = .ppt
        case "application/vnd.openxmlformats-officedocument.presentationml.presentation": self = .pptx
        case "application/vnd.rar":                                                       self = .rar
        case "application/rtf":                                                           self = .rtf
        case "application/x-sh":                                                          self = .sh
        case "image/svg+xml":                                                             self = .svg
        case "application/x-tar":                                                         self = .tar
        case "image/tif":                                                                 self = .tif
        case "image/tiff":                                                                self = .tiff
        case "video/mp2t":                                                                self = .ts
        case "font/ttf":                                                                  self = .ttf
        case "text/plain":                                                                self = .txt
        case "application/vnd.visio":                                                     self = .vsd
        case "audio/wav":                                                                 self = .wav
        case "audio/webm":                                                                self = .weba
        case "video/webm":                                                                self = .webm
        case "image/webp":                                                                self = .webp
        case "font/woff":                                                                 self = .woff
        case "font/woff2":                                                                self = .woff2
        case "application/xhtml+xml":                                                     self = .xhtml
        case "application/vnd.ms-excel":                                                  self = .xls
        case "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet":         self = .xlsx
        case "application/xml":                                                           self = .xml
        case "application/vnd.mozilla.xul+xml":                                           self = .xul
        case "application/zip":                                                           self = .zip
        // Unknown -------------------------------------------------------------------------------------------------------
        default:                                                                          self = .unknown(trimmedRawValue)
        // ---------------------------------------------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }

    public var rawValue: String {
        switch self {
        // swiftformat:disable all
        // Regular ----------------------------------------------------------------------------------------------------
        case .aac:                   return "audio/aac"
        case .abw:                   return "application/x-abiword"
        case .arc:                   return "application/x-freearc"
        case .avi:                   return "video/x-msvideo"
        case .avif:                  return "image/avif"
        case .azw:                   return "application/vnd.amazon.ebook"
        case .bin:                   return "application/octet-stream"
        case .bmp:                   return "image/bmp"
        case .bz:                    return "application/x-bzip"
        case .bz2:                   return "application/x-bzip2"
        case .cda:                   return "application/x-cdf"
        case .csh:                   return "application/x-csh"
        case .css:                   return "text/css"
        case .csv:                   return "text/csv"
        case .doc:                   return "application/msword"
        case .docx:                  return "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        case .eot:                   return "application/vnd.ms-fontobject"
        case .epub:                  return "application/epub+zip"
        case .gif:                   return "image/gif"
        case .gz:                    return "application/gzip"
        case .htm:                   return "text/htm"
        case .html:                  return "text/html"
        case .ico:                   return "image/vnd.microsoft.icon"
        case .ics:                   return "text/calendar"
        case .jar:                   return "application/java-archive"
        case .jpeg:                  return "image/jpeg"
        case .jpg:                   return "image/jpg"
        case .js:                    return "text/javascript"
        case .json:                  return "application/json"
        case .jsonld:                return "application/ld+json"
        case .mid:                   return "audio/midi"
        case .midi:                  return "audio/x-midi"
        case .mp3:                   return "audio/mpeg"
        case .mp4:                   return "video/mp4"
        case .mpeg:                  return "video/mpeg"
        case .mpkg:                  return "application/vnd.apple.installer+xml"
        case .odp:                   return "application/vnd.oasis.opendocument.presentation"
        case .ods:                   return "application/vnd.oasis.opendocument.spreadsheet"
        case .odt:                   return "application/vnd.oasis.opendocument.text"
        case .oga:                   return "audio/ogg"
        case .ogv:                   return "video/ogg"
        case .ogx:                   return "application/ogg"
        case .opus:                  return "audio/opus"
        case .otf:                   return "font/otf"
        case .pdf:                   return "application/pdf"
        case .php:                   return "application/x-httpd-php"
        case .png:                   return "image/png"
        case .ppt:                   return "application/vnd.ms-powerpoint"
        case .pptx:                  return "application/vnd.openxmlformats-officedocument.presentationml.presentation"
        case .rar:                   return "application/vnd.rar"
        case .rtf:                   return "application/rtf"
        case .sh:                    return "application/x-sh"
        case .svg:                   return "image/svg+xml"
        case .tar:                   return "application/x-tar"
        case .tif:                   return "image/tif"
        case .tiff:                  return "image/tiff"
        case .ts:                    return "video/mp2t"
        case .ttf:                   return "font/ttf"
        case .txt:                   return "text/plain"
        case .vsd:                   return "application/vnd.visio"
        case .wav:                   return "audio/wav"
        case .weba:                  return "audio/webm"
        case .webm:                  return "video/webm"
        case .webp:                  return "image/webp"
        case .woff:                  return "font/woff"
        case .woff2:                 return "font/woff2"
        case .xhtml:                 return "application/xhtml+xml"
        case .xls:                   return "application/vnd.ms-excel"
        case .xlsx:                  return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        case .xml:                   return "application/xml"
        case .xul:                   return "application/vnd.mozilla.xul+xml"
        case .zip:                   return "application/zip"
        // Unknown ----------------------------------------------------------------------------------------------------
        case .unknown(let rawValue): return rawValue
        // ------------------------------------------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }
}
