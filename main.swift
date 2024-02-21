//
//  File.swift
//  
//
//  Created by Nguyễn Hiệp on 20/02/2024.
//



import Foundation

func vietnameseCharacterCount(text: String)-> String {
    let vnList = ["aw","aa","dd","ee","oo","ow"]
    var resultList: [String] = []
    var index = 0
    while index < text.count - 1 {
            let startIndex = text.index(text.startIndex, offsetBy: index)
            let endIndex = text.index(startIndex, offsetBy: 2)

            let subString = String(text[startIndex..<endIndex])
            if vnList.contains(subString) {
                resultList.append(subString)
                index += 2
            } else {
                if let firstChar = subString.first, firstChar == "w" {
                    resultList.append(String(firstChar))
                    index += 1
                }
                else {
                    index += 1
                }
            }
        }
    if index == text.count - 1 {
        if let lastChar = text.last, lastChar == "w" {
            resultList.append(String(lastChar))
        }
    }
    let resultCount = resultList.count
    let resultString = resultCount > 0 ? "\(resultCount)(\(resultList.joined(separator: ",")))" : "0()"
    return resultString
    
}
print("Enter a string of Latin characters:")
if let inputString = readLine() {
    let result = vietnameseCharacterCount(text: inputString)
    print(result)
} else {
    print("Unable to read input from the keyboard.")
}

