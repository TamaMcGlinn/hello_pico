.PHONY: deploy build

deploy: bin/hello_pico.uf2
	@echo "Hold bootsel button on pico while you plug in the USB cable and press any key to continue. You can release the bootsel while Loading into Flash."
	@read anykey
	picotool load bin/hello_pico.uf2
	@echo "Now reboot the device by replugging the USB cable."

build: bin/hello_pico

bin/hello_pico.uf2: bin/hello_pico
	picotool uf2 convert bin/hello_pico -t elf bin/hello_pico.uf2

bin/hello_pico: src/* *.gpr config/*
	alr build --development
