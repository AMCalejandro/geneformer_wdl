
Working directory to Develop and Test WDL workflows prior submission in Terra.  
This might help us on the development phase before the actual deployment in Terra.  

Let's give [miniwdl](https://miniwdl.readthedocs.io/en/latest/getting_started.html#inspect-results) a try.  

To get started we can just opt for a quick pip install.  
```
pip3 install miniwdl
```

Followed by a CLI run like the following

```
miniwdl pipes/hello-world.wdl
```


```
miniwdl run pipes/workflow_tokenise.wdl \
  token_outprefix="wdl_test" \
  task1_script=scripts/amc_tokenise_v2.py \
  loom_inpath=data/wdl_toy.loom \
  gene_median_dictionary_pkl=data/gene_median_dictionary.pkl \
  token_dictionary_pkl=data/token_dictionary.pkl
```

