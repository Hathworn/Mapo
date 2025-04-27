#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use int to calculate the unique id of the thread in 1D 
    int global_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that only valid threads process calculations
    if(global_id < N) {
        // Use shared memory for storing ALPHA*ALPHA to avoid repetitive calculations
        __shared__ float alpha_squared;
        if (threadIdx.x == 0) {
            alpha_squared = ALPHA * ALPHA;
        }
        __syncthreads();

        float element_squared = X[global_id * INCX] * X[global_id * INCX];
        if(element_squared < alpha_squared) {
            X[global_id * INCX] = 0;
        }
    }
}