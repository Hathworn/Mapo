#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(hipSurfaceObject_t input, hipSurfaceObject_t output, int width, int height) {

//Get the pixel index
unsigned int xPx = threadIdx.x + blockIdx.x * blockDim.x;
unsigned int yPx = threadIdx.y + blockIdx.y * blockDim.y;


//Don't do any computation if this thread is outside of the surface bounds.
if (xPx >= width || yPx >= height) return;

//Copy the contents of input to output.
uchar4 pixel = {255,128,0,255};
//Read a pixel from the input. Disable to default to the flat orange color above
surf2Dread<uchar4>(&pixel, input, xPx * sizeof(uchar4), yPx, hipBoundaryModeClamp);
surf2Dwrite(pixel, output, xPx * sizeof(uchar4), yPx);
}