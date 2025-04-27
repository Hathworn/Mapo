#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_wavelet(float *g_u2, float wavelets, const int nx, const int ny, const int ngpus)
{
    // Compute global thread index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if the index is out of bounds
    if (ix >= nx) return;

    // Calculate index specific to 2 GPUs setup or single GPU setup
    int ipos = (ngpus == 2 ? ny - 10 : ny / 2 - 10);
    unsigned int idx = ipos * nx + ix;

    // Perform the wavelet addition only for the specified index
    if (ix == nx / 2) {
        g_u2[idx] += wavelets;
    }
}