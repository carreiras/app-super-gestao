<?php

namespace Database\Seeders;

use App\Models\SiteContato;
use Illuminate\Database\Seeder;

//use app\Models\SiteContato;

class SiteContatoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
//        $contato = new SiteContato();
//        $contato->nome = 'Sistema SG';
//        $contato->telefone = '(99) 99999-9999';
//        $contato->email = 'contato@sg.com.br';
//        $contato->motivo_contato = 1;
//        $contato->mensagem = 'Seja bem-vindo ao sistema Super Gestão';
//        $contato->save();

        SiteContato::factory(100)->create();
    }
}
