#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void mul_double(int n, double *a, double *b, double *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Perform multiply in registers
        double temp_a = a[i];
        double temp_b = b[i];
        sum[i] = temp_a * temp_b;
    }
}