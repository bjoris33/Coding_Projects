# Snakemake coding projects

## Why Snakemake?
In an effort to make my scripts more scalable and reproducible, I plan on moving most of my projects into Snakemake format. Snakemake will help handle stops and starts of my scripts, help parallelize steps that were previously bottlenecks, and make my scripts slightly more portable.

For an in-depth tutorial on Snakemake, check the [readthedocs](https://snakemake.readthedocs.io/en/stable/index.html).

Or you can also check out [this slideshow](http://slides.com/johanneskoester/snakemake-tutorial#/1).

## Notes
* Based in Python, so Python can run natively in the snakefile.
* Workflows are broken into "rules". Each rule is a separate program that you are running with inputs/outputs.
* from the `input:` directive, each item will be concatenated by a space if call as `{input}` in the `shell` directive. Make sure to add a comma or they will be concatenated without a space
* using config files will make the snakefiles generalizable, or have some degree of parsing built into the snakemake file?
* add `log:` directive within your rules to specify where to save the log files
* killing the job for snakemake is not enough, need to send `kill -KILL -$PID`
* adding `--jobs [int]` to your exeucution of snakemake allows you to parallelize your script
* if you set `threads: [int]` for a rule, that determines how many threads will be allocated for each instance of the rule
* the number of parallel jobs that will be started for a given rule is governed by the number of cores set on the command line divided by the threads allocated to the rule to a maximum of the number of jobs set on the command line
* use `-s [Snakefile]` on the command line to specify input of snakefile (so you can use a file that isn't named 'Snakefile')
* to have command line args passed to snakemake, enter in the rule as `{config[parameter]}` where 'parameter' is your variable, when executing the snakemake file from the command line, enter `--config parameter="your_data"`
