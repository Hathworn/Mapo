#include "hip/hip_runtime.h"
#include "includes.h"




__global__ void histogram_equalization( int * lut, unsigned char * img_out, unsigned char * img_in, int * hist_in, int img_size, int nbr_bin){

int tx=threadIdx.x;
int ty=threadIdx.y;
int bx=blockIdx.x;
int by=blockIdx.y;


unsigned int col= tx + blockDim.x * bx;

unsigned int row= ty + blockDim.y * by;

int grid_width = gridDim.x * blockDim.x;
int id = row * grid_width + col;

// Get the result image
if(id<img_size){

if(lut[img_in[id]] > 255){
img_out[id] = 255;
}
else{
img_out[id] = (unsigned char)lut[img_in[id]];
}
}

}