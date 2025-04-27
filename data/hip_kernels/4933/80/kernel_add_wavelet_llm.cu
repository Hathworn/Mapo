#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_wavelet (float *g_u2, float wavelets, const int nx, const int ny, const int ngpus) {
    // Calculate global x index and only proceed if within bounds
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    if (ix < nx) {
        // Replaced if condition with a ternary operator for clarity and efficiency
        int ipos = (ngpus == 2) ? (ny - 10) : (ny / 2 - 10);
        unsigned int idx = ipos * nx + ix;
        
        // Optimize to avoid unnecessary memory access
        if(ix == nx / 2) {
            atomicAdd(&g_u2[idx], wavelets); // Use atomicAdd to prevent race conditions
        }
    }
}