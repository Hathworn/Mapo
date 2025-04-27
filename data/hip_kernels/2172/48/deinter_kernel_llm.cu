#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize the calculation of global thread ID
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid-stride loop
    while(i < (NX + NY) * B) { // Use grid-stride loop for better occupancy
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        if (j < NX) {
            if(X) atomicAdd(&X[b * NX + j], OUT[i]); // Use atomicAdd for safer concurrent writes
        } else {
            if(Y) atomicAdd(&Y[b * NY + j - NX], OUT[i]); // Use atomicAdd
        }
        i += stride;
    }
}