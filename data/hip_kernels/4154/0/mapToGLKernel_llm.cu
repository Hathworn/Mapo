#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void mapToGLKernel(uint8_t *dSrc, uint8_t *dDst, int nWidth, int nHeight) {
    // Calculate global thread indices
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check if the thread is within image bounds
    if (tid < nWidth && tidd < nHeight) {
        // Calculate the offset for the source and destination
        int index = (tidd * nWidth + tid) * 3;

        // Copy pixel data
        dDst[index + 0] = dSrc[index + 0];
        dDst[index + 1] = dSrc[index + 1];
        dDst[index + 2] = dSrc[index + 2];
    }
}