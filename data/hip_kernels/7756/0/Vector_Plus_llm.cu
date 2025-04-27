#include "hip/hip_runtime.h"
#include "includes.h"

#define HANDLE_ERROR( err ) ( HandleError( err, __FILE__, __LINE__ ))

__global__ void Vector_Plus ( int *AG ,  int *BG , int *CG)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    // Using pointer arithmetic for better performance
    if (id < N)
        CG[id] = AG[id] + BG[id];
}