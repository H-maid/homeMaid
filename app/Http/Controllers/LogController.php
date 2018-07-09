<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use LogActivity;

class LogController extends Controller
{

    public function myTestAddToLog(Request $request)
    {
        LogActivity::addToLog('My Testing.');
        dd('log insert successfully.');
    }

    public function logActivity()
    {
        $logs = LogActivity::logActivityLists();
        return view('logActivity',compact('logs'));
    }
}
