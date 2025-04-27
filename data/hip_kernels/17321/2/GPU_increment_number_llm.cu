#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GPU_increment_number(int* buffer, int initial)
{
    // Use threadIdx.x to handle multiple threads for scalability
    int idx = threadIdx.x;
    if (idx == 0) {
        buffer[0] = 1 + initial; // Efficiently handle the operation with the first thread
    }
}