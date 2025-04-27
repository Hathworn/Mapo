#include "hip/hip_runtime.h"
#include "includes.h"
#define IDX (blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x)

__device__ void OFConvertXY2AngleSize(float* of, int id, int imageSize, float& of_size, float& of_angle) {
    float2 OF_value;
    
    OF_value.x = of[id];
    OF_value.y = of[id + imageSize];
    
    // Use hypotf for efficient magnitude calculation
    of_size  = hypotf(OF_value.x, OF_value.y);
    // Efficient trigonometric calculation using intrinsics
    of_angle = atan2f(OF_value.x, OF_value.y);
}

__global__ void OFConvert2AngleSize(float* of, int imageSize) {
    int id = IDX;

    if (id < imageSize) {
        float OF_size;
        float OF_angle;
        
        OFConvertXY2AngleSize(of, id, imageSize, OF_size, OF_angle);
        
        of[id] = OF_angle;             // Store calculated angle
        of[id + imageSize] = OF_size;  // Store calculated size
    }
}