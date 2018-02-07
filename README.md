# Dockerized command-line PHP 7 profiler (tideways)

Portable docker image with PHP 7.2 and `tideways` extension installed.

Profiling is started automatically with `auto_prepend_file` configuration.

## Usage

```
docker run --rm -v $(pwd):/code phperf/php-profiler php test_me.php
```

After your script is finished `xhprof` report and SVG graph will be saved:
```
Nodes in report: 33
Saving report to xhprof_report.1517989322.4259.serialized
Generating dot script
Generating dot image
Saving graph to xhprof_report.1517989322.4259.serialized.svg
```

You can upload report to https://blackfire.io (cli tool needed) for analysis
```
blackfire upload xhprof_report.1517989322.4259.serialized
```

```
Blackfire upload completed
Graph URL https://blackfire.io/profiles/bec67f2b-b1eb-459f-b392-97a69ea025d9/graph
No tests! Create some now https://blackfire.io/docs/cookbooks/tests
No recommendations

Wall Time     314ms
CPU Time      308ms
I/O Time     5.31ms
Memory       47.4KB
Network         n/a     n/a       -
SQL             n/a       -
```