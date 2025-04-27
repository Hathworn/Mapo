```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    
    // Return early if original pointer exceeds end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Initial memory write
    *ptr = pattern;

    // Loop to write patterns within block boundary
    while (ptr < block_end)
    {
        ptr = (unsigned int*)((unsigned long)orig_ptr | mask);

        // Check if mask produces original pointer, adjust mask
        if (ptr == orig_ptr) {
            mask = mask << 1;
            continue;
        }

        // If calculated pointer exceeds block end, exit loop
        if (ptr >= block_end) {
            break;
        }

        // Write pattern to calculated pointer
        *ptr = pattern;

        pattern = pattern << 1;
        mask = mask << 1;
    }
    return;
}