#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate the base address of the current block
    unsigned long* ptr = (unsigned long*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the calculated pointer exceeds the end pointer
    if (ptr >= (unsigned long*)end_ptr) {
        return;
    }

    // Calculate the start index for the current thread in the block
    unsigned int index = threadIdx.x;

    // Unroll the loop to improve performance
    #pragma unroll
    for (unsigned int i = index; i < BLOCKSIZE / sizeof(unsigned long); i += blockDim.x) {
        // Write to memory with the address of the pointer
        ptr[i] = (unsigned long)&ptr[i];
    }
}