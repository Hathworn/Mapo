#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GatherBackwardFuseSgdKernel(const float* grads, int64_t num_features, int embed_size, int batch_size, int query_nnz, const int64_t* indices, float lr, float* params) {
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int threadID = bid * blockDim.x + tid;  // Unique ID for each thread

    extern __shared__ int64_t shmem_indices[];

    // Coalesced memory access for better performance
    for (int i = tid; i < query_nnz; i += blockDim.x) {
        shmem_indices[i] = indices[query_nnz * bid + i];
    }
    __syncthreads();

    if (tid < embed_size) {  // Ensure only threads needed proceed
        for (int i = 0; i < query_nnz; ++i) {
            // Efficient atomic operation
            atomicAdd(&params[shmem_indices[i] * embed_size + tid],
                      -lr * grads[(bid * query_nnz + i) * embed_size + tid]);
        }
    }
}