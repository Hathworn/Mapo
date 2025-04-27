#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_wavelet(float *g_u2, float wavelets, const int nx, const int ny, const int ngpus)
{
    // Calculate global index in x direction
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (ix < nx) { // Ensure within bounds
        // Determine position based on number of GPUs
        int ipos = (ngpus == 2 ? ny - 10 : ny / 2 - 10);
        unsigned int idx = ipos * nx + ix;
        
        // Conditional wavelet addition when ix matches
        if (ix == nx / 2) {
            g_u2[idx] += wavelets;
        }
    }
}