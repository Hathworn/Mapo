#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    // Calculate initial pointer offset based on block index
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if the pointer exceeds end_ptr
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int p1 = 1;
    unsigned int p2;
    unsigned int step = BLOCKSIZE / sizeof(unsigned int);

    #pragma unroll // Unroll loop to improve performance
    for (unsigned int i = 0; i < step; i += 16){
        p2 = ~p1; // Calculate complement of p1

        // Assign values to memory in one block
        ptr[i] = ptr[i+1] = ptr[i+4] = ptr[i+5] = ptr[i+8] = ptr[i+9] = ptr[i+12] = ptr[i+13] = p1;
        ptr[i+2] = ptr[i+3] = ptr[i+6] = ptr[i+7] = ptr[i+10] = ptr[i+11] = ptr[i+14] = ptr[i+15] = p2;

        p1 <<= 1; // Shift p1 left by 1
        if (p1 == 0) {
            p1 = 1; // Reset p1 if it becomes 0
        }
    }
}