```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    // Use flattenId to eliminate index calculations in the loop
    unsigned int flattenId = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;
    
    // Loop over columns to leverage memory access efficiency
    for (unsigned int ix = flattenId; ix < nx; ix += stride) {
        for (unsigned int iy = threadIdx.y; iy < ny; iy += blockDim.y) {
            out[ix * ny + iy] = in[ix * ny + iy];
        }
    }
}