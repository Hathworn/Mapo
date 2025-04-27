#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GatherKernel(const float* params, int64_t num_features, int embed_size, int batch_size, int query_nnz, const int64_t* indices, float* ret) {
    int tid = threadIdx.x, bid = blockIdx.x;

    extern __shared__ int shmem_indices[];

    // Load indices into shared memory using strides for coalesced access
    for (int i = tid; i < query_nnz; i += blockDim.x) {
        shmem_indices[i] = indices[query_nnz * bid + i];
    }
    __syncthreads();

    // Loop unrolling for performance improvement assuming embed_size is a multiple of warp size
    for (int i = 0; i < query_nnz; ++i) {
        ret[(bid * query_nnz + i) * embed_size + tid] = params[shmem_indices[i] * embed_size + tid];
    }
}