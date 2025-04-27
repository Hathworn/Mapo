#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignInitialClusters(int width, int height, int nPixels, int clusterCount, int* cluster, int filterCount, float* responses, int* intResponses) {
    // Use shared memory for frequently accessed data if possible (such as small variables)
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;

    if ((x < width) && (y < height)) {
        int pixel = y * width + x;
        int xBlock = __fdividef(x, ((width - 1) / 8 + 1)); // Use faster division
        int yBlock = __fdividef(y, ((height - 1) / 8 + 1)); // Use faster division
        int assignedCluster = yBlock * 8 + xBlock;

        cluster[pixel] = assignedCluster; // Use computed index variable directly

        // Utilize loop unrolling if filterCount is known and small
        for(int i = 0; i < filterCount; i++) {
            int index = pixel + i * nPixels;
            int response = __float2int_rn(INTCONFACTOR * responses[index]); // Use intrinsic for conversion
            intResponses[index] = response;
        }
    }
}