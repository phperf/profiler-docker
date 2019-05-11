<?php

function nestedCPU($limit)
{
    if ($limit === 0) {
        return;
    }
    $n = 0;
    for ($i = 0; $i < 100000; $i++) {
        $n = $n ^ $i;
    }
    nestedCPU($limit - 1);
}

nestedCPU(5);