#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned char value(float n1, float n2, int hue) {
    if (hue > 360) hue -= 360;
    else if (hue < 0) hue += 360;

    if (hue < 60)
        return (unsigned char) (255 * (n1 + (n2 - n1) * hue / 60));
    if (hue < 180)
        return (unsigned char) (255 * n2);
    if (hue < 240)
        return (unsigned char) (255 * (n1 + (n2 - n1) * (240 - hue) / 60));
    return (unsigned char) (255 * n1);
}

__global__ void randomize(float* array, hiprandState* rand, unsigned long N) {
    // Compute tid using 2D grid and block dimensions
    unsigned long tid = threadIdx.x + blockIdx.x * blockDim.x + 
                        (threadIdx.y + blockIdx.y * blockDim.y) * blockDim.x * gridDim.x;

    if (tid < N) {
        // Use local hiprandState for random number generation
        hiprandState localState = rand[tid];
        float theRand = hiprand_uniform(&localState);
        
        // Save the modified state back for future usage
        rand[tid] = localState;

        // Assign the generated random number to the array
        array[tid] = theRand;
    }
}