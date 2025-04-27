#include "hip/hip_runtime.h"
#include "includes.h"

//macro to check return value of the cuda runtime call and exits
//if call failed
__global__ void anyMethod(unsigned char* buff , unsigned char* buffer_out , int w , int h)
{
    // Calculate the column index of the Px being processed
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the row index of the Px being processed
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int width = w, height = h;

    if (x < width && y < height && x > 0 && x < width - 1 && y > 0 && y < height - 1) 
    {
        int hx = -buff[width*(y-1) + (x-1)] + buff[width*(y-1)+(x+1)]
                 -2*buff[width*(y)+(x-1)] + 2*buff[width*(y)+(x+1)]
                 -buff[width*(y+1)+(x-1)] + buff[width*(y+1)+(x+1)];

        int vx = buff[width*(y-1)+(x-1)] + 2*buff[width*(y-1)+(x+1)] + buff[width*(y-1)+(x+1)]
                 - buff[width*(y+1)+(x-1)] - 2*buff[width*(y+1)+(x)] - buff[width*(y+1)+(x+1)];
        // Adjust intensity for effect
        hx = hx * 4;
        vx = vx / 5;

        int val = (int)sqrtf((float)(hx) * (float)(hx) + (float)(vx) * (float)(vx));

        buffer_out[y * width + x] = (unsigned char) val;
    }
}