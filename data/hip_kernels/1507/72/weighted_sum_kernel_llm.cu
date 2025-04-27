#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate unique thread index over a 3D block and 3D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        float s_val = s[i];
        float a_val = a[i];
        float b_val = b ? b[i] : 0;
        
        // Optimize by avoiding repeated memory accesses
        c[i] = s_val * a_val + (1 - s_val) * b_val;
    }
}