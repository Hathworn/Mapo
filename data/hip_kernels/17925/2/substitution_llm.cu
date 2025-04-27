#include "hip/hip_runtime.h"
#include "includes.h"

// Helper function for using CUDA to call kernel functions
hipError_t cuda_code(float* , float*, int , int );
__device__ float sum = 0;

__global__ void substitution(int i, int N, float *row, float *matrix, float* resultVector) {
    int j = i + blockIdx.x * blockDim.x + threadIdx.x;

    if (j > i && j < N) {
        int ij = j + (N + 1) * i;
        float temp = matrix[ij] * resultVector[j];

        atomicAdd(&sum, temp);
        row[j] = temp;
    }
    // __syncthreads() not needed here, since 'sum' is a single global variable and atomicAdd is used.
}