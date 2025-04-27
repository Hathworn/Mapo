#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate the global thread index
    unsigned int idx = blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned long);
    unsigned long* ptr = (unsigned long*) (_ptr + idx);

    // Ensure ptr doesn't exceed end_ptr
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Write to memory using each thread to parallelize work
    ptr[0] = (unsigned long) &ptr[0];
}