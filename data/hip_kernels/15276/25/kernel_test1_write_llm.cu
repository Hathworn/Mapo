#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if block out of bounds
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }
    
    // Calculate the number of elements to process
    unsigned int num_elements = BLOCKSIZE / sizeof(unsigned long);

    // Calculate the start index for this thread
    unsigned int start_index = threadIdx.x;
    
    // Iterate over the array using a stride equal to blockDim.x
    for (unsigned int i = start_index; i < num_elements; i += blockDim.x) {
        ptr[i] = (unsigned long) &ptr[i];
    }
}