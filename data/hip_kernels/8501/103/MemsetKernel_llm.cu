#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate the 1D position
    int pos = idy * w + idx;

    // Ensure idx, idy are within bounds
    if (idy < h && idx < w) {
        image[pos] = value;
    }
}