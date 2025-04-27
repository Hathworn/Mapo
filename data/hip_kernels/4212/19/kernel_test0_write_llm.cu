#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* end = (unsigned int*) end_ptr;

    // Return early if pointer is out of bounds
    if (ptr >= end) {
        return;
    }

    // Calculate end pointer for this block to avoid boundary pitfalls
    unsigned int* block_end = ptr + BLOCKSIZE / sizeof(unsigned int);
    if (block_end > end) {
        block_end = end;
    }

    // Efficient write using pointer arithmetic and memory coalescing
    for (; ptr < block_end; ++ptr) {
        *ptr = pattern;
    }
}
```
