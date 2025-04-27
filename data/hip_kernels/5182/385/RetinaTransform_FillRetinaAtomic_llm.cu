#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void EstimateParForSubsample(float* subImageDefs, bool safeBounds, int inputWidth, int inputHeight, int2 & subImg, int & diameterPix) {
    diameterPix = (int)(fminf((float)inputWidth, (float)inputHeight) * subImageDefs[2]);

    subImg.x = (int)((float)inputWidth * (subImageDefs[0] + 1) * 0.5f);
    subImg.y = (int)((float)inputHeight * (subImageDefs[1] + 1) * 0.5f);

    int maxDiameter = min(inputWidth - 1, inputHeight - 1);

    diameterPix = max(1, diameterPix);
    diameterPix = min(maxDiameter, diameterPix);

    if (safeBounds) {
        subImg.x = max(subImg.x, 1);
        subImg.y = max(subImg.y, 1);
        subImg.x = min(subImg.x, inputWidth - diameterPix - 1);
        subImg.y = min(subImg.y, inputHeight - diameterPix - 1);
    }
}

__global__ void RetinaTransform_FillRetinaAtomic(float *subImageDefs, float *input, int inputWidth, int inputHeight, float *output, int outputDataSize, float *retinaMask, int retinaDataSize, int retinaMaskColHint, float *retinaDataInserted) {
    int id_pxl = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;

    int2 subImg;
    int diameterPix;
    bool safeBounds = false;

    int x = id_pxl % inputWidth;
    int y = id_pxl / inputWidth;

    // Calculate parameters for subsample
    EstimateParForSubsample(subImageDefs, safeBounds, inputWidth, inputHeight, subImg, diameterPix);

    if (id_pxl < inputWidth * inputHeight) {
        float minDist = FLT_MAX;  // Use predefined constant for maximum float value
        int minIdx = -1;          // Initialize to -1 for safety

        for (int id_retinaPoint = 0; id_retinaPoint < retinaDataSize; id_retinaPoint++) {
            // Calculate mask coordinates based on diameter and offsets
            float x_mask = (retinaMask[id_retinaPoint * retinaMaskColHint] * diameterPix) + subImg.x;
            float y_mask = (retinaMask[id_retinaPoint * retinaMaskColHint + 1] * diameterPix) + subImg.y;

            float dist = (x - x_mask) * (x - x_mask) + (y - y_mask) * (y - y_mask);

            // Update minimum distance and index if current distance is smaller
            if (dist < minDist) {
                minDist = dist;
                minIdx = id_retinaPoint;
            }
        }

        // Perform atomic operations on the identified minimum index
        atomicAdd(output + minIdx, input[id_pxl]);
        atomicAdd(retinaDataInserted + minIdx, 1);
    }
}