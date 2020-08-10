
# Python Linter  
Ensure Python code quality. Supports pylint, black, mypy and isort.

<details>
  <summary>Details</summary>

[pylint](https://github.com/PyCQA/pylint)  
> Pylint is a Python static code analysis tool which looks for programming errors, helps enforcing a coding standard, sniffs for code smells and offers simple refactoring suggestions.  
  
[black](https://github.com/psf/black)  
> Black is the uncompromising Python code formatter.  
  
[mypy](https://github.com/python/mypy)  
> Mypy is an optional static type checker for Python. You can add type hints (PEP 484) to your Python programs, and use mypy to type check them statically. Find bugs in your programs without even running them!  
  
[isort](https://github.com/timothycrosley/isort)  
> isort is a Python utility / library to sort imports alphabetically, and automatically separated into sections and by type.
 
</details>

## Options
| Name          	| Description                                 	| Optional 	| Default  	|
|---------------	|---------------------------------------------	|----------	|----------	|
| source        	| Source file or directory                    	| false    	| "."      	|
| strict        	| Set strictness for lint [low, medium, high] 	| false    	| "medium" 	|
| black-options 	| Black options                               	| false    	| ""       	|
| mypy-options  	| Mypy options                                	| false    	| ""       	|
| isort-options 	| Isort options                               	| false    	| ""       	|
| django        	| Confirm if source is a Django project       	| false    	| false    	|

  
## Example
```yaml  
 steps:
 - uses: actions/checkout@v2  
 - name: Python Linter
   uses: sunnysid3up/python-linter@master
   with:
     source: "src"
	 mypy-options: "--ignore-missing-imports --show-error-codes"
	 isort-options: "-w 100",
	 django: true
```
