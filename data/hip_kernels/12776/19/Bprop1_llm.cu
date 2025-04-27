#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Bprop1(const float* in, float* dsyn1, const float* dlayer1, const float alpha)
{
    int j = threadIdx.x;                         // 256
    int i = blockDim.y * blockIdx.y + threadIdx.y; // 28 * 28
    int k = blockIdx.x;                          // Data.count

    // Use shared memory to optimize memory access pattern.
    __shared__ float shared_dlayer1[256];
    if (j < 256) {
        shared_dlayer1[j] = dlayer1[k * 256 + j];
    }
    __syncthreads();

    float contribution = shared_dlayer1[j] * in[k * 28 * 28 + i] * alpha;

    // Reduce atomic contention by using private variable before atomicAdd.
    atomicAdd(&dsyn1[i * 256 + j], contribution);
}