# ANW implementation guide

Repository containing the implementation guide for the ANW use-case.

## About This Project

This implementation guide defines FHIR profiles, extensions, and other resources needed for the ANW (Avond-, Nacht- en Weekendzorg) use case in the Netherlands. The IG is built using FHIR Shorthand (FSH) and automatically published to GitHub Pages.

**Published IG**: https://nuts-foundation.github.io/nl-anw-ig/

## FHIR Shorthand (FSH) and SUSHI

This implementation guide is built using **FHIR Shorthand (FSH)**, a domain-specific language for defining FHIR artifacts in a compact and user-friendly syntax. FSH is compiled into standard FHIR resources using **SUSHI** (SUSHI Unshortens Short Hand Inputs).

**What is FSH?**
FSH provides a simplified way to author FHIR profiles, extensions, value sets, and other conformance resources. Instead of writing verbose JSON or XML, you can define FHIR artifacts using intuitive, human-readable syntax.

**What is SUSHI?**
SUSHI is the reference implementation compiler that converts FSH files (`.fsh`) into FHIR JSON resources. It's part of the HL7 FHIR Shorthand toolchain.

**Resources:**
- [FSH School](https://fshschool.org/) - FSH tutorials and documentation
- [SUSHI Documentation](https://fshschool.org/docs/sushi/)
- [FHIR Shorthand Specification](https://build.fhir.org/ig/HL7/fhir-shorthand/)

## Project Structure

```
nl-anw-ig/
├── input/
│   └── fsh/              # FSH source files (profiles, extensions, etc.)
├── fsh-generated/        # Auto-generated FHIR JSON resources (ignored by GIT)
├── output/               # Generated IG website (after build) (ignored by GIT)
├── sushi-config.yaml     # SUSHI configuration file
├── _updatePublisher.sh   # Script to download IG Publisher
└── _genonce.sh           # Script to build the complete IG
```

## Local Development

### Prerequisites

- Node.js and npm (for SUSHI)
- Java 11 or higher (for IG Publisher)
- Jekyll (for HTML generation)

### Quick Start with SUSHI

Compile FSH files to FHIR JSON resources:

```bash
npm install -g fsh-sushi
sushi .
```

Output will be in the `fsh-generated/` directory.

### Building the Full IG

To build the complete implementation guide with HTML output:

```bash
./_updatePublisher.sh  # Download IG Publisher (first time only)
./_genonce.sh          # Build complete IG
```

The generated website will be in the `output/` directory.

## Deployment

This repository is configured for automated publishing to GitHub Pages via GitHub Actions.

**Published URL**: https://nuts-foundation.github.io/nl-anw-ig/

Every push to the `main` branch automatically triggers a build and deployment workflow that:
1. Compiles FSH files using SUSHI
2. Builds the full IG using the HL7 IG Publisher
3. Deploys the output to GitHub Pages

For detailed information about the publishing setup, architecture decisions, and troubleshooting, see [PUBLISHING.md](PUBLISHING.md).
