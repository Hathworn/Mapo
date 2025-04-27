#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAssignScalar(float* dest, float alpha, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Utilize memory coalescing by using consecutive threads to write data continuously
    for (unsigned int i = idx; i < len; i += stride) {
        dest[i] = alpha;
    }
}