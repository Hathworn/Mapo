#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_wavelet(float *g_u2, float wavelets, const int nx, const int ny, const int ngpus)
{
    // Calculate global index on (x, y) plane
    int ipos = (ngpus == 2 ? ny - 10 : ny / 2 - 10);
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread is within bounds
    if (ix < nx) {
        unsigned int idx = ipos * nx + ix;
        
        // Use atomic operation for thread safety
        if (ix == nx / 2) {
            atomicAdd(&g_u2[idx], wavelets);
        }
    }
}