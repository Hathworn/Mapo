#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x; // Adjusted indexing calculation 
    if (s >= size) return;

    // Initialize mean and accumulate using parallel reduction
    float mean = 0;
    for(int i = 0; i < n; ++i){
        mean += fabsf(input[i*size + s]); // Use fabsf for single precision
    }
    mean = mean / n;

    // Binarization
    for(int i = 0; i < n; ++i){
        binary[i*size + s] = (input[i*size + s] > 0) ? mean : -mean;
    }
}