#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initTempNodeArray(const int hitNum, const int allowableGap, int* tempNodeArray_score, int* tempNodeArray_vertical, int* tempNodeArray_horizontal, int* tempNodeArray_matchNum) {
    // Calculate unique global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    const int halfTempNodeWidth = allowableGap + MARGIN;
    const int tempNodeWidth = 1 + 2 * halfTempNodeWidth;
    
    // Loop unrolling for efficiency, combined if condition
    if (idx < hitNum * tempNodeWidth) {
        const int bandIdx = idx / hitNum;
        
        int score, vertical, horizontal, matchNum;
        
        if (bandIdx < halfTempNodeWidth) {
            score = vertical = horizontal = matchNum = -30000;
        } else if (bandIdx == halfTempNodeWidth) {
            score = matchNum = 0;
            vertical = horizontal = GAP_OPEN_POINT;
        } else {
            const int i = bandIdx - halfTempNodeWidth;
            const int tempScore = i * GAP_POINT + GAP_OPEN_POINT;
            score = tempScore;
            vertical = tempScore + GAP_OPEN_POINT;
            horizontal = tempScore;
            matchNum = 0;
        }
        
        tempNodeArray_score[idx] = score;
        tempNodeArray_vertical[idx] = vertical;
        tempNodeArray_horizontal[idx] = horizontal;
        tempNodeArray_matchNum[idx] = matchNum;
    }
}