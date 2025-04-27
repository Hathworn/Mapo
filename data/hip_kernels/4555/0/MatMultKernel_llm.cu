#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16  // Use a larger block size for better performance

// Global variable setup
const int radius = 3;
const int numSamples = 100;
const double learningRate = 0.15;
const int epochs = 1;
const int numNeurons = 20;
// Set up neurons
double inputLayer[2][numNeurons] = {0}; // Takes input and weights
double outputLayer[1][numNeurons] = {0}; // Takes weights and outputs
double *matrixA; // Temporarily initialized arrays for GPU memory allocation
double *matrixB;
double *matrixC;
double *matrixD;
double *matrixE;

// Calculates dot product of two arrays from a given pointer and returns a total - must be same size
__global__ void MatMultKernel(double *array1, double *array2, double *output, int arr1_rows, int arr1_cols, int arr2_cols) {
    double result = 0;
    __shared__ double subArray1[BLOCK_SIZE][BLOCK_SIZE]; // Use shared memory for tiles
    __shared__ double subArray2[BLOCK_SIZE][BLOCK_SIZE]; 

    int bIDx = blockIdx.x, bIDy = blockIdx.y;
    int tIDx = threadIdx.x, tIDy = threadIdx.y;
    
    int row = bIDy * BLOCK_SIZE + tIDy; // Global row index
    int col = bIDx * BLOCK_SIZE + tIDx; // Global column index
    
    for (int i = 0; i < (arr1_cols + BLOCK_SIZE - 1) / BLOCK_SIZE; ++i) { // Loop over tiles
        if (row < arr1_rows && i * BLOCK_SIZE + tIDx < arr1_cols) {
            subArray1[tIDy][tIDx] = array1[row * arr1_cols + i * BLOCK_SIZE + tIDx]; // Load tile into shared memory
        } else {
            subArray1[tIDy][tIDx] = 0; // Zero padding
        }
        
        if (col < arr2_cols && i * BLOCK_SIZE + tIDy < arr1_cols) {
            subArray2[tIDy][tIDx] = array2[(i * BLOCK_SIZE + tIDy) * arr2_cols + col]; // Load tile into shared memory
        } else {
            subArray2[tIDy][tIDx] = 0; // Zero padding
        }
        
        __syncthreads(); // Synchronize threads
        
        for (int j = 0; j < BLOCK_SIZE; ++j) {
            result += subArray1[tIDy][j] * subArray2[j][tIDx]; // Perform multiplication
        }
        
        __syncthreads(); // Ensure all threads are done
    }
    
    if (row < arr1_rows && col < arr2_cols) {
        output[row * arr2_cols + col] = result; // Output the result
    }
}