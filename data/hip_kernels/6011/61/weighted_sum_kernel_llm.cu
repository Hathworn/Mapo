```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loops if needed or simplify operations (not applicable here)
    if(i < n){
        float s_val = s[i];
        float a_val = a[i];
        // Use ternary operator outside condition to minimize branching
        float b_val = (b != nullptr) ? b[i] : 0;
        c[i] = s_val * a_val + (1 - s_val) * b_val;
    }
}