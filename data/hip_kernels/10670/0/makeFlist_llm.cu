#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeFlist(unsigned int *d_trans_offset, unsigned int *d_transactions, unsigned int *d_flist, unsigned int num_transactions, unsigned int num_items_in_transactions) {

    __shared__ unsigned int private_items[max_unique_items];

    int tx = threadIdx.x;
    int index = tx + blockDim.x * blockIdx.x;
    int location_x;

    // Initialize shared memory efficiently
    for (int i = tx; i < max_unique_items; i += blockDim.x) {
        private_items[i] = 0;
    }

    __syncthreads();

    // Efficient atomic addition only if index is valid
    if (index < num_items_in_transactions && d_transactions[index] < max_unique_items) {
        atomicAdd(&private_items[d_transactions[index]], 1);
    }

    __syncthreads();

    // Efficient accumulation into global memory
    for (int i = tx; i < max_unique_items; i += blockDim.x) {
        atomicAdd(&d_flist[i], private_items[i]);
    }
}