#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_ASM(float *norm, float *ASM, int max, float sum, int size) {
    // Calculate global thread indices for 2D grid and block
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    int tid = threadIdx.x;

    // Check if index is within bounds
    if (idx < size) {
        // Compute ASM value for the current index
        ASM[idx] = norm[idx] * norm[idx];
    }

    // Perform parallel reduction to compute sum of ASMs
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        // Ensure the first thread in stride can sum with its neighbor
        if (tid < stride && idx + stride < size) {
            ASM[idx] += ASM[idx + stride];
        }
        // Synchronize threads to ensure all computations are complete before next iteration
        __syncthreads();
    }

    // Print the final result from the first thread of the block
    if (tid == 0 && idx < size) {
        printf("ASM %f %d\n", ASM[0], idx);
    }
}