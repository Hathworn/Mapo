#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Use early exit to avoid further computation if not needed
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int p1 = 1;
    // Optimize loop unrolling by reducing unnecessary calculations
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 16) {
        unsigned int p2 = ~p1;

        ptr[i] = ptr[i+1] = ptr[i+4] = ptr[i+5] = ptr[i+8] = ptr[i+9] = ptr[i+12] = ptr[i+13] = p1;
        ptr[i+2] = ptr[i+3] = ptr[i+6] = ptr[i+7] = ptr[i+10] = ptr[i+11] = ptr[i+14] = ptr[i+15] = p2;

        p1 <<= 1;
        if (p1 == 0){
            p1 = 1;
        }
    }
}