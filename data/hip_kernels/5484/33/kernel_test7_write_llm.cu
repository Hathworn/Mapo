#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    // Get starting index for this thread/block
    unsigned int idx = blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int); 
    unsigned int* ptr = (unsigned int*) (_ptr + idx);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;

    // Return early if out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate number of iterations per thread
    unsigned int iterations = BLOCKSIZE / sizeof(unsigned int) / blockDim.x;

    // Use shared memory to optimize
    __shared__ unsigned int shared_data[BLOCKSIZE / sizeof(unsigned int)];

    // Load data into shared memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        shared_data[i] = start_ptr[i];
    }
    __syncthreads();

    // Write from shared memory to global memory
    for (unsigned int j = 0; j < iterations; j++) {
        if (idx / sizeof(unsigned int) + j * blockDim.x < BLOCKSIZE / sizeof(unsigned int)) {
            ptr[j * blockDim.x] = shared_data[idx / sizeof(unsigned int) + j * blockDim.x];
        }
    }
}