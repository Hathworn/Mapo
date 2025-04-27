#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the thread's global index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure the index is within bounds
    if(i < n) {
        float b_value = (b != nullptr) ? b[i] : 0;
        c[i] = s[i] * a[i] + (1.0f - s[i]) * b_value;
    }
}