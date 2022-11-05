<?php

namespace App\Http\Middleware;

use App\Models\LogAcesso;
use Closure;
use http\Env\Response;
use Illuminate\Http\Request;

class LogAcessoMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
//        dd($request);
//        $request - manipular
//        return $next($request);
//        $response - manipular

        $ip = $request->server->get('REMOTE_ADDR');
        $rota = $request->getRequestUri();

        LogAcesso::create(['log' => "Log $ip requisitou a rota $rota"]);
        return Response('Chegamos no middleware e finalizamos no próprio middleware.');
    }
}
