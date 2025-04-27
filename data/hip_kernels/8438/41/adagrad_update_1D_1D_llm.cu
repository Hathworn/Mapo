#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use shared memory to minimize global memory accesses
    __shared__ float shared_d[256];
    __shared__ float shared_m[256];
    
    for (; tid < size; tid += stride) {
        // Load data into shared memory
        shared_d[threadIdx.x] = d[tid];
        shared_m[threadIdx.x] = m[tid];

        __syncthreads();

        // Clip gradient
        if (shared_d[threadIdx.x] > clip) 
            shared_d[threadIdx.x] = clip;
        if (shared_d[threadIdx.x] < -clip) 
            shared_d[threadIdx.x] = -clip;

        // Update m and x using shared memory values
        shared_m[threadIdx.x] += shared_d[threadIdx.x] * shared_d[threadIdx.x];
        x[tid] -= lr * shared_d[threadIdx.x] / sqrt(shared_m[threadIdx.x] + 0.00000001);

        // Reset gradient
        shared_d[threadIdx.x] = 0;

        __syncthreads();

        // Write shared memory data back to global memory
        m[tid] = shared_m[threadIdx.x];
        d[tid] = shared_d[threadIdx.x];
    }
}