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
        Schema::create('lokasi_absen', function (Blueprint $table) {
            $table->id();
            $table->string('nama_lokasi', 100)->unique()->comment('Human-readable name (e.g., Kantor Pusat, Gudang BSD)');
            $table->text('alamat_lengkap')->nullable()->comment('Optional full address text');
            $table->decimal('latitude', 10, 7)->comment('Latitude coordinate');
            $table->decimal('longitude', 11, 7)->comment('Longitude coordinate');
            $table->unsignedInteger('radius_meter')->default(50)->comment('Allowed radius in meters from the coordinate for valid check-in');
            $table->boolean('is_active')->default(1)->comment('Flag to enable/disable location (1=Active, 0=Inactive)');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lokasi_absen');
    }
};
