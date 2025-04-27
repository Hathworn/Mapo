#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeHE( float *HE, float *force1, float4 *force2, float *masses, float eps, int k, int m, int N ) {
    int elementNum = blockIdx.x * blockDim.x + threadIdx.x;
    if(elementNum >= N) return; // Early return if out of bounds
    
    int atom = elementNum / 3;
    int axis = elementNum % 3;
    
    // Use an array to simplify indexing and eliminate branching
    float force_difference[3] = {force2[atom].x, force2[atom].y, force2[atom].z}; 
    HE[elementNum * m + k] = (force1[elementNum] - force_difference[axis]) / (sqrt(masses[atom]) * eps);
}