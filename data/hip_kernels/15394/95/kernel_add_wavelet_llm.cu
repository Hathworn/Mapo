#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_wavelet(float *g_u2, float wavelets, const int nx, const int ny, const int ngpus) 
{
    // Global grid index calculation for y dimension
    int ipos = (ngpus == 2 ? ny - 10 : ny / 2 - 10);

    // Global x index for current thread
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Only one thread executes if condition, reducing warp divergence
    if (ix == nx / 2) 
    {
        unsigned int idx = ipos * nx + ix;  // Compute its index
        g_u2[idx] += wavelets;  // Add wavelet
    }
}