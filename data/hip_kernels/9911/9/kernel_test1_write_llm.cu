#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate the starting point for each block
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if pointer exceeds end pointer
    if (ptr >= (unsigned long*) end_ptr) return;

    // Efficiently set memory addresses using unrolling
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned long); i++) {
        ptr[i] = (unsigned long) &ptr[i];
    }
}