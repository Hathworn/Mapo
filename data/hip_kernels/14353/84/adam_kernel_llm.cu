#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return if index is out of bounds
    if (index >= N) return;
    
    // Precompute powers and square root for efficiency
    float B2_t = pow(B2, t);
    float B1_t = pow(B1, t);
    float sqrt_v = sqrt(v[index]);
    
    // Update x using precomputed values
    x[index] += rate * sqrt(1.0f - B2_t) / (1.0f - B1_t) * m[index] / (sqrt_v + eps);
}