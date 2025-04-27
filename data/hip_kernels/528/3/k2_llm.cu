#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k2(const int N, bool* visited, int* frontier, bool* new_frontier, bool* augFound) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread ID
    __shared__ int local_count; // Shared memory for count
    if (threadIdx.x == 0) local_count = 0; // Initialize shared variable in block

    __syncthreads();

    if (tid < N && new_frontier[tid]) {
        int index = atomicAdd(&local_count, 1); // Atomic add to avoid race conditions
        new_frontier[tid] = false;
        frontier[index + 1] = tid;
        visited[tid] = true;
    }
    
    __syncthreads();

    if (threadIdx.x == 0) frontier[0] = local_count; // Only one thread writes to global memory

    __syncthreads();

    if (tid < frontier[0] && frontier[tid + 1] == (N - 1)) {
        augFound[0] = true; // Check if sink has been reached
    }
}