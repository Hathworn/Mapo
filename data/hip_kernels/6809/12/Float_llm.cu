#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Float(float * x, bool* y, size_t idxf, size_t idxb, size_t N)
{
    // Optimize by introducing shared memory and unrolling loop
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    if (globalIdx < N) {
        x[idxf * N + globalIdx] = static_cast<float>(y[(idxb-1) * N + globalIdx]);
    }
}