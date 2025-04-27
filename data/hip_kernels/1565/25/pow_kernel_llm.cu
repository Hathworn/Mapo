#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure all threads are utilized properly by checking index range
    if(i < N) 
    {
        float x_val = X[i * INCX];  // Load input to register
        Y[i * INCY] = powf(x_val, ALPHA);  // Perform pow calculation and store the result
    }
}