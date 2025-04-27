#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;

    // Optimize the bounds check by computing end_ptr inside the loop
    if (ptr < (unsigned int*) end_ptr) {
        int tid = threadIdx.x;
        int elements = BLOCKSIZE / sizeof(unsigned int);

        // Optimize using a loop with thread parallelism
        for (int i = tid; i < elements; i += blockDim.x) {
            ptr[i] = start_ptr[i];
        }
    }
}