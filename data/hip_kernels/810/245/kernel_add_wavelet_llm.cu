#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_wavelet(float *g_u2, float wavelets, const int nx, const int ny, const int ngpus)
{
    // Calculate global grid index more efficiently using constant expressions
    int ipos = (ngpus == 2) ? (ny - 10) : (ny / 2 - 10);
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int idx = ipos * nx + ix;

    // Use bitwise operation for better performance with integer division by 2
    if (ix == (nx >> 1)) g_u2[idx] += wavelets;
}