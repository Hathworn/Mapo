#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    extern __shared__ float shmem[];  // Use dynamic shared memory to reduce shared memory size the kernel uses

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float tempSum = 0.0f;  // Use register to store partial sum for each thread
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            tempSum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = tempSum;  // Store the register result to shared memory
    __syncthreads();

    // Unrolled reduction in shared memory
    if (threadIdx.x < 128) { shmem[threadIdx.x] += shmem[threadIdx.x + 128]; } __syncthreads();
    if (threadIdx.x < 64) { shmem[threadIdx.x] += shmem[threadIdx.x + 64]; } __syncthreads();
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;  // Use volatile pointer to prevent load/store optimizations
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }
    
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];  // Write block's result to target
    }
}