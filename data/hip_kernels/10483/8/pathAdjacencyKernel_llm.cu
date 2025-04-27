#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void pathAdjacencyKernel(int noTransitions, int noSegments, float* XY1, float* XY2, float* X4_X3, float* Y4_Y3, float* X2_X1, float* Y2_Y1, int* adjacency) {

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= noTransitions * noSegments) return;  // Early exit for out-of-bounds indices

    // Calculate segment indices
    int seg1 = idx / noSegments;
    int seg2 = idx % noSegments;

    // Calculate differences
    float Y1_Y3 = XY1[seg1 + noTransitions] - XY2[seg2 + noSegments];
    float X1_X3 = XY1[seg1] - XY2[seg2];

    // Calculate numerator and denominator
    float numa = X4_X3[seg2] * Y1_Y3 - Y4_Y3[seg2] * X1_X3;
    float numb = X2_X1[seg1] * Y1_Y3 - Y2_Y1[seg1] * X1_X3;
    float deno = Y4_Y3[seg2] * X2_X1[seg1] - X4_X3[seg2] * Y2_Y1[seg1];

    // Calculate u_a and u_b
    float u_a = numa / deno;
    float u_b = numb / deno;

    // Determine adjacency; store the result
    adjacency[idx] = (int)((u_a >= 0.0f) && (u_a <= 1.0f) && (u_b >= 0.0f) && (u_b <= 1.0f));
}