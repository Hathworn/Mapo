#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    // Calculate global thread index for coalesced access
    unsigned int idx = blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int);

    // Convert _ptr to unsigned int pointer and calculate the target address
    unsigned int* ptr = (unsigned int*)(_ptr + idx);
    
    // Ensure thread accesses within bounds
    if ((char*)ptr >= end_ptr) {
        return;
    }
    
    // Write pattern to memory in a coalesced and efficient way using threads
    ptr[0] = pattern;
}