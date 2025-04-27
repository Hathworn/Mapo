#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

// Kernel function optimized for better readability and performance

extern "C"
__global__ void CudaKernelTextureCubeStrobelight(char *surface, int width, int height, size_t pitch, int face, float t)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Early return for threads not corresponding to valid pixels
    if (x >= width || y >= height) return;

    // Optimize variable access and computation
    unsigned char* pixel = (unsigned char*)(surface + y * pitch) + 4 * x;

    // Precompute common expressions
    float theta_x = (2.0f * x) / width - 1.0f;
    float theta_y = (2.0f * y) / height - 1.0f;
    float theta = 2.0f * PI * sqrtf(theta_x * theta_x + theta_y * theta_y);
    
    // Use improved cosine computation
    unsigned char value = static_cast<unsigned char>(255.0f * (0.6f + 0.4f * cosf(theta + t)));
    
    // Set alpha channel once for clarity and performance
    pixel[3] = 255; 

    // Use ternary operator for concise conditional assignment
    pixel[0] = (face % 2) ? pixel[face / 2] : value;  
    pixel[1] = (face % 2) ? pixel[face / 2] : value;  
    pixel[2] = (face % 2) ? 0.5f : value;  
}