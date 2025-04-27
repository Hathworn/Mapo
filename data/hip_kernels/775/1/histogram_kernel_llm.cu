#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_kernel(int* PartialHist, int* DeviceData, int DataCount, int* timer)
{
    int tid = threadIdx.x;
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    clock_t start_atomic = 0;
    clock_t stop_atomic = 0;

    extern __shared__ int hist[];

    // Initialize shared memory histogram to zero
    for (int i = tid; i < H * blockDim.x; i += blockDim.x) {
        hist[i] = 0;
    }

    __syncthreads();

    // Populate shared memory histogram
    for (int j = gid; j < DataCount; j += stride) {
        atomicAdd(&hist[tid * H + DeviceData[j]], 1);
    }

    __syncthreads();

    // Aggregate results into global memory
    for (int i = tid; i < H; i += blockDim.x) {
        int sum = 0;
        for (int t_hist = 0; t_hist < blockDim.x; t_hist++) {
            sum += hist[t_hist * H + i];
        }
        atomicAdd(&PartialHist[i], sum);
    }

    if (tid == 0) {
        start_atomic = clock();
    }

    __syncthreads();

    if (tid == 0) {
        stop_atomic = clock();
        timer[blockIdx.x] = stop_atomic - start_atomic;
    }
}