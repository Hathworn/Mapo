#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x; // Use only blockIdx.x for 1D grid
    if (s >= size) return;
    float mean = 0.0f;

    // Replace division within the loop 
    for(int i = 0; i < n; ++i){
        mean += fabsf(input[i * size + s]); // Use fabsf for float precision
    }
    
    mean /= n; // Perform division once after loop

    // Use same loop condition to improve data locality
    for(int i = 0; i < n; ++i){
        binary[i * size + s] = copysignf(mean, input[i * size + s]); // Use copysignf for clarity
    }
}