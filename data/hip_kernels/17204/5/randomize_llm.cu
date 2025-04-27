#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned char value(float n1, float n2, int hue) {
    if (hue > 360) hue -= 360;
    else if (hue < 0) hue += 360;

    if (hue < 60)
        return (unsigned char)(255 * (n1 + (n2 - n1) * hue / 60));
    if (hue < 180)
        return (unsigned char)(255 * n2);
    if (hue < 240)
        return (unsigned char)(255 * (n1 + (n2 - n1) * (240 - hue) / 60));
    return (unsigned char)(255 * n1);
}

__global__ void randomize(float* array, hiprandState* rand, unsigned long N) {
    // Calculate global thread ID using combined dimensions for reduced divergence
    unsigned long tid = blockIdx.x * blockDim.x * blockDim.y
                        + threadIdx.y * blockDim.x + threadIdx.x;

    if (tid < N) {
        hiprandState localState = rand[tid]; // Get local hiprandState as seed
        float theRand = hiprand_uniform(&localState); // Get a random value
        rand[tid] = localState; // Save the updated state

        array[tid] = theRand; // Assign the random value to the array
    }
}