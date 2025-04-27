#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Check boundaries to exit early
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }
    
    unsigned long* local_ptr = ptr;
    unsigned long* local_end_ptr = ptr + BLOCKSIZE / sizeof(unsigned long);
    
    // Loop unrolling for efficiency
    #pragma unroll
    for (; local_ptr < local_end_ptr; local_ptr++) {
        *local_ptr = (unsigned long) local_ptr;
    }

    return;
}
```
