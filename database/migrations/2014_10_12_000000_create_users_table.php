<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('country_code');
            $table->string('mobile');
            $table->string('email');
            // $table->string('email')->unique();
            $table->string('password');
            $table->string('otp')->nullable();
            $table->bigInteger('otp_verified')->comment('verified 1 , not-verified 0')->default('0');
            $table->bigInteger('complete_profile')->comment('completed 1 , notcompleted 0')->default('0');
            $table->enum('status', ['1', '0'])->default('1')->comment('active 1 , 0 passive');
            $table->bigInteger('user_type')->comment('user 1 , maid 2 , provider 3');
            $table->string('device_token');
            $table->bigInteger('device_type')->comment('android 1 , ios 2');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
