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
        Schema::create('jabatan', function (Blueprint $table) {
            $table->string('Kd_jabatan', 4)->primary();
            $table->string('Nm_jabatan', 10);
            $table->decimal('Gaji_pokok', 15, 2)->default(0.00);
            $table->decimal('Uang_transport', 15, 2)->default(0.00);
            $table->decimal('Uang_makan', 15, 2)->default(0.00);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('jabatan');
    }
};
