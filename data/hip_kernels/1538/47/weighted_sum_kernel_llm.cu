#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Improve readability and performance by calculating index directly
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * blockDim.y * blockIdx.y;
    
    // Use shared memory for better performance if required (context-dependent)
    if(i < n) {
        float si = s[i];
        float ai = a[i];
        float bi = (b ? b[i] : 0); // Utilize ternary operation for efficiency
        c[i] = si * ai + (1 - si) * bi;
    }
}