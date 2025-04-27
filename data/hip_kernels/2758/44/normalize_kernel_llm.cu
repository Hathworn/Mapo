#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    if (index < N) // Check bounds directly
    {
        int f = (index / spatial) % filters;
        float var_sqrt = rsqrtf(variance[f] + 1e-6f); // Use rsqrtf for better performance
        x[index] = (x[index] - mean[f]) * var_sqrt;
    }
}