# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname='log4j-bypass'
pkgver='0.1.1'
pkgrel='0.1.1'
pkgdesc='Log4j web app tester that includes WAF bypasses'
arch=('any')
groups=('blackarch' 'blackarch-webapp' 'blackarch-fuzzer' 'blackarch-scanner')
url='https://github.com/cyberqueen-meg/log4j-bypass'
license=('MIT')
depends=('python)
makedepends=('git')
source=("git+https://github.com/cyberqueen-meg/$pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname

  # use, if no version string provided neither in sources nor in git describe:
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)

  # if tag exists, use this
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  ...
}


build () {
    git clone $source
    cd $pkgname
}

package() {
    cd $pkgname

    install -dm 755 "$pkgdir/usr/share/$pkgname"

    install -Dm 755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -a doc/* "$pkgdir/usr/share/doc/$pkgname/"
    
}
