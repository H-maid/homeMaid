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
            $table->date('dob')->nullable();
            $table->string('gender')->nullable();
            $table->string('password');
            $table->string('otp')->nullable();
            $table->bigInteger('otp_verified')->comment('verified 1 , not-verified 0')->default('0');
            $table->bigInteger('complete_profile')->comment('completed 1 , notcompleted 0')->default('0');
            $table->enum('status', ['1', '0'])->default('1')->comment('active 1 , 0 passive');
            $table->bigInteger('user_type')->comment('user 1 , maid 2 , provider 3');
            $table->string('device_token');
            $table->bigInteger('device_type')->comment('android 1 , ios 2');
            $table->bigInteger('notification_status')->comment(' off 0 , on 1')->default('1');
            $table->bigInteger('photo_email_status')->comment(' hide-from-other 0 , show-to-all 1')->default('1');
            $table->bigInteger('country_id')->nullable();
            $table->bigInteger('city_id')->nullable();
                $table->string('district')->nullable();
                $table->string('nationality')->nullable();
                $table->string('marital_status')->nullable();
                $table->string('kids')->nullable();
                $table->string('hi_job')->nullable();
            $table->string('company_name')->nullable();
            $table->string('authorised_person')->nullable();
            $table->string('tax_administration')->nullable();
            $table->string('tax_no')->nullable();
            $table->string('company_phone')->nullable();
            $table->bigInteger('step_for_maid_profile')->default('0');
            $table->rememberToken();
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP'));
            $table->softDeletes();
            // $table->timestamps();
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
