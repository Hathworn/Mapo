#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Add(float* d_a, float* d_b, float* d_c, int N)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < N)
    {
        // Prevents redundant loads by using registers
        float a_val = d_a[id];
        float b_val = d_b[id];
        d_c[id] = a_val + b_val;
    }
}