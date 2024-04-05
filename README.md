# Booklet-DSst

Either load it with:

```smalltalk
[ Metacello new
    baseline: 'BookletDSst';
    repository: 'github://massimo-nocentini/Booklet-DSst/src';
    load ] on: MCMergeOrLoadWarning do: [:warning | warning load ]
```

or depend on it with:

```smalltalk
spec baseline: 'BookletDSst'
	with: [ spec repository: 'github://massimo-nocentini/Booklet-DSst/src' ]
```


Source of https://massimo-nocentini.github.io/Booklet-DSst/

## Notebooks

- _Basic Pharo Objects_. ([pdf](https://github.com/massimo-nocentini/Booklet-DSst/releases/latest/download/BookletDSstTest-testBasicObjectsNotebook.pdf))
- _An introduction of the (Pharo) Smalltalk object model._ ([pdf](https://github.com/massimo-nocentini/Booklet-DSst/raw/master/images/BookletDSstTest-testBasicObjectsNotebook.pdf))
- _An introduction of the *Microdown* markup language._ ([pdf](https://github.com/massimo-nocentini/Booklet-DSst/raw/master/images/BookletDSstTest-testMicrodownNotebook.pdf))

