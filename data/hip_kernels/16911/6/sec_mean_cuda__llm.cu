#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sec_mean_cuda_(int nProposal, int C, float *inp, int *offsets, float *out) {
    // Using shared memory to store means for planes, reducing global memory accesses
    extern __shared__ float shared_means[];

    for (int p_id = blockIdx.x; p_id < nProposal; p_id += gridDim.x) {
        int start = offsets[p_id];
        int end = offsets[p_id + 1];
        float count = (float)(end - start);

        for (int plane = threadIdx.x; plane < C; plane += blockDim.x) {
            shared_means[threadIdx.x] = 0;
            __syncthreads(); // Barrier to ensure shared memory is ready

            for (int i = start; i < end; i++) {
                shared_means[threadIdx.x] += (inp[i * C + plane] / count);
            }
            
            __syncthreads(); // Barrier to ensure all threads have written to shared memory

            out[p_id * C + plane] = shared_means[threadIdx.x];
            __syncthreads(); // Final barrier to ensure syncing between iterations
        }
    }
}