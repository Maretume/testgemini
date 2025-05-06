
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
        Schema::create('ptkp', function (Blueprint $table) {
            $table->integer('Id_ptkp')->primary();
            $table->string('Kd_ptkp', 12)->nullable();
            $table->decimal('Total_ptkp', 15, 2)->default(0.00);
            $table->string('Keterangan', 100)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ptkp');
    }
};