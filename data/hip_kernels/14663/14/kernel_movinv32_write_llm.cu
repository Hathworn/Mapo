#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    // Calculate the starting pointer for this block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Return early if the starting pointer is beyond end_ptr
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Initialize variables
    unsigned int k = offset;
    unsigned int pat = pattern;
    
    // Calculate number of elements to process in this kernel
    unsigned int num_elements = BLOCKSIZE / sizeof(unsigned int);
    
    // Loop over each element in the block efficiently
    for (unsigned int i = threadIdx.x; i < num_elements; i += blockDim.x){
        ptr[i] = pat; // Assign pattern to current position
        k++; // Increment k
        if (k >= 32) {
            k = 0; // Reset k if it exceeds 31
            pat = lb; // Reset pattern to new pattern when k exceeds 31
        } else {
            pat = (pat << 1) | sval; // Shift pattern left and set sval
        }
    }
}