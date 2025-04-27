#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *x, int n)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use faster approximation for pow function
    float base = 3.14159;

    for (int i = tid; i < n; i += stride) {
        x[i] = sqrt(__powf(base, i)); // Use __powf for higher performance
    }
}