#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grad_descent(float *odata, const float *idata, int size) {
    // Optimize using dynamic shared memory
    extern __shared__ float shared_data[];
    
    int t = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (t < size) {
        // Load data into shared memory
        shared_data[threadIdx.x] = idata[t];
        __syncthreads();

        // Perform calculation using shared memory
        odata[t] -= LEARNIG_RATE * shared_data[threadIdx.x];
    }
}