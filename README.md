Examples:
----

`python gcc_wrapper.py --path=test --target=example_c --regex="([+-]?([0-9]*[.])?[0-9]+)" --baseflags="-O3" --flags="--param=selsched-max-lookahead=1,-fschedule-fusion,-frename-registers,-fvect-cost-model=unlimited,-fsimd-cost-model=unlimited"`

CLANG:
---
```sh
opt -enable-new-pm=1 -adce -licm -simplifycfg -o /dev/null /dev/null -print-pipeline-passes
```
this shows all activated passed for a givven optimisation flag. Note that 
`-print-pipeline-passes` is only available in newer clang packages.

Also there is a `-print-changed=dot-cfg` which outputs the change in the bitcode in a html file. 
