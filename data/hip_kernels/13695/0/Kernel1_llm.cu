#include "hip/hip_runtime.h"
#include "includes.h"

#define bufSize 700000

struct timeval startwtime,endwtime;

float *h_a;			// Table at host
float *d_a;			// Table at device
int tsize=0;		// number of rows or columns
size_t size = 0 ;	// size of table( tsize* tsize * sizeof(float*))
float* test;

void print(float *);
void make_table();
void serial();
void check();
void copytables();

__global__ void Kernel1(float *A, int N, int k) {
    // Compute 1D global index for matrix element access
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Boundary check to ensure indices are within matrix bounds
    if (i < N && j < N) {
        // Perform computation only if beneficial to minimize memory writes
        float temp = A[i * N + k] + A[k * N + j];
        if (A[i * N + j] > temp) {
            A[i * N + j] = temp;
        }
    }
}