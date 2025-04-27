#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matadd(int *m0, int *m1, std::size_t w, std::size_t h) {
    // Calculate global thread id
    auto i = blockIdx.x * blockDim.x + threadIdx.x;
    auto j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < w && j < h) {
        // Combine index computation for better readability and performance
        auto idx = i * w + j;
        m0[idx] += m1[idx];
    }
}