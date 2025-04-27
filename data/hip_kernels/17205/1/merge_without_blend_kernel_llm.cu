#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;
#define ITERATIONS 40000

enum pixel_position {INSIDE_MASK, BOUNDRY, OUTSIDE};

__global__ void merge_without_blend_kernel(float *srcimg, float *targetimg, float *outimg, int *boundary_array, int source_nchannel, int source_width, int source_height) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < source_width && y < source_height) { // Ensure within image bounds
        int base_id = x + y * source_width;
        for (int channel = 0; channel < source_nchannel; channel++) {
            int id = base_id + channel * source_width * source_height;
            // Use ternary operator for compact conditional assignment
            outimg[id] = (boundary_array[id] == INSIDE_MASK) ? targetimg[id] : srcimg[id];
        }
    }
}