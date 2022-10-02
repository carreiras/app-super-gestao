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

{{--@dd($fornecedores)--}}

@isset($fornecedores)
    Fornecedor: {{ $fornecedores[0]['nome'] }}
    <br>
    Status: {{ $fornecedores[0]['status'] }}
    <br>
    @isset($fornecedores[0]['cnpj'])
        Cnpf: {{ $fornecedores[0]['cnpj'] }}
        @empty($fornecedores[0]['cnpj'])
            - Vazio
        @endempty
    @endisset
@endisset



