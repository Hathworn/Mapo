```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_bins(unsigned int* bins, int* in_binID, int binNumber, const int size) {
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x;
    int nt = blockDim.x;

    // Use a smaller shared array to reduce resource usage
    __shared__ unsigned int temp[1024];
    temp[tid] = 0;
    __syncthreads();

    // Use contiguous threads to improve memory access patterns
    for (int x = tid; x < size; x += nt) {
        if (in_binID[x] == i) {
            atomicAdd(&temp[tid], 1); // Use atomic operation to prevent race conditions
        }
        if (in_binID[x] > i) {
            break;
        }
    }
    __syncthreads();

    // Use a single thread to aggregate results using atomic operation
    if (tid == 0) {
        unsigned int sum = 0;
        for (int x = 0; x < nt; x++) {
            sum += temp[x];
        }
        atomicAdd(&bins[i], sum); // Use atomic operation to ensure correct updates
    }
}