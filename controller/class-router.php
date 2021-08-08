<?php

namespace Controller;

class Router {

    private static $instance;

    private function __construct(){
        $this->init();
    }

    public static function instance(){
        if(!self::$instance){
            return self::$instance = new self();
        }
        return self::$instance;
    }

    private function init(){
        echo 'class: '.__CLASS__.' was init.';
        echo '<br />';
        echo '<b>Ohooy!</b>';
    }



}