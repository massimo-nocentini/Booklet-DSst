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
