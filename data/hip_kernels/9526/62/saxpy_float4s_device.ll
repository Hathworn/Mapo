; ModuleID = '../data/hip_kernels/9526/62/main.cu'
source_filename = "../data/hip_kernels/9526/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13saxpy_float4sPfS_fPl(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i64 addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 7
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = bitcast float addrspace(1)* %1 to %struct.HIP_vector_type addrspace(1)*
  %10 = bitcast float addrspace(1)* %0 to %struct.HIP_vector_type addrspace(1)*
  br label %12

11:                                               ; preds = %12
  ret void

12:                                               ; preds = %12, %4
  %13 = phi i32 [ 0, %4 ], [ %125, %12 ]
  %14 = mul nuw nsw i32 %13, 1792
  %15 = add i32 %8, %14
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %16, i32 0, i32 0, i32 0, i64 0
  %18 = load float, float addrspace(1)* %17, align 16
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %16, i32 0, i32 0, i32 0, i64 1
  %20 = load float, float addrspace(1)* %19, align 4
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %16, i32 0, i32 0, i32 0, i64 2
  %22 = load float, float addrspace(1)* %21, align 8
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %16, i32 0, i32 0, i32 0, i64 3
  %24 = load float, float addrspace(1)* %23, align 4
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %16, i32 0, i32 0, i32 0, i64 0
  %26 = load float, float addrspace(1)* %25, align 16
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %16, i32 0, i32 0, i32 0, i64 1
  %28 = load float, float addrspace(1)* %27, align 4
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %16, i32 0, i32 0, i32 0, i64 2
  %30 = load float, float addrspace(1)* %29, align 8
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %16, i32 0, i32 0, i32 0, i64 3
  %32 = load float, float addrspace(1)* %31, align 4
  %33 = fmul contract float %18, %2
  %34 = fadd contract float %33, %26
  %35 = fmul contract float %20, %2
  %36 = fadd contract float %35, %28
  %37 = fmul contract float %22, %2
  %38 = fadd contract float %37, %30
  %39 = fmul contract float %24, %2
  %40 = fadd contract float %39, %32
  store float %34, float addrspace(1)* %25, align 16
  store float %36, float addrspace(1)* %27, align 4
  store float %38, float addrspace(1)* %29, align 8
  store float %40, float addrspace(1)* %31, align 4
  %41 = mul nuw i32 %13, 1792
  %42 = add nuw i32 %41, 1792
  %43 = add i32 %8, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %44, i32 0, i32 0, i32 0, i64 0
  %46 = load float, float addrspace(1)* %45, align 16
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %44, i32 0, i32 0, i32 0, i64 1
  %48 = load float, float addrspace(1)* %47, align 4
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %44, i32 0, i32 0, i32 0, i64 2
  %50 = load float, float addrspace(1)* %49, align 8
  %51 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %44, i32 0, i32 0, i32 0, i64 3
  %52 = load float, float addrspace(1)* %51, align 4
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %44, i32 0, i32 0, i32 0, i64 0
  %54 = load float, float addrspace(1)* %53, align 16
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %44, i32 0, i32 0, i32 0, i64 1
  %56 = load float, float addrspace(1)* %55, align 4
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %44, i32 0, i32 0, i32 0, i64 2
  %58 = load float, float addrspace(1)* %57, align 8
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %44, i32 0, i32 0, i32 0, i64 3
  %60 = load float, float addrspace(1)* %59, align 4
  %61 = fmul contract float %46, %2
  %62 = fadd contract float %61, %54
  %63 = fmul contract float %48, %2
  %64 = fadd contract float %63, %56
  %65 = fmul contract float %50, %2
  %66 = fadd contract float %65, %58
  %67 = fmul contract float %52, %2
  %68 = fadd contract float %67, %60
  store float %62, float addrspace(1)* %53, align 16
  store float %64, float addrspace(1)* %55, align 4
  store float %66, float addrspace(1)* %57, align 8
  store float %68, float addrspace(1)* %59, align 4
  %69 = mul nuw i32 %13, 1792
  %70 = add nuw i32 %69, 3584
  %71 = add i32 %8, %70
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %72, i32 0, i32 0, i32 0, i64 0
  %74 = load float, float addrspace(1)* %73, align 16
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %72, i32 0, i32 0, i32 0, i64 1
  %76 = load float, float addrspace(1)* %75, align 4
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %72, i32 0, i32 0, i32 0, i64 2
  %78 = load float, float addrspace(1)* %77, align 8
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %72, i32 0, i32 0, i32 0, i64 3
  %80 = load float, float addrspace(1)* %79, align 4
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %72, i32 0, i32 0, i32 0, i64 0
  %82 = load float, float addrspace(1)* %81, align 16
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %72, i32 0, i32 0, i32 0, i64 1
  %84 = load float, float addrspace(1)* %83, align 4
  %85 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %72, i32 0, i32 0, i32 0, i64 2
  %86 = load float, float addrspace(1)* %85, align 8
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %72, i32 0, i32 0, i32 0, i64 3
  %88 = load float, float addrspace(1)* %87, align 4
  %89 = fmul contract float %74, %2
  %90 = fadd contract float %89, %82
  %91 = fmul contract float %76, %2
  %92 = fadd contract float %91, %84
  %93 = fmul contract float %78, %2
  %94 = fadd contract float %93, %86
  %95 = fmul contract float %80, %2
  %96 = fadd contract float %95, %88
  store float %90, float addrspace(1)* %81, align 16
  store float %92, float addrspace(1)* %83, align 4
  store float %94, float addrspace(1)* %85, align 8
  store float %96, float addrspace(1)* %87, align 4
  %97 = mul nuw i32 %13, 1792
  %98 = add nuw i32 %97, 5376
  %99 = add i32 %8, %98
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %100, i32 0, i32 0, i32 0, i64 0
  %102 = load float, float addrspace(1)* %101, align 16
  %103 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %100, i32 0, i32 0, i32 0, i64 1
  %104 = load float, float addrspace(1)* %103, align 4
  %105 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %100, i32 0, i32 0, i32 0, i64 2
  %106 = load float, float addrspace(1)* %105, align 8
  %107 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %100, i32 0, i32 0, i32 0, i64 3
  %108 = load float, float addrspace(1)* %107, align 4
  %109 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %100, i32 0, i32 0, i32 0, i64 0
  %110 = load float, float addrspace(1)* %109, align 16
  %111 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %100, i32 0, i32 0, i32 0, i64 1
  %112 = load float, float addrspace(1)* %111, align 4
  %113 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %100, i32 0, i32 0, i32 0, i64 2
  %114 = load float, float addrspace(1)* %113, align 8
  %115 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %100, i32 0, i32 0, i32 0, i64 3
  %116 = load float, float addrspace(1)* %115, align 4
  %117 = fmul contract float %102, %2
  %118 = fadd contract float %117, %110
  %119 = fmul contract float %104, %2
  %120 = fadd contract float %119, %112
  %121 = fmul contract float %106, %2
  %122 = fadd contract float %121, %114
  %123 = fmul contract float %108, %2
  %124 = fadd contract float %123, %116
  store float %118, float addrspace(1)* %109, align 16
  store float %120, float addrspace(1)* %111, align 4
  store float %122, float addrspace(1)* %113, align 8
  store float %124, float addrspace(1)* %115, align 4
  %125 = add nuw nsw i32 %13, 4
  %126 = icmp eq i32 %125, 512
  br i1 %126, label %11, label %12, !llvm.loop !5
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
