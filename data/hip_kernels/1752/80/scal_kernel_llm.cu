#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate the stride
    
    // Use stride to allow each thread to compute multiple elements
    for (int index = i; index < N; index += stride) {
        X[index * INCX] *= ALPHA;  // Scale the vector element
    }
}