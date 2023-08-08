//
//  SearchableTextViewModel.swift
//  DSUI
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

import Combine
import DSModel
import SwiftUI

// MARK: SearchableTextViewModel

public final class SearchableTextViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchOptions: SearchOptions = .default
    @Published private(set) var matches: [SearchMatch] = []
    @Published private(set) var selectedMatchIndex: Int = 0

    let attributedText: NSAttributedString

    private var isSearchNeeded = false
    private var isSearchingInBackground = false
    private let queue = DispatchQueue(label: "io.github.wynioux.DeveloperSuite.SearchableTextViewModel")

    weak var textView: UITextView?
    private var textStorage: NSTextStorage {
        guard let textView else { return NSTextStorage(string: "") }
        return textView.textStorage
    }

    private var cancellables = [AnyCancellable]()

    public init(attributedText: NSAttributedString) {
        self.attributedText = attributedText

        Publishers
            .CombineLatest($searchText, $searchOptions)
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                setSearchNeeded()
            }
            .store(in: &cancellables)
    }

    public convenience init() {
        let attributedText = TextRenderer().preformatted("log(_:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:)")
        self.init(attributedText: attributedText)
    }

    // MARK: Search Operations

    private func clearMatches() {
        for match in matches {
            textStorage.addAttribute(.foregroundColor, value: match.originalForegroundColor, range: match.range)
            textStorage.removeAttribute(.backgroundColor, range: match.range)

            if let backgroundColor = match.originalBackgroundColor {
                textStorage.addAttribute(.backgroundColor, value: backgroundColor, range: match.range)
            }
        }
    }

    private func performUpdates(_ closure: (NSTextStorage) -> Void) {
        textStorage.beginEditing()
        closure(textStorage)
        textStorage.endEditing()
    }

    private func didUpdateMatches(_ newMatches: [NSRange], string: NSAttributedString) {
        performUpdates { _ in
            clearMatches()

            if string.length != textStorage.length {
                textStorage.setAttributedString(string)
            }

            matches = newMatches
                .filter {
                    textStorage.attributes(at: $0.location, effectiveRange: nil)[.isTechnical] == nil
                }
                .map {
                    let foregroundColor = textStorage.attribute(.foregroundColor, at: $0.location, effectiveRange: nil) as? UIColor
                    let backgroundColor = textStorage.attribute(.backgroundColor, at: $0.location, effectiveRange: nil) as? UIColor
                    return SearchMatch(range: $0, originalForegroundColor: foregroundColor ?? .label, originalBackgroundColor: backgroundColor)
                }

            for match in matches {
                highlight(range: match.range)
            }
        }

        selectedMatchIndex = 0
        didUpdateCurrentSelectedMatch()
        isSearchingInBackground = false
        searchIfNeeded()
    }

    private func search(searchText: String, in string: NSString, searchOptions: SearchOptions) -> [NSRange] {
        guard searchText.count >= 1 else { return [] }
        return string.ranges(of: searchText, options: searchOptions)
    }

    private func searchIfNeeded() {
        guard isSearchNeeded,
              !isSearchingInBackground
        else { return }

        isSearchNeeded = false
        isSearchingInBackground = true

        let attributedString = NSAttributedString(attributedString: textStorage)

        queue.async { [weak self] in
            guard let self else { return }
            let matches = search(searchText: searchText, in: attributedString.string as NSString, searchOptions: searchOptions)

            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                didUpdateMatches(matches, string: attributedString)
            }
        }
    }

    private func setSearchNeeded() {
        isSearchNeeded = true
        searchIfNeeded()
    }

    private func highlight(range: NSRange, isFocused: Bool = false) {
        textStorage.addAttributes([
            .backgroundColor: UIColor.systemBlue.withAlphaComponent(isFocused ? 0.8 : 0.4),
            .foregroundColor: UIColor.white
        ],
        range: range)
    }

    private func didUpdateCurrentSelectedMatch(previousMatch: Int? = nil) {
        guard !matches.isEmpty else { return }

        var range = matches[selectedMatchIndex].range
        var index = range.upperBound
        var newlines = 0

        let string = textStorage.string as NSString

        while index < textStorage.length {
            let character = Character(string.character(at: index))

            if let character,
               character.isNewline
            {
                newlines += 1
                range.length += index - range.upperBound

                if newlines == 8 {
                    break
                }
            }

            index += 1
        }

        if let textView {
            textView.scrollRangeToVisible(range)
        }

        if let previousMatch {
            highlight(range: matches[previousMatch].range)
        }

        highlight(range: matches[selectedMatchIndex].range, isFocused: true)
    }

    private func updateMatchIndex(_ newIndex: Int) {
        let previousIndex = selectedMatchIndex
        selectedMatchIndex = newIndex
        didUpdateCurrentSelectedMatch(previousMatch: previousIndex)
    }

    func nextMatch() {
        guard !matches.isEmpty,
              selectedMatchIndex + 1 < matches.count
        else {
            updateMatchIndex(0)
            return
        }

        updateMatchIndex(selectedMatchIndex + 1)
    }

    func previousMatch() {
        guard !matches.isEmpty,
              selectedMatchIndex - 1 < 0
        else {
            updateMatchIndex(selectedMatchIndex - 1)
            return
        }

        updateMatchIndex(matches.count - 1)
    }
}

extension Character {
    init?(_ code: unichar) {
        guard let scalar = UnicodeScalar(code) else {
            return nil
        }
        self = Character(scalar)
    }
}

extension NSAttributedString.Key {
    static let objectId = NSAttributedString.Key("pulse-object-id-key")
    static let isTechnical = NSAttributedString.Key("pulse-technical-substring-key")
    static let subheadline = NSAttributedString.Key("pulse-subheadline-key")
}
