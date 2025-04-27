#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IfThenElse(bool * b, float * x, size_t idxb, size_t idxf, size_t N)
{
    // Calculate global index once instead of inside loop
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid unnecessary calculations inside the loop
    size_t b_offset = (idxb-1) * N;
    size_t x_offset_1 = (idxf-1) * N;
    size_t x_offset_2 = (idxf-2) * N;

    // Loop to handle all elements assigned to this thread
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        // Simplified condition and assignment
        if (b[b_offset + i])
            x[x_offset_2 + i] = x[x_offset_1 + i];
    }
}