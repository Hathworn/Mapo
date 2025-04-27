#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int roundToInt(float val)
{
    return (int)floor(val + 0.5f);
}
__device__ float d_priorF;  

__global__ void add(float *p, float *q) { *p += *q; }

__global__ void composeSingleSystem(const size_t offset, const float *H, const size_t lowresWidth, const size_t lowresHeight, 
                                    const size_t highresWidth, const size_t highresHeight, const float psfWidth, 
                                    const int pixelRadius, float *systemMatrixVals, int *systemMatrixCols, int *systemMatrixRows)
{
    const size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    const size_t lowresPixels  = lowresWidth  * lowresHeight;

    if (idx >= lowresPixels) return;

    size_t x = idx % lowresWidth;
    size_t y = idx / lowresWidth;
    size_t r = idx + offset;

    // Precompute constants outside loops to avoid repeated calculations
    float zoom = float(highresWidth) / float(lowresWidth);
    float zoomSquared = zoom * zoom;
    float invPSFWidthSquared = 1.0f / (2.0f * zoomSquared * psfWidth * psfWidth);

    float hrx = (H[0] * x + H[1] * y + H[2]) * zoom;
    float hry = (H[3] * x + H[4] * y + H[5]) * zoom;

    float weightSum = 0.0f;
    const size_t maxRowElems = (2 * pixelRadius + 1) * (2 * pixelRadius + 1);
    size_t offsetCRS = 0;
    size_t offsetRows = maxRowElems * r;

    for (int offsetY = -pixelRadius; offsetY <= pixelRadius; ++offsetY)
    {
        int ny = roundToInt(hry + offsetY);
        if (ny < 0 || ny >= highresHeight) continue;

        for (int offsetX = -pixelRadius; offsetX <= pixelRadius; ++offsetX)
        {
            int nx = roundToInt(hrx + offsetX);
            if (nx < 0 || nx >= highresWidth) continue;

            float dx = hrx - nx;
            float dy = hry - ny;

            // Combine repeated terms
            float dist = (dx * dx * H[0] * H[0] + dy * dy * H[4] * H[4] + dx * dy * (H[0] * H[3] + H[1] * H[4]));
            float weight = expf(-dist * invPSFWidthSquared);

            size_t valIdx = offsetRows + offsetCRS;
            systemMatrixVals[valIdx] = weight;
            systemMatrixCols[valIdx] = ny * highresWidth + nx;

            weightSum += weight;
            ++offsetCRS;
        }
    }

    if (weightSum > 0.0f)
    {
        float invWeightSum = 1.0f / weightSum;
        #pragma unroll // Unroll loop to improve performance
        for (size_t i = 0; i < offsetCRS; ++i)
        {
            systemMatrixVals[offsetRows + i] *= invWeightSum;
        }
    }

    if (offsetCRS == 0)
    {
        systemMatrixVals[offsetRows] = 0.0f;
        systemMatrixCols[offsetRows] = 0;
        ++offsetCRS;
    }

    bool copy = false;
    while (offsetCRS < maxRowElems)
    {
        const size_t idx = offsetRows + offsetCRS;
        if (systemMatrixCols[idx - 1] + 1 >= highresWidth * highresHeight)
        {
            copy = true;
            break;
        }
        systemMatrixVals[idx] = 0.0f;
        systemMatrixCols[idx] = systemMatrixCols[idx - 1] + 1;
        offsetCRS++;
    }

    if (copy)
    {
        for (int idx = offsetCRS - 1; idx >= 0; --idx)
        {
            systemMatrixVals[offsetRows + maxRowElems - (offsetCRS - idx)] =
                systemMatrixVals[offsetRows + idx];
            systemMatrixCols[offsetRows + maxRowElems - (offsetCRS - idx)] =
                systemMatrixCols[offsetRows + idx];
        }

        for (int idx = maxRowElems - offsetCRS - 1; idx >= 0; --idx)
        {
            systemMatrixVals[offsetRows + idx] = 0.0f;
            systemMatrixCols[offsetRows + idx] =
                systemMatrixCols[offsetRows + idx + 1] - 1;
        }
    }

    systemMatrixRows[r] = r * maxRowElems;
}