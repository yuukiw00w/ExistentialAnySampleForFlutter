// Autogenerated from Pigeon (v18.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func createConnectionError(withChannelName channelName: String) -> FlutterError {
  return FlutterError(code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.", details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct Sample {
  var text: String
  var id: Int64

  static func fromList(_ list: [Any?]) -> Sample? {
    let text = list[0] as! String
    let id = list[1] is Int64 ? list[1] as! Int64 : Int64(list[1] as! Int32)

    return Sample(
      text: text,
      id: id
    )
  }
  func toList() -> [Any?] {
    return [
      text,
      id,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct SampleParameter {
  var text: String
  var id: Int64

  static func fromList(_ list: [Any?]) -> SampleParameter? {
    let text = list[0] as! String
    let id = list[1] is Int64 ? list[1] as! Int64 : Int64(list[1] as! Int32)

    return SampleParameter(
      text: text,
      id: id
    )
  }
  func toList() -> [Any?] {
    return [
      text,
      id,
    ]
  }
}

private class SampleApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return Sample.fromList(self.readValue() as! [Any?])
    case 129:
      return SampleParameter.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class SampleApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Sample {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? SampleParameter {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class SampleApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return SampleApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return SampleApiCodecWriter(data: data)
  }
}

class SampleApiCodec: FlutterStandardMessageCodec {
  static let shared = SampleApiCodec(readerWriter: SampleApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol SampleApi {
  func fetchSampleAsync(parameter: SampleParameter, completion: @escaping (Result<Sample, Error>) -> Void)
  func fetchSampleSync(parameter: SampleParameter) throws -> Sample
  func objectSampleAsync(parameter: Any?, completion: @escaping (Result<Any?, Error>) -> Void)
  func objectSampleSync(parameter: Any?) throws -> Any?
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class SampleApiSetup {
  /// The codec used by SampleApi.
  static var codec: FlutterStandardMessageCodec { SampleApiCodec.shared }
  /// Sets up an instance of `SampleApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: SampleApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let fetchSampleAsyncChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.existential_any_sample.SampleApi.fetchSampleAsync\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      fetchSampleAsyncChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let parameterArg = args[0] as! SampleParameter
        api.fetchSampleAsync(parameter: parameterArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      fetchSampleAsyncChannel.setMessageHandler(nil)
    }
    let fetchSampleSyncChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.existential_any_sample.SampleApi.fetchSampleSync\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      fetchSampleSyncChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let parameterArg = args[0] as! SampleParameter
        do {
          let result = try api.fetchSampleSync(parameter: parameterArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      fetchSampleSyncChannel.setMessageHandler(nil)
    }
    let objectSampleAsyncChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.existential_any_sample.SampleApi.objectSampleAsync\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      objectSampleAsyncChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let parameterArg: Any? = args[0]
        api.objectSampleAsync(parameter: parameterArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      objectSampleAsyncChannel.setMessageHandler(nil)
    }
    let objectSampleSyncChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.existential_any_sample.SampleApi.objectSampleSync\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      objectSampleSyncChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let parameterArg: Any? = args[0]
        do {
          let result = try api.objectSampleSync(parameter: parameterArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      objectSampleSyncChannel.setMessageHandler(nil)
    }
  }
}
private class CallFromNativeCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return Sample.fromList(self.readValue() as! [Any?])
    case 129:
      return SampleParameter.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class CallFromNativeCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Sample {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? SampleParameter {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class CallFromNativeCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return CallFromNativeCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return CallFromNativeCodecWriter(data: data)
  }
}

class CallFromNativeCodec: FlutterStandardMessageCodec {
  static let shared = CallFromNativeCodec(readerWriter: CallFromNativeCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol CallFromNativeProtocol {
  func fetchSample(parameter parameterArg: SampleParameter, completion: @escaping (Result<Sample, FlutterError>) -> Void)
  func objectSample(parameter parameterArg: Any?, completion: @escaping (Result<Any?, FlutterError>) -> Void)
}
class CallFromNative: CallFromNativeProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  private let messageChannelSuffix: String
  init(binaryMessenger: FlutterBinaryMessenger, messageChannelSuffix: String = "") {
    self.binaryMessenger = binaryMessenger
    self.messageChannelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
  }
  var codec: FlutterStandardMessageCodec {
    return CallFromNativeCodec.shared
  }
  func fetchSample(parameter parameterArg: SampleParameter, completion: @escaping (Result<Sample, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.existential_any_sample.CallFromNative.fetchSample\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([parameterArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else if listResponse[0] == nil {
        completion(.failure(FlutterError(code: "null-error", message: "Flutter api returned null value for non-null return value.", details: "")))
      } else {
        let result = listResponse[0] as! Sample
        completion(.success(result))
      }
    }
  }
  func objectSample(parameter parameterArg: Any?, completion: @escaping (Result<Any?, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.existential_any_sample.CallFromNative.objectSample\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([parameterArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        let result: Any? = listResponse[0]
        completion(.success(result))
      }
    }
  }
}
