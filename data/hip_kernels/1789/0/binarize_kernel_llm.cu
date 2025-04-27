#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate index using grid-stride loop for better workload distribution
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}