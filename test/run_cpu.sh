#!/bin/bash

docker run --rm -e REPORT=php_cpu_v4_72.json -v $(pwd):/code phperf/php-profiler:7.2-tideways-v4 php php_cpu.php
docker run --rm -e REPORT=php_cpu_v5_72.json -v $(pwd):/code phperf/php-profiler:7.2-tideways-v5 php php_cpu.php

docker run --rm -e REPORT=php_cpu_v4_73.json -v $(pwd):/code phperf/php-profiler:7.3-tideways-v4 php php_cpu.php
docker run --rm -e REPORT=php_cpu_v5_73.json -v $(pwd):/code phperf/php-profiler:7.3-tideways-v5 php php_cpu.php

docker run --rm -e REPORT=php_cpu_xhprof_56.json -v $(pwd):/code phperf/php-profiler:xhprof php php_cpu.php
docker run --rm -e REPORT=php_cpu_uprofiler_56.json -v $(pwd):/code phperf/php-profiler:uprofiler php php_cpu.php

