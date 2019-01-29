build:
	docker build -t phperf/php-profiler -f Dockerfile.tideways_v4_php73 .

push:
	docker push phperf/php-profiler:latest

build-v4-72:
	docker build -t phperf/php-profiler:7.2-tideways-v4 -f Dockerfile.tideways_v4_php72 .

push-v4-72:
	docker push phperf/php-profiler:7.2-tideways-v4

build-v5-72:
	docker build -t phperf/php-profiler:7.2-tideways-v5 -f Dockerfile.tideways_v5_php72 .

push-v5-72:
	docker push phperf/php-profiler:7.2-tideways-v5

build-v4-73:
	docker build -t phperf/php-profiler:7.3-tideways-v4 -f Dockerfile.tideways_v4_php73 .

push-v4-73:
	docker push phperf/php-profiler:7.3-tideways-v4

build-v5-73:
	docker build -t phperf/php-profiler:7.3-tideways-v5 -f Dockerfile.tideways_v5_php73 .

push-v5-73:
	docker push phperf/php-profiler:7.3-tideways-v5

build-xhprof:
	docker build -t phperf/php-profiler:5.6-xhprof -f Dockerfile.xhprof_php56 .

push-xhprof:
	docker push phperf/php-profiler:5.6-xhprof

build-uprofiler:
	docker build -t phperf/php-profiler:5.6-uprofiler -f Dockerfile.uprofiler_php56 .

push-uprofiler:
	docker push phperf/php-profiler:5.6-uprofiler
