<h3>Fornecedor</h3>

{{-- Fica o comentário que será descartado pelo interpretador do Blade --}}

{{ 'Texto de teste' }}
<br>
<?= 'Texto de teste';?>
<br>

@php
    // Para comentários de uma linha

    /*
     * Para comentários de multiplas linhas
     */

echo 'Texto de teste';
@endphp
