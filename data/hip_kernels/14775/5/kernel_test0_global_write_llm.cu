#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Typecast pointers for easier manipulation
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Initial write of pattern
    *ptr = pattern;

    // Loop optimized for clarity and efficiency
    while(ptr < end_ptr){
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | mask);
        
        // Optimize loop exit condition handling
        if (ptr >= end_ptr) {
            break;
        }

        // Avoid writing again to the same location
        if (ptr != orig_ptr) {
            *ptr = pattern;
            pattern = pattern << 1;  // Update pattern only when writing to new address
        }
        
        mask = mask << 1;  // Increment mask
    }
    return;
}