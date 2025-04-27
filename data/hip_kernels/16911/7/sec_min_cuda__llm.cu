#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sec_min_cuda_(int nProposal, int C, float *inp, int *offsets, float *out) {
    // Use shared memory to store minimum values, one for each thread in a block
    extern __shared__ float shared_min[];
    int p_id = blockIdx.x;  // Each block processes one proposal

    if (p_id < nProposal) {
        int start = offsets[p_id];
        int end = offsets[p_id + 1];

        // Initialize shared memory
        for (int plane = threadIdx.x; plane < C; plane += blockDim.x) {
            shared_min[plane] = 1e50;
        }
        __syncthreads();  // Ensure all threads have initialized shared memory

        // Find minimum using shared memory
        for (int plane = threadIdx.x; plane < C; plane += blockDim.x) {
            float local_min = 1e50;
            for (int i = start; i < end; i++) {
                float val = inp[i * C + plane];
                if (val < local_min) {
                    local_min = val;
                }
            }
            // Reduce local_mins to shared memory for final min value
            atomicMin(&shared_min[plane], local_min);
        }
        __syncthreads();  // Ensure all threads have completed their atomic operations

        // Write result to global memory
        for (int plane = threadIdx.x; plane < C; plane += blockDim.x) {
            out[p_id * C + plane] = shared_min[plane];
        }
    }
}