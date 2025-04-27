#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    // Calculate the global thread index
    unsigned int globalIdx = blockIdx.x * BLOCKSIZE / sizeof(unsigned int) + threadIdx.x;
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* start_ptr = (unsigned int*)_start_ptr;
    unsigned int* end_ptr_int = (unsigned int*)end_ptr;

    // Check if the current thread's work is within bounds
    if (globalIdx >= ((unsigned int*) end_ptr - ptr)) {
        return;
    }

    // Perform the memory copy operation
    ptr[globalIdx] = start_ptr[globalIdx];
}