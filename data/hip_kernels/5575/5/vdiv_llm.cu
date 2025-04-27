#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

}

// Kernel function to perform vector division with boundary check
__global__ void vdiv(const float *a, const float *b, float *c, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) { // Ensure within bounds
        c[i] = a[i] / b[i];
    }
}