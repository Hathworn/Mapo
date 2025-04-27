#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = gridDim.x * blockDim.x; // Total number of threads
    while (i < (NX + NY) * B) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Update value in X if j is within NX
        if (j < NX) {
            if (X) {
                X[b * NX + j] += OUT[i];
            }
        } else { // Update value in Y if j is >= NX
            if (Y) {
                Y[b * NY + j - NX] += OUT[i];
            }
        }
        i += gridSize; // Move to next relevant index
    }
}