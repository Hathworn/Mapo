#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_updateFullMatrix( float * device_fullMatrix, float * B, float * V, float * Cm, float * Em, float * Rm, float dt, unsigned int nComp ) {
    // Calculate global thread index
    unsigned int myIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to update when index is within bounds
    while (myIndex < nComp) {
        B[myIndex] = V[myIndex] * Cm[myIndex] / (dt / 2.0f) + Em[myIndex] / Rm[myIndex];
        myIndex += blockDim.x * gridDim.x; // Move to next element for this thread
    }
}