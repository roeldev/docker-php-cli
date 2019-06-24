<?php

$vars = [
    'PHPIZE_DEPS',
    'PHP_CFLAGS',
    'PHP_CPPFLAGS',
    'PHP_LDFLAGS',
    'GPG_KEYS',
    'PHP_VERSION',
    'PHP_URL',
    'PHP_ASC_URL',
    'PHP_SHA256',
    'PHP_MD5'
];

$vars = array_map(function($env) {
    return [$env => getenv($env) ?: null];
}, $vars);

echo json_encode($vars, JSON_PRETTY_PRINT);
