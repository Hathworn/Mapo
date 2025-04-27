#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightx_weighty2_norm0_Kernel(float* weightx, float* weighty, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    // Utilize shared memory to reduce global memory access time
    extern __shared__ float sharedData[];
    float* sharedAbsIx = sharedData;
    float* sharedAbsIy = sharedData + blockDim.x;

    int tx = threadIdx.x;
    int x = blockIdx.x * blockDim.x + tx;
    
    if (x < nPixels) {
        // Load data into shared memory
        sharedAbsIx[tx] = absIx[x];
        sharedAbsIy[tx] = absIy[x];
        __syncthreads();  // Ensure all threads have loaded data

        // Perform computations using shared memory
        float absIx_val = sharedAbsIx[tx];
        float absIy_val = sharedAbsIy[tx];
        
        weightx[x] = 1.0f / (absIx_val * absIx_val + eps);
        weighty[x] = 1.0f / (absIy_val * absIy_val + eps);
    }
}