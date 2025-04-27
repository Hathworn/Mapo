#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early return if pointer exceeds boundary
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use threadIdx.x for offset computation to enhance parallelism
    unsigned int offset = threadIdx.x * sizeof(unsigned long);
    if (offset < BLOCKSIZE) {
        ptr[threadIdx.x] = (unsigned long) &ptr[threadIdx.x];
    }

    return;
}
```
