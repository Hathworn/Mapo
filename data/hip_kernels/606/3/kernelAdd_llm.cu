#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelAdd(float *dvalues, int numOperations, int firstInd, int nextColInd)
{
    int vi = firstInd + blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory accesses
    __shared__ float sdata[256];  // Assuming a maximum of 256 threads per block
    if (vi < nextColInd) {
        sdata[threadIdx.x] = dvalues[vi];
        __syncthreads();  // Ensure all threads have loaded their data

        // Loop unrolling to reduce iteration overhead
        for (int j = 0; j < numOperations; j += 4) {
            sdata[threadIdx.x] *= sdata[threadIdx.x] + sdata[threadIdx.x] * sdata[threadIdx.x];
            sdata[threadIdx.x] *= sdata[threadIdx.x] + sdata[threadIdx.x] * sdata[threadIdx.x];
            sdata[threadIdx.x] *= sdata[threadIdx.x] + sdata[threadIdx.x] * sdata[threadIdx.x];
            sdata[threadIdx.x] *= sdata[threadIdx.x] + sdata[threadIdx.x] * sdata[threadIdx.x];
        }

        // Store results back to global memory
        dvalues[vi] = sdata[threadIdx.x];
    }
}