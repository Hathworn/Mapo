#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Use local variables to minimize memory access latency
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int pattern = 1;
    unsigned long mask = 4;

    while (ptr < end_ptr) {
        unsigned int* next_ptr = (unsigned int*)(((unsigned long)ptr) | mask);
        
        // Check boundary condition before accessing memory
        if (next_ptr < ptr || next_ptr >= end_ptr) {
            mask = mask << 1;
            continue;
        }

        *next_ptr = pattern;
        
        // Update pattern and mask efficiently
        pattern = pattern << 1;
        mask = mask << 1;
        ptr = next_ptr;
    }
}