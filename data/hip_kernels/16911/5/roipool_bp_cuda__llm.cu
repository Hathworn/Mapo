#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void roipool_bp_cuda_(int nProposal, int C, float *d_feats, int *proposals_offset, int *output_maxidx, float *d_output_feats) {
    // Use shared memory for faster access
    extern __shared__ int shared_output_maxidx[];

    int plane = threadIdx.x;

    for (int pp_id = blockIdx.x; pp_id < nProposal; pp_id += gridDim.x) {
        // Load data into shared memory
        if (plane < C) {
            shared_output_maxidx[plane] = output_maxidx[pp_id * C + plane];
        }
        __syncthreads();

        if (plane < C) {
            int argmax_idx = shared_output_maxidx[plane];
            atomicAdd(&d_feats[argmax_idx * C + plane], d_output_feats[pp_id * C + plane]);
        }
        __syncthreads();
    }
}