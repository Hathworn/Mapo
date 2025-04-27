#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int i;
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);

    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Use half_count variable only once and store computation result
    const unsigned int half_count = BLOCKSIZE / (2 * sizeof(unsigned int));
    unsigned int* ptr_mid = ptr + half_count;

    // Unroll loop for copying data to ptr_mid
    #pragma unroll
    for (i = 0; i < half_count; i++) {
        ptr_mid[i] = ptr[i];
    }

    // Unroll loop for copying data back to ptr with an offset
    #pragma unroll
    for (i = 0; i < half_count - 8; i++) {
        ptr[i + 8] = ptr_mid[i];
    }

    // Unroll loop for handling the first 8 elements
    #pragma unroll
    for (i = 0; i < 8; i++) {
        ptr[i] = ptr_mid[half_count - 8 + i];
    }

    return;
}