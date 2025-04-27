#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *x, int n)
{
    // Calculate global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Use stride loop with precomputed constant value
    const float constant = sqrt(3.14159);
    for (int i = tid; i < n; i += blockDim.x * gridDim.x) {
        x[i] = powf(constant, i); // Use powf for single precision
    }
}