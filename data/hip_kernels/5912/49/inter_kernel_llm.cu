#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified global index calculation
    int gridSize = gridDim.x * blockDim.x; // Calculate total thread grid size for striding

    while (i < (NX + NY) * B) { // Use loop to cover entire range
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Conditional selection and assignment
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];

        i += gridSize; // Increment by grid size for strided access
    }
}