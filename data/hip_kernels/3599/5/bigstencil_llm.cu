#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Calculate the global thread index more efficiently using a built-in function
    int i = __mul24(blockIdx.x, blockDim.x) + threadIdx.x;

    // Unroll loop for better throughput (assuming input size allows for such unrolling)
    #pragma unroll
    for (int offset = 0; offset < 2; ++offset) {
        out[i + offset] = in[i + offset] + 2;
    }
}