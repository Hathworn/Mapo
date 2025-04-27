#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IntDataPointIdentity(int *size, const int *inputX, const int *inputY, int *outputX, int *outputY, int *length) {
    // Calculate global index
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    
    // Check within bounds
    if (ix < *size) {
        // Use shared memory for input copy to optimize memory access
        extern __shared__ int sharedMemory[];
        const int *inArrayBody = &inputX[ix * *length];
        int *outArrayBody = &outputX[ix * *length];

        // Improved copy with shared memory usage
        for (long i = 0; i < *length; i++) {
            sharedMemory[i] = inArrayBody[i];
        }
        __syncthreads();
        for (long i = 0; i < *length; i++) {
            outArrayBody[i] = sharedMemory[i];
        }

        // Direct copy of scalar value
        outputY[ix] = inputY[ix];
    }
}