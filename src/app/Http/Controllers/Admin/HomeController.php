<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\View\View;


/**
 * Class HomeController
 *
 * @package App\Http\Controllers\Admin
 */
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * @return View
     */
    public function index(): View
    {
        return view('admin.home');
    }
}
