```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_wavelet(float *g_u2, float wavelets, const int nx, const int ny, const int ngpus)
{
    // Calculate global grid index for (x,y) plane
    int ipos = (ngpus == 2 ? ny - 10 : ny / 2 - 10);
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Combine calculation of idx and condition check to reduce redundant operations
    if (ix == nx / 2) {
        g_u2[ipos * nx + ix] += wavelets;
    }
}