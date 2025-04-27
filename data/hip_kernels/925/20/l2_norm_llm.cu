#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) +
                   (threadIdx.y * blockDim.x) +
                   (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void l2_norm(double *in1, double *in2, double *in3, double *out) {
    // Use shared memory to store inputs
    extern __shared__ double sharedMem[];

    int local_tid = threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * (blockDim.x * blockDim.y);
    int global_tid = getGid3d3d();

    // Load inputs into shared memory for better memory access pattern
    sharedMem[local_tid] = in1[global_tid];
    sharedMem[local_tid + blockDim.x * blockDim.y * blockDim.z] = in2[global_tid];
    sharedMem[local_tid + 2 * blockDim.x * blockDim.y * blockDim.z] = in3[global_tid];
    __syncthreads();

    // Compute l2 norm using shared memory
    double val1 = sharedMem[local_tid];
    double val2 = sharedMem[local_tid + blockDim.x * blockDim.y * blockDim.z];
    double val3 = sharedMem[local_tid + 2 * blockDim.x * blockDim.y * blockDim.z];
    out[global_tid] = sqrt(val1 * val1 + val2 * val2 + val3 * val3);
}