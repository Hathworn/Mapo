#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void cube(long *deviceOutput, long *deviceInput)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    long f = deviceInput[idx];
    deviceOutput[idx] = f * f * f; // Compute cube
}