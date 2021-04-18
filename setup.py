try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup


import os.path

readme = ''
here = os.path.abspath(os.path.dirname(__file__))
readme_path = os.path.join(here, 'README.md')
if os.path.exists(readme_path):
    with open(readme_path, 'rb') as stream:
        readme = stream.read().decode('utf8')


setup(
    long_description=readme,
    name='lat',
    version='0.1',
    description='Learning Analytics Tools',
    python_requires='==3.*,>=3.8.0',
    project_urls={"documentation": "https://github.com/dbosk/lat/releases", "repository": "https://github.com/dbosk/lat"},
    author='Daniel Bosk',
    author_email='dbosk@kth.se',
    license='MIT',
    entry_points={"console_scripts": ["lat = lat.cli:main"]},
    packages=['lat', 'lat.cli'],
    package_dir={"": "src"},
    package_data={
        "lat": ["*.py"],
        "lat.cli": ["*.py", "lat.bash"]
    },
    include_package_data=True,
    install_requires=['argcomplete==1.*,>=1.12.2', 'pandas==1.*,>=1.2.4'],
)
