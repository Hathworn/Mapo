#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate the global thread index
    unsigned int idx = blockIdx.x * BLOCKSIZE / sizeof(unsigned int) + threadIdx.x;
    unsigned int* ptr = (unsigned int*)_ptr + idx;
    
    // Check bounds only once before writing pattern
    if (ptr < (unsigned int*) end_ptr) {
        *ptr = pattern;
    }
}
```
