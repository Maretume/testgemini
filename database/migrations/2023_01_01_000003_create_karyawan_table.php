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
        Schema::create('karyawan', function (Blueprint $table) {
            $table->string('Kd_karyawan', 5)->primary();
            $table->string('nik', 20)->nullable()->unique();
            $table->string('Nm_karyawan', 100);
            $table->string('Kd_jabatan', 4);
            $table->string('Kelamin', 10)->nullable();
            $table->string('Agama', 20)->nullable();
            $table->string('Alamat', 100)->nullable();
            $table->string('No_telp', 20)->nullable();
            $table->string('Tempat_lahir', 20)->nullable();
            $table->date('Tgl_lahir')->nullable();
            $table->integer('Id_ptkp')->nullable();
            $table->date('Tgl_masuk')->nullable();
            $table->string('nip', 20);
            $table->string('no_ktp', 16);
            $table->string('bank', 3);
            $table->string('no_rek', 16);
            
            $table->foreign('Kd_jabatan')->references('Kd_jabatan')->on('jabatan')->onDelete('RESTRICT')->onUpdate('CASCADE');
            $table->foreign('Id_ptkp')->references('Id_ptkp')->on('ptkp')->onDelete('SET NULL')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('karyawan');
    }
};
