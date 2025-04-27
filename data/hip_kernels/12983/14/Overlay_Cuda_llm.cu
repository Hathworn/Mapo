#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Overlay_Cuda(int x_position, int y_position, unsigned char* main, int main_linesize, unsigned char* overlay, int overlay_linesize, int overlay_w, int overlay_h, unsigned char* overlay_alpha, int alpha_linesize, int alpha_adj_x, int alpha_adj_y) 
{
    // Calculate the global x and y coordinates of the thread
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Early return if thread is outside the overlay region
    if (x < x_position || x >= x_position + overlay_w || y < y_position || y >= y_position + overlay_h) {
        return;
    }

    // Calculate overlay coordinates
    int overlay_x = x - x_position;
    int overlay_y = y - y_position;

    // Calculate alpha value if alpha_linesize is non-zero
    float alpha = 1.0f;
    if (alpha_linesize) {
        alpha = overlay_alpha[alpha_adj_x * overlay_x + alpha_adj_y * overlay_y * alpha_linesize] / 255.0f;
    }

    // Compute the new pixel value for the main image
    int main_idx = x + y * main_linesize;
    main[main_idx] = alpha * overlay[overlay_x + overlay_y * overlay_linesize] + (1.0f - alpha) * main[main_idx];
}