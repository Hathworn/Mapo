#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Calculate the total number of elements
    int total_elements = (NX + NY) * B;
    
    // Check if the thread index is within bounds
    if(i < total_elements){
        // Determine batch index and local index within the batch
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        
        // Assign output based on the local index j
        OUT[i] = (j < NX) ? X[b*NX + j] : Y[b*NY + j - NX];
    }
}