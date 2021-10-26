# terminal-url-shortener
Shorten URLs using is.gd or v.gd from your Terminal
# Usage
Pass URLs to shorten as 1 URL per argument. If multiple URLs are passed, it will go in order of arguments.
# Building
To build, use `git clone https://github.com/GameParrot/terminal-url-shortener.git
cd terminal-url-shortener
make`
# Linux
The Linux zip in Releases includes Swift libraries that are required to run the program, a bash script for starting, and the binary. Start it with the urlshorten bash script so the LD_LIBRARY_PATH is set correctly.
# macOS
The macOS zip is compiled universal, meaning it will work on Intel and ARM Macs. It does not have any additional libraries bundled.
