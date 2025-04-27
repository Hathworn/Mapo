#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Combine offsets into pointers to remove repetitive calculations
    float *x_ptr = X + OFFX;
    float *y_ptr = Y + OFFY;
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure restricted range for efficient memory access
    if (i < N) {
        y_ptr[i * INCY] += ALPHA * x_ptr[i * INCX];
    }
}