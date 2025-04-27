#include "hip/hip_runtime.h"
#include "includes.h"

// richu shaji abraham richursa
using namespace std;

__global__ void scatter(int *d_array, int *d_scanArray, int *d_predicateArrry, int *d_scatteredArray, int d_numberOfElements, int offset)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check boundary condition to avoid unnecessary computation
    if (index >= d_numberOfElements) return;
    
    // Only handle elements where predicate is true
    if (d_predicateArrry[index] == 1)
    {
        // Directly assign scattered value
        d_scatteredArray[d_scanArray[index] - 1 + offset] = d_array[index];
    }
}