#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_Pad_Dict(float *PadD, float *D, int nRows_D, int nCols_D, int nFilts, int nRows, int nCols) {
    // Calculate global thread index
    unsigned int Tidx_D = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int Tidy_D = threadIdx.y + blockIdx.y * blockDim.y;

    int Dim_D = nRows_D * nFilts;

    // Use shared memory to efficiently handle memory accesses
    __shared__ float tile[32][32]; // assuming blockDim.x and blockDim.y <= 32
    if (Tidx_D < nCols_D && Tidy_D < nRows_D) {
        for (int i = Tidy_D, j = Tidy_D; i < Dim_D; i += nRows_D, j += nRows) {
            // Load data into shared memory
            tile[threadIdx.y][threadIdx.x] = D[Tidx_D + i * nCols_D];
            __syncthreads(); // Ensure all data is loaded before accessing

            // Read from shared memory into global memory
            PadD[Tidx_D + j * nCols] = tile[threadIdx.y][threadIdx.x];
            __syncthreads(); // Ensure all data is written before next iteration
        }
    }
}