#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void glcm_calculation_nol(int *A, int *glcm, const int nx, const int ny, int maxx)
{
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    // Ensure the next element exists in A to prevent out of bounds access
    if (ix < nx - 1 && iy < ny) 
    {
        int a_idx = A[idx];
        int a_idx1 = A[idx + 1];

        // Use shared memory to reduce repeated cleanup on global memory
        __shared__ int local_glcm[1024]; // This should fit maxx + 1 elements
        int threadIndex = threadIdx.y * blockDim.x + threadIdx.x;

        if (threadIndex <= maxx * maxx) 
        {
            local_glcm[threadIndex] = 0;
        }
        __syncthreads();

        if (a_idx <= maxx && a_idx1 <= maxx) 
        {
            int p = a_idx * (maxx + 1) + a_idx1;
            atomicAdd(&local_glcm[p], 1);
        }
        __syncthreads();

        if (threadIndex <= maxx * maxx) 
        {
            atomicAdd(&glcm[threadIndex], local_glcm[threadIndex]);
        }
    }
}