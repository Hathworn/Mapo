#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_weighted_kernel(unsigned int batchSize, unsigned int nbOutputs, unsigned int outputsHeight, unsigned int outputsWidth, float* estimated_labels, unsigned int nbChannels, unsigned int image_height, unsigned int image_width, float* input_image, unsigned char* workspace, float alpha)
{
    const int batchEstimatedOffset = nbOutputs * outputsHeight * outputsWidth * blockIdx.z;
    const int batchImageOffset = nbChannels * image_height * image_width * blockIdx.z;

    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = index; i < outputsWidth * outputsHeight; i += stride) {
        unsigned int outputMax = 0;
        float maxVal = estimated_labels[i + batchEstimatedOffset];

        // Loop unrolling and branch reduction for better warp efficiency
        for (unsigned int cls = 1; cls < nbOutputs; cls += 4) {
            float tmp1 = (cls < nbOutputs) ? estimated_labels[i + cls * outputsWidth * outputsHeight + batchEstimatedOffset] : -INFINITY;
            float tmp2 = (cls + 1 < nbOutputs) ? estimated_labels[i + (cls + 1) * outputsWidth * outputsHeight + batchEstimatedOffset] : -INFINITY;
            float tmp3 = (cls + 2 < nbOutputs) ? estimated_labels[i + (cls + 2) * outputsWidth * outputsHeight + batchEstimatedOffset] : -INFINITY;
            float tmp4 = (cls + 3 < nbOutputs) ? estimated_labels[i + (cls + 3) * outputsWidth * outputsHeight + batchEstimatedOffset] : -INFINITY;

            if (tmp1 > maxVal) { outputMax = cls; maxVal = tmp1; }
            if (tmp2 > maxVal) { outputMax = cls + 1; maxVal = tmp2; }
            if (tmp3 > maxVal) { outputMax = cls + 2; maxVal = tmp3; }
            if (tmp4 > maxVal) { outputMax = cls + 3; maxVal = tmp4; }
        }

        // Prefetching color and input_image values to reduce repeated memory accesses
        float color0 = colors[outputMax % 4][0] * alpha;
        float color1 = colors[outputMax % 4][1] * alpha;
        float color2 = colors[outputMax % 4][2] * alpha;

        unsigned int imgIdxBase = i + batchImageOffset;
        unsigned int imgOffset = image_height * image_width;
        float imgVal0 = input_image[imgIdxBase];
        float imgVal1 = input_image[imgIdxBase + imgOffset];
        float imgVal2 = input_image[imgIdxBase + 2 * imgOffset];

        unsigned char ch0 = (unsigned char)max(color0, min(255.0, color0 + imgVal0));
        unsigned char ch1 = (unsigned char)max(color1, min(255.0, color1 + imgVal1));
        unsigned char ch2 = (unsigned char)max(color2, min(255.0, color2 + imgVal2));

        unsigned int workIdxBase = i * 3 + batchImageOffset;
        workspace[workIdxBase] = ch0;
        workspace[workIdxBase + 1] = ch1;
        workspace[workIdxBase + 2] = ch2;
    }
}