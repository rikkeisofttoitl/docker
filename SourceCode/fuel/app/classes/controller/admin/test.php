<?php

/**
 * Class Controller_Admin_Test
 * Test controller of admin group
 */
class Controller_Admin_Test extends Controller_Admin_Base
{
    public function action_index()
    {
        return Presenter::forge('admin/test/index');
    }
}
