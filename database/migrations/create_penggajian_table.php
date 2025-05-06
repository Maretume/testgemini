
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
            $table->integer('No_penggajian')->autoIncrement();
            $table->string('Kd_karyawan', 5);
            $table->string('Periode_gaji', 7);
            $table->date('Tanggal');
            $table->decimal('Gaji_pokok', 15, 2)->default(0.00);
            $table->decimal('Tunj_transport', 15, 2)->default(0.00);
            $table->decimal('Tunj_makan', 15, 2)->default(0.00);
            $table->decimal('Total_lembur', 15, 2)->default(0.00);
            $table->decimal('Total_bonus', 15, 2)->default(0.00);
            $table->decimal('Total_pinjaman', 15, 2)->default(0.00);
            $table->string('Kd_user', 3)->nullable();

            $table->unique(['Kd_karyawan', 'Periode_gaji'], 'uq_penggajian_karyawan_periode');
            $table->index('Periode_gaji', 'idx_penggajian_periode');

            $table->foreign('Kd_karyawan', 'fk_penggajian_karyawan')->references('Kd_karyawan')->on('karyawan')->onDelete('RESTRICT')->onUpdate('CASCADE');
            $table->foreign('Kd_user', 'fk_penggajian_user')->references('Kd_user')->on('user')->onDelete('SET NULL')->onUpdate('CASCADE');
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