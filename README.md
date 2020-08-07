# Python Linter
A GitHub action to check Python code style. Supports black and yapf.

## Usage

#### Black Example

```yaml
steps:
  - uses: actions/checkout@v1
  - name: Python Linter
  - uses: sunnysid3up/python-linter@master
    with:
      lint: "black"
      path: "."
      line-length: "88"
```

#### Yapf Example

```yaml
steps:
  - uses: actions/checkout@v1
  - name: Python Linter
  - uses: sunnysid3up/python-linter@master
    with:
      lint: "yapf"
      line-length: "88"
      style: "pep8"
```
