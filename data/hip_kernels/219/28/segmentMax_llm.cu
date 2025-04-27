#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float getAbsMax(float* d_vec, const int length)
{
    float segmentMax = 0;
    for (int jj = 0; jj < length; jj++) {
        float val = abs(d_vec[jj]);
        if (segmentMax < val) segmentMax = val;  // Simplified comparison
    }
    return segmentMax;
}

__global__ void segmentMax(float* d_vec, float* segmentMaxes, const int length, const int HighLength, const int HighSegmentLength, const int threadsHigh, const int LowSegmentLength)
{
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int startIndex, SegmentLength;

    // Simplified conditional logic
    if (xIndex >= threadsHigh || (xIndex * HighSegmentLength > HighLength && (HighLength + (xIndex - threadsHigh + 1) * LowSegmentLength) < length)) {
        startIndex = HighLength + (xIndex - threadsHigh) * LowSegmentLength;
        SegmentLength = LowSegmentLength;
    } else {
        startIndex = xIndex * HighSegmentLength;
        SegmentLength = HighSegmentLength;
    }

    // Each thread calculates its segment max
    segmentMaxes[xIndex] = getAbsMax(d_vec + startIndex, SegmentLength);
}