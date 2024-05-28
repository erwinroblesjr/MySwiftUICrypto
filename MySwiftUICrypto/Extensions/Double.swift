//
//  Double.swift
//  MySwiftUICrypto
//
//  Created by Erwin Robles on 5/27/24.
//

import Foundation

extension Double{
    
    /// Corverts a double into a currency with 2 decimal places
    ///```
    /// Converts 1234.56 into $1,234.56
    ///```
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Corverts a double into a currency as String with 2 decimal places
    ///```
    /// Converts 1234.56 into "$1,234.56"
    ///```
    func asCurrencyWith2Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    /// Corverts a double into a currency with 2-6 decimal places
    ///```
    /// Converts 1234.56 into $1,234.56
    /// Converts 12.3456 into $12.3456
    /// Converts 0.123456 into $0.123456
    ///```
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Corverts a double into a currency as String with 2-6 decimal places
    ///```
    /// Converts 1234.56 into "$1,234.56"
    /// Converts 12.3456 into "$12.3456"
    /// Converts 0.123456 into "$0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a double into a string representation
    /// ```
    /// Converts 1.23456 into "1.23"
    /// ```
    func asNumberString() -> String{
        return String(format: "%.2f", self)
    }
    
    /// Converts a double into a string representation
    /// ```
    /// Converts 1.23456 into "1.23%"
    /// ```
    func asPercentString() -> String{
        return asNumberString() + "%"
    }
    
}
