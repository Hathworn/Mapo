#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VectorAdd(float *VecA, float *VecB, float *VecC, int size)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for better performance
    extern __shared__ float sharedVecA[];
    extern __shared__ float sharedVecB[];

    // Check if within bounds before accessing
    if (i < size) {
        sharedVecA[threadIdx.x] = VecA[i];
        sharedVecB[threadIdx.x] = VecB[i];
        __syncthreads(); // Ensure all threads have finished writing to shared memory

        // Compute vector addition using shared memory
        VecC[i] = sharedVecA[threadIdx.x] + sharedVecB[threadIdx.x];
    }
}