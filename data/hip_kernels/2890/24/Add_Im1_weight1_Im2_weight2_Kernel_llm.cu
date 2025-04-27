#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Add_Im1_weight1_Im2_weight2_Kernel(float* output, const float* Im1, const float weight1, const float* Im2, const float weight2, const int width, const int height, const int nChannels)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Use a single return statement with an early exit strategy
    if (x < width && y < height) { 
        int offset = (y * width + x) * nChannels; // Calculate offset once for better performance
        for (int c = 0; c < nChannels; c++) {
            output[offset + c] = Im1[offset + c] * weight1 + Im2[offset + c] * weight2; // Optimized memory access pattern
        }
    }
}