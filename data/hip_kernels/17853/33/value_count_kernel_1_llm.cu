#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void value_count_kernel_1(int nnz, const size_t *hash_value_index_sort, uint32_t *new_hash_value_flag) {
    // Optimize using shared memory for reduced global memory access
    __shared__ size_t shared_hash_value[BLOCKDIM];
    
    // Calculate global thread index
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load current hash value into shared memory
    if (gid < nnz) {
        shared_hash_value[threadIdx.x] = hash_value_index_sort[gid];
    }
    
    // Synchronize to ensure all threads have loaded their data
    __syncthreads();

    // Process data once all are loaded
    if (gid < nnz) {
        size_t cur_value = shared_hash_value[threadIdx.x];
        
        // Handle first element separately
        if (gid > 0) {
            size_t former_value = (threadIdx.x == 0) ? hash_value_index_sort[gid - 1] : shared_hash_value[threadIdx.x - 1];
            new_hash_value_flag[gid] = (cur_value != former_value) ? 1 : 0;
        } else {  // gid == 0
            new_hash_value_flag[gid] = 1;
        }
    }
}