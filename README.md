# Dockerized command-line PHP 7 profiler (XHPROF-compatible)

![Docker Stars](https://img.shields.io/docker/stars/phperf/php-profiler.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/phperf/php-profiler.svg)

Portable docker image with PHP 7.3 and `tideways` extension installed.

Profiling is started automatically with `auto_prepend_file` configuration.

## Usage

```
docker run --rm -v $(pwd):/code phperf/php-profiler php test_me.php
```

You can also generate SVG call graph adding `SVG=1` ENV var (may take long time for big profiles)

```
docker run --rm -e SVG=1 -v $(pwd):/code phperf/php-profiler php test_me.php
```

After your script is finished `xhprof` report and SVG graph will be saved:

```
Performance index: 0.00037335238456726
Nodes in report: 33
Saving report to xhprof_report.1518411787.448.serialized
Generating dot script
Generating dot image
Saving graph to xhprof_report.1518411787.448.serialized.svg
```

You can analyze profiling report with [`xh-tool`](https://github.com/phperf/xh-tool)

```
xh-tool top xhprof_report.1518411787.448.serialized --limit 5 --strip-nesting
name                           wallTime   wallTime%   wallTime1   ownTime    ownTime%   ownTime1   count
PerformanceIndex::euler        1.22s      65.55       9.1us       1.22s      65.55      9.1us      135K 
PerformanceIndex::measure      1.87s      99.94       1.87s       427.62ms   22.89      427.62ms   1    
PerformanceIndex::checkParts   62.24ms    3.33        4.1us       62.24ms    3.33       4.1us      15K  
md5                            43.53ms    2.33        4.4us       43.53ms    2.33       4.4us      10K  
preg_match                     23.71ms    1.27        4.7us       23.71ms    1.27       4.7us      5K   
```

Or you can upload report to https://blackfire.io (`blackfire` cli tool needed) for analysis

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

If you want to save profile data to a particular file, you can provide it with `REPORT=<name>`, you can use `JSON` format if name ends with `.json`

```
docker run --rm -e REPORT=rep.json -v $(pwd):/code phperf/php-profiler php t2.php
Nodes in report: 12
Saving report to rep.json
```

## Tags

* `phperf/php-profiler:latest` PHP 7.3, tideways 4.1.7, [Dockerfile](https://github.com/phperf/profiler-docker/blob/master/Dockerfile.tideways_v4_php73)
* `phperf/php-profiler:7.3-tideways-v4` PHP 7.3, tideways 4.1.7, [Dockerfile](https://github.com/phperf/profiler-docker/blob/master/Dockerfile.tideways_v4_php73)
* `phperf/php-profiler:7.3-tideways-v5` PHP 7.3, tideways 5.0-beta3, [Dockerfile](https://github.com/phperf/profiler-docker/blob/master/Dockerfile.tideways_v5_php73)
* `phperf/php-profiler:7.2-tideways-v4` PHP 7.2, tideways 4.1.7, [Dockerfile](https://github.com/phperf/profiler-docker/blob/master/Dockerfile.tideways_v4_php72)
* `phperf/php-profiler:7.2-tideways-v5` PHP 7.2, tideways 5.0-beta3, [Dockerfile](https://github.com/phperf/profiler-docker/blob/master/Dockerfile.tideways_v5_php72)
* `phperf/php-profiler:5.6-xhprof` PHP 5.6, xhprof 0.9.4, [Dockerfile](https://github.com/phperf/profiler-docker/blob/master/Dockerfile.xhprof_php56)
* `phperf/php-profiler:5.6-uprofiler` PHP 5.6, uprofiler, [Dockerfile](https://github.com/phperf/profiler-docker/blob/master/Dockerfile.uprofiler_php56)
