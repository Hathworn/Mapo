#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CoalescedKernel(int *x, int *y, int *z, int *sum)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load data into shared memory for faster access
    __shared__ int sharedX[256], sharedY[256], sharedZ[256]; // Assuming max blockDim.x is 256
    sharedX[threadIdx.x] = x[idx];
    sharedY[threadIdx.x] = y[idx];
    sharedZ[threadIdx.x] = z[idx];
    __syncthreads();

    // Perform computation using shared memory
    int tempX = sharedX[threadIdx.x];
    int tempY = sharedY[threadIdx.x];
    int tempZ = sharedZ[threadIdx.x];

    sum[idx] = tempX * tempX + tempY * tempY + tempZ * tempZ;
}