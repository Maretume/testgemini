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
        Schema::create('permohonan_peminjaman', function (Blueprint $table) {
            $table->id();
            $table->string('Kd_karyawan', 5);
            $table->dateTime('timedate')->index();
            $table->decimal('Besar_pinjaman', 15, 2)->default(0.00);
            $table->string('keterangan', 100)->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->enum('status_permohonan', ['Pending', 'Approved', 'Rejected'])->default('Pending');
            $table->timestamps();

            $table->foreign('Kd_karyawan')->references('Kd_karyawan')->on('karyawan')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('permohonan_peminjaman');
    }
};
