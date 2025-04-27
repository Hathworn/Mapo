#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Check if pointer is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    // Calculate number of elements to process per thread
    unsigned int threadCount = BLOCKSIZE / sizeof(unsigned int);
    unsigned int tid = threadIdx.x;
    
    // Shared memory allocation for pattern calculation
    __shared__ unsigned int shared_pattern[BLOCKSIZE / sizeof(unsigned int)];
    
    // Offset-based pattern initialization for this thread
    unsigned int pat = (tid == 0) ? pattern : 0;
    unsigned int k = (tid == 0) ? offset : 0;

    // Initialize patterns in shared memory
    for (unsigned int i = tid; i < threadCount; i += blockDim.x) {
        if (tid == 0) {
            shared_pattern[i] = pat;
            k++;
            if (k >= 32) {
                k = 0;
                pat = lb;
            } else {
                pat = (pat << 1) | sval;
            }
        }
    }
    __syncthreads();
    
    // Write patterns from shared memory to global memory
    for (unsigned int i = tid; i < threadCount; i += blockDim.x) {
        ptr[i] = shared_pattern[i];
    }
    
    return;
}