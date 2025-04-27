#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {


}

__global__ void vmul(const float *a, const float *b, float *c, int n)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (i < n) {
        c[i] = a[i] * b[i];
    }
}