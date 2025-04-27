#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_kernel(uint32_t hash_value_index_count_num, int embedding_vec_size, const size_t *deltaw_hash_value_index, const float *deltaw, float *hash_table_value) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    if (idx < hash_value_index_count_num * embedding_vec_size) { // Check bounds for all thread indices
        size_t bid = idx / embedding_vec_size; // Calculate bid from global index
        size_t tid = idx % embedding_vec_size; // Calculate tid from global index

        size_t value_index = deltaw_hash_value_index[bid];
        size_t feature_index = value_index * embedding_vec_size + tid;

        hash_table_value[feature_index] += deltaw[idx];
    }
}