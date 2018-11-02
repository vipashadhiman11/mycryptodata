import io
import os
from setuptools import setup


__version__ = '1.0'
__author__ = 'Yao Qiang'

description = 'clean up bitinfocharts.com data to CSV'
here = os.path.abspath(os.path.dirname(__file__))

# load README
with io.open(os.path.join(here, "README.md"), encoding="utf-8") as doc_file:
     documentation = '\n' + doc_file.read()

setup(
    name='cryptodata',
    version=__version__,
    description=description,
    author=__author__,
    author_email='qiangyao1988wsu@gmail.com',
    maintainer="Yao Qiang at bitbucket",
    url='https://www.bitbucket.org/jiuguangw/cryptodata',
    download_url="https://www.bitbucket.org/jiuguangw/cryptodata",
    packages=['cryptodata'],
    py_modules='cryptodata',
    keywords=["cryptodata", "bitinfocharts", "CSV", ],
    classifiers=["Development Status :: Test",
                 "Environment :: Console",
                 "Environment :: Win64 (MS Windows)",
                 "Environment :: MacOS X",
                 "Environment :: Web Environment",
                 "Environment :: Other Environment :: VPS",
                 "Intended Audience :: End Users/Desktop",
                 "Intended Audience :: Developers",
                 "Operating System :: Microsoft :: Windows",
                 "Operating System :: POSIX :: Linux",
                 "Operating System :: MacOS :: MacOS X",
                 "Operating System :: Unix",
                 "Programming Language :: Python",
                 "Topic :: Bitcoin :: Datamining",
                 "Natural Language :: English"],
    include_package_data=True,
    python_requires=">=3.6",
    platforms=["win64", "linux", "linux2", "darwin"]
)
