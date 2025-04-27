#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gMaxPoolingBackward(float* adj, int adjRows, int adjCols, float* in, float* adjIn, int inRows, int inCols, float* mask, int numKernels, int maskCols, int width, int lastWidth) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    if(tid >= adjRows * adjCols)
        return;

    int rowId = tid / adjRows;
    int colId = tid % adjRows;

    // Use shared memory to load input data for current rowId
    extern __shared__ float sharedIn[];
    float* b = in + (rowId * inCols) + (colId * width);
    for(int i = 0; i < width; i++) {
        sharedIn[i] = b[i];
    }
    __syncthreads();

    if(colId == adjRows - 1) {
        width = lastWidth;
    }

    float* localMask = mask + (rowId / numKernels) * maskCols + colId * width;
    size_t currentMaxIdx = 0;
    // Optimize to reduce thread divergence in loop
    float maxVal = sharedIn[0] * localMask[0];
    for(int i = 1; i < width; ++i) {
        float value = sharedIn[i] * localMask[i];
        if(value > maxVal) {
            maxVal = value;
            currentMaxIdx = i;
        }
    }

    // Use atomic operation to prevent race condition
    atomicAdd(&adjIn[(rowId * inCols) + (colId * width) + currentMaxIdx], adj[rowId + (colId * adjCols)]);
}