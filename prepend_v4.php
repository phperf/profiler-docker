<?php

tideways_enable(TIDEWAYS_FLAGS_MEMORY | TIDEWAYS_FLAGS_CPU);

register_shutdown_function(
    function () {
        register_shutdown_function(function () {
            $data = tideways_disable();
            $name = 'xhprof_report.' . microtime(1) . '.serialized';
            echo 'Saving report to ' . $name, "\n";
            file_put_contents('/code/' . $name,
                serialize($data));
        });
    }
);
