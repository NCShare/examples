#! /usr/bin/env python

import time
import torch

# Check if CUDA is available
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"Using device: {device}")

# Matrix size
N = 8192

# Create random matrices on the GPU
A = torch.randn((N, N), device=device)
B = torch.randn((N, N), device=device)

# Warm-up (helps get accurate timing)
_ = torch.mm(A, B)

# Measure performance
torch.cuda.synchronize()
start = time.time()

# Matrix multiplication
C = torch.mm(A, B)

torch.cuda.synchronize()
end = time.time()

print(f"Matrix size: {N}x{N}")

# CPU timing for speedup calculation
A_cpu = A.cpu()
B_cpu = B.cpu()

# CPU warm-up
_ = torch.mm(A_cpu, B_cpu)

# Measure CPU performance
start_cpu = time.time()
C_cpu = torch.mm(A_cpu, B_cpu)
end_cpu = time.time()

cpu_time = end_cpu - start_cpu
gpu_time = end - start

print(f"CPU time: {cpu_time:.4f} seconds")
print(f"GPU time: {gpu_time:.4f} seconds")
print(f"Speedup: {cpu_time / gpu_time:.2f}x")
