import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
func logerror(_ theError: String) { // Function for printing to stderr and exiting
    fputs(theError + "\n", stderr)
    exit(-1)
}

var argv = CommandLine.arguments
if argv.count == 1 {
    logerror("Error: not enough options\nusage: urlshorten [-vgd] url_to_shorten") // Shows an error if no URLs were passed
}
if argv[1] == "-h" || argv[1] == "--help" {
    print("usage: urlshorten [-vgd] url_to_shorten") // Shows a help message if -h or --help was passed.
    exit(0)
}
argv.remove(at: 0)
var base = "is.gd"
if argv[0] == "-vgd" {
    base = "v.gd"
    argv.remove(at: 0)
}
for i in argv { // Repeats with all the passed URLs
    do {
        let data = try Data(contentsOf: URL(string: "http://" + base + "/create.php?format=simple&url=" + (i.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!.replacingOccurrences(of: "+", with: "%2B")) // Downloads is.gd or v.gd to shorten the URL. The result is the shortened URL as Data.
    )!)
        print(String(decoding: data, as: UTF8.self)) // Converts the data to string
    } catch {
        if argv.count == 1 {
            logerror("Failed to create shortened URL") // Shows an error and exits if shortening the URL failed if only one URL was passed
        } else {
            print("Failed to create shortened URL") // Shows an error and continues if shortening fails and multiple URLs were passed.
        }
    }
}
