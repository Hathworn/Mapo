#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block indexing
    if (f >= n) return;
    
    float mean = 0.0f;
    #pragma unroll // Encourage loop unrolling for increased performance
    for(int i = 0; i < size; ++i){
        mean += abs(weights[f * size + i]);
    }
    mean = mean / size;

    #pragma unroll // Encourage loop unrolling for increased performance
    for(int i = 0; i < size; ++i){
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}