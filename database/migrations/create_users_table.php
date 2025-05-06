
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::dropIfExists('users'); // Drop the existing users table if it exists

        Schema::create('user', function (Blueprint $table) {
            $table->string('Kd_user', 3)->primary();
            $table->string('Kd_karyawan', 5)->nullable()->unique();
            $table->string('Nm_user', 100);
            $table->char('username', 20)->unique();
            $table->string('password');
            $table->integer('role')->nullable();

            $table->foreign('Kd_karyawan')->references('Kd_karyawan')->on('karyawan')->onDelete('SET NULL')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user');
        // Optionally, recreate the default users table if needed in down method
        // Schema::create('users', function (Blueprint $table) {
        //     $table->id();
        //     $table->string('name');
        //     $table->string('email')->unique();
        //     $table->timestamp('email_verified_at')->nullable();
        //     $table->string('password');
        //     $table->rememberToken();
        //     $table->timestamps();
        // });
    }
};