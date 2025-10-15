# Publishing Documentation

This document explains the rationale behind the publishing setup for this FHIR Implementation Guide and the decisions made in configuring the automated build and deployment process.

## Overview

This IG uses an automated GitHub Actions workflow to build and publish the Implementation Guide to GitHub Pages. This approach is based on HL7's recommended practices for FHIR IG publishing.

## Publishing Architecture

### Why GitHub Actions?

We chose GitHub Actions over other CI/CD solutions for several reasons:

1. **Native Integration**: GitHub Actions is built into GitHub, requiring no external service configuration
2. **Free for Public Repositories**: No additional costs for open-source projects
3. **HL7 Community Standard**: Widely adopted in the FHIR community with established patterns
4. **Docker Support**: Seamless integration with HL7's official Docker images

## Key Components

### 1. HL7 IG Publisher Scripts

**Files**: `_updatePublisher.sh`, `_genonce.sh`

**Source**: https://github.com/HL7/ig-publisher-scripts

**Purpose**:
- These scripts are the standard way to manage and run the HL7 FHIR IG Publisher
- `_updatePublisher.sh`: Downloads or updates the IG Publisher JAR file to the latest version
- `_genonce.sh`: Runs the full IG build process (SUSHI + IG Publisher)

**Why use these scripts?**
- Maintained by HL7, ensuring compatibility with the latest IG Publisher versions
- Provide consistent build behavior across local and CI environments
- Handle Java classpath configuration and publisher arguments automatically
- Self-updating capability ensures we always use current versions

### 2. GitHub Actions Workflow

**File**: `.github/workflows/publish.yml`

**Based on**: [Argentix Informatics Guide to Automating FHIR IG Builds](https://www.argentixinfo.com/archives/156)

**Key Design Decisions**:

#### Docker-based Approach
We use `hl7fhir/ig-publisher-base:latest` Docker image for all build steps:

**Advantages**:
- Pre-configured environment with all necessary dependencies (Java, Jekyll, Node.js, SUSHI)
- Consistent build environment regardless of GitHub Actions runner updates
- No need to manually install and configure build tools
- Maintained by the HL7 community

## Workflow Triggers

**Push to main**: Automatic publication on every commit ensures the published IG is always current

**workflow_dispatch**: Allows manual triggering from the GitHub Actions UI for:
- Republishing without code changes
- Testing the workflow
- Recovery from failed builds

## Build Output

The IG Publisher generates multiple output formats in the `output/` directory:

- **HTML Website**: Interactive browseable IG with navigation
- **FHIR Resources**: All profiles, extensions, value sets in JSON/XML
- **Examples**: Validated example instances
- **Validation Reports**: QA checks and warnings

Only the HTML output is published to GitHub Pages. The full build artifacts are available as workflow artifacts for debugging.

## References

This publishing setup is based on the following authoritative sources:

1. **HL7 IG Publisher Documentation**
   - https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation
   - Official documentation for the FHIR IG Publisher

2. **HL7 IG Publisher Scripts Repository**
   - https://github.com/HL7/ig-publisher-scripts
   - Standard scripts for running the IG Publisher

3. **Argentix Informatics: Automating FHIR IG Builds**
   - https://www.argentixinfo.com/archives/156
   - Practical guide to GitHub Actions setup for FHIR IGs

4. **HL7 IG Publisher Getting Started Guide**
   - https://hl7.github.io/docs/ig_publisher/getting-started
   - Prerequisites and setup instructions

5. **FSH School Documentation**
   - https://fshschool.org/docs/sushi/
   - SUSHI configuration and usage