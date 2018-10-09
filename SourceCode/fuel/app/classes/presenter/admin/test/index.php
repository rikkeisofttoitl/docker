<?php
class Presenter_Admin_Test_Index extends Presenter
{
    public function view()
    {
        $this->name = Request::active()->param('name', 'World');
    }
}