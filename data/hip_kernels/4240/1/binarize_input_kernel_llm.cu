#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef CUDNN
#pragma comment(lib, "cudnn.lib")
#endif

extern "C" {
}


__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block and thread index calculation
    if (s >= size) return;
    
    float mean = 0.0f;
    for (int i = 0; i < n; ++i)
    {
        mean += fabs(input[i * size + s]); // Accumulate absolute values
    }
    mean /= n; // Compute mean
    
    for (int i = 0; i < n; ++i)
    {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean; // Binarize input
    }
}