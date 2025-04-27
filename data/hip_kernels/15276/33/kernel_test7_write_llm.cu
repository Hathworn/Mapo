```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    // Calculate the starting pointer for this block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;

    // Exit if the starting pointer is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate end boundary for loop once to reduce redundant calculation
    unsigned int boundary = BLOCKSIZE / sizeof(unsigned int);

    // Utilize shared memory for potential read reduction
    __shared__ unsigned int shared_start_ptr[BLOCKSIZE / sizeof(unsigned int)];
    if (threadIdx.x < boundary) {
        shared_start_ptr[threadIdx.x] = start_ptr[threadIdx.x];
    }
    __syncthreads();

    // Use fewer threads if array size is smaller than block size
    for (unsigned int i = threadIdx.x; i < boundary; i += blockDim.x) {
        ptr[i] = shared_start_ptr[i];
    }
}