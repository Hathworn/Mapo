#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_dilateFPPlaneDepthMapXpYp_kernel(float* fpPlaneDepthMap, int fpPlaneDepthMap_p, float* maskMap, int maskMap_p, int width, int height, int xp, int yp, float fpPlaneDepth)
{
    // Use shared memory to reduce global memory accesses
    __shared__ float sharedMask[1024]; // Adjust size as needed

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int threadId = threadIdx.y * blockDim.x + threadIdx.x;

    // Check bounds and load data into shared memory
    if (x < width && y < height) {
        sharedMask[threadId] = maskMap[y * maskMap_p + x];
        __syncthreads(); // Ensure all loads are done before proceeding

        if ((x + xp >= 0) && (y + yp >= 0) && (x + xp < width) && (y + yp < height)) {
            // Use value from shared memory
            if (sharedMask[threadId] > 0.0f) {
                fpPlaneDepthMap[(y + yp) * fpPlaneDepthMap_p + (x + xp)] = fpPlaneDepth;
            }
        }
    }
}