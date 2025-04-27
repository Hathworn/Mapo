#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Early exit if thread index is out of bounds
    if (s >= size) return;
    
    // Use `int` for loop index to reduce floating point operations 
    int i;
    float sum = 0;
    
    // Accumulate the absolute values
    for (i = 0; i < n; ++i) {
        sum += fabsf(input[i * size + s]);
    }
    
    // Compute mean value
    float mean = sum / n;
    
    // Assign binarized values
    for (i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}