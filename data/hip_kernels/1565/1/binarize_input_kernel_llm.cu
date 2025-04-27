#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate global thread index for 1D grid
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return; // Boundary check

    float mean = 0.0f;
    for(int i = 0; i < n; ++i){
        mean += fabsf(input[i * size + s]);
    }
    mean /= n;

    float binary_val = (input[s] > 0) ? mean : -mean; // Calculate binary value based on sign
    for(int i = 0; i < n; ++i){
        binary[i * size + s] = binary_val; // Assign precomputed binary value
    }
}