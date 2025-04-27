#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Calculate the global linear index
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check if the current index is within bounds
    if (index < N) {
        // Precompute constants for efficiency
        float B1_t = powf(B1, t);
        float B2_t = powf(B2, t);
        
        // Calculate mhat and vhat using precomputed terms
        float mhat = m[index] / (1.f - B1_t);
        float vhat = v[index] / (1.f - B2_t);
        
        // Update the x array using computed terms
        x[index] += rate * mhat / (sqrtf(vhat) + eps);
    }
}