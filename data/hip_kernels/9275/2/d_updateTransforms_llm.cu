#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void d_updateTransforms(float* d_currentTransform, float3* d_cameraPosition)
{
    // Efficiently update camera position using shared memory
    __shared__ float transform[12];
    if (threadIdx.x < 12) 
    {
        transform[threadIdx.x] = d_currentTransform[threadIdx.x];
    }
    __syncthreads(); // Synchronize threads to ensure shared memory is populated

    if (threadIdx.x == 0) 
    {
        d_cameraPosition->x = transform[3];
        d_cameraPosition->y = transform[7];
        d_cameraPosition->z = transform[11];
    }
}