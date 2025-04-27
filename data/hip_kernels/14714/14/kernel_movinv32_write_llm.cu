#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset) {
    // Calculate the initial pointer and check boundary conditions
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Pre-calculate the block size in terms of unsigned int
    const unsigned int num_elements = BLOCKSIZE / sizeof(unsigned int);

    // Initialize variables for pattern manipulation
    unsigned int k = offset;
    unsigned int pat = pattern;

    // Unroll the loop to increase parallel execution efficiency
    #pragma unroll 4
    for (unsigned int i = 0; i < num_elements; i++) {
        ptr[i] = pat; // Write current pattern to memory
        k++; // Increment pattern position

        // Adjust pattern and reset `k` if necessary
        if (k >= 32) {
            k = 0; // Reset `k`
            pat = lb; // Set pattern to lower bound
        } else {
            pat = (pat << 1) | sval; // Shift pattern and apply sval
        }
    }
}