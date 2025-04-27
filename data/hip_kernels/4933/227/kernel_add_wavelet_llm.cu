#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_wavelet (float *g_u2, float wavelets, const int nx, const int ny, const int ngpus)
{
    // Calculate position offset only once outside loop
    int ipos = (ngpus == 2 ? ny - 10 : ny / 2 - 10); 

    // Compute global index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the overall index
    unsigned int idx = ipos * nx + ix;

    // Use atomic add for safer addition on the same index
    if (ix == nx / 2) {
        atomicAdd(&g_u2[idx], wavelets);
    }
}