#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Compute global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within valid bounds
    int totalElements = (NX + NY) * B;
    if(i >= totalElements) return;

    // Calculate block and element indices
    int b = i / (NX + NY);
    int j = i % (NX + NY);

    // Update corresponding array based on index
    if (j < NX) {
        if (X) {
            // Atomic addition to prevent race conditions
            atomicAdd(&X[b * NX + j], OUT[i]);
        }
    } else {
        if (Y) {
            // Atomic addition to prevent race conditions
            atomicAdd(&Y[b * NY + j - NX], OUT[i]);
        }
    }
}