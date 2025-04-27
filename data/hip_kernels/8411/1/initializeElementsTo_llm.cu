#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initializeElementsTo(int initialValue, int *a, int N)
{
    // Use block size that is a multiple of warp size for better efficiency
    const int stride = blockDim.x * gridDim.x;
    for (int i = threadIdx.x + blockIdx.x * blockDim.x; i < N; i += stride) {
        a[i] = initialValue;
    }
}