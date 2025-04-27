#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate index using threadIdx.x for better utilization of threads
    unsigned long* ptr = (unsigned long*)(_ptr + (blockIdx.x * blockDim.x + threadIdx.x) * sizeof(unsigned long));

    // Early exit if pointer is beyond the end
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use blockDim.x to efficiently access and write to memory
    unsigned int stride = blockDim.x * gridDim.x;
    for (unsigned long* p = ptr; p < (unsigned long*)end_ptr; p += stride) {
        *p = (unsigned long)p;
    }
}