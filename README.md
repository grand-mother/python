# GRAND's Python [![AppImage](https://github.com/grand-mother/python/workflows/AppImage/badge.svg)](https://github.com/grand-mother/python/actions)
_Contained, portable and modern python for GRAND running from an AppImage_


## Instructions

A ready to use [AppImage][APPIMAGE] distribution of [Python][PYTHON] is provided
[below](##Downloads) or in the [release][RELEASE] area. You can try it E.g. as:
```
wget -cq https://github.com/grand-mother/python/releases/download/continuous/grand-python-x86_64.AppImage
chmod +x grand-python-x86_64.AppImage
./grand-python-x86_64.AppImage
```

## Content

The [AppImage][APPIMAGE] bundles Python `3.8` as well as extra site packages
for GRAND, e.g. the [`grand`][GRAND_PKG] package and the scipy suite. See the
[requirements.txt](appimage/requirements.txt) file for a detailed list.


## Downloads

[![GRAND Python](https://img.shields.io/badge/python-x86_64-blue.svg)](https://github.com/grand-mother/python/releases/download/continuous/grand-python-x86_64.AppImage)


[APPIMAGE]: https://appimage.org
[GRAND_PKG]: https://pypi.org/project/grand
[PYTHON]: https://www.python.org
[RELEASE]: https://github.com/grand-mother/python/releases
