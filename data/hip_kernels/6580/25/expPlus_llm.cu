#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expPlus(float* out, float* in, int size) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Coalesced memory access pattern by using loop unrolling
    for (; id < size; id += blockDim.x * gridDim.x) {
        out[id] = __expf(in[id]);
    }
}