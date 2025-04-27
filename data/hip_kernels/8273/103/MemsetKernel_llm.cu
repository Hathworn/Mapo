#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the global position in a single step
    int pos = blockIdx.y * blockDim.y * w + threadIdx.y * w + blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check in a single condition
    if (pos < w * h) {
        image[pos] = value; // Assign the value directly
    }
}