#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x; // Optimize indexing using only blockIdx.x
    if (f >= n) return;

    float mean = 0.0f;
    for(int i = 0; i < size; ++i){
        mean += fabsf(weights[f*size + i]);
    }

    mean /= size; // Combined division operation
    for(int i = 0; i < size; ++i){
        binary[f*size + i] = (weights[f*size + i] > 0) ? mean : -mean;
    }
}