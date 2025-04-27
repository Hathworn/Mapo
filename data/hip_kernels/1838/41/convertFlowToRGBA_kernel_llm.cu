#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertFlowToRGBA_kernel(uchar4 *d_flowx_out, uchar4 *d_flowy_out, const float *d_flowx_in, const float *d_flowy_in, int width, int height, float lowerLim, float upperLim, float minMag) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Use direct arithmetic for indexing
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Use direct arithmetic for indexing
    uchar4 tempx, tempy;
    
    if (x < width && y < height) {
        float ux = d_flowx_in[y * width + x]; // Use direct arithmetic for indexing
        float uy = d_flowy_in[y * width + x]; // Use direct arithmetic for indexing

        float mag = ux * ux + uy * uy; // Avoid sqrtf and direct calculation if possible
        
        // Handle non-finite ux or low magnitude values
        if (!isfinite(ux) || (mag < minMag * minMag)) { // Avoid sqrtf by comparing squared magnitudes
            tempx = make_uchar4(255, 255, 255, 255); // Use make_uchar4 for compact assignment
            tempy = make_uchar4(255, 255, 255, 255); // Use make_uchar4 for compact assignment
        } else {
            // Rescale ux
            ux = (ux - lowerLim) / (upperLim - lowerLim);
            // Initialize RGB components
            float r, g, b;
            
            if (ux < 0.25f) {
                r = 0;
                g = 4.0f * ux;
                b = 1.0f;
            } else if (ux < 0.5f) {
                r = 0;
                g = 1.0f;
                b = 1.0f + 4.0f * (0.25f - ux);
            } else if (ux < 0.75f) {
                r = 4.0f * (ux - 0.5f);
                g = 1.0f;
                b = 0;
            } else {
                r = 1.0f;
                g = 1.0f + 4.0f * (0.75f - ux);
                b = 0;
            }
            
            tempx = make_uchar4(255.0f * r, 255.0f * g, 255.0f * b, 255); // Use make_uchar4 for compact assignment

            // Rescale uy
            uy = (uy - lowerLim) / (upperLim - lowerLim);
            
            if (uy < 0.25f) {
                r = 0;
                g = 4.0f * uy;
                b = 1.0f;
            } else if (uy < 0.5f) {
                r = 0;
                g = 1.0f;
                b = 1.0f + 4.0f * (0.25f - uy);
            } else if (uy < 0.75f) {
                r = 4.0f * (uy - 0.5f);
                g = 1.0f;
                b = 0;
            } else {
                r = 1.0f;
                g = 1.0f + 4.0f * (0.75f - uy);
                b = 0;
            }
            
            tempy = make_uchar4(255.0f * r, 255.0f * g, 255.0f * b, 255); // Use make_uchar4 for compact assignment
        }

        // Write outputs
        d_flowx_out[y * width + x] = tempx;
        d_flowy_out[y * width + x] = tempy;
    }
}