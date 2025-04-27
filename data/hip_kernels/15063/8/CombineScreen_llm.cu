#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CombineScreen(float* d_postEdge1, float* d_postEdge2, float* d_postGradient1, float* d_postGradient2, float* d_postGradient3, float* d_postSobel3LR, float* d_postSobel3UD, float* d_postSmooth31, float* d_output){
    int id = threadIdx.x + blockDim.x * blockIdx.x;
    int offset = id * 73;

    // Use register storage to reduce redundant calculations
    float* edge1 = d_postEdge1 + offset;
    float* edge2 = d_postEdge2 + offset;
    float* gradient1 = d_postGradient1 + offset;
    float* gradient2 = d_postGradient2 + offset;
    float* gradient3 = d_postGradient3 + offset;
    float* sobel3LR = d_postSobel3LR + offset;
    float* sobel3UD = d_postSobel3UD + offset;
    float* smooth31 = d_postSmooth31 + offset;

    for (int i = 0; i < 73; ++i){
        int outIdx = i + offset;
        d_output[outIdx + 0 * 73 * 73] = edge1[i];
        d_output[outIdx + 1 * 73 * 73] = edge2[i];
        d_output[outIdx + 2 * 73 * 73] = gradient1[i];
        d_output[outIdx + 3 * 73 * 73] = gradient2[i];
        d_output[outIdx + 4 * 73 * 73] = gradient3[i];
        d_output[outIdx + 5 * 73 * 73] = sobel3LR[i];
        d_output[outIdx + 6 * 73 * 73] = sobel3UD[i];
        d_output[outIdx + 7 * 73 * 73] = smooth31[i];
    }
}