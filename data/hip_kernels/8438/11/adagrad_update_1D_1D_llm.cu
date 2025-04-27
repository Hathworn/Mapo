#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Load elements into shared memory for better performance
    __shared__ float shared_x[256]; // Assuming max blockDim.x = 256
    __shared__ float shared_d[256];
    __shared__ float shared_m[256];

    while (tid < size) {
        // Load data from global memory
        shared_x[threadIdx.x] = x[tid];
        shared_d[threadIdx.x] = d[tid];
        shared_m[threadIdx.x] = m[tid];

        __syncthreads(); // Ensure all loads are complete

        // Clip gradient
        if (shared_d[threadIdx.x] > clip) shared_d[threadIdx.x] = clip;
        if (shared_d[threadIdx.x] < -clip) shared_d[threadIdx.x] = -clip;

        // Update momentum and variable
        shared_m[threadIdx.x] += shared_d[threadIdx.x] * shared_d[threadIdx.x];
        shared_x[threadIdx.x] -= lr * shared_d[threadIdx.x] / sqrt(shared_m[threadIdx.x] + 0.00000001);

        // Reset gradient
        shared_d[threadIdx.x] = 0.0f;

        __syncthreads(); // Ensure all updates are complete

        // Write data back to global memory
        x[tid] = shared_x[threadIdx.x];
        m[tid] = shared_m[threadIdx.x];
        d[tid] = shared_d[threadIdx.x];

        tid += stride;
    }
}