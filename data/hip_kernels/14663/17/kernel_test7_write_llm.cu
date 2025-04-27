#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    // Calculate the global index for the threads
    unsigned int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int* ptr = (unsigned int*)_ptr;

    // Calculate the number of unsigned ints to process per block
    unsigned int numIntsPerBlock = BLOCKSIZE / sizeof(unsigned int);

    // Use the global index to determine the offset within ptr
    unsigned int* write_ptr = ptr + numIntsPerBlock * blockIdx.x;

    // Avoid out-of-bound writes
    if ((char*)(write_ptr + threadIdx.x) >= end_ptr) {
        return;
    }

    unsigned int* start_ptr = (unsigned int*)_start_ptr;

    // Only the thread within block size should write
    if (threadIdx.x < numIntsPerBlock) {
        write_ptr[threadIdx.x] = start_ptr[threadIdx.x]; // Copy data from start_ptr with each thread writing unique data 
    }
}
```
