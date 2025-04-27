#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_boundaries(const int num_keys, const int num_bucket, const int *which_bucket, int *bucket_start) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    if (index < num_keys) { // Ensure the thread index is within range
        int previous_bucket = (index > 0 ? which_bucket[index - 1] : -1);
        int my_bucket = which_bucket[index];

        // Check for boundary change
        if (previous_bucket != my_bucket) {
            bucket_start[my_bucket] = index; // Set the start of the new bucket
        }

        // Handle the last element separately
        if (index == num_keys - 1) {
            for (int i = my_bucket + 1; i < num_bucket; ++i) {
                bucket_start[i] = num_keys; // Set remaining buckets to num_keys
            }
        }
    }
}