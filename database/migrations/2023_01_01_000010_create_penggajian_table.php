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
        Schema::create('penggajian', function (Blueprint $table) {
            $table->string('No_slip', 10)->primary();
            $table->string('Kd_karyawan', 5);
            $table->string('Periode_gaji', 6);
            $table->date('Tanggal');
            $table->decimal('Gaji_pokok', 15, 2)->default(0.00);
            $table->decimal('Uang_makan', 15, 2)->default(0.00);
            $table->decimal('Uang_transport', 15, 2)->default(0.00);
            $table->decimal('Lembur', 15, 2)->default(0.00);
            $table->decimal('Potongan', 15, 2)->default(0.00);
            $table->decimal('Pph21', 15, 2)->default(0.00);
            $table->decimal('Total_gaji', 15, 2)->default(0.00);
            $table->unsignedBigInteger('user_id')->nullable();

            $table->unique(['Kd_karyawan', 'Periode_gaji'], 'uq_penggajian_karyawan_periode');
            $table->index('Tanggal', 'idx_penggajian_tanggal');
            $table->index('Periode_gaji', 'idx_penggajian_periode');

            $table->foreign('Kd_karyawan')->references('Kd_karyawan')->on('karyawan')->onDelete('RESTRICT')->onUpdate('CASCADE');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('penggajian');
    }
};
