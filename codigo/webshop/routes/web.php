<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Auth::routes();

// Home
Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get("/shopping/{categoria_id?}",[App\Http\Controllers\shoppingController::class, 'index'])->name('shopping');
Route::get("/categorias/getLogo/{id}",[App\Http\Controllers\categoriaController::class, 'getLogo'])->name('getLogoCategoria');
Route::get("/cupones/getImagen/{id}",[App\Http\Controllers\cuponController::class, 'getImagen'])->name('getImagenCupon');
Route::get("/recursos/thumbnail/{id}",[App\Http\Controllers\recursoController::class, 'getUnicaImagen'])->name('getUnicaImagenRecurso');

Route::middleware('auth')->group(function () {
    Route::get("/categorias",[App\Http\Controllers\categoriaController::class, 'index'])->name('categorias.index');
    Route::get("/categorias/create",[App\Http\Controllers\categoriaController::class, 'create'])->name('categorias.create');
    Route::post("/categorias/store",[App\Http\Controllers\categoriaController::class, 'store'])->name('categorias.store');
    Route::get("/categorias/show/{id}",[App\Http\Controllers\categoriaController::class, 'show'])->name('categorias.show');
    Route::get("/categorias/edit/{id}",[App\Http\Controllers\categoriaController::class, 'edit'])->name('categorias.edit');
    Route::post("/categorias/update/{id}",[App\Http\Controllers\categoriaController::class, 'update'])->name('categorias.update');
    Route::get("/categorias/delete/{id}",[App\Http\Controllers\categoriaController::class, 'delete'])->name('categorias.delete');
    Route::get("/categorias/getAlike",[App\Http\Controllers\categoriaController::class, 'getAlike'])->name('categorias.getAlike');
});

// Frontend routes
Route::prefix('front')->as('front.')->group(function () {
    // Nothing here yet
});

// Backend routes
Route::prefix('back')->as('back.')->group(function () {
    // USERS
    Route::middleware('auth')->group(function () {
        /* ------------------------------------------------------------------------ */
        // General
        Route::controller(App\Http\Controllers\Back\GeneralController::class)->group(function () {
            Route::post('/general/setValueDB', 'setValueDB')->name('general.setValueDB');
            Route::post('/general/setValueSession', 'setValueSession')->name('general.setValueSession');
            Route::get('/general/getDatatablesHelp', 'getDatatablesHelp')->name('general.getDatatablesHelp');
        });
        /* ---------------------------------------- */
        //Categorias



        // Customers
        Route::controller(App\Http\Controllers\Back\CustomerController::class)->group(function () {
            Route::delete('/customers/massDestroy', 'massDestroy')->name('customers.massDestroy');
            Route::get('/customers/getAlikes', 'getAlikes')->name('customers.getAlikes');

            Route::resource('/customers', App\Http\Controllers\Back\CustomerController::class)->except(['destroy']);
        });
        /* ------------------------------------------------------------------------ */
    });

    // DEVELOPER
    Route::middleware('auth', 'can:developer')->group(function () {
        /* ------------------------------------------------------------------------ */
        // Developer
        Route::controller(App\Http\Controllers\Back\DeveloperController::class)->group(function () {
            Route::get('/developer/hashGenerator', 'hashGenerator')->name('developer.hashGenerator');
            Route::get('/developer/impressum', 'impressum')->name('developer.impressum');
            Route::get('/developer/session', 'session')->name('developer.session');
            Route::get('/developer/test', 'test')->name('developer.test');
        });
        /* ---------------------------------------- */
        // Backups
        Route::controller(App\Http\Controllers\Back\BackupController::class)->group(function () {
            Route::get('/backups', 'index')->name('backups.index');
            Route::get('/backups/create', 'create')->name('backups.create');
            Route::get('/backups/download/{file_name}', 'download')->name('backups.download');
            Route::get('/backups/delete/{file_name}', 'delete')->name('backups.delete');
        });
        /* ------------------------------------------------------------------------ */
        // Users
        Route::controller(App\Http\Controllers\Back\UserController::class)->group(function () {
            Route::get('/users/getUserlogs', 'getUserlogs')->name('users.getUserlogs');
            Route::delete('/users/massDestroy', 'massDestroy')->name('users.massDestroy');

            Route::resource('/users', App\Http\Controllers\Back\UserController::class)->except(['show', 'destroy']);
        });

        // Users log
        Route::controller(App\Http\Controllers\Back\UserlogController::class)->group(function () {
            Route::get('/userslog/index', 'index')->name('userslog.index');
            Route::get('/userslog/statsCountry', 'statsCountry')->name('userslog.statsCountry');
            Route::get('/userslog/statsCountryMap', 'statsCountryMap')->name('userslog.statsCountryMap');
            Route::get('/userslog/statsPeriod', 'statsPeriod')->name('userslog.statsPeriod');
        });
        /* ------------------------------------------------------------------------ */
    });
});
