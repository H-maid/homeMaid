<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserImagesTable extends Migration {
    
    public function up()
    {
        Schema::create('user_images', function (Blueprint $table) {
            $table->increments('id');
            $table->bigInteger('user_id');
            $table->string('image')->nullable();
            $table->integer('type')->nullable()->comment('1 free , 2 paid');
            $table->bigInteger('status_by_admin')->comment('0 not-verified , 1 verified-by-admin');
            // $table->timestamps(); // it will create created_at & deleted_at
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP'));
            $table->softDeletes();
        });
    }

    public function down()
    {
        Schema::dropIfExists('user_images');
    }
}
