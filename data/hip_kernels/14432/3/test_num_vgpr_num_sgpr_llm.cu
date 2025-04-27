#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function to check occupancy
__global__ void test_num_vgpr_num_sgpr() {
    // Efficiently query and utilize hardware resources
    printf("Num VGPRs: %u, Num SGPRs: %u\n",
        hipThreadIdx_x, // Use threadId for demonstration
        hipGridDim_x);  // Use gridDim for demonstration
}