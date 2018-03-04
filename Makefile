build:
	docker build -t phperf/php-profiler .

push:
	docker push phperf/php-profiler:latest

build-xhprof:
	docker build -t phperf/php-profiler:5.6-xhprof -f Dockerfile.xhprof_php56 .

build-uprofiler:
	docker build -t phperf/php-profiler:5.6-uprofiler -f Dockerfile.uprofiler_php56 .

push-xhprof:
	docker push phperf/php-profiler:5.6-xhprof

push-uprofiler:
	docker push phperf/php-profiler:5.6-uprofiler
