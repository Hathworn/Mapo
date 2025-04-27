#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixKernel(float* d_in, float* d_out) {
    // Block index
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Load diagonal element once to reduce memory access
    float dividend = __ldg(&d_in[by * BLOCK_SIZE * STRIDE + bx * BLOCK_SIZE]);

    // Load divisor and compute result
    float divisor = __ldg(&d_in[(by * BLOCK_SIZE + ty) * STRIDE + (bx * BLOCK_SIZE + tx)]);

    // Perform division and store the result in the output
    d_out[(by * BLOCK_SIZE + ty) * STRIDE + (bx * BLOCK_SIZE + tx)] = dividend / divisor;
}