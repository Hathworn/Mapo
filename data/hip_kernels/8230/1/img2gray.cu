#include "hip/hip_runtime.h"
#include "includes.h"

#define RED 2
#define GREEN 1
#define BLUE 0


using namespace std;

extern "C"
__global__ void img2gray(unsigned char *imageInput, int width, int height, unsigned char *imageOutput){
int row = blockIdx.y*blockDim.y+threadIdx.y;
int col = blockIdx.x*blockDim.x+threadIdx.x;

if((row < height) && (col < width)){
imageOutput[row*width+col] = imageInput[(row*width+col)*3+RED]*0.299 + imageInput[(row*width+col)*3+GREEN]*0.587 \
+ imageInput[(row*width+col)*3+BLUE]*0.114;
}
}