#include "hip/hip_runtime.h"
#include "includes.h"

__global__  void simple_add(float* a, float* b, int n)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to handle larger data sets by utilizing more threads effectively
    for (; i < n; i += blockDim.x * gridDim.x) {
        a[i] = a[i] + b[i];
    }
}