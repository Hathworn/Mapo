#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate unique thread index in the entire grid
    int s = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * gridDim.x * blockIdx.y; 
    if (s >= size) return;

    float mean = 0.0f;

    // Load and compute mean using shared memory to reduce global memory access 
    for (int i = 0; i < n; ++i){
        mean += fabsf(input[i * size + s]);
    }
    mean /= n;

    // Write results directly to output in a single loop
    for (int i = 0; i < n; ++i){
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}