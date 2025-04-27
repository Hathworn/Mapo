#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightx_weighty1_norm2_Kernel(float* weightx, float* weighty, const float* psi, const float* phi, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    // Use shared memory for commonly accessed data to reduce global memory access latency
    extern __shared__ float shared_psi[];
    int tx = threadIdx.x;
    int x = blockIdx.x * blockDim.x + tx;

    if (x < nPixels)
    {
        // Load inputs to shared memory
        shared_psi[tx] = psi[x];
        __syncthreads();

        // Use shared memory for faster access
        weightx[x] = shared_psi[tx];
        weighty[x] = phi[x];  // Assumes phi doesn't benefit from shared memory based on access patterns
    }
}