prefix ?= /usr/local
bindir = $(prefix)/bin
all:
	swiftc urlshorten.swift -o urlshorten
macintel:
	swiftc urlshorten.swift -target x86_64-apple-macos11 -o urlshorten
macarm:
	swiftc urlshorten.swift -target arm64e-apple-macos11 -o urlshorten
macuni:
	swiftc urlshorten.swift -target arm64e-apple-macos11 -o urlshortenarm
	swiftc urlshorten.swift -target x86_64-apple-macos11 -o urlshortenintel
	lipo -create urlshortenintel urlshortenarm -output urlshorten
	rm urlshortenarm
	rm urlshortenintel
