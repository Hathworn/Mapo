#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
extern "C"
__global__ void add(int n, double *a, double *b, double *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        // Using registers for better performance
        double ai = a[i];
        double bi = b[i];
        sum[i] = ai + bi;
    }
}