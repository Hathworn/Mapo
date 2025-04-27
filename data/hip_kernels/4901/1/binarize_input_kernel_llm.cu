#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x * blockDim.x) + threadIdx.x; // Simplified thread index calculation
    if (s >= size) return;

    float mean = 0;
    #pragma unroll  // Unroll loop for performance
    for(int i = 0; i < n; ++i){
        mean += abs(input[i * size + s]);
    }
    mean /= n;
    #pragma unroll  // Unroll loop for performance
    for(int i = 0; i < n; ++i){
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}