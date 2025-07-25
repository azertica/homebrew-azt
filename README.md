# Azertica Homebrew Tap

This is the official Homebrew tap for Azertica tools and utilities.

## Installation

### Install AZT CLI

```bash
# Add the tap
brew tap azertica/azt

# Install AZT CLI
brew install azt
```

### One-liner Installation

```bash
brew install azertica/azt/azt
```

## Available Formulae

- **azt** - Azertica Build Tool - Comprehensive CLI for project management and development workflow

## Usage

After installation, you can use the AZT CLI:

```bash
# Check version
azt --version

# Get help
azt --help

# Initialize a new project
azt init

# Build a project
azt build

# Run tests
azt test
```

## Updating

```bash
# Update Homebrew
brew update

# Upgrade AZT CLI
brew upgrade azt
```

## Uninstalling

```bash
# Uninstall AZT CLI
brew uninstall azt

# Remove the tap (optional)
brew untap azertica/azt
```

## Documentation

- [Installation Guide](https://github.com/azertica/azt/blob/main/docs/HOMEBREW_INSTALLATION.md)
- [AZT CLI Documentation](https://github.com/azertica/azt/blob/main/README.md)
- [User Guide](https://github.com/azertica/azt/blob/main/docs/USER_GUIDE.md)

## Issues

- For formula issues: [Report here](https://github.com/azertica/homebrew-azt/issues)
- For AZT CLI issues: [Report here](https://github.com/azertica/azt/issues)

## Contributing

1. Fork this repository
2. Create a feature branch
3. Test your changes locally
4. Submit a pull request

For formula development guidelines, see the [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook).

## License

This tap is licensed under the MIT License. See [LICENSE](LICENSE) for details.
