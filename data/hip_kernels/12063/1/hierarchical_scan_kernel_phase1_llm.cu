#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hierarchical_scan_kernel_phase1(int *X, int *Y, int *S) {
    __shared__ int XY[SECTION_SIZE];
    __shared__ int AUS[BLOCK_DIM];
    int tx = threadIdx.x, bx = blockIdx.x;
    int i = bx * SECTION_SIZE + tx;

    if (i < INPUT_SIZE) {
        // Load data collaboratively, ensuring coalesced access
        for (int j = 0; j < SECTION_SIZE; j += BLOCK_DIM) {
            XY[tx + j] = X[i + j];
        }
        __syncthreads();

        // Phase 1: Perform an inclusive scan on each subsection
        for (int j = 1; j < SUBSECTION_SIZE; j++) {
            XY[tx * SUBSECTION_SIZE + j] += XY[tx * SUBSECTION_SIZE + j - 1];
        }
        __syncthreads();

        // Phase 2: Iteratively perform a Kogge-Stone scan on the last elements of subsections
        AUS[tx] = XY[(tx + 1) * SUBSECTION_SIZE - 1];
        for (unsigned int stride = 1; stride < BLOCK_DIM; stride *= 2) {
            int in = 0; // Use a local variable for temporary storage
            __syncthreads();
            if (tx >= stride) {
                in = AUS[tx - stride];
            }
            __syncthreads();
            if (tx >= stride) {
                AUS[tx] += in;
            }
        }
        __syncthreads();

        // Phase 3: Add the prefix sum of the previous subsections
        if (tx > 0) {
            int addVal = AUS[tx - 1]; // Store the value to add in a local variable
            for (unsigned int stride = 0; stride < SUBSECTION_SIZE; stride++) {
                XY[tx * SUBSECTION_SIZE + stride] += addVal;
            }
        }
        __syncthreads();

        // Store the result into the output vector
        for (int j = 0; j < SECTION_SIZE; j += BLOCK_DIM) {
            Y[i + j] = XY[tx + j];
        }

        // The last thread writes the output value of the last element to the block index position of S
        if (tx == BLOCK_DIM - 1) {
            S[bx] = XY[SECTION_SIZE - 1];
        }
    }
}