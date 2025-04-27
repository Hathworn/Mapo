#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate global thread index
    int32_t tid = blockIdx.x * blockDim.x + threadIdx.x; 
    // Loop through matrix elements with step size of total threads
    for (int32_t i = tid; i < N; i += gridDim.x * blockDim.x) { 
        *(output + blockIdx.x * N + i) = -col_sum[i];
    }
}