<h3>Fornecedor</h3>

@php

/*
     * if (empty(variavel)) {}  // retornar true se a variavel estiver vazia
     * - ''
     * - 0
     * - 0.0
     * - '0'
     * - null
     * - false
     * - array()
     * - $var
     */
@endphp

{{-- @dd($fornecedores) --}}

@isset($fornecedores)

    @forelse($fornecedores as $indice => $fornecedor)
        @dd($loop);

        Iteração atual: {{ $loop->iteration }}
        Fornecedor: {{ $fornecedor['nome'] }}
        <br>
        Status: {{ $fornecedor['status'] }}
        <br>
        CNPJ: {{ $fornecedor['cnpj'] ?? '' }}
        <br>
        Telefone: {{ $fornecedor['ddd'] ?? '' }} - {{ $fornecedor['telefone'] ?? '' }}
        <br>
        @if ($loop->first)
            Primeira iteração do Loop
            <br>
            Total de registros {{ $loop->count }}
        @endif
        @if ($loop->last)
            Última iteração do Loop
        @endif

        <hr>
    @empty
        Não existem fornecedores cadastrados!!!
    @endforelse
@endisset
