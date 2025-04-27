#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    // Use a shared memory to reduce redundant calculations
    extern __shared__ float shared_x[];

    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int lane = threadIdx.x;  // local thread index in the block

    // Load relevant data into shared memory
    shared_x[lane] = x[tid * x_stride + target[tid]];
    __syncthreads();

    // Perform the loss calculation
    y[tid] = -1.0f * shared_x[lane];
}