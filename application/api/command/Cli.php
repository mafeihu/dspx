<?php
namespace app\api\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;

class Cli extends Command
{
    protected function configure()
    {
        $this->setName('test')->setDescription('Here is the remark ');
    }

    protected function execute(Input $input, Output $output)
    {

    }
}