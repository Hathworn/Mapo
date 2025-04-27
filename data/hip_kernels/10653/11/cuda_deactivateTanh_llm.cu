#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_deactivateTanh(double* pE, const double* pA, int n)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure id is within bounds
    if (id < n) {
        // Use shared memory for faster access
        __shared__ double shared_pA[1024];
        
        shared_pA[threadIdx.x] = pA[id];
        __syncthreads();
        
        // Perform operation using shared memory
        pE[id] *= (1.0 - (shared_pA[threadIdx.x] * shared_pA[threadIdx.x]));
    }
}