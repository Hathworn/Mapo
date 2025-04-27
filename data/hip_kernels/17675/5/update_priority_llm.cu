#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_priority(int *new_priority, int n_selected, const int *new_idx, int n_ws, const int *idx, const int *priority) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if (tid < n_selected) {
        int my_new_idx = new_idx[tid];

        // Utilize shared memory for idx and priority to reduce global memory access
        __shared__ int shared_idx[1024];
        __shared__ int shared_priority[1024];

        if (threadIdx.x < n_ws) {
            shared_idx[threadIdx.x] = idx[threadIdx.x];
            shared_priority[threadIdx.x] = priority[threadIdx.x];
        }
        __syncthreads();

        // Iterate over working set size using shared memory
        for (int i = 0; i < n_ws; i++) {
            if (shared_idx[i] == my_new_idx) {
                new_priority[tid] = shared_priority[i] + 1;
                break; // Early exit as idx[i] should be unique
            }
        }
    }
}