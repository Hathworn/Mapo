#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

}

__global__ void vsub(const float *a, const float *b, float *c, int n)
{
    // Compute thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds
    if (i < n) {
        c[i] = a[i] - b[i];
    }
}