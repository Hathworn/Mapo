#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    // Use __syncthreads() to ensure all threads reach this point before proceeding
    __syncthreads();

    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int));

    // Check boundary condition for each thread
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Write pattern using each thread for its own memory slot
    *ptr = pattern;

    // Synchronize threads before returning
    __syncthreads();

    return;
}