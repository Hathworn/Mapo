#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CropKernel(float min, float max, float* input, float* output, int size)
{
    // Calculate global index in a more concise way
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a check to avoid accessing beyond the size
    if (id < size)
    {
        // Directly assign the cropped value to the output
        output[id] = fmaxf(fminf(input[id], max), min);
    }
}