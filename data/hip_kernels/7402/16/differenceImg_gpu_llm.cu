#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void differenceImg_gpu(const float* img1, const float* img2, float* result, int numElements)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global thread index

    if (index < numElements) { // Boundary check
        result[index] = img1[index] - img2[index]; // Compute difference for each pixel
    }
}