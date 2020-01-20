using System;
using System.Xml;
using JetBrains.Annotations;
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Rocket.Surgery.Conventions;
using Rocket.Surgery.Extensions.DependencyInjection;
using Rocket.Surgery.Operational.MediatR;

[assembly: Convention(typeof(MediatorROperationsConvention))]

namespace Rocket.Surgery.Operational.MediatR
{
    /// <summary>
    /// ValidationConvention.
    /// Implements the <see cref="Rocket.Surgery.Extensions.DependencyInjection.IServiceConvention" />
    /// </summary>
    /// <seealso cref="Rocket.Surgery.Extensions.DependencyInjection.IServiceConvention" />
    /// <seealso cref="IServiceConvention" />
    [PublicAPI]
    public class MediatorROperationsConvention : IServiceConvention
    {
        /// <summary>
        /// Registers the specified context.
        /// </summary>
        /// <param name="context">The context.</param>
        public void Register(IServiceConventionContext context)
        {
            if (context is null)
            {
                throw new ArgumentNullException(nameof(context));
            }

            var serviceConfig = context.GetOrAdd(() => new MediatRServiceConfiguration());
            context.Services.TryAddEnumerable(
                new ServiceDescriptor(
                    typeof(IPipelineBehavior<,>),
                    typeof(FluentValidationMediatRPipelineBehavior<,>),
                    serviceConfig.Lifetime
                )
            );
        }
    }
}