#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void OFConvertXY2AngleSize (float* of, int id, int imageSize, float& of_size, float& of_angle) {
    float2 OF_value;
    OF_value.x = of[id];
    OF_value.y = of[id + imageSize];
   
    float sum_squares = (OF_value.x + OF_value.y) * (OF_value.x + OF_value.y);  // Reduce duplicate computation
    of_size = sqrtf(sum_squares);  // Use sqrtf for performance
    of_angle = atan2f(OF_value.x, OF_value.y);  // Use atan2f for performance
}

__global__ void OFConvert2AngleSize (float* of, int imageSize) {
    int id = blockIdx.x * blockDim.x + threadIdx.x  // Simplified indexing calculation
             + blockIdx.y * blockDim.x * gridDim.x;

    if (id < imageSize) {
        float OF_size;
        float OF_angle;
        
        OFConvertXY2AngleSize(of, id, imageSize, OF_size, OF_angle);

        of[id] = OF_angle;
        of[id + imageSize] = OF_size;
    }
}