#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate linear thread index
    int stride = blockDim.x * gridDim.x; // Calculate the stride for iterations
    int total_elements = (NX + NY) * B; // Total number of elements

    for (int i = idx; i < total_elements; i += stride) { // Loop over elements with stride
        int b = i / (NX + NY); // Batch index
        int j = i % (NX + NY); // Element index within a batch
        if (j < NX) {
            if (X) X[b * NX + j] += OUT[i]; // Process X array
        } else {
            if (Y) Y[b * NY + j - NX] += OUT[i]; // Process Y array
        }
    }
}