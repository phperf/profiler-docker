build:
	docker build -t phperf/php-profiler .

push:
	docker push phperf/php-profiler:latest

build-v4:
	docker build -t phperf/php-profiler:7.2-tideways-v4 -f Dockerfile .

push-v4:
	docker push phperf/php-profiler:7.2-tideways-v4

build-v5:
	docker build -t phperf/php-profiler:7.2-tideways-v5 -f Dockerfile.v5 .

push-v5:
	docker push phperf/php-profiler:7.2-tideways-v5

build-xhprof:
	docker build -t phperf/php-profiler:5.6-xhprof -f Dockerfile.xhprof_php56 .

push-xhprof:
	docker push phperf/php-profiler:5.6-xhprof

build-uprofiler:
	docker build -t phperf/php-profiler:5.6-uprofiler -f Dockerfile.uprofiler_php56 .

push-uprofiler:
	docker push phperf/php-profiler:5.6-uprofiler
