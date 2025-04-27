#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Compute global index for this thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we are within bounds
    if(i < N) 
    {
        // Efficient memory access by caching ALPHA in a register
        float alpha = ALPHA;
        
        // Compute power and store result
        Y[i*INCY] = powf(X[i*INCX], alpha);
    }
}