#include "hip/hip_runtime.h"
#include "includes.h"

// Update frontier
__global__ void k2(const int N, bool* visited, int* frontier, bool* new_frontier) {
    int thread_id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    __shared__ int count_shared; // Shared variable to count elements in the frontier

    if (threadIdx.x == 0) {
        count_shared = 0; // Initialize shared count in the first thread of each block
    }
    __syncthreads();

    int local_count = 0; // Local count for this thread
    if (thread_id < N && new_frontier[thread_id]) {
        new_frontier[thread_id] = false; // Clear new_frontier entry
        int index = atomicAdd(&count_shared, 1); // Atomically get the index for this thread
        frontier[index + 1] = thread_id; // Assign frontier index, offset by 1
        visited[thread_id] = true; // Mark as visited
    }

    __syncthreads();

    if (threadIdx.x == 0) {
        atomicAdd(&frontier[0], count_shared); // Update global count of frontier elements
    }
}