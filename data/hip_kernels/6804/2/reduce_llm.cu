#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(double *a, double *z, int sizeOut) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid >= N / 2) return;

    extern __shared__ double subTotals[];
    // Load data into shared memory
    subTotals[threadIdx.x] = (a[tid * 2] + a[tid * 2 + 1]) / 2;
    __syncthreads();
    
    for (int level = 2; (blockDim.x / level) >= sizeOut; level *= 2) {
        if (threadIdx.x % level == 0) {
            // Reduce using fewer threads
            subTotals[threadIdx.x] = (subTotals[threadIdx.x] + subTotals[threadIdx.x + (level / 2)]) / 2;
        }
        __syncthreads(); // Synchronize after each reduction step
    }
    
    if (threadIdx.x % (level / 2) == 0) {
        // Store result in global memory
        z[tid / (level / 2)] = subTotals[threadIdx.x];
    }
}