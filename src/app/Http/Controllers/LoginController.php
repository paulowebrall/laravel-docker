<?php

namespace App\Http\Controllers;

use App\Services\LoginService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    //
    public function get(): JsonResponse{

        $login = new LoginService();

        return response()->json($login->get());
    }
}
