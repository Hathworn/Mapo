#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_interleaved_pairs_1(int *int_array, int *temp_array, int size) {
    int tid = threadIdx.x;
    int gid = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure gid is within bounds
    if (gid >= size) return;

    // Optimized reduction kernel
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tid < offset && gid + offset < size) { // Prevent accessing out of bounds
            int_array[gid] += int_array[gid + offset];
        }
        __syncthreads();
    }

    // Store the result of this block in global memory
    if (tid == 0) {
        temp_array[blockIdx.x] = int_array[gid];
    }
}