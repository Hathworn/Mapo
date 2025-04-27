#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_kernel(REAL* dst, REAL const value, std::size_t const count)
{
    // Use shared memory for faster access
    extern __shared__ REAL sharedValue[];

    // Load value into shared memory
    if (threadIdx.x == 0) {
        sharedValue[0] = value;
    }
    __syncthreads();

    std::size_t const index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use branchless approach
    if (index < count) {
        dst[index] = sharedValue[0];
    }
}