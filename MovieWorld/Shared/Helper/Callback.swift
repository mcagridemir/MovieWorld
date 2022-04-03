//
//  Callback.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import Foundation
import UIKit

public typealias Callback = () -> Void
public typealias CallbackString = (_ result: String) -> Void
public typealias CallbackInt = (_ result: Int) -> Void
public typealias CallbackBool = (_ result: Bool) -> Void
public typealias CallbackGeneric<T> = (_ result: T) -> Void
