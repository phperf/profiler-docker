<?php

class PerformanceIndex
{
    public static function measure()
    {
        $start = microtime(1);
        $numIterations = 5000;

        for ($i = 0; $i < $numIterations; ++$i) {
            $a = md5('abracadabra');
            $a = eval('md5($a);');
            $a = sha1($a);

            $group = strstr('group#foobar', '#', true);
            $foobar = substr('group#foobar', strlen($group) + 1);
            self::checkParts($group, $foobar);
            preg_match('{^(.*?)#(.*)$}', 'group#foobar', $matches);
            self::checkParts($matches[1], $matches[2]);
            $parts = explode('#', 'group#foobar');
            self::checkParts($parts[0], $parts[1]);


            self::euler(20, 10);
            self::euler(2166, 6099);
            self::euler(1239432166, 2221248099);
        }

        return (microtime(1) - $start) / $numIterations;
    }

    private static function euler($x, $y)
    {
        $r = $x % $y;
        if ($r == 0) {
            return $y;
        }
        return self::euler($y, $r);
    }

    private static function checkParts($group, $foobar)
    {
        return $group === 'group' && $foobar === 'foobar';
    }
}

echo 'Performance index: ', PerformanceIndex::measure(), "\n";