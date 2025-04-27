#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;
    
    // Use register variable for mean to reduce global memory access
    float mean = 0.0f;
    
    // Optimize loop by using float2 vectorized loads
    for (int i = 0; i < size; i += 2)
    {
        float2 weight_pair = reinterpret_cast<float2*>(weights + f * size + i)[0];
        mean += fabs(weight_pair.x) + fabs(weight_pair.y);
    }

    // Compute mean value
    mean = mean / size;
    
    // Optimize loop by using float2 vectorized stores
    for (int i = 0; i < size; i += 2)
    {
        float2 weight_pair = reinterpret_cast<float2*>(weights + f * size + i)[0];
        float2 binary_pair;
        binary_pair.x = (weight_pair.x > 0) ? mean : -mean;
        binary_pair.y = (weight_pair.y > 0) ? mean : -mean;
        reinterpret_cast<float2*>(binary + f * size + i)[0] = binary_pair;
    }
}