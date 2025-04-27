#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_priority(int *new_priority, int n_selected, const int *new_idx, int n_ws, const int *idx, const int *priority) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid < n_selected) {
        int my_new_idx = new_idx[tid];
        // Use shared memory for idx and priority to optimize memory access
        __shared__ int shared_idx[1024];
        __shared__ int shared_priority[1024];
        
        // Load data from global to shared memory
        for (int i = threadIdx.x; i < n_ws; i += blockDim.x) {
            shared_idx[i] = idx[i];
            shared_priority[i] = priority[i];
        }
        __syncthreads();
        
        // The working set size is limited (~1024 elements) so we just loop through it
        for (int i = 0; i < n_ws; i++) {
            if (shared_idx[i] == my_new_idx) {
                new_priority[tid] = shared_priority[i] + 1;
                break; // Exit early if match is found
            }
        }
    }
}