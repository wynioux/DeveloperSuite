//
//  HTTPMimeType.swift
//  Model
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

// MARK: HTTPMimeType

/**
 The most common MIME types with corresponding document types, ordered by their common extensions.
 
 The following two important MIME types are the default types:
 - `text/plain` is the default value for textual files. A textual file should be human-readable and must not contain binary data.
 - `application/octet-stream` is the default value for all other cases. An unknown file type should use this type. Browsers are particularly careful when manipulating these files to protect users from software vulnerabilities and possible dangerous behavior.
 
 IANA is the official registry of MIME media types and maintains a [list of all the official MIME types](https://www.iana.org/assignments/media-types/media-types.xhtml).
 */
public enum HTTPMimeType {
    // MARK: - Regular

    /**
     AAC audio
     */
    case aac
    
    /**
     [AbiWord](https://en.wikipedia.org/wiki/AbiWord) document
     */
    case abw
    
    /**
     Archive document (multiple files embedded)
     */
    case arc
    
    /**
     AVI: Audio Video Interleave
     */
    case avi
    
    /**
     AVIF image
     */
    case avif
    
    /**
     Amazon Kindle eBook format
     */
    case azw
    
    /**
     Any kind of binary data
     */
    case bin
    
    /**
     Windows OS/2 Bitmap Graphics
     */
    case bmp
    
    /**
     BZip archive
     */
    case bz
    
    /**
     BZip2 archive
     */
    case bz2
    
    /**
     CD audio
     */
    case cda
    
    /**
     C-Shell script
     */
    case csh
    
    /**
     Cascading Style Sheets (CSS)
     */
    case css
    
    /**
     Comma-separated values (CSV)
     */
    case csv
    
    /**
     Microsoft Word
     */
    case doc
    
    /**
     Microsoft Word (OpenXML)
     */
    case docx
    
    /**
     MS Embedded OpenType fonts
     */
    case eot
    
    /**
     Electronic publication (EPUB)
     */
    case epub
    
    /**
     Graphics Interchange Format (GIF)
     */
    case gif
    
    /**
     GZip Compressed Archive
     */
    case gz
    
    /**
     HyperText Markup Language (HTML)
     */
    case htm
    
    /**
     HyperText Markup Language (HTML)
     */
    case html
    
    /**
     Icon format
     */
    case ico
    
    /**
     iCalendar format
     */
    case ics
    
    /**
     Java Archive (JAR)
     */
    case jar
    
    /**
     JPEG images
     */
    case jpeg
    
    /**
     JPEG images
     */
    case jpg
    
    /**
     JavaScript
     */
    case js
    
    /**
     JSON format
     */
    case json
    
    /**
     JSON-LD format
     */
    case jsonld
    
    /**
     Musical Instrument Digital Interface (MIDI)
     */
    case mid
    
    /**
     Musical Instrument Digital Interface (MIDI)
     */
    case midi
    
    /**
     MP3 audio
     */
    case mp3
    
    /**
     MP4 video
     */
    case mp4
    
    /**
     MPEG Video
     */
    case mpeg
    
    /**
     Apple Installer Package
     */
    case mpkg
    
    /**
     OpenDocument presentation document
     */
    case odp
    
    /**
     OpenDocument spreadsheet document
     */
    case ods
    
    /**
     OpenDocument text document
     */
    case odt
    
    /**
     OGG audio
     */
    case oga
    
    /**
     OGG audio
     */
    case ogv
    
    /**
     OGG
     */
    case ogx
    
    /**
     Opus audio
     */
    case opus
    
    /**
     OpenType font
     */
    case otf
    
    /**
     Adobe [Portable Document Format](https://www.adobe.com/acrobat/about-adobe-pdf.html)
     */
    case pdf
    
    /**
     Hypertext Preprocessor (Personal Home Page)
     */
    case php
    
    /**
     Portable Network Graphics
     */
    case png
    
    /**
     Microsoft PowerPoint
     */
    case ppt
    
    /**
     Microsoft PowerPoint (OpenXML)
     */
    case pptx
    
    /**
     RAR archive
     */
    case rar
    
    /**
     Rich Text Format (RTF)
     */
    case rtf
    
    /**
     Bourne shell script
     */
    case sh
    
    /**
     Scalable Vector Graphics (SVG)
     */
    case svg
    
    /**
     Tape Archive (TAR)
     */
    case tar
    
    /**
     Tagged Image File Format (TIFF)
     */
    case tif
    
    /**
     Tagged Image File Format (TIFF)
     */
    case tiff
    
    /**
     MPEG transport stream
     */
    case ts
    
    /**
     TrueType Font
     */
    case ttf
    
    /**
     Text, (generally ASCII or ISO 8859-n)
     */
    case txt
    
    /**
     Microsoft Visio
     */
    case vsd
    
    /**
     Waveform Audio Format
     */
    case wav
    
    /**
     WEBM audio
     */
    case weba
    
    /**
     WEBM video
     */
    case webm
    
    /**
     WEBP image
     */
    case webp
    
    /**
     Web Open Font Format (WOFF)
     */
    case woff
    
    /**
     Web Open Font Format (WOFF)
     */
    case woff2
    
    /**
     XHTML
     */
    case xhtml
    
    /**
     Microsoft Excel
     */
    case xls
    
    /**
     Microsoft Excel (OpenXML)
     */
    case xlsx
    
    /**
     XML
     */
    case xml
    
    /**
     XUL
     */
    case xul
    
    /**
     ZIP archive
     */
    case zip

    // MARK: - Unknown

    /**
     Unknown case
     */
    case unknown(String)
}
