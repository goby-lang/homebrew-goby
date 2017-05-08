# homebrew-rooby

This repository allows Rooby language from [rooby-lang/rooby](https://github.com/rooby-lang/rooby) to be installed through Homebrew.

```
brew tap rooby-lang/rooby
brew install rooby
```

## Maintenance

Follow the steps to release a new version of Rooby.

### 1. Create a New Binary File

Create a `rooby` executable by running in the `rooby-lang/rooby` root directory:

```
go build *.go
```

### 2. Release

Go to [releases](https://github.com/rooby-lang/rooby/releases) and create a new release.

Before release, attach the binary file you just created to that release.

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

Also, retrieve the hash for the new binary file.

```
openssl sha256 < rooby
```

If anything goes wrong with `openssl`, make sure you've updated it to the latest version.

### 4. Update Formula

Update [/Formula/rooby.rb](https://github.com/rooby-lang/homebrew-rooby/blob/master/Formula/rooby.rb) in this repository. Find the following methods:

```ruby
class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://rooby-lang.github.io/rooby"
  # Update file location of the source code, retrieved from the release page
  url "https://github.com/rooby-lang/rooby/archive/v0.0.1.tar.gz"
  # Update version number
  version "0.0.1"
  # Update this SHA256 hash
  sha256 "b866dd040fb1e66b2d16a71e954fa35701ed7794f2d6d8151496947678ff5461"

  resource "rooby" do
    # Update version number
    url "https://github.com/rooby-lang/rooby/releases/download/v0.0.1/rooby"
    # Update this SHA256 hash as well
    sha256 "7994dfb02b49c12b3c0946dfb2d35ecd8955137022aa59a2c7491f4cc86b1f4a"
  end

  def install
    resource("rooby").stage do
      bin.install "rooby"
    end
  end
end
```

Commit the change afterward.

### 5. Verify

Verify the update by running:

```
brew update
brew upgrade rooby
```

Homebrew should update your Rooby to the latest version.
