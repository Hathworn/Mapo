#include "hip/hip_runtime.h"
#include "includes.h"

#define WIDTH 1024
#define HEIGHT 1024

__global__ void add(int* a, int* b, int* c)
{
    // Calculate global thread indices
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;

    // Boundary check
    if (idx < WIDTH && idy < HEIGHT)
    {
        // Perform element-wise addition
        int index = idy * WIDTH + idx;
        c[index] = a[index] + b[index];
    }
}