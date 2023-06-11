all:
	true

install:
	mkdir -p $(DESTDIR)/usr/bin/
	cargo build --release
	install target/release/ironbar $(DESTDIR)/usr/bin/ironbar
	chmod 755 $(DESTDIR)/usr/bin/ironbar
