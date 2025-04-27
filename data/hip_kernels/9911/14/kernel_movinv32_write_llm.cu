#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x*BLOCKSIZE);
    unsigned int idx = threadIdx.x;

    // Early exit if out of bounds
    if (ptr >= (unsigned int*) end_ptr) return;
    
    unsigned int k = offset + idx; // Calculate k based on thread index
    unsigned int pat = pattern;
    
    // If current k is within the range, perform shift directly
    if (k >= 32) {
        k = 0;
        pat = lb;
    } else {
        pat = pat << k; // Calculate pattern shift only once per thread
    }

    unsigned int num_iter = BLOCKSIZE / sizeof(unsigned int);
    for (unsigned int i = idx; i < num_iter; i += blockDim.x) {
        ptr[i] = pat;
        k++;
        if (k >= 32) {
            k = 0;
            pat = lb;
        } else {
            pat = (pat << 1) | sval; // Shift pattern and append sval
        }
    }
}