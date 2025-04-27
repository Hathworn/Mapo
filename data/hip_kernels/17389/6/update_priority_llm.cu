#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_priority(int *new_priority, int n_selected, const int *new_idx, int n_ws, const int *idx, const int *priority) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid < n_selected) {
        int my_new_idx = new_idx[tid];
        // Use shared memory to reduce global memory access
        extern __shared__ int shared_idx[];
        extern __shared__ int shared_priority[];

        // Each thread loads data into shared memory
        int i = threadIdx.x;
        if (i < n_ws) {
            shared_idx[i] = idx[i];
            shared_priority[i] = priority[i];
        }
        __syncthreads();

        // Loop through the shared memory arrays
        for (int j = 0; j < n_ws; j++) {
            if (shared_idx[j] == my_new_idx) {
                new_priority[tid] = shared_priority[j] + 1;
                break; // Exit the loop early once a match is found
            }
        }
    }
}