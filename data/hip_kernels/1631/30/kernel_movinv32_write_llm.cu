#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    // Compute global index and allocate shared memory for pattern
    unsigned int global_idx = blockIdx.x * BLOCKSIZE / sizeof(unsigned int) + threadIdx.x;
    __shared__ unsigned int shared_pattern[BLOCKSIZE/sizeof(unsigned int)];

    // Convert char pointers to unsigned int pointers
    unsigned int* ptr = (unsigned int*)_ptr;

    // Exit early if out of bounds
    if (ptr + global_idx >= (unsigned int*)end_ptr) {
        return;
    }

    // Initialize variables
    unsigned int k = offset;
    unsigned int pat = pattern;

    // Write data to shared memory pattern
    shared_pattern[threadIdx.x] = pat;

    // Update pattern in shared memory
    k++;
    if (k >= 32) {
        k = 0;
        shared_pattern[threadIdx.x] = lb;
    } else {
        shared_pattern[threadIdx.x] = shared_pattern[threadIdx.x] << 1;
        shared_pattern[threadIdx.x] |= sval;
    }

    // Synchronize to ensure all writes to shared memory are done
    __syncthreads();

    // Write from shared memory to global memory
    ptr[global_idx] = shared_pattern[threadIdx.x];
}