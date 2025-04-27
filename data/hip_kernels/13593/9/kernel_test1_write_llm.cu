#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned int tid = threadIdx.x; // Use threadIdx for fine-grained parallelism
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    if (ptr < (unsigned long*) end_ptr && tid < BLOCKSIZE / sizeof(unsigned long)) {
        ptr[tid] = (unsigned long) &ptr[tid]; // Assign value using individual threads
    }
}