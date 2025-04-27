#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    unsigned int pattern = 1;
    unsigned long mask = 4;

    *ptr = pattern;

    // Precompute pattern shift count
    int shift_count = 0;

    while(ptr < end_ptr){

        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);
        if (ptr == orig_ptr){
            mask = mask << 1;
            shift_count++;
            continue;
        }
        if (ptr >= end_ptr){
            break;
        }

        *ptr = pattern;

        // Use precomputed shift count
        pattern = 1 << shift_count++;
        mask = mask << 1;
    }
    return;
}