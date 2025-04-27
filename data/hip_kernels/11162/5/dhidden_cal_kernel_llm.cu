#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void dhidden_cal_kernel(double * a1, double * dhidden, int size)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check for out-of-bounds access
    if (index < size)
    {
        // Perform the ReLU gradient operation
        dhidden[index] = a1[index] <= 0 ? 0 : dhidden[index];
    }
}