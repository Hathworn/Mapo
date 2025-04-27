#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    // Calculate global index directly
    unsigned int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int* ptr = (unsigned int*)(_ptr + globalIdx * sizeof(unsigned int));

    // Check bounds condition
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Write pattern to memory
    *ptr = pattern;
}