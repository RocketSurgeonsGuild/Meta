using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using FluentValidation;
using MediatR;

namespace Sample.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Console.WriteLine("Hello World!");
        }
    }

    static class R
    {
        class Request : IRequest<Response> { }

        class Response { }

        class Validator : AbstractValidator<Request> { }

        class ResponseValidator : AbstractValidator<Response> { }

        class Mapper : Profile { }

        class Handler : IRequestHandler<Request, Response>
        {
            public Handler(global::Serilog.ILogger logger)
            {

            }
            public Task<Response> Handle(Request request, CancellationToken cancellationToken)
            {
                return Task.FromResult(new Response());
            }
        }
    }
}