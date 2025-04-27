#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

}

__global__ void vdiv(const float *a, const float *b, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if the index is within bounds
    if (i < gridDim.x * blockDim.x) {
        c[i] = a[i] / b[i];
    }
}