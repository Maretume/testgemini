
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
            $table->id('Id');
            $table->string('Kd_karyawan', 5);
            $table->date('tanggal');
            $table->time('Jam_masuk')->nullable();
            $table->time('Jam_keluar')->nullable();
            $table->decimal('Jml_jam', 5, 2)->default(0.00);
            $table->decimal('Uang_lembur', 15, 2)->default(0.00);
            $table->decimal('Total_upah', 15, 2)->default(0.00);
            $table->string('Keterangan', 100)->nullable();
            $table->string('Kd_user', 3)->nullable();

            $table->index('tanggal');
            $table->foreign('Kd_karyawan')->references('Kd_karyawan')->on('karyawan')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('Kd_user')->references('Kd_user')->on('user')->onDelete('set null')->onUpdate('cascade');
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