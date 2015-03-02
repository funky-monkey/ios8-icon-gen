# iOS 8 Icon Generator

## Usage

- Make sure you have ImageMagick installed on your computer. On OS X:

```shell
brew install imagemagick
```

- Install `gem` dependencies

```shell
gem install bunder && bundle install
```

- Execute the tool on a simple image:

```shell
bundle exec ruby icongen.rb sample-icon.png
```

- You will end up with loads of converted icons:

```shell
sample-icon-iPad-29pt.png
sample-icon-iPad-29pt@2x.png
sample-icon-iPad-40pt.png
sample-icon-iPad-40pt@2x.png
sample-icon-iPad-76pt.png
sample-icon-iPad-76pt@2x.png
sample-icon-iPhone-29pt@2x.png
sample-icon-iPhone-29pt@3x.png
sample-icon-iPhone-40pt@2x.png
sample-icon-iPhone-40pt@3x.png
sample-icon-iPhone-60pt@2x.png
sample-icon-iPhone-60pt@3x.png
```

**Make sure that the source image is larger than 180px**

**Make sure that the source image is square**

You *will* be warned of the above if something is fishy.






