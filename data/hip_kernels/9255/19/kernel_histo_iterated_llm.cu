#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_iterated(unsigned int *ct, unsigned int *histo, unsigned int offset) {

    extern __shared__ unsigned int temp[];
    unsigned int index = threadIdx.x + offset;
    temp[threadIdx.x] = 0;  // Initialize shared memory using thread index for optimal performance
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int size = blockDim.x * gridDim.x;
    unsigned int max = constant_n_hits * constant_n_test_vertices;

    while (i < max) {
        atomicAdd(&temp[ct[i] - offset], 1);  // Adjusted for shared memory index
        i += size;
    }
    __syncthreads();

    // Efficient atomic operation, one per block thread
    unsigned int histoIndex = index - offset;  // Calculate histogram index offset
    if (threadIdx.x == 0) {  // One thread aggregates all data in shared memory
        for (int j = 0; j < blockDim.x; ++j) {
            atomicAdd(&(histo[histoIndex + j]), temp[j]);
        }
    }
}