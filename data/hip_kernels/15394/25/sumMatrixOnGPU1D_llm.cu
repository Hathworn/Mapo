#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use shared memory to optimize memory accesses
    extern __shared__ float sharedMem[];
    float* sharedMatA = sharedMem;
    float* sharedMatB = sharedMem + blockDim.x * ny;

    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;

    if (ix < nx) {
        for (int iy = 0; iy < ny; iy++) {
            int idx = iy * nx + ix;
            
            // Load data to shared memory
            sharedMatA[threadIdx.x * ny + iy] = MatA[idx];
            sharedMatB[threadIdx.x * ny + iy] = MatB[idx];

            // Synchronize to make sure all data is loaded
            __syncthreads();

            // Perform computation using shared memory
            MatC[idx] = sharedMatA[threadIdx.x * ny + iy] + sharedMatB[threadIdx.x * ny + iy];

            // Synchronize again before the next iteration
            __syncthreads();
        }
    }
}