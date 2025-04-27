#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    // Calculate the thread's unique global offset
    unsigned int* ptr = (unsigned int*) (_ptr + (blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int)));
    
    // Check if the pointer is out of bounds, return early
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    // Using shared memory to reduce global memory access latency
    __shared__ unsigned int shared_pattern[BLOCKSIZE / sizeof(unsigned int)];
    
    // Initialize pattern variables
    unsigned int k = offset;
    unsigned int pat = pattern;
    
    // Sequential processing replaced by parallel processing on threads within the block
    shared_pattern[threadIdx.x] = pat;
    k++;
    if (k >= 32) {
        k = 0;
        shared_pattern[threadIdx.x] = lb;
    } else {
        shared_pattern[threadIdx.x] = shared_pattern[threadIdx.x] << 1 | sval;
    }
    
    ptr[threadIdx.x] = shared_pattern[threadIdx.x];
}