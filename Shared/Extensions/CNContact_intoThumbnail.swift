import Contacts
import UIKit

extension CNContact: IntoThumbnail {

    /// Get this contact's UIImage.
    ///
    /// This implementation uses the contact's thumnail image data.
    ///
    /// Example:
    ///
    ///     let contact: CNContact = …
    ///     let image: UIImage? = contact.intoUIImage()
    ///
    public func intoThumbnail() -> UIImage? {
        if self.imageDataAvailable {
            if let thumbnailImageData = self.thumbnailImageData {
                return UIImage(data: thumbnailImageData)
            }
        }
        return nil
    }

}
