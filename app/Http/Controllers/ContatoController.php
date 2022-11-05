<?php

namespace App\Http\Controllers;

use App\Models\MotivoContato;
use Illuminate\Http\Request;

class ContatoController extends Controller
{
    public function contato(Request $request)
    {
        $motivo_contatos = MotivoContato::all();
        return view('site.contato', ['titulo' => 'Contato', 'motivo_contatos' => $motivo_contatos]
        );
    }

    public function salvar(Request $request)
    {
        // Realizar a validação dos dados do formulário recebidos no $request
        $request->validate([
            'nome' => 'required|min:3|max:40',
            'telefone' => 'required',
            'email' => 'email',
            'motivo_contato' => 'required',
            'mensagem' => 'required|max:2000'
        ]);
    }
}
