#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

__global__ void vsub(const float *a, const float *b, float *c, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) // Ensure thread operates within bounds
    {
        c[i] = a[i] - b[i];
    }
}

}