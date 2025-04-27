#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

}

__global__ void vmul(const float *a, const float *b, float *c, int n) 
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within the bounds of the arrays
    if (i < n) {
        c[i] = a[i] * b[i];
    }
}