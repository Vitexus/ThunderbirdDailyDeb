# AGENTS.md - Working AI Reference for ThunderbirdDailyDeb

## Project Overview
**Type**: Debian Package
**Purpose**: Thunderbird Daily (Nightly) installer package for Debian / Ubuntu with full AppStream integration
**Status**: Active
**Current Version**: 152.0a1 (2026-04-23)
**Repository**: git@github.com:Vitexus/ThunderbirdDailyDeb.git

## Key Technologies
- Debian Packaging
- AppStream Metadata (AppData XML)
- Desktop Integration

## Architecture & Structure
```
ThunderbirdDailyDeb/
├── debian/                                    # Debian packaging scripts
│   ├── control                               # Package metadata
│   ├── rules                                 # Build rules
│   ├── install                               # File installation rules
│   ├── postinst/postrm/preinst/prerm         # Package lifecycle scripts
│   ├── io.github.vitexus.thunderbird_daily.metainfo.xml  # AppStream metadata
│   └── icons/                                # Icon files (16-256px)
├── thunderbird-daily.desktop                 # Desktop application file
├── daily.png                                 # Application icon
├── thunderbird-daily-about.png               # Screenshot
├── Makefile                                  # Build automation
├── README.md                                 # User documentation
├── Vagrantfile                               # VM testing configuration
└── renovate.json                             # Dependency update config
```

## Development Workflow

### Prerequisites
```
- Debian/Ubuntu build environment
- devscripts package
- dpkg-dev package
- git
```

### Setup Instructions
```bash
# Clone the repository
git clone git@github.com:Vitexus/ThunderbirdDailyDeb.git
cd ThunderbirdDailyDeb

# Install build dependencies
sudo apt-get install -y devscripts dpkg-dev
```

### Build Package
```bash
# Build unsigned package
debuild -i -us -uc -b

# Or use make
make
```

### Package Contents
- **Binary**: `/usr/bin/thunderbird-daily` - Main application executable
- **Desktop File**: `/usr/share/applications/thunderbird-daily.desktop`
- **AppStream Metadata**: `/usr/share/metainfo/io.github.vitexus.thunderbird_daily.metainfo.xml`
- **Icons**: `/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps/thunderbird-daily.png`

## Key Concepts

### AppStream Integration
- Provides metadata for software managers (GNOME Software, KDE Discover, etc.)
- Includes application icons, screenshots, URLs, and content ratings
- Supports homepage, bug tracker, and release information

### Icon Assets
- Multiple resolution variants for different UI contexts
- Source PNG available at `/daily.png`
- Installed to standard hicolor theme locations

### Package Lifecycle
- `preinst`: Runs before package installation
- `postinst`: Configures application after installation, updates icon cache
- `prerm`: Runs before package removal
- `postrm`: Cleanup after package removal

## Common Tasks

### Development
- Review code structure
- Implement new features
- Fix bugs and issues

### Deployment
- Build and package
- Deploy to target environment
- Monitor and maintain

## Troubleshooting
- **Common Issues**: Check logs and error messages
- **Debug Commands**: Use appropriate debugging tools
- **Support**: Check documentation and issue tracker

## Additional Notes
- Project-specific conventions
- Development guidelines
- Related documentation
