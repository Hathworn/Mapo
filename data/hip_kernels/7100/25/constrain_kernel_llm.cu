#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index with blockDim.x
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < N) {
        // Perform constraining operations on array X
        float val = X[i*INCX];
        if (val > ALPHA) {
            X[i*INCX] = ALPHA;
        } else if (val < -ALPHA) {
            X[i*INCX] = -ALPHA;
        }
    }
}