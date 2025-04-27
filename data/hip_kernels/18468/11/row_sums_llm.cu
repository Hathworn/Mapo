#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void row_sums(const float *A, float *sums, size_t ds) {

    // Calculate row index
    int row = blockIdx.x;

    // Load row data into shared memory
    if (row < ds) {
        __shared__ float sdata[block_size];
        int tid = threadIdx.x;
        sdata[tid] = 0.0f;
        size_t tidx = tid;

        // Striding over the row to load data into shared memory
        while (tidx < ds) {
            sdata[tid] += A[row * ds + tidx];
            tidx += blockDim.x;
        }

        // Use parallel reduction to sum elements in shared memory
        __syncthreads();
        for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
            if (tid < s) {
                sdata[tid] += sdata[tid + s];
            }
            __syncthreads();
        }

        // Store the result back to global memory
        if (tid == 0) {
            sums[row] = sdata[0];
        }
    }
}