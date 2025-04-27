#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Calculate a unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to handle out-of-bound elements
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < N; i += stride) {
        a[i] = a[i] * a[i];
    }
}