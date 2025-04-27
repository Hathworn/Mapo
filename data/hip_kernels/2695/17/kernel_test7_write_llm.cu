#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    // Calculate the global thread index
    unsigned int idx = blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int);

    // Pointer to the location to be written
    unsigned int* ptr = (unsigned int*) (_ptr + idx);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;

    // Early exit if the calculated pointer is beyond the end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Optimized writing using threads
    unsigned int i = threadIdx.x;
    if (i < BLOCKSIZE / sizeof(unsigned int)) {
        ptr[i] = start_ptr[i];
    }

    return;
}