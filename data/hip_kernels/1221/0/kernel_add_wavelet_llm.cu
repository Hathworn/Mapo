#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to add wavelet source term
__global__ void kernel_add_wavelet(float *d_u, float *d_wavelet, int it)
{
    // Calculate global index
    unsigned int idx = blockIdx.y * blockDim.y * c_nx + blockIdx.x * blockDim.x + threadIdx.y * c_nx + threadIdx.x;

    // Add wavelet to source position
    if (idx == c_jsrc * c_nx + c_isrc)
    {
        d_u[idx] += d_wavelet[it];
    }
}