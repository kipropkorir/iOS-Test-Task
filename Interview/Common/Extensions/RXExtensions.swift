//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import RxSwift

extension ObservableType {
  func map<R>(to value: R) -> Observable<R> {
    return map { _ in value }
  }

  func map<R>(_ keyPath: KeyPath<Element, R>) -> Observable<R> {
    return map { $0[keyPath: keyPath] }
  }

  func toVoid() -> Observable<Void> {
    return map { _ in Void() }
  }

  func observeForUI() -> Observable<Element> {
    return observeOn(MainScheduler.instance)
  }
}

extension PrimitiveSequence where Trait == SingleTrait {
  func map<R>(to value: R) -> Single<R> {
    return map { _ in value }
  }

  func map<R>(_ keyPath: KeyPath<Element, R>) -> Single<R> {
    return map { $0[keyPath: keyPath] }
  }

  func toVoid() -> Single<Void> {
    return map { _ in Void() }
  }

  func observeForUI() -> Single<Element> {
    return observeOn(MainScheduler.instance)
  }
}

// MARK: - Handle Response Status Code Errors -
protocol ResponseType {
    var statusCode: String { get }
    var statusMessage: String { get }
}

extension BasicResponse: ResponseType {}
extension ObjectResponse: ResponseType {}

extension PrimitiveSequence where Trait == SingleTrait, Element: ResponseType {
    /// Throws and error if status code isn't successful (!= 00) or otpRequired (!= 05)
    func handleStatusCode() -> Single<Element> {
        return flatMap { response in
            if response.statusCode == "200" {
                return .just(response)
            } else {
                return .error(ResponseErrorV1(statusCode: response.statusCode, statusMessage: response.statusMessage, successful: false))
            }
        }
    }
}
