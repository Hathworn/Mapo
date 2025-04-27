#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(float *x, int n)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride to cover all elements
    int stride = blockDim.x * gridDim.x;
    
    // Loop through the array with stride
    for (int i = tid; i < n; i += stride) {
        // Optimize calculation by avoiding repeated function calls
        float pi_pow_i = __powf(3.14159f, (float)i);
        x[i] = __fsqrt_rn(pi_pow_i);
    }
}