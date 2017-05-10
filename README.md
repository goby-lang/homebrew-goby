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

Before release, attach the binary file you just created to that release.

### 3. Get SHA256

We have to retrieve SHA256 value from both the source code and binary file.

After release, you should be able to retrieve the compressed source code. For example, if you release a `0.1.0` version. You can download the file through:

```
https://github.com/goby-lang/goby/archive/0.1.0.tar.gz
```

Run the following command to generate a SHA256 hash for this file:

```
openssl sha256 < 0.1.0.tar.gz
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
class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://goby-lang.github.io/goby"
  # Update file location of the source code, retrieved from the release page
  url "https://github.com/goby-lang/goby/archive/v0.0.1.tar.gz"
  # Update version number
  version "0.0.1"
  # Update this SHA256 hash
  sha256 "b866dd040fb1e66b2d16a71e954fa35701ed7794f2d6d8151496947678ff5461"

  resource "goby" do
    # Update file location
    url "https://github.com/goby-lang/goby/releases/download/v0.0.1/goby"
    # Update this SHA256 hash as well
    sha256 "7994dfb02b49c12b3c0946dfb2d35ecd8955137022aa59a2c7491f4cc86b1f4a"
  end

  def install
    resource("goby").stage do
      bin.install "goby"
    end
  end
end
```

Commit the change afterward.

### 5. Verify Locally

Run this formula locally to see if it works.

```
brew install --build-from-source /[path/to/this]/Formula/goby.rb
```

Homebrew should update your goby to the latest version.

### 6. Verify Remotely

Commit and push the changes after that. Verify again by running:

```
brew update
brew upgrade goby
```
