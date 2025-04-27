#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

}

__global__ void vmul(const float *a, const float *b, float *c, const int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (i < n) {
        c[i] = a[i] * b[i];
    }
}