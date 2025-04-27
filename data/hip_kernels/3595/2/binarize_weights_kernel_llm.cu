#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified linear index calculation
    if (f >= n) return;
    
    float mean = 0.0f;
    int offset = f * size;  // Precompute offset for the current feature map

    // Use a single loop to avoid repeated calculation of offset
    for(int i = 0; i < size; ++i){
        float weight = weights[offset + i];
        mean += fabsf(weight);
    }
    mean = mean / size;
    
    for(int i = 0; i < size; ++i){
        float weight = weights[offset + i];
        binary[offset + i] = (weight > 0) ? mean : -mean;
    }
}