#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeRobustnessMask( const float3* __restrict__ rawImgRef, const float3* __restrict__ rawImgMoved, float4* __restrict__ robustnessMask, hipTextureObject_t texUV, int imgWidth, int imgHeight, int imgPitch, int maskPitch, float alpha, float beta, float thresholdM)
{
    int pxX = blockIdx.x * blockDim.x + threadIdx.x;
    int pxY = blockIdx.y * blockDim.y + threadIdx.y;

    if (pxX >= imgWidth - 1 || pxY >= imgHeight - 1 || pxX < 1 || pxY < 1)
        return;

    extern __shared__ float3 pixelsRef[];
    int sharedOffset = 3 * (threadIdx.y * blockDim.x + threadIdx.x);

    float3 meanRef = make_float3(0.0f);
    float3 meanMoved = make_float3(0.0f);
    float3 stdRef = make_float3(0.0f);
    float3 dist = make_float3(0.0f);
    float3 sigma = make_float3(0.0f);

    float2 shiftf = tex2D<float2>(texUV, ((float)pxX + 0.5f) / (float)imgWidth, ((float)pxY + 0.5f) / (float)imgHeight);
    float2 maxShift = shiftf;
    float2 minShift = shiftf;

    // Calculate max and min shifts
    #pragma unroll
    for (int y = -2; y <= 2; y++)
    {
        for (int x = -2; x <= 2; x++)
        {
            float2 s = tex2D<float2>(texUV, ((float)pxX + x + 0.5f) / (float)imgWidth, ((float)pxY + y + 0.5f) / (float)imgHeight);
            maxShift.x = fmaxf(s.x, maxShift.x);
            maxShift.y = fmaxf(s.y, maxShift.y);
            minShift.x = fminf(s.x, minShift.x);
            minShift.y = fminf(s.y, minShift.y);
        }
    }

    int2 shift;
    shift.x = roundf(shiftf.x * 0.5f);
    shift.y = roundf(shiftf.y * 0.5f);

    // Calculate means
    #pragma unroll
    for (int y = -1; y <= 1; y++)
    {
        for (int x = -1; x <= 1; x++)
        {
            float3 refPixel = *((float3*)((char*)rawImgRef + imgPitch * (pxY + y)) + pxX + x);
            pixelsRef[sharedOffset + (y + 1) * 3 + (x + 1)] = refPixel;

            meanRef += refPixel;

            int ppy = min(max(pxY + shift.y + y, 0), imgHeight - 1);
            int ppx = min(max(pxX + shift.x + x, 0), imgWidth - 1);
            float3 movedPixel = *((float3*)((char*)rawImgMoved + imgPitch * ppy) + ppx);
            meanMoved += movedPixel;
        }
    }

    meanRef *= 1.0f / 9.0f;
    meanMoved *= 1.0f / 9.0f;

    float meandist = (fabs(meanRef.x - meanMoved.x) + fabs(meanRef.y - meanMoved.y) + fabs(meanRef.z - meanMoved.z)) / 3.0f;
    maxShift *= 0.5f * meandist;
    minShift *= 0.5f * meandist;

    float M = hypotf(maxShift.x - minShift.x, maxShift.y - minShift.y);

    // Calculate standard deviation
    #pragma unroll
    for (int y = -1; y <= 1; y++)
    {
        for (int x = -1; x <= 1; x++)
        {
            int p = sharedOffset + (y + 1) * 3 + (x + 1);
            float3 diff = pixelsRef[p] - meanRef;
            stdRef += diff * diff;
        }
    }

    stdRef = sqrtf(stdRef * (1.0f / 9.0f));

    float3 sigmaMD;
    sigmaMD.x = sqrtf(alpha * meanRef.x + beta);
    sigmaMD.y = sqrtf(alpha * meanRef.y + beta) * M_SQRT1_2; // watch for two green pixels averaged
    sigmaMD.z = sqrtf(alpha * meanRef.z + beta);

    dist = fabs(meanRef - meanMoved);

    sigma.x = fmaxf(sigmaMD.x, stdRef.x);
    sigma.y = fmaxf(sigmaMD.y, stdRef.y);
    sigma.z = fmaxf(sigmaMD.z, stdRef.z);

    dist.x *= (stdRef.x * stdRef.x / (stdRef.x * stdRef.x + sigmaMD.x * sigmaMD.x));
    dist.y *= (stdRef.y * stdRef.y / (stdRef.y * stdRef.y + sigmaMD.y * sigmaMD.y));
    dist.z *= (stdRef.z * stdRef.z / (stdRef.z * stdRef.z + sigmaMD.z * sigmaMD.z));

    float4 mask;
    float s = (M > thresholdM) ? 0.0f : 1.5f;

    const float t = 0.12f;
    mask.x = fmaxf(fminf(s * expf(-dist.x * dist.x / (sigma.x * sigma.x)) - t, 1.0f), 0.0f);
    mask.y = fmaxf(fminf(s * expf(-dist.y * dist.y / (sigma.y * sigma.y)) - t, 1.0f), 0.0f);
    mask.z = fmaxf(fminf(s * expf(-dist.z * dist.z / (sigma.z * sigma.z)) - t, 1.0f), 0.0f);
    mask.w = M;

    *(((float4*)((char*)robustnessMask + maskPitch * pxY)) + pxX) = mask;
}