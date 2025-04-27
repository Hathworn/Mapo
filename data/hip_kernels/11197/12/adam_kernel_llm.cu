#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t) {
    // Optimize index calculation using 3D thread and block values
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index < N) {
        // Cache repeated calculations to improve performance
        float B1_t = pow(B1, t);
        float B2_t = pow(B2, t);
        float rate_adjusted = rate * sqrt(1.0f - B2_t) / (1.0f - B1_t);
        
        x[index] += rate_adjusted * m[index] / (sqrt(v[index]) + eps);
    }
}