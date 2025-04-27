#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ApplyMat3(float* input, float* output, float* matrix){
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    __shared__ float smatrix[9];  // Allocate shared memory to store matrix
    if(threadIdx.x < 9) {
        smatrix[threadIdx.x] = matrix[threadIdx.x];  // Load matrix into shared memory
    }
    __syncthreads();  // Ensure all threads have loaded the matrix

    for (int i = 0; i < 146; ++i){
        float total = 0.0f;

        int baseIdx = id * 148 + i;
        total += input[baseIdx] * smatrix[0];
        total += input[baseIdx + 1] * smatrix[1];
        total += input[baseIdx + 2] * smatrix[2];

        total += input[baseIdx + 148] * smatrix[3];
        total += input[baseIdx + 148 + 1] * smatrix[4];
        total += input[baseIdx + 148 + 2] * smatrix[5];

        total += input[baseIdx + 296] * smatrix[6];
        total += input[baseIdx + 296 + 1] * smatrix[7];
        total += input[baseIdx + 296 + 2] * smatrix[8];

        total = fmaxf(0.0f, total);  // Use fmaxf for single precision

        output[i + id * 146] = total;
    }
}