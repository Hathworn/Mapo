#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDRectifier_backPropagate_kernel(double* x, double* dx, unsigned int size, double leakSlope, double clipping)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory for faster access if beneficial
    extern __shared__ double s_x[];
  
    for (unsigned int i = index; i < size; i += stride) {
        // Load elements into shared memory
        s_x[threadIdx.x] = x[i];
        __syncthreads();

        double xi = s_x[threadIdx.x];
        if (clipping > 0.0) {
            dx[i] *= (xi > clipping) ? 0.0 : (xi > 0.0) ? 1.0 : leakSlope;
        } else {
            dx[i] *= (xi > 0.0) ? 1.0 : leakSlope;
        }
    }
}