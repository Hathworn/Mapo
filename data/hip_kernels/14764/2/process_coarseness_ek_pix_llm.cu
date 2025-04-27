#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void process_coarseness_ek_pix(double *output_ak, double *output_ekh, double *output_ekv, int colsize, int rowsize, long lenOf_ek)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x; // Correct indices for 2D grid
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    
    if (x < rowsize && y < colsize) // Ensure within bounds
    {
        int posx1 = x + lenOf_ek; // Pre-calculate index positions for x
        int posx2 = x - lenOf_ek;
        int posy1 = y + lenOf_ek; // Pre-calculate index positions for y
        int posy2 = y - lenOf_ek;

        if (posx1 < rowsize && posx2 >= 0)
        {
            double input1 = output_ak[y * rowsize + posx1];
            double input2 = output_ak[y * rowsize + posx2];
            output_ekh[y * rowsize + x] = fabs(input1 - input2);
        }
        else 
        {
            output_ekh[y * rowsize + x] = 0;
        }

        if (posy1 < colsize && posy2 >= 0)
        {
            double input1 = output_ak[posy1 * rowsize + x];
            double input2 = output_ak[posy2 * rowsize + x];
            output_ekv[y * rowsize + x] = fabs(input1 - input2);
        }
        else 
        {
            output_ekv[y * rowsize + x] = 0;
        }
    }
}