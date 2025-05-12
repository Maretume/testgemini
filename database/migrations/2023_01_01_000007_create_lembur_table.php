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
        Schema::create('lembur', function (Blueprint $table) {
            $table->string('No_lembur', 10)->primary();
            $table->string('Kd_karyawan', 5);
            $table->date('Tanggal');
            $table->integer('Jumlah_jam');
            $table->decimal('Jumlah_lembur', 15, 2)->default(0.00);
            $table->unsignedBigInteger('user_id')->nullable();

            $table->index('Tanggal', 'idx_lembur_tanggal');
            
            $table->foreign('Kd_karyawan')->references('Kd_karyawan')->on('karyawan')->onDelete('RESTRICT')->onUpdate('CASCADE');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lembur');
    }
};
