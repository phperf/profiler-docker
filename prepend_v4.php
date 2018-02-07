<?php

register_shutdown_function(
    function () {
        register_shutdown_function(function () {
            $data = tideways_disable();
            echo 'Nodes in report: ' . count($data) . "\n";
            $name = 'xhprof_report.' . microtime(1) . '.serialized';
            echo 'Saving report to ' . $name, "\n";
            file_put_contents('/code/' . $name,
                serialize($data));

            include_once "/utils/callgraph_utils.php";
            include_once "/utils/xhprof_lib.php";
            include_once "/utils/xhprof_runs.php";

            echo "Generating dot script\n";
            $threshold = 0;
            if (count($data) > 1000) {
                $threshold = 0.001;
            }
            $script = xhprof_generate_dot_script($data, $threshold, null, null, null, null);
            echo "Generating dot image\n";
            $content = xhprof_generate_image_by_dot($script, 'svg');
            echo 'Saving graph to ' . $name . '.svg', "\n";
            file_put_contents('/code/' . $name . '.svg',
                $content);

        });
    }
);

tideways_enable(TIDEWAYS_FLAGS_MEMORY | TIDEWAYS_FLAGS_CPU);
