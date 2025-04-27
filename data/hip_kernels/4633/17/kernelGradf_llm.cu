#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelGradf(const float *d_x, float *d_grad)
{
    // Load inputs into registers to avoid multiple global memory accesses
    const float x0 = d_x[0];
    const float x1 = d_x[1];

    // Compute reusable expression - (x1 - x0^2) to reduce redundancy
    const float x1_minus_x0_squared = x1 - x0 * x0;

    // Use reusable expression to calculate gradients
    d_grad[0] = -2.0f * (1.0f - x0) - 400.0f * x0 * x1_minus_x0_squared;
    d_grad[1] = 200.0f * x1_minus_x0_squared;
}
```
