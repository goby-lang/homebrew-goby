# homebrew-goby

This repository allows Rooby language from [goby-lang/goby](https://github.com/goby-lang/goby) to be installed through Homebrew.

```
brew tap goby-lang/goby
brew install goby
```

## Maintenance

Follow the steps to release a new version of Rooby.

### 1. Create a New Binary File

Create a `goby` executable by running in the `goby-lang/goby` root directory:

```
go build *.go
```

### 2. Release

Go to [releases](https://github.com/goby-lang/goby/releases) and create a new release.

- Remember to attach a `v` in front of the version number. Version `0.1.0` is tagged as `v0.1.0`. If not, change the corresponding part in the formula as well.
- Before release, attach the binary file you just created to that release.

### 3. Get SHA256

We have to retrieve SHA256 value from both the source code and binary file.

After release, you should be able to retrieve the compressed source code. For example, if you release a `v0.1.0` version. You can download the file through:

```
https://github.com/goby-lang/goby/archive/v0.1.0.tar.gz
```

Run the following command to generate a SHA256 hash for this file:

```
openssl sha256 < v0.1.0.tar.gz
```

which will give you something like:

```
(stdin)= c5785c1fb6eddb9e2e5c598cecc5eb83623eda9e380d4656cc0054c5e3cb9a99
```

Also, retrieve the hash for the new binary file.

```
openssl sha256 < goby
```

If anything goes wrong with `openssl`, make sure you've updated it to the latest version.

### 4. Update Formula

Update [/Formula/goby.rb](https://github.com/goby-lang/homebrew-goby/blob/master/Formula/goby.rb) in this repository. Find the following methods:

```ruby
class Goby < Formula
  # Update version number
  VERSION     = "0.1.0"
  # Update the SHA256 hash for tar.gz file
  GOBY_SHA256 = "3c3a4e1a237b52a56f4886f4950214402696469fb88402293907c8614823df6b"
  # Update the SHA256 for uploaded executable
  EXE_SHA256  = "e6ec1b25531220d473819719829084b516272d4a93aceb821a63bd79c28577ba"

  # the rest ...
end
```

Commit the change afterward.

### 5. Verify Locally

Run this formula locally to see if it works.

```
brew install --build-from-source /[path/to/this]/Formula/goby.rb
```

Homebrew should update your Goby to the latest version.

### 6. Verify Remotely

Commit and push the changes after that. Verify again by running:

```
brew update
brew upgrade goby
```
