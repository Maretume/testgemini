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
        Schema::create('absensi', function (Blueprint $table) {
            $table->id('Kd_absen');
            $table->string('Kd_karyawan', 20);
            $table->date('tanggal');
            $table->time('jam_masuk')->nullable();
            $table->time('jam_pulang')->nullable();
            $table->string('lokasi_absen_id', 150)->nullable();
            $table->text('foto_masuk')->nullable();
            $table->text('foto_pulang')->nullable();
            $table->string('keterangan', 100)->nullable();
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('Kd_karyawan')->references('Kd_karyawan')->on('karyawan')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('absensi');
    }
};
