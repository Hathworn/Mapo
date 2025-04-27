#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void misaligned_read_unrolled4(int* a, int* b, int* c, int size, int offset)
{
    // Calculate initial index for the unrolling with offset
    int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    int k = i + offset;

    // Ensure all accessed indices are within bounds
    if (k + 3 * blockDim.x < size)
    {
        // Use temporary registers to optimize memory access
        int aVal0 = a[k];
        int bVal0 = b[k];
        int aVal1 = a[k + blockDim.x];
        int bVal1 = b[k + blockDim.x];
        int aVal2 = a[k + 2 * blockDim.x];
        int bVal2 = b[k + 2 * blockDim.x];
        int aVal3 = a[k + 3 * blockDim.x];
        int bVal3 = b[k + 3 * blockDim.x];

        // Perform computation using temporary registers
        c[i] = aVal0 + bVal0;
        c[i + blockDim.x] = aVal1 + bVal1;
        c[i + 2 * blockDim.x] = aVal2 + bVal2;
        c[i + 3 * blockDim.x] = aVal3 + bVal3;
    }
}