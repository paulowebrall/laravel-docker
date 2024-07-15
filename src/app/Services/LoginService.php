<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Database\Eloquent\Collection;

class LoginService{

    public function get(): Collection{
        return User::get();
    }

}


?>