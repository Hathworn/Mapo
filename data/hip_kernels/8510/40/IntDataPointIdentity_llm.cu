#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IntDataPointIdentity(int size, const int *inputX, const int *inputY, int *outputX, int *outputY, int length) {
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    if (ix < size) {
        // Use shared memory for improved memory access performance
        extern __shared__ int sharedMemory[];

        // Pointer for the shared memory block for current thread
        int *sharedArray = &sharedMemory[threadIdx.x * length];

        // Prefetch from global to shared memory
        const int *inArrayBody = &inputX[ix * length];
        for (long i = 0; i < length; i++) {
            sharedArray[i] = inArrayBody[i];
        }

        // Transfer from shared memory to global memory
        int *outArrayBody = &outputX[ix * length];
        for (long i = 0; i < length; i++) {
            outArrayBody[i] = sharedArray[i];
        }

        // Direct copy of int scalar value
        outputY[ix] = inputY[ix];
    }
}