#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_optimization(float* in, int inStr0, int inStr1, int inStr2, int inStr3, float* out, int outStr0, int outStr1, int outStr2, int dim, int nElementOut, int dimSize) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Use float registers to reduce global memory access
    __shared__ float buffer[1024]; // Adjust size as necessary based on kernel launch parameters
    while (tid < nElementOut) { // Simplified loop iteration
        int outOff0 = tid / outStr0;
        int outOff1temp = tid - outOff0 * outStr0;
        int outOff1 = outOff1temp / outStr1;
        int outOff2 = outOff1temp - outOff1 * outStr1;
        buffer[threadIdx.x] = 0.0f; // Initialize shared memory
        for (int j = 0; j < dimSize; j++) {
            int inOff;
            if (dim == 0) inOff = j * inStr0 + outOff0 * inStr1 + outOff1 * inStr2 + outOff2 * inStr3;
            else if (dim == 1) inOff = outOff0 * inStr0 + j * inStr1 + outOff1 * inStr2 + outOff2 * inStr3;
            else if (dim == 2) inOff = outOff0 * inStr0 + outOff1 * inStr1 + j * inStr2 + outOff2 * inStr3;
            else if (dim == 3) inOff = outOff0 * inStr0 + outOff1 * inStr1 + outOff2 * inStr2 + j * inStr3;
            buffer[threadIdx.x] += in[inOff]; // Accumulate to shared memory
        }
        out[tid] = buffer[threadIdx.x]; // Write back to global memory
        tid += stride; // Move to next position
    }
}