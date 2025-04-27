#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    // Optimize pointer arithmetic with shared memory for faster access
    extern __shared__ unsigned int shared_start_ptr[];

    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int* start_ptr = (unsigned int*) _start_ptr;

    // Copy start_ptr data into shared memory for faster reads
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        shared_start_ptr[i] = start_ptr[i];
    }
    __syncthreads();

    // Write from shared memory to global memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = shared_start_ptr[i];
    }

    return;
}