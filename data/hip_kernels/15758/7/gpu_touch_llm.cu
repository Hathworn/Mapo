#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_touch(uint64_t *x, const size_t size)
{
    // Utilize grid stride loop for better efficiency and avoid warp divergence
    for (size_t i = blockIdx.x * blockDim.x + threadIdx.x; i < size; i += blockDim.x * gridDim.x)
    {
        x[i] = 0;
    }
}