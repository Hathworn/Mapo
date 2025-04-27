```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Use unsigned long long for pointers to ensure 64-bit arithmetic
    unsigned long long* ptr = (unsigned long long*)_ptr;
    unsigned long long* end_ptr = (unsigned long long*)_end_ptr;
    unsigned long long orig_ptr_val = (unsigned long long)ptr;

    unsigned int pattern = 1;
    unsigned long long mask = 4;

    *ptr = pattern;

    // Minimize pointer arithmetic and condition checks
    while (true) {
        unsigned long long next_ptr_val = orig_ptr_val | mask;
        if (next_ptr_val >= (unsigned long long)end_ptr) {
            break; // Exit loop if next pointer exceeds the end pointer
        }

        ptr = (unsigned long long*)next_ptr_val;
        *ptr = pattern; // Write pattern to calculated pointer

        pattern <<= 1; // Efficient pattern update
        mask <<= 1;    // Efficient mask update
    }
    return;
}