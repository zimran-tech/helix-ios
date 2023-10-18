// The Swift Programming Language
// https://docs.swift.org/swift-book
import AWSKinesis

public protocol SentinelAnalyticsProtocol {
    func log(
        event: String,
        eventParameters: [String: Any?]?,
        userParameters: [String: Any?]?
    )
}

public final class SentinelAnalyticsManager: SentinelAnalyticsProtocol {
    private var awsFirehoseRecorder: AWSFirehoseRecorder
    private let streamName: String
    
    public init(
        accessKey: String,
        secretKey: String,
        streamName: String
    ) {
        let credentials = AWSStaticCredentialsProvider(
            accessKey: accessKey,
            secretKey: secretKey
        )
        let config = AWSServiceConfiguration(
            region: .USEast1,
            credentialsProvider: credentials
        )
        self.streamName = streamName
        
        guard let config else { fatalError("The firehose recorder did not setup") }
        
        AWSFirehoseRecorder.register(with: config, forKey: "firehose")
        
        awsFirehoseRecorder = .init(forKey: "firehose")
    }
    
    public func log(
        event: String,
        eventParameters: [String : Any?]? = nil,
        userParameters: [String : Any?]? = nil
    ) {
        
    }
}


