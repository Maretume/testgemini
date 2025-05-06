
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
        Schema::create('pph21', function (Blueprint $table) {
            $table->increments('no_pph21');
            $table->string('Kd_karyawan', 5);
            $table->string('Periode_gaji', 7);
            $table->date('Tanggal');
            $table->decimal('Gaji_pokok', 15, 2)->default(0.00);
            $table->decimal('Tunj_transport', 15, 2)->default(0.00);
            $table->decimal('Tunj_makan', 15, 2)->default(0.00);
            $table->decimal('Total_lembur', 15, 2)->default(0.00);
            $table->decimal('Total_bonus', 15, 2)->default(0.00);
            $table->decimal('Bruto', 15, 2)->default(0.00);
            $table->decimal('Biaya_jabatan', 15, 2)->default(0.00);
            $table->decimal('Netto_sebulan', 15, 2)->default(0.00);
            $table->decimal('Netto_setahun', 15, 2)->default(0.00);
            $table->decimal('Total_ptkp', 15, 2)->default(0.00);
            $table->decimal('Pkp', 15, 2)->default(0.00);
            $table->decimal('Pph21_setahun', 15, 2)->default(0.00);
            $table->decimal('Pph21_sebulan', 15, 2)->default(0.00);
            $table->string('Kd_user', 3)->nullable();

            $table->unique(['Kd_karyawan', 'Periode_gaji'], 'uq_pph21_karyawan_periode');
            $table->index('Periode_gaji', 'idx_pph21_periode');

            $table->foreign('Kd_karyawan', 'fk_pph21_karyawan')->references('Kd_karyawan')->on('karyawan')->onDelete('RESTRICT')->onUpdate('CASCADE');
            $table->foreign('Kd_user', 'fk_pph21_user')->references('Kd_user')->on('user')->onDelete('SET NULL')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pph21');
    }
};