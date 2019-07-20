<?php
use Dotenv\Dotenv;

require_once __DIR__ . '/../vendor/autoload.php';
$dotenv = Dotenv::create(dirname(__DIR__), '.env.testing')->load();
