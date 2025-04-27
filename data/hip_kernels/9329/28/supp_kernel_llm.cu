#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Cachealpha squared to avoid redundant calculations
    float alpha_squared = ALPHA * ALPHA;

    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check bounds and perform conditional assignment
    if(i < N) {
        float value = X[i * INCX];
        if(value * value < alpha_squared) {
            X[i * INCX] = 0;
        }
    }
}