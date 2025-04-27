#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    // Calculate global index for current thread
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;
    
    // Check if pointer is within bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate the number of elements to copy to enhance coalesced memory access
    unsigned int num_elements = BLOCKSIZE / sizeof(unsigned int);

    // Use loop unrolling for better instruction throughput
    #pragma unroll
    for (unsigned int i = 0; i < num_elements; i++){
        ptr[i] = start_ptr[i];
    }
    return;
}