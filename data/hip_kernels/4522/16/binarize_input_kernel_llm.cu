#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return;
    
    // Calculate mean once per thread and store it for re-use
    float mean = 0.0f;
    for (int i = 0; i < n; ++i) {
        mean += fabsf(input[i * size + s]);
    }
    mean = mean / n;
    
    // Use precomputed mean value for setting binary values
    float positiveMean = mean;
    float negativeMean = -mean;
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? positiveMean : negativeMean;
    }
}