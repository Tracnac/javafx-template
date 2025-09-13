# JavaFX Maven Template with Makefile

This repository is a template for JavaFX projects using Maven, with a Makefile for advanced build and packaging automation, including macOS DMG creation.

## Features
- JavaFX 24 integration (FXML, Scene Builder ready)
- Maven build system
- Makefile for:
  - Icon generation from SVG
  - JAR build (debug/release)
  - Custom JavaFX runtime creation with jlink
  - macOS DMG packaging with jpackage
  - Clean and run targets
- Example source and test files
- MIT License

## How to Use

1. **Clone or download this template.**
2. **Update `pom.xml`:**
   - Set `<groupId>`, `<artifactId>`, `<version>`, `<name>`, and `<mainClass>` for your project.
3. **Replace Example Code:**
   - Update or remove files in `src/main/java/fr/devmobs/` and `src/test/java/fr/devmobs/`.
4. **Update the package structure:**
   - Change package names to match your organization/project.
5. **Edit the Makefile as needed:**
   - Set `APP_NAME`, `MAIN_CLASS`, `JAVA_HOME`, and paths for your environment.
6. **Build and package:**
   - `make jar` — Build the JAR (debug)
   - `make jar_release` — Build the JAR (release, no debug info)
   - `make icon` — Generate macOS .icns icon from `icon.svg`
   - `make runtime` — Create a minimal JavaFX runtime with jlink
   - `make dmg` — Build a signed macOS DMG installer with jpackage
   - `make run` — Run the app with the correct JavaFX modules
   - `make clean` — Clean build artifacts

## Requirements
- Java 24 (tested with GraalVM 24)
- JavaFX 24 SDK and jmods (see Makefile for paths)
- Maven
- macOS tools: `rsvg-convert`, `sips`, `iconutil`, `jpackage`

## Example Makefile Targets
```
make jar         # Build debug JAR
make jar_release # Build release JAR
make icon        # Generate .icns icon from SVG
make runtime     # Create custom JavaFX runtime
make dmg         # Build DMG installer (all-in-one)
make run         # Run the app
make clean       # Clean build artifacts
```

## License
MIT License — see LICENSE file.

---

Feel free to further customize this template for your needs!
