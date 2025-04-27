#include "hip/hip_runtime.h"
#include "includes.h"

__device__ Query query_table(const int num_bucket, const int *bucket_start, const int key) {
    const unsigned int bucket_id = key;
    const unsigned int list_start = (bucket_id > 0 ? bucket_start[bucket_id - 1] : 0);
    const unsigned int next_list_start = bucket_start[bucket_id];
    Query query(list_start, next_list_start);
    return query;
}

__global__ void queryDevice(const int num_bucket, const int *bucket_start, const int key) {
    // Optimize by using fewer registers and improve warp efficiency
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < num_bucket) {
        Query queryresult = query_table(num_bucket, bucket_start, key);
    }
}