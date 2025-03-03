#include "hip/hip_runtime.h"
#include "includes.h"



//no performance difference if using float Mono input instead of float4 RGBA
//texture<float, hipTextureType2D, hipReadModeElementType> inTex;
//g_odata[offset] = tex2D(inTex, xc, yc);

texture<float4, hipTextureType2D, hipReadModeElementType> inTex;
surface<void, cudaSurfaceType2D> outputSurface;

__global__ void dataToArray(uint* indices, int imgw, int imgh)
{

int x = threadIdx.x + blockIdx.x * blockDim.x;
int y = threadIdx.y + blockIdx.y * blockDim.y;

int offset = x + y * imgw;

if (x < imgw && y < imgh) {

float res = indices[offset];
//surf2Dwrite(make_float4(res, 0, 0, 1), outputSurface, (int)sizeof(float4)*x, y);
surf2Dwrite(res, outputSurface, (int)sizeof(float)*x, y);
}

}