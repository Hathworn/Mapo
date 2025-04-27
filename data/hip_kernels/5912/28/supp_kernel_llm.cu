#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use grid stride loop to ensure all threads are utilized
    for(int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x) {
        // Minimize repeated memory access by using a local variable
        float value = X[i * INCX];
        if((value * value) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;
        }
    }
}