#include "hip/hip_runtime.h"
#include "includes.h"

double* x;
int numSMs;

__device__ __host__ inline double Max(double x, double y) {
    x = fabs(x);
    y = fabs(y);
    return x > y ? x : y;
}

__global__ void max_gra(double* gra, double* max) {
    extern __shared__ double sharedGra[];  // Use shared memory
    
    int index = threadIdx.x;
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    sharedGra[index] = gra[globalIndex];
    __syncthreads();

    // Perform reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (index < stride) {
            sharedGra[index] = Max(sharedGra[index], sharedGra[index + stride]);
        }
        __syncthreads();
    }

    // Write result for this block to max
    if (index == 0) {
        atomicMax((unsigned long long int*)max, __double_as_longlong(sharedGra[0]));
    }
}