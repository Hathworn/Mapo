#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill(int * m, std::size_t w ,  std::size_t h)
{
    // Calculate global thread index
    auto idx = blockIdx.x * blockDim.x + threadIdx.x;
    auto idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check thread within matrix bounds and eliminate warp divergence by combining conditions
    if (idx < w && idy < h) {
        int linearIndex = idy * w + idx; // Calculate once to avoid redundant computation
        m[linearIndex] = linearIndex;    // Assign value directly
    }
}