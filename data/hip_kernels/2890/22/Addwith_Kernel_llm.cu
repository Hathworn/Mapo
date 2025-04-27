#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Addwith_Kernel(float* in_out_put, const float* other, const float weight, const int width, const int height, const int nChannels)
{
    // Calculate linear thread index to simplify indexing
    int index = threadIdx.x + blockIdx.x * blockDim.x + (threadIdx.y + blockIdx.y * blockDim.y) * width;
    
    if (index >= width * height) return;

    // Unroll loop to maximize parallelism
    int base = index * nChannels;
    for (int c = 0; c < nChannels; c++) {
        float value = other[base + c] * weight;
        in_out_put[base + c] += value; 
    }
}