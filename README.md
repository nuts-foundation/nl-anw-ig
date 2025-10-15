# nl-anw-ig
Repository containing the FHIR Implementation Guide for the ANW use-case

## FHIR Shorthand (FSH) and SUSHI

This Implementation Guide is built using **FHIR Shorthand (FSH)**, a domain-specific language for defining FHIR artifacts in a compact and user-friendly syntax. FSH is compiled into standard FHIR resources using **SUSHI** (SUSHI Unshortens Short Hand Inputs).

### What is FSH?

FSH provides a simplified way to author FHIR profiles, extensions, value sets, and other conformance resources. Instead of writing verbose JSON or XML, you can define FHIR artifacts using intuitive, human-readable syntax.

### What is SUSHI?

SUSHI is the reference implementation compiler that converts FSH files (`.fsh`) into FHIR JSON resources. It's part of the HL7 FHIR Shorthand toolchain.

### Usage

1. **Install SUSHI**:
   ```bash
   npm install -g fsh-sushi
   ```

2. **Build the Implementation Guide**:
   ```bash
   sushi .
   ```
   This compiles all `.fsh` files in the `input/fsh/` directory and generates FHIR resources in the `fsh-generated/` directory.

3. **Configuration**:
   The `sushi-config.yaml` file contains project metadata and configuration settings for the IG.

### Project Structure

- `input/fsh/` - FSH source files defining profiles, extensions, and other resources
- `sushi-config.yaml` - SUSHI configuration file
- `fsh-generated/` - Auto-generated FHIR JSON resources (created after running SUSHI)

### Learn More

- [FSH School](https://fshschool.org/) - Interactive tutorials and documentation
- [SUSHI Documentation](https://fshschool.org/docs/sushi/)
- [FSH Specification](https://build.fhir.org/ig/HL7/fhir-shorthand/)
