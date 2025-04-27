#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stepFunction(const double dx, const int nx, double *u) {

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory for improved performance on each block
    __shared__ double shared_u[256]; // Adjust size based on block size
    for (int i = index; i < nx; i += stride) {
        
        double x = i * dx;
        // Run computation directly using x variable to avoid redundant calculations
        if (x >= 0.5 && x <= 1) {
            shared_u[threadIdx.x] = 2;
        } else {
            shared_u[threadIdx.x] = 1;
        }
        
        // Store back to global memory
        u[i] = shared_u[threadIdx.x];
    }
}