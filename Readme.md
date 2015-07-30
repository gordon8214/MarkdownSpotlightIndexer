# Purpose
Markdown files do not get indexed by default in OS X. I have seen various hackish ways to fix this, usually involving copying or modifying one of the core OS metadata importers. This is not an ideal solution for various reasons (security, code-signing, future compatibility, etc). Therefore, I decided to write a proper Markdown importer.

# Description
MarkdownSpotlightIndexer indexes all files using the UTI `net.daringfireball.markdown`. It also registers this UTI for the following file extensions:

* `markdown`
* `md`
* `mkdn`
* `mkd`
* `mdwn`
* `mdtxt`
* `mdtext`
* `mdown`
* `mdml`
* `mark`

Other applications may register `net.daringfireball.markdown` for additional file extensions, and MarkdownSpotlightIndexer will index those as well.

# How to use
To install, copy `MarkdownSpotlightIndexer.mdimporter` to`~/Library/Spotlight/` (you may need to create the `Spotlight` directory if it does not exist.)

You can check if it has been successfully registered as an Importer with the following command: `mdimport -L`. If the importer is not showing up after a few minutes, it may be necessary to restart the system.

You can force immediate indexing of all your Markdown files with: `mdimport -r ~/Library/Spotlight/MarkdownSpotlightIndexer.mdimporter`.

# Other notes
Although it's configured for Markdown, this importer could easily be repurposed for any plain text-based format (or any file that can be usefully indexed as plain text). Simply add any additional UTIs to `info.plist` under `CFBundleDocumentTypes` > `LSItemContentTypes`. and build the project.

# Compatibility
* Built using Xcode 6 and 10.10 SDK.
* Plugin is compatible with OS **10.6** through **10.11**.