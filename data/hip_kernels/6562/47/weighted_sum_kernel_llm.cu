#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Unrolling to enhance performance if i < n
    if(i < n) {
        float s_val = s[i];
        float a_val = a[i];
        float b_val = (b ? b[i] : 0);
        
        // Pre-calculate constant terms and avoid accessing memory twice
        float weighted_a = s_val * a_val;
        float weighted_b = (1.0f - s_val) * b_val;

        c[i] = weighted_a + weighted_b;
    }
}