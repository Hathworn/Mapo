#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    // Calculate starting pointer for each block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the starting pointer of this block is beyond the end
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate thread-specific offset for intra-block parallelism
    unsigned int thread_offset = threadIdx.x * (BLOCKSIZE / sizeof(unsigned int) / blockDim.x);
    unsigned int* local_ptr = ptr + thread_offset;

    // Calculate the number of elements each thread will handle
    unsigned int elements_per_thread = (BLOCKSIZE / sizeof(unsigned int)) / blockDim.x;

    unsigned int k = offset + thread_offset * elements_per_thread;
    unsigned int pat = pattern;

    // Loop through each element assigned to this thread
    for (unsigned int i = 0; i < elements_per_thread; i++) {
        local_ptr[i] = pat; // Write pattern to memory
        k++;
        if (k >= 32) { // Reset pattern every 32 iterations
            k = 0;
            pat = lb;
        } else {
            pat = pat << 1; // Left shift pattern
            pat |= sval; // OR with sval
        }
    }
}
```
