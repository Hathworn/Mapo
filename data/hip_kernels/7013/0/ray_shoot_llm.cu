#include "hip/hip_runtime.h"
#include "includes.h"

#define FIRST_RUN 0
const float WL  = 10.0;
const float XL1 = -WL;
const float XL2 =  WL;
const float YL1 = -WL;
const float YL2 =  WL;

const float rsrc = 0.1;
const float ldc  = 0.5;
const float xsrc = 0.0;
const float ysrc = 0.0;

__global__ void ray_shoot(int *maxX, int *maxY, float *lens_scale, float *xlens, float *ylens, float*eps, int *num_lenses, float *dev_arr)
{
    // Calculate the unique index for each thread
    int threadBlockPos = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Determine the y and x position
    int y = threadBlockPos / (*maxY);
    int x = threadBlockPos - ((*maxX) * y);

    const float rsrc2 = rsrc * rsrc;

    // Calculate the lens plane coordinates
    float xl = XL1 + x * (*lens_scale);
    float yl = YL1 + y * (*lens_scale);

    float xs = xl;
    float ys = yl;

    float dx, dy, dr;
    
    // Loop over lenses to calculate image positions
    for(int p = 0; p < (*num_lenses); ++p){
        dx = xl - xlens[p];
        dy = yl - ylens[p];
        dr = dx * dx + dy * dy;
        
        // Avoid potential division by zero
        if (dr != 0.0f) {
            xs -= eps[p] * dx / dr;
            ys -= eps[p] * dy / dr;
        }
    }

    // Calculate separation squared from the source
    float xd = xs - xsrc;
    float yd = ys - ysrc;
    float sep2 = (xd * xd) + (yd * yd);

    // Check if within the source radius
    if(sep2 < rsrc2){
        float mu = sqrtf(1.0f-sep2/rsrc2);
        dev_arr[threadBlockPos] = 1.0 - ldc * (1-mu);
    }
}