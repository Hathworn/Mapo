#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void EstimateParForSubsample(float* subImageDefs, bool safeBounds, int inputWidth, int inputHeight, int2 & subImg, int & diameterPix) 
{
    diameterPix = (int)(fminf((float)inputWidth, (float)inputHeight) * subImageDefs[2]); // <0,1>
    subImg.x = (int)((float)inputWidth * (subImageDefs[0] + 1) * 0.5f);
    subImg.y = (int)((float)inputHeight * (subImageDefs[1] + 1) * 0.5f);

    int maxDiameter = min(inputWidth - 1, inputHeight - 1);
    diameterPix = max(1, diameterPix);
    diameterPix = min(maxDiameter, diameterPix);

    if (safeBounds) 
    {
        subImg.x = max(subImg.x, 1);
        subImg.y = max(subImg.y, 1);
        subImg.x = min(subImg.x, inputWidth - diameterPix - 1);
        subImg.y = min(subImg.y, inputHeight - diameterPix - 1);
    }
}

__global__ void RetinaTransform_HaveAtLeastOneValueThere(float * subImageDefs, float* input, int inputWidth, int inputHeight, float* output, int outputDataSize, float* retinaMask, int retinaDataSize, int retinaMaskColHint, float* retinaDataInserted) 
{
    int id_retinaPoint = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;

    int2 subImg;
    int diameterPix;
    bool safeBounds = 0;

    EstimateParForSubsample(subImageDefs, safeBounds, inputWidth, inputHeight, subImg, diameterPix);

    if (id_retinaPoint < outputDataSize) 
    {
        output[id_retinaPoint] = 0; // default value
        float x_mask = (retinaMask[id_retinaPoint * retinaMaskColHint] * diameterPix);
        float y_mask = (retinaMask[id_retinaPoint * retinaMaskColHint + 1] * diameterPix);

        int x = subImg.x + roundf(x_mask); // Use roundf for better precision
        int y = subImg.y + roundf(y_mask); // Use roundf for better precision
        if (x < inputWidth && y < inputHeight && x >= 0 && y >= 0) 
        {
            float val = input[x + y * inputWidth];
            atomicAdd(output + id_retinaPoint, val); // Directly use atomicAdd
            atomicAdd(retinaDataInserted + id_retinaPoint, 1); // Avoid overwriting with direct assignment
        }
    }
}