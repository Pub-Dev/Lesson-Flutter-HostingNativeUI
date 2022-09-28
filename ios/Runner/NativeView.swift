import Flutter
import UIKit

class NativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: [String: Any]?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        let title : String? = args?["title"] as? String
        self.createNativeView(withString: title)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(withString title : String?){
        let nativeLabel = UILabel()
        nativeLabel.text = "Native View iOS: \(title)"
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
        _view.addSubview(nativeLabel)
    }
}
