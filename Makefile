# Makefile for JavaFX DMG Packaging


APP_NAME = MainClassFX
JAR = template-0.1.jar
MAIN_CLASS = fr.devmobs.MainClassFX
ICON = target/icon.icns
JAVA_HOME = /Library/Java/JavaVirtualMachines/graalvm-24.jdk/Contents/Home
JAVAFX_JMODS = $(HOME)/Devel/Java/.javasdk/javafx-jmods-24.0.2
RUNTIME_DIR = target/myapp-runtime
ICONSET = target/icon.iconset

.PHONY: all clean icon jar runtime dmg

all: dmg

icon: icon.svg
	@echo "Generating icon.icns from icon.svg..."
	mkdir -p target
	rm -rf $(ICONSET)
	mkdir -p $(ICONSET)
	rsvg-convert -w 1024 -h 1024 icon.svg -o $(ICONSET)/icon_1024x1024.png
	sips -z 16 16     $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_16x16.png
	sips -z 32 32     $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_16x16@2x.png
	sips -z 32 32     $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_32x32.png
	sips -z 64 64     $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_32x32@2x.png
	sips -z 128 128   $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_128x128.png
	sips -z 256 256   $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_128x128@2x.png
	sips -z 256 256   $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_256x256.png
	sips -z 512 512   $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_256x256@2x.png
	sips -z 512 512   $(ICONSET)/icon_1024x1024.png --out $(ICONSET)/icon_512x512.png
	cp $(ICONSET)/icon_1024x1024.png $(ICONSET)/icon_512x512@2x.png
	iconutil -c icns $(ICONSET) -o $(ICON)
	@echo "Done: $(ICON) created."

jar:
	@echo "Building JAR..."
	mvn install -U

jar_release:
	@echo "Building JAR..."
	mvn install -U -Dmaven.compiler.debug=false

runtime:
	@echo "Creating custom JavaFX runtime with jlink..."
	jlink \
	  --module-path "$(JAVA_HOME)/jmods:$(JAVAFX_JMODS)" \
	  --add-modules java.base,java.desktop,java.scripting,java.xml,javafx.fxml,javafx.graphics,javafx.controls \
	  --output $(RUNTIME_DIR)

dmg: clean icon jar_release runtime
	@echo "Packaging DMG with jpackage..."
	jpackage \
	  --input target \
	  --main-jar "$(JAR)" \
	  --main-class "$(MAIN_CLASS)" \
	  --name "$(APP_NAME)" \
	  --type dmg \
	  --icon "$(ICON)" \
	  --runtime-image $(RUNTIME_DIR)
	@echo "DMG created for $(APP_NAME)."

clean:
	mvn clean

run:
	@echo "Running JavaFX application..."
	$(JAVA_HOME)/bin/java \
	--enable-native-access=javafx.graphics \
	--module-path $(HOME)/Devel/Java/.javasdk/javafx-sdk-24.0.2/lib \
	--add-modules java.base,java.desktop,java.scripting,java.xml,javafx.fxml,javafx.graphics,javafx.controls,java.instrument \
	-jar target/$(JAR)
