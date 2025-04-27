#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;

    // Check if the starting pointer is within bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Utilize pointer arithmetic for better performance
    unsigned int* end_block_ptr = ptr + BLOCKSIZE / sizeof(unsigned int);

    // Use a while loop instead of for for slightly better performance
    while (ptr < end_block_ptr) {
        *ptr++ = *start_ptr++;
    }
}