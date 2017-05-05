# homebrew-rooby

This repository allows Rooby language from [rooby-lang/rooby](https://github.com/rooby-lang/rooby) to be installed through Homebrew.

```
brew tap rooby-lang/rooby
brew install rooby
```

## Maintenance

Follow the steps to release a new version of Rooby.

### 1. Update Bin

Update `/bin/rooby` file to the latest stable version.

### 2. Release

Go to [releases](https://github.com/rooby-lang/rooby/releases) and create a new release.

### 3. Get SHA256

After release, you should be able to retrieve the compressed source code. For example, if you release a `0.1.0` version. You can download the file through:

```
https://github.com/rooby-lang/rooby/archive/0.1.0.tar.gz
```

Run the following command to generate a SHA256 hash for this file:

```
openssl sha256 < 0.1.0.tar.gz
```

which will give you something like:

```
(stdin)= c5785c1fb6eddb9e2e5c598cecc5eb83623eda9e380d4656cc0054c5e3cb9a99
```

If anything goes wrong with `openssl`, make sure you've updated it to the latest version.

### 4. Update Formula

Update [/Formula/rooby.rb](https://github.com/rooby-lang/homebrew-rooby/blob/master/Formula/rooby.rb) in this repository. Find the following methods:

```ruby
# Update the url to the latest location
url "https://github.com/rooby-lang/rooby/archive/0.0.1.tar.gz"
# Update version
version "0.0.1"
# Update sha256 hash to the hash we just retrieved
sha256 "7e98f3a0d9dbc7e5997f3cf59a97c95fc9c2228c6df40f034fca8127b8786d11"
```

### 5. Push & Verify

Commit and push the change. You can verify the update by running:

```
brew update
brew upgrade rooby
```

Homebrew should update your Rooby to the latest version.
