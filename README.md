
# Python Linter  
Ensure Python code quality. Supports mypy, pylint, black and isort.

<details>
  <summary>Details</summary>

[mypy](https://github.com/python/mypy)  
> Mypy is an optional static type checker for Python. You can add type hints (PEP 484) to your Python programs, and use mypy to type check them statically. Find bugs in your programs without even running them!

[pylint](https://github.com/PyCQA/pylint)  
> Pylint is a Python static code analysis tool which looks for programming errors, helps enforcing a coding standard, sniffs for code smells and offers simple refactoring suggestions.
  
[black](https://github.com/psf/black)  
> Black is the uncompromising Python code formatter. Black makes code review faster by producing the smallest diffs possible.
 
[isort](https://github.com/timothycrosley/isort)  
> isort is a Python utility / library to sort imports alphabetically, and automatically separated into sections and by type.
 
</details>

## Configuration

#### Options
| Name          	| Description                                 	| Optional 	| Default  	|
|---------------	|---------------------------------------------	|----------	|----------	|
| source        	| Source file or directory                    	| false    	| "."      	|
| strict        	| Set strictness for lint [low, medium, high] 	| false    	| "medium" 	|
| mypy-options  	| Mypy options                                	| false    	| ""       	|
| pylint-options 	| Pylint options                               	| false    	| ""       	|
| black-options 	| Black options                               	| false    	| ""       	|
| isort-options 	| Isort options                               	| false    	| ""       	|
| django        	| Confirm if source is a Django project       	| false    	| false    	|

#### Strictness

**High**
- Must not have any type errors.
- Must meet code standard style (PEP8). Code must have a Pylint score of 10.
- Must not have any code format issues.
- Must not have import disorganization.

**Medium (default)**
- Must not have any type errors.
- Code must have a Pylint score of 7 ore greater.
- Must not have any code format issues.

**Low**
- Must not have any type errors

#### More pylint customization
Create a setup.cfg or a .pylintrc file in the current working directory.

```
[pylint]
ignore=
    migrations,
    manage.py,
    __init__.py,
    apps.py,
    admin.py,
    models.py,
    serializers.py,
    urls.py,
disable=
    import-error,
    missing-module-docstring,
    missing-function-docstring
```

#### More isort customization
Create a setup.cfg or a .isort.cfg file in the current working directory.

```
[isort]
include_trailing_comma=True
known_first_party=app
lines_between_sections=0
lines_between_types=0
known_django=django
known_drf=rest_framework
line_length=100
multi_line_output=3
sections=FUTURE,STDLIB,DJANGO,DRF,THIRDPARTY,FIRSTPARTY,LOCALFOLDER
```

## Example
```yaml  
 steps:
 - uses: actions/checkout@v2  
 - name: Python Linter
   uses: sunnysid3up/python-linter@master
   with:
     source: "src"
     mypy-options: "--ignore-missing-imports --show-error-codes"
     pylint-options: "--rcfile=setup.cfg"
     isort-options: "-w 100",
     django: true
```
