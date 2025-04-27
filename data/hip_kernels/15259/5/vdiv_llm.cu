#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

}

__global__ void vdiv(const float *a, const float *b, float *c, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Only perform division if index is within bounds
    if (i < n) {
        c[i] = a[i] / b[i];
    }
}