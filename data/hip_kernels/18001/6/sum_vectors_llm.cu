#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum_vectors(uint32_t * src, uint32_t * dst, size_t N) {
    size_t pos = threadIdx.x + blockDim.x * blockIdx.x;
    if (pos < N) {
        uint32_t value = src[pos];
        if (value != 0) {
            atomicAdd(&dst[pos], value); // Directly add when non-zero
        }
    }
}