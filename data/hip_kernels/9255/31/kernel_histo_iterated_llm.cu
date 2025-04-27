#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_iterated(unsigned int *ct, unsigned int *histo, unsigned int offset) {
    extern __shared__ unsigned int temp[];
    unsigned int index = threadIdx.x;
    temp[index] = 0;
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int size = blockDim.x * gridDim.x;
    unsigned int max = constant_n_hits * constant_n_test_vertices;

    // Loop through data in chunks
    while (i < max) {
        atomicAdd(&temp[ct[i]], 1);
        i += size;
    }

    __syncthreads();

    // Reduce shared memory accumulation to global memory
    atomicAdd(&(histo[index + offset]), temp[index]);
}