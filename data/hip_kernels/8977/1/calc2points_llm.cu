#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc2points(float* point_coordinate_1, float* point_coordinate_2 , float* coordinates_arr)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Use global thread index for scalability

    if (tid < blockDim.x) // Boundary check to prevent out-of-bound access
    {
        float diff = point_coordinate_1[tid] - point_coordinate_2[tid]; // Store result of subtraction
        coordinates_arr[tid] = diff * diff; // Avoid pow for better performance
    }
}