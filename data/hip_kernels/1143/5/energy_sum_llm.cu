#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + threadIdx.z * (blockDim.x * blockDim.y)
                 + threadIdx.y * blockDim.x
                 + threadIdx.x;
    return threadId;
}

__global__ void energy_sum(double2 *in1, double2 *in2, double *out) {
    // Use shared memory for better memory access patterns
    __shared__ double2 shared_in1[blockDim.x * blockDim.y * blockDim.z];
    __shared__ double2 shared_in2[blockDim.x * blockDim.y * blockDim.z];

    int local_tid = threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;
    int global_tid = getGid3d3d();

    // Load data into shared memory
    shared_in1[local_tid] = in1[global_tid];
    shared_in2[local_tid] = in2[global_tid];
    __syncthreads();

    // Perform computation using shared memory to reduce global memory accesses
    out[global_tid] = shared_in1[local_tid].x + shared_in2[local_tid].x;
}