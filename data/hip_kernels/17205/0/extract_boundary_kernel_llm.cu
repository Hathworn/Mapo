#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;
#define ITERATIONS 40000

enum pixel_position {INSIDE_MASK, BOUNDRY, OUTSIDE};

__global__ void extract_boundary_kernel(float *maskIn, int *boundryPixelArray, int source_nchannel, int source_width, int source_height){
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Check if thread is within image bounds
    if (x < source_width && y < source_height) {
        for (int channel = 0; channel < source_nchannel; channel++) {
            int id = x + source_width * y + source_width * source_height * channel;

            // Directly mark corners and edges as OUTSIDE
            if ((x == 0 || x == source_width - 1 || y == 0 || y == source_height - 1) && maskIn[id]) {
                boundryPixelArray[id] = OUTSIDE;
            } else {
                // Calculate neighboring indices once
                int id_right = x + 1 + y * source_width + channel * source_width * source_height;
                int id_left = x - 1 + y * source_width + channel * source_width * source_height;
                int id_up = x + (y + 1) * source_width + channel * source_width * source_height;
                int id_down = x + (y - 1) * source_width + channel * source_width * source_height;

                // Flags whether the current pixel is inside the mask boundary
                bool is_in_mask = maskIn[id] >= 0.5;
                bool neighbors_in_mask = maskIn[id_right] >= 0.5 && maskIn[id_left] >= 0.5 
                                         && maskIn[id_up] >= 0.5 && maskIn[id_down] >= 0.5;

                // Set boundary pixel array based on mask condition
                if (is_in_mask && neighbors_in_mask) {
                    boundryPixelArray[id] = INSIDE_MASK;
                } else if (is_in_mask) {
                    boundryPixelArray[id] = BOUNDRY;
                } else {
                    boundryPixelArray[id] = OUTSIDE;
                }
            }
        }
    }
}