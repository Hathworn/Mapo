#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    // Calculate global thread index
    unsigned int global_tid = blockIdx.x * BLOCKSIZE + threadIdx.x;

    // Convert starting pointer to unsigned int
    unsigned int* ptr = (unsigned int*)_ptr;

    // Calculate the number of unsigned ints per block
    unsigned int num_uints_per_block = BLOCKSIZE / sizeof(unsigned int);

    // Compute starting position based on global thread index
    unsigned int start_idx = global_tid * num_uints_per_block;

    // Ensure the starting position is within bounds
    if ((ptr + start_idx) >= (unsigned int*)end_ptr) {
        return;
    }

    // Initialize p1
    unsigned int p1 = 1;

    // Unrolled loop for initialization in sets of 16
    for (unsigned int i = start_idx; i < start_idx + num_uints_per_block; i += 16) {
        unsigned int p2 = ~p1;

        // Initialize pattern
        ptr[i] = p1;
        ptr[i + 1] = p1;
        ptr[i + 2] = p2;
        ptr[i + 3] = p2;
        ptr[i + 4] = p1;
        ptr[i + 5] = p1;
        ptr[i + 6] = p2;
        ptr[i + 7] = p2;
        ptr[i + 8] = p1;
        ptr[i + 9] = p1;
        ptr[i + 10] = p2;
        ptr[i + 11] = p2;
        ptr[i + 12] = p1;
        ptr[i + 13] = p1;
        ptr[i + 14] = p2;
        ptr[i + 15] = p2;

        // Update p1 and reset if overflow
        p1 <<= 1;
        if (p1 == 0) {
            p1 = 1;
        }
    }
}