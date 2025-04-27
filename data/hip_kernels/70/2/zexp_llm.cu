#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void zexp(float* Z, float* X, float* Y, unsigned int size)
{
    // Calculate global index for the thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for better memory access and load balancing
    for (unsigned int i = idx; i < size; i += blockDim.x * gridDim.x) {
        Z[i] = X[i] * __expf(Y[i]); // Utilize fast math intrinsic for exp
    }
}