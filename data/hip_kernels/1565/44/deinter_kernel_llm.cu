#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if(i >= (NX+NY)*B) return;

    // Improved division and modulo calculations using shared variables
    int section_size = NX + NY;
    int b = i / section_size;
    int j = i % section_size;

    // Simplified conditions using early returns to reduce nesting
    if (j < NX) {
        // Check and update X
        if(X) {
            X[b*NX + j] += OUT[i];
        }
    } else {
        // Check and update Y
        if(Y) {
            Y[b*NY + (j - NX)] += OUT[i];
        }
    }
}