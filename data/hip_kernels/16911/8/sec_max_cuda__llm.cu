#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sec_max_cuda_(int nProposal, int C, float *inp, int *offsets, float *out) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_max[];

    for (int p_id = blockIdx.x; p_id < nProposal; p_id += gridDim.x) {
        int start = offsets[p_id];
        int end = offsets[p_id + 1];

        for (int plane = threadIdx.x; plane < C; plane += blockDim.x) {
            float max_val = -1e50;

            // Initialize shared memory for each thread
            shared_max[threadIdx.x] = -1e50;

            for (int i = start; i < end; i++) {
                float current_val = inp[i * C + plane];
                if (current_val > max_val) {
                    max_val = current_val;
                }
            }
            // Write each thread's maximum to shared memory
            shared_max[threadIdx.x] = max_val;

            // Synchronize threads to ensure shared memory is fully populated
            __syncthreads();

            // Reduce maximum across all threads in block
            if (threadIdx.x == 0) {
                float block_max = shared_max[0];
                for (int j = 1; j < blockDim.x; ++j) {
                    if (shared_max[j] > block_max) {
                        block_max = shared_max[j];
                    }
                }
                // Write the block's maximum to global memory
                out[p_id * C + plane] = block_max;
            }

            // Synchronize to ensure block maximum is written before next iteration
            __syncthreads();
        }
    }
}