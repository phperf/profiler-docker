build:
	docker build -t phperf/php-profiler .

push:
	docker push phperf/php-profiler:latest

build56:
	docker build -t phperf/php-profiler:5.6-xhprof -f Dockerfile.xhprof_php56 .

push56:
	docker push phperf/php-profiler:5.6-xhprof
