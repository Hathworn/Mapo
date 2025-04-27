#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    // Calculate a single global index for each thread in the grid
    unsigned int globalIndex = blockIdx.x * BLOCKSIZE / sizeof(unsigned int) + threadIdx.x;
    unsigned int* ptr = (unsigned int*)_ptr;

    // Ensure the thread has valid memory access
    if ((ptr + globalIndex) < (unsigned int*)end_ptr) {
        // Write pattern using individual threads
        ptr[globalIndex] = pattern;
    }
}