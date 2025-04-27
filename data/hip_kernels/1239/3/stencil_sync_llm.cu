#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_sync(int *in, int *out)
{
    __shared__ int temp[BLOCK_SIZE + 2 * RADIUS];
    int gindex = threadIdx.x + blockIdx.x * blockDim.x;
    int lindex = threadIdx.x + RADIUS;

    // Load elements with boundary checks into shared memory
    if (gindex < gridDim.x * blockDim.x + 2 * RADIUS) {
        temp[lindex] = in[gindex + RADIUS];
    }
    if (threadIdx.x < RADIUS) {
        int left_index = gindex - RADIUS;
        int right_index = gindex + BLOCK_SIZE + RADIUS;
        temp[lindex - RADIUS] = left_index >= 0 ? in[left_index] : 0; // Boundary check
        temp[lindex + BLOCK_SIZE] = right_index < gridDim.x * blockDim.x + 2 * RADIUS ? in[right_index] : 0; // Boundary check
    }

    // Synchronize threads before applying stencil
    __syncthreads();

    // Apply the stencil
    int result = 0;
    for (int offset = -RADIUS; offset <= RADIUS; offset++)
        result += temp[lindex + offset];

    // Store the result
    out[gindex] = result;
}