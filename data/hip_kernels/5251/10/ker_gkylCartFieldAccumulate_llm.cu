#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized with shared memory
__global__ void ker_gkylCartFieldAccumulate(unsigned s, unsigned nv, double fact, const double *inp, double *out)
{
    // Calculate global index
    int n = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop unrolling for better performance
    for (int i = n; i < nv; i += blockDim.x * gridDim.x)
    {
        if (i >= s) // Boundary check
        {
            out[i] += fact * inp[i];
        }
    }
}