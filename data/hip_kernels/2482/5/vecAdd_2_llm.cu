#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd_2(double *a, double *b, double *c, int n)
{
    // Calculate global index for each thread
    int id_1 = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for larger arrays

    // Utilize stride to let each thread handle multiple elements
    for (int i = id_1; i < n * n; i += stride)
    {
        c[i] = a[i] + b[i];
    }
}