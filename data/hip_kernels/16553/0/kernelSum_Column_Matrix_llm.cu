#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
const int DIMBLOCKX=32;

//DEVICE

//HOST
__global__ void kernelSum_Column_Matrix(float* matrix, float* array, int tam){
    __shared__ float shareMatrix[DIMBLOCKX];

    float value = 0;
    int col = blockIdx.x;
    int step = tam / blockDim.x;
    int posIni = col * tam + threadIdx.x * step;

    // Optimize loop by unrolling
    for(int i = 0; i < step; i += 4){
        value += matrix[posIni + i];
        if(i + 1 < step) value += matrix[posIni + i + 1];
        if(i + 2 < step) value += matrix[posIni + i + 2];
        if(i + 3 < step) value += matrix[posIni + i + 3];
    }

    shareMatrix[threadIdx.x] = value;
    __syncthreads();

    // Use warp reduction for summing values in shared memory
    if(threadIdx.x < 16) {
        shareMatrix[threadIdx.x] += shareMatrix[threadIdx.x + 16];
    }
    __syncthreads();
    if(threadIdx.x < 8) {
        shareMatrix[threadIdx.x] += shareMatrix[threadIdx.x + 8];
    }
    __syncthreads();
    if(threadIdx.x < 4) {
        shareMatrix[threadIdx.x] += shareMatrix[threadIdx.x + 4];
    }
    __syncthreads();
    if(threadIdx.x < 2) {
        shareMatrix[threadIdx.x] += shareMatrix[threadIdx.x + 2];
    }
    __syncthreads();
    if(threadIdx.x == 0) {
        array[blockIdx.x] = shareMatrix[0] + shareMatrix[1];
    }
}