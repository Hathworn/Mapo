#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate the global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Utilize only necessary threads for computation
    if(i < N) {
        // Precompute index values to minimize repetitive calculations
        int X_index = i * INCX;
        int Y_index = i * INCY;
        // Optimize power operation 
        Y[Y_index] = powf(X[X_index], ALPHA);
    }
}