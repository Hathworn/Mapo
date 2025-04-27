#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computePositionParallel(float *agentsX, float *agentsY, float *destX, float *destY, float *destR, int n, int *reached) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = index; i < n; i += stride) {
        // Early exit if no destination
        if (destX[i] == -1 || destY[i] == -1) {
            continue;
        }

        // Precompute differences and check zero length to avoid division by zero
        double diffX = destX[i] - agentsX[i];
        double diffY = destY[i] - agentsY[i];
        double length = sqrtf(diffX * diffX + diffY * diffY);

        // Avoid division by zero
        if (length > 0) {
            double invLength = 1.0 / length;
            agentsX[i] = (float)llrintf(agentsX[i] + diffX * invLength);
            agentsY[i] = (float)llrintf(agentsY[i] + diffY * invLength);
        }

        // Recompute differences and check if inside radius
        diffX = destX[i] - agentsX[i];
        diffY = destY[i] - agentsY[i];
        length = sqrtf(diffX * diffX + diffY * diffY);

        if (length < destR[i]) {
            reached[i] = 1;
        }
    }
}