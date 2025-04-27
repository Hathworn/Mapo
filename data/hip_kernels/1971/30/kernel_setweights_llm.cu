#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_setweights(int N, double *wt, double alpha) {
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride loop to allow more efficient utilization of threads
    for (unsigned int i = tid; i < N; i += gridDim.x * blockDim.x) {
        wt[i] = alpha;
    }
}