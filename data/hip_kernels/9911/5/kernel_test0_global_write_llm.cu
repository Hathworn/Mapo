#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Use shared memory to reduce global memory accesses.
    __shared__ unsigned int shared_pattern;

    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    // Initialize the pattern in shared memory once.
    shared_pattern = 1;
    __syncthreads(); // Ensure all threads have the initialized pattern

    unsigned long mask = 4;

    *ptr = shared_pattern; // Write pattern from shared memory

    while(ptr < end_ptr){

        ptr = (unsigned int*) ( ((unsigned long)orig_ptr) | mask);
        if (ptr == orig_ptr){
            mask = mask << 1;
            continue;
        }
        if (ptr >= end_ptr){
            break;
        }

        // Write pattern from shared memory
        *ptr = shared_pattern;
        
        // Update the pattern with care to synchronize changes
        if (threadIdx.x == 0) shared_pattern = shared_pattern << 1;
        __syncthreads(); // Ensure all threads see the updated pattern

        mask = mask << 1;
    }
    return;
}