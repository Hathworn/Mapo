#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Bprop1(const float* in, float* dsyn1, const float* dlayer1, const float alpha)
{
    // Calculate unique thread indices
    int i = blockDim.y * blockIdx.y + threadIdx.y; // 28*28
    int j = threadIdx.x;                           // 256
    int k = blockIdx.x;                            // Data.count

    // Use register variables to avoid re-computation and minimize memory access
    float dlayer1_val = dlayer1[k * 256 + j];
    float in_val = in[k * 28 * 28 + i];
    float result = dlayer1_val * in_val * alpha;

    // Atomic addition to handle concurrent writes by multiple threads
    atomicAdd(&dsyn1[i * 256 + j], result);
}