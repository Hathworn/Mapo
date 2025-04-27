#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void makeHVector(int rows, float *input, float *output) {
    float elt, sum = 0.f; 
    extern __shared__ float sharedMem[];  // Use dynamic shared memory
    float* sums = sharedMem;
    __shared__ float beta;

    int tid = threadIdx.x, lane = threadIdx.x % warpSize; 
    for (int i = tid; i < rows; i += blockDim.x) {
        elt = input[i];
        output[i] = elt;
        sum += elt * elt;
    }
    sums[tid] = sum;
    __syncthreads();

    // In-warp reduction
    for (int offset = warpSize / 2; offset > 0; offset >>= 1) {
        sum += __shfl_down_sync(0xFFFFFFFF, sum, offset);
    }

    if (lane == 0) {
        sums[tid / warpSize] = sum;
    }
    __syncthreads();

    // Cross-warp reduction
    if (tid < (blockDim.x / warpSize)) {
        sum = (tid < (rows + warpSize - 1) / warpSize) ? sums[tid] : 0;
        for (int offset = (blockDim.x / warpSize) / 2; offset > 0; offset >>= 1) {
            sum += __shfl_down_sync(0xFFFFFFFF, sum, offset);
        }
    }

    if (tid == 0) {
        elt = input[0];
        float norm = sqrtf(elt * elt + sum);
        elt = (elt > 0) ? elt + norm : elt - norm;
        output[0] = elt;
        beta = sqrtf(2.f / (elt * elt + sum));
    }
    __syncthreads();

    for (int i = tid; i < rows; i += blockDim.x) {
        output[i] *= beta;
    }
}