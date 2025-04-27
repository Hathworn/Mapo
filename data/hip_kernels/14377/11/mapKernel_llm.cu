#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mapKernel(float* out, int functionCode, float frange_start, float dx) {
    // Use shared memory for storing intermediate results
    extern __shared__ float shared[];

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    float x = frange_start + id * dx;
    float y;

    // Precompute indices for efficient memory access
    int outIdx = 2 * id;

    // Use if-else structure for potentially better performance on certain architectures
    if (functionCode == 0) {
        y = cos(x);
    } else if (functionCode == 1) {
        y = tan(x);
    } else {
        y = sin(x);
    }

    shared[threadIdx.x * 2] = x;
    shared[threadIdx.x * 2 + 1] = y;

    __syncthreads();  // Synchronize threads before writing to global memory

    out[outIdx] = shared[threadIdx.x * 2];
    out[outIdx + 1] = shared[threadIdx.x * 2 + 1];
}