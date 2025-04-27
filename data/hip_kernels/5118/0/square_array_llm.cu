#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop to increase performance by reducing branch divergence
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < N; i += stride) {
        a[i] = a[i] * a[i];
    }
}