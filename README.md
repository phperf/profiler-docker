# Dockerized command-line PHP 7 profiler (tideways)

Portable docker image with PHP 7.2 and `tideways` extension installed.

Profiling is started automatically with `auto_prepend_file` configuration.

## Usage

```
docker run --rm -v $(pwd):/code phperf/php-profiler php test_me.php
```

After your script is finished `xhprof` report will be saved:
```
Saving report to xhprof_report.1517907620.7139.serialized
```

You can upload it to https://blackfire.io (cli tool needed) for analysis
```
blackfire upload xhprof_report.1517907620.7139.serialized
```

```
Blackfire upload completed
Graph URL https://blackfire.io/profiles/e4372950-a0a6-407a-95e2-a939e40dade2/graph
No tests! Create some now https://blackfire.io/docs/cookbooks/tests
No recommendations

Wall Time     2.93s
CPU Time      2.91s
I/O Time     16.3ms
Memory       47.4KB
Network         n/a     n/a       -
SQL             n/a       -
```