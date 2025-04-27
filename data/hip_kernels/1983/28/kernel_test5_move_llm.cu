#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check boundary condition for the pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate half count for block data
    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use a single loop to minimize overhead and improve efficiency
    #pragma unroll
    for (unsigned int i = 0; i < half_count; i++) {
        // Simultaneously handle both mid and initial sections
        if (i < half_count - 8) {
            ptr[i + 8] = ptr_mid[i];  // First half copying 
        }
        if (i < 8) {
            ptr[i] = ptr_mid[half_count - 8 + i];  // Last 8 elements handling
        }
        ptr_mid[i] = ptr[i];  // Move first half to second
    }
    
    return;
}